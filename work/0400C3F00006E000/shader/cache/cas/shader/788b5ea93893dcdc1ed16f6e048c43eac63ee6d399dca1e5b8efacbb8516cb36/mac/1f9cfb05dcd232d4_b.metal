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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    texture2d<float> vp_t_tcb_20 [[id(18)]];
    sampler vp_t_tcb_20Smplr [[id(19)]];
    sampler vp_t_tcb_24Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    sampler vp_t_tcb_20Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_83 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_97 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2528 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2813 = as_type<float>(_140);
        out.gl_Position.z = _2813;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2882 = as_type<float>(_178);
        out.gl_Position.z = _2882;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_65.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _158 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = in.m_58.x;
    float _214 = in.m_58.y;
    float _216 = in.m_58.z;
    float _218 = _214 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _220 = _214 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].x, _220);
    float _226 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].z, _222);
    float _228 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _234 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _236 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _238 = floor(_234);
    float _240 = floor(_236);
    float _242 = -_238;
    float _244 = _234 + _242;
    float _246 = -_240;
    float _248 = _236 + _246;
    float2 _3009 = float2(_244, _248);
    float _250 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3009, float2(0.0), isnan(_3009)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3009, float2(0.0), isnan(_3009)), level(0.0)).x;
    float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _254 = log2(_252);
    float _256 = in.m_65.z;
    float _258 = in.m_65.y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = in.m_65.x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = 1.0 / _262;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _286 = _284 != 0;
    float _288 = _254 * _158;
    float _290 = 1.0 / _266;
    float _292 = _214 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _210 + _294;
    float _298 = 1.0 / _272;
    float _300 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _304 = 1.0 + _302;
    float _306 = _258 + _256;
    float _308 = _296 * _274;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _210 + _310;
    float _314 = _256 * 2.0;
    float _316 = exp2(_288);
    float _318 = _268 * 2.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _210 + _320;
    float _324 = _306 + (-1.0);
    float _326 = _312 * _290;
    bool _328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _330 = isnan(1.0);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _336 = _332 || _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _338;
    float _342 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _344 = 1.0 / _304;
    float _346 = _322 * _298;
    float _348 = _258 * 2.0;
    float _350 = _268 + _258;
    bool _352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _360 = _356 || _358;
    float _362 = _268 + _256;
    float _364 = _350 + (-1.0);
    float _366 = floor(_318);
    float _368 = -_316;
    float _370 = _368 + 1.0;
    float _372 = _362 + (-1.0);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _376 = fma(_340, _346, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = _360 ? _370 : 0.0;
    float _380 = floor(_314);
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _384 = as_type<int>(_256);
    if (_336)
    {
        float _386 = _378 * _344;
        _162 = _386;
    }
    float _388 = _162;
    float _390 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = floor(_348);
    bool _402 = _366 > 0.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _408 = _366 >= 0.0;
    bool _410 = isnan(_366);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = fma(_398, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = fma(_406, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _426 = _416 ? 0 : 1;
    float _428 = fma(_420, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _430 = _380 >= 0.0;
    bool _432 = isnan(_380);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    float _440 = fma(_394, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _442 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _444 = isnan(_210);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = _390 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _456 = _380 > 0.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    int _462 = _438 ? 0 : 1;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    bool _468 = _400 > 0.0;
    float _470 = fma(_460, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _472 = _400 >= 0.0;
    bool _474 = isnan(_400);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _486 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _488 = isnan(_210);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _500 = isnan(_210);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = fma(_484, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _512 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_210);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = _496 * _466;
    float _526 = -_496;
    float _528 = _526 + 1.0;
    float _530 = _522 * _528;
    float _532 = -_522;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _536;
    bool _540 = !_278;
    int _542 = _540 ? 0 : 1;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _544;
    float _548 = _508 * _534;
    float _550 = -_508;
    float _552 = _550 + 1.0;
    float _554 = fma(_538, _346, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _556 = fma(_546, _346, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _558 = _422 * _548;
    float _560 = _470 * _548;
    float _562 = _428 * _548;
    int _564 = _480 ? 0 : 1;
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _570 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _562);
    int _572 = ~_462;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = in.m_67.x;
    float _580 = in.m_67.y;
    float _582 = in.m_67.z;
    int _584 = abs(_542);
    float _586 = fma(_424, _530, _566);
    int _588 = _576;
    if (!_456)
    {
        int _590 = ~_462;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_510, _530, _568);
    int _598 = ~_426;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = fma(_440, _530, _570);
    int _606 = _602;
    if (!_402)
    {
        int _608 = ~_426;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = fma(_554, _524, _586);
    float _616 = float(_584);
    float _618 = fma(_556, _524, _596);
    float _620 = float(_594);
    float _622 = fma(_376, _524, _604);
    bool _624 = !_282;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].x, _614);
    int _630 = ~_564;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = _616 * _620;
    int _638 = _634;
    if (!_468)
    {
        int _640 = ~_564;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = _268 + (-0.5);
    int _648 = abs(_626);
    float _650 = _454 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _652 = !_286;
    int _654 = _652 ? 0 : 1;
    float _656 = _636 * (-2.0);
    float _658 = float(_612);
    float _660 = fma(_230, (*spvDescriptorSet0.vp_c8)._m0[11].x, _650);
    int _662 = abs(_654);
    float _664 = fma(_656, _578, _578);
    float _666 = float(_648);
    float _668 = fma(_232, (*spvDescriptorSet0.vp_c8)._m0[11].z, _660);
    float _670 = fma(_374, _656, _374);
    float _672 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].x, _664);
    float _674 = float(_644);
    float _676 = _666 * _658;
    float _678 = _668 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _680 = fma(_670, _388, _672);
    float _682 = _676 * (-2.0);
    float _684 = 1.0 / _678;
    float _686 = float(_662);
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = _258 + (-0.5);
    float _692 = fma(_682, _580, _580);
    float _694 = fma(_342, _682, _342);
    float _696 = _686 * _674;
    float _698 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].z, _622);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _702 = _688 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _696 * (-2.0);
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_694, _388, _700);
    float _716 = fma(_706, _582, _582);
    float _718 = _454 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _720 = _714 * 0.15915493667125701904296875;
    float _722 = _256 + (-0.5);
    float _724 = in.m_71.x;
    float _726 = in.m_71.y;
    float _728 = in.m_71.z;
    float _730 = fma(_230, (*spvDescriptorSet0.vp_c8)._m0[10].x, _718);
    float _732 = fma(_382, _706, _382);
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].z, _716);
    float _736 = _688 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = fma(_232, (*spvDescriptorSet0.vp_c8)._m0[10].z, _730);
    float _742 = fma(_732, _388, _734);
    float _744 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].y, _618);
    float _746 = _740 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _748 = _742 * 0.15915493667125701904296875;
    float _750 = _720 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _746 + _678;
    float _756 = _698 * _712;
    float _758 = _628 * _708;
    float _760 = _744 * _710;
    float _762 = _720 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = _754 * _684;
    float _768 = _766 * 0.5;
    float _770 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _776 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _780 = _748 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[30].w, _786);
    float _790 = _772 * _770;
    float _792 = _774 * _776;
    float _794 = _738 * _752;
    float _796 = _778 * _784;
    float _798 = _704 * _752;
    float _800 = _748 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _704 * _764;
    float _806 = _738 * _764;
    float _808 = _738 * _782;
    float _810 = _764 * _782;
    float _812 = _704 * _782;
    float _814 = 1.0 / _788;
    float _816 = _752 * _782;
    float _818 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _820 = _812 * _796;
    float _822 = -_794;
    float _824 = fma(_802, _804, _822);
    float _826 = -_804;
    float _828 = fma(_802, _794, _826);
    float _830 = fma(_802, _806, _798);
    float _832 = _808 * _796;
    float _834 = fma(_802, _798, _806);
    float _836 = -_796;
    float _838 = _802 * _836;
    float _840 = fma(_824, _792, _820);
    float _842 = fma(_830, _792, _832);
    float _844 = _454 + _818;
    float _846 = fma(_810, _792, _838);
    float _848 = fma(_828, _790, _842);
    float _850 = _844 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _852 = fma(_816, _790, _846);
    float _854 = fma(_834, _790, _840);
    float _856 = _848 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _862 = _814 * _860;
    float _864 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[126].x, _850);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[10].x, _856);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[8].x, _858);
    float _870 = _844 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _872 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _866);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _868);
    bool _878 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _880 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[127].x, _870);
    float _882 = _232 + _874;
    float _884 = _230 + _876;
    float _886 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[126].z, _864);
    float _888 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[127].z, _880);
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _892 = _882 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _884 + _894;
    bool _898 = !_872;
    int _900 = _898 ? 0 : 1;
    float _902 = _886 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _904 = _892 * _892;
    float _906 = _888 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _908 = trunc(_902);
    int _910 = int(_908);
    float _912 = fma(_896, _896, _904);
    int _914 = 2;
    float _916 = _912;
    float _918 = _884;
    float _920 = _882;
    float _922 = _896;
    if (!_872)
    {
        _914 = 1;
    }
    int _924 = _914;
    int _926 = _924;
    if (!_878)
    {
        _926 = _900;
    }
    int _928 = _926;
    float _930 = sqrt(_912);
    int _932 = _928 << 6;
    int _934 = _932 + 96;
    uint _937 = uint(int(uint(_934) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = trunc(_906);
    int _955 = int(_953);
    int _957 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _959 = _910 + _957;
    int _961 = _959 + 1;
    int _963 = _932 + 104;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    bool _981 = _961 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _983 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _987 = _930 + _985;
    int _989 = _932 + 48;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1009 = _955 + _1007;
    int _1011 = _1009 + 1;
    int _1013 = _961 | _1011;
    int _1015 = _932 + 64;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
    int _1021 = int(_1017) & 3;
    float _1023 = (*spvDescriptorSet0.vp_c15)._m0[int(_1019)][_1021];
    int _1025 = int(_1017) + 1;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    int _1029 = _1025 & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    float _1033 = 0.0;
    int _1035 = _961;
    if (_983)
    {
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1033 = _1037;
    }
    float _1039 = _1033;
    bool _1041 = _1013 < 0;
    bool _1043 = _1041 || _981;
    bool _1045 = _1011 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1047 = _1045 || _1043;
    int _1049 = _932 + 56;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
    int _1055 = int(_1051) & 3;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[int(_1053)][_1055];
    int _1059 = int(_1051) + 1;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    int _1063 = _1059 & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    if (_983)
    {
        float _1067 = rsqrt(_912);
        _916 = _1067;
    }
    float _1069 = _916;
    bool _1071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1079 = _1075 || _1077;
    int _1081 = _932 + 72;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    uint _1085 = uint(int(uint(int(_1083)) >> uint(2)));
    int _1087 = int(_1083) & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    int _1091 = int(_1083) + 1;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    int _1095 = _1091 & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    float _1099 = _1039;
    float _1101 = _1069;
    if (_983)
    {
        float _1103 = _987 * _1039;
        _1099 = _1103;
    }
    float _1105 = _1099;
    float _1107 = _1105;
    if (!_1047)
    {
        int _1109 = _1011 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1111 = _1109 + _961;
        _1035 = _1111;
    }
    int _1113 = _1035;
    float _1115 = _848 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_983)
    {
        float _1117 = _1105 * 0.15915493667125701904296875;
        _1107 = _1117;
    }
    float _1119 = _1107;
    int _1121 = _932 + 80;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.vp_c15)._m0[int(_1133)][_1135];
    float _1139 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1115);
    int _1141 = 0;
    if (!_1047)
    {
        int _1143 = _1113 << 2;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _1115;
    int _1149 = _1145;
    if (_983)
    {
        float _1151 = _1119 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        _1147 = _1153;
    }
    float _1155 = _1147;
    float _1157 = _844 * _951;
    float _1159 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1139);
    int _1161 = as_type<int>(_951);
    int _1163 = as_type<int>(_1159);
    if (!_1047)
    {
        uint _1165 = uint(int(uint(_1113) >> uint(2)));
        _1161 = int(_1165);
    }
    int _1167 = _1161;
    float _1169 = as_type<float>(_1167);
    if (!_1047)
    {
        int _1171 = 12 & _1145;
        _1149 = _1171;
    }
    int _1173 = _1149;
    float _1175 = _454 + _1159;
    float _1177 = fma(_230, _943, _1157);
    float _1179 = _854;
    if (_983)
    {
        float _1181 = _1119 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    if (!_1047)
    {
        int _1187 = _1167 << 4;
        int _1189 = _1187 + _1173;
        _1163 = _1189;
    }
    int _1191 = _1163;
    float _1193 = as_type<float>(_1191);
    if (_983)
    {
        float _1195 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1169 = _1195;
    }
    float _1197 = _1169;
    float _1199 = fma(_232, _971, _1177);
    float _1201 = _844 * _1005;
    float _1203 = _1155;
    float _1205 = _979;
    float _1207 = _1201;
    float _1209 = _1005;
    if (_983)
    {
        float _1211 = fma(_1155, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1203 = _1211;
    }
    float _1213 = _1203;
    float _1215 = _1199 + _979;
    float _1217 = fma(_230, _997, _1201);
    float _1219 = _1177;
    if (!_1047)
    {
        float _1221 = floor(_902);
        _1219 = _1221;
    }
    float _1223 = _1219;
    if (_983)
    {
        float _1225 = _1069 * _1213;
        _1101 = _1225;
    }
    float _1227 = _1101;
    float _1229 = _844 * _1031;
    float _1231 = _1065;
    if (!_983)
    {
        _1205 = _1175;
    }
    float _1233 = _1205;
    float _1235 = _1233;
    if (_983)
    {
        float _1237 = _1185 + (-1.0);
        _1207 = _1237;
    }
    float _1239 = _1207;
    float _1241 = fma(_230, _1023, _1229);
    if (_983)
    {
        float _1243 = fma(_896, _1227, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _918 = _1243;
    }
    float _1245 = _918;
    float _1247 = 1.0 / _1215;
    if (_983)
    {
        float _1249 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1209 = _1249;
    }
    float _1251 = _1209;
    float _1253 = fma(_232, _1057, _1217);
    float _1255 = _1253;
    if (_983)
    {
        float _1257 = fma(_892, _1227, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _920 = _1257;
    }
    float _1259 = _920;
    if (_983)
    {
        float _1261 = fma(_1175, _1185, _1251);
        _1235 = _1261;
    }
    float _1263 = _1235;
    float _1265 = _1253 + _1065;
    if (_1079)
    {
        _1255 = _1245;
    }
    float _1267 = _1255;
    float _1269 = _1267;
    if (_1079)
    {
        _922 = _1259;
    }
    float _1271 = _922;
    float _1273 = fma(_232, _1089, _1241);
    float _1275 = _1271;
    if (_1079)
    {
        _1231 = _1263;
    }
    float _1277 = _1231;
    float _1279 = _1273 + _1097;
    float _1281 = _1277;
    if (!_1079)
    {
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1285 = _454 + _1283;
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1289 = _230 + _1287;
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1293 = _1285 * _1285;
        float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1297 = _232 + _1295;
        float _1299 = fma(_1289, _1289, _1293);
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1303 = fma(_1297, _1297, _1299);
        float _1305 = sqrt(_1303);
        float _1307 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1309 = -_232;
        float _1311 = _1309 + _1259;
        float _1313 = precise::min(_1305, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1315 = _1313 * _1301;
        float _1317 = -_454;
        float _1319 = _1317 + _1263;
        float _1321 = _1307 * _1315;
        float _1323 = -_230;
        float _1325 = _1323 + _1245;
        float _1327 = fma(_1319, _1321, _454);
        float _1329 = fma(_1325, _1321, _230);
        float _1331 = fma(_1311, _1321, _232);
        _1281 = _1327;
        _1269 = _1329;
        _1275 = _1331;
    }
    float _1333 = _1281;
    float _1335 = _1269;
    float _1337 = _1275;
    int _1339 = _932 + 88;
    uint _1341 = uint(int(uint(_1339) >> uint(2)));
    uint _1343 = uint(int(uint(int(_1341)) >> uint(2)));
    int _1345 = int(_1341) & 3;
    float _1347 = (*spvDescriptorSet0.vp_c15)._m0[int(_1343)][_1345];
    int _1349 = int(_1341) + 1;
    uint _1351 = uint(int(uint(_1349) >> uint(2)));
    int _1353 = _1349 & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    float _1357 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1359 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1361 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1363 = _1265 * _1247;
    float _1365 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1357);
    float _1367 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1359);
    float _1369 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1361);
    float _1371 = _892;
    float _1373 = _1363;
    if (!_1047)
    {
        int _1375 = _1191 + 400;
        uint _1377 = uint(int(uint(_1375) >> uint(2)));
        uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
        int _1381 = int(_1377) & 3;
        float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
        _1371 = _1383;
    }
    float _1385 = _1371;
    float _1387 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1365);
    bool _1389 = _1363 >= 0.0;
    float _1391 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1367);
    float _1393 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1395 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1369);
    float _1397 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1399 = _1279 * _1247;
    bool _1401 = _1363 <= 1.0;
    bool _1403 = _1401 && _1389;
    float _1405 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1407 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1393);
    float _1409 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1411 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1413 = _1399 >= 0.0;
    bool _1415 = _1413 && _1403;
    float _1417 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1419 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1421 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1407);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1411);
    bool _1425 = _1399 <= 1.0;
    bool _1427 = _1425 && _1415;
    float _1429 = _1185;
    if (!_1047)
    {
        float _1431 = floor(_906);
        _1429 = _1431;
    }
    float _1433 = _1429;
    float _1435 = -_1419;
    float _1437 = fma(_1435, _1417, 1.0);
    float _1439 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1441 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1423);
    float _1443 = _844 * _1137;
    float _1445 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1441);
    float _1451 = fma(_230, _1129, _1443);
    float _1453 = log2(_1437);
    float _1455 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1457 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1447);
    float _1459 = _1433;
    if (_1427)
    {
        float _1461 = float(_928);
        _1193 = _1461;
    }
    float _1463 = _1193;
    float _1465 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1455);
    float _1467 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1457);
    float _1469 = _1467;
    if (!_1047)
    {
        float _1471 = -_1433;
        float _1473 = _906 + _1471;
        _1459 = _1473;
    }
    float _1475 = _1459;
    float _1477 = 1.0 / _1449;
    float _1479 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1465);
    float _1481 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1467);
    if (!_1047)
    {
        float _1483 = -_1223;
        float _1485 = _902 + _1483;
        _1469 = _1485;
    }
    float _1487 = _1469;
    float _1489 = fma(_232, _1347, _1451);
    float _1491 = _1489 + _1355;
    float _1493 = _1447;
    if (_1427)
    {
        float _1495 = rint(_1463);
        float _1497 = precise::max(_1495, 0.0);
        uint _1499 = uint(_1497);
        uint _1501 = clamp(_1499, 0u, 65535u);
        _1493 = as_type<float>(_1501);
    }
    float _1503 = _1493;
    float _1505 = _1453 * 0.693147182464599609375;
    float _1507 = _1491 * _1247;
    float _1509 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1511 = _1481 * _1477;
    float _1513 = _1491;
    float _1515 = _1477;
    float _1517 = _1385;
    if (!_1047)
    {
        float _1519 = rint(_1385);
        float _1521 = precise::max(_1519, 0.0);
        uint _1523 = uint(_1521);
        uint _1525 = clamp(_1523, 0u, 65535u);
        _1513 = as_type<float>(_1525);
    }
    float _1527 = _1513;
    float _1529 = _1479 * _1477;
    float _1531 = fma(_1511, 0.5, 0.5);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = _1443;
    float _1537 = _1503;
    float _1539 = _1531;
    if (_1427)
    {
        float3 _5078 = float3(_1363, _1399, float(as_type<int>(_1503)));
        float3 _5082 = select(_5078, float3(0.0), isnan(_5078));
        float _1541 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5082.xy, uint(rint(_5082.z)), _1507, level(0.0));
        _1535 = _1541;
    }
    float _1543 = _1535;
    float3 _5092 = float3(_1531, _1533, _1509);
    float _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5092, float3(0.0), isnan(_5092)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5092, float3(0.0), isnan(_5092)), level(0.0)).x;
    float3 _5101 = float3(_1531, _1533, _1509);
    float4 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5101, float3(0.0), isnan(_5101)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5101, float3(0.0), isnan(_5101)), level(0.0)).xyzw;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _1548.w;
    float _1558 = _902;
    if (!_1047)
    {
        float3 _5124 = float3(_1487, _1475, float(as_type<int>(_1527)));
        float3 _5126 = select(_5124, float3(0.0), isnan(_5124));
        float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5126.xy, uint(rint(_5126.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5126.xy, uint(rint(_5126.z)), level(0.0)).x;
        _1558 = _1560;
    }
    float _1562 = _1558;
    if (_1047)
    {
        _1515 = 1.0;
    }
    float _1564 = _1515;
    float _1566 = _1564;
    if (!_1047)
    {
        int _1568 = _1113 << 4;
        int _1570 = _1568 + 2048;
        uint _1572 = uint(int(uint(_1570) >> uint(2)));
        uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
        int _1576 = int(_1572) & 3;
        float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
        int _1580 = int(_1572) + 1;
        uint _1582 = uint(int(uint(_1580) >> uint(2)));
        int _1584 = _1580 & 3;
        float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
        int _1588 = _1570 + 8;
        uint _1590 = uint(int(uint(_1588) >> uint(2)));
        uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
        int _1594 = int(_1590) & 3;
        float _1596 = (*spvDescriptorSet0.vp_c15)._m0[int(_1592)][_1594];
        int _1598 = int(_1590) + 1;
        uint _1600 = uint(int(uint(_1598) >> uint(2)));
        int _1602 = _1598 & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        float _1606 = _844 * _1586;
        float _1608 = fma(_230, _1578, _1606);
        float _1610 = fma(_232, _1596, _1608);
        float _1612 = _1610 + _1604;
        float _1614 = precise::clamp(_1612, 0.0, 1.0);
        float _1616 = -_1614;
        float _1618 = _1616 + _1562;
        float _1620 = fma(_1618, 500.0, 1.5);
        float _1622 = exp2(_1620);
        float _1624 = 0.0 + _1622;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        _1373 = _1604;
        _1537 = _1596;
        _1566 = _1626;
    }
    float _1628 = _1373;
    float _1630 = _1537;
    float _1632 = _1566;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = _1333 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1640 = _1335 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1644 = _1337 + _1642;
    float _1646 = _1636 * _1636;
    float _1648 = fma(_1640, _1640, _1646);
    float _1650 = fma(_1644, _1644, _1648);
    float _1652 = rsqrt(_1650);
    float _1654 = sqrt(_1650);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1658 = _1640 * _1656;
    float _1660 = _1644 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 * _1660;
    float _1666 = _1662 + _1664;
    float _1668 = sqrt(_1666);
    bool _1670 = _1668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1668 + _1672;
    float _1676 = _1652;
    float _1678 = _1630;
    float _1680 = _1674;
    float _1682 = _1628;
    float _1684 = _1636;
    if (_1670)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1686;
    }
    float _1688 = _1676;
    if (_1670)
    {
        float _1690 = rsqrt(_1666);
        _1678 = _1690;
    }
    float _1692 = _1678;
    float _1694 = _1692;
    if (_1670)
    {
        float _1696 = _1674 * _1688;
        _1680 = _1696;
    }
    float _1698 = _1680;
    if (_1670)
    {
        float _1700 = _1698 * 0.15915493667125701904296875;
        _1682 = _1700;
    }
    float _1702 = _1682;
    float _1704 = _1644;
    if (_1670)
    {
        float _1706 = _1702 * 6.283185482025146484375;
        float _1708 = sin(_1706);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1714 = precise::max(0.0, _1712);
    float _1716 = _1688;
    float _1718 = _1714;
    if (_1670)
    {
        float _1720 = _1702 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        _1716 = _1722;
    }
    float _1724 = _1716;
    float _1726 = -_1656;
    float _1728 = -_1714;
    float _1730 = fma(_1636, _1726, _1728);
    if (_1670)
    {
        float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1732;
    }
    float _1734 = _1684;
    float _1736 = _1734;
    float _1738 = _1710;
    if (_1670)
    {
        float _1740 = fma(_1710, _1734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = _1742;
    if (!_1670)
    {
        _1738 = _1658;
    }
    float _1746 = _1738;
    float _1748 = _1746;
    float _1750 = _1724;
    if (_1670)
    {
        float _1752 = _1724 + (-1.0);
        _1718 = _1752;
    }
    float _1754 = _1718;
    float _1756 = _1754;
    if (_1670)
    {
        float _1758 = _1692 * _1742;
        _1517 = _1758;
    }
    float _1760 = _1517;
    if (!_1670)
    {
        _1744 = _1730;
    }
    float _1762 = _1744;
    float _1764 = _1762;
    if (_1670)
    {
        float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1539 = _1766;
    }
    float _1768 = _1539;
    if (_1670)
    {
        float _1770 = _1658 * _1760;
        _1748 = _1770;
    }
    float _1772 = _1748;
    if (!_1670)
    {
        _1756 = _1660;
    }
    float _1774 = _1756;
    float _1776 = _1774;
    if (_1670)
    {
        float _1778 = _1660 * _1760;
        _1776 = _1778;
    }
    float _1780 = _1776;
    if (!_1670)
    {
        _1694 = _1662;
    }
    float _1782 = _1694;
    float _1784 = _1782;
    if (_1670)
    {
        float _1786 = fma(_1730, _1724, _1768);
        _1764 = _1786;
    }
    float _1788 = _1764;
    if (_1670)
    {
        float _1790 = _1772 * _1772;
        _1784 = _1790;
    }
    float _1792 = _1784;
    if (!_1670)
    {
        _1750 = _1664;
    }
    float _1794 = _1750;
    float _1796 = _1794;
    if (_1670)
    {
        float _1798 = _1780 * _1780;
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = fma(_1788, _1788, _1792);
    float _1804 = _1802 + _1800;
    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1808 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1806);
    float _1810 = precise::clamp(_1808, 0.0, 1.0);
    float _1812 = rsqrt(_1804);
    float _1814 = -_1810;
    float _1816 = _1814 + 1.0;
    float _1818 = abs(_1816);
    float _1820 = log2(_1818);
    float _1822 = _1812 * _1772;
    float _1824 = _1812 * _1788;
    float _1826 = _1812 * _1780;
    float _1828 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1830 = -_1828;
    float _1832 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1830);
    float _1834 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1836 = -_1826;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1832);
    float _1840 = exp2(_1834);
    float _1842 = fma(_1838, -0.5, 0.5);
    float _1844 = fma(_1838, 0.5, 0.5);
    float _1846 = _1824 + 1.0;
    float _1848 = fma(_1844, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = sqrt(_1842);
    float _1852 = fma(_1844, _1848, -0.212114393711090087890625);
    float _1854 = fma(_1844, _1852, 1.570728778839111328125);
    float _1856 = -_1824;
    float _1858 = fma(_1840, _1846, _1856);
    float _1860 = fma(_1259, 6.2500002968590706586837768554688e-05, 0.5);
    float _1862 = fma(_1858, 0.5, 0.5);
    float _1864 = fma(_1245, 6.2500002968590706586837768554688e-05, 0.5);
    float _1866 = _1850 * 0.636619746685028076171875;
    float _1868 = -_1854;
    float _1870 = fma(_1866, _1868, 1.0);
    float2 _5607 = float2(_1870, _1862);
    float3 _1874 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5607, float2(0.0), isnan(_5607)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5607, float2(0.0), isnan(_5607)), level(0.0)).xyz;
    float _1876 = _1874.x;
    float _1878 = _1874.y;
    float _1880 = _1874.z;
    float2 _5621 = float2(_1864, _1860);
    float3 _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5621, float2(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5621, float2(0.0), isnan(_5621)), level(0.0)).xyz;
    float _1884 = _1882.x;
    float _1886 = _1882.y;
    float _1888 = _1882.z;
    float _1890 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1892 = in.m_73.y;
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1896 = _258 > 0.5;
    float _1898 = _1890 * _268;
    float _1900 = in.m_65.w;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1904 = _1902 != 0;
    float _1906 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1910 = _1908 != 0;
    float _1912 = in.m_73.x;
    float _1914 = trunc(_1898);
    int _1916 = int(_1914);
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1920 = _1918 != 0;
    float _1922 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1926 = _1924 != 0;
    float _1928 = -_250;
    float _1930 = _1928 + 1.0;
    float _1932 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1922);
    float _1934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1938 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1932);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_75.x = _1335;
    out.m_75.y = _1333;
    out.m_75.z = _1337;
    float _1942 = -_1892;
    float _1944 = _1942 + 1.0;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1948 = _1916 << 4;
    int _1950 = _1948 + 1712;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1954 = _1900 > 0.5;
    uint _1956 = uint(int(uint(_1950) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = in.m_77.x;
    float _1974 = in.m_77.y;
    float _1976 = in.m_77.z;
    int _1978 = _1954 ? as_type<int>(_1944) : as_type<int>(_1892);
    bool _1980 = _1954;
    float _1982 = _1892;
    bool _1984 = _1920;
    int _1986 = as_type<int>(_1940);
    if (_1910)
    {
        bool _1988 = _268 > 0.5;
        _1980 = _1988;
    }
    bool _1990 = _1980;
    float _1992 = _1904 ? as_type<float>(_1978) : _1892;
    int _1994 = _1950 + 8;
    uint _1996 = uint(int(uint(_1994) >> uint(2)));
    uint _1998 = uint(int(uint(int(_1996)) >> uint(2)));
    int _2000 = int(_1996) & 3;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[int(_1998)][_2000];
    bool _2004 = _726 != 0.0;
    bool _2006 = isnan(_726);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.0);
    bool _2012 = _2008 || _2010;
    if (_1920)
    {
        float _2014 = _1896 ? _1944 : _1892;
        _1982 = _2014;
    }
    float _2016 = _1982;
    bool _2018 = _724 == 0.0;
    bool _2020 = !_2012;
    bool _2022 = _2018 && _2020;
    float _2024 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2026 = _728 == 0.0;
    bool _2028 = _2026 && _2022;
    float _2030 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1926)
    {
        bool _2032 = _256 > 0.5;
        _1984 = _2032;
    }
    bool _2034 = _1984;
    float _2036 = _1912;
    if (_1910)
    {
        float _2038 = -_1912;
        float _2040 = _2038 + 1.0;
        _384 = as_type<int>(_2040);
    }
    int _2042 = _384;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2046 = 0.0;
    if (!_1910)
    {
        _2046 = _1912;
    }
    float _2048 = _2046;
    float _2050 = _2048;
    if (_1926)
    {
        float _2052 = -_1912;
        float _2054 = _2052 + 1.0;
        _1986 = as_type<int>(_2054);
    }
    int _2056 = _1986;
    if (_1910)
    {
        float _2058 = _1990 ? as_type<float>(_2042) : _1912;
        _2050 = _2058;
    }
    float _2060 = _2050;
    float _2062 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1926)
    {
        float _2066 = _2034 ? as_type<float>(_2056) : _1912;
        _2036 = _2066;
    }
    float _2068 = _2036;
    float _2070 = 0.0;
    if (_2028)
    {
        _2070 = _1974;
    }
    float _2072 = _2070;
    out.m_79.x = _2062;
    out.m_79.y = _2024;
    out.m_79.z = _2030;
    float _2074 = 0.0;
    float _2076 = _2072;
    if (_2028)
    {
        _2074 = _1972;
    }
    float _2078 = _2074;
    float _2080 = 0.0;
    float _2082 = _2078;
    if (_2028)
    {
        _2080 = _1976;
    }
    float _2084 = _2080;
    float _2086 = in.m_81.x;
    float _2088 = in.m_81.y;
    float _2090 = in.m_81.z;
    float _2092 = in.m_81.w;
    float _2094 = 0.0;
    float _2096 = _2084;
    if (_2028)
    {
        _2094 = _2078;
    }
    float _2098 = _2094;
    float _2100 = _2098;
    if (!_2028)
    {
        _2082 = _1972;
    }
    float _2102 = _2082;
    if (!_2028)
    {
        float _2104 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2102);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2110 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2112 = _1962 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2114 = _2108 * _2064;
    float _2116 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2110;
    float _2120 = _2112;
    if (_2028)
    {
        _2118 = _2072;
    }
    float _2122 = _2118;
    float _2124 = _2122;
    if (!_2028)
    {
        _2076 = _1974;
    }
    float _2126 = _2076;
    float _2128 = _2002 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2130 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2028)
    {
        _2120 = _2084;
    }
    float _2132 = _2120;
    float _2134 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2136 = _2132;
    if (!_2028)
    {
        float _2138 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2126);
        _2124 = _2138;
    }
    float _2140 = _2124;
    float _2142 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2144 = _2128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2028)
    {
        _2096 = _1976;
    }
    float _2146 = _2096;
    float _2148 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2150 = _2142 * _1894;
    float _2152 = _2086 * _2126;
    float _2154 = abs(_862);
    float _2156 = log2(_2154);
    out.m_83.x = _2130;
    out.m_83.y = _2116;
    out.m_83.z = _2144;
    out.m_83.w = _1946;
    float _2158 = _2088 * _2146;
    float _2160 = _2134 * _1934;
    float _2162 = _2148 * _1952;
    if (!_2028)
    {
        float _2164 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2136 = _2164;
    }
    float _2166 = _2136;
    float _2168 = -_2158;
    float _2170 = fma(_2090, _2126, _2168);
    float _2172 = -_2152;
    float _2174 = fma(_2088, _2102, _2172);
    out.m_85.x = _2150;
    out.m_85.y = _2160;
    out.m_85.z = _2162;
    out.m_85.w = _2114;
    float _2176 = _2170 * _2092;
    float _2178 = _2174 * _2092;
    float _2180 = _2090 * _2102;
    float _2182 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2184 = -_2180;
    float _2186 = fma(_2086, _2146, _2184);
    float _2188 = exp2(_2182);
    float _2190 = _2186 * _2092;
    float _2192 = -_2140;
    float _2194 = _802 * _2192;
    float _2196 = _808 * _2140;
    float _2198 = _812 * _2140;
    float _2200 = -_2088;
    float _2202 = _802 * _2200;
    float _2204 = _808 * _2088;
    float _2206 = _812 * _2088;
    float _2208 = _808 * _2190;
    float _2210 = fma(_810, _2086, _2202);
    float _2212 = fma(_830, _2086, _2204);
    float _2214 = fma(_824, _2086, _2206);
    float _2216 = -_2190;
    float _2218 = _802 * _2216;
    float _2220 = _812 * _2190;
    float _2222 = fma(_830, _2106, _2196);
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = fma(_830, _2176, _2208);
    float _2230 = fma(_828, _2090, _2212);
    float _2232 = fma(_810, _2106, _2194);
    float _2234 = fma(_816, _2090, _2210);
    float _2236 = fma(_834, _2090, _2214);
    float _2238 = fma(_824, _2106, _2198);
    float _2240 = fma(_2226, -2.0, 3.0);
    float _2242 = fma(_810, _2176, _2218);
    float _2244 = fma(_824, _2176, _2220);
    float _2246 = _2226 * _2226;
    float _2248 = fma(_828, _2178, _2228);
    float _2250 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2252 = fma(_816, _2166, _2232);
    float _2254 = fma(_828, _2166, _2222);
    float _2256 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2258 = fma(_834, _2166, _2238);
    float _2260 = fma(_816, _2178, _2242);
    float _2262 = fma(_834, _2178, _2244);
    float _2264 = _2246 * _2240;
    float _2266 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2268 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2250);
    float _2270 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2272 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2256);
    float _2274 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2276 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2266);
    float _2278 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2270);
    float _2280 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2268);
    float _2282 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2274);
    float _2284 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2272);
    float _2286 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2288 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2290 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2292 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2278);
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2276);
    float _2296 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2282);
    float _2298 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2286);
    float _2300 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2288);
    float _2302 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2290);
    float _2304 = -_2264;
    float _2306 = _2304 + 1.0;
    float _2308 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_87.x = _2294;
    out.m_87.y = _2280;
    out.m_87.z = _2284;
    float _2310 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2302);
    float _2312 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2314 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2298);
    float _2316 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2300);
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2264);
    float _2320 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2308);
    float _2322 = exp2(_2312);
    float _2324 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2320);
    out.m_89.x = _2314;
    out.m_89.y = _2316;
    out.m_89.z = _2310;
    bool _2326 = _862 <= 8000.0;
    bool _2328 = isnan(_862);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(8000.0);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    float _2338 = _1938 + _1449;
    out.m_91.x = _2292;
    out.m_91.y = _2296;
    out.m_91.z = _2324;
    float _2340 = _2336 * _2318;
    float _2342 = _2336;
    float _2344 = _1481;
    float _2346 = 1.0;
    if (!_1427)
    {
        _2342 = 1.0;
    }
    float _2348 = _2342;
    out.m_93.x = 1.0;
    out.m_93.y = 1.0;
    out.m_93.z = 1.0;
    float _2350 = _2348;
    if (_1427)
    {
        bool _2352 = _1543 >= _1507;
        bool _2354 = isnan(_1543);
        bool _2356 = _2352 || _2354;
        bool _2358 = isnan(_1507);
        bool _2360 = _2356 || _2358;
        float _2362 = float(_2360);
        _2350 = _2362;
    }
    float _2364 = _2350;
    float _2366 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2368 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_1654);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    out.gl_Position.x = _1481;
    out.gl_Position.y = _1479;
    out.gl_Position.z = _1938;
    out.gl_Position.w = _1449;
    float _2378 = -_2322;
    float _2380 = _2378 + 1.0;
    float _2382 = _1930 * _2366;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = _2364 * _1632;
    float _2388 = _2338 * 0.5;
    float _2390 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2392 = -_2384;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2396 = _2390 * _1545;
    float _2398 = -_2390;
    float _2400 = _2398 + 1.0;
    out.m_95.z = _2388;
    out.m_95.w = _1449;
    float _2402 = -_2386;
    float _2404 = fma(_2402, _2394, 1.0);
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    float _2408 = _1556 * _2396;
    float _2410 = _1556 * _2400;
    float _2412 = _2406;
    float _2414 = _2384;
    float _2416 = _2408;
    if (!_2376)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2418 = _2344;
    float _2420 = _2406 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2422 = _2418;
    float _2424 = _2418;
    if (!_2376)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2426 = _2412;
    float _2428 = _2426;
    float _2430 = _2426;
    if (!_2376)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2432 = _2414;
    out.m_97.x = _2420;
    float _2434 = _2432;
    float _2436 = _2432;
    if (!_2376)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2438 = _2346;
    float _2440 = _1880 * _2396;
    float _2442 = fma(_1876, _2408, _1550);
    float _2444 = fma(_1878, _2408, _1552);
    out.m_99.x = _1884;
    out.m_99.y = _1886;
    out.m_99.z = _1888;
    float _2446 = fma(_1556, _2440, _1554);
    float _2448 = _1884;
    float _2450 = _2438;
    float _2452 = _2438;
    if (!_2376)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2454 = _2416;
    out.m_101.x = _2442;
    out.m_101.y = _2444;
    out.m_101.z = _2446;
    out.m_101.w = _2410;
    float _2456 = _2454;
    float _2458 = _2454;
    if (!_2376)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2460 = _2448;
    bool _2462 = !_2376;
    float _2464 = _2460;
    float _2466 = _2460;
    if (!_2462)
    {
        bool _2468 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2470 = isnan(_1654);
        bool _2472 = _2468 || _2470;
        bool _2474 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2476 = _2472 || _2474;
        if (!_2476)
        {
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2480 = _1654 + _2478;
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2490 = 1.0 / _2484;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2508 = _2480 * _2490;
            float _2510 = precise::clamp(_2508, 0.0, 1.0);
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2516 = fma(_2510, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2518 = fma(_2510, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2520 = fma(_2510, _2494, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2522 = fma(_2510, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2524 = fma(_2510, _2502, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2526 = fma(_2510, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2430 = _2520;
            _2458 = _2524;
            _2424 = _2516;
            _2452 = _2522;
            _2436 = _2518;
            _2466 = _2526;
            _2528 = true;
        }
        else
        {
            bool _2530 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2532 = isnan(_1654);
            bool _2534 = _2530 || _2532;
            bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2538 = _2534 || _2536;
            if (!_2538)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2540 = _2422;
            _2424 = _2540;
            if (!_2538)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2542 = _2428;
            _2430 = _2542;
            if (!_2538)
            {
                _2434 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2544 = _2434;
            _2436 = _2544;
            if (!_2538)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2546 = _2450;
            _2452 = _2546;
            if (!_2538)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2548 = _2456;
            _2458 = _2548;
            if (!_2538)
            {
                _2464 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2550 = _2464;
            bool _2552 = !_2538;
            _2466 = _2550;
            if (!_2552)
            {
                bool _2554 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2556 = isnan(_1654);
                bool _2558 = _2554 || _2556;
                bool _2560 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2562 = _2558 || _2560;
                if (!_2562)
                {
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2566 = _1654 + _2564;
                    float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2570 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2568;
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2576 = 1.0 / _2570;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2594 = _2566 * _2576;
                    float _2596 = precise::clamp(_2594, 0.0, 1.0);
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2602 = fma(_2596, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2604 = fma(_2596, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2606 = fma(_2596, _2580, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2596, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2610 = fma(_2596, _2588, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2612 = fma(_2596, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2430 = _2606;
                    _2458 = _2610;
                    _2424 = _2602;
                    _2452 = _2608;
                    _2436 = _2604;
                    _2466 = _2612;
                    _2528 = true;
                }
                else
                {
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2436 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2466 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2528 = false;
    float _2614 = _2430;
    float _2616 = _2458;
    float _2618 = _2424;
    float _2620 = _2452;
    float _2622 = _2436;
    float _2624 = _2466;
    float _2626 = fma(_2316, -0.5, 0.5);
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = -_2614;
    float _2632 = _2630 + _2616;
    float _2634 = -_2618;
    float _2636 = _2634 + _2620;
    float _2638 = -_2622;
    float _2640 = _2638 + _2624;
    bool _2642 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2644 = fma(_2628, _2632, _2614);
    float _2646 = fma(_2628, _2636, _2618);
    float _2648 = fma(_2628, _2640, _2622);
    float _2650 = _2644 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2652 = fma(_2646, 0.298911988735198974609375, _2650);
    float _2654 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2656 = fma(_2648, 0.114477999508380889892578125, _2652);
    out.m_97.w = _2654;
    float _2658 = -_2656;
    float _2660 = _2646 + _2658;
    float _2662 = -_2656;
    float _2664 = _2644 + _2662;
    float _2666 = -_2656;
    float _2668 = _2648 + _2666;
    out.m_103.x = 0.0;
    float _2670 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2672 = fma(_2664, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2674 = fma(_2668, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    out.m_105.x = _2670;
    out.m_105.y = _2672;
    out.m_105.z = _2674;
    if (!_2642)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2676 = -_1333;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2680 = -_1335;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2684 = -_1337;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2688 = _2678 * _2678;
    float _2690 = fma(_2682, _2682, _2688);
    float _2692 = fma(_2686, _2686, _2690);
    float _2694 = sqrt(_2692);
    float _2696 = rsqrt(_2692);
    float _2698 = -_2694;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2702 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = _2682 * _2696;
    float _2708 = _2678 * _2696;
    float _2710 = abs(_2704);
    float _2712 = log2(_2710);
    float _2714 = _2686 * _2696;
    float _2716 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2718 = _2316 * _2708;
    float _2720 = -_2708;
    float _2722 = -_2716;
    float _2724 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2722);
    float _2726 = fma(_2314, _2706, _2718);
    float _2728 = -_2714;
    float _2730 = fma(_2728, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2724);
    float _2732 = fma(_2310, _2714, _2726);
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2738 = _2730 + _2736;
    float _2740 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2742 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = exp2(_2740);
    float _2748 = _2746 * _2744;
    float _2750 = _2734 * _2748;
    float _2752 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2754 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2756 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2752;
    out.m_103.y = _2754;
    out.m_103.z = _2756;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2528 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2813 = as_type<float>(_140);
        out.gl_Position.z = _2813;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2882 = as_type<float>(_178);
        out.gl_Position.z = _2882;
    }
    if (_172)
    {
        return out;
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_65.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _158 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = in.m_58.x;
    float _214 = in.m_58.y;
    float _216 = in.m_58.z;
    float _218 = _214 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _220 = _214 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].x, _220);
    float _226 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].z, _222);
    float _228 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _234 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _236 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _238 = floor(_234);
    float _240 = floor(_236);
    float _242 = -_238;
    float _244 = _234 + _242;
    float _246 = -_240;
    float _248 = _236 + _246;
    float2 _3009 = float2(_244, _248);
    float _250 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3009, float2(0.0), isnan(_3009)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3009, float2(0.0), isnan(_3009)), level(0.0)).x;
    float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _254 = log2(_252);
    float _256 = in.m_65.z;
    float _258 = in.m_65.y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = in.m_65.x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = 1.0 / _262;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _286 = _284 != 0;
    float _288 = _254 * _158;
    float _290 = 1.0 / _266;
    float _292 = _214 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _210 + _294;
    float _298 = 1.0 / _272;
    float _300 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _304 = 1.0 + _302;
    float _306 = _258 + _256;
    float _308 = _296 * _274;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _210 + _310;
    float _314 = _256 * 2.0;
    float _316 = exp2(_288);
    float _318 = _268 * 2.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _210 + _320;
    float _324 = _306 + (-1.0);
    float _326 = _312 * _290;
    bool _328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _330 = isnan(1.0);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _336 = _332 || _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _338;
    float _342 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _344 = 1.0 / _304;
    float _346 = _322 * _298;
    float _348 = _258 * 2.0;
    float _350 = _268 + _258;
    bool _352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _360 = _356 || _358;
    float _362 = _268 + _256;
    float _364 = _350 + (-1.0);
    float _366 = floor(_318);
    float _368 = -_316;
    float _370 = _368 + 1.0;
    float _372 = _362 + (-1.0);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _376 = fma(_340, _346, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = _360 ? _370 : 0.0;
    float _380 = floor(_314);
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _384 = as_type<int>(_256);
    if (_336)
    {
        float _386 = _378 * _344;
        _162 = _386;
    }
    float _388 = _162;
    float _390 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = floor(_348);
    bool _402 = _366 > 0.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _408 = _366 >= 0.0;
    bool _410 = isnan(_366);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = fma(_398, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = fma(_406, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _426 = _416 ? 0 : 1;
    float _428 = fma(_420, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _430 = _380 >= 0.0;
    bool _432 = isnan(_380);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    float _440 = fma(_394, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _442 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _444 = isnan(_210);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = _390 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _456 = _380 > 0.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    int _462 = _438 ? 0 : 1;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    bool _468 = _400 > 0.0;
    float _470 = fma(_460, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _472 = _400 >= 0.0;
    bool _474 = isnan(_400);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _486 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _488 = isnan(_210);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _500 = isnan(_210);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = fma(_484, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _512 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_210);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = _496 * _466;
    float _526 = -_496;
    float _528 = _526 + 1.0;
    float _530 = _522 * _528;
    float _532 = -_522;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _536;
    bool _540 = !_278;
    int _542 = _540 ? 0 : 1;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _544;
    float _548 = _508 * _534;
    float _550 = -_508;
    float _552 = _550 + 1.0;
    float _554 = fma(_538, _346, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _556 = fma(_546, _346, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _558 = _422 * _548;
    float _560 = _470 * _548;
    float _562 = _428 * _548;
    int _564 = _480 ? 0 : 1;
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _570 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _562);
    int _572 = ~_462;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = in.m_67.x;
    float _580 = in.m_67.y;
    float _582 = in.m_67.z;
    int _584 = abs(_542);
    float _586 = fma(_424, _530, _566);
    int _588 = _576;
    if (!_456)
    {
        int _590 = ~_462;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_510, _530, _568);
    int _598 = ~_426;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = fma(_440, _530, _570);
    int _606 = _602;
    if (!_402)
    {
        int _608 = ~_426;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = fma(_554, _524, _586);
    float _616 = float(_584);
    float _618 = fma(_556, _524, _596);
    float _620 = float(_594);
    float _622 = fma(_376, _524, _604);
    bool _624 = !_282;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].x, _614);
    int _630 = ~_564;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = _616 * _620;
    int _638 = _634;
    if (!_468)
    {
        int _640 = ~_564;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = _268 + (-0.5);
    int _648 = abs(_626);
    float _650 = _454 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _652 = !_286;
    int _654 = _652 ? 0 : 1;
    float _656 = _636 * (-2.0);
    float _658 = float(_612);
    float _660 = fma(_230, (*spvDescriptorSet0.vp_c8)._m0[11].x, _650);
    int _662 = abs(_654);
    float _664 = fma(_656, _578, _578);
    float _666 = float(_648);
    float _668 = fma(_232, (*spvDescriptorSet0.vp_c8)._m0[11].z, _660);
    float _670 = fma(_374, _656, _374);
    float _672 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].x, _664);
    float _674 = float(_644);
    float _676 = _666 * _658;
    float _678 = _668 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _680 = fma(_670, _388, _672);
    float _682 = _676 * (-2.0);
    float _684 = 1.0 / _678;
    float _686 = float(_662);
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = _258 + (-0.5);
    float _692 = fma(_682, _580, _580);
    float _694 = fma(_342, _682, _342);
    float _696 = _686 * _674;
    float _698 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].z, _622);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _702 = _688 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _696 * (-2.0);
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_694, _388, _700);
    float _716 = fma(_706, _582, _582);
    float _718 = _454 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _720 = _714 * 0.15915493667125701904296875;
    float _722 = _256 + (-0.5);
    float _724 = in.m_71.x;
    float _726 = in.m_71.y;
    float _728 = in.m_71.z;
    float _730 = fma(_230, (*spvDescriptorSet0.vp_c8)._m0[10].x, _718);
    float _732 = fma(_382, _706, _382);
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].z, _716);
    float _736 = _688 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = fma(_232, (*spvDescriptorSet0.vp_c8)._m0[10].z, _730);
    float _742 = fma(_732, _388, _734);
    float _744 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].y, _618);
    float _746 = _740 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _748 = _742 * 0.15915493667125701904296875;
    float _750 = _720 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _746 + _678;
    float _756 = _698 * _712;
    float _758 = _628 * _708;
    float _760 = _744 * _710;
    float _762 = _720 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = _754 * _684;
    float _768 = _766 * 0.5;
    float _770 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _776 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _780 = _748 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[30].w, _786);
    float _790 = _772 * _770;
    float _792 = _774 * _776;
    float _794 = _738 * _752;
    float _796 = _778 * _784;
    float _798 = _704 * _752;
    float _800 = _748 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _704 * _764;
    float _806 = _738 * _764;
    float _808 = _738 * _782;
    float _810 = _764 * _782;
    float _812 = _704 * _782;
    float _814 = 1.0 / _788;
    float _816 = _752 * _782;
    float _818 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _820 = _812 * _796;
    float _822 = -_794;
    float _824 = fma(_802, _804, _822);
    float _826 = -_804;
    float _828 = fma(_802, _794, _826);
    float _830 = fma(_802, _806, _798);
    float _832 = _808 * _796;
    float _834 = fma(_802, _798, _806);
    float _836 = -_796;
    float _838 = _802 * _836;
    float _840 = fma(_824, _792, _820);
    float _842 = fma(_830, _792, _832);
    float _844 = _454 + _818;
    float _846 = fma(_810, _792, _838);
    float _848 = fma(_828, _790, _842);
    float _850 = _844 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _852 = fma(_816, _790, _846);
    float _854 = fma(_834, _790, _840);
    float _856 = _848 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _862 = _814 * _860;
    float _864 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[126].x, _850);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[10].x, _856);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[8].x, _858);
    float _870 = _844 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _872 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _866);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _868);
    bool _878 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _880 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[127].x, _870);
    float _882 = _232 + _874;
    float _884 = _230 + _876;
    float _886 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[126].z, _864);
    float _888 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[127].z, _880);
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _892 = _882 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _884 + _894;
    bool _898 = !_872;
    int _900 = _898 ? 0 : 1;
    float _902 = _886 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _904 = _892 * _892;
    float _906 = _888 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _908 = trunc(_902);
    int _910 = int(_908);
    float _912 = fma(_896, _896, _904);
    int _914 = 2;
    float _916 = _912;
    float _918 = _884;
    float _920 = _882;
    float _922 = _896;
    if (!_872)
    {
        _914 = 1;
    }
    int _924 = _914;
    int _926 = _924;
    if (!_878)
    {
        _926 = _900;
    }
    int _928 = _926;
    float _930 = sqrt(_912);
    int _932 = _928 << 6;
    int _934 = _932 + 96;
    uint _937 = uint(int(uint(_934) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = trunc(_906);
    int _955 = int(_953);
    int _957 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _959 = _910 + _957;
    int _961 = _959 + 1;
    int _963 = _932 + 104;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    bool _981 = _961 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _983 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _987 = _930 + _985;
    int _989 = _932 + 48;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1009 = _955 + _1007;
    int _1011 = _1009 + 1;
    int _1013 = _961 | _1011;
    int _1015 = _932 + 64;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
    int _1021 = int(_1017) & 3;
    float _1023 = (*spvDescriptorSet0.vp_c15)._m0[int(_1019)][_1021];
    int _1025 = int(_1017) + 1;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    int _1029 = _1025 & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    float _1033 = 0.0;
    int _1035 = _961;
    if (_983)
    {
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1033 = _1037;
    }
    float _1039 = _1033;
    bool _1041 = _1013 < 0;
    bool _1043 = _1041 || _981;
    bool _1045 = _1011 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1047 = _1045 || _1043;
    int _1049 = _932 + 56;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
    int _1055 = int(_1051) & 3;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[int(_1053)][_1055];
    int _1059 = int(_1051) + 1;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    int _1063 = _1059 & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    if (_983)
    {
        float _1067 = rsqrt(_912);
        _916 = _1067;
    }
    float _1069 = _916;
    bool _1071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1079 = _1075 || _1077;
    int _1081 = _932 + 72;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    uint _1085 = uint(int(uint(int(_1083)) >> uint(2)));
    int _1087 = int(_1083) & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    int _1091 = int(_1083) + 1;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    int _1095 = _1091 & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    float _1099 = _1039;
    float _1101 = _1069;
    if (_983)
    {
        float _1103 = _987 * _1039;
        _1099 = _1103;
    }
    float _1105 = _1099;
    float _1107 = _1105;
    if (!_1047)
    {
        int _1109 = _1011 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1111 = _1109 + _961;
        _1035 = _1111;
    }
    int _1113 = _1035;
    float _1115 = _848 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_983)
    {
        float _1117 = _1105 * 0.15915493667125701904296875;
        _1107 = _1117;
    }
    float _1119 = _1107;
    int _1121 = _932 + 80;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.vp_c15)._m0[int(_1133)][_1135];
    float _1139 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1115);
    int _1141 = 0;
    if (!_1047)
    {
        int _1143 = _1113 << 2;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _1115;
    int _1149 = _1145;
    if (_983)
    {
        float _1151 = _1119 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        _1147 = _1153;
    }
    float _1155 = _1147;
    float _1157 = _844 * _951;
    float _1159 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1139);
    int _1161 = as_type<int>(_951);
    int _1163 = as_type<int>(_1159);
    if (!_1047)
    {
        uint _1165 = uint(int(uint(_1113) >> uint(2)));
        _1161 = int(_1165);
    }
    int _1167 = _1161;
    float _1169 = as_type<float>(_1167);
    if (!_1047)
    {
        int _1171 = 12 & _1145;
        _1149 = _1171;
    }
    int _1173 = _1149;
    float _1175 = _454 + _1159;
    float _1177 = fma(_230, _943, _1157);
    float _1179 = _854;
    if (_983)
    {
        float _1181 = _1119 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    if (!_1047)
    {
        int _1187 = _1167 << 4;
        int _1189 = _1187 + _1173;
        _1163 = _1189;
    }
    int _1191 = _1163;
    float _1193 = as_type<float>(_1191);
    if (_983)
    {
        float _1195 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1169 = _1195;
    }
    float _1197 = _1169;
    float _1199 = fma(_232, _971, _1177);
    float _1201 = _844 * _1005;
    float _1203 = _1155;
    float _1205 = _979;
    float _1207 = _1201;
    float _1209 = _1005;
    if (_983)
    {
        float _1211 = fma(_1155, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1203 = _1211;
    }
    float _1213 = _1203;
    float _1215 = _1199 + _979;
    float _1217 = fma(_230, _997, _1201);
    float _1219 = _1177;
    if (!_1047)
    {
        float _1221 = floor(_902);
        _1219 = _1221;
    }
    float _1223 = _1219;
    if (_983)
    {
        float _1225 = _1069 * _1213;
        _1101 = _1225;
    }
    float _1227 = _1101;
    float _1229 = _844 * _1031;
    float _1231 = _1065;
    if (!_983)
    {
        _1205 = _1175;
    }
    float _1233 = _1205;
    float _1235 = _1233;
    if (_983)
    {
        float _1237 = _1185 + (-1.0);
        _1207 = _1237;
    }
    float _1239 = _1207;
    float _1241 = fma(_230, _1023, _1229);
    if (_983)
    {
        float _1243 = fma(_896, _1227, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _918 = _1243;
    }
    float _1245 = _918;
    float _1247 = 1.0 / _1215;
    if (_983)
    {
        float _1249 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1209 = _1249;
    }
    float _1251 = _1209;
    float _1253 = fma(_232, _1057, _1217);
    float _1255 = _1253;
    if (_983)
    {
        float _1257 = fma(_892, _1227, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _920 = _1257;
    }
    float _1259 = _920;
    if (_983)
    {
        float _1261 = fma(_1175, _1185, _1251);
        _1235 = _1261;
    }
    float _1263 = _1235;
    float _1265 = _1253 + _1065;
    if (_1079)
    {
        _1255 = _1245;
    }
    float _1267 = _1255;
    float _1269 = _1267;
    if (_1079)
    {
        _922 = _1259;
    }
    float _1271 = _922;
    float _1273 = fma(_232, _1089, _1241);
    float _1275 = _1271;
    if (_1079)
    {
        _1231 = _1263;
    }
    float _1277 = _1231;
    float _1279 = _1273 + _1097;
    float _1281 = _1277;
    if (!_1079)
    {
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1285 = _454 + _1283;
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1289 = _230 + _1287;
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1293 = _1285 * _1285;
        float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1297 = _232 + _1295;
        float _1299 = fma(_1289, _1289, _1293);
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1303 = fma(_1297, _1297, _1299);
        float _1305 = sqrt(_1303);
        float _1307 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1309 = -_232;
        float _1311 = _1309 + _1259;
        float _1313 = precise::min(_1305, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1315 = _1313 * _1301;
        float _1317 = -_454;
        float _1319 = _1317 + _1263;
        float _1321 = _1307 * _1315;
        float _1323 = -_230;
        float _1325 = _1323 + _1245;
        float _1327 = fma(_1319, _1321, _454);
        float _1329 = fma(_1325, _1321, _230);
        float _1331 = fma(_1311, _1321, _232);
        _1281 = _1327;
        _1269 = _1329;
        _1275 = _1331;
    }
    float _1333 = _1281;
    float _1335 = _1269;
    float _1337 = _1275;
    int _1339 = _932 + 88;
    uint _1341 = uint(int(uint(_1339) >> uint(2)));
    uint _1343 = uint(int(uint(int(_1341)) >> uint(2)));
    int _1345 = int(_1341) & 3;
    float _1347 = (*spvDescriptorSet0.vp_c15)._m0[int(_1343)][_1345];
    int _1349 = int(_1341) + 1;
    uint _1351 = uint(int(uint(_1349) >> uint(2)));
    int _1353 = _1349 & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    float _1357 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1359 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1361 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1363 = _1265 * _1247;
    float _1365 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1357);
    float _1367 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1359);
    float _1369 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1361);
    float _1371 = _892;
    float _1373 = _1363;
    if (!_1047)
    {
        int _1375 = _1191 + 400;
        uint _1377 = uint(int(uint(_1375) >> uint(2)));
        uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
        int _1381 = int(_1377) & 3;
        float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
        _1371 = _1383;
    }
    float _1385 = _1371;
    float _1387 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1365);
    bool _1389 = _1363 >= 0.0;
    float _1391 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1367);
    float _1393 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1395 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1369);
    float _1397 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1399 = _1279 * _1247;
    bool _1401 = _1363 <= 1.0;
    bool _1403 = _1401 && _1389;
    float _1405 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1407 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1393);
    float _1409 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1411 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1413 = _1399 >= 0.0;
    bool _1415 = _1413 && _1403;
    float _1417 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1419 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1421 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1407);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1411);
    bool _1425 = _1399 <= 1.0;
    bool _1427 = _1425 && _1415;
    float _1429 = _1185;
    if (!_1047)
    {
        float _1431 = floor(_906);
        _1429 = _1431;
    }
    float _1433 = _1429;
    float _1435 = -_1419;
    float _1437 = fma(_1435, _1417, 1.0);
    float _1439 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1441 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1423);
    float _1443 = _844 * _1137;
    float _1445 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1441);
    float _1451 = fma(_230, _1129, _1443);
    float _1453 = log2(_1437);
    float _1455 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1457 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1447);
    float _1459 = _1433;
    if (_1427)
    {
        float _1461 = float(_928);
        _1193 = _1461;
    }
    float _1463 = _1193;
    float _1465 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1455);
    float _1467 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1457);
    float _1469 = _1467;
    if (!_1047)
    {
        float _1471 = -_1433;
        float _1473 = _906 + _1471;
        _1459 = _1473;
    }
    float _1475 = _1459;
    float _1477 = 1.0 / _1449;
    float _1479 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1465);
    float _1481 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1467);
    if (!_1047)
    {
        float _1483 = -_1223;
        float _1485 = _902 + _1483;
        _1469 = _1485;
    }
    float _1487 = _1469;
    float _1489 = fma(_232, _1347, _1451);
    float _1491 = _1489 + _1355;
    float _1493 = _1447;
    if (_1427)
    {
        float _1495 = rint(_1463);
        float _1497 = precise::max(_1495, 0.0);
        uint _1499 = uint(_1497);
        uint _1501 = clamp(_1499, 0u, 65535u);
        _1493 = as_type<float>(_1501);
    }
    float _1503 = _1493;
    float _1505 = _1453 * 0.693147182464599609375;
    float _1507 = _1491 * _1247;
    float _1509 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1511 = _1481 * _1477;
    float _1513 = _1491;
    float _1515 = _1477;
    float _1517 = _1385;
    if (!_1047)
    {
        float _1519 = rint(_1385);
        float _1521 = precise::max(_1519, 0.0);
        uint _1523 = uint(_1521);
        uint _1525 = clamp(_1523, 0u, 65535u);
        _1513 = as_type<float>(_1525);
    }
    float _1527 = _1513;
    float _1529 = _1479 * _1477;
    float _1531 = fma(_1511, 0.5, 0.5);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = _1443;
    float _1537 = _1503;
    float _1539 = _1531;
    if (_1427)
    {
        float3 _5078 = float3(_1363, _1399, float(as_type<int>(_1503)));
        float3 _5082 = select(_5078, float3(0.0), isnan(_5078));
        float _1541 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5082.xy, uint(rint(_5082.z)), _1507, level(0.0));
        _1535 = _1541;
    }
    float _1543 = _1535;
    float3 _5092 = float3(_1531, _1533, _1509);
    float _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5092, float3(0.0), isnan(_5092)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5092, float3(0.0), isnan(_5092)), level(0.0)).x;
    float3 _5101 = float3(_1531, _1533, _1509);
    float4 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5101, float3(0.0), isnan(_5101)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5101, float3(0.0), isnan(_5101)), level(0.0)).xyzw;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _1548.w;
    float _1558 = _902;
    if (!_1047)
    {
        float3 _5124 = float3(_1487, _1475, float(as_type<int>(_1527)));
        float3 _5126 = select(_5124, float3(0.0), isnan(_5124));
        float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5126.xy, uint(rint(_5126.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5126.xy, uint(rint(_5126.z)), level(0.0)).x;
        _1558 = _1560;
    }
    float _1562 = _1558;
    if (_1047)
    {
        _1515 = 1.0;
    }
    float _1564 = _1515;
    float _1566 = _1564;
    if (!_1047)
    {
        int _1568 = _1113 << 4;
        int _1570 = _1568 + 2048;
        uint _1572 = uint(int(uint(_1570) >> uint(2)));
        uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
        int _1576 = int(_1572) & 3;
        float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
        int _1580 = int(_1572) + 1;
        uint _1582 = uint(int(uint(_1580) >> uint(2)));
        int _1584 = _1580 & 3;
        float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
        int _1588 = _1570 + 8;
        uint _1590 = uint(int(uint(_1588) >> uint(2)));
        uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
        int _1594 = int(_1590) & 3;
        float _1596 = (*spvDescriptorSet0.vp_c15)._m0[int(_1592)][_1594];
        int _1598 = int(_1590) + 1;
        uint _1600 = uint(int(uint(_1598) >> uint(2)));
        int _1602 = _1598 & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        float _1606 = _844 * _1586;
        float _1608 = fma(_230, _1578, _1606);
        float _1610 = fma(_232, _1596, _1608);
        float _1612 = _1610 + _1604;
        float _1614 = precise::clamp(_1612, 0.0, 1.0);
        float _1616 = -_1614;
        float _1618 = _1616 + _1562;
        float _1620 = fma(_1618, 500.0, 1.5);
        float _1622 = exp2(_1620);
        float _1624 = 0.0 + _1622;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        _1373 = _1604;
        _1537 = _1596;
        _1566 = _1626;
    }
    float _1628 = _1373;
    float _1630 = _1537;
    float _1632 = _1566;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = _1333 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1640 = _1335 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1644 = _1337 + _1642;
    float _1646 = _1636 * _1636;
    float _1648 = fma(_1640, _1640, _1646);
    float _1650 = fma(_1644, _1644, _1648);
    float _1652 = rsqrt(_1650);
    float _1654 = sqrt(_1650);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1658 = _1640 * _1656;
    float _1660 = _1644 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 * _1660;
    float _1666 = _1662 + _1664;
    float _1668 = sqrt(_1666);
    bool _1670 = _1668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1668 + _1672;
    float _1676 = _1652;
    float _1678 = _1630;
    float _1680 = _1674;
    float _1682 = _1628;
    float _1684 = _1636;
    if (_1670)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1686;
    }
    float _1688 = _1676;
    if (_1670)
    {
        float _1690 = rsqrt(_1666);
        _1678 = _1690;
    }
    float _1692 = _1678;
    float _1694 = _1692;
    if (_1670)
    {
        float _1696 = _1674 * _1688;
        _1680 = _1696;
    }
    float _1698 = _1680;
    if (_1670)
    {
        float _1700 = _1698 * 0.15915493667125701904296875;
        _1682 = _1700;
    }
    float _1702 = _1682;
    float _1704 = _1644;
    if (_1670)
    {
        float _1706 = _1702 * 6.283185482025146484375;
        float _1708 = sin(_1706);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1714 = precise::max(0.0, _1712);
    float _1716 = _1688;
    float _1718 = _1714;
    if (_1670)
    {
        float _1720 = _1702 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        _1716 = _1722;
    }
    float _1724 = _1716;
    float _1726 = -_1656;
    float _1728 = -_1714;
    float _1730 = fma(_1636, _1726, _1728);
    if (_1670)
    {
        float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1732;
    }
    float _1734 = _1684;
    float _1736 = _1734;
    float _1738 = _1710;
    if (_1670)
    {
        float _1740 = fma(_1710, _1734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = _1742;
    if (!_1670)
    {
        _1738 = _1658;
    }
    float _1746 = _1738;
    float _1748 = _1746;
    float _1750 = _1724;
    if (_1670)
    {
        float _1752 = _1724 + (-1.0);
        _1718 = _1752;
    }
    float _1754 = _1718;
    float _1756 = _1754;
    if (_1670)
    {
        float _1758 = _1692 * _1742;
        _1517 = _1758;
    }
    float _1760 = _1517;
    if (!_1670)
    {
        _1744 = _1730;
    }
    float _1762 = _1744;
    float _1764 = _1762;
    if (_1670)
    {
        float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1539 = _1766;
    }
    float _1768 = _1539;
    if (_1670)
    {
        float _1770 = _1658 * _1760;
        _1748 = _1770;
    }
    float _1772 = _1748;
    if (!_1670)
    {
        _1756 = _1660;
    }
    float _1774 = _1756;
    float _1776 = _1774;
    if (_1670)
    {
        float _1778 = _1660 * _1760;
        _1776 = _1778;
    }
    float _1780 = _1776;
    if (!_1670)
    {
        _1694 = _1662;
    }
    float _1782 = _1694;
    float _1784 = _1782;
    if (_1670)
    {
        float _1786 = fma(_1730, _1724, _1768);
        _1764 = _1786;
    }
    float _1788 = _1764;
    if (_1670)
    {
        float _1790 = _1772 * _1772;
        _1784 = _1790;
    }
    float _1792 = _1784;
    if (!_1670)
    {
        _1750 = _1664;
    }
    float _1794 = _1750;
    float _1796 = _1794;
    if (_1670)
    {
        float _1798 = _1780 * _1780;
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = fma(_1788, _1788, _1792);
    float _1804 = _1802 + _1800;
    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1808 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1806);
    float _1810 = precise::clamp(_1808, 0.0, 1.0);
    float _1812 = rsqrt(_1804);
    float _1814 = -_1810;
    float _1816 = _1814 + 1.0;
    float _1818 = abs(_1816);
    float _1820 = log2(_1818);
    float _1822 = _1812 * _1772;
    float _1824 = _1812 * _1788;
    float _1826 = _1812 * _1780;
    float _1828 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1830 = -_1828;
    float _1832 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1830);
    float _1834 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1836 = -_1826;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1832);
    float _1840 = exp2(_1834);
    float _1842 = fma(_1838, -0.5, 0.5);
    float _1844 = fma(_1838, 0.5, 0.5);
    float _1846 = _1824 + 1.0;
    float _1848 = fma(_1844, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = sqrt(_1842);
    float _1852 = fma(_1844, _1848, -0.212114393711090087890625);
    float _1854 = fma(_1844, _1852, 1.570728778839111328125);
    float _1856 = -_1824;
    float _1858 = fma(_1840, _1846, _1856);
    float _1860 = fma(_1259, 6.2500002968590706586837768554688e-05, 0.5);
    float _1862 = fma(_1858, 0.5, 0.5);
    float _1864 = fma(_1245, 6.2500002968590706586837768554688e-05, 0.5);
    float _1866 = _1850 * 0.636619746685028076171875;
    float _1868 = -_1854;
    float _1870 = fma(_1866, _1868, 1.0);
    float2 _5607 = float2(_1870, _1862);
    float3 _1874 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5607, float2(0.0), isnan(_5607)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5607, float2(0.0), isnan(_5607)), level(0.0)).xyz;
    float _1876 = _1874.x;
    float _1878 = _1874.y;
    float _1880 = _1874.z;
    float2 _5621 = float2(_1864, _1860);
    float3 _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5621, float2(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5621, float2(0.0), isnan(_5621)), level(0.0)).xyz;
    float _1884 = _1882.x;
    float _1886 = _1882.y;
    float _1888 = _1882.z;
    float _1890 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1892 = in.m_73.y;
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1896 = _258 > 0.5;
    float _1898 = _1890 * _268;
    float _1900 = in.m_65.w;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1904 = _1902 != 0;
    float _1906 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1910 = _1908 != 0;
    float _1912 = in.m_73.x;
    float _1914 = trunc(_1898);
    int _1916 = int(_1914);
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1920 = _1918 != 0;
    float _1922 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1926 = _1924 != 0;
    float _1928 = -_250;
    float _1930 = _1928 + 1.0;
    float _1932 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1922);
    float _1934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1938 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1932);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_75.x = _1335;
    out.m_75.y = _1333;
    out.m_75.z = _1337;
    float _1942 = -_1892;
    float _1944 = _1942 + 1.0;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1948 = _1916 << 4;
    int _1950 = _1948 + 1712;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1954 = _1900 > 0.5;
    uint _1956 = uint(int(uint(_1950) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = in.m_77.x;
    float _1974 = in.m_77.y;
    float _1976 = in.m_77.z;
    int _1978 = _1954 ? as_type<int>(_1944) : as_type<int>(_1892);
    bool _1980 = _1954;
    float _1982 = _1892;
    bool _1984 = _1920;
    int _1986 = as_type<int>(_1940);
    if (_1910)
    {
        bool _1988 = _268 > 0.5;
        _1980 = _1988;
    }
    bool _1990 = _1980;
    float _1992 = _1904 ? as_type<float>(_1978) : _1892;
    int _1994 = _1950 + 8;
    uint _1996 = uint(int(uint(_1994) >> uint(2)));
    uint _1998 = uint(int(uint(int(_1996)) >> uint(2)));
    int _2000 = int(_1996) & 3;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[int(_1998)][_2000];
    bool _2004 = _726 != 0.0;
    bool _2006 = isnan(_726);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.0);
    bool _2012 = _2008 || _2010;
    if (_1920)
    {
        float _2014 = _1896 ? _1944 : _1892;
        _1982 = _2014;
    }
    float _2016 = _1982;
    bool _2018 = _724 == 0.0;
    bool _2020 = !_2012;
    bool _2022 = _2018 && _2020;
    float _2024 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2026 = _728 == 0.0;
    bool _2028 = _2026 && _2022;
    float _2030 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1926)
    {
        bool _2032 = _256 > 0.5;
        _1984 = _2032;
    }
    bool _2034 = _1984;
    float _2036 = _1912;
    if (_1910)
    {
        float _2038 = -_1912;
        float _2040 = _2038 + 1.0;
        _384 = as_type<int>(_2040);
    }
    int _2042 = _384;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2046 = 0.0;
    if (!_1910)
    {
        _2046 = _1912;
    }
    float _2048 = _2046;
    float _2050 = _2048;
    if (_1926)
    {
        float _2052 = -_1912;
        float _2054 = _2052 + 1.0;
        _1986 = as_type<int>(_2054);
    }
    int _2056 = _1986;
    if (_1910)
    {
        float _2058 = _1990 ? as_type<float>(_2042) : _1912;
        _2050 = _2058;
    }
    float _2060 = _2050;
    float _2062 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1926)
    {
        float _2066 = _2034 ? as_type<float>(_2056) : _1912;
        _2036 = _2066;
    }
    float _2068 = _2036;
    float _2070 = 0.0;
    if (_2028)
    {
        _2070 = _1974;
    }
    float _2072 = _2070;
    out.m_79.x = _2062;
    out.m_79.y = _2024;
    out.m_79.z = _2030;
    float _2074 = 0.0;
    float _2076 = _2072;
    if (_2028)
    {
        _2074 = _1972;
    }
    float _2078 = _2074;
    float _2080 = 0.0;
    float _2082 = _2078;
    if (_2028)
    {
        _2080 = _1976;
    }
    float _2084 = _2080;
    float _2086 = in.m_81.x;
    float _2088 = in.m_81.y;
    float _2090 = in.m_81.z;
    float _2092 = in.m_81.w;
    float _2094 = 0.0;
    float _2096 = _2084;
    if (_2028)
    {
        _2094 = _2078;
    }
    float _2098 = _2094;
    float _2100 = _2098;
    if (!_2028)
    {
        _2082 = _1972;
    }
    float _2102 = _2082;
    if (!_2028)
    {
        float _2104 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2102);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2110 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2112 = _1962 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2114 = _2108 * _2064;
    float _2116 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2110;
    float _2120 = _2112;
    if (_2028)
    {
        _2118 = _2072;
    }
    float _2122 = _2118;
    float _2124 = _2122;
    if (!_2028)
    {
        _2076 = _1974;
    }
    float _2126 = _2076;
    float _2128 = _2002 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2130 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2028)
    {
        _2120 = _2084;
    }
    float _2132 = _2120;
    float _2134 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2136 = _2132;
    if (!_2028)
    {
        float _2138 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2126);
        _2124 = _2138;
    }
    float _2140 = _2124;
    float _2142 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2144 = _2128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2028)
    {
        _2096 = _1976;
    }
    float _2146 = _2096;
    float _2148 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2150 = _2142 * _1894;
    float _2152 = _2086 * _2126;
    float _2154 = abs(_862);
    float _2156 = log2(_2154);
    out.m_83.x = _2130;
    out.m_83.y = _2116;
    out.m_83.z = _2144;
    out.m_83.w = _1946;
    float _2158 = _2088 * _2146;
    float _2160 = _2134 * _1934;
    float _2162 = _2148 * _1952;
    if (!_2028)
    {
        float _2164 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2136 = _2164;
    }
    float _2166 = _2136;
    float _2168 = -_2158;
    float _2170 = fma(_2090, _2126, _2168);
    float _2172 = -_2152;
    float _2174 = fma(_2088, _2102, _2172);
    out.m_85.x = _2150;
    out.m_85.y = _2160;
    out.m_85.z = _2162;
    out.m_85.w = _2114;
    float _2176 = _2170 * _2092;
    float _2178 = _2174 * _2092;
    float _2180 = _2090 * _2102;
    float _2182 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2184 = -_2180;
    float _2186 = fma(_2086, _2146, _2184);
    float _2188 = exp2(_2182);
    float _2190 = _2186 * _2092;
    float _2192 = -_2140;
    float _2194 = _802 * _2192;
    float _2196 = _808 * _2140;
    float _2198 = _812 * _2140;
    float _2200 = -_2088;
    float _2202 = _802 * _2200;
    float _2204 = _808 * _2088;
    float _2206 = _812 * _2088;
    float _2208 = _808 * _2190;
    float _2210 = fma(_810, _2086, _2202);
    float _2212 = fma(_830, _2086, _2204);
    float _2214 = fma(_824, _2086, _2206);
    float _2216 = -_2190;
    float _2218 = _802 * _2216;
    float _2220 = _812 * _2190;
    float _2222 = fma(_830, _2106, _2196);
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = fma(_830, _2176, _2208);
    float _2230 = fma(_828, _2090, _2212);
    float _2232 = fma(_810, _2106, _2194);
    float _2234 = fma(_816, _2090, _2210);
    float _2236 = fma(_834, _2090, _2214);
    float _2238 = fma(_824, _2106, _2198);
    float _2240 = fma(_2226, -2.0, 3.0);
    float _2242 = fma(_810, _2176, _2218);
    float _2244 = fma(_824, _2176, _2220);
    float _2246 = _2226 * _2226;
    float _2248 = fma(_828, _2178, _2228);
    float _2250 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2252 = fma(_816, _2166, _2232);
    float _2254 = fma(_828, _2166, _2222);
    float _2256 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2258 = fma(_834, _2166, _2238);
    float _2260 = fma(_816, _2178, _2242);
    float _2262 = fma(_834, _2178, _2244);
    float _2264 = _2246 * _2240;
    float _2266 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2268 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2250);
    float _2270 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2272 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2256);
    float _2274 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2276 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2266);
    float _2278 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2270);
    float _2280 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2268);
    float _2282 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2274);
    float _2284 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2272);
    float _2286 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2288 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2290 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2292 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2278);
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2276);
    float _2296 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2282);
    float _2298 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2286);
    float _2300 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2288);
    float _2302 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2290);
    float _2304 = -_2264;
    float _2306 = _2304 + 1.0;
    float _2308 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_87.x = _2294;
    out.m_87.y = _2280;
    out.m_87.z = _2284;
    float _2310 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2302);
    float _2312 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2314 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2298);
    float _2316 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2300);
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2264);
    float _2320 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2308);
    float _2322 = exp2(_2312);
    float _2324 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2320);
    out.m_89.x = _2314;
    out.m_89.y = _2316;
    out.m_89.z = _2310;
    bool _2326 = _862 <= 8000.0;
    bool _2328 = isnan(_862);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(8000.0);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    float _2338 = _1938 + _1449;
    out.m_91.x = _2292;
    out.m_91.y = _2296;
    out.m_91.z = _2324;
    float _2340 = _2336 * _2318;
    float _2342 = _2336;
    float _2344 = _1481;
    float _2346 = 1.0;
    if (!_1427)
    {
        _2342 = 1.0;
    }
    float _2348 = _2342;
    out.m_93.x = 1.0;
    out.m_93.y = 1.0;
    out.m_93.z = 1.0;
    float _2350 = _2348;
    if (_1427)
    {
        bool _2352 = _1543 >= _1507;
        bool _2354 = isnan(_1543);
        bool _2356 = _2352 || _2354;
        bool _2358 = isnan(_1507);
        bool _2360 = _2356 || _2358;
        float _2362 = float(_2360);
        _2350 = _2362;
    }
    float _2364 = _2350;
    float _2366 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2368 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_1654);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    out.gl_Position.x = _1481;
    out.gl_Position.y = _1479;
    out.gl_Position.z = _1938;
    out.gl_Position.w = _1449;
    float _2378 = -_2322;
    float _2380 = _2378 + 1.0;
    float _2382 = _1930 * _2366;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = _2364 * _1632;
    float _2388 = _2338 * 0.5;
    float _2390 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2392 = -_2384;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2396 = _2390 * _1545;
    float _2398 = -_2390;
    float _2400 = _2398 + 1.0;
    out.m_95.z = _2388;
    out.m_95.w = _1449;
    float _2402 = -_2386;
    float _2404 = fma(_2402, _2394, 1.0);
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    float _2408 = _1556 * _2396;
    float _2410 = _1556 * _2400;
    float _2412 = _2406;
    float _2414 = _2384;
    float _2416 = _2408;
    if (!_2376)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2418 = _2344;
    float _2420 = _2406 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2422 = _2418;
    float _2424 = _2418;
    if (!_2376)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2426 = _2412;
    float _2428 = _2426;
    float _2430 = _2426;
    if (!_2376)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2432 = _2414;
    out.m_97.x = _2420;
    float _2434 = _2432;
    float _2436 = _2432;
    if (!_2376)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2438 = _2346;
    float _2440 = _1880 * _2396;
    float _2442 = fma(_1876, _2408, _1550);
    float _2444 = fma(_1878, _2408, _1552);
    out.m_99.x = _1884;
    out.m_99.y = _1886;
    out.m_99.z = _1888;
    float _2446 = fma(_1556, _2440, _1554);
    float _2448 = _1884;
    float _2450 = _2438;
    float _2452 = _2438;
    if (!_2376)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2454 = _2416;
    out.m_101.x = _2442;
    out.m_101.y = _2444;
    out.m_101.z = _2446;
    out.m_101.w = _2410;
    float _2456 = _2454;
    float _2458 = _2454;
    if (!_2376)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2460 = _2448;
    bool _2462 = !_2376;
    float _2464 = _2460;
    float _2466 = _2460;
    if (!_2462)
    {
        bool _2468 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2470 = isnan(_1654);
        bool _2472 = _2468 || _2470;
        bool _2474 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2476 = _2472 || _2474;
        if (!_2476)
        {
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2480 = _1654 + _2478;
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2490 = 1.0 / _2484;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2508 = _2480 * _2490;
            float _2510 = precise::clamp(_2508, 0.0, 1.0);
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2516 = fma(_2510, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2518 = fma(_2510, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2520 = fma(_2510, _2494, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2522 = fma(_2510, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2524 = fma(_2510, _2502, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2526 = fma(_2510, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2430 = _2520;
            _2458 = _2524;
            _2424 = _2516;
            _2452 = _2522;
            _2436 = _2518;
            _2466 = _2526;
            _2528 = true;
        }
        else
        {
            bool _2530 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2532 = isnan(_1654);
            bool _2534 = _2530 || _2532;
            bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2538 = _2534 || _2536;
            if (!_2538)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2540 = _2422;
            _2424 = _2540;
            if (!_2538)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2542 = _2428;
            _2430 = _2542;
            if (!_2538)
            {
                _2434 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2544 = _2434;
            _2436 = _2544;
            if (!_2538)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2546 = _2450;
            _2452 = _2546;
            if (!_2538)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2548 = _2456;
            _2458 = _2548;
            if (!_2538)
            {
                _2464 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2550 = _2464;
            bool _2552 = !_2538;
            _2466 = _2550;
            if (!_2552)
            {
                bool _2554 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2556 = isnan(_1654);
                bool _2558 = _2554 || _2556;
                bool _2560 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2562 = _2558 || _2560;
                if (!_2562)
                {
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2566 = _1654 + _2564;
                    float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2570 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2568;
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2576 = 1.0 / _2570;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2594 = _2566 * _2576;
                    float _2596 = precise::clamp(_2594, 0.0, 1.0);
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2602 = fma(_2596, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2604 = fma(_2596, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2606 = fma(_2596, _2580, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2596, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2610 = fma(_2596, _2588, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2612 = fma(_2596, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2430 = _2606;
                    _2458 = _2610;
                    _2424 = _2602;
                    _2452 = _2608;
                    _2436 = _2604;
                    _2466 = _2612;
                    _2528 = true;
                }
                else
                {
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2436 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2466 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2528 = false;
    float _2614 = _2430;
    float _2616 = _2458;
    float _2618 = _2424;
    float _2620 = _2452;
    float _2622 = _2436;
    float _2624 = _2466;
    float _2626 = fma(_2316, -0.5, 0.5);
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = -_2614;
    float _2632 = _2630 + _2616;
    float _2634 = -_2618;
    float _2636 = _2634 + _2620;
    float _2638 = -_2622;
    float _2640 = _2638 + _2624;
    bool _2642 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2644 = fma(_2628, _2632, _2614);
    float _2646 = fma(_2628, _2636, _2618);
    float _2648 = fma(_2628, _2640, _2622);
    float _2650 = _2644 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2652 = fma(_2646, 0.298911988735198974609375, _2650);
    float _2654 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2656 = fma(_2648, 0.114477999508380889892578125, _2652);
    out.m_97.w = _2654;
    float _2658 = -_2656;
    float _2660 = _2646 + _2658;
    float _2662 = -_2656;
    float _2664 = _2644 + _2662;
    float _2666 = -_2656;
    float _2668 = _2648 + _2666;
    out.m_103.x = 0.0;
    float _2670 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2672 = fma(_2664, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2674 = fma(_2668, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    out.m_105.x = _2670;
    out.m_105.y = _2672;
    out.m_105.z = _2674;
    if (!_2642)
    {
        return out;
    }
    float _2676 = -_1333;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2680 = -_1335;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2684 = -_1337;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2688 = _2678 * _2678;
    float _2690 = fma(_2682, _2682, _2688);
    float _2692 = fma(_2686, _2686, _2690);
    float _2694 = sqrt(_2692);
    float _2696 = rsqrt(_2692);
    float _2698 = -_2694;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2702 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = _2682 * _2696;
    float _2708 = _2678 * _2696;
    float _2710 = abs(_2704);
    float _2712 = log2(_2710);
    float _2714 = _2686 * _2696;
    float _2716 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2718 = _2316 * _2708;
    float _2720 = -_2708;
    float _2722 = -_2716;
    float _2724 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2722);
    float _2726 = fma(_2314, _2706, _2718);
    float _2728 = -_2714;
    float _2730 = fma(_2728, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2724);
    float _2732 = fma(_2310, _2714, _2726);
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2738 = _2730 + _2736;
    float _2740 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2742 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = exp2(_2740);
    float _2748 = _2746 * _2744;
    float _2750 = _2734 * _2748;
    float _2752 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2754 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2756 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2752;
    out.m_103.y = _2754;
    out.m_103.z = _2756;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2528 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
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
        out.m_61.x = 0.0;
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
        float _2813 = as_type<float>(_140);
        out.gl_Position.z = _2813;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_61.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2882 = as_type<float>(_178);
        out.gl_Position.z = _2882;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _182 = !_180;
    float _200;
    if (!_182)
    {
        float _184 = in.m_65.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        float _204 = float(_124);
        float _206 = 1.0 / _204;
        float _208 = _158 * _206;
        _200 = _208;
    }
    _202 = false;
    float _210 = _200;
    float _212 = in.m_58.x;
    float _214 = in.m_58.y;
    float _216 = in.m_58.z;
    float _218 = _214 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _220 = _214 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _222 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[4].x, _218);
    float _224 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[6].x, _220);
    float _226 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[4].z, _222);
    float _228 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[6].z, _224);
    float _230 = _226 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _232 = _228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _234 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _236 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _238 = floor(_234);
    float _240 = floor(_236);
    float _242 = -_238;
    float _244 = _234 + _242;
    float _246 = -_240;
    float _248 = _236 + _246;
    float2 _3009 = float2(_244, _248);
    float _250 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3009, float2(0.0), isnan(_3009)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3009, float2(0.0), isnan(_3009)), level(0.0)).x;
    float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _254 = log2(_252);
    float _256 = in.m_65.z;
    float _258 = in.m_65.y;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _264 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = in.m_65.x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = 1.0 / _262;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _286 = _284 != 0;
    float _288 = _254 * _158;
    float _290 = 1.0 / _266;
    float _292 = _214 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _210 + _294;
    float _298 = 1.0 / _272;
    float _300 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _304 = 1.0 + _302;
    float _306 = _258 + _256;
    float _308 = _296 * _274;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _210 + _310;
    float _314 = _256 * 2.0;
    float _316 = exp2(_288);
    float _318 = _268 * 2.0;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _210 + _320;
    float _324 = _306 + (-1.0);
    float _326 = _312 * _290;
    bool _328 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _330 = isnan(1.0);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _336 = _332 || _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _338;
    float _342 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _344 = 1.0 / _304;
    float _346 = _322 * _298;
    float _348 = _258 * 2.0;
    float _350 = _268 + _258;
    bool _352 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _360 = _356 || _358;
    float _362 = _268 + _256;
    float _364 = _350 + (-1.0);
    float _366 = floor(_318);
    float _368 = -_316;
    float _370 = _368 + 1.0;
    float _372 = _362 + (-1.0);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _376 = fma(_340, _346, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = _360 ? _370 : 0.0;
    float _380 = floor(_314);
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _384 = as_type<int>(_256);
    if (_336)
    {
        float _386 = _378 * _344;
        _162 = _386;
    }
    float _388 = _162;
    float _390 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = floor(_348);
    bool _402 = _366 > 0.0;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _408 = _366 >= 0.0;
    bool _410 = isnan(_366);
    bool _412 = _408 || _410;
    bool _414 = isnan(0.0);
    bool _416 = _412 || _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = fma(_398, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = fma(_406, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _426 = _416 ? 0 : 1;
    float _428 = fma(_420, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _430 = _380 >= 0.0;
    bool _432 = isnan(_380);
    bool _434 = _430 || _432;
    bool _436 = isnan(0.0);
    bool _438 = _434 || _436;
    float _440 = fma(_394, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _442 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _444 = isnan(_210);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = _390 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _456 = _380 > 0.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    int _462 = _438 ? 0 : 1;
    float _464 = -_452;
    float _466 = _464 + 1.0;
    bool _468 = _400 > 0.0;
    float _470 = fma(_460, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _472 = _400 >= 0.0;
    bool _474 = isnan(_400);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _486 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _488 = isnan(_210);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _500 = isnan(_210);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = fma(_484, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _512 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_210);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = _496 * _466;
    float _526 = -_496;
    float _528 = _526 + 1.0;
    float _530 = _522 * _528;
    float _532 = -_522;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _536;
    bool _540 = !_278;
    int _542 = _540 ? 0 : 1;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _544;
    float _548 = _508 * _534;
    float _550 = -_508;
    float _552 = _550 + 1.0;
    float _554 = fma(_538, _346, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _556 = fma(_546, _346, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _558 = _422 * _548;
    float _560 = _470 * _548;
    float _562 = _428 * _548;
    int _564 = _480 ? 0 : 1;
    float _566 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _558);
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _560);
    float _570 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _562);
    int _572 = ~_462;
    int _574 = _572 + 1;
    int _576 = _574 + 1;
    float _578 = in.m_67.x;
    float _580 = in.m_67.y;
    float _582 = in.m_67.z;
    int _584 = abs(_542);
    float _586 = fma(_424, _530, _566);
    int _588 = _576;
    if (!_456)
    {
        int _590 = ~_462;
        int _592 = _590 + 1;
        _588 = _592;
    }
    int _594 = _588;
    float _596 = fma(_510, _530, _568);
    int _598 = ~_426;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = fma(_440, _530, _570);
    int _606 = _602;
    if (!_402)
    {
        int _608 = ~_426;
        int _610 = _608 + 1;
        _606 = _610;
    }
    int _612 = _606;
    float _614 = fma(_554, _524, _586);
    float _616 = float(_584);
    float _618 = fma(_556, _524, _596);
    float _620 = float(_594);
    float _622 = fma(_376, _524, _604);
    bool _624 = !_282;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].x, _614);
    int _630 = ~_564;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = _616 * _620;
    int _638 = _634;
    if (!_468)
    {
        int _640 = ~_564;
        int _642 = _640 + 1;
        _638 = _642;
    }
    int _644 = _638;
    float _646 = _268 + (-0.5);
    int _648 = abs(_626);
    float _650 = _454 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _652 = !_286;
    int _654 = _652 ? 0 : 1;
    float _656 = _636 * (-2.0);
    float _658 = float(_612);
    float _660 = fma(_230, (*spvDescriptorSet0.vp_c8)._m0[11].x, _650);
    int _662 = abs(_654);
    float _664 = fma(_656, _578, _578);
    float _666 = float(_648);
    float _668 = fma(_232, (*spvDescriptorSet0.vp_c8)._m0[11].z, _660);
    float _670 = fma(_374, _656, _374);
    float _672 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[196].x, _664);
    float _674 = float(_644);
    float _676 = _666 * _658;
    float _678 = _668 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _680 = fma(_670, _388, _672);
    float _682 = _676 * (-2.0);
    float _684 = 1.0 / _678;
    float _686 = float(_662);
    float _688 = _680 * 0.15915493667125701904296875;
    float _690 = _258 + (-0.5);
    float _692 = fma(_682, _580, _580);
    float _694 = fma(_342, _682, _342);
    float _696 = _686 * _674;
    float _698 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].z, _622);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _702 = _688 * 6.283185482025146484375;
    float _704 = sin(_702);
    float _706 = _696 * (-2.0);
    float _708 = in.m_69.x;
    float _710 = in.m_69.y;
    float _712 = in.m_69.z;
    float _714 = fma(_694, _388, _700);
    float _716 = fma(_706, _582, _582);
    float _718 = _454 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _720 = _714 * 0.15915493667125701904296875;
    float _722 = _256 + (-0.5);
    float _724 = in.m_71.x;
    float _726 = in.m_71.y;
    float _728 = in.m_71.z;
    float _730 = fma(_230, (*spvDescriptorSet0.vp_c8)._m0[10].x, _718);
    float _732 = fma(_382, _706, _382);
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].z, _716);
    float _736 = _688 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = fma(_232, (*spvDescriptorSet0.vp_c8)._m0[10].z, _730);
    float _742 = fma(_732, _388, _734);
    float _744 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[146].y, _618);
    float _746 = _740 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _748 = _742 * 0.15915493667125701904296875;
    float _750 = _720 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _746 + _678;
    float _756 = _698 * _712;
    float _758 = _628 * _708;
    float _760 = _744 * _710;
    float _762 = _720 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = _754 * _684;
    float _768 = _766 * 0.5;
    float _770 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _776 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _780 = _748 * 6.283185482025146484375;
    float _782 = cos(_780);
    float _784 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[30].w, _786);
    float _790 = _772 * _770;
    float _792 = _774 * _776;
    float _794 = _738 * _752;
    float _796 = _778 * _784;
    float _798 = _704 * _752;
    float _800 = _748 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = _704 * _764;
    float _806 = _738 * _764;
    float _808 = _738 * _782;
    float _810 = _764 * _782;
    float _812 = _704 * _782;
    float _814 = 1.0 / _788;
    float _816 = _752 * _782;
    float _818 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _820 = _812 * _796;
    float _822 = -_794;
    float _824 = fma(_802, _804, _822);
    float _826 = -_804;
    float _828 = fma(_802, _794, _826);
    float _830 = fma(_802, _806, _798);
    float _832 = _808 * _796;
    float _834 = fma(_802, _798, _806);
    float _836 = -_796;
    float _838 = _802 * _836;
    float _840 = fma(_824, _792, _820);
    float _842 = fma(_830, _792, _832);
    float _844 = _454 + _818;
    float _846 = fma(_810, _792, _838);
    float _848 = fma(_828, _790, _842);
    float _850 = _844 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _852 = fma(_816, _790, _846);
    float _854 = fma(_834, _790, _840);
    float _856 = _848 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _858 = _848 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _862 = _814 * _860;
    float _864 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[126].x, _850);
    float _866 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[10].x, _856);
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[8].x, _858);
    float _870 = _844 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _872 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _874 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[10].z, _866);
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[8].z, _868);
    bool _878 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _880 = fma(_230, (*spvDescriptorSet0.vp_c15)._m0[127].x, _870);
    float _882 = _232 + _874;
    float _884 = _230 + _876;
    float _886 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[126].z, _864);
    float _888 = fma(_232, (*spvDescriptorSet0.vp_c15)._m0[127].z, _880);
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _892 = _882 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _896 = _884 + _894;
    bool _898 = !_872;
    int _900 = _898 ? 0 : 1;
    float _902 = _886 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _904 = _892 * _892;
    float _906 = _888 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _908 = trunc(_902);
    int _910 = int(_908);
    float _912 = fma(_896, _896, _904);
    int _914 = 2;
    float _916 = _912;
    float _918 = _884;
    float _920 = _882;
    float _922 = _896;
    if (!_872)
    {
        _914 = 1;
    }
    int _924 = _914;
    int _926 = _924;
    if (!_878)
    {
        _926 = _900;
    }
    int _928 = _926;
    float _930 = sqrt(_912);
    int _932 = _928 << 6;
    int _934 = _932 + 96;
    uint _937 = uint(int(uint(_934) >> uint(2)));
    uint _939 = uint(int(uint(int(_937)) >> uint(2)));
    int _941 = int(_937) & 3;
    float _943 = (*spvDescriptorSet0.vp_c15)._m0[int(_939)][_941];
    int _945 = int(_937) + 1;
    uint _947 = uint(int(uint(_945) >> uint(2)));
    int _949 = _945 & 3;
    float _951 = (*spvDescriptorSet0.vp_c15)._m0[int(_947)][_949];
    float _953 = trunc(_906);
    int _955 = int(_953);
    int _957 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _959 = _910 + _957;
    int _961 = _959 + 1;
    int _963 = _932 + 104;
    uint _965 = uint(int(uint(_963) >> uint(2)));
    uint _967 = uint(int(uint(int(_965)) >> uint(2)));
    int _969 = int(_965) & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    int _973 = int(_965) + 1;
    uint _975 = uint(int(uint(_973) >> uint(2)));
    int _977 = _973 & 3;
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[int(_975)][_977];
    bool _981 = _961 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _983 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _987 = _930 + _985;
    int _989 = _932 + 48;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    int _1007 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1009 = _955 + _1007;
    int _1011 = _1009 + 1;
    int _1013 = _961 | _1011;
    int _1015 = _932 + 64;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    uint _1019 = uint(int(uint(int(_1017)) >> uint(2)));
    int _1021 = int(_1017) & 3;
    float _1023 = (*spvDescriptorSet0.vp_c15)._m0[int(_1019)][_1021];
    int _1025 = int(_1017) + 1;
    uint _1027 = uint(int(uint(_1025) >> uint(2)));
    int _1029 = _1025 & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    float _1033 = 0.0;
    int _1035 = _961;
    if (_983)
    {
        float _1037 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1033 = _1037;
    }
    float _1039 = _1033;
    bool _1041 = _1013 < 0;
    bool _1043 = _1041 || _981;
    bool _1045 = _1011 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1047 = _1045 || _1043;
    int _1049 = _932 + 56;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    uint _1053 = uint(int(uint(int(_1051)) >> uint(2)));
    int _1055 = int(_1051) & 3;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[int(_1053)][_1055];
    int _1059 = int(_1051) + 1;
    uint _1061 = uint(int(uint(_1059) >> uint(2)));
    int _1063 = _1059 & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    if (_983)
    {
        float _1067 = rsqrt(_912);
        _916 = _1067;
    }
    float _1069 = _916;
    bool _1071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1073 = isnan(0.5);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1079 = _1075 || _1077;
    int _1081 = _932 + 72;
    uint _1083 = uint(int(uint(_1081) >> uint(2)));
    uint _1085 = uint(int(uint(int(_1083)) >> uint(2)));
    int _1087 = int(_1083) & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    int _1091 = int(_1083) + 1;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    int _1095 = _1091 & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    float _1099 = _1039;
    float _1101 = _1069;
    if (_983)
    {
        float _1103 = _987 * _1039;
        _1099 = _1103;
    }
    float _1105 = _1099;
    float _1107 = _1105;
    if (!_1047)
    {
        int _1109 = _1011 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1111 = _1109 + _961;
        _1035 = _1111;
    }
    int _1113 = _1035;
    float _1115 = _848 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_983)
    {
        float _1117 = _1105 * 0.15915493667125701904296875;
        _1107 = _1117;
    }
    float _1119 = _1107;
    int _1121 = _932 + 80;
    uint _1123 = uint(int(uint(_1121) >> uint(2)));
    uint _1125 = uint(int(uint(int(_1123)) >> uint(2)));
    int _1127 = int(_1123) & 3;
    float _1129 = (*spvDescriptorSet0.vp_c15)._m0[int(_1125)][_1127];
    int _1131 = int(_1123) + 1;
    uint _1133 = uint(int(uint(_1131) >> uint(2)));
    int _1135 = _1131 & 3;
    float _1137 = (*spvDescriptorSet0.vp_c15)._m0[int(_1133)][_1135];
    float _1139 = fma(_852, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1115);
    int _1141 = 0;
    if (!_1047)
    {
        int _1143 = _1113 << 2;
        _1141 = _1143;
    }
    int _1145 = _1141;
    float _1147 = _1115;
    int _1149 = _1145;
    if (_983)
    {
        float _1151 = _1119 * 6.283185482025146484375;
        float _1153 = sin(_1151);
        _1147 = _1153;
    }
    float _1155 = _1147;
    float _1157 = _844 * _951;
    float _1159 = fma(_854, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1139);
    int _1161 = as_type<int>(_951);
    int _1163 = as_type<int>(_1159);
    if (!_1047)
    {
        uint _1165 = uint(int(uint(_1113) >> uint(2)));
        _1161 = int(_1165);
    }
    int _1167 = _1161;
    float _1169 = as_type<float>(_1167);
    if (!_1047)
    {
        int _1171 = 12 & _1145;
        _1149 = _1171;
    }
    int _1173 = _1149;
    float _1175 = _454 + _1159;
    float _1177 = fma(_230, _943, _1157);
    float _1179 = _854;
    if (_983)
    {
        float _1181 = _1119 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        _1179 = _1183;
    }
    float _1185 = _1179;
    if (!_1047)
    {
        int _1187 = _1167 << 4;
        int _1189 = _1187 + _1173;
        _1163 = _1189;
    }
    int _1191 = _1163;
    float _1193 = as_type<float>(_1191);
    if (_983)
    {
        float _1195 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1169 = _1195;
    }
    float _1197 = _1169;
    float _1199 = fma(_232, _971, _1177);
    float _1201 = _844 * _1005;
    float _1203 = _1155;
    float _1205 = _979;
    float _1207 = _1201;
    float _1209 = _1005;
    if (_983)
    {
        float _1211 = fma(_1155, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1203 = _1211;
    }
    float _1213 = _1203;
    float _1215 = _1199 + _979;
    float _1217 = fma(_230, _997, _1201);
    float _1219 = _1177;
    if (!_1047)
    {
        float _1221 = floor(_902);
        _1219 = _1221;
    }
    float _1223 = _1219;
    if (_983)
    {
        float _1225 = _1069 * _1213;
        _1101 = _1225;
    }
    float _1227 = _1101;
    float _1229 = _844 * _1031;
    float _1231 = _1065;
    if (!_983)
    {
        _1205 = _1175;
    }
    float _1233 = _1205;
    float _1235 = _1233;
    if (_983)
    {
        float _1237 = _1185 + (-1.0);
        _1207 = _1237;
    }
    float _1239 = _1207;
    float _1241 = fma(_230, _1023, _1229);
    if (_983)
    {
        float _1243 = fma(_896, _1227, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _918 = _1243;
    }
    float _1245 = _918;
    float _1247 = 1.0 / _1215;
    if (_983)
    {
        float _1249 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1209 = _1249;
    }
    float _1251 = _1209;
    float _1253 = fma(_232, _1057, _1217);
    float _1255 = _1253;
    if (_983)
    {
        float _1257 = fma(_892, _1227, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _920 = _1257;
    }
    float _1259 = _920;
    if (_983)
    {
        float _1261 = fma(_1175, _1185, _1251);
        _1235 = _1261;
    }
    float _1263 = _1235;
    float _1265 = _1253 + _1065;
    if (_1079)
    {
        _1255 = _1245;
    }
    float _1267 = _1255;
    float _1269 = _1267;
    if (_1079)
    {
        _922 = _1259;
    }
    float _1271 = _922;
    float _1273 = fma(_232, _1089, _1241);
    float _1275 = _1271;
    if (_1079)
    {
        _1231 = _1263;
    }
    float _1277 = _1231;
    float _1279 = _1273 + _1097;
    float _1281 = _1277;
    if (!_1079)
    {
        float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1285 = _454 + _1283;
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1289 = _230 + _1287;
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1293 = _1285 * _1285;
        float _1295 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1297 = _232 + _1295;
        float _1299 = fma(_1289, _1289, _1293);
        float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1303 = fma(_1297, _1297, _1299);
        float _1305 = sqrt(_1303);
        float _1307 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1309 = -_232;
        float _1311 = _1309 + _1259;
        float _1313 = precise::min(_1305, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1315 = _1313 * _1301;
        float _1317 = -_454;
        float _1319 = _1317 + _1263;
        float _1321 = _1307 * _1315;
        float _1323 = -_230;
        float _1325 = _1323 + _1245;
        float _1327 = fma(_1319, _1321, _454);
        float _1329 = fma(_1325, _1321, _230);
        float _1331 = fma(_1311, _1321, _232);
        _1281 = _1327;
        _1269 = _1329;
        _1275 = _1331;
    }
    float _1333 = _1281;
    float _1335 = _1269;
    float _1337 = _1275;
    int _1339 = _932 + 88;
    uint _1341 = uint(int(uint(_1339) >> uint(2)));
    uint _1343 = uint(int(uint(int(_1341)) >> uint(2)));
    int _1345 = int(_1341) & 3;
    float _1347 = (*spvDescriptorSet0.vp_c15)._m0[int(_1343)][_1345];
    int _1349 = int(_1341) + 1;
    uint _1351 = uint(int(uint(_1349) >> uint(2)));
    int _1353 = _1349 & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    float _1357 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1359 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1361 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1363 = _1265 * _1247;
    float _1365 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1357);
    float _1367 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1359);
    float _1369 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1361);
    float _1371 = _892;
    float _1373 = _1363;
    if (!_1047)
    {
        int _1375 = _1191 + 400;
        uint _1377 = uint(int(uint(_1375) >> uint(2)));
        uint _1379 = uint(int(uint(int(_1377)) >> uint(2)));
        int _1381 = int(_1377) & 3;
        float _1383 = (*spvDescriptorSet0.vp_c15)._m0[int(_1379)][_1381];
        _1371 = _1383;
    }
    float _1385 = _1371;
    float _1387 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1365);
    bool _1389 = _1363 >= 0.0;
    float _1391 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1367);
    float _1393 = _1333 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1395 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1369);
    float _1397 = _1387 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1399 = _1279 * _1247;
    bool _1401 = _1363 <= 1.0;
    bool _1403 = _1401 && _1389;
    float _1405 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1407 = fma(_1335, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1393);
    float _1409 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1411 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1413 = _1399 >= 0.0;
    bool _1415 = _1413 && _1403;
    float _1417 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1419 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1421 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1407);
    float _1423 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1411);
    bool _1425 = _1399 <= 1.0;
    bool _1427 = _1425 && _1415;
    float _1429 = _1185;
    if (!_1047)
    {
        float _1431 = floor(_906);
        _1429 = _1431;
    }
    float _1433 = _1429;
    float _1435 = -_1419;
    float _1437 = fma(_1435, _1417, 1.0);
    float _1439 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1441 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1423);
    float _1443 = _844 * _1137;
    float _1445 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1449 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1441);
    float _1451 = fma(_230, _1129, _1443);
    float _1453 = log2(_1437);
    float _1455 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1457 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1447);
    float _1459 = _1433;
    if (_1427)
    {
        float _1461 = float(_928);
        _1193 = _1461;
    }
    float _1463 = _1193;
    float _1465 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1455);
    float _1467 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1457);
    float _1469 = _1467;
    if (!_1047)
    {
        float _1471 = -_1433;
        float _1473 = _906 + _1471;
        _1459 = _1473;
    }
    float _1475 = _1459;
    float _1477 = 1.0 / _1449;
    float _1479 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1465);
    float _1481 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1467);
    if (!_1047)
    {
        float _1483 = -_1223;
        float _1485 = _902 + _1483;
        _1469 = _1485;
    }
    float _1487 = _1469;
    float _1489 = fma(_232, _1347, _1451);
    float _1491 = _1489 + _1355;
    float _1493 = _1447;
    if (_1427)
    {
        float _1495 = rint(_1463);
        float _1497 = precise::max(_1495, 0.0);
        uint _1499 = uint(_1497);
        uint _1501 = clamp(_1499, 0u, 65535u);
        _1493 = as_type<float>(_1501);
    }
    float _1503 = _1493;
    float _1505 = _1453 * 0.693147182464599609375;
    float _1507 = _1491 * _1247;
    float _1509 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1511 = _1481 * _1477;
    float _1513 = _1491;
    float _1515 = _1477;
    float _1517 = _1385;
    if (!_1047)
    {
        float _1519 = rint(_1385);
        float _1521 = precise::max(_1519, 0.0);
        uint _1523 = uint(_1521);
        uint _1525 = clamp(_1523, 0u, 65535u);
        _1513 = as_type<float>(_1525);
    }
    float _1527 = _1513;
    float _1529 = _1479 * _1477;
    float _1531 = fma(_1511, 0.5, 0.5);
    float _1533 = fma(_1529, -0.5, 0.5);
    float _1535 = _1443;
    float _1537 = _1503;
    float _1539 = _1531;
    if (_1427)
    {
        float3 _5078 = float3(_1363, _1399, float(as_type<int>(_1503)));
        float3 _5082 = select(_5078, float3(0.0), isnan(_5078));
        float _1541 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5082.xy, uint(rint(_5082.z)), _1507, level(0.0));
        _1535 = _1541;
    }
    float _1543 = _1535;
    float3 _5092 = float3(_1531, _1533, _1509);
    float _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5092, float3(0.0), isnan(_5092)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5092, float3(0.0), isnan(_5092)), level(0.0)).x;
    float3 _5101 = float3(_1531, _1533, _1509);
    float4 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5101, float3(0.0), isnan(_5101)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5101, float3(0.0), isnan(_5101)), level(0.0)).xyzw;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _1548.w;
    float _1558 = _902;
    if (!_1047)
    {
        float3 _5124 = float3(_1487, _1475, float(as_type<int>(_1527)));
        float3 _5126 = select(_5124, float3(0.0), isnan(_5124));
        float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5126.xy, uint(rint(_5126.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5126.xy, uint(rint(_5126.z)), level(0.0)).x;
        _1558 = _1560;
    }
    float _1562 = _1558;
    if (_1047)
    {
        _1515 = 1.0;
    }
    float _1564 = _1515;
    float _1566 = _1564;
    if (!_1047)
    {
        int _1568 = _1113 << 4;
        int _1570 = _1568 + 2048;
        uint _1572 = uint(int(uint(_1570) >> uint(2)));
        uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
        int _1576 = int(_1572) & 3;
        float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
        int _1580 = int(_1572) + 1;
        uint _1582 = uint(int(uint(_1580) >> uint(2)));
        int _1584 = _1580 & 3;
        float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
        int _1588 = _1570 + 8;
        uint _1590 = uint(int(uint(_1588) >> uint(2)));
        uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
        int _1594 = int(_1590) & 3;
        float _1596 = (*spvDescriptorSet0.vp_c15)._m0[int(_1592)][_1594];
        int _1598 = int(_1590) + 1;
        uint _1600 = uint(int(uint(_1598) >> uint(2)));
        int _1602 = _1598 & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        float _1606 = _844 * _1586;
        float _1608 = fma(_230, _1578, _1606);
        float _1610 = fma(_232, _1596, _1608);
        float _1612 = _1610 + _1604;
        float _1614 = precise::clamp(_1612, 0.0, 1.0);
        float _1616 = -_1614;
        float _1618 = _1616 + _1562;
        float _1620 = fma(_1618, 500.0, 1.5);
        float _1622 = exp2(_1620);
        float _1624 = 0.0 + _1622;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        _1373 = _1604;
        _1537 = _1596;
        _1566 = _1626;
    }
    float _1628 = _1373;
    float _1630 = _1537;
    float _1632 = _1566;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = _1333 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1640 = _1335 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1644 = _1337 + _1642;
    float _1646 = _1636 * _1636;
    float _1648 = fma(_1640, _1640, _1646);
    float _1650 = fma(_1644, _1644, _1648);
    float _1652 = rsqrt(_1650);
    float _1654 = sqrt(_1650);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1658 = _1640 * _1656;
    float _1660 = _1644 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 * _1660;
    float _1666 = _1662 + _1664;
    float _1668 = sqrt(_1666);
    bool _1670 = _1668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1668 + _1672;
    float _1676 = _1652;
    float _1678 = _1630;
    float _1680 = _1674;
    float _1682 = _1628;
    float _1684 = _1636;
    if (_1670)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1686;
    }
    float _1688 = _1676;
    if (_1670)
    {
        float _1690 = rsqrt(_1666);
        _1678 = _1690;
    }
    float _1692 = _1678;
    float _1694 = _1692;
    if (_1670)
    {
        float _1696 = _1674 * _1688;
        _1680 = _1696;
    }
    float _1698 = _1680;
    if (_1670)
    {
        float _1700 = _1698 * 0.15915493667125701904296875;
        _1682 = _1700;
    }
    float _1702 = _1682;
    float _1704 = _1644;
    if (_1670)
    {
        float _1706 = _1702 * 6.283185482025146484375;
        float _1708 = sin(_1706);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1714 = precise::max(0.0, _1712);
    float _1716 = _1688;
    float _1718 = _1714;
    if (_1670)
    {
        float _1720 = _1702 * 6.283185482025146484375;
        float _1722 = cos(_1720);
        _1716 = _1722;
    }
    float _1724 = _1716;
    float _1726 = -_1656;
    float _1728 = -_1714;
    float _1730 = fma(_1636, _1726, _1728);
    if (_1670)
    {
        float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1732;
    }
    float _1734 = _1684;
    float _1736 = _1734;
    float _1738 = _1710;
    if (_1670)
    {
        float _1740 = fma(_1710, _1734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = _1742;
    if (!_1670)
    {
        _1738 = _1658;
    }
    float _1746 = _1738;
    float _1748 = _1746;
    float _1750 = _1724;
    if (_1670)
    {
        float _1752 = _1724 + (-1.0);
        _1718 = _1752;
    }
    float _1754 = _1718;
    float _1756 = _1754;
    if (_1670)
    {
        float _1758 = _1692 * _1742;
        _1517 = _1758;
    }
    float _1760 = _1517;
    if (!_1670)
    {
        _1744 = _1730;
    }
    float _1762 = _1744;
    float _1764 = _1762;
    if (_1670)
    {
        float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1539 = _1766;
    }
    float _1768 = _1539;
    if (_1670)
    {
        float _1770 = _1658 * _1760;
        _1748 = _1770;
    }
    float _1772 = _1748;
    if (!_1670)
    {
        _1756 = _1660;
    }
    float _1774 = _1756;
    float _1776 = _1774;
    if (_1670)
    {
        float _1778 = _1660 * _1760;
        _1776 = _1778;
    }
    float _1780 = _1776;
    if (!_1670)
    {
        _1694 = _1662;
    }
    float _1782 = _1694;
    float _1784 = _1782;
    if (_1670)
    {
        float _1786 = fma(_1730, _1724, _1768);
        _1764 = _1786;
    }
    float _1788 = _1764;
    if (_1670)
    {
        float _1790 = _1772 * _1772;
        _1784 = _1790;
    }
    float _1792 = _1784;
    if (!_1670)
    {
        _1750 = _1664;
    }
    float _1794 = _1750;
    float _1796 = _1794;
    if (_1670)
    {
        float _1798 = _1780 * _1780;
        _1796 = _1798;
    }
    float _1800 = _1796;
    float _1802 = fma(_1788, _1788, _1792);
    float _1804 = _1802 + _1800;
    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1808 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1806);
    float _1810 = precise::clamp(_1808, 0.0, 1.0);
    float _1812 = rsqrt(_1804);
    float _1814 = -_1810;
    float _1816 = _1814 + 1.0;
    float _1818 = abs(_1816);
    float _1820 = log2(_1818);
    float _1822 = _1812 * _1772;
    float _1824 = _1812 * _1788;
    float _1826 = _1812 * _1780;
    float _1828 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1830 = -_1828;
    float _1832 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1830);
    float _1834 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1836 = -_1826;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1832);
    float _1840 = exp2(_1834);
    float _1842 = fma(_1838, -0.5, 0.5);
    float _1844 = fma(_1838, 0.5, 0.5);
    float _1846 = _1824 + 1.0;
    float _1848 = fma(_1844, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = sqrt(_1842);
    float _1852 = fma(_1844, _1848, -0.212114393711090087890625);
    float _1854 = fma(_1844, _1852, 1.570728778839111328125);
    float _1856 = -_1824;
    float _1858 = fma(_1840, _1846, _1856);
    float _1860 = fma(_1259, 6.2500002968590706586837768554688e-05, 0.5);
    float _1862 = fma(_1858, 0.5, 0.5);
    float _1864 = fma(_1245, 6.2500002968590706586837768554688e-05, 0.5);
    float _1866 = _1850 * 0.636619746685028076171875;
    float _1868 = -_1854;
    float _1870 = fma(_1866, _1868, 1.0);
    float2 _5607 = float2(_1870, _1862);
    float3 _1874 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5607, float2(0.0), isnan(_5607)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5607, float2(0.0), isnan(_5607)), level(0.0)).xyz;
    float _1876 = _1874.x;
    float _1878 = _1874.y;
    float _1880 = _1874.z;
    float2 _5621 = float2(_1864, _1860);
    float3 _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5621, float2(0.0), isnan(_5621)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5621, float2(0.0), isnan(_5621)), level(0.0)).xyz;
    float _1884 = _1882.x;
    float _1886 = _1882.y;
    float _1888 = _1882.z;
    float _1890 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1892 = in.m_73.y;
    float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1896 = _258 > 0.5;
    float _1898 = _1890 * _268;
    float _1900 = in.m_65.w;
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1904 = _1902 != 0;
    float _1906 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1910 = _1908 != 0;
    float _1912 = in.m_73.x;
    float _1914 = trunc(_1898);
    int _1916 = int(_1914);
    int _1918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1920 = _1918 != 0;
    float _1922 = fma(_1409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1906);
    int _1924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1926 = _1924 != 0;
    float _1928 = -_250;
    float _1930 = _1928 + 1.0;
    float _1932 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1922);
    float _1934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1938 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1932);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_75.x = _1335;
    out.m_75.y = _1333;
    out.m_75.z = _1337;
    float _1942 = -_1892;
    float _1944 = _1942 + 1.0;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1948 = _1916 << 4;
    int _1950 = _1948 + 1712;
    float _1952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1954 = _1900 > 0.5;
    uint _1956 = uint(int(uint(_1950) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = in.m_77.x;
    float _1974 = in.m_77.y;
    float _1976 = in.m_77.z;
    int _1978 = _1954 ? as_type<int>(_1944) : as_type<int>(_1892);
    bool _1980 = _1954;
    float _1982 = _1892;
    bool _1984 = _1920;
    int _1986 = as_type<int>(_1940);
    if (_1910)
    {
        bool _1988 = _268 > 0.5;
        _1980 = _1988;
    }
    bool _1990 = _1980;
    float _1992 = _1904 ? as_type<float>(_1978) : _1892;
    int _1994 = _1950 + 8;
    uint _1996 = uint(int(uint(_1994) >> uint(2)));
    uint _1998 = uint(int(uint(int(_1996)) >> uint(2)));
    int _2000 = int(_1996) & 3;
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[int(_1998)][_2000];
    bool _2004 = _726 != 0.0;
    bool _2006 = isnan(_726);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.0);
    bool _2012 = _2008 || _2010;
    if (_1920)
    {
        float _2014 = _1896 ? _1944 : _1892;
        _1982 = _2014;
    }
    float _2016 = _1982;
    bool _2018 = _724 == 0.0;
    bool _2020 = !_2012;
    bool _2022 = _2018 && _2020;
    float _2024 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2026 = _728 == 0.0;
    bool _2028 = _2026 && _2022;
    float _2030 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1926)
    {
        bool _2032 = _256 > 0.5;
        _1984 = _2032;
    }
    bool _2034 = _1984;
    float _2036 = _1912;
    if (_1910)
    {
        float _2038 = -_1912;
        float _2040 = _2038 + 1.0;
        _384 = as_type<int>(_2040);
    }
    int _2042 = _384;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2046 = 0.0;
    if (!_1910)
    {
        _2046 = _1912;
    }
    float _2048 = _2046;
    float _2050 = _2048;
    if (_1926)
    {
        float _2052 = -_1912;
        float _2054 = _2052 + 1.0;
        _1986 = as_type<int>(_2054);
    }
    int _2056 = _1986;
    if (_1910)
    {
        float _2058 = _1990 ? as_type<float>(_2042) : _1912;
        _2050 = _2058;
    }
    float _2060 = _2050;
    float _2062 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2064 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1926)
    {
        float _2066 = _2034 ? as_type<float>(_2056) : _1912;
        _2036 = _2066;
    }
    float _2068 = _2036;
    float _2070 = 0.0;
    if (_2028)
    {
        _2070 = _1974;
    }
    float _2072 = _2070;
    out.m_79.x = _2062;
    out.m_79.y = _2024;
    out.m_79.z = _2030;
    float _2074 = 0.0;
    float _2076 = _2072;
    if (_2028)
    {
        _2074 = _1972;
    }
    float _2078 = _2074;
    float _2080 = 0.0;
    float _2082 = _2078;
    if (_2028)
    {
        _2080 = _1976;
    }
    float _2084 = _2080;
    float _2086 = in.m_81.x;
    float _2088 = in.m_81.y;
    float _2090 = in.m_81.z;
    float _2092 = in.m_81.w;
    float _2094 = 0.0;
    float _2096 = _2084;
    if (_2028)
    {
        _2094 = _2078;
    }
    float _2098 = _2094;
    float _2100 = _2098;
    if (!_2028)
    {
        _2082 = _1972;
    }
    float _2102 = _2082;
    if (!_2028)
    {
        float _2104 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2102);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2110 = _1970 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2112 = _1962 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2114 = _2108 * _2064;
    float _2116 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2118 = _2110;
    float _2120 = _2112;
    if (_2028)
    {
        _2118 = _2072;
    }
    float _2122 = _2118;
    float _2124 = _2122;
    if (!_2028)
    {
        _2076 = _1974;
    }
    float _2126 = _2076;
    float _2128 = _2002 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2130 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2028)
    {
        _2120 = _2084;
    }
    float _2132 = _2120;
    float _2134 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2136 = _2132;
    if (!_2028)
    {
        float _2138 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2126);
        _2124 = _2138;
    }
    float _2140 = _2124;
    float _2142 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2144 = _2128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2028)
    {
        _2096 = _1976;
    }
    float _2146 = _2096;
    float _2148 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2150 = _2142 * _1894;
    float _2152 = _2086 * _2126;
    float _2154 = abs(_862);
    float _2156 = log2(_2154);
    out.m_83.x = _2130;
    out.m_83.y = _2116;
    out.m_83.z = _2144;
    out.m_83.w = _1946;
    float _2158 = _2088 * _2146;
    float _2160 = _2134 * _1934;
    float _2162 = _2148 * _1952;
    if (!_2028)
    {
        float _2164 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2136 = _2164;
    }
    float _2166 = _2136;
    float _2168 = -_2158;
    float _2170 = fma(_2090, _2126, _2168);
    float _2172 = -_2152;
    float _2174 = fma(_2088, _2102, _2172);
    out.m_85.x = _2150;
    out.m_85.y = _2160;
    out.m_85.z = _2162;
    out.m_85.w = _2114;
    float _2176 = _2170 * _2092;
    float _2178 = _2174 * _2092;
    float _2180 = _2090 * _2102;
    float _2182 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2184 = -_2180;
    float _2186 = fma(_2086, _2146, _2184);
    float _2188 = exp2(_2182);
    float _2190 = _2186 * _2092;
    float _2192 = -_2140;
    float _2194 = _802 * _2192;
    float _2196 = _808 * _2140;
    float _2198 = _812 * _2140;
    float _2200 = -_2088;
    float _2202 = _802 * _2200;
    float _2204 = _808 * _2088;
    float _2206 = _812 * _2088;
    float _2208 = _808 * _2190;
    float _2210 = fma(_810, _2086, _2202);
    float _2212 = fma(_830, _2086, _2204);
    float _2214 = fma(_824, _2086, _2206);
    float _2216 = -_2190;
    float _2218 = _802 * _2216;
    float _2220 = _812 * _2190;
    float _2222 = fma(_830, _2106, _2196);
    float _2224 = fma(_2188, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = fma(_830, _2176, _2208);
    float _2230 = fma(_828, _2090, _2212);
    float _2232 = fma(_810, _2106, _2194);
    float _2234 = fma(_816, _2090, _2210);
    float _2236 = fma(_834, _2090, _2214);
    float _2238 = fma(_824, _2106, _2198);
    float _2240 = fma(_2226, -2.0, 3.0);
    float _2242 = fma(_810, _2176, _2218);
    float _2244 = fma(_824, _2176, _2220);
    float _2246 = _2226 * _2226;
    float _2248 = fma(_828, _2178, _2228);
    float _2250 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2252 = fma(_816, _2166, _2232);
    float _2254 = fma(_828, _2166, _2222);
    float _2256 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2258 = fma(_834, _2166, _2238);
    float _2260 = fma(_816, _2178, _2242);
    float _2262 = fma(_834, _2178, _2244);
    float _2264 = _2246 * _2240;
    float _2266 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2268 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2250);
    float _2270 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2272 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2256);
    float _2274 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2276 = fma(_2234, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2266);
    float _2278 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2270);
    float _2280 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2268);
    float _2282 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2274);
    float _2284 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2272);
    float _2286 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2288 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2290 = _2254 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2292 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2278);
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2276);
    float _2296 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2282);
    float _2298 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2286);
    float _2300 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2288);
    float _2302 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2290);
    float _2304 = -_2264;
    float _2306 = _2304 + 1.0;
    float _2308 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_87.x = _2294;
    out.m_87.y = _2280;
    out.m_87.z = _2284;
    float _2310 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2302);
    float _2312 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2314 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2298);
    float _2316 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2300);
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2264);
    float _2320 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2308);
    float _2322 = exp2(_2312);
    float _2324 = fma(_2262, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2320);
    out.m_89.x = _2314;
    out.m_89.y = _2316;
    out.m_89.z = _2310;
    bool _2326 = _862 <= 8000.0;
    bool _2328 = isnan(_862);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(8000.0);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    float _2338 = _1938 + _1449;
    out.m_91.x = _2292;
    out.m_91.y = _2296;
    out.m_91.z = _2324;
    float _2340 = _2336 * _2318;
    float _2342 = _2336;
    float _2344 = _1481;
    float _2346 = 1.0;
    if (!_1427)
    {
        _2342 = 1.0;
    }
    float _2348 = _2342;
    out.m_93.x = 1.0;
    out.m_93.y = 1.0;
    out.m_93.z = 1.0;
    float _2350 = _2348;
    if (_1427)
    {
        bool _2352 = _1543 >= _1507;
        bool _2354 = isnan(_1543);
        bool _2356 = _2352 || _2354;
        bool _2358 = isnan(_1507);
        bool _2360 = _2356 || _2358;
        float _2362 = float(_2360);
        _2350 = _2362;
    }
    float _2364 = _2350;
    float _2366 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2368 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_1654);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    out.gl_Position.x = _1481;
    out.gl_Position.y = _1479;
    out.gl_Position.z = _1938;
    out.gl_Position.w = _1449;
    float _2378 = -_2322;
    float _2380 = _2378 + 1.0;
    float _2382 = _1930 * _2366;
    float _2384 = precise::clamp(_2382, 0.0, 1.0);
    float _2386 = _2364 * _1632;
    float _2388 = _2338 * 0.5;
    float _2390 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2392 = -_2384;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2396 = _2390 * _1545;
    float _2398 = -_2390;
    float _2400 = _2398 + 1.0;
    out.m_95.z = _2388;
    out.m_95.w = _1449;
    float _2402 = -_2386;
    float _2404 = fma(_2402, _2394, 1.0);
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    float _2408 = _1556 * _2396;
    float _2410 = _1556 * _2400;
    float _2412 = _2406;
    float _2414 = _2384;
    float _2416 = _2408;
    if (!_2376)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2418 = _2344;
    float _2420 = _2406 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2422 = _2418;
    float _2424 = _2418;
    if (!_2376)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2426 = _2412;
    float _2428 = _2426;
    float _2430 = _2426;
    if (!_2376)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2432 = _2414;
    out.m_97.x = _2420;
    float _2434 = _2432;
    float _2436 = _2432;
    if (!_2376)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2438 = _2346;
    float _2440 = _1880 * _2396;
    float _2442 = fma(_1876, _2408, _1550);
    float _2444 = fma(_1878, _2408, _1552);
    out.m_99.x = _1884;
    out.m_99.y = _1886;
    out.m_99.z = _1888;
    float _2446 = fma(_1556, _2440, _1554);
    float _2448 = _1884;
    float _2450 = _2438;
    float _2452 = _2438;
    if (!_2376)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2454 = _2416;
    out.m_101.x = _2442;
    out.m_101.y = _2444;
    out.m_101.z = _2446;
    out.m_101.w = _2410;
    float _2456 = _2454;
    float _2458 = _2454;
    if (!_2376)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2460 = _2448;
    bool _2462 = !_2376;
    float _2464 = _2460;
    float _2466 = _2460;
    if (!_2462)
    {
        bool _2468 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2470 = isnan(_1654);
        bool _2472 = _2468 || _2470;
        bool _2474 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2476 = _2472 || _2474;
        if (!_2476)
        {
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2480 = _1654 + _2478;
            float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2484 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2482;
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2490 = 1.0 / _2484;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2508 = _2480 * _2490;
            float _2510 = precise::clamp(_2508, 0.0, 1.0);
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2516 = fma(_2510, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2518 = fma(_2510, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2520 = fma(_2510, _2494, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2522 = fma(_2510, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2524 = fma(_2510, _2502, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2526 = fma(_2510, _2506, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2430 = _2520;
            _2458 = _2524;
            _2424 = _2516;
            _2452 = _2522;
            _2436 = _2518;
            _2466 = _2526;
            _2528 = true;
        }
        else
        {
            bool _2530 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2532 = isnan(_1654);
            bool _2534 = _2530 || _2532;
            bool _2536 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2538 = _2534 || _2536;
            if (!_2538)
            {
                _2422 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2540 = _2422;
            _2424 = _2540;
            if (!_2538)
            {
                _2428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2542 = _2428;
            _2430 = _2542;
            if (!_2538)
            {
                _2434 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2544 = _2434;
            _2436 = _2544;
            if (!_2538)
            {
                _2450 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2546 = _2450;
            _2452 = _2546;
            if (!_2538)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2548 = _2456;
            _2458 = _2548;
            if (!_2538)
            {
                _2464 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2550 = _2464;
            bool _2552 = !_2538;
            _2466 = _2550;
            if (!_2552)
            {
                bool _2554 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2556 = isnan(_1654);
                bool _2558 = _2554 || _2556;
                bool _2560 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2562 = _2558 || _2560;
                if (!_2562)
                {
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2566 = _1654 + _2564;
                    float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2570 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2568;
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2576 = 1.0 / _2570;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2594 = _2566 * _2576;
                    float _2596 = precise::clamp(_2594, 0.0, 1.0);
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2602 = fma(_2596, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2604 = fma(_2596, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2606 = fma(_2596, _2580, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2596, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2610 = fma(_2596, _2588, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2612 = fma(_2596, _2592, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2430 = _2606;
                    _2458 = _2610;
                    _2424 = _2602;
                    _2452 = _2608;
                    _2436 = _2604;
                    _2466 = _2612;
                    _2528 = true;
                }
                else
                {
                    _2430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2424 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2452 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2436 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2466 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2528 = false;
    float _2614 = _2430;
    float _2616 = _2458;
    float _2618 = _2424;
    float _2620 = _2452;
    float _2622 = _2436;
    float _2624 = _2466;
    float _2626 = fma(_2316, -0.5, 0.5);
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = -_2614;
    float _2632 = _2630 + _2616;
    float _2634 = -_2618;
    float _2636 = _2634 + _2620;
    float _2638 = -_2622;
    float _2640 = _2638 + _2624;
    bool _2642 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2644 = fma(_2628, _2632, _2614);
    float _2646 = fma(_2628, _2636, _2618);
    float _2648 = fma(_2628, _2640, _2622);
    float _2650 = _2644 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2652 = fma(_2646, 0.298911988735198974609375, _2650);
    float _2654 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2656 = fma(_2648, 0.114477999508380889892578125, _2652);
    out.m_97.w = _2654;
    float _2658 = -_2656;
    float _2660 = _2646 + _2658;
    float _2662 = -_2656;
    float _2664 = _2644 + _2662;
    float _2666 = -_2656;
    float _2668 = _2648 + _2666;
    out.m_103.x = 0.0;
    float _2670 = fma(_2660, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2672 = fma(_2664, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    float _2674 = fma(_2668, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2656);
    out.m_105.x = _2670;
    out.m_105.y = _2672;
    out.m_105.z = _2674;
    if (!_2642)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2676 = -_1333;
    float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2680 = -_1335;
    float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2684 = -_1337;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2688 = _2678 * _2678;
    float _2690 = fma(_2682, _2682, _2688);
    float _2692 = fma(_2686, _2686, _2690);
    float _2694 = sqrt(_2692);
    float _2696 = rsqrt(_2692);
    float _2698 = -_2694;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2702 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = _2682 * _2696;
    float _2708 = _2678 * _2696;
    float _2710 = abs(_2704);
    float _2712 = log2(_2710);
    float _2714 = _2686 * _2696;
    float _2716 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2718 = _2316 * _2708;
    float _2720 = -_2708;
    float _2722 = -_2716;
    float _2724 = fma(_2720, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2722);
    float _2726 = fma(_2314, _2706, _2718);
    float _2728 = -_2714;
    float _2730 = fma(_2728, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2724);
    float _2732 = fma(_2310, _2714, _2726);
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2738 = _2730 + _2736;
    float _2740 = _2712 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2742 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = exp2(_2740);
    float _2748 = _2746 * _2744;
    float _2750 = _2734 * _2748;
    float _2752 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2754 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2756 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2752;
    out.m_103.y = _2754;
    out.m_103.z = _2756;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

