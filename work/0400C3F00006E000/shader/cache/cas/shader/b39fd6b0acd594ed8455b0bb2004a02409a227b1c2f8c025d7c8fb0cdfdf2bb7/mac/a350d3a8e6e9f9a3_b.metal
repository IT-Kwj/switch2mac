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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_14 [[id(11)]];
    sampler vp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_16 [[id(13)]];
    sampler vp_t_tcb_16Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_32 [[id(15)]];
    sampler vp_t_tcb_32Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_30 [[id(17)]];
    sampler vp_t_tcb_30Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_32Smplr_w [[id(24)]];
    sampler vp_t_tcb_30Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_79 [[user(locn0)]];
    float4 m_99 [[user(locn1)]];
    float4 m_117 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_101 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_103 [[user(locn7)]];
    float4 m_105 [[user(locn8)]];
    float4 m_109 [[user(locn9)]];
    float4 m_111 [[user(locn10)]];
    float4 m_113 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_85 [[user(locn14)]];
    float4 m_119 [[user(locn15)]];
    float4 m_107 [[user(locn16)]];
    float4 m_115 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_71 [[attribute(2)]];
    float4 m_73 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_95 [[attribute(8)]];
    float4 m_81 [[attribute(9)]];
    float4 m_75 [[attribute(10)]];
    float4 m_77 [[attribute(11)]];
    float4 m_91 [[attribute(12)]];
    float4 m_83 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_117 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_119 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2982 = false;
    bool _1578 = false;
    bool _688 = false;
    bool _546 = false;
    bool _258 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _133 = in.m_60.w;
    float _135 = trunc(_133);
    int _138 = int(_135);
    bool _142 = _138 >= 1;
    float _144 = 0.0;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    float _148 = _146;
    if (!_142)
    {
        out.m_63.x = 0.0;
    }
    int _150 = 0;
    if (!_142)
    {
        float _152 = _146 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    int _156 = _154;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3281 = as_type<float>(_154);
        out.gl_Position.z = _3281;
    }
    if (!_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_65.w;
    bool _160 = _158 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_158);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = -_158;
    float _172 = _170 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _174 = _172;
    if (_168)
    {
        float _176 = float(_138);
        _148 = _176;
    }
    float _178 = _148;
    bool _180 = _172 >= _178;
    bool _182 = !_168;
    bool _184 = _180 || _182;
    float _186 = _178;
    if (_184)
    {
        _186 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _188 = _186;
    if (_184)
    {
        out.m_63.x = 0.0;
    }
    if (_184)
    {
        float _190 = _188 * 5.0;
        _156 = as_type<int>(_190);
    }
    int _192 = _156;
    if (_184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3351 = as_type<float>(_192);
        out.gl_Position.z = _3351;
    }
    if (_184)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _194 = in.m_67.x;
    float _196 = in.m_67.y;
    float _198 = in.m_67.z;
    bool _200 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = in.m_73.x;
    float _216 = in.m_73.y;
    float _218 = in.m_73.z;
    float _220 = _196 * _204;
    float _222 = _196 * _210;
    float _224 = fma(_194, _202, _220);
    float _226 = _196 * _216;
    float _228 = fma(_194, _208, _222);
    float _230 = fma(_198, _206, _224);
    float _232 = fma(_194, _214, _226);
    float _234 = fma(_198, _212, _228);
    float _236 = fma(_198, _218, _232);
    bool _238 = !_200;
    float _256;
    if (!_238)
    {
        float _240 = in.m_75.x;
        float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _244 = _240 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[12].x, _172);
        float _248 = _246 * _242;
        float _250 = floor(_248);
        float _252 = -_250;
        float _254 = _248 + _252;
        _256 = _254;
        _258 = true;
    }
    else
    {
        float _260 = float(_138);
        float _262 = 1.0 / _260;
        float _264 = _172 * _262;
        _256 = _264;
    }
    _258 = false;
    float _266 = _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _266 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _266 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = _266 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = 1.0 / _282;
    bool _298 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_266);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    bool _310 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_266);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _286;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = -_320;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _290;
    float _334 = _270 * _296;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _266 + _336;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = fma(_326, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _344 = 1.0 / _294;
    float _346 = _274 * _322;
    bool _348 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _350 = isnan(_266);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_358;
    float _362 = _360 + 1.0;
    float _364 = _278 * _332;
    float _366 = _338 * _344;
    bool _368 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_266);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = _378 * _362;
    float _382 = -_378;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _390;
    float _394 = _308 * _384;
    float _396 = -_308;
    float _398 = _396 + 1.0;
    float _400 = fma(_388, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _404 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_266);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = _320 * _398;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = _414 * _330;
    float _432 = fma(_420, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_424, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_428, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = _342 * _430;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _444;
    float _448 = _400 * _430;
    float _450 = _402 * _430;
    float _452 = -_414;
    float _454 = _452 + 1.0;
    float _456 = in.m_77.x;
    float _458 = in.m_77.y;
    float _460 = in.m_77.z;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _462;
    float _466 = fma(_442, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_446, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _472 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _474 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _476 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = fma(_434, _416, _470);
    float _480 = fma(_432, _416, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_436, _416, _474);
    float _496 = fma(_484, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_488, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_466, _394, _478);
    float _504 = fma(_468, _394, _480);
    float _506 = fma(_476, _394, _494);
    float _508 = fma(_496, _380, _502);
    float _510 = fma(_498, _380, _504);
    float _512 = fma(_500, _380, _506);
    float _514 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].x, _508);
    float _516 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].y, _510);
    float _518 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].z, _512);
    float _520 = _514 * _456;
    float _522 = _516 * _458;
    float _524 = _518 * _460;
    bool _526 = !_340;
    float _544;
    if (!_526)
    {
        float _528 = in.m_75.x;
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[11].y, _172);
        float _536 = _534 * _530;
        float _538 = floor(_536);
        float _540 = -_538;
        float _542 = _536 + _540;
        _544 = _542;
        _546 = true;
    }
    else
    {
        float _548 = float(_138);
        float _550 = 1.0 / _548;
        float _552 = _172 * _550;
        _544 = _552;
    }
    _546 = false;
    float _554 = _544;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _554 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _566 = isnan(_554);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_554);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _592;
    bool _596 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _598 = isnan(_554);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = 1.0 / _562;
    float _610 = -_574;
    float _612 = _610 + 1.0;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _616 = 1.0 / _578;
    float _618 = _594 * _608;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = fma(_618, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _630 = _590 * _612;
    float _632 = -_590;
    float _634 = _632 + 1.0;
    float _636 = _574 * _626;
    float _638 = _622 * _616;
    float _640 = _628 * _630;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = _554 + _642;
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _648 = fma(_638, _644, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_648, _636, _646);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[117].x, _652);
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_79.x = _660;
    out.m_79.y = _662;
    out.m_79.z = _664;
    out.m_79.w = _666;
    bool _668 = !_614;
    float _686;
    if (!_668)
    {
        float _670 = in.m_75.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _172);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_138);
        float _692 = 1.0 / _690;
        float _694 = _172 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_60.x;
    float _700 = in.m_60.y;
    float _702 = in.m_60.z;
    float _704 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _708 = in.m_71.w;
    float _710 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _712 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _714 = in.m_69.w;
    float _716 = in.m_73.w;
    float _718 = _210 * _700;
    float _720 = _204 * _700;
    float _722 = _216 * _700;
    float _724 = fma(_208, _698, _718);
    float _726 = fma(_202, _698, _720);
    float _728 = fma(_214, _698, _722);
    float _730 = fma(_212, _702, _724);
    float _732 = fma(_206, _702, _726);
    float _734 = fma(_218, _702, _728);
    float _736 = _730 + _708;
    float _738 = _732 + _714;
    float _740 = _734 + _716;
    float _742 = in.m_81.x;
    float _744 = in.m_81.y;
    float _746 = in.m_81.z;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _736 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = _738 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _740 + _756;
    float _760 = _750 * _750;
    float _762 = fma(_754, _754, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = sqrt(_764);
    float _768 = rsqrt(_764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _774 = precise::min(_710, _770);
    float _776 = _768 * _774;
    float _778 = _750 * _776;
    float _780 = _754 * _776;
    float _782 = _758 * _776;
    float _784 = -_778;
    float _786 = _750 + _784;
    float _788 = -_780;
    float _790 = _754 + _788;
    float _792 = -_782;
    float _794 = _758 + _792;
    float _796 = _786 * _786;
    float _798 = fma(_790, _790, _796);
    float _800 = fma(_794, _794, _798);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _742);
    float _804 = sqrt(_800);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _746);
    float _808 = _768 * _804;
    float _810 = _706 * _808;
    float _812 = _704 * _808;
    float _814 = _712 * _808;
    float _816 = _810 * _772;
    float _818 = _812 * _802;
    float _820 = _814 * _806;
    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].x, _822);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].x, _826);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _828);
    float _836 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _838 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _832);
    float _840 = _834 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _842 = _836 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _844 = _838 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _846 = _740 + _840;
    float _848 = _738 + _842;
    float _850 = _736 + _844;
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _854 = _846 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _858 = _848 + _856;
    float _860 = _854 * _854;
    float _862 = fma(_858, _858, _860);
    float _864 = sqrt(_862);
    bool _866 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _714;
    float _870 = _848;
    float _872 = _846;
    if (!_866)
    {
        _868 = _850;
    }
    float _874 = _868;
    bool _876 = !_866;
    float _878 = _874;
    if (!_876)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _884 = _864 + _882;
        float _886 = rsqrt(_862);
        float _888 = _884 * _880;
        float _890 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = _888 * 0.15915493667125701904296875;
        float _894 = _892 * 6.283185482025146484375;
        float _896 = cos(_894);
        float _898 = _892 * 6.283185482025146484375;
        float _900 = sin(_898);
        float _902 = _896 + (-1.0);
        float _904 = fma(_900, _890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = _902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _886 * _904;
        float _910 = fma(_850, _896, _906);
        float _912 = fma(_858, _908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _914 = fma(_854, _908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _870 = _912;
        _872 = _914;
        _878 = _910;
    }
    float _916 = _870;
    float _918 = _872;
    float _920 = _878;
    float _922 = fma(_916, 6.2500002968590706586837768554688e-05, 0.5);
    float _924 = fma(_918, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4540 = float2(_922, _924);
    float3 _928 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4540, float2(0.0), isnan(_4540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4540, float2(0.0), isnan(_4540)), level(0.0)).xyz;
    float _930 = _928.x;
    float _932 = _928.y;
    float _934 = _928.z;
    float _936 = in.m_83.y;
    float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _940 = in.m_75.w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _944 = _942 != 0;
    float _946 = in.m_75.x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _950 = in.m_75.z;
    float _952 = in.m_75.y;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _960 = _958 != 0;
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _968 = _966 != 0;
    float _970 = -_936;
    float _972 = _970 + 1.0;
    float _974 = in.m_83.x;
    bool _976 = _940 > 0.5;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = _946 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _982 = _976 ? as_type<int>(_972) : as_type<int>(_936);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _988 = _986 != 0;
    float _990 = -_948;
    float _992 = fma(_980, 2.0, _990);
    bool _994 = _950 > 0.5;
    float _996 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[78].z, _984);
    float _998 = 0.0;
    float _1000 = _950;
    float _1002 = _936;
    float _1004 = _938;
    float _1006 = _974;
    if (!_944)
    {
        _998 = _950;
    }
    float _1008 = _998;
    out.m_87.w = _774;
    float _1010 = 0.0;
    float _1012 = _1008;
    if (!_944)
    {
        _1010 = _952;
    }
    float _1014 = _1010;
    float _1016 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[77].z, _996);
    float _1018 = _1014;
    if (_944)
    {
        _1018 = _946;
    }
    float _1020 = _1018;
    out.m_89.x = _812;
    int _1022 = as_type<int>(_1020);
    if (_944)
    {
        _1012 = _952;
    }
    float _1024 = _1012;
    float _1026 = _1024;
    if (_944)
    {
        _1000 = _952;
    }
    float _1028 = _1000;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1038 = in.m_91.x;
    float _1040 = in.m_91.y;
    float _1042 = in.m_91.z;
    float _1044 = in.m_91.w;
    float _1046 = _964 ? as_type<float>(_982) : _936;
    bool _1048 = _952 > 0.5;
    int _1050 = _1048 ? as_type<int>(_972) : as_type<int>(_936);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1056 = _1034 ? as_type<float>(_1050) : _936;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1062 = _952 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1064 = _1034;
    if (_956)
    {
        bool _1066 = _946 > 0.5;
        _1064 = _1066;
    }
    bool _1068 = _1064;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1070;
    float _1074 = 1.0 / _1054;
    float _1076 = fma(_1062, -2.0, _978);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1082 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1076);
    if (_988)
    {
        float _1084 = _994 ? _972 : _936;
        _1002 = _1084;
    }
    float _1086 = _1002;
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1090 = 1.0 / _1060;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1094 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1088);
    float _1098 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1100 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1092);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1106 = 1.0 / _1080;
    float _1108 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1110 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1098);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1112;
    float _1116 = _1072 * _1074;
    float _1118 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1108);
    float _1120 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1110);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1124 = _696 + _1122;
    float _1126 = _1104 * _1090;
    float _1128 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1096);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1132 = _696 + _1130;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1136 = _744 != 0.0;
    bool _1138 = isnan(_744);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    out.m_93.x = _1118;
    out.m_93.y = _1128;
    out.m_93.z = _1120;
    if (!_960)
    {
        _1026 = _974;
    }
    float _1146 = _1026;
    float _1148 = _1114 * _1106;
    float _1150 = fma(_1116, _1132, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1152 = fma(_1126, _1124, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1154 = _938 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1160 = _696 + _1158;
    bool _1162 = _742 == 0.0;
    bool _1164 = !_1144;
    bool _1166 = _1162 && _1164;
    float _1168 = fma(_1154, _1056, -0.5);
    bool _1170 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1172 = isnan(_696);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1156);
    float _1184 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1100);
    float _1186 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1188 = fma(_1148, _1160, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1190 = -_1180;
    float _1192 = _1190 + 1.0;
    float _1194 = -_1082;
    float _1196 = fma(_1184, _1168, _1194);
    float _1198 = fma(_1046, _1186, -0.5);
    bool _1200 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1202 = isnan(_696);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1214 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1216 = isnan(_696);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    bool _1226 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1228 = isnan(_696);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1210;
    float _1240 = _1238 + 1.0;
    float _1242 = _1210 * _1192;
    float _1244 = in.m_95.x;
    float _1246 = in.m_95.y;
    float _1248 = in.m_95.z;
    float _1250 = _1236 * _1240;
    float _1252 = -_1236;
    float _1254 = _1252 + 1.0;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1258 = _1224 * _1254;
    bool _1260 = _746 == 0.0;
    bool _1262 = _1260 && _1166;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1266 = as_type<int>(_1256);
    float _1268 = _1146;
    float _1270 = _1182;
    if (!_956)
    {
        _1004 = _974;
    }
    float _1272 = _1004;
    float _1274 = _1150 * _1258;
    float _1276 = -_1256;
    float _1278 = fma(_1030, 2.0, _1276);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1282 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1264);
    int _1284 = as_type<int>(_1280);
    float _1286 = _1272;
    float _1288 = _1274;
    if (_960)
    {
        float _1290 = -_974;
        float _1292 = _1290 + 1.0;
        _1266 = as_type<int>(_1292);
    }
    int _1294 = _1266;
    if (_956)
    {
        float _1296 = -_974;
        float _1298 = _1296 + 1.0;
        _1022 = as_type<int>(_1298);
    }
    int _1300 = _1022;
    float _1302 = fma(_1036, -2.0, _1280);
    if (_968)
    {
        float _1304 = -_974;
        float _1306 = _1304 + 1.0;
        _1284 = as_type<int>(_1306);
    }
    int _1308 = _1284;
    float _1310 = -_1224;
    float _1312 = _1310 + 1.0;
    if (_960)
    {
        float _1314 = _994 ? as_type<float>(_1294) : _974;
        _1268 = _1314;
    }
    float _1316 = _1268;
    float _1318 = -_172;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1278);
    if (_956)
    {
        float _1322 = _1068 ? as_type<float>(_1300) : _974;
        _1286 = _1322;
    }
    float _1324 = _1286;
    float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_968)
    {
        float _1328 = _1048 ? as_type<float>(_1308) : _974;
        _1006 = _1328;
    }
    float _1330 = _1006;
    float _1332 = -_172;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[76].x, _992);
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1274);
    float _1338 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1282);
    float _1340 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1182);
    if (_1262)
    {
        _1270 = _1246;
    }
    float _1342 = _1270;
    float _1344 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1348 = _1342;
    if (!_1262)
    {
        float _1350 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1302);
    float _1356 = fma(_1152, _1250, _1336);
    float _1358 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1262)
    {
        _174 = _1244;
    }
    float _1360 = _174;
    float _1362 = _1042 * _1244;
    float _1364 = _1360;
    if (!_1262)
    {
        float _1366 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1244);
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1372 = fma(_1344, _1324, -0.5);
    float _1374 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1376 = fma(_1188, _1242, _1356);
    float _1378 = _1038 * _1246;
    float _1380 = _1040 * _1248;
    float _1382 = -_1362;
    float _1384 = fma(_1038, _1248, _1382);
    float _1386 = _1358 * _1326;
    float _1388 = _1374 * _1346;
    float _1390 = -_1380;
    float _1392 = fma(_1042, _1246, _1390);
    float _1394 = _1384 * _1044;
    float _1396 = fma(_1016, _1372, _1334);
    float _1398 = -_778;
    float _1400 = _1398 + _920;
    out.m_97.x = _1388;
    out.m_97.y = _1386;
    float _1402 = _1392 * _1044;
    float _1404 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1376);
    float _1406 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1408 = -_780;
    float _1410 = _1408 + _916;
    if (_1262)
    {
        _1288 = _1248;
    }
    float _1412 = _1288;
    float _1414 = _1412;
    if (!_1262)
    {
        float _1416 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1414 = _1416;
    }
    float _1418 = _1414;
    float _1420 = fma(_1406, _1316, -0.5);
    float _1422 = -_1378;
    float _1424 = fma(_1040, _1244, _1422);
    float _1426 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1428 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1430 = fma(_1338, _1420, _1320);
    float _1432 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1434 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1436 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1428);
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1440 = _1400 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1444 = _1410 + _1442;
    float _1446 = -_782;
    float _1448 = _1446 + _918;
    float _1450 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1432);
    float _1452 = _1440 * _1440;
    float _1454 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1426);
    float _1456 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1434);
    float _1458 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1460 = fma(_1444, _1444, _1452);
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1464 = _1448 + _1462;
    float _1466 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1468 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1458);
    float _1470 = fma(_1464, _1464, _1460);
    float _1472 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1466);
    float _1474 = _1424 * _1044;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1478 = sqrt(_1470);
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1436);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1468);
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1496 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1472);
    float _1498 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    float _1500 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1454);
    float _1502 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1456);
    out.m_99.x = _1488;
    out.m_99.y = _1490;
    out.m_99.z = _1492;
    out.m_99.w = _1494;
    float _1504 = -_1354;
    float _1506 = fma(_1340, _1198, _1504);
    float _1508 = _1196 + 0.5;
    bool _1510 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1512 = isnan(_1478);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1518 = _1514 || _1516;
    out.m_101.x = _1482;
    out.m_101.y = _1486;
    out.m_101.z = _1496;
    float _1520 = _1506 + 0.5;
    float _1522 = _1430 + 0.5;
    float _1524 = _1396 + 0.5;
    out.m_103.x = _1498;
    out.m_103.y = _1500;
    out.m_103.z = _1502;
    float _1526 = -_780;
    float _1528 = _738 + _1526;
    float _1530 = -_778;
    float _1532 = _736 + _1530;
    float _1534 = -_782;
    float _1536 = _740 + _1534;
    out.m_105.x = _1524;
    out.m_105.y = _1508;
    out.m_105.z = _1522;
    out.m_105.w = _1520;
    float _1538 = _1524;
    int _1540 = as_type<int>(_1490);
    int _1542 = as_type<int>(_1488);
    if (!_1518)
    {
        _1538 = 1.0;
    }
    float _1544 = _1538;
    out.m_107.x = _930;
    out.m_107.y = _932;
    out.m_107.z = _934;
    bool _1546 = !_1518;
    float _1548 = _1544;
    if (!_1546)
    {
        bool _1550 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1552 = isnan(_1478);
        bool _1554 = _1550 || _1552;
        bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1558 = _1554 || _1556;
        if (!_1558)
        {
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = _1478 + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1566 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1564;
            float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1572 = 1.0 / _1566;
            float _1574 = _1562 * _1572;
            float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1548 = _1576;
            _1578 = true;
        }
        else
        {
            bool _1580 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1582 = isnan(_1478);
            bool _1584 = _1580 || _1582;
            bool _1586 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1588 = _1584 || _1586;
            if (!_1588)
            {
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1478 + _1590;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1600 = _1598 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1602 = 1.0 / _1596;
                float _1604 = _1592 * _1602;
                float _1606 = fma(_1604, _1600, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1548 = _1606;
                _1578 = true;
            }
            else
            {
                _1548 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1578 = false;
    float _1608 = _1548;
    float _1610 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1612 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1614 = floor(_1610);
    float _1616 = floor(_1612);
    float _1618 = -_1614;
    float _1620 = _1610 + _1618;
    float _1622 = -_1616;
    float _1624 = _1612 + _1622;
    float2 _5783 = float2(_1620, _1624);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5783, float2(0.0), isnan(_5783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5783, float2(0.0), isnan(_5783)), level(0.0)).x;
    float _1628 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1630 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1632 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1628);
    float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1636 = _1400 + _1634;
    float _1638 = _1532 + _1630;
    float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1642 = _1410 + _1640;
    float _1644 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1632);
    float _1646 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1648 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1650 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1654 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1646);
    float _1656 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1648);
    float _1658 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1650);
    float _1660 = 1.0 / _1652;
    float _1662 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1654);
    float _1664 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1656);
    float _1666 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1658);
    float _1668 = fma(_1642, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1674 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1676 = -_1528;
    float _1678 = _1676 + _1668;
    float _1680 = _1670 + _1652;
    float _1682 = trunc(_1672);
    int _1684 = int(_1682);
    float _1686 = _1680 * _1660;
    float _1688 = _1686 * 0.5;
    float _1690 = trunc(_1674);
    int _1692 = int(_1690);
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1696 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1694);
    float _1698 = 1.0 / _1696;
    int _1700 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1702 = _1684 + _1700;
    int _1704 = _1702 + 1;
    int _1706 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1708 = _1692 + _1706;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1636, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1714 = -_1532;
    float _1716 = _1714 + _1712;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1720 = _1698 * _1718;
    int _1722 = _1704 | _1710;
    float _1724 = _1716 * _1716;
    bool _1726 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1728 = fma(_1678, _1678, _1724);
    bool _1730 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1732 = !_1726;
    int _1734 = _1732 ? 0 : 1;
    int _1736 = 2;
    int _1738 = _1704;
    float _1740 = _1636;
    float _1742 = _1668;
    float _1744 = _1712;
    float _1746 = _1674;
    if (!_1726)
    {
        _1736 = 1;
    }
    int _1748 = _1736;
    bool _1750 = _1704 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1752 = _1748;
    if (!_1730)
    {
        _1752 = _1734;
    }
    int _1754 = _1752;
    bool _1756 = _1722 < 0;
    bool _1758 = _1756 || _1750;
    int _1760 = _1754 << 6;
    bool _1762 = _1710 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1764 = _1762 || _1758;
    int _1766 = _1760 + 96;
    uint _1769 = uint(int(uint(_1766) >> uint(2)));
    uint _1771 = uint(int(uint(int(_1769)) >> uint(2)));
    int _1773 = int(_1769) & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    int _1777 = int(_1769) + 1;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    int _1781 = _1777 & 3;
    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[int(_1779)][_1781];
    int _1785 = _1760 + 104;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    if (!_1764)
    {
        int _1803 = _1710 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1805 = _1803 + _1704;
        _1738 = _1805;
    }
    int _1807 = _1738;
    float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1811 = _1448 + _1809;
    if (!_1764)
    {
        int _1813 = _1807 << 2;
        _1540 = _1813;
    }
    int _1815 = _1540;
    int _1817 = _1760 + 48;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    int _1835 = _1815;
    if (!_1764)
    {
        uint _1837 = uint(int(uint(_1807) >> uint(2)));
        _1542 = int(_1837);
    }
    int _1839 = _1542;
    float _1841 = fma(_1811, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = _1841;
    if (!_1764)
    {
        int _1845 = 12 & _1815;
        _1835 = _1845;
    }
    int _1847 = _1835;
    float _1849 = -_1536;
    float _1851 = _1849 + _1841;
    if (!_1764)
    {
        int _1853 = _1839 << 4;
        int _1855 = _1853 + _1847;
        _1740 = as_type<float>(_1855);
    }
    float _1857 = _1740;
    int _1859 = _1760 + 64;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    uint _1863 = uint(int(uint(int(_1861)) >> uint(2)));
    int _1865 = int(_1861) & 3;
    float _1867 = (*spvDescriptorSet0.vp_c15)._m0[int(_1863)][_1865];
    int _1869 = int(_1861) + 1;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    int _1873 = _1869 & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    float _1877 = fma(_1851, _1851, _1728);
    float _1879 = sqrt(_1877);
    int _1881 = _1760 + 56;
    uint _1883 = uint(int(uint(_1881) >> uint(2)));
    uint _1885 = uint(int(uint(int(_1883)) >> uint(2)));
    int _1887 = int(_1883) & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    int _1891 = int(_1883) + 1;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    int _1895 = _1891 & 3;
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[int(_1893)][_1895];
    int _1899 = _1760 + 72;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    uint _1903 = uint(int(uint(int(_1901)) >> uint(2)));
    int _1905 = int(_1901) & 3;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[int(_1903)][_1905];
    int _1909 = int(_1901) + 1;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    int _1913 = _1909 & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    bool _1917 = _1879 > 0.0;
    float _1919 = _1638 * _1783;
    int _1921 = _1760 + 80;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    uint _1925 = uint(int(uint(int(_1923)) >> uint(2)));
    int _1927 = int(_1923) & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    int _1931 = int(_1923) + 1;
    uint _1933 = uint(int(uint(_1931) >> uint(2)));
    int _1935 = _1931 & 3;
    float _1937 = (*spvDescriptorSet0.vp_c15)._m0[int(_1933)][_1935];
    float _1939 = fma(_1528, _1775, _1919);
    float _1941 = _1775;
    float _1943 = _1877;
    if (!_1764)
    {
        float _1945 = floor(_1672);
        _1941 = _1945;
    }
    float _1947 = _1941;
    float _1949 = fma(_1536, _1793, _1939);
    int _1951 = _1760 + 88;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[int(_1963)][_1965];
    float _1969 = _1949 + _1801;
    float _1971 = 1.0 / _1969;
    float _1973 = _1857;
    float _1975 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1977 = _1969;
    if (!_1764)
    {
        int _1979 = as_type<int>(_1857) + 400;
        uint _1981 = uint(int(uint(_1979) >> uint(2)));
        uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
        int _1985 = int(_1981) & 3;
        float _1987 = (*spvDescriptorSet0.vp_c15)._m0[int(_1983)][_1985];
        _1973 = _1987;
    }
    float _1989 = _1973;
    float _1991 = _1638 * _1833;
    bool _1993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    if (!_1917)
    {
        _1975 = _1712;
    }
    float _2003 = _1975;
    float _2005 = fma(_1528, _1825, _1991);
    float _2007 = _1638 * _1875;
    float _2009 = fma(_1528, _1867, _2007);
    bool _2011 = !_1917;
    float _2013 = _2003;
    float _2015 = _1867;
    float _2017 = _1915;
    if (!_2011)
    {
        float _2019 = _234 * _234;
        float _2021 = fma(_230, _230, _2019);
        float _2023 = fma(_236, _236, _2021);
        float _2025 = rsqrt(_1877);
        float _2027 = sqrt(_2023);
        float _2029 = _1678 * _2025;
        float _2031 = _1716 * _2025;
        float _2033 = _1851 * _2025;
        bool _2035 = _2027 > 0.0;
        float _2037 = _2027;
        _1977 = _2025;
        if (!_2035)
        {
            _2037 = _1712;
        }
        float _2039 = _2037;
        bool _2041 = !_2035;
        _2013 = _2039;
        if (!_2041)
        {
            float _2043 = rsqrt(_2023);
            float _2045 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2047 = _234 * _2043;
            float _2049 = _230 * _2043;
            float _2051 = _2031 * _2047;
            float _2053 = _236 * _2043;
            float _2055 = fma(_2029, _2049, _2051);
            float _2057 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2059 = fma(_2033, _2053, _2055);
            float _2061 = _2059 * _2057;
            float _2063 = fma(_230, _2061, _1668);
            float _2065 = fma(_234, _2061, _1712);
            float _2067 = fma(_236, _2061, _1841);
            _1742 = _2063;
            _1843 = _2067;
            _2013 = _2065;
            _1977 = _2061;
            _2015 = _2045;
        }
    }
    float _2069 = _1742;
    float _2071 = _1843;
    float _2073 = _2013;
    float _2075 = _1977;
    float _2077 = _2015;
    float _2079 = fma(_1536, _1889, _2005);
    float _2081 = fma(_1536, _1907, _2009);
    float _2083 = _2075;
    float _2085 = _2073;
    float _2087 = _2077;
    if (_2001)
    {
        _2083 = _2069;
    }
    float _2089 = _2083;
    float _2091 = _2089;
    if (_2001)
    {
        _1744 = _2071;
    }
    float _2093 = _1744;
    float _2095 = _2093;
    if (!_2001)
    {
        float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2099 = _1532 + _2097;
        float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2103 = _1528 + _2101;
        float _2105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2107 = _2099 * _2099;
        float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2111 = _1536 + _2109;
        float _2113 = fma(_2103, _2103, _2107);
        float _2115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2117 = fma(_2111, _2111, _2113);
        float _2119 = sqrt(_2117);
        float _2121 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2123 = -_1528;
        float _2125 = _2123 + _2069;
        float _2127 = precise::min(_2119, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2129 = _2127 * _2115;
        float _2131 = -_1532;
        float _2133 = _2131 + _2073;
        float _2135 = _2121 * _2129;
        float _2137 = -_1536;
        float _2139 = _2137 + _2071;
        float _2141 = fma(_2133, _2135, _1532);
        float _2143 = fma(_2125, _2135, _1528);
        float _2145 = fma(_2139, _2135, _1536);
        _2085 = _2141;
        _2091 = _2143;
        _2095 = _2145;
    }
    float _2147 = _2085;
    float _2149 = _2091;
    float _2151 = _2095;
    float _2153 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2155 = _2079 + _1897;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2159 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2153);
    float _2163 = _2155 * _1971;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2157);
    float _2167 = _2081 + _1915;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2161);
    float _2171 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2173 = _2163 >= 0.0;
    float _2175 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2159);
    float _2177 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2165);
    float _2179 = _2169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2181 = _2167 * _1971;
    float _2183 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2171);
    bool _2185 = _2163 <= 1.0;
    bool _2187 = _2185 && _2173;
    float _2189 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2175);
    float _2191 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2195 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2183);
    bool _2197 = _2181 >= 0.0;
    bool _2199 = _2197 && _2187;
    float _2201 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2203 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2193);
    float _2205 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2207 = _2181 <= 1.0;
    bool _2209 = _2207 && _2199;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2213 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2215 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2203);
    float _2217 = _2163;
    if (!_1764)
    {
        float _2219 = rint(_1989);
        float _2221 = precise::max(_2219, 0.0);
        uint _2223 = uint(_2221);
        uint _2225 = clamp(_2223, 0u, 65535u);
        _2087 = as_type<float>(_2225);
    }
    float _2227 = _2087;
    float _2229 = -_2211;
    float _2231 = fma(_2229, _2205, 1.0);
    float _2233 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2235 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2215);
    float _2237 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2239 = _1638 * _1937;
    float _2241 = log2(_2231);
    float _2243 = _2231;
    if (_2209)
    {
        float _2245 = float(_1754);
        _2017 = _2245;
    }
    float _2247 = _2017;
    float _2249 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2237);
    float _2251 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2233);
    float _2253 = fma(_1528, _1929, _2239);
    float _2255 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2249);
    float _2257 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2251);
    float _2259 = 1.0 / _2235;
    float _2261 = fma(_1536, _1959, _2253);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2265 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2267 = _2257;
    if (!_1764)
    {
        float _2269 = -_1947;
        float _2271 = _1672 + _2269;
        _2243 = _2271;
    }
    float _2273 = _2243;
    float _2275 = _2261 + _1967;
    float _2277 = _1897;
    if (!_1764)
    {
        float _2279 = floor(_1674);
        _2277 = _2279;
    }
    float _2281 = _2277;
    float _2283 = _2241 * 0.693147182464599609375;
    float _2285 = _2233;
    float _2287 = _2283;
    if (_2209)
    {
        float _2289 = rint(_2247);
        float _2291 = precise::max(_2289, 0.0);
        uint _2293 = uint(_2291);
        uint _2295 = clamp(_2293, 0u, 65535u);
        _2285 = as_type<float>(_2295);
    }
    float _2297 = _2285;
    float _2299 = _2263 * _2259;
    float _2301 = _2265 * _2259;
    float _2303 = fma(_2299, 0.5, 0.5);
    float _2305 = fma(_2301, -0.5, 0.5);
    if (!_1764)
    {
        float _2307 = -_2281;
        float _2309 = _1674 + _2307;
        _1746 = _2309;
    }
    float _2311 = _1746;
    float _2313 = _2275 * _1971;
    float _2315 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2317 = _2227;
    float _2319 = _2315;
    float _2321 = _2311;
    if (!_1764)
    {
        float3 _6944 = float3(_2273, _2311, float(as_type<int>(_2227)));
        float3 _6948 = select(_6944, float3(0.0), isnan(_6944));
        float _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6948.xy, uint(rint(_6948.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6948.xy, uint(rint(_6948.z)), level(0.0)).x;
        _2317 = _2323;
    }
    float _2325 = _2317;
    float _2327 = _2297;
    if (_2209)
    {
        float3 _6963 = float3(_2163, _2181, float(as_type<int>(_2297)));
        float3 _6965 = select(_6963, float3(0.0), isnan(_6963));
        float _2329 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6965.xy, uint(rint(_6965.z)), _2313, level(0.0));
        _2327 = _2329;
    }
    float _2331 = _2327;
    float3 _6975 = float3(_2303, _2305, _2315);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6975, float3(0.0), isnan(_6975)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6975, float3(0.0), isnan(_6975)), level(0.0)).x;
    float3 _6984 = float3(_2303, _2305, _2315);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6984, float3(0.0), isnan(_6984)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6984, float3(0.0), isnan(_6984)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    if (_1764)
    {
        _2267 = 1.0;
    }
    float _2346 = _2267;
    bool _2348 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan(0.5);
    bool _2356 = _2352 || _2354;
    float _2358 = _2346;
    if (_2356)
    {
        _2287 = 1.0;
    }
    float _2360 = _2287;
    float _2362 = _2360;
    if (!_2356)
    {
        float _2364 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2366 = _2364 * 0.15915493667125701904296875;
        float _2368 = _2366 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        float _2372 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2374 = _2372 * 0.15915493667125701904296875;
        float _2376 = _2366 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        float _2380 = 1.0 / _2370;
        float _2382 = _2374 * 6.283185482025146484375;
        float _2384 = cos(_2382);
        float _2386 = _2378 * _2380;
        float _2388 = _2374 * 6.283185482025146484375;
        float _2390 = sin(_2388);
        float _2392 = _2384 * _2386;
        float _2394 = 1.0 / _2392;
        float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2398 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2396;
        float _2400 = 1.0 / _2398;
        float _2402 = _2390 * _2394;
        float _2404 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2406 = fma(_1720, _2402, _2404);
        float _2408 = _2406 * _2400;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        _2319 = _2400;
        _2217 = _2374;
        _2321 = _2398;
        _2362 = _2410;
    }
    float _2412 = _2319;
    float _2414 = _2217;
    float _2416 = _2321;
    float _2418 = _2362;
    float _2420 = _2412;
    float _2422 = _2414;
    if (!_1764)
    {
        int _2424 = _1807 << 4;
        int _2426 = _2424 + 2048;
        uint _2428 = uint(int(uint(_2426) >> uint(2)));
        uint _2430 = uint(int(uint(int(_2428)) >> uint(2)));
        int _2432 = int(_2428) & 3;
        float _2434 = (*spvDescriptorSet0.vp_c15)._m0[int(_2430)][_2432];
        int _2436 = int(_2428) + 1;
        uint _2438 = uint(int(uint(_2436) >> uint(2)));
        int _2440 = _2436 & 3;
        float _2442 = (*spvDescriptorSet0.vp_c15)._m0[int(_2438)][_2440];
        int _2444 = _2426 + 8;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        uint _2448 = uint(int(uint(int(_2446)) >> uint(2)));
        int _2450 = int(_2446) & 3;
        float _2452 = (*spvDescriptorSet0.vp_c15)._m0[int(_2448)][_2450];
        int _2454 = int(_2446) + 1;
        uint _2456 = uint(int(uint(_2454) >> uint(2)));
        int _2458 = _2454 & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        float _2462 = _1638 * _2442;
        float _2464 = fma(_1528, _2434, _2462);
        float _2466 = fma(_1536, _2452, _2464);
        float _2468 = _2466 + _2460;
        float _2470 = precise::clamp(_2468, 0.0, 1.0);
        float _2472 = -_2470;
        float _2474 = _2472 + _2325;
        float _2476 = fma(_2474, 500.0, 1.5);
        float _2478 = exp2(_2476);
        float _2480 = 0.0 + _2478;
        float _2482 = precise::clamp(_2480, 0.0, 1.0);
        _2420 = _2442;
        _2358 = _2482;
    }
    float _2484 = _2420;
    float _2486 = _2358;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2147 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2149 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2151 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = fma(_2494, _2494, _2500);
    float _2504 = fma(_2498, _2498, _2502);
    float _2506 = rsqrt(_2504);
    float _2508 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2510 = _2494 * _2508;
    float _2512 = _2498 * _2508;
    float _2514 = _2510 * _2510;
    float _2516 = _2512 * _2512;
    float _2518 = _2514 + _2516;
    float _2520 = sqrt(_2518);
    bool _2522 = _2520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2526 = _2520 + _2524;
    float _2528 = _2506;
    float _2530 = _2484;
    float _2532 = _2526;
    if (_2522)
    {
        float _2534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2528 = _2534;
    }
    float _2536 = _2528;
    if (_2522)
    {
        float _2538 = rsqrt(_2518);
        _2530 = _2538;
    }
    float _2540 = _2530;
    float _2542 = _2540;
    if (_2522)
    {
        float _2544 = _2526 * _2536;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2522)
    {
        float _2548 = _2546 * 0.15915493667125701904296875;
        _2422 = _2548;
    }
    float _2550 = _2422;
    float _2552 = _2498;
    float _2554 = _2550;
    if (_2522)
    {
        float _2556 = _2550 * 6.283185482025146484375;
        float _2558 = sin(_2556);
        _2552 = _2558;
    }
    float _2560 = _2552;
    float _2562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2564 = precise::max(0.0, _2562);
    float _2566 = _2416;
    float _2568 = _2564;
    float _2570 = _2562;
    if (_2522)
    {
        float _2572 = _2550 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2566 = _2574;
    }
    float _2576 = _2566;
    float _2578 = -_2508;
    float _2580 = -_2564;
    float _2582 = fma(_2490, _2578, _2580);
    if (_2522)
    {
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2568 = _2584;
    }
    float _2586 = _2568;
    float _2588 = _2560;
    float _2590 = _2586;
    if (_2522)
    {
        float _2592 = fma(_2560, _2586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2588 = _2592;
    }
    float _2594 = _2588;
    float _2596 = _2594;
    if (!_2522)
    {
        _2590 = _2510;
    }
    float _2598 = _2590;
    float _2600 = _2598;
    float _2602 = _2576;
    if (_2522)
    {
        float _2604 = _2576 + (-1.0);
        _2570 = _2604;
    }
    float _2606 = _2570;
    float _2608 = _2606;
    if (_2522)
    {
        float _2610 = _2540 * _2594;
        _1943 = _2610;
    }
    float _2612 = _1943;
    if (!_2522)
    {
        _2596 = _2582;
    }
    float _2614 = _2596;
    float _2616 = _2614;
    if (_2522)
    {
        float _2618 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2554 = _2618;
    }
    float _2620 = _2554;
    if (_2522)
    {
        float _2622 = _2510 * _2612;
        _2600 = _2622;
    }
    float _2624 = _2600;
    if (!_2522)
    {
        _2608 = _2512;
    }
    float _2626 = _2608;
    float _2628 = _2626;
    if (_2522)
    {
        float _2630 = _2512 * _2612;
        _2628 = _2630;
    }
    float _2632 = _2628;
    if (!_2522)
    {
        _2542 = _2514;
    }
    float _2634 = _2542;
    float _2636 = _2634;
    if (_2522)
    {
        float _2638 = fma(_2582, _2576, _2620);
        _2616 = _2638;
    }
    float _2640 = _2616;
    if (_2522)
    {
        float _2642 = _2624 * _2624;
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (!_2522)
    {
        _2602 = _2516;
    }
    float _2646 = _2602;
    float _2648 = sqrt(_2504);
    float _2650 = _2646;
    if (_2522)
    {
        float _2652 = _2632 * _2632;
        _2650 = _2652;
    }
    float _2654 = _2650;
    float _2656 = fma(_2640, _2640, _2644);
    float _2658 = _2656 + _2654;
    float _2660 = rsqrt(_2658);
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2664 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2662);
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    float _2668 = -_2666;
    float _2670 = _2668 + 1.0;
    float _2672 = abs(_2670);
    float _2674 = log2(_2672);
    float _2676 = _2660 * _2624;
    float _2678 = _2660 * _2640;
    float _2680 = _2660 * _2632;
    float _2682 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2684 = -_2682;
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2684);
    float _2688 = -_2680;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2686);
    float _2692 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2694 = fma(_2690, -0.5, 0.5);
    float _2696 = fma(_2690, 0.5, 0.5);
    float _2698 = _2678 + 1.0;
    float _2700 = exp2(_2692);
    float _2702 = fma(_2696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2704 = fma(_2696, _2702, -0.212114393711090087890625);
    float _2706 = sqrt(_2694);
    float _2708 = fma(_2696, _2704, 1.570728778839111328125);
    float _2710 = -_2678;
    float _2712 = fma(_2700, _2698, _2710);
    float _2714 = _2706 * 0.636619746685028076171875;
    float _2716 = fma(_2712, 0.5, 0.5);
    float _2718 = -_2708;
    float _2720 = fma(_2714, _2718, 1.0);
    float2 _7558 = float2(_2720, _2716);
    float3 _2722 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7558, float2(0.0), isnan(_7558)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7558, float2(0.0), isnan(_7558)), level(0.0)).xyz;
    float _2724 = _2722.x;
    float _2726 = _2722.y;
    float _2728 = _2722.z;
    float _2730 = abs(_1720);
    float _2732 = log2(_2730);
    float _2734 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2736 = _2235 * 0.5;
    float _2738 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2740 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2734);
    float _2742 = fma(_2265, -0.5, _2736);
    float _2744 = -_1626;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2740);
    float _2750 = exp2(_2738);
    bool _2752 = _1720 <= 8000.0;
    bool _2754 = isnan(_1720);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan(8000.0);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    out.m_109.x = _1528;
    out.m_109.y = _1532;
    out.m_109.z = _1536;
    float _2764 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2748);
    float _2766 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2768 = _2263 + _2235;
    out.gl_Position.x = _2263;
    out.gl_Position.y = _2265;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2235;
    float _2770 = _2764 + _2235;
    bool _2772 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2774 = isnan(_2648);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2780 = _2776 || _2778;
    float _2782 = _2768 * 0.5;
    float _2784 = exp2(_2766);
    float _2786 = _2770 * 0.5;
    out.m_111.x = _2149;
    out.m_111.y = _2147;
    out.m_111.z = _2151;
    out.m_113.x = _2782;
    out.m_113.y = _2742;
    out.m_113.z = _2786;
    out.m_113.w = _2235;
    float _2788 = -_2750;
    float _2790 = _2788 + 1.0;
    float _2792 = _2418 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2794 = _2750;
    if (!_2780)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2796 = _2794;
    float _2798 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2800 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2802 = precise::clamp(_2800, 0.0, 1.0);
    float _2804 = fma(_2802, -2.0, 3.0);
    float _2806 = _2802 * _2802;
    float _2808 = _2806 * _2804;
    float _2810 = -_2808;
    float _2812 = _2810 + 1.0;
    float _2814 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2808);
    float _2816 = _2808;
    float _2818 = _2796;
    float _2820 = _2796;
    if (!_2209)
    {
        _2816 = 1.0;
    }
    float _2822 = _2816;
    float _2824 = _2822;
    if (_2209)
    {
        bool _2826 = _2331 >= _2313;
        bool _2828 = isnan(_2331);
        bool _2830 = _2826 || _2828;
        bool _2832 = isnan(_2313);
        bool _2834 = _2830 || _2832;
        float _2836 = float(_2834);
        _2824 = _2836;
    }
    float _2838 = _2824;
    float _2840 = _2762 * _2814;
    float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2844 = _2838 * _2486;
    float _2846 = _2746 * _2842;
    float _2848 = precise::clamp(_2846, 0.0, 1.0);
    float _2850 = _2798 * _2333;
    float _2852 = -_2798;
    float _2854 = _2852 + 1.0;
    float _2856 = -_2848;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2860 = _2344 * _2850;
    float _2862 = _2344 * _2854;
    float _2864 = _2854;
    float _2866 = _2848;
    float _2868 = _2858;
    float _2870 = _2850;
    if (!_2780)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2872 = _2864;
    float _2874 = -_2844;
    float _2876 = fma(_2874, _2858, 1.0);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = _2878;
    float _2882 = _2872;
    float _2884 = _2872;
    if (!_2780)
    {
        _2866 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2886 = _2866;
    float _2888 = _2886;
    float _2890 = _2886;
    if (!_2780)
    {
        _2868 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2892 = _2868;
    float _2894 = _2878 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2896 = _2892;
    float _2898 = _2892;
    if (!_2780)
    {
        _2880 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2900 = _2880;
    out.m_115.x = _2894;
    float _2902 = _2728 * _2850;
    float _2904 = fma(_2724, _2860, _2338);
    float _2906 = fma(_2726, _2860, _2340);
    float _2908 = _2900;
    float _2910 = _2900;
    if (!_2780)
    {
        _2870 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2912 = _2870;
    float _2914 = fma(_2344, _2902, _2342);
    out.m_117.x = _2904;
    out.m_117.y = _2906;
    out.m_117.z = _2914;
    out.m_117.w = _2862;
    bool _2916 = !_2780;
    float _2918 = _2912;
    float _2920 = _2912;
    if (!_2916)
    {
        bool _2922 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2924 = isnan(_2648);
        bool _2926 = _2922 || _2924;
        bool _2928 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2930 = _2926 || _2928;
        if (!_2930)
        {
            float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2934 = _2648 + _2932;
            float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2938 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2936;
            float _2940 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2944 = 1.0 / _2938;
            float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2962 = _2934 * _2944;
            float _2964 = precise::clamp(_2962, 0.0, 1.0);
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2970 = fma(_2964, _2942, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2972 = fma(_2964, _2968, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2974 = fma(_2964, _2948, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2976 = fma(_2964, _2952, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2978 = fma(_2964, _2956, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2980 = fma(_2964, _2960, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2820 = _2974;
            _2898 = _2978;
            _2884 = _2970;
            _2890 = _2976;
            _2920 = _2972;
            _2910 = _2980;
            _2982 = true;
        }
        else
        {
            bool _2984 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2986 = isnan(_2648);
            bool _2988 = _2984 || _2986;
            bool _2990 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2992 = _2988 || _2990;
            if (!_2992)
            {
                _2882 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2994 = _2882;
            _2884 = _2994;
            if (!_2992)
            {
                _2818 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2996 = _2818;
            _2820 = _2996;
            if (!_2992)
            {
                _2918 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2998 = _2918;
            _2920 = _2998;
            if (!_2992)
            {
                _2888 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3000 = _2888;
            _2890 = _3000;
            if (!_2992)
            {
                _2896 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3002 = _2896;
            _2898 = _3002;
            if (!_2992)
            {
                _2908 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3004 = _2908;
            bool _3006 = !_2992;
            _2910 = _3004;
            if (!_3006)
            {
                bool _3008 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3010 = isnan(_2648);
                bool _3012 = _3008 || _3010;
                bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3016 = _3012 || _3014;
                if (!_3016)
                {
                    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3020 = _2648 + _3018;
                    float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3024 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3022;
                    float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3030 = 1.0 / _3024;
                    float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3048 = _3020 * _3030;
                    float _3050 = precise::clamp(_3048, 0.0, 1.0);
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3056 = fma(_3050, _3028, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3058 = fma(_3050, _3054, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3060 = fma(_3050, _3034, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3062 = fma(_3050, _3038, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3064 = fma(_3050, _3042, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3066 = fma(_3050, _3046, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2820 = _3060;
                    _2898 = _3064;
                    _2884 = _3056;
                    _2890 = _3062;
                    _2920 = _3058;
                    _2910 = _3066;
                    _2982 = true;
                }
                else
                {
                    _2820 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2898 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2884 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2890 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2920 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2910 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2982 = false;
    float _3068 = _2820;
    float _3070 = _2898;
    float _3072 = _2884;
    float _3074 = _2890;
    float _3076 = _2920;
    float _3078 = _2910;
    float _3080 = _2792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3082 = fma(_1500, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3068;
    float _3088 = _3086 + _3070;
    float _3090 = -_3072;
    float _3092 = _3090 + _3074;
    out.m_63.x = _3080;
    float _3094 = fma(_3084, _3088, _3068);
    float _3096 = -_3076;
    float _3098 = _3096 + _3078;
    float _3100 = fma(_3084, _3092, _3072);
    float _3102 = _3094 * 0.586610972881317138671875;
    bool _3104 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3106 = fma(_3084, _3098, _3076);
    out.m_119.x = 0.0;
    float _3108 = fma(_3100, 0.298911988735198974609375, _3102);
    bool _3110 = _2418 > 0.0;
    bool _3112 = isnan(_2418);
    bool _3114 = _3110 || _3112;
    bool _3116 = isnan(0.0);
    bool _3118 = _3114 || _3116;
    float _3120 = fma(_3106, 0.114477999508380889892578125, _3108);
    float _3122 = -_3120;
    float _3124 = _3100 + _3122;
    float _3126 = -_3120;
    float _3128 = _3094 + _3126;
    float _3130 = -_3120;
    float _3132 = _3106 + _3130;
    float _3134 = fma(_3124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    float _3136 = fma(_3128, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    float _3138 = fma(_3132, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    bool _3140 = !_3104;
    if (!_3140)
    {
        float _3142 = -_2147;
        float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3146 = -_2149;
        float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3150 = -_2151;
        float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3154 = _3144 * _3144;
        float _3156 = fma(_3148, _3148, _3154);
        float _3158 = fma(_3152, _3152, _3156);
        float _3160 = sqrt(_3158);
        float _3162 = rsqrt(_3158);
        float _3164 = -_3160;
        float _3166 = _3164 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3168 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3170 = precise::clamp(_3168, 0.0, 1.0);
        float _3172 = _3148 * _3162;
        float _3174 = _3144 * _3162;
        float _3176 = abs(_3170);
        float _3178 = log2(_3176);
        float _3180 = _3152 * _3162;
        float _3182 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3184 = _1500 * _3174;
        float _3186 = -_3174;
        float _3188 = -_3182;
        float _3190 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3188);
        float _3192 = fma(_1498, _3172, _3184);
        float _3194 = -_3180;
        float _3196 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3190);
        float _3198 = fma(_1502, _3180, _3192);
        float _3200 = precise::clamp(_3198, 0.0, 1.0);
        float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3204 = _3196 + _3202;
        float _3206 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3208 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3210 = precise::clamp(_3208, 0.0, 1.0);
        float _3212 = exp2(_3206);
        float _3214 = _3212 * _3210;
        float _3216 = _3200 * _3214;
        float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3220 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3222 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_119.x = _3218;
        out.m_119.y = _3220;
        out.m_119.z = _3222;
    }
    out.m_87.x = _3134;
    out.m_87.y = _3136;
    out.m_87.z = _3138;
    if (_3118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3224 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3224;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_117 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_119 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2982 = false;
    bool _1578 = false;
    bool _688 = false;
    bool _546 = false;
    bool _258 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _133 = in.m_60.w;
    float _135 = trunc(_133);
    int _138 = int(_135);
    bool _142 = _138 >= 1;
    float _144 = 0.0;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    float _148 = _146;
    if (!_142)
    {
        out.m_63.x = 0.0;
    }
    int _150 = 0;
    if (!_142)
    {
        float _152 = _146 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    int _156 = _154;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3281 = as_type<float>(_154);
        out.gl_Position.z = _3281;
    }
    if (!_142)
    {
        return out;
    }
    float _158 = in.m_65.w;
    bool _160 = _158 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_158);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = -_158;
    float _172 = _170 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _174 = _172;
    if (_168)
    {
        float _176 = float(_138);
        _148 = _176;
    }
    float _178 = _148;
    bool _180 = _172 >= _178;
    bool _182 = !_168;
    bool _184 = _180 || _182;
    float _186 = _178;
    if (_184)
    {
        _186 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _188 = _186;
    if (_184)
    {
        out.m_63.x = 0.0;
    }
    if (_184)
    {
        float _190 = _188 * 5.0;
        _156 = as_type<int>(_190);
    }
    int _192 = _156;
    if (_184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3351 = as_type<float>(_192);
        out.gl_Position.z = _3351;
    }
    if (_184)
    {
        return out;
    }
    float _194 = in.m_67.x;
    float _196 = in.m_67.y;
    float _198 = in.m_67.z;
    bool _200 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = in.m_73.x;
    float _216 = in.m_73.y;
    float _218 = in.m_73.z;
    float _220 = _196 * _204;
    float _222 = _196 * _210;
    float _224 = fma(_194, _202, _220);
    float _226 = _196 * _216;
    float _228 = fma(_194, _208, _222);
    float _230 = fma(_198, _206, _224);
    float _232 = fma(_194, _214, _226);
    float _234 = fma(_198, _212, _228);
    float _236 = fma(_198, _218, _232);
    bool _238 = !_200;
    float _256;
    if (!_238)
    {
        float _240 = in.m_75.x;
        float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _244 = _240 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[12].x, _172);
        float _248 = _246 * _242;
        float _250 = floor(_248);
        float _252 = -_250;
        float _254 = _248 + _252;
        _256 = _254;
        _258 = true;
    }
    else
    {
        float _260 = float(_138);
        float _262 = 1.0 / _260;
        float _264 = _172 * _262;
        _256 = _264;
    }
    _258 = false;
    float _266 = _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _266 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _266 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = _266 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = 1.0 / _282;
    bool _298 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_266);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    bool _310 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_266);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _286;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = -_320;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _290;
    float _334 = _270 * _296;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _266 + _336;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = fma(_326, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _344 = 1.0 / _294;
    float _346 = _274 * _322;
    bool _348 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _350 = isnan(_266);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_358;
    float _362 = _360 + 1.0;
    float _364 = _278 * _332;
    float _366 = _338 * _344;
    bool _368 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_266);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = _378 * _362;
    float _382 = -_378;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _390;
    float _394 = _308 * _384;
    float _396 = -_308;
    float _398 = _396 + 1.0;
    float _400 = fma(_388, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _404 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_266);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = _320 * _398;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = _414 * _330;
    float _432 = fma(_420, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_424, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_428, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = _342 * _430;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _444;
    float _448 = _400 * _430;
    float _450 = _402 * _430;
    float _452 = -_414;
    float _454 = _452 + 1.0;
    float _456 = in.m_77.x;
    float _458 = in.m_77.y;
    float _460 = in.m_77.z;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _462;
    float _466 = fma(_442, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_446, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _472 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _474 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _476 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = fma(_434, _416, _470);
    float _480 = fma(_432, _416, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_436, _416, _474);
    float _496 = fma(_484, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_488, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_466, _394, _478);
    float _504 = fma(_468, _394, _480);
    float _506 = fma(_476, _394, _494);
    float _508 = fma(_496, _380, _502);
    float _510 = fma(_498, _380, _504);
    float _512 = fma(_500, _380, _506);
    float _514 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].x, _508);
    float _516 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].y, _510);
    float _518 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].z, _512);
    float _520 = _514 * _456;
    float _522 = _516 * _458;
    float _524 = _518 * _460;
    bool _526 = !_340;
    float _544;
    if (!_526)
    {
        float _528 = in.m_75.x;
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[11].y, _172);
        float _536 = _534 * _530;
        float _538 = floor(_536);
        float _540 = -_538;
        float _542 = _536 + _540;
        _544 = _542;
        _546 = true;
    }
    else
    {
        float _548 = float(_138);
        float _550 = 1.0 / _548;
        float _552 = _172 * _550;
        _544 = _552;
    }
    _546 = false;
    float _554 = _544;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _554 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _566 = isnan(_554);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_554);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _592;
    bool _596 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _598 = isnan(_554);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = 1.0 / _562;
    float _610 = -_574;
    float _612 = _610 + 1.0;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _616 = 1.0 / _578;
    float _618 = _594 * _608;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = fma(_618, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _630 = _590 * _612;
    float _632 = -_590;
    float _634 = _632 + 1.0;
    float _636 = _574 * _626;
    float _638 = _622 * _616;
    float _640 = _628 * _630;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = _554 + _642;
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _648 = fma(_638, _644, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_648, _636, _646);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[117].x, _652);
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_79.x = _660;
    out.m_79.y = _662;
    out.m_79.z = _664;
    out.m_79.w = _666;
    bool _668 = !_614;
    float _686;
    if (!_668)
    {
        float _670 = in.m_75.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _172);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_138);
        float _692 = 1.0 / _690;
        float _694 = _172 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_60.x;
    float _700 = in.m_60.y;
    float _702 = in.m_60.z;
    float _704 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _708 = in.m_71.w;
    float _710 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _712 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _714 = in.m_69.w;
    float _716 = in.m_73.w;
    float _718 = _210 * _700;
    float _720 = _204 * _700;
    float _722 = _216 * _700;
    float _724 = fma(_208, _698, _718);
    float _726 = fma(_202, _698, _720);
    float _728 = fma(_214, _698, _722);
    float _730 = fma(_212, _702, _724);
    float _732 = fma(_206, _702, _726);
    float _734 = fma(_218, _702, _728);
    float _736 = _730 + _708;
    float _738 = _732 + _714;
    float _740 = _734 + _716;
    float _742 = in.m_81.x;
    float _744 = in.m_81.y;
    float _746 = in.m_81.z;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _736 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = _738 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _740 + _756;
    float _760 = _750 * _750;
    float _762 = fma(_754, _754, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = sqrt(_764);
    float _768 = rsqrt(_764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _774 = precise::min(_710, _770);
    float _776 = _768 * _774;
    float _778 = _750 * _776;
    float _780 = _754 * _776;
    float _782 = _758 * _776;
    float _784 = -_778;
    float _786 = _750 + _784;
    float _788 = -_780;
    float _790 = _754 + _788;
    float _792 = -_782;
    float _794 = _758 + _792;
    float _796 = _786 * _786;
    float _798 = fma(_790, _790, _796);
    float _800 = fma(_794, _794, _798);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _742);
    float _804 = sqrt(_800);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _746);
    float _808 = _768 * _804;
    float _810 = _706 * _808;
    float _812 = _704 * _808;
    float _814 = _712 * _808;
    float _816 = _810 * _772;
    float _818 = _812 * _802;
    float _820 = _814 * _806;
    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].x, _822);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].x, _826);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _828);
    float _836 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _838 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _832);
    float _840 = _834 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _842 = _836 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _844 = _838 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _846 = _740 + _840;
    float _848 = _738 + _842;
    float _850 = _736 + _844;
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _854 = _846 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _858 = _848 + _856;
    float _860 = _854 * _854;
    float _862 = fma(_858, _858, _860);
    float _864 = sqrt(_862);
    bool _866 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _714;
    float _870 = _848;
    float _872 = _846;
    if (!_866)
    {
        _868 = _850;
    }
    float _874 = _868;
    bool _876 = !_866;
    float _878 = _874;
    if (!_876)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _884 = _864 + _882;
        float _886 = rsqrt(_862);
        float _888 = _884 * _880;
        float _890 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = _888 * 0.15915493667125701904296875;
        float _894 = _892 * 6.283185482025146484375;
        float _896 = cos(_894);
        float _898 = _892 * 6.283185482025146484375;
        float _900 = sin(_898);
        float _902 = _896 + (-1.0);
        float _904 = fma(_900, _890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = _902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _886 * _904;
        float _910 = fma(_850, _896, _906);
        float _912 = fma(_858, _908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _914 = fma(_854, _908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _870 = _912;
        _872 = _914;
        _878 = _910;
    }
    float _916 = _870;
    float _918 = _872;
    float _920 = _878;
    float _922 = fma(_916, 6.2500002968590706586837768554688e-05, 0.5);
    float _924 = fma(_918, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4540 = float2(_922, _924);
    float3 _928 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4540, float2(0.0), isnan(_4540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4540, float2(0.0), isnan(_4540)), level(0.0)).xyz;
    float _930 = _928.x;
    float _932 = _928.y;
    float _934 = _928.z;
    float _936 = in.m_83.y;
    float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _940 = in.m_75.w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _944 = _942 != 0;
    float _946 = in.m_75.x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _950 = in.m_75.z;
    float _952 = in.m_75.y;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _960 = _958 != 0;
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _968 = _966 != 0;
    float _970 = -_936;
    float _972 = _970 + 1.0;
    float _974 = in.m_83.x;
    bool _976 = _940 > 0.5;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = _946 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _982 = _976 ? as_type<int>(_972) : as_type<int>(_936);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _988 = _986 != 0;
    float _990 = -_948;
    float _992 = fma(_980, 2.0, _990);
    bool _994 = _950 > 0.5;
    float _996 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[78].z, _984);
    float _998 = 0.0;
    float _1000 = _950;
    float _1002 = _936;
    float _1004 = _938;
    float _1006 = _974;
    if (!_944)
    {
        _998 = _950;
    }
    float _1008 = _998;
    out.m_87.w = _774;
    float _1010 = 0.0;
    float _1012 = _1008;
    if (!_944)
    {
        _1010 = _952;
    }
    float _1014 = _1010;
    float _1016 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[77].z, _996);
    float _1018 = _1014;
    if (_944)
    {
        _1018 = _946;
    }
    float _1020 = _1018;
    out.m_89.x = _812;
    int _1022 = as_type<int>(_1020);
    if (_944)
    {
        _1012 = _952;
    }
    float _1024 = _1012;
    float _1026 = _1024;
    if (_944)
    {
        _1000 = _952;
    }
    float _1028 = _1000;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1038 = in.m_91.x;
    float _1040 = in.m_91.y;
    float _1042 = in.m_91.z;
    float _1044 = in.m_91.w;
    float _1046 = _964 ? as_type<float>(_982) : _936;
    bool _1048 = _952 > 0.5;
    int _1050 = _1048 ? as_type<int>(_972) : as_type<int>(_936);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1056 = _1034 ? as_type<float>(_1050) : _936;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1062 = _952 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1064 = _1034;
    if (_956)
    {
        bool _1066 = _946 > 0.5;
        _1064 = _1066;
    }
    bool _1068 = _1064;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1070;
    float _1074 = 1.0 / _1054;
    float _1076 = fma(_1062, -2.0, _978);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1082 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1076);
    if (_988)
    {
        float _1084 = _994 ? _972 : _936;
        _1002 = _1084;
    }
    float _1086 = _1002;
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1090 = 1.0 / _1060;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1094 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1088);
    float _1098 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1100 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1092);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1106 = 1.0 / _1080;
    float _1108 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1110 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1098);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1112;
    float _1116 = _1072 * _1074;
    float _1118 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1108);
    float _1120 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1110);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1124 = _696 + _1122;
    float _1126 = _1104 * _1090;
    float _1128 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1096);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1132 = _696 + _1130;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1136 = _744 != 0.0;
    bool _1138 = isnan(_744);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    out.m_93.x = _1118;
    out.m_93.y = _1128;
    out.m_93.z = _1120;
    if (!_960)
    {
        _1026 = _974;
    }
    float _1146 = _1026;
    float _1148 = _1114 * _1106;
    float _1150 = fma(_1116, _1132, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1152 = fma(_1126, _1124, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1154 = _938 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1160 = _696 + _1158;
    bool _1162 = _742 == 0.0;
    bool _1164 = !_1144;
    bool _1166 = _1162 && _1164;
    float _1168 = fma(_1154, _1056, -0.5);
    bool _1170 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1172 = isnan(_696);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1156);
    float _1184 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1100);
    float _1186 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1188 = fma(_1148, _1160, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1190 = -_1180;
    float _1192 = _1190 + 1.0;
    float _1194 = -_1082;
    float _1196 = fma(_1184, _1168, _1194);
    float _1198 = fma(_1046, _1186, -0.5);
    bool _1200 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1202 = isnan(_696);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1214 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1216 = isnan(_696);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    bool _1226 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1228 = isnan(_696);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1210;
    float _1240 = _1238 + 1.0;
    float _1242 = _1210 * _1192;
    float _1244 = in.m_95.x;
    float _1246 = in.m_95.y;
    float _1248 = in.m_95.z;
    float _1250 = _1236 * _1240;
    float _1252 = -_1236;
    float _1254 = _1252 + 1.0;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1258 = _1224 * _1254;
    bool _1260 = _746 == 0.0;
    bool _1262 = _1260 && _1166;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1266 = as_type<int>(_1256);
    float _1268 = _1146;
    float _1270 = _1182;
    if (!_956)
    {
        _1004 = _974;
    }
    float _1272 = _1004;
    float _1274 = _1150 * _1258;
    float _1276 = -_1256;
    float _1278 = fma(_1030, 2.0, _1276);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1282 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1264);
    int _1284 = as_type<int>(_1280);
    float _1286 = _1272;
    float _1288 = _1274;
    if (_960)
    {
        float _1290 = -_974;
        float _1292 = _1290 + 1.0;
        _1266 = as_type<int>(_1292);
    }
    int _1294 = _1266;
    if (_956)
    {
        float _1296 = -_974;
        float _1298 = _1296 + 1.0;
        _1022 = as_type<int>(_1298);
    }
    int _1300 = _1022;
    float _1302 = fma(_1036, -2.0, _1280);
    if (_968)
    {
        float _1304 = -_974;
        float _1306 = _1304 + 1.0;
        _1284 = as_type<int>(_1306);
    }
    int _1308 = _1284;
    float _1310 = -_1224;
    float _1312 = _1310 + 1.0;
    if (_960)
    {
        float _1314 = _994 ? as_type<float>(_1294) : _974;
        _1268 = _1314;
    }
    float _1316 = _1268;
    float _1318 = -_172;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1278);
    if (_956)
    {
        float _1322 = _1068 ? as_type<float>(_1300) : _974;
        _1286 = _1322;
    }
    float _1324 = _1286;
    float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_968)
    {
        float _1328 = _1048 ? as_type<float>(_1308) : _974;
        _1006 = _1328;
    }
    float _1330 = _1006;
    float _1332 = -_172;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[76].x, _992);
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1274);
    float _1338 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1282);
    float _1340 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1182);
    if (_1262)
    {
        _1270 = _1246;
    }
    float _1342 = _1270;
    float _1344 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1348 = _1342;
    if (!_1262)
    {
        float _1350 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1302);
    float _1356 = fma(_1152, _1250, _1336);
    float _1358 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1262)
    {
        _174 = _1244;
    }
    float _1360 = _174;
    float _1362 = _1042 * _1244;
    float _1364 = _1360;
    if (!_1262)
    {
        float _1366 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1244);
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1372 = fma(_1344, _1324, -0.5);
    float _1374 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1376 = fma(_1188, _1242, _1356);
    float _1378 = _1038 * _1246;
    float _1380 = _1040 * _1248;
    float _1382 = -_1362;
    float _1384 = fma(_1038, _1248, _1382);
    float _1386 = _1358 * _1326;
    float _1388 = _1374 * _1346;
    float _1390 = -_1380;
    float _1392 = fma(_1042, _1246, _1390);
    float _1394 = _1384 * _1044;
    float _1396 = fma(_1016, _1372, _1334);
    float _1398 = -_778;
    float _1400 = _1398 + _920;
    out.m_97.x = _1388;
    out.m_97.y = _1386;
    float _1402 = _1392 * _1044;
    float _1404 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1376);
    float _1406 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1408 = -_780;
    float _1410 = _1408 + _916;
    if (_1262)
    {
        _1288 = _1248;
    }
    float _1412 = _1288;
    float _1414 = _1412;
    if (!_1262)
    {
        float _1416 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1414 = _1416;
    }
    float _1418 = _1414;
    float _1420 = fma(_1406, _1316, -0.5);
    float _1422 = -_1378;
    float _1424 = fma(_1040, _1244, _1422);
    float _1426 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1428 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1430 = fma(_1338, _1420, _1320);
    float _1432 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1434 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1436 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1428);
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1440 = _1400 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1444 = _1410 + _1442;
    float _1446 = -_782;
    float _1448 = _1446 + _918;
    float _1450 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1432);
    float _1452 = _1440 * _1440;
    float _1454 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1426);
    float _1456 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1434);
    float _1458 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1460 = fma(_1444, _1444, _1452);
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1464 = _1448 + _1462;
    float _1466 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1468 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1458);
    float _1470 = fma(_1464, _1464, _1460);
    float _1472 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1466);
    float _1474 = _1424 * _1044;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1478 = sqrt(_1470);
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1436);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1468);
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1496 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1472);
    float _1498 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    float _1500 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1454);
    float _1502 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1456);
    out.m_99.x = _1488;
    out.m_99.y = _1490;
    out.m_99.z = _1492;
    out.m_99.w = _1494;
    float _1504 = -_1354;
    float _1506 = fma(_1340, _1198, _1504);
    float _1508 = _1196 + 0.5;
    bool _1510 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1512 = isnan(_1478);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1518 = _1514 || _1516;
    out.m_101.x = _1482;
    out.m_101.y = _1486;
    out.m_101.z = _1496;
    float _1520 = _1506 + 0.5;
    float _1522 = _1430 + 0.5;
    float _1524 = _1396 + 0.5;
    out.m_103.x = _1498;
    out.m_103.y = _1500;
    out.m_103.z = _1502;
    float _1526 = -_780;
    float _1528 = _738 + _1526;
    float _1530 = -_778;
    float _1532 = _736 + _1530;
    float _1534 = -_782;
    float _1536 = _740 + _1534;
    out.m_105.x = _1524;
    out.m_105.y = _1508;
    out.m_105.z = _1522;
    out.m_105.w = _1520;
    float _1538 = _1524;
    int _1540 = as_type<int>(_1490);
    int _1542 = as_type<int>(_1488);
    if (!_1518)
    {
        _1538 = 1.0;
    }
    float _1544 = _1538;
    out.m_107.x = _930;
    out.m_107.y = _932;
    out.m_107.z = _934;
    bool _1546 = !_1518;
    float _1548 = _1544;
    if (!_1546)
    {
        bool _1550 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1552 = isnan(_1478);
        bool _1554 = _1550 || _1552;
        bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1558 = _1554 || _1556;
        if (!_1558)
        {
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = _1478 + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1566 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1564;
            float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1572 = 1.0 / _1566;
            float _1574 = _1562 * _1572;
            float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1548 = _1576;
            _1578 = true;
        }
        else
        {
            bool _1580 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1582 = isnan(_1478);
            bool _1584 = _1580 || _1582;
            bool _1586 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1588 = _1584 || _1586;
            if (!_1588)
            {
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1478 + _1590;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1600 = _1598 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1602 = 1.0 / _1596;
                float _1604 = _1592 * _1602;
                float _1606 = fma(_1604, _1600, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1548 = _1606;
                _1578 = true;
            }
            else
            {
                _1548 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1578 = false;
    float _1608 = _1548;
    float _1610 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1612 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1614 = floor(_1610);
    float _1616 = floor(_1612);
    float _1618 = -_1614;
    float _1620 = _1610 + _1618;
    float _1622 = -_1616;
    float _1624 = _1612 + _1622;
    float2 _5783 = float2(_1620, _1624);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5783, float2(0.0), isnan(_5783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5783, float2(0.0), isnan(_5783)), level(0.0)).x;
    float _1628 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1630 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1632 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1628);
    float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1636 = _1400 + _1634;
    float _1638 = _1532 + _1630;
    float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1642 = _1410 + _1640;
    float _1644 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1632);
    float _1646 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1648 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1650 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1654 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1646);
    float _1656 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1648);
    float _1658 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1650);
    float _1660 = 1.0 / _1652;
    float _1662 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1654);
    float _1664 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1656);
    float _1666 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1658);
    float _1668 = fma(_1642, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1674 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1676 = -_1528;
    float _1678 = _1676 + _1668;
    float _1680 = _1670 + _1652;
    float _1682 = trunc(_1672);
    int _1684 = int(_1682);
    float _1686 = _1680 * _1660;
    float _1688 = _1686 * 0.5;
    float _1690 = trunc(_1674);
    int _1692 = int(_1690);
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1696 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1694);
    float _1698 = 1.0 / _1696;
    int _1700 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1702 = _1684 + _1700;
    int _1704 = _1702 + 1;
    int _1706 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1708 = _1692 + _1706;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1636, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1714 = -_1532;
    float _1716 = _1714 + _1712;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1720 = _1698 * _1718;
    int _1722 = _1704 | _1710;
    float _1724 = _1716 * _1716;
    bool _1726 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1728 = fma(_1678, _1678, _1724);
    bool _1730 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1732 = !_1726;
    int _1734 = _1732 ? 0 : 1;
    int _1736 = 2;
    int _1738 = _1704;
    float _1740 = _1636;
    float _1742 = _1668;
    float _1744 = _1712;
    float _1746 = _1674;
    if (!_1726)
    {
        _1736 = 1;
    }
    int _1748 = _1736;
    bool _1750 = _1704 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1752 = _1748;
    if (!_1730)
    {
        _1752 = _1734;
    }
    int _1754 = _1752;
    bool _1756 = _1722 < 0;
    bool _1758 = _1756 || _1750;
    int _1760 = _1754 << 6;
    bool _1762 = _1710 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1764 = _1762 || _1758;
    int _1766 = _1760 + 96;
    uint _1769 = uint(int(uint(_1766) >> uint(2)));
    uint _1771 = uint(int(uint(int(_1769)) >> uint(2)));
    int _1773 = int(_1769) & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    int _1777 = int(_1769) + 1;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    int _1781 = _1777 & 3;
    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[int(_1779)][_1781];
    int _1785 = _1760 + 104;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    if (!_1764)
    {
        int _1803 = _1710 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1805 = _1803 + _1704;
        _1738 = _1805;
    }
    int _1807 = _1738;
    float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1811 = _1448 + _1809;
    if (!_1764)
    {
        int _1813 = _1807 << 2;
        _1540 = _1813;
    }
    int _1815 = _1540;
    int _1817 = _1760 + 48;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    int _1835 = _1815;
    if (!_1764)
    {
        uint _1837 = uint(int(uint(_1807) >> uint(2)));
        _1542 = int(_1837);
    }
    int _1839 = _1542;
    float _1841 = fma(_1811, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = _1841;
    if (!_1764)
    {
        int _1845 = 12 & _1815;
        _1835 = _1845;
    }
    int _1847 = _1835;
    float _1849 = -_1536;
    float _1851 = _1849 + _1841;
    if (!_1764)
    {
        int _1853 = _1839 << 4;
        int _1855 = _1853 + _1847;
        _1740 = as_type<float>(_1855);
    }
    float _1857 = _1740;
    int _1859 = _1760 + 64;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    uint _1863 = uint(int(uint(int(_1861)) >> uint(2)));
    int _1865 = int(_1861) & 3;
    float _1867 = (*spvDescriptorSet0.vp_c15)._m0[int(_1863)][_1865];
    int _1869 = int(_1861) + 1;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    int _1873 = _1869 & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    float _1877 = fma(_1851, _1851, _1728);
    float _1879 = sqrt(_1877);
    int _1881 = _1760 + 56;
    uint _1883 = uint(int(uint(_1881) >> uint(2)));
    uint _1885 = uint(int(uint(int(_1883)) >> uint(2)));
    int _1887 = int(_1883) & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    int _1891 = int(_1883) + 1;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    int _1895 = _1891 & 3;
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[int(_1893)][_1895];
    int _1899 = _1760 + 72;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    uint _1903 = uint(int(uint(int(_1901)) >> uint(2)));
    int _1905 = int(_1901) & 3;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[int(_1903)][_1905];
    int _1909 = int(_1901) + 1;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    int _1913 = _1909 & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    bool _1917 = _1879 > 0.0;
    float _1919 = _1638 * _1783;
    int _1921 = _1760 + 80;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    uint _1925 = uint(int(uint(int(_1923)) >> uint(2)));
    int _1927 = int(_1923) & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    int _1931 = int(_1923) + 1;
    uint _1933 = uint(int(uint(_1931) >> uint(2)));
    int _1935 = _1931 & 3;
    float _1937 = (*spvDescriptorSet0.vp_c15)._m0[int(_1933)][_1935];
    float _1939 = fma(_1528, _1775, _1919);
    float _1941 = _1775;
    float _1943 = _1877;
    if (!_1764)
    {
        float _1945 = floor(_1672);
        _1941 = _1945;
    }
    float _1947 = _1941;
    float _1949 = fma(_1536, _1793, _1939);
    int _1951 = _1760 + 88;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[int(_1963)][_1965];
    float _1969 = _1949 + _1801;
    float _1971 = 1.0 / _1969;
    float _1973 = _1857;
    float _1975 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1977 = _1969;
    if (!_1764)
    {
        int _1979 = as_type<int>(_1857) + 400;
        uint _1981 = uint(int(uint(_1979) >> uint(2)));
        uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
        int _1985 = int(_1981) & 3;
        float _1987 = (*spvDescriptorSet0.vp_c15)._m0[int(_1983)][_1985];
        _1973 = _1987;
    }
    float _1989 = _1973;
    float _1991 = _1638 * _1833;
    bool _1993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    if (!_1917)
    {
        _1975 = _1712;
    }
    float _2003 = _1975;
    float _2005 = fma(_1528, _1825, _1991);
    float _2007 = _1638 * _1875;
    float _2009 = fma(_1528, _1867, _2007);
    bool _2011 = !_1917;
    float _2013 = _2003;
    float _2015 = _1867;
    float _2017 = _1915;
    if (!_2011)
    {
        float _2019 = _234 * _234;
        float _2021 = fma(_230, _230, _2019);
        float _2023 = fma(_236, _236, _2021);
        float _2025 = rsqrt(_1877);
        float _2027 = sqrt(_2023);
        float _2029 = _1678 * _2025;
        float _2031 = _1716 * _2025;
        float _2033 = _1851 * _2025;
        bool _2035 = _2027 > 0.0;
        float _2037 = _2027;
        _1977 = _2025;
        if (!_2035)
        {
            _2037 = _1712;
        }
        float _2039 = _2037;
        bool _2041 = !_2035;
        _2013 = _2039;
        if (!_2041)
        {
            float _2043 = rsqrt(_2023);
            float _2045 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2047 = _234 * _2043;
            float _2049 = _230 * _2043;
            float _2051 = _2031 * _2047;
            float _2053 = _236 * _2043;
            float _2055 = fma(_2029, _2049, _2051);
            float _2057 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2059 = fma(_2033, _2053, _2055);
            float _2061 = _2059 * _2057;
            float _2063 = fma(_230, _2061, _1668);
            float _2065 = fma(_234, _2061, _1712);
            float _2067 = fma(_236, _2061, _1841);
            _1742 = _2063;
            _1843 = _2067;
            _2013 = _2065;
            _1977 = _2061;
            _2015 = _2045;
        }
    }
    float _2069 = _1742;
    float _2071 = _1843;
    float _2073 = _2013;
    float _2075 = _1977;
    float _2077 = _2015;
    float _2079 = fma(_1536, _1889, _2005);
    float _2081 = fma(_1536, _1907, _2009);
    float _2083 = _2075;
    float _2085 = _2073;
    float _2087 = _2077;
    if (_2001)
    {
        _2083 = _2069;
    }
    float _2089 = _2083;
    float _2091 = _2089;
    if (_2001)
    {
        _1744 = _2071;
    }
    float _2093 = _1744;
    float _2095 = _2093;
    if (!_2001)
    {
        float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2099 = _1532 + _2097;
        float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2103 = _1528 + _2101;
        float _2105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2107 = _2099 * _2099;
        float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2111 = _1536 + _2109;
        float _2113 = fma(_2103, _2103, _2107);
        float _2115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2117 = fma(_2111, _2111, _2113);
        float _2119 = sqrt(_2117);
        float _2121 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2123 = -_1528;
        float _2125 = _2123 + _2069;
        float _2127 = precise::min(_2119, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2129 = _2127 * _2115;
        float _2131 = -_1532;
        float _2133 = _2131 + _2073;
        float _2135 = _2121 * _2129;
        float _2137 = -_1536;
        float _2139 = _2137 + _2071;
        float _2141 = fma(_2133, _2135, _1532);
        float _2143 = fma(_2125, _2135, _1528);
        float _2145 = fma(_2139, _2135, _1536);
        _2085 = _2141;
        _2091 = _2143;
        _2095 = _2145;
    }
    float _2147 = _2085;
    float _2149 = _2091;
    float _2151 = _2095;
    float _2153 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2155 = _2079 + _1897;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2159 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2153);
    float _2163 = _2155 * _1971;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2157);
    float _2167 = _2081 + _1915;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2161);
    float _2171 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2173 = _2163 >= 0.0;
    float _2175 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2159);
    float _2177 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2165);
    float _2179 = _2169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2181 = _2167 * _1971;
    float _2183 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2171);
    bool _2185 = _2163 <= 1.0;
    bool _2187 = _2185 && _2173;
    float _2189 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2175);
    float _2191 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2195 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2183);
    bool _2197 = _2181 >= 0.0;
    bool _2199 = _2197 && _2187;
    float _2201 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2203 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2193);
    float _2205 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2207 = _2181 <= 1.0;
    bool _2209 = _2207 && _2199;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2213 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2215 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2203);
    float _2217 = _2163;
    if (!_1764)
    {
        float _2219 = rint(_1989);
        float _2221 = precise::max(_2219, 0.0);
        uint _2223 = uint(_2221);
        uint _2225 = clamp(_2223, 0u, 65535u);
        _2087 = as_type<float>(_2225);
    }
    float _2227 = _2087;
    float _2229 = -_2211;
    float _2231 = fma(_2229, _2205, 1.0);
    float _2233 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2235 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2215);
    float _2237 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2239 = _1638 * _1937;
    float _2241 = log2(_2231);
    float _2243 = _2231;
    if (_2209)
    {
        float _2245 = float(_1754);
        _2017 = _2245;
    }
    float _2247 = _2017;
    float _2249 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2237);
    float _2251 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2233);
    float _2253 = fma(_1528, _1929, _2239);
    float _2255 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2249);
    float _2257 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2251);
    float _2259 = 1.0 / _2235;
    float _2261 = fma(_1536, _1959, _2253);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2265 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2267 = _2257;
    if (!_1764)
    {
        float _2269 = -_1947;
        float _2271 = _1672 + _2269;
        _2243 = _2271;
    }
    float _2273 = _2243;
    float _2275 = _2261 + _1967;
    float _2277 = _1897;
    if (!_1764)
    {
        float _2279 = floor(_1674);
        _2277 = _2279;
    }
    float _2281 = _2277;
    float _2283 = _2241 * 0.693147182464599609375;
    float _2285 = _2233;
    float _2287 = _2283;
    if (_2209)
    {
        float _2289 = rint(_2247);
        float _2291 = precise::max(_2289, 0.0);
        uint _2293 = uint(_2291);
        uint _2295 = clamp(_2293, 0u, 65535u);
        _2285 = as_type<float>(_2295);
    }
    float _2297 = _2285;
    float _2299 = _2263 * _2259;
    float _2301 = _2265 * _2259;
    float _2303 = fma(_2299, 0.5, 0.5);
    float _2305 = fma(_2301, -0.5, 0.5);
    if (!_1764)
    {
        float _2307 = -_2281;
        float _2309 = _1674 + _2307;
        _1746 = _2309;
    }
    float _2311 = _1746;
    float _2313 = _2275 * _1971;
    float _2315 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2317 = _2227;
    float _2319 = _2315;
    float _2321 = _2311;
    if (!_1764)
    {
        float3 _6944 = float3(_2273, _2311, float(as_type<int>(_2227)));
        float3 _6948 = select(_6944, float3(0.0), isnan(_6944));
        float _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6948.xy, uint(rint(_6948.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6948.xy, uint(rint(_6948.z)), level(0.0)).x;
        _2317 = _2323;
    }
    float _2325 = _2317;
    float _2327 = _2297;
    if (_2209)
    {
        float3 _6963 = float3(_2163, _2181, float(as_type<int>(_2297)));
        float3 _6965 = select(_6963, float3(0.0), isnan(_6963));
        float _2329 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6965.xy, uint(rint(_6965.z)), _2313, level(0.0));
        _2327 = _2329;
    }
    float _2331 = _2327;
    float3 _6975 = float3(_2303, _2305, _2315);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6975, float3(0.0), isnan(_6975)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6975, float3(0.0), isnan(_6975)), level(0.0)).x;
    float3 _6984 = float3(_2303, _2305, _2315);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6984, float3(0.0), isnan(_6984)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6984, float3(0.0), isnan(_6984)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    if (_1764)
    {
        _2267 = 1.0;
    }
    float _2346 = _2267;
    bool _2348 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan(0.5);
    bool _2356 = _2352 || _2354;
    float _2358 = _2346;
    if (_2356)
    {
        _2287 = 1.0;
    }
    float _2360 = _2287;
    float _2362 = _2360;
    if (!_2356)
    {
        float _2364 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2366 = _2364 * 0.15915493667125701904296875;
        float _2368 = _2366 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        float _2372 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2374 = _2372 * 0.15915493667125701904296875;
        float _2376 = _2366 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        float _2380 = 1.0 / _2370;
        float _2382 = _2374 * 6.283185482025146484375;
        float _2384 = cos(_2382);
        float _2386 = _2378 * _2380;
        float _2388 = _2374 * 6.283185482025146484375;
        float _2390 = sin(_2388);
        float _2392 = _2384 * _2386;
        float _2394 = 1.0 / _2392;
        float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2398 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2396;
        float _2400 = 1.0 / _2398;
        float _2402 = _2390 * _2394;
        float _2404 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2406 = fma(_1720, _2402, _2404);
        float _2408 = _2406 * _2400;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        _2319 = _2400;
        _2217 = _2374;
        _2321 = _2398;
        _2362 = _2410;
    }
    float _2412 = _2319;
    float _2414 = _2217;
    float _2416 = _2321;
    float _2418 = _2362;
    float _2420 = _2412;
    float _2422 = _2414;
    if (!_1764)
    {
        int _2424 = _1807 << 4;
        int _2426 = _2424 + 2048;
        uint _2428 = uint(int(uint(_2426) >> uint(2)));
        uint _2430 = uint(int(uint(int(_2428)) >> uint(2)));
        int _2432 = int(_2428) & 3;
        float _2434 = (*spvDescriptorSet0.vp_c15)._m0[int(_2430)][_2432];
        int _2436 = int(_2428) + 1;
        uint _2438 = uint(int(uint(_2436) >> uint(2)));
        int _2440 = _2436 & 3;
        float _2442 = (*spvDescriptorSet0.vp_c15)._m0[int(_2438)][_2440];
        int _2444 = _2426 + 8;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        uint _2448 = uint(int(uint(int(_2446)) >> uint(2)));
        int _2450 = int(_2446) & 3;
        float _2452 = (*spvDescriptorSet0.vp_c15)._m0[int(_2448)][_2450];
        int _2454 = int(_2446) + 1;
        uint _2456 = uint(int(uint(_2454) >> uint(2)));
        int _2458 = _2454 & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        float _2462 = _1638 * _2442;
        float _2464 = fma(_1528, _2434, _2462);
        float _2466 = fma(_1536, _2452, _2464);
        float _2468 = _2466 + _2460;
        float _2470 = precise::clamp(_2468, 0.0, 1.0);
        float _2472 = -_2470;
        float _2474 = _2472 + _2325;
        float _2476 = fma(_2474, 500.0, 1.5);
        float _2478 = exp2(_2476);
        float _2480 = 0.0 + _2478;
        float _2482 = precise::clamp(_2480, 0.0, 1.0);
        _2420 = _2442;
        _2358 = _2482;
    }
    float _2484 = _2420;
    float _2486 = _2358;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2147 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2149 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2151 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = fma(_2494, _2494, _2500);
    float _2504 = fma(_2498, _2498, _2502);
    float _2506 = rsqrt(_2504);
    float _2508 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2510 = _2494 * _2508;
    float _2512 = _2498 * _2508;
    float _2514 = _2510 * _2510;
    float _2516 = _2512 * _2512;
    float _2518 = _2514 + _2516;
    float _2520 = sqrt(_2518);
    bool _2522 = _2520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2526 = _2520 + _2524;
    float _2528 = _2506;
    float _2530 = _2484;
    float _2532 = _2526;
    if (_2522)
    {
        float _2534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2528 = _2534;
    }
    float _2536 = _2528;
    if (_2522)
    {
        float _2538 = rsqrt(_2518);
        _2530 = _2538;
    }
    float _2540 = _2530;
    float _2542 = _2540;
    if (_2522)
    {
        float _2544 = _2526 * _2536;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2522)
    {
        float _2548 = _2546 * 0.15915493667125701904296875;
        _2422 = _2548;
    }
    float _2550 = _2422;
    float _2552 = _2498;
    float _2554 = _2550;
    if (_2522)
    {
        float _2556 = _2550 * 6.283185482025146484375;
        float _2558 = sin(_2556);
        _2552 = _2558;
    }
    float _2560 = _2552;
    float _2562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2564 = precise::max(0.0, _2562);
    float _2566 = _2416;
    float _2568 = _2564;
    float _2570 = _2562;
    if (_2522)
    {
        float _2572 = _2550 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2566 = _2574;
    }
    float _2576 = _2566;
    float _2578 = -_2508;
    float _2580 = -_2564;
    float _2582 = fma(_2490, _2578, _2580);
    if (_2522)
    {
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2568 = _2584;
    }
    float _2586 = _2568;
    float _2588 = _2560;
    float _2590 = _2586;
    if (_2522)
    {
        float _2592 = fma(_2560, _2586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2588 = _2592;
    }
    float _2594 = _2588;
    float _2596 = _2594;
    if (!_2522)
    {
        _2590 = _2510;
    }
    float _2598 = _2590;
    float _2600 = _2598;
    float _2602 = _2576;
    if (_2522)
    {
        float _2604 = _2576 + (-1.0);
        _2570 = _2604;
    }
    float _2606 = _2570;
    float _2608 = _2606;
    if (_2522)
    {
        float _2610 = _2540 * _2594;
        _1943 = _2610;
    }
    float _2612 = _1943;
    if (!_2522)
    {
        _2596 = _2582;
    }
    float _2614 = _2596;
    float _2616 = _2614;
    if (_2522)
    {
        float _2618 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2554 = _2618;
    }
    float _2620 = _2554;
    if (_2522)
    {
        float _2622 = _2510 * _2612;
        _2600 = _2622;
    }
    float _2624 = _2600;
    if (!_2522)
    {
        _2608 = _2512;
    }
    float _2626 = _2608;
    float _2628 = _2626;
    if (_2522)
    {
        float _2630 = _2512 * _2612;
        _2628 = _2630;
    }
    float _2632 = _2628;
    if (!_2522)
    {
        _2542 = _2514;
    }
    float _2634 = _2542;
    float _2636 = _2634;
    if (_2522)
    {
        float _2638 = fma(_2582, _2576, _2620);
        _2616 = _2638;
    }
    float _2640 = _2616;
    if (_2522)
    {
        float _2642 = _2624 * _2624;
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (!_2522)
    {
        _2602 = _2516;
    }
    float _2646 = _2602;
    float _2648 = sqrt(_2504);
    float _2650 = _2646;
    if (_2522)
    {
        float _2652 = _2632 * _2632;
        _2650 = _2652;
    }
    float _2654 = _2650;
    float _2656 = fma(_2640, _2640, _2644);
    float _2658 = _2656 + _2654;
    float _2660 = rsqrt(_2658);
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2664 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2662);
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    float _2668 = -_2666;
    float _2670 = _2668 + 1.0;
    float _2672 = abs(_2670);
    float _2674 = log2(_2672);
    float _2676 = _2660 * _2624;
    float _2678 = _2660 * _2640;
    float _2680 = _2660 * _2632;
    float _2682 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2684 = -_2682;
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2684);
    float _2688 = -_2680;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2686);
    float _2692 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2694 = fma(_2690, -0.5, 0.5);
    float _2696 = fma(_2690, 0.5, 0.5);
    float _2698 = _2678 + 1.0;
    float _2700 = exp2(_2692);
    float _2702 = fma(_2696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2704 = fma(_2696, _2702, -0.212114393711090087890625);
    float _2706 = sqrt(_2694);
    float _2708 = fma(_2696, _2704, 1.570728778839111328125);
    float _2710 = -_2678;
    float _2712 = fma(_2700, _2698, _2710);
    float _2714 = _2706 * 0.636619746685028076171875;
    float _2716 = fma(_2712, 0.5, 0.5);
    float _2718 = -_2708;
    float _2720 = fma(_2714, _2718, 1.0);
    float2 _7558 = float2(_2720, _2716);
    float3 _2722 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7558, float2(0.0), isnan(_7558)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7558, float2(0.0), isnan(_7558)), level(0.0)).xyz;
    float _2724 = _2722.x;
    float _2726 = _2722.y;
    float _2728 = _2722.z;
    float _2730 = abs(_1720);
    float _2732 = log2(_2730);
    float _2734 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2736 = _2235 * 0.5;
    float _2738 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2740 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2734);
    float _2742 = fma(_2265, -0.5, _2736);
    float _2744 = -_1626;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2740);
    float _2750 = exp2(_2738);
    bool _2752 = _1720 <= 8000.0;
    bool _2754 = isnan(_1720);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan(8000.0);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    out.m_109.x = _1528;
    out.m_109.y = _1532;
    out.m_109.z = _1536;
    float _2764 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2748);
    float _2766 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2768 = _2263 + _2235;
    out.gl_Position.x = _2263;
    out.gl_Position.y = _2265;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2235;
    float _2770 = _2764 + _2235;
    bool _2772 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2774 = isnan(_2648);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2780 = _2776 || _2778;
    float _2782 = _2768 * 0.5;
    float _2784 = exp2(_2766);
    float _2786 = _2770 * 0.5;
    out.m_111.x = _2149;
    out.m_111.y = _2147;
    out.m_111.z = _2151;
    out.m_113.x = _2782;
    out.m_113.y = _2742;
    out.m_113.z = _2786;
    out.m_113.w = _2235;
    float _2788 = -_2750;
    float _2790 = _2788 + 1.0;
    float _2792 = _2418 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2794 = _2750;
    if (!_2780)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2796 = _2794;
    float _2798 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2800 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2802 = precise::clamp(_2800, 0.0, 1.0);
    float _2804 = fma(_2802, -2.0, 3.0);
    float _2806 = _2802 * _2802;
    float _2808 = _2806 * _2804;
    float _2810 = -_2808;
    float _2812 = _2810 + 1.0;
    float _2814 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2808);
    float _2816 = _2808;
    float _2818 = _2796;
    float _2820 = _2796;
    if (!_2209)
    {
        _2816 = 1.0;
    }
    float _2822 = _2816;
    float _2824 = _2822;
    if (_2209)
    {
        bool _2826 = _2331 >= _2313;
        bool _2828 = isnan(_2331);
        bool _2830 = _2826 || _2828;
        bool _2832 = isnan(_2313);
        bool _2834 = _2830 || _2832;
        float _2836 = float(_2834);
        _2824 = _2836;
    }
    float _2838 = _2824;
    float _2840 = _2762 * _2814;
    float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2844 = _2838 * _2486;
    float _2846 = _2746 * _2842;
    float _2848 = precise::clamp(_2846, 0.0, 1.0);
    float _2850 = _2798 * _2333;
    float _2852 = -_2798;
    float _2854 = _2852 + 1.0;
    float _2856 = -_2848;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2860 = _2344 * _2850;
    float _2862 = _2344 * _2854;
    float _2864 = _2854;
    float _2866 = _2848;
    float _2868 = _2858;
    float _2870 = _2850;
    if (!_2780)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2872 = _2864;
    float _2874 = -_2844;
    float _2876 = fma(_2874, _2858, 1.0);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = _2878;
    float _2882 = _2872;
    float _2884 = _2872;
    if (!_2780)
    {
        _2866 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2886 = _2866;
    float _2888 = _2886;
    float _2890 = _2886;
    if (!_2780)
    {
        _2868 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2892 = _2868;
    float _2894 = _2878 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2896 = _2892;
    float _2898 = _2892;
    if (!_2780)
    {
        _2880 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2900 = _2880;
    out.m_115.x = _2894;
    float _2902 = _2728 * _2850;
    float _2904 = fma(_2724, _2860, _2338);
    float _2906 = fma(_2726, _2860, _2340);
    float _2908 = _2900;
    float _2910 = _2900;
    if (!_2780)
    {
        _2870 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2912 = _2870;
    float _2914 = fma(_2344, _2902, _2342);
    out.m_117.x = _2904;
    out.m_117.y = _2906;
    out.m_117.z = _2914;
    out.m_117.w = _2862;
    bool _2916 = !_2780;
    float _2918 = _2912;
    float _2920 = _2912;
    if (!_2916)
    {
        bool _2922 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2924 = isnan(_2648);
        bool _2926 = _2922 || _2924;
        bool _2928 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2930 = _2926 || _2928;
        if (!_2930)
        {
            float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2934 = _2648 + _2932;
            float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2938 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2936;
            float _2940 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2944 = 1.0 / _2938;
            float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2962 = _2934 * _2944;
            float _2964 = precise::clamp(_2962, 0.0, 1.0);
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2970 = fma(_2964, _2942, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2972 = fma(_2964, _2968, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2974 = fma(_2964, _2948, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2976 = fma(_2964, _2952, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2978 = fma(_2964, _2956, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2980 = fma(_2964, _2960, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2820 = _2974;
            _2898 = _2978;
            _2884 = _2970;
            _2890 = _2976;
            _2920 = _2972;
            _2910 = _2980;
            _2982 = true;
        }
        else
        {
            bool _2984 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2986 = isnan(_2648);
            bool _2988 = _2984 || _2986;
            bool _2990 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2992 = _2988 || _2990;
            if (!_2992)
            {
                _2882 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2994 = _2882;
            _2884 = _2994;
            if (!_2992)
            {
                _2818 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2996 = _2818;
            _2820 = _2996;
            if (!_2992)
            {
                _2918 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2998 = _2918;
            _2920 = _2998;
            if (!_2992)
            {
                _2888 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3000 = _2888;
            _2890 = _3000;
            if (!_2992)
            {
                _2896 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3002 = _2896;
            _2898 = _3002;
            if (!_2992)
            {
                _2908 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3004 = _2908;
            bool _3006 = !_2992;
            _2910 = _3004;
            if (!_3006)
            {
                bool _3008 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3010 = isnan(_2648);
                bool _3012 = _3008 || _3010;
                bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3016 = _3012 || _3014;
                if (!_3016)
                {
                    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3020 = _2648 + _3018;
                    float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3024 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3022;
                    float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3030 = 1.0 / _3024;
                    float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3048 = _3020 * _3030;
                    float _3050 = precise::clamp(_3048, 0.0, 1.0);
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3056 = fma(_3050, _3028, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3058 = fma(_3050, _3054, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3060 = fma(_3050, _3034, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3062 = fma(_3050, _3038, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3064 = fma(_3050, _3042, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3066 = fma(_3050, _3046, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2820 = _3060;
                    _2898 = _3064;
                    _2884 = _3056;
                    _2890 = _3062;
                    _2920 = _3058;
                    _2910 = _3066;
                    _2982 = true;
                }
                else
                {
                    _2820 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2898 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2884 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2890 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2920 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2910 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2982 = false;
    float _3068 = _2820;
    float _3070 = _2898;
    float _3072 = _2884;
    float _3074 = _2890;
    float _3076 = _2920;
    float _3078 = _2910;
    float _3080 = _2792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3082 = fma(_1500, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3068;
    float _3088 = _3086 + _3070;
    float _3090 = -_3072;
    float _3092 = _3090 + _3074;
    out.m_63.x = _3080;
    float _3094 = fma(_3084, _3088, _3068);
    float _3096 = -_3076;
    float _3098 = _3096 + _3078;
    float _3100 = fma(_3084, _3092, _3072);
    float _3102 = _3094 * 0.586610972881317138671875;
    bool _3104 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3106 = fma(_3084, _3098, _3076);
    out.m_119.x = 0.0;
    float _3108 = fma(_3100, 0.298911988735198974609375, _3102);
    bool _3110 = _2418 > 0.0;
    bool _3112 = isnan(_2418);
    bool _3114 = _3110 || _3112;
    bool _3116 = isnan(0.0);
    bool _3118 = _3114 || _3116;
    float _3120 = fma(_3106, 0.114477999508380889892578125, _3108);
    float _3122 = -_3120;
    float _3124 = _3100 + _3122;
    float _3126 = -_3120;
    float _3128 = _3094 + _3126;
    float _3130 = -_3120;
    float _3132 = _3106 + _3130;
    float _3134 = fma(_3124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    float _3136 = fma(_3128, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    float _3138 = fma(_3132, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    bool _3140 = !_3104;
    if (!_3140)
    {
        float _3142 = -_2147;
        float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3146 = -_2149;
        float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3150 = -_2151;
        float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3154 = _3144 * _3144;
        float _3156 = fma(_3148, _3148, _3154);
        float _3158 = fma(_3152, _3152, _3156);
        float _3160 = sqrt(_3158);
        float _3162 = rsqrt(_3158);
        float _3164 = -_3160;
        float _3166 = _3164 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3168 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3170 = precise::clamp(_3168, 0.0, 1.0);
        float _3172 = _3148 * _3162;
        float _3174 = _3144 * _3162;
        float _3176 = abs(_3170);
        float _3178 = log2(_3176);
        float _3180 = _3152 * _3162;
        float _3182 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3184 = _1500 * _3174;
        float _3186 = -_3174;
        float _3188 = -_3182;
        float _3190 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3188);
        float _3192 = fma(_1498, _3172, _3184);
        float _3194 = -_3180;
        float _3196 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3190);
        float _3198 = fma(_1502, _3180, _3192);
        float _3200 = precise::clamp(_3198, 0.0, 1.0);
        float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3204 = _3196 + _3202;
        float _3206 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3208 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3210 = precise::clamp(_3208, 0.0, 1.0);
        float _3212 = exp2(_3206);
        float _3214 = _3212 * _3210;
        float _3216 = _3200 * _3214;
        float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3220 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3222 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_119.x = _3218;
        out.m_119.y = _3220;
        out.m_119.z = _3222;
    }
    out.m_87.x = _3134;
    out.m_87.y = _3136;
    out.m_87.z = _3138;
    if (_3118)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3224 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3224;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_117 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_119 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2982 = false;
    bool _1578 = false;
    bool _688 = false;
    bool _546 = false;
    bool _258 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _133 = in.m_60.w;
    float _135 = trunc(_133);
    int _138 = int(_135);
    bool _142 = _138 >= 1;
    float _144 = 0.0;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    float _148 = _146;
    if (!_142)
    {
        out.m_63.x = 0.0;
    }
    int _150 = 0;
    if (!_142)
    {
        float _152 = _146 * 5.0;
        _150 = as_type<int>(_152);
    }
    int _154 = _150;
    int _156 = _154;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3281 = as_type<float>(_154);
        out.gl_Position.z = _3281;
    }
    if (!_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_117.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_117.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_117.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_117.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_119.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_119.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_119.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_119.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_65.w;
    bool _160 = _158 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_158);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = -_158;
    float _172 = _170 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _174 = _172;
    if (_168)
    {
        float _176 = float(_138);
        _148 = _176;
    }
    float _178 = _148;
    bool _180 = _172 >= _178;
    bool _182 = !_168;
    bool _184 = _180 || _182;
    float _186 = _178;
    if (_184)
    {
        _186 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _188 = _186;
    if (_184)
    {
        out.m_63.x = 0.0;
    }
    if (_184)
    {
        float _190 = _188 * 5.0;
        _156 = as_type<int>(_190);
    }
    int _192 = _156;
    if (_184)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3351 = as_type<float>(_192);
        out.gl_Position.z = _3351;
    }
    if (_184)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_117.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_117.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_117.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_117.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_119.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_119.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_119.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_119.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _194 = in.m_67.x;
    float _196 = in.m_67.y;
    float _198 = in.m_67.z;
    bool _200 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = in.m_73.x;
    float _216 = in.m_73.y;
    float _218 = in.m_73.z;
    float _220 = _196 * _204;
    float _222 = _196 * _210;
    float _224 = fma(_194, _202, _220);
    float _226 = _196 * _216;
    float _228 = fma(_194, _208, _222);
    float _230 = fma(_198, _206, _224);
    float _232 = fma(_194, _214, _226);
    float _234 = fma(_198, _212, _228);
    float _236 = fma(_198, _218, _232);
    bool _238 = !_200;
    float _256;
    if (!_238)
    {
        float _240 = in.m_75.x;
        float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _244 = _240 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[12].x, _172);
        float _248 = _246 * _242;
        float _250 = floor(_248);
        float _252 = -_250;
        float _254 = _248 + _252;
        _256 = _254;
        _258 = true;
    }
    else
    {
        float _260 = float(_138);
        float _262 = 1.0 / _260;
        float _264 = _172 * _262;
        _256 = _264;
    }
    _258 = false;
    float _266 = _256;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _270 = _266 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _266 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = _266 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _296 = 1.0 / _282;
    bool _298 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _300 = isnan(_266);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    bool _310 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _312 = isnan(_266);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _286;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = -_320;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _290;
    float _334 = _270 * _296;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _266 + _336;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = fma(_326, _334, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _344 = 1.0 / _294;
    float _346 = _274 * _322;
    bool _348 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _350 = isnan(_266);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_358;
    float _362 = _360 + 1.0;
    float _364 = _278 * _332;
    float _366 = _338 * _344;
    bool _368 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _370 = isnan(_266);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = _378 * _362;
    float _382 = -_378;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _390;
    float _394 = _308 * _384;
    float _396 = -_308;
    float _398 = _396 + 1.0;
    float _400 = fma(_388, _334, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _404 = _266 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_266);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = _320 * _398;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = _414 * _330;
    float _432 = fma(_420, _346, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_424, _346, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_428, _346, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = _342 * _430;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _444;
    float _448 = _400 * _430;
    float _450 = _402 * _430;
    float _452 = -_414;
    float _454 = _452 + 1.0;
    float _456 = in.m_77.x;
    float _458 = in.m_77.y;
    float _460 = in.m_77.z;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _462;
    float _466 = fma(_442, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_446, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _472 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _474 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _476 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _478 = fma(_434, _416, _470);
    float _480 = fma(_432, _416, _472);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_436, _416, _474);
    float _496 = fma(_484, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _498 = fma(_488, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_492, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_466, _394, _478);
    float _504 = fma(_468, _394, _480);
    float _506 = fma(_476, _394, _494);
    float _508 = fma(_496, _380, _502);
    float _510 = fma(_498, _380, _504);
    float _512 = fma(_500, _380, _506);
    float _514 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].x, _508);
    float _516 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].y, _510);
    float _518 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[147].z, _512);
    float _520 = _514 * _456;
    float _522 = _516 * _458;
    float _524 = _518 * _460;
    bool _526 = !_340;
    float _544;
    if (!_526)
    {
        float _528 = in.m_75.x;
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[11].y, _172);
        float _536 = _534 * _530;
        float _538 = floor(_536);
        float _540 = -_538;
        float _542 = _536 + _540;
        _544 = _542;
        _546 = true;
    }
    else
    {
        float _548 = float(_138);
        float _550 = 1.0 / _548;
        float _552 = _172 * _550;
        _544 = _552;
    }
    _546 = false;
    float _554 = _544;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _554 + _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _564 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _566 = isnan(_554);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _580 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_554);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _592;
    bool _596 = _554 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _598 = isnan(_554);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = 1.0 / _562;
    float _610 = -_574;
    float _612 = _610 + 1.0;
    bool _614 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _616 = 1.0 / _578;
    float _618 = _594 * _608;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = fma(_618, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _630 = _590 * _612;
    float _632 = -_590;
    float _634 = _632 + 1.0;
    float _636 = _574 * _626;
    float _638 = _622 * _616;
    float _640 = _628 * _630;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _644 = _554 + _642;
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _648 = fma(_638, _644, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_648, _636, _646);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[117].x, _652);
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_79.x = _660;
    out.m_79.y = _662;
    out.m_79.z = _664;
    out.m_79.w = _666;
    bool _668 = !_614;
    float _686;
    if (!_668)
    {
        float _670 = in.m_75.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _172);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_138);
        float _692 = 1.0 / _690;
        float _694 = _172 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_60.x;
    float _700 = in.m_60.y;
    float _702 = in.m_60.z;
    float _704 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _708 = in.m_71.w;
    float _710 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _712 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _714 = in.m_69.w;
    float _716 = in.m_73.w;
    float _718 = _210 * _700;
    float _720 = _204 * _700;
    float _722 = _216 * _700;
    float _724 = fma(_208, _698, _718);
    float _726 = fma(_202, _698, _720);
    float _728 = fma(_214, _698, _722);
    float _730 = fma(_212, _702, _724);
    float _732 = fma(_206, _702, _726);
    float _734 = fma(_218, _702, _728);
    float _736 = _730 + _708;
    float _738 = _732 + _714;
    float _740 = _734 + _716;
    float _742 = in.m_81.x;
    float _744 = in.m_81.y;
    float _746 = in.m_81.z;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _736 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = _738 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _740 + _756;
    float _760 = _750 * _750;
    float _762 = fma(_754, _754, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = sqrt(_764);
    float _768 = rsqrt(_764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _774 = precise::min(_710, _770);
    float _776 = _768 * _774;
    float _778 = _750 * _776;
    float _780 = _754 * _776;
    float _782 = _758 * _776;
    float _784 = -_778;
    float _786 = _750 + _784;
    float _788 = -_780;
    float _790 = _754 + _788;
    float _792 = -_782;
    float _794 = _758 + _792;
    float _796 = _786 * _786;
    float _798 = fma(_790, _790, _796);
    float _800 = fma(_794, _794, _798);
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _742);
    float _804 = sqrt(_800);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _746);
    float _808 = _768 * _804;
    float _810 = _706 * _808;
    float _812 = _704 * _808;
    float _814 = _712 * _808;
    float _816 = _810 * _772;
    float _818 = _812 * _802;
    float _820 = _814 * _806;
    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _828 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].x, _822);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].x, _826);
    float _834 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _828);
    float _836 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _830);
    float _838 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _832);
    float _840 = _834 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _842 = _836 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _844 = _838 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _846 = _740 + _840;
    float _848 = _738 + _842;
    float _850 = _736 + _844;
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _854 = _846 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _858 = _848 + _856;
    float _860 = _854 * _854;
    float _862 = fma(_858, _858, _860);
    float _864 = sqrt(_862);
    bool _866 = _864 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _714;
    float _870 = _848;
    float _872 = _846;
    if (!_866)
    {
        _868 = _850;
    }
    float _874 = _868;
    bool _876 = !_866;
    float _878 = _874;
    if (!_876)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _884 = _864 + _882;
        float _886 = rsqrt(_862);
        float _888 = _884 * _880;
        float _890 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = _888 * 0.15915493667125701904296875;
        float _894 = _892 * 6.283185482025146484375;
        float _896 = cos(_894);
        float _898 = _892 * 6.283185482025146484375;
        float _900 = sin(_898);
        float _902 = _896 + (-1.0);
        float _904 = fma(_900, _890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _906 = _902 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _886 * _904;
        float _910 = fma(_850, _896, _906);
        float _912 = fma(_858, _908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _914 = fma(_854, _908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _870 = _912;
        _872 = _914;
        _878 = _910;
    }
    float _916 = _870;
    float _918 = _872;
    float _920 = _878;
    float _922 = fma(_916, 6.2500002968590706586837768554688e-05, 0.5);
    float _924 = fma(_918, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4540 = float2(_922, _924);
    float3 _928 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4540, float2(0.0), isnan(_4540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4540, float2(0.0), isnan(_4540)), level(0.0)).xyz;
    float _930 = _928.x;
    float _932 = _928.y;
    float _934 = _928.z;
    float _936 = in.m_83.y;
    float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _940 = in.m_75.w;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _944 = _942 != 0;
    float _946 = in.m_75.x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _950 = in.m_75.z;
    float _952 = in.m_75.y;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _960 = _958 != 0;
    out.m_85.x = 1.0;
    out.m_85.y = 1.0;
    out.m_85.z = 1.0;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _964 = _962 != 0;
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _968 = _966 != 0;
    float _970 = -_936;
    float _972 = _970 + 1.0;
    float _974 = in.m_83.x;
    bool _976 = _940 > 0.5;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = _946 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _982 = _976 ? as_type<int>(_972) : as_type<int>(_936);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _988 = _986 != 0;
    float _990 = -_948;
    float _992 = fma(_980, 2.0, _990);
    bool _994 = _950 > 0.5;
    float _996 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[78].z, _984);
    float _998 = 0.0;
    float _1000 = _950;
    float _1002 = _936;
    float _1004 = _938;
    float _1006 = _974;
    if (!_944)
    {
        _998 = _950;
    }
    float _1008 = _998;
    out.m_87.w = _774;
    float _1010 = 0.0;
    float _1012 = _1008;
    if (!_944)
    {
        _1010 = _952;
    }
    float _1014 = _1010;
    float _1016 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[77].z, _996);
    float _1018 = _1014;
    if (_944)
    {
        _1018 = _946;
    }
    float _1020 = _1018;
    out.m_89.x = _812;
    int _1022 = as_type<int>(_1020);
    if (_944)
    {
        _1012 = _952;
    }
    float _1024 = _1012;
    float _1026 = _1024;
    if (_944)
    {
        _1000 = _952;
    }
    float _1028 = _1000;
    float _1030 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1038 = in.m_91.x;
    float _1040 = in.m_91.y;
    float _1042 = in.m_91.z;
    float _1044 = in.m_91.w;
    float _1046 = _964 ? as_type<float>(_982) : _936;
    bool _1048 = _952 > 0.5;
    int _1050 = _1048 ? as_type<int>(_972) : as_type<int>(_936);
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1056 = _1034 ? as_type<float>(_1050) : _936;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1062 = _952 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1064 = _1034;
    if (_956)
    {
        bool _1066 = _946 > 0.5;
        _1064 = _1066;
    }
    bool _1068 = _1064;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1070;
    float _1074 = 1.0 / _1054;
    float _1076 = fma(_1062, -2.0, _978);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1082 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1076);
    if (_988)
    {
        float _1084 = _994 ? _972 : _936;
        _1002 = _1084;
    }
    float _1086 = _1002;
    float _1088 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1090 = 1.0 / _1060;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1094 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1088);
    float _1098 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1100 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1092);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1106 = 1.0 / _1080;
    float _1108 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1110 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1098);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1112;
    float _1116 = _1072 * _1074;
    float _1118 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1108);
    float _1120 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1110);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1124 = _696 + _1122;
    float _1126 = _1104 * _1090;
    float _1128 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1096);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1132 = _696 + _1130;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1136 = _744 != 0.0;
    bool _1138 = isnan(_744);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    out.m_93.x = _1118;
    out.m_93.y = _1128;
    out.m_93.z = _1120;
    if (!_960)
    {
        _1026 = _974;
    }
    float _1146 = _1026;
    float _1148 = _1114 * _1106;
    float _1150 = fma(_1116, _1132, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1152 = fma(_1126, _1124, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1154 = _938 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1160 = _696 + _1158;
    bool _1162 = _742 == 0.0;
    bool _1164 = !_1144;
    bool _1166 = _1162 && _1164;
    float _1168 = fma(_1154, _1056, -0.5);
    bool _1170 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1172 = isnan(_696);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1178 = _1174 || _1176;
    float _1180 = float(_1178);
    float _1182 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1156);
    float _1184 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1100);
    float _1186 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1188 = fma(_1148, _1160, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1190 = -_1180;
    float _1192 = _1190 + 1.0;
    float _1194 = -_1082;
    float _1196 = fma(_1184, _1168, _1194);
    float _1198 = fma(_1046, _1186, -0.5);
    bool _1200 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1202 = isnan(_696);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1214 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1216 = isnan(_696);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    bool _1226 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1228 = isnan(_696);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1210;
    float _1240 = _1238 + 1.0;
    float _1242 = _1210 * _1192;
    float _1244 = in.m_95.x;
    float _1246 = in.m_95.y;
    float _1248 = in.m_95.z;
    float _1250 = _1236 * _1240;
    float _1252 = -_1236;
    float _1254 = _1252 + 1.0;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1258 = _1224 * _1254;
    bool _1260 = _746 == 0.0;
    bool _1262 = _1260 && _1166;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1266 = as_type<int>(_1256);
    float _1268 = _1146;
    float _1270 = _1182;
    if (!_956)
    {
        _1004 = _974;
    }
    float _1272 = _1004;
    float _1274 = _1150 * _1258;
    float _1276 = -_1256;
    float _1278 = fma(_1030, 2.0, _1276);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1282 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1264);
    int _1284 = as_type<int>(_1280);
    float _1286 = _1272;
    float _1288 = _1274;
    if (_960)
    {
        float _1290 = -_974;
        float _1292 = _1290 + 1.0;
        _1266 = as_type<int>(_1292);
    }
    int _1294 = _1266;
    if (_956)
    {
        float _1296 = -_974;
        float _1298 = _1296 + 1.0;
        _1022 = as_type<int>(_1298);
    }
    int _1300 = _1022;
    float _1302 = fma(_1036, -2.0, _1280);
    if (_968)
    {
        float _1304 = -_974;
        float _1306 = _1304 + 1.0;
        _1284 = as_type<int>(_1306);
    }
    int _1308 = _1284;
    float _1310 = -_1224;
    float _1312 = _1310 + 1.0;
    if (_960)
    {
        float _1314 = _994 ? as_type<float>(_1294) : _974;
        _1268 = _1314;
    }
    float _1316 = _1268;
    float _1318 = -_172;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1278);
    if (_956)
    {
        float _1322 = _1068 ? as_type<float>(_1300) : _974;
        _1286 = _1322;
    }
    float _1324 = _1286;
    float _1326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (_968)
    {
        float _1328 = _1048 ? as_type<float>(_1308) : _974;
        _1006 = _1328;
    }
    float _1330 = _1006;
    float _1332 = -_172;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[76].x, _992);
    float _1336 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1274);
    float _1338 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1282);
    float _1340 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1182);
    if (_1262)
    {
        _1270 = _1246;
    }
    float _1342 = _1270;
    float _1344 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1348 = _1342;
    if (!_1262)
    {
        float _1350 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1246);
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1302);
    float _1356 = fma(_1152, _1250, _1336);
    float _1358 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1262)
    {
        _174 = _1244;
    }
    float _1360 = _174;
    float _1362 = _1042 * _1244;
    float _1364 = _1360;
    if (!_1262)
    {
        float _1366 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1244);
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1372 = fma(_1344, _1324, -0.5);
    float _1374 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1376 = fma(_1188, _1242, _1356);
    float _1378 = _1038 * _1246;
    float _1380 = _1040 * _1248;
    float _1382 = -_1362;
    float _1384 = fma(_1038, _1248, _1382);
    float _1386 = _1358 * _1326;
    float _1388 = _1374 * _1346;
    float _1390 = -_1380;
    float _1392 = fma(_1042, _1246, _1390);
    float _1394 = _1384 * _1044;
    float _1396 = fma(_1016, _1372, _1334);
    float _1398 = -_778;
    float _1400 = _1398 + _920;
    out.m_97.x = _1388;
    out.m_97.y = _1386;
    float _1402 = _1392 * _1044;
    float _1404 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1376);
    float _1406 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1408 = -_780;
    float _1410 = _1408 + _916;
    if (_1262)
    {
        _1288 = _1248;
    }
    float _1412 = _1288;
    float _1414 = _1412;
    if (!_1262)
    {
        float _1416 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1414 = _1416;
    }
    float _1418 = _1414;
    float _1420 = fma(_1406, _1316, -0.5);
    float _1422 = -_1378;
    float _1424 = fma(_1040, _1244, _1422);
    float _1426 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1428 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1430 = fma(_1338, _1420, _1320);
    float _1432 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1434 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1436 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1428);
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1440 = _1400 + _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1444 = _1410 + _1442;
    float _1446 = -_782;
    float _1448 = _1446 + _918;
    float _1450 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1432);
    float _1452 = _1440 * _1440;
    float _1454 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1426);
    float _1456 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1434);
    float _1458 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1460 = fma(_1444, _1444, _1452);
    float _1462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1464 = _1448 + _1462;
    float _1466 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1468 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1458);
    float _1470 = fma(_1464, _1464, _1460);
    float _1472 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1466);
    float _1474 = _1424 * _1044;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1478 = sqrt(_1470);
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1436);
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1486 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1468);
    float _1488 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1496 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1472);
    float _1498 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    float _1500 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1454);
    float _1502 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1456);
    out.m_99.x = _1488;
    out.m_99.y = _1490;
    out.m_99.z = _1492;
    out.m_99.w = _1494;
    float _1504 = -_1354;
    float _1506 = fma(_1340, _1198, _1504);
    float _1508 = _1196 + 0.5;
    bool _1510 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1512 = isnan(_1478);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1518 = _1514 || _1516;
    out.m_101.x = _1482;
    out.m_101.y = _1486;
    out.m_101.z = _1496;
    float _1520 = _1506 + 0.5;
    float _1522 = _1430 + 0.5;
    float _1524 = _1396 + 0.5;
    out.m_103.x = _1498;
    out.m_103.y = _1500;
    out.m_103.z = _1502;
    float _1526 = -_780;
    float _1528 = _738 + _1526;
    float _1530 = -_778;
    float _1532 = _736 + _1530;
    float _1534 = -_782;
    float _1536 = _740 + _1534;
    out.m_105.x = _1524;
    out.m_105.y = _1508;
    out.m_105.z = _1522;
    out.m_105.w = _1520;
    float _1538 = _1524;
    int _1540 = as_type<int>(_1490);
    int _1542 = as_type<int>(_1488);
    if (!_1518)
    {
        _1538 = 1.0;
    }
    float _1544 = _1538;
    out.m_107.x = _930;
    out.m_107.y = _932;
    out.m_107.z = _934;
    bool _1546 = !_1518;
    float _1548 = _1544;
    if (!_1546)
    {
        bool _1550 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1552 = isnan(_1478);
        bool _1554 = _1550 || _1552;
        bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1558 = _1554 || _1556;
        if (!_1558)
        {
            float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1562 = _1478 + _1560;
            float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1566 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1564;
            float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1572 = 1.0 / _1566;
            float _1574 = _1562 * _1572;
            float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1548 = _1576;
            _1578 = true;
        }
        else
        {
            bool _1580 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1582 = isnan(_1478);
            bool _1584 = _1580 || _1582;
            bool _1586 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1588 = _1584 || _1586;
            if (!_1588)
            {
                float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1592 = _1478 + _1590;
                float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1596 = _1594 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1598 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1600 = _1598 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1602 = 1.0 / _1596;
                float _1604 = _1592 * _1602;
                float _1606 = fma(_1604, _1600, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1548 = _1606;
                _1578 = true;
            }
            else
            {
                _1548 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1578 = false;
    float _1608 = _1548;
    float _1610 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1612 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1614 = floor(_1610);
    float _1616 = floor(_1612);
    float _1618 = -_1614;
    float _1620 = _1610 + _1618;
    float _1622 = -_1616;
    float _1624 = _1612 + _1622;
    float2 _5783 = float2(_1620, _1624);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5783, float2(0.0), isnan(_5783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5783, float2(0.0), isnan(_5783)), level(0.0)).x;
    float _1628 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1630 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1632 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1628);
    float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1636 = _1400 + _1634;
    float _1638 = _1532 + _1630;
    float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1642 = _1410 + _1640;
    float _1644 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1632);
    float _1646 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1648 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1650 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1652 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1654 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1646);
    float _1656 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1648);
    float _1658 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1650);
    float _1660 = 1.0 / _1652;
    float _1662 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1654);
    float _1664 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1656);
    float _1666 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1658);
    float _1668 = fma(_1642, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1670 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1674 = _1666 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1676 = -_1528;
    float _1678 = _1676 + _1668;
    float _1680 = _1670 + _1652;
    float _1682 = trunc(_1672);
    int _1684 = int(_1682);
    float _1686 = _1680 * _1660;
    float _1688 = _1686 * 0.5;
    float _1690 = trunc(_1674);
    int _1692 = int(_1690);
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1696 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1694);
    float _1698 = 1.0 / _1696;
    int _1700 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1702 = _1684 + _1700;
    int _1704 = _1702 + 1;
    int _1706 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1708 = _1692 + _1706;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1636, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1714 = -_1532;
    float _1716 = _1714 + _1712;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1720 = _1698 * _1718;
    int _1722 = _1704 | _1710;
    float _1724 = _1716 * _1716;
    bool _1726 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1728 = fma(_1678, _1678, _1724);
    bool _1730 = _1720 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1732 = !_1726;
    int _1734 = _1732 ? 0 : 1;
    int _1736 = 2;
    int _1738 = _1704;
    float _1740 = _1636;
    float _1742 = _1668;
    float _1744 = _1712;
    float _1746 = _1674;
    if (!_1726)
    {
        _1736 = 1;
    }
    int _1748 = _1736;
    bool _1750 = _1704 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1752 = _1748;
    if (!_1730)
    {
        _1752 = _1734;
    }
    int _1754 = _1752;
    bool _1756 = _1722 < 0;
    bool _1758 = _1756 || _1750;
    int _1760 = _1754 << 6;
    bool _1762 = _1710 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1764 = _1762 || _1758;
    int _1766 = _1760 + 96;
    uint _1769 = uint(int(uint(_1766) >> uint(2)));
    uint _1771 = uint(int(uint(int(_1769)) >> uint(2)));
    int _1773 = int(_1769) & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    int _1777 = int(_1769) + 1;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    int _1781 = _1777 & 3;
    float _1783 = (*spvDescriptorSet0.vp_c15)._m0[int(_1779)][_1781];
    int _1785 = _1760 + 104;
    uint _1787 = uint(int(uint(_1785) >> uint(2)));
    uint _1789 = uint(int(uint(int(_1787)) >> uint(2)));
    int _1791 = int(_1787) & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    int _1795 = int(_1787) + 1;
    uint _1797 = uint(int(uint(_1795) >> uint(2)));
    int _1799 = _1795 & 3;
    float _1801 = (*spvDescriptorSet0.vp_c15)._m0[int(_1797)][_1799];
    if (!_1764)
    {
        int _1803 = _1710 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1805 = _1803 + _1704;
        _1738 = _1805;
    }
    int _1807 = _1738;
    float _1809 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1811 = _1448 + _1809;
    if (!_1764)
    {
        int _1813 = _1807 << 2;
        _1540 = _1813;
    }
    int _1815 = _1540;
    int _1817 = _1760 + 48;
    uint _1819 = uint(int(uint(_1817) >> uint(2)));
    uint _1821 = uint(int(uint(int(_1819)) >> uint(2)));
    int _1823 = int(_1819) & 3;
    float _1825 = (*spvDescriptorSet0.vp_c15)._m0[int(_1821)][_1823];
    int _1827 = int(_1819) + 1;
    uint _1829 = uint(int(uint(_1827) >> uint(2)));
    int _1831 = _1827 & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    int _1835 = _1815;
    if (!_1764)
    {
        uint _1837 = uint(int(uint(_1807) >> uint(2)));
        _1542 = int(_1837);
    }
    int _1839 = _1542;
    float _1841 = fma(_1811, _1608, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1843 = _1841;
    if (!_1764)
    {
        int _1845 = 12 & _1815;
        _1835 = _1845;
    }
    int _1847 = _1835;
    float _1849 = -_1536;
    float _1851 = _1849 + _1841;
    if (!_1764)
    {
        int _1853 = _1839 << 4;
        int _1855 = _1853 + _1847;
        _1740 = as_type<float>(_1855);
    }
    float _1857 = _1740;
    int _1859 = _1760 + 64;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    uint _1863 = uint(int(uint(int(_1861)) >> uint(2)));
    int _1865 = int(_1861) & 3;
    float _1867 = (*spvDescriptorSet0.vp_c15)._m0[int(_1863)][_1865];
    int _1869 = int(_1861) + 1;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    int _1873 = _1869 & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    float _1877 = fma(_1851, _1851, _1728);
    float _1879 = sqrt(_1877);
    int _1881 = _1760 + 56;
    uint _1883 = uint(int(uint(_1881) >> uint(2)));
    uint _1885 = uint(int(uint(int(_1883)) >> uint(2)));
    int _1887 = int(_1883) & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    int _1891 = int(_1883) + 1;
    uint _1893 = uint(int(uint(_1891) >> uint(2)));
    int _1895 = _1891 & 3;
    float _1897 = (*spvDescriptorSet0.vp_c15)._m0[int(_1893)][_1895];
    int _1899 = _1760 + 72;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    uint _1903 = uint(int(uint(int(_1901)) >> uint(2)));
    int _1905 = int(_1901) & 3;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[int(_1903)][_1905];
    int _1909 = int(_1901) + 1;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    int _1913 = _1909 & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    bool _1917 = _1879 > 0.0;
    float _1919 = _1638 * _1783;
    int _1921 = _1760 + 80;
    uint _1923 = uint(int(uint(_1921) >> uint(2)));
    uint _1925 = uint(int(uint(int(_1923)) >> uint(2)));
    int _1927 = int(_1923) & 3;
    float _1929 = (*spvDescriptorSet0.vp_c15)._m0[int(_1925)][_1927];
    int _1931 = int(_1923) + 1;
    uint _1933 = uint(int(uint(_1931) >> uint(2)));
    int _1935 = _1931 & 3;
    float _1937 = (*spvDescriptorSet0.vp_c15)._m0[int(_1933)][_1935];
    float _1939 = fma(_1528, _1775, _1919);
    float _1941 = _1775;
    float _1943 = _1877;
    if (!_1764)
    {
        float _1945 = floor(_1672);
        _1941 = _1945;
    }
    float _1947 = _1941;
    float _1949 = fma(_1536, _1793, _1939);
    int _1951 = _1760 + 88;
    uint _1953 = uint(int(uint(_1951) >> uint(2)));
    uint _1955 = uint(int(uint(int(_1953)) >> uint(2)));
    int _1957 = int(_1953) & 3;
    float _1959 = (*spvDescriptorSet0.vp_c15)._m0[int(_1955)][_1957];
    int _1961 = int(_1953) + 1;
    uint _1963 = uint(int(uint(_1961) >> uint(2)));
    int _1965 = _1961 & 3;
    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[int(_1963)][_1965];
    float _1969 = _1949 + _1801;
    float _1971 = 1.0 / _1969;
    float _1973 = _1857;
    float _1975 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1977 = _1969;
    if (!_1764)
    {
        int _1979 = as_type<int>(_1857) + 400;
        uint _1981 = uint(int(uint(_1979) >> uint(2)));
        uint _1983 = uint(int(uint(int(_1981)) >> uint(2)));
        int _1985 = int(_1981) & 3;
        float _1987 = (*spvDescriptorSet0.vp_c15)._m0[int(_1983)][_1985];
        _1973 = _1987;
    }
    float _1989 = _1973;
    float _1991 = _1638 * _1833;
    bool _1993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.5);
    bool _2001 = _1997 || _1999;
    if (!_1917)
    {
        _1975 = _1712;
    }
    float _2003 = _1975;
    float _2005 = fma(_1528, _1825, _1991);
    float _2007 = _1638 * _1875;
    float _2009 = fma(_1528, _1867, _2007);
    bool _2011 = !_1917;
    float _2013 = _2003;
    float _2015 = _1867;
    float _2017 = _1915;
    if (!_2011)
    {
        float _2019 = _234 * _234;
        float _2021 = fma(_230, _230, _2019);
        float _2023 = fma(_236, _236, _2021);
        float _2025 = rsqrt(_1877);
        float _2027 = sqrt(_2023);
        float _2029 = _1678 * _2025;
        float _2031 = _1716 * _2025;
        float _2033 = _1851 * _2025;
        bool _2035 = _2027 > 0.0;
        float _2037 = _2027;
        _1977 = _2025;
        if (!_2035)
        {
            _2037 = _1712;
        }
        float _2039 = _2037;
        bool _2041 = !_2035;
        _2013 = _2039;
        if (!_2041)
        {
            float _2043 = rsqrt(_2023);
            float _2045 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2047 = _234 * _2043;
            float _2049 = _230 * _2043;
            float _2051 = _2031 * _2047;
            float _2053 = _236 * _2043;
            float _2055 = fma(_2029, _2049, _2051);
            float _2057 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2059 = fma(_2033, _2053, _2055);
            float _2061 = _2059 * _2057;
            float _2063 = fma(_230, _2061, _1668);
            float _2065 = fma(_234, _2061, _1712);
            float _2067 = fma(_236, _2061, _1841);
            _1742 = _2063;
            _1843 = _2067;
            _2013 = _2065;
            _1977 = _2061;
            _2015 = _2045;
        }
    }
    float _2069 = _1742;
    float _2071 = _1843;
    float _2073 = _2013;
    float _2075 = _1977;
    float _2077 = _2015;
    float _2079 = fma(_1536, _1889, _2005);
    float _2081 = fma(_1536, _1907, _2009);
    float _2083 = _2075;
    float _2085 = _2073;
    float _2087 = _2077;
    if (_2001)
    {
        _2083 = _2069;
    }
    float _2089 = _2083;
    float _2091 = _2089;
    if (_2001)
    {
        _1744 = _2071;
    }
    float _2093 = _1744;
    float _2095 = _2093;
    if (!_2001)
    {
        float _2097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2099 = _1532 + _2097;
        float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2103 = _1528 + _2101;
        float _2105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2107 = _2099 * _2099;
        float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2111 = _1536 + _2109;
        float _2113 = fma(_2103, _2103, _2107);
        float _2115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2117 = fma(_2111, _2111, _2113);
        float _2119 = sqrt(_2117);
        float _2121 = _2105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2123 = -_1528;
        float _2125 = _2123 + _2069;
        float _2127 = precise::min(_2119, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2129 = _2127 * _2115;
        float _2131 = -_1532;
        float _2133 = _2131 + _2073;
        float _2135 = _2121 * _2129;
        float _2137 = -_1536;
        float _2139 = _2137 + _2071;
        float _2141 = fma(_2133, _2135, _1532);
        float _2143 = fma(_2125, _2135, _1528);
        float _2145 = fma(_2139, _2135, _1536);
        _2085 = _2141;
        _2091 = _2143;
        _2095 = _2145;
    }
    float _2147 = _2085;
    float _2149 = _2091;
    float _2151 = _2095;
    float _2153 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2155 = _2079 + _1897;
    float _2157 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2159 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2161 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2153);
    float _2163 = _2155 * _1971;
    float _2165 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2157);
    float _2167 = _2081 + _1915;
    float _2169 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2161);
    float _2171 = _2147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2173 = _2163 >= 0.0;
    float _2175 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2159);
    float _2177 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2165);
    float _2179 = _2169 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2181 = _2167 * _1971;
    float _2183 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2171);
    bool _2185 = _2163 <= 1.0;
    bool _2187 = _2185 && _2173;
    float _2189 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2175);
    float _2191 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2195 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2183);
    bool _2197 = _2181 >= 0.0;
    bool _2199 = _2197 && _2187;
    float _2201 = _2189 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2203 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2193);
    float _2205 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2207 = _2181 <= 1.0;
    bool _2209 = _2207 && _2199;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2213 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2215 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2203);
    float _2217 = _2163;
    if (!_1764)
    {
        float _2219 = rint(_1989);
        float _2221 = precise::max(_2219, 0.0);
        uint _2223 = uint(_2221);
        uint _2225 = clamp(_2223, 0u, 65535u);
        _2087 = as_type<float>(_2225);
    }
    float _2227 = _2087;
    float _2229 = -_2211;
    float _2231 = fma(_2229, _2205, 1.0);
    float _2233 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2235 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2215);
    float _2237 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2239 = _1638 * _1937;
    float _2241 = log2(_2231);
    float _2243 = _2231;
    if (_2209)
    {
        float _2245 = float(_1754);
        _2017 = _2245;
    }
    float _2247 = _2017;
    float _2249 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2237);
    float _2251 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2233);
    float _2253 = fma(_1528, _1929, _2239);
    float _2255 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2249);
    float _2257 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2251);
    float _2259 = 1.0 / _2235;
    float _2261 = fma(_1536, _1959, _2253);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2255);
    float _2265 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2257);
    float _2267 = _2257;
    if (!_1764)
    {
        float _2269 = -_1947;
        float _2271 = _1672 + _2269;
        _2243 = _2271;
    }
    float _2273 = _2243;
    float _2275 = _2261 + _1967;
    float _2277 = _1897;
    if (!_1764)
    {
        float _2279 = floor(_1674);
        _2277 = _2279;
    }
    float _2281 = _2277;
    float _2283 = _2241 * 0.693147182464599609375;
    float _2285 = _2233;
    float _2287 = _2283;
    if (_2209)
    {
        float _2289 = rint(_2247);
        float _2291 = precise::max(_2289, 0.0);
        uint _2293 = uint(_2291);
        uint _2295 = clamp(_2293, 0u, 65535u);
        _2285 = as_type<float>(_2295);
    }
    float _2297 = _2285;
    float _2299 = _2263 * _2259;
    float _2301 = _2265 * _2259;
    float _2303 = fma(_2299, 0.5, 0.5);
    float _2305 = fma(_2301, -0.5, 0.5);
    if (!_1764)
    {
        float _2307 = -_2281;
        float _2309 = _1674 + _2307;
        _1746 = _2309;
    }
    float _2311 = _1746;
    float _2313 = _2275 * _1971;
    float _2315 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2317 = _2227;
    float _2319 = _2315;
    float _2321 = _2311;
    if (!_1764)
    {
        float3 _6944 = float3(_2273, _2311, float(as_type<int>(_2227)));
        float3 _6948 = select(_6944, float3(0.0), isnan(_6944));
        float _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6948.xy, uint(rint(_6948.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6948.xy, uint(rint(_6948.z)), level(0.0)).x;
        _2317 = _2323;
    }
    float _2325 = _2317;
    float _2327 = _2297;
    if (_2209)
    {
        float3 _6963 = float3(_2163, _2181, float(as_type<int>(_2297)));
        float3 _6965 = select(_6963, float3(0.0), isnan(_6963));
        float _2329 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6965.xy, uint(rint(_6965.z)), _2313, level(0.0));
        _2327 = _2329;
    }
    float _2331 = _2327;
    float3 _6975 = float3(_2303, _2305, _2315);
    float _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6975, float3(0.0), isnan(_6975)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6975, float3(0.0), isnan(_6975)), level(0.0)).x;
    float3 _6984 = float3(_2303, _2305, _2315);
    float4 _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6984, float3(0.0), isnan(_6984)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6984, float3(0.0), isnan(_6984)), level(0.0)).xyzw;
    float _2338 = _2336.x;
    float _2340 = _2336.y;
    float _2342 = _2336.z;
    float _2344 = _2336.w;
    if (_1764)
    {
        _2267 = 1.0;
    }
    float _2346 = _2267;
    bool _2348 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan(0.5);
    bool _2356 = _2352 || _2354;
    float _2358 = _2346;
    if (_2356)
    {
        _2287 = 1.0;
    }
    float _2360 = _2287;
    float _2362 = _2360;
    if (!_2356)
    {
        float _2364 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2366 = _2364 * 0.15915493667125701904296875;
        float _2368 = _2366 * 6.283185482025146484375;
        float _2370 = cos(_2368);
        float _2372 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2374 = _2372 * 0.15915493667125701904296875;
        float _2376 = _2366 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        float _2380 = 1.0 / _2370;
        float _2382 = _2374 * 6.283185482025146484375;
        float _2384 = cos(_2382);
        float _2386 = _2378 * _2380;
        float _2388 = _2374 * 6.283185482025146484375;
        float _2390 = sin(_2388);
        float _2392 = _2384 * _2386;
        float _2394 = 1.0 / _2392;
        float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2398 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2396;
        float _2400 = 1.0 / _2398;
        float _2402 = _2390 * _2394;
        float _2404 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2406 = fma(_1720, _2402, _2404);
        float _2408 = _2406 * _2400;
        float _2410 = precise::clamp(_2408, 0.0, 1.0);
        _2319 = _2400;
        _2217 = _2374;
        _2321 = _2398;
        _2362 = _2410;
    }
    float _2412 = _2319;
    float _2414 = _2217;
    float _2416 = _2321;
    float _2418 = _2362;
    float _2420 = _2412;
    float _2422 = _2414;
    if (!_1764)
    {
        int _2424 = _1807 << 4;
        int _2426 = _2424 + 2048;
        uint _2428 = uint(int(uint(_2426) >> uint(2)));
        uint _2430 = uint(int(uint(int(_2428)) >> uint(2)));
        int _2432 = int(_2428) & 3;
        float _2434 = (*spvDescriptorSet0.vp_c15)._m0[int(_2430)][_2432];
        int _2436 = int(_2428) + 1;
        uint _2438 = uint(int(uint(_2436) >> uint(2)));
        int _2440 = _2436 & 3;
        float _2442 = (*spvDescriptorSet0.vp_c15)._m0[int(_2438)][_2440];
        int _2444 = _2426 + 8;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        uint _2448 = uint(int(uint(int(_2446)) >> uint(2)));
        int _2450 = int(_2446) & 3;
        float _2452 = (*spvDescriptorSet0.vp_c15)._m0[int(_2448)][_2450];
        int _2454 = int(_2446) + 1;
        uint _2456 = uint(int(uint(_2454) >> uint(2)));
        int _2458 = _2454 & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        float _2462 = _1638 * _2442;
        float _2464 = fma(_1528, _2434, _2462);
        float _2466 = fma(_1536, _2452, _2464);
        float _2468 = _2466 + _2460;
        float _2470 = precise::clamp(_2468, 0.0, 1.0);
        float _2472 = -_2470;
        float _2474 = _2472 + _2325;
        float _2476 = fma(_2474, 500.0, 1.5);
        float _2478 = exp2(_2476);
        float _2480 = 0.0 + _2478;
        float _2482 = precise::clamp(_2480, 0.0, 1.0);
        _2420 = _2442;
        _2358 = _2482;
    }
    float _2484 = _2420;
    float _2486 = _2358;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2147 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2149 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2151 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = fma(_2494, _2494, _2500);
    float _2504 = fma(_2498, _2498, _2502);
    float _2506 = rsqrt(_2504);
    float _2508 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2510 = _2494 * _2508;
    float _2512 = _2498 * _2508;
    float _2514 = _2510 * _2510;
    float _2516 = _2512 * _2512;
    float _2518 = _2514 + _2516;
    float _2520 = sqrt(_2518);
    bool _2522 = _2520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2526 = _2520 + _2524;
    float _2528 = _2506;
    float _2530 = _2484;
    float _2532 = _2526;
    if (_2522)
    {
        float _2534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2528 = _2534;
    }
    float _2536 = _2528;
    if (_2522)
    {
        float _2538 = rsqrt(_2518);
        _2530 = _2538;
    }
    float _2540 = _2530;
    float _2542 = _2540;
    if (_2522)
    {
        float _2544 = _2526 * _2536;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2522)
    {
        float _2548 = _2546 * 0.15915493667125701904296875;
        _2422 = _2548;
    }
    float _2550 = _2422;
    float _2552 = _2498;
    float _2554 = _2550;
    if (_2522)
    {
        float _2556 = _2550 * 6.283185482025146484375;
        float _2558 = sin(_2556);
        _2552 = _2558;
    }
    float _2560 = _2552;
    float _2562 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2564 = precise::max(0.0, _2562);
    float _2566 = _2416;
    float _2568 = _2564;
    float _2570 = _2562;
    if (_2522)
    {
        float _2572 = _2550 * 6.283185482025146484375;
        float _2574 = cos(_2572);
        _2566 = _2574;
    }
    float _2576 = _2566;
    float _2578 = -_2508;
    float _2580 = -_2564;
    float _2582 = fma(_2490, _2578, _2580);
    if (_2522)
    {
        float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2568 = _2584;
    }
    float _2586 = _2568;
    float _2588 = _2560;
    float _2590 = _2586;
    if (_2522)
    {
        float _2592 = fma(_2560, _2586, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2588 = _2592;
    }
    float _2594 = _2588;
    float _2596 = _2594;
    if (!_2522)
    {
        _2590 = _2510;
    }
    float _2598 = _2590;
    float _2600 = _2598;
    float _2602 = _2576;
    if (_2522)
    {
        float _2604 = _2576 + (-1.0);
        _2570 = _2604;
    }
    float _2606 = _2570;
    float _2608 = _2606;
    if (_2522)
    {
        float _2610 = _2540 * _2594;
        _1943 = _2610;
    }
    float _2612 = _1943;
    if (!_2522)
    {
        _2596 = _2582;
    }
    float _2614 = _2596;
    float _2616 = _2614;
    if (_2522)
    {
        float _2618 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2554 = _2618;
    }
    float _2620 = _2554;
    if (_2522)
    {
        float _2622 = _2510 * _2612;
        _2600 = _2622;
    }
    float _2624 = _2600;
    if (!_2522)
    {
        _2608 = _2512;
    }
    float _2626 = _2608;
    float _2628 = _2626;
    if (_2522)
    {
        float _2630 = _2512 * _2612;
        _2628 = _2630;
    }
    float _2632 = _2628;
    if (!_2522)
    {
        _2542 = _2514;
    }
    float _2634 = _2542;
    float _2636 = _2634;
    if (_2522)
    {
        float _2638 = fma(_2582, _2576, _2620);
        _2616 = _2638;
    }
    float _2640 = _2616;
    if (_2522)
    {
        float _2642 = _2624 * _2624;
        _2636 = _2642;
    }
    float _2644 = _2636;
    if (!_2522)
    {
        _2602 = _2516;
    }
    float _2646 = _2602;
    float _2648 = sqrt(_2504);
    float _2650 = _2646;
    if (_2522)
    {
        float _2652 = _2632 * _2632;
        _2650 = _2652;
    }
    float _2654 = _2650;
    float _2656 = fma(_2640, _2640, _2644);
    float _2658 = _2656 + _2654;
    float _2660 = rsqrt(_2658);
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2664 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2662);
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    float _2668 = -_2666;
    float _2670 = _2668 + 1.0;
    float _2672 = abs(_2670);
    float _2674 = log2(_2672);
    float _2676 = _2660 * _2624;
    float _2678 = _2660 * _2640;
    float _2680 = _2660 * _2632;
    float _2682 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2684 = -_2682;
    float _2686 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2684);
    float _2688 = -_2680;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2686);
    float _2692 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2694 = fma(_2690, -0.5, 0.5);
    float _2696 = fma(_2690, 0.5, 0.5);
    float _2698 = _2678 + 1.0;
    float _2700 = exp2(_2692);
    float _2702 = fma(_2696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2704 = fma(_2696, _2702, -0.212114393711090087890625);
    float _2706 = sqrt(_2694);
    float _2708 = fma(_2696, _2704, 1.570728778839111328125);
    float _2710 = -_2678;
    float _2712 = fma(_2700, _2698, _2710);
    float _2714 = _2706 * 0.636619746685028076171875;
    float _2716 = fma(_2712, 0.5, 0.5);
    float _2718 = -_2708;
    float _2720 = fma(_2714, _2718, 1.0);
    float2 _7558 = float2(_2720, _2716);
    float3 _2722 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7558, float2(0.0), isnan(_7558)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7558, float2(0.0), isnan(_7558)), level(0.0)).xyz;
    float _2724 = _2722.x;
    float _2726 = _2722.y;
    float _2728 = _2722.z;
    float _2730 = abs(_1720);
    float _2732 = log2(_2730);
    float _2734 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2736 = _2235 * 0.5;
    float _2738 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2740 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2734);
    float _2742 = fma(_2265, -0.5, _2736);
    float _2744 = -_1626;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2201, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2740);
    float _2750 = exp2(_2738);
    bool _2752 = _1720 <= 8000.0;
    bool _2754 = isnan(_1720);
    bool _2756 = _2752 || _2754;
    bool _2758 = isnan(8000.0);
    bool _2760 = _2756 || _2758;
    float _2762 = float(_2760);
    out.m_109.x = _1528;
    out.m_109.y = _1532;
    out.m_109.z = _1536;
    float _2764 = fma(_2213, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2748);
    float _2766 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2768 = _2263 + _2235;
    out.gl_Position.x = _2263;
    out.gl_Position.y = _2265;
    out.gl_Position.z = _2764;
    out.gl_Position.w = _2235;
    float _2770 = _2764 + _2235;
    bool _2772 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2774 = isnan(_2648);
    bool _2776 = _2772 || _2774;
    bool _2778 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2780 = _2776 || _2778;
    float _2782 = _2768 * 0.5;
    float _2784 = exp2(_2766);
    float _2786 = _2770 * 0.5;
    out.m_111.x = _2149;
    out.m_111.y = _2147;
    out.m_111.z = _2151;
    out.m_113.x = _2782;
    out.m_113.y = _2742;
    out.m_113.z = _2786;
    out.m_113.w = _2235;
    float _2788 = -_2750;
    float _2790 = _2788 + 1.0;
    float _2792 = _2418 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2794 = _2750;
    if (!_2780)
    {
        _2794 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2796 = _2794;
    float _2798 = _2790 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2800 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2802 = precise::clamp(_2800, 0.0, 1.0);
    float _2804 = fma(_2802, -2.0, 3.0);
    float _2806 = _2802 * _2802;
    float _2808 = _2806 * _2804;
    float _2810 = -_2808;
    float _2812 = _2810 + 1.0;
    float _2814 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2808);
    float _2816 = _2808;
    float _2818 = _2796;
    float _2820 = _2796;
    if (!_2209)
    {
        _2816 = 1.0;
    }
    float _2822 = _2816;
    float _2824 = _2822;
    if (_2209)
    {
        bool _2826 = _2331 >= _2313;
        bool _2828 = isnan(_2331);
        bool _2830 = _2826 || _2828;
        bool _2832 = isnan(_2313);
        bool _2834 = _2830 || _2832;
        float _2836 = float(_2834);
        _2824 = _2836;
    }
    float _2838 = _2824;
    float _2840 = _2762 * _2814;
    float _2842 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2844 = _2838 * _2486;
    float _2846 = _2746 * _2842;
    float _2848 = precise::clamp(_2846, 0.0, 1.0);
    float _2850 = _2798 * _2333;
    float _2852 = -_2798;
    float _2854 = _2852 + 1.0;
    float _2856 = -_2848;
    float _2858 = fma(_2856, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2860 = _2344 * _2850;
    float _2862 = _2344 * _2854;
    float _2864 = _2854;
    float _2866 = _2848;
    float _2868 = _2858;
    float _2870 = _2850;
    if (!_2780)
    {
        _2864 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2872 = _2864;
    float _2874 = -_2844;
    float _2876 = fma(_2874, _2858, 1.0);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = _2878;
    float _2882 = _2872;
    float _2884 = _2872;
    if (!_2780)
    {
        _2866 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2886 = _2866;
    float _2888 = _2886;
    float _2890 = _2886;
    if (!_2780)
    {
        _2868 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2892 = _2868;
    float _2894 = _2878 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2896 = _2892;
    float _2898 = _2892;
    if (!_2780)
    {
        _2880 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2900 = _2880;
    out.m_115.x = _2894;
    float _2902 = _2728 * _2850;
    float _2904 = fma(_2724, _2860, _2338);
    float _2906 = fma(_2726, _2860, _2340);
    float _2908 = _2900;
    float _2910 = _2900;
    if (!_2780)
    {
        _2870 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2912 = _2870;
    float _2914 = fma(_2344, _2902, _2342);
    out.m_117.x = _2904;
    out.m_117.y = _2906;
    out.m_117.z = _2914;
    out.m_117.w = _2862;
    bool _2916 = !_2780;
    float _2918 = _2912;
    float _2920 = _2912;
    if (!_2916)
    {
        bool _2922 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2924 = isnan(_2648);
        bool _2926 = _2922 || _2924;
        bool _2928 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2930 = _2926 || _2928;
        if (!_2930)
        {
            float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2934 = _2648 + _2932;
            float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2938 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2936;
            float _2940 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2944 = 1.0 / _2938;
            float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2954 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2956 = _2954 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2962 = _2934 * _2944;
            float _2964 = precise::clamp(_2962, 0.0, 1.0);
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2968 = _2966 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2970 = fma(_2964, _2942, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2972 = fma(_2964, _2968, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2974 = fma(_2964, _2948, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2976 = fma(_2964, _2952, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2978 = fma(_2964, _2956, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2980 = fma(_2964, _2960, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2820 = _2974;
            _2898 = _2978;
            _2884 = _2970;
            _2890 = _2976;
            _2920 = _2972;
            _2910 = _2980;
            _2982 = true;
        }
        else
        {
            bool _2984 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2986 = isnan(_2648);
            bool _2988 = _2984 || _2986;
            bool _2990 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2992 = _2988 || _2990;
            if (!_2992)
            {
                _2882 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2994 = _2882;
            _2884 = _2994;
            if (!_2992)
            {
                _2818 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2996 = _2818;
            _2820 = _2996;
            if (!_2992)
            {
                _2918 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2998 = _2918;
            _2920 = _2998;
            if (!_2992)
            {
                _2888 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3000 = _2888;
            _2890 = _3000;
            if (!_2992)
            {
                _2896 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3002 = _2896;
            _2898 = _3002;
            if (!_2992)
            {
                _2908 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3004 = _2908;
            bool _3006 = !_2992;
            _2910 = _3004;
            if (!_3006)
            {
                bool _3008 = _2648 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3010 = isnan(_2648);
                bool _3012 = _3008 || _3010;
                bool _3014 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3016 = _3012 || _3014;
                if (!_3016)
                {
                    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3020 = _2648 + _3018;
                    float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3024 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3022;
                    float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3030 = 1.0 / _3024;
                    float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3044 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3048 = _3020 * _3030;
                    float _3050 = precise::clamp(_3048, 0.0, 1.0);
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3054 = _3052 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3056 = fma(_3050, _3028, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3058 = fma(_3050, _3054, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3060 = fma(_3050, _3034, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3062 = fma(_3050, _3038, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3064 = fma(_3050, _3042, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3066 = fma(_3050, _3046, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2820 = _3060;
                    _2898 = _3064;
                    _2884 = _3056;
                    _2890 = _3062;
                    _2920 = _3058;
                    _2910 = _3066;
                    _2982 = true;
                }
                else
                {
                    _2820 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2898 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2884 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2890 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2920 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2910 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2982 = false;
    float _3068 = _2820;
    float _3070 = _2898;
    float _3072 = _2884;
    float _3074 = _2890;
    float _3076 = _2920;
    float _3078 = _2910;
    float _3080 = _2792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3082 = fma(_1500, -0.5, 0.5);
    float _3084 = precise::clamp(_3082, 0.0, 1.0);
    float _3086 = -_3068;
    float _3088 = _3086 + _3070;
    float _3090 = -_3072;
    float _3092 = _3090 + _3074;
    out.m_63.x = _3080;
    float _3094 = fma(_3084, _3088, _3068);
    float _3096 = -_3076;
    float _3098 = _3096 + _3078;
    float _3100 = fma(_3084, _3092, _3072);
    float _3102 = _3094 * 0.586610972881317138671875;
    bool _3104 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3106 = fma(_3084, _3098, _3076);
    out.m_119.x = 0.0;
    float _3108 = fma(_3100, 0.298911988735198974609375, _3102);
    bool _3110 = _2418 > 0.0;
    bool _3112 = isnan(_2418);
    bool _3114 = _3110 || _3112;
    bool _3116 = isnan(0.0);
    bool _3118 = _3114 || _3116;
    float _3120 = fma(_3106, 0.114477999508380889892578125, _3108);
    float _3122 = -_3120;
    float _3124 = _3100 + _3122;
    float _3126 = -_3120;
    float _3128 = _3094 + _3126;
    float _3130 = -_3120;
    float _3132 = _3106 + _3130;
    float _3134 = fma(_3124, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    float _3136 = fma(_3128, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    float _3138 = fma(_3132, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3120);
    bool _3140 = !_3104;
    if (!_3140)
    {
        float _3142 = -_2147;
        float _3144 = _3142 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3146 = -_2149;
        float _3148 = _3146 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3150 = -_2151;
        float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3154 = _3144 * _3144;
        float _3156 = fma(_3148, _3148, _3154);
        float _3158 = fma(_3152, _3152, _3156);
        float _3160 = sqrt(_3158);
        float _3162 = rsqrt(_3158);
        float _3164 = -_3160;
        float _3166 = _3164 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3168 = _3166 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3170 = precise::clamp(_3168, 0.0, 1.0);
        float _3172 = _3148 * _3162;
        float _3174 = _3144 * _3162;
        float _3176 = abs(_3170);
        float _3178 = log2(_3176);
        float _3180 = _3152 * _3162;
        float _3182 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3184 = _1500 * _3174;
        float _3186 = -_3174;
        float _3188 = -_3182;
        float _3190 = fma(_3186, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3188);
        float _3192 = fma(_1498, _3172, _3184);
        float _3194 = -_3180;
        float _3196 = fma(_3194, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3190);
        float _3198 = fma(_1502, _3180, _3192);
        float _3200 = precise::clamp(_3198, 0.0, 1.0);
        float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3204 = _3196 + _3202;
        float _3206 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3208 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3210 = precise::clamp(_3208, 0.0, 1.0);
        float _3212 = exp2(_3206);
        float _3214 = _3212 * _3210;
        float _3216 = _3200 * _3214;
        float _3218 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3220 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3222 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_119.x = _3218;
        out.m_119.y = _3220;
        out.m_119.z = _3222;
    }
    out.m_87.x = _3134;
    out.m_87.y = _3136;
    out.m_87.z = _3138;
    if (_3118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_117.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_117.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_117.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_117.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_119.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_119.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_119.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_119.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3224 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3224;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_117.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_117.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_117.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_117.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_119.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_119.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_119.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_119.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

