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
    float4 m_73 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_103 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_83 [[attribute(5)]];
    float4 m_77 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
    float4 m_79 [[attribute(10)]];
    float4 m_81 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3056 = false;
    bool _1662 = false;
    bool _620 = false;
    bool _504 = false;
    bool _228 = false;
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
        float _3355 = as_type<float>(_140);
        out.gl_Position.z = _3355;
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
        out.m_63.x = 0.0;
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
        float _3424 = as_type<float>(_178);
        out.gl_Position.z = _3424;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_67.x;
    float _182 = in.m_67.y;
    float _184 = in.m_67.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_186;
    float _208 = _200;
    float _226;
    if (!_206)
    {
        float _210 = in.m_69.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        float _230 = float(_124);
        float _232 = 1.0 / _230;
        float _234 = _158 * _232;
        _226 = _234;
    }
    _228 = false;
    float _236 = _226;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _236 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _236 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _236 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = 1.0 / _252;
    float _268 = 1.0 / _256;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _264;
    bool _278 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _280 = isnan(_236);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = _248 * _266;
    bool _292 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_236);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = 1.0 / _260;
    float _310 = _240 * _276;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _236 + _312;
    bool _316 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_236);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _314 * _268;
    bool _334 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_236);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_288;
    float _348 = _346 + 1.0;
    float _350 = _244 * _308;
    float _352 = -_344;
    float _354 = _352 + 1.0;
    float _356 = fma(_330, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_272, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = fma(_306, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _326 * _354;
    bool _364 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _366 = isnan(_236);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _384 = _302 * _348;
    float _386 = -_302;
    float _388 = _386 + 1.0;
    float _390 = _288 * _378;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = _374 * _388;
    float _402 = fma(_382, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_394, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_398, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = _356 * _400;
    float _410 = _358 * _400;
    float _412 = -_374;
    float _414 = _412 + 1.0;
    float _416 = _360 * _400;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_420, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_402, _384, _426);
    float _440 = fma(_406, _384, _430);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _450 = fma(_424, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_434, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_404, _384, _428);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _460 = fma(_436, _390, _438);
    float _462 = fma(_444, _332, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _464 = fma(_448, _332, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _466 = fma(_458, _332, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _468 = fma(_450, _390, _454);
    float _470 = fma(_452, _390, _440);
    float _472 = fma(_462, _362, _460);
    float _474 = fma(_464, _362, _468);
    float _476 = fma(_466, _362, _470);
    float _478 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _472);
    float _480 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _474);
    float _482 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _476);
    bool _484 = !_274;
    float _502;
    if (!_484)
    {
        float _486 = in.m_69.x;
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _490 = _486 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_124);
        float _508 = 1.0 / _506;
        float _510 = _158 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    bool _514 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = isnan(_512);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _532 = isnan(_512);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _512 + _546;
    float _550 = -_524;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = 1.0 / _528;
    float _558 = _540 * _552;
    float _560 = -_540;
    float _562 = _560 + 1.0;
    float _564 = in.m_71.x;
    float _566 = in.m_71.y;
    float _568 = in.m_71.z;
    float _570 = _544 * _556;
    float _572 = fma(_570, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _572 * _558;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _584 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[116].x, _576);
    float _586 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _594 = _482 * _568;
    float _596 = _480 * _566;
    float _598 = _478 * _564;
    out.m_73.x = _586;
    out.m_73.y = _588;
    out.m_73.z = _590;
    out.m_73.w = _592;
    bool _600 = !_554;
    float _618;
    if (!_600)
    {
        float _602 = in.m_69.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_124);
        float _624 = 1.0 / _622;
        float _626 = _158 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_69.z;
    float _632 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _634 = log2(_632);
    float _636 = in.m_69.x;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _640 = _638 != 0;
    float _642 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _644 = in.m_69.y;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _656 = _654 != 0;
    float _658 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _662 = _594 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _664 = !_656;
    int _666 = _664 ? 0 : 1;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _670 = _634 * _158;
    float _672 = _630 * 2.0;
    float _674 = exp2(_670);
    float _676 = _636 * 2.0;
    float _678 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _680 = _636 + (-0.5);
    float _682 = _644 * 2.0;
    float _684 = floor(_672);
    float _686 = _644 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _688 = -_660;
    float _690 = fma(_678, 2.0, _688);
    float _692 = _678;
    float _694 = _636;
    if (_640)
    {
        _692 = _636;
    }
    float _696 = _692;
    float _698 = fma(_686, -2.0, _668);
    float _700 = floor(_676);
    float _702 = _696;
    if (!_640)
    {
        _702 = _630;
    }
    float _704 = _702;
    float _706 = -_674;
    float _708 = _706 + 1.0;
    float _710 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _698);
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _714 = _684 > 0.0;
    float _716 = floor(_682);
    bool _718 = _684 >= 0.0;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = _636 + _644;
    int _730 = _726 ? 0 : 1;
    float _732 = _728 + (-1.0);
    bool _734 = _700 > 0.0;
    int _736 = ~_730;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _744 = _732;
    int _746 = _740;
    if (_640)
    {
        _744 = _644;
    }
    float _748 = _744;
    float _750 = _748;
    if (!_714)
    {
        int _752 = ~_730;
        int _754 = _752 + 1;
        _746 = _754;
    }
    int _756 = _746;
    bool _758 = _700 >= 0.0;
    bool _760 = isnan(_700);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = !_648;
    int _770 = _768 ? 0 : 1;
    if (!_640)
    {
        _750 = _636;
    }
    float _772 = _750;
    int _774 = abs(_770);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _778 = _772 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _782 = _716 > 0.0;
    float _784 = -_776;
    float _786 = fma(_712, 2.0, _784);
    bool _788 = _716 >= 0.0;
    bool _790 = isnan(_716);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = fma(_778, -2.0, _780);
    float _800 = in.m_75.x;
    float _802 = in.m_75.y;
    float _804 = in.m_75.z;
    float _806 = float(_774);
    float _808 = float(_756);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _812 = 1.0 + _810;
    int _814 = _766 ? 0 : 1;
    int _816 = _796 ? 0 : 1;
    float _818 = _806 * _808;
    float _820 = 1.0 / _812;
    float _822 = _818 * (-2.0);
    int _824 = ~_814;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _832 = ~_816;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _840 = _828;
    int _842 = _836;
    if (!_734)
    {
        int _844 = ~_814;
        int _846 = _844 + 1;
        _840 = _846;
    }
    int _848 = _840;
    float _850 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    if (!_782)
    {
        int _852 = ~_816;
        int _854 = _852 + 1;
        _842 = _854;
    }
    int _856 = _842;
    float _858 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].z, _838);
    float _860 = -_158;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[76].x, _690);
    float _864 = fma(_822, _800, _800);
    bool _866 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _868 = isnan(1.0);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _874 = _870 || _872;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _878 = !_652;
    int _880 = _878 ? 0 : 1;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _884 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _892 = _888 || _890;
    float _894 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[88].z, _876);
    int _896 = abs(_880);
    float _898 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[88].w, _882);
    float _900 = _892 ? _708 : 0.0;
    float _902 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _858);
    float _904 = float(_896);
    float _906 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _850);
    float _908 = float(_848);
    float _910 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _894);
    float _912 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _898);
    float _914 = -_158;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _786);
    float _918 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _798);
    if (_874)
    {
        float _920 = _900 * _820;
        _162 = _920;
    }
    float _922 = _162;
    float _924 = fma(_742, _822, _742);
    float _926 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    int _928 = abs(_666);
    float _930 = _644 + _630;
    float _932 = _904 * _908;
    float _934 = fma(_924, _922, _926);
    float _936 = _930 + (-1.0);
    float _938 = float(_928);
    float _940 = _932 * (-2.0);
    float _942 = float(_856);
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = _636 + _630;
    float _948 = fma(_940, _802, _802);
    float _950 = _934 * 0.15915493667125701904296875;
    float _952 = _938 * _942;
    float _954 = _644 + (-0.5);
    float _956 = fma(_944, _940, _944);
    float _958 = _946 + (-1.0);
    float _960 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].y, _948);
    float _962 = _952 * (-2.0);
    float _964 = _950 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(_956, _922, _960);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _972 = fma(_962, _804, _804);
    float _974 = in.m_77.x;
    float _976 = in.m_77.y;
    float _978 = in.m_77.z;
    float _980 = _630 + (-0.5);
    float _982 = fma(_970, _962, _970);
    float _984 = _950 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _968 * 0.15915493667125701904296875;
    float _990 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].z, _972);
    float _992 = fma(_982, _922, _990);
    float _994 = _988 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _992 * 0.15915493667125701904296875;
    float _1000 = _988 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _974);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _976);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _978);
    float _1010 = _998 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = _642 * _1004;
    float _1016 = _658 * _1006;
    float _1018 = _662 * _1008;
    float _1020 = in.m_60.x;
    float _1022 = in.m_60.y;
    float _1024 = in.m_60.z;
    float _1026 = _986 * _996;
    float _1028 = _966 * _996;
    float _1030 = _998 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = _986 * _1002;
    float _1036 = _966 * _1002;
    float _1038 = _986 * _1012;
    float _1040 = _966 * _1012;
    float _1042 = _1002 * _1012;
    float _1044 = _996 * _1012;
    float _1046 = _1038 * _1016;
    float _1048 = _1040 * _1016;
    float _1050 = fma(_1032, _1034, _1028);
    float _1052 = fma(_1032, _1028, _1034);
    float _1054 = -_1016;
    float _1056 = _1032 * _1054;
    float _1058 = -_1026;
    float _1060 = fma(_1032, _1036, _1058);
    float _1062 = -_1036;
    float _1064 = fma(_1032, _1026, _1062);
    float _1066 = fma(_1050, _1014, _1046);
    float _1068 = fma(_1042, _1014, _1056);
    float _1070 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = fma(_1060, _1014, _1048);
    float _1074 = fma(_1064, _1018, _1066);
    float _1076 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1078 = fma(_1044, _1018, _1068);
    float _1080 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1086 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1088 = fma(_1052, _1018, _1072);
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1082);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1084);
    float _1094 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1096 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1086);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1090);
    float _1100 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1092);
    float _1102 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1108 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1110 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1112 = _1102 + _1106;
    float _1114 = _1104 + _1108;
    float _1116 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1110);
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1120 = _1112 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1114 + _1122;
    float _1126 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1116);
    float _1128 = _1120 * _1120;
    float _1130 = _1124 * _1124;
    float _1132 = _1128 + _1130;
    float _1134 = sqrt(_1132);
    bool _1136 = _1134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = _1134 + _1138;
    float _1142 = _1100;
    float _1144 = _1024;
    float _1146 = _1140;
    float _1148 = _1074;
    float _1150 = _1126;
    float _1152 = _1114;
    int _1154 = as_type<int>(_974);
    int _1156 = as_type<int>(_978);
    float _1158 = _1128;
    float _1160 = _1130;
    float _1162 = _1060;
    if (_1136)
    {
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1164;
    }
    float _1166 = _1142;
    if (_1136)
    {
        float _1168 = rsqrt(_1132);
        _1144 = _1168;
    }
    float _1170 = _1144;
    if (_1136)
    {
        float _1172 = _1140 * _1166;
        _1146 = _1172;
    }
    float _1174 = _1146;
    float _1176 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1174;
    if (!_1136)
    {
        _1148 = _1112;
    }
    float _1180 = _1148;
    float _1182 = _1180;
    if (_1136)
    {
        float _1184 = _1174 * 0.15915493667125701904296875;
        _1178 = _1184;
    }
    float _1186 = _1178;
    float _1188 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1190 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1192 = _1020;
    float _1194 = _1186;
    if (_1136)
    {
        float _1196 = _1186 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        _1192 = _1198;
    }
    float _1200 = _1192;
    float _1202 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1188);
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1206 = _1190 + _1204;
    float _1208 = _1206;
    if (_1136)
    {
        float _1210 = _1206 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1210;
    }
    float _1212 = _1150;
    float _1214 = _1212;
    if (_1136)
    {
        float _1216 = fma(_1200, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1214 = _1216;
    }
    float _1218 = _1214;
    float _1220 = _1218;
    if (_1136)
    {
        float _1222 = _1170 * _1218;
        _1220 = _1222;
    }
    float _1224 = _1220;
    if (_1136)
    {
        float _1226 = fma(_1120, _1224, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1182 = _1226;
    }
    float _1228 = _1182;
    if (_1136)
    {
        float _1230 = fma(_1124, _1224, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1152 = _1230;
    }
    float _1232 = _1152;
    float _1234 = fma(_1228, 6.2500002968590706586837768554688e-05, 0.5);
    float _1236 = fma(_1232, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5125 = float2(_1234, _1236);
    float3 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5125, float2(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5125, float2(0.0), isnan(_5125)), level(0.0)).xyz;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = in.m_79.y;
    float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1252 = in.m_81.w;
    bool _1254 = _630 > 0.5;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1260 = _644 > 0.5;
    float _1262 = in.m_79.x;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1266 = _1264 != 0;
    float _1268 = 1.0 / _1258;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = in.m_83.x;
    float _1284 = in.m_83.y;
    float _1286 = in.m_83.z;
    float _1288 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1290 = _1276;
    if (_1136)
    {
        float _1292 = _1186 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        _1194 = _1294;
    }
    float _1296 = _1194;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1298;
    float _1302 = -_1248;
    float _1304 = _1302 + 1.0;
    float _1306 = _1300 * _1268;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1310 = _628 + _1308;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1314 = _1254 ? as_type<int>(_1304) : as_type<int>(_1248);
    out.m_85.w = _1252;
    bool _1316 = _976 != 0.0;
    bool _1318 = isnan(_976);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    float _1326 = _1276 ? as_type<float>(_1314) : _1248;
    bool _1328 = _974 == 0.0;
    bool _1330 = !_1324;
    bool _1332 = _1328 && _1330;
    bool _1334 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1336 = isnan(_628);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = fma(_1306, _1310, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1348 = _978 == 0.0;
    bool _1350 = _1348 && _1332;
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1354 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1356 = isnan(_628);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = fma(_1326, _1288, -0.5);
    float _1368 = _1248;
    if (_1266)
    {
        bool _1370 = _636 > 0.5;
        _1290 = _1370;
    }
    bool _1372 = _1290;
    if (_1280)
    {
        float _1374 = _1260 ? _1304 : _1248;
        _1368 = _1374;
    }
    float _1376 = _1368;
    float _1378 = -_918;
    float _1380 = fma(_912, _1366, _1378);
    float _1382 = _1282;
    float _1384 = _1286;
    float _1386 = _1284;
    float _1388 = _1262;
    int _1390 = as_type<int>(_1380);
    if (!_1266)
    {
        _694 = _1262;
    }
    float _1392 = _694;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1396 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1398 = -_1364;
    float _1400 = _1398 + 1.0;
    float _1402 = _1392;
    if (!_1350)
    {
        float _1404 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1382 = _1404;
    }
    float _1406 = _1382;
    if (!_1350)
    {
        float _1408 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1286);
        _1384 = _1408;
    }
    float _1410 = _1384;
    if (_1266)
    {
        float _1412 = -_1262;
        float _1414 = _1412 + 1.0;
        _1154 = as_type<int>(_1414);
    }
    int _1416 = _1154;
    if (!_1350)
    {
        float _1418 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1284);
        _1386 = _1418;
    }
    float _1420 = _1386;
    if (_1272)
    {
        float _1422 = -_1262;
        float _1424 = _1422 + 1.0;
        _1156 = as_type<int>(_1424);
    }
    int _1426 = _1156;
    float _1428 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1430 = -_1032;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1396);
    if (_1266)
    {
        float _1434 = _1372 ? as_type<float>(_1416) : _1262;
        _1402 = _1434;
    }
    float _1436 = _1402;
    float _1438 = _1344 * _1400;
    float _1440 = fma(_1428, _1376, -0.5);
    if (_1272)
    {
        float _1442 = _1260 ? as_type<float>(_1426) : _1262;
        _1388 = _1442;
    }
    float _1444 = _1388;
    float _1446 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1448 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1450 = -_710;
    float _1452 = fma(_906, _1440, _1450);
    float _1454 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1456 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = fma(_1448, _1444, -0.5);
    float _1460 = -_1032;
    float _1462 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1446);
    float _1464 = fma(_1454, _1436, -0.5);
    float _1466 = -_1032;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1470 = fma(_910, _1458, _916);
    float _1472 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1474 = fma(_902, _1464, _862);
    float _1476 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1462);
    float _1478 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1480 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1472);
    float _1482 = _1472;
    if (_1136)
    {
        float _1484 = _1296 + (-1.0);
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1490 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1492 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1494 = _1486;
    float _1496 = _1490;
    if (_1136)
    {
        float _1498 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1498;
    }
    float _1500 = _1494;
    float _1502 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1432);
    float _1504 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1468);
    float _1506 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1490);
    float _1508 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1478);
    float _1510 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1488);
    float _1512 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1492);
    float _1514 = _1500;
    if (_1136)
    {
        float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1518 = _1228 + _1516;
        _1496 = _1518;
    }
    float _1520 = _1496;
    if (_1136)
    {
        float _1522 = fma(_1206, _1296, _1500);
        _1208 = _1522;
    }
    float _1524 = _1208;
    float _1526 = _1476 * _1420;
    float _1528 = _1502 * _1420;
    float _1530 = _1504 * _1420;
    float _1532 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1508);
    float _1534 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1510);
    float _1536 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1512);
    float _1538 = _1536;
    if (_1136)
    {
        float _1540 = _1520 * _1520;
        _1158 = _1540;
    }
    float _1542 = _1158;
    if (_1136)
    {
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1546 = _1232 + _1544;
        _1514 = _1546;
    }
    float _1548 = _1514;
    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1552 = _1524 + _1550;
    float _1554 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1556 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1506);
    if (_1136)
    {
        float _1558 = _1548 * _1548;
        _1160 = _1558;
    }
    float _1560 = _1160;
    float _1562 = fma(_1552, _1552, _1542);
    float _1564 = _1346 * _1438;
    float _1566 = -_1344;
    float _1568 = _1566 + 1.0;
    float _1570 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1554);
    float _1572 = _1562 + _1560;
    float _1574 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1480);
    float _1576 = fma(_1556, _1406, _1528);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1564);
    float _1580 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1570);
    float _1582 = fma(_1574, _1406, _1526);
    float _1584 = sqrt(_1572);
    float _1586 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1578);
    float _1588 = fma(_1580, _1406, _1530);
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1596 = fma(_1532, _1410, _1582);
    float _1598 = fma(_1534, _1410, _1576);
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = _1452 + 0.5;
    float _1608 = _1380 + 0.5;
    float _1610 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1612 = _1474 + 0.5;
    float _1614 = _1470 + 0.5;
    float _1616 = fma(_1536, _1410, _1588);
    bool _1618 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1620 = isnan(_1584);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1626 = _1622 || _1624;
    out.m_87.x = _1600;
    out.m_87.y = _1602;
    out.m_87.z = _1604;
    out.m_87.w = _1610;
    out.m_89.x = _1612;
    out.m_89.y = _1606;
    out.m_91.x = _1614;
    out.m_91.y = _1608;
    out.m_93.x = _1596;
    out.m_93.y = _1598;
    out.m_93.z = _1616;
    if (!_1626)
    {
        _1162 = 1.0;
    }
    float _1628 = _1162;
    out.m_95.x = _1242;
    out.m_95.y = _1244;
    out.m_95.z = _1246;
    bool _1630 = !_1626;
    float _1632 = _1628;
    if (!_1630)
    {
        bool _1634 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1636 = isnan(_1584);
        bool _1638 = _1634 || _1636;
        bool _1640 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1642 = _1638 || _1640;
        if (!_1642)
        {
            float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1646 = _1584 + _1644;
            float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1650 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1648;
            float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1654 = _1652 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1656 = 1.0 / _1650;
            float _1658 = _1646 * _1656;
            float _1660 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1632 = _1660;
            _1662 = true;
        }
        else
        {
            bool _1664 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1666 = isnan(_1584);
            bool _1668 = _1664 || _1666;
            bool _1670 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1672 = _1668 || _1670;
            if (!_1672)
            {
                float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1676 = _1584 + _1674;
                float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1680 = _1678 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1684 = _1682 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1686 = 1.0 / _1680;
                float _1688 = _1676 * _1686;
                float _1690 = fma(_1688, _1684, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1632 = _1690;
                _1662 = true;
            }
            else
            {
                _1632 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1662 = false;
    float _1692 = _1632;
    float _1694 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1696 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1698 = floor(_1694);
    float _1700 = floor(_1696);
    float _1702 = -_1698;
    float _1704 = _1694 + _1702;
    float _1706 = -_1700;
    float _1708 = _1696 + _1706;
    float2 _5964 = float2(_1704, _1708);
    float _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5964, float2(0.0), isnan(_5964)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5964, float2(0.0), isnan(_5964)), level(0.0)).x;
    float _1712 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1718 = _1524 + _1716;
    float _1720 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1722 = _1190 + _1714;
    float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1726 = _1228 + _1724;
    float _1728 = fma(_1718, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1730 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    float _1732 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1734 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1736 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1738 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1732);
    float _1740 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1742 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1734);
    float _1744 = 1.0 / _1736;
    float _1746 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1738);
    float _1748 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1740);
    float _1750 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1742);
    float _1752 = fma(_1726, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1754 = _1746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1760 = -_1190;
    float _1762 = _1760 + _1728;
    float _1764 = _1754 + _1736;
    float _1766 = -_1102;
    float _1768 = _1766 + _1752;
    float _1770 = trunc(_1758);
    int _1772 = int(_1770);
    float _1774 = _1762 * _1762;
    float _1776 = _1764 * _1744;
    float _1778 = _1776 * 0.5;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1782 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1780);
    float _1784 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1786 = trunc(_1784);
    int _1788 = int(_1786);
    int _1790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1792 = _1772 + _1790;
    int _1794 = _1792 + 1;
    float _1796 = 1.0 / _1782;
    int _1798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1800 = _1788 + _1798;
    int _1802 = _1800 + 1;
    int _1804 = _1794 | _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1808 = _1796 * _1806;
    bool _1810 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1812 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1814 = !_1810;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = 2;
    int _1820 = _1804;
    int _1822 = _1816;
    float _1824 = _1752;
    float _1826 = _1728;
    float _1828 = _1768;
    float _1830 = _1758;
    if (!_1810)
    {
        _1818 = 1;
    }
    int _1832 = _1818;
    int _1834 = _1832;
    if (!_1812)
    {
        _1834 = _1816;
    }
    int _1836 = _1834;
    bool _1838 = _1794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1840 = _1836 << 6;
    bool _1842 = _1804 < 0;
    bool _1844 = _1842 || _1838;
    int _1846 = _1840 + 96;
    uint _1849 = uint(int(uint(_1846) >> uint(2)));
    uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
    int _1853 = int(_1849) & 3;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
    int _1857 = int(_1849) + 1;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    int _1861 = _1857 & 3;
    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[int(_1859)][_1861];
    bool _1865 = _1802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1867 = _1865 || _1844;
    int _1869 = _1840 + 104;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    if (!_1867)
    {
        int _1887 = _1802 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1889 = _1887 + _1794;
        _1390 = _1889;
    }
    int _1891 = _1390;
    int _1893 = _1840 + 48;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1913 = _1232 + _1911;
    float _1915 = fma(_1768, _1768, _1774);
    if (!_1867)
    {
        int _1917 = _1891 << 2;
        _1820 = _1917;
    }
    int _1919 = _1820;
    float _1921 = fma(_1913, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1923 = _1919;
    float _1925 = _1921;
    if (!_1867)
    {
        uint _1927 = uint(int(uint(_1891) >> uint(2)));
        _1822 = int(_1927);
    }
    int _1929 = _1822;
    if (!_1867)
    {
        int _1931 = 12 & _1919;
        _1923 = _1931;
    }
    int _1933 = _1923;
    int _1935 = _1840 + 64;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    float _1953 = -_1104;
    float _1955 = _1953 + _1921;
    if (!_1867)
    {
        int _1957 = _1929 << 4;
        int _1959 = _1957 + _1933;
        _1538 = as_type<float>(_1959);
    }
    float _1961 = _1538;
    float _1963 = fma(_1955, _1955, _1915);
    int _1965 = _1840 + 56;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    uint _1969 = uint(int(uint(int(_1967)) >> uint(2)));
    int _1971 = int(_1967) & 3;
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
    int _1975 = int(_1967) + 1;
    uint _1977 = uint(int(uint(_1975) >> uint(2)));
    int _1979 = _1975 & 3;
    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
    float _1983 = sqrt(_1963);
    int _1985 = _1840 + 72;
    uint _1987 = uint(int(uint(_1985) >> uint(2)));
    uint _1989 = uint(int(uint(int(_1987)) >> uint(2)));
    int _1991 = int(_1987) & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    int _1995 = int(_1987) + 1;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    int _1999 = _1995 & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    float _2003 = _1722 * _1863;
    int _2005 = _1840 + 80;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    uint _2009 = uint(int(uint(int(_2007)) >> uint(2)));
    int _2011 = int(_2007) & 3;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
    int _2015 = int(_2007) + 1;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    int _2019 = _2015 & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    bool _2023 = _1983 > 0.0;
    float _2025 = fma(_1102, _1855, _2003);
    float _2027 = fma(_1104, _1877, _2025);
    int _2029 = _1840 + 88;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _2025;
    if (!_1867)
    {
        float _2049 = floor(_1758);
        _2047 = _2049;
    }
    float _2051 = _2047;
    float _2053 = _2027 + _1885;
    float _2055 = _1961;
    if (!_1867)
    {
        int _2057 = as_type<int>(_1961) + 400;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
        int _2063 = int(_2059) & 3;
        float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
        _2055 = _2065;
    }
    float _2067 = _2055;
    float _2069 = 1.0 / _2053;
    bool _2071 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.5);
    bool _2079 = _2075 || _2077;
    float _2081 = _1722 * _1909;
    float _2083 = fma(_1102, _1901, _2081);
    float _2085 = _1722 * _1951;
    float _2087 = fma(_1102, _1943, _2085);
    bool _2089 = !_2023;
    float _2091 = _2081;
    float _2093 = _1901;
    float _2095 = _1993;
    if (!_2089)
    {
        float _2097 = _202 * _202;
        float _2099 = fma(_200, _200, _2097);
        float _2101 = rsqrt(_1963);
        float _2103 = fma(_204, _204, _2099);
        float _2105 = sqrt(_2103);
        float _2107 = _1768 * _2101;
        float _2109 = _1762 * _2101;
        float _2111 = _1955 * _2101;
        bool _2113 = _2105 > 0.0;
        bool _2115 = !_2113;
        _2091 = _2103;
        _1828 = _2107;
        if (!_2115)
        {
            float _2117 = rsqrt(_2103);
            float _2119 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2121 = _202 * _2117;
            float _2123 = _200 * _2117;
            float _2125 = _204 * _2117;
            float _2127 = _2109 * _2121;
            float _2129 = fma(_2107, _2123, _2127);
            float _2131 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2133 = fma(_2111, _2125, _2129);
            float _2135 = _2133 * _2131;
            float _2137 = fma(_200, _2135, _1752);
            float _2139 = fma(_202, _2135, _1728);
            float _2141 = fma(_204, _2135, _1921);
            _1824 = _2137;
            _1826 = _2139;
            _1925 = _2141;
            _2093 = _2121;
        }
    }
    float _2143 = _1824;
    float _2145 = _1826;
    float _2147 = _1925;
    float _2149 = _2091;
    float _2151 = _2093;
    float _2153 = _1828;
    float _2155 = fma(_1104, _1993, _2087);
    float _2157 = fma(_1104, _1973, _2083);
    float _2159 = _2149;
    float _2161 = _2151;
    float _2163 = _2153;
    if (_2079)
    {
        _2159 = _2143;
    }
    float _2165 = _2159;
    float _2167 = _2165;
    if (_2079)
    {
        _2095 = _2145;
    }
    float _2169 = _2095;
    float _2171 = _2169;
    if (_2079)
    {
        _208 = _2147;
    }
    float _2173 = _208;
    float _2175 = _2173;
    if (!_2079)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2179 = _1190 + _2177;
        float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2183 = _1102 + _2181;
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2187 = -_1190;
        float _2189 = _2187 + _2145;
        float _2191 = _2179 * _2179;
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2195 = _1104 + _2193;
        float _2197 = -_1102;
        float _2199 = _2197 + _2143;
        float _2201 = fma(_2183, _2183, _2191);
        float _2203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2205 = fma(_2195, _2195, _2201);
        float _2207 = sqrt(_2205);
        float _2209 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2211 = precise::min(_2207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2213 = _2211 * _2203;
        float _2215 = _2209 * _2213;
        float _2217 = -_1104;
        float _2219 = _2217 + _2147;
        float _2221 = fma(_2189, _2215, _1190);
        float _2223 = fma(_2199, _2215, _1102);
        float _2225 = fma(_2219, _2215, _1104);
        _2171 = _2221;
        _2167 = _2223;
        _2175 = _2225;
    }
    float _2227 = _2171;
    float _2229 = _2167;
    float _2231 = _2175;
    float _2233 = _2157 + _1981;
    float _2235 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2239 = _2155 + _2001;
    float _2241 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2243 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2245 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2235);
    float _2247 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2237);
    float _2249 = _2233 * _2069;
    float _2251 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2241);
    float _2253 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2243);
    float _2255 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2247);
    float _2257 = _2239 * _2069;
    bool _2259 = _2249 >= 0.0;
    float _2261 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2251);
    float _2263 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2253);
    float _2265 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2267 = _2249 <= 1.0;
    bool _2269 = _2267 && _2259;
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2273 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2275 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2277 = _2257 >= 0.0;
    bool _2279 = _2277 && _2269;
    float _2281 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2285 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2245);
    float _2287 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2275);
    bool _2289 = _2257 <= 1.0;
    bool _2291 = _2289 && _2279;
    float _2293 = -_2283;
    float _2295 = fma(_2293, _2281, 1.0);
    float _2297 = _2285 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2287);
    float _2301 = _1190;
    float _2303 = _2285;
    float _2305 = _2295;
    float _2307 = _2249;
    if (!_1867)
    {
        float _2309 = floor(_1784);
        _2301 = _2309;
    }
    float _2311 = _2301;
    float _2313 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1867)
    {
        float _2315 = -_2051;
        float _2317 = _1758 + _2315;
        _2303 = _2317;
    }
    float _2319 = _2303;
    float _2321 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2299);
    float _2323 = _1722 * _2021;
    float _2325 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2327 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2313);
    float _2329 = _2323;
    if (!_1867)
    {
        float _2331 = rint(_2067);
        float _2333 = precise::max(_2331, 0.0);
        uint _2335 = uint(_2333);
        uint _2337 = clamp(_2335, 0u, 65535u);
        _2161 = as_type<float>(_2337);
    }
    float _2339 = _2161;
    float _2341 = fma(_1102, _2013, _2323);
    if (_2291)
    {
        float _2343 = float(_1836);
        _2329 = _2343;
    }
    float _2345 = _2329;
    float _2347 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2325);
    float _2349 = fma(_1104, _2037, _2341);
    float _2351 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2327);
    float _2353 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2347);
    float _2355 = log2(_2295);
    float _2357 = _2349 + _2045;
    float _2359 = _2357 * _2069;
    float _2361 = 1.0 / _2321;
    float _2363 = _2357;
    if (!_1867)
    {
        float _2365 = -_2311;
        float _2367 = _1784 + _2365;
        _2305 = _2367;
    }
    float _2369 = _2305;
    float _2371 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2353);
    float _2373 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2351);
    float _2375 = _2345;
    if (_2291)
    {
        float _2377 = rint(_2345);
        float _2379 = precise::max(_2377, 0.0);
        uint _2381 = uint(_2379);
        uint _2383 = clamp(_2381, 0u, 65535u);
        _2375 = as_type<float>(_2383);
    }
    float _2385 = _2375;
    float _2387 = _2355 * 0.693147182464599609375;
    float _2389 = _2339;
    if (!_1867)
    {
        float3 _7098 = float3(_2319, _2369, float(as_type<int>(_2339)));
        float3 _7102 = select(_7098, float3(0.0), isnan(_7098));
        float _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7102.xy, uint(rint(_7102.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7102.xy, uint(rint(_7102.z)), level(0.0)).x;
        _2389 = _2391;
    }
    float _2393 = _2389;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2397 = _2371 * _2361;
    float _2399 = _2373 * _2361;
    float _2401 = fma(_2397, 0.5, 0.5);
    float _2403 = fma(_2399, -0.5, 0.5);
    float _2405 = _2257;
    float _2407 = _2361;
    if (_2291)
    {
        float3 _7132 = float3(_2249, _2257, float(as_type<int>(_2385)));
        float3 _7134 = select(_7132, float3(0.0), isnan(_7132));
        float _2409 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7134.xy, uint(rint(_7134.z)), _2359, level(0.0));
        _2405 = _2409;
    }
    float _2411 = _2405;
    float3 _7144 = float3(_2401, _2403, _2395);
    float _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7144, float3(0.0), isnan(_7144)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7144, float3(0.0), isnan(_7144)), level(0.0)).x;
    float3 _7153 = float3(_2401, _2403, _2395);
    float4 _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7153, float3(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7153, float3(0.0), isnan(_7153)), level(0.0)).xyzw;
    float _2418 = _2416.x;
    float _2420 = _2416.y;
    float _2422 = _2416.z;
    float _2424 = _2416.w;
    if (_1867)
    {
        _2363 = 1.0;
    }
    float _2426 = _2363;
    bool _2428 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    float _2438 = _2426;
    if (_2436)
    {
        _2407 = 1.0;
    }
    float _2440 = _2407;
    float _2442 = _2440;
    float _2444 = _2424;
    float _2446 = _2422;
    float _2448 = _2420;
    float _2450 = _2418;
    if (!_2436)
    {
        float _2452 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2454 = _2452 * 0.15915493667125701904296875;
        float _2456 = _2454 * 6.283185482025146484375;
        float _2458 = cos(_2456);
        float _2460 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2462 = _2460 * 0.15915493667125701904296875;
        float _2464 = _2454 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = 1.0 / _2458;
        float _2470 = _2462 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        float _2474 = _2466 * _2468;
        float _2476 = _2462 * 6.283185482025146484375;
        float _2478 = sin(_2476);
        float _2480 = _2472 * _2474;
        float _2482 = 1.0 / _2480;
        float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2486 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2484;
        float _2488 = 1.0 / _2486;
        float _2490 = _2478 * _2482;
        float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2494 = fma(_1808, _2490, _2492);
        float _2496 = _2494 * _2488;
        float _2498 = precise::clamp(_2496, 0.0, 1.0);
        _2307 = _2468;
        _1830 = _2482;
        _2442 = _2498;
    }
    float _2500 = _2307;
    float _2502 = _1830;
    float _2504 = _2442;
    float _2506 = _2500;
    if (!_1867)
    {
        int _2508 = _1891 << 4;
        int _2510 = _2508 + 2048;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        uint _2514 = uint(int(uint(int(_2512)) >> uint(2)));
        int _2516 = int(_2512) & 3;
        float _2518 = (*spvDescriptorSet0.vp_c15)._m0[int(_2514)][_2516];
        int _2520 = int(_2512) + 1;
        uint _2522 = uint(int(uint(_2520) >> uint(2)));
        int _2524 = _2520 & 3;
        float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
        int _2528 = _2510 + 8;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        uint _2532 = uint(int(uint(int(_2530)) >> uint(2)));
        int _2534 = int(_2530) & 3;
        float _2536 = (*spvDescriptorSet0.vp_c15)._m0[int(_2532)][_2534];
        int _2538 = int(_2530) + 1;
        uint _2540 = uint(int(uint(_2538) >> uint(2)));
        int _2542 = _2538 & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        float _2546 = _1722 * _2526;
        float _2548 = fma(_1102, _2518, _2546);
        float _2550 = fma(_1104, _2536, _2548);
        float _2552 = _2550 + _2544;
        float _2554 = precise::clamp(_2552, 0.0, 1.0);
        float _2556 = -_2554;
        float _2558 = _2556 + _2393;
        float _2560 = fma(_2558, 500.0, 1.5);
        float _2562 = exp2(_2560);
        float _2564 = 0.0 + _2562;
        float _2566 = precise::clamp(_2564, 0.0, 1.0);
        _2506 = _2526;
        _2438 = _2566;
    }
    float _2568 = _2506;
    float _2570 = _2438;
    float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2574 = _2227 + _2572;
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2578 = _2229 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2582 = _2231 + _2580;
    float _2584 = _2574 * _2574;
    float _2586 = fma(_2578, _2578, _2584);
    float _2588 = fma(_2582, _2582, _2586);
    float _2590 = rsqrt(_2588);
    float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2594 = _2578 * _2592;
    float _2596 = _2582 * _2592;
    float _2598 = _2594 * _2594;
    float _2600 = _2596 * _2596;
    float _2602 = _2598 + _2600;
    float _2604 = sqrt(_2602);
    bool _2606 = _2604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2610 = _2604 + _2608;
    float _2612 = _2582;
    float _2614 = _2584;
    float _2616 = _2610;
    float _2618 = _2568;
    float _2620 = _2592;
    if (_2606)
    {
        float _2622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2612 = _2622;
    }
    float _2624 = _2612;
    if (_2606)
    {
        float _2626 = rsqrt(_2602);
        _2614 = _2626;
    }
    float _2628 = _2614;
    float _2630 = _2628;
    if (_2606)
    {
        float _2632 = _2610 * _2624;
        _2616 = _2632;
    }
    float _2634 = _2616;
    if (_2606)
    {
        float _2636 = _2634 * 0.15915493667125701904296875;
        _2618 = _2636;
    }
    float _2638 = _2618;
    float _2640 = _2590;
    if (_2606)
    {
        float _2642 = _2638 * 6.283185482025146484375;
        float _2644 = sin(_2642);
        _2640 = _2644;
    }
    float _2646 = _2640;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2650 = precise::max(0.0, _2648);
    float _2652 = _2502;
    float _2654 = _2650;
    float _2656 = _2648;
    if (_2606)
    {
        float _2658 = _2638 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        _2652 = _2660;
    }
    float _2662 = _2652;
    float _2664 = -_2592;
    float _2666 = -_2650;
    float _2668 = fma(_2574, _2664, _2666);
    float _2670 = _2668;
    if (_2606)
    {
        float _2672 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2654 = _2672;
    }
    float _2674 = _2654;
    float _2676 = _2646;
    float _2678 = _2674;
    if (_2606)
    {
        float _2680 = fma(_2646, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = _2682;
    if (!_2606)
    {
        _2678 = _2596;
    }
    float _2686 = _2678;
    float _2688 = _2686;
    float _2690 = _2662;
    if (_2606)
    {
        float _2692 = _2662 + (-1.0);
        _2656 = _2692;
    }
    float _2694 = _2656;
    if (_2606)
    {
        float _2696 = _2628 * _2682;
        _2163 = _2696;
    }
    float _2698 = _2163;
    if (!_2606)
    {
        _2684 = _2594;
    }
    float _2700 = _2684;
    float _2702 = _2700;
    if (_2606)
    {
        float _2704 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2620 = _2704;
    }
    float _2706 = _2620;
    if (_2606)
    {
        float _2708 = _2594 * _2698;
        _2702 = _2708;
    }
    float _2710 = _2702;
    if (!_2606)
    {
        _2630 = _2598;
    }
    float _2712 = _2630;
    float _2714 = _2712;
    if (_2606)
    {
        float _2716 = _2596 * _2698;
        _2688 = _2716;
    }
    float _2718 = _2688;
    if (_2606)
    {
        float _2720 = fma(_2668, _2662, _2706);
        _2670 = _2720;
    }
    float _2722 = _2670;
    if (_2606)
    {
        float _2724 = _2710 * _2710;
        _2714 = _2724;
    }
    float _2726 = _2714;
    if (!_2606)
    {
        _2690 = _2600;
    }
    float _2728 = _2690;
    float _2730 = _2728;
    if (_2606)
    {
        float _2732 = _2718 * _2718;
        _2730 = _2732;
    }
    float _2734 = _2730;
    float _2736 = sqrt(_2588);
    float _2738 = fma(_2722, _2722, _2726);
    float _2740 = _2738 + _2734;
    float _2742 = rsqrt(_2740);
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2746 = fma(_2736, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2744);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = -_2748;
    float _2752 = _2750 + 1.0;
    float _2754 = _2742 * _2710;
    float _2756 = _2742 * _2722;
    float _2758 = _2742 * _2718;
    float _2760 = abs(_2752);
    float _2762 = log2(_2760);
    float _2764 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2766 = -_2764;
    float _2768 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2766);
    float _2770 = -_2758;
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2768);
    float _2774 = fma(_2772, -0.5, 0.5);
    float _2776 = fma(_2772, 0.5, 0.5);
    float _2778 = _2756 + 1.0;
    float _2780 = _2762 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2782 = fma(_2776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2784 = sqrt(_2774);
    float _2786 = fma(_2776, _2782, -0.212114393711090087890625);
    float _2788 = fma(_2776, _2786, 1.570728778839111328125);
    float _2790 = exp2(_2780);
    float _2792 = _2784 * 0.636619746685028076171875;
    float _2794 = -_2788;
    float _2796 = fma(_2792, _2794, 1.0);
    float _2798 = -_2756;
    float _2800 = fma(_2790, _2778, _2798);
    float _2802 = fma(_2800, 0.5, 0.5);
    float2 _7723 = float2(_2796, _2802);
    float3 _2804 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7723, float2(0.0), isnan(_7723)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7723, float2(0.0), isnan(_7723)), level(0.0)).xyz;
    float _2806 = _2804.x;
    float _2808 = _2804.y;
    float _2810 = _2804.z;
    float _2812 = abs(_1808);
    float _2814 = log2(_2812);
    float _2816 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2818 = -_1710;
    float _2820 = _2818 + 1.0;
    float _2822 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2816);
    bool _2824 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2826 = isnan(_2736);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2832 = _2828 || _2830;
    float _2834 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2822);
    float _2836 = _2321 * 0.5;
    float _2838 = _2762 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2840 = _1808 <= 8000.0;
    bool _2842 = isnan(_1808);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan(8000.0);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2834);
    float _2854 = fma(_2373, -0.5, _2836);
    float _2856 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2858 = exp2(_2838);
    out.gl_Position.x = _2371;
    out.gl_Position.y = _2373;
    out.gl_Position.z = _2852;
    out.gl_Position.w = _2321;
    float _2860 = _2762;
    if (!_2291)
    {
        _2860 = 1.0;
    }
    float _2862 = _2860;
    float _2864 = _2852 + _2321;
    float _2866 = _2862;
    if (_2291)
    {
        bool _2868 = _2411 >= _2359;
        bool _2870 = isnan(_2411);
        bool _2872 = _2868 || _2870;
        bool _2874 = isnan(_2359);
        bool _2876 = _2872 || _2874;
        float _2878 = float(_2876);
        _2866 = _2878;
    }
    float _2880 = _2866;
    float _2882 = _2371 + _2321;
    float _2884 = _2864 * 0.5;
    float _2886 = exp2(_2856);
    float _2888 = _2880 * _2570;
    float _2890 = _2882 * 0.5;
    out.m_97.x = _2890;
    out.m_97.y = _2854;
    out.m_97.z = _2884;
    out.m_97.w = _2321;
    float _2892 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2894 = precise::clamp(_2892, 0.0, 1.0);
    float _2896 = fma(_2894, -2.0, 3.0);
    float _2898 = _2894 * _2894;
    float _2900 = _2898 * _2896;
    float _2902 = -_2900;
    float _2904 = _2902 + 1.0;
    float _2906 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2900);
    float _2908 = _2850 * _2906;
    float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2912 = -_2858;
    float _2914 = _2912 + 1.0;
    float _2916 = _2820 * _2910;
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2922 = -_2918;
    float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2926 = _2920 * _2413;
    float _2928 = -_2920;
    float _2930 = _2928 + 1.0;
    float _2932 = -_2888;
    float _2934 = fma(_2932, _2924, 1.0);
    float _2936 = precise::clamp(_2934, 0.0, 1.0);
    float _2938 = _2424 * _2926;
    float _2940 = _2424 * _2930;
    float _2942 = _2504 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2944 = _2936 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2946 = _2930;
    float _2948 = _2938;
    if (!_2832)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2950 = _2946;
    out.m_99.x = _2944;
    float _2952 = _2810 * _2926;
    float _2954 = fma(_2806, _2938, _2418);
    float _2956 = fma(_2808, _2938, _2420);
    float _2958 = _2950;
    float _2960 = _2950;
    if (!_2832)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2962 = _2948;
    float _2964 = fma(_2424, _2952, _2422);
    float _2966 = _2962;
    float _2968 = _2962;
    if (!_2832)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _2444;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2832)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2976 = _2446;
    out.m_101.x = _2954;
    out.m_101.y = _2956;
    out.m_101.z = _2964;
    out.m_101.w = _2940;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2832)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2982 = _2448;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2832)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2988 = _2450;
    bool _2990 = !_2832;
    float _2992 = _2988;
    float _2994 = _2988;
    if (!_2990)
    {
        bool _2996 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2998 = isnan(_2736);
        bool _3000 = _2996 || _2998;
        bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3004 = _3000 || _3002;
        if (!_3004)
        {
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = _2736 + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3012 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3010;
            float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3018 = 1.0 / _3012;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3036 = _3008 * _3018;
            float _3038 = precise::clamp(_3036, 0.0, 1.0);
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3044 = fma(_3038, _3016, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3046 = fma(_3038, _3042, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3048 = fma(_3038, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3050 = fma(_3038, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3052 = fma(_3038, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3054 = fma(_3038, _3034, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2980 = _3048;
            _2986 = _3052;
            _2974 = _3044;
            _2960 = _3050;
            _2968 = _3046;
            _2994 = _3054;
            _3056 = true;
        }
        else
        {
            bool _3058 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3060 = isnan(_2736);
            bool _3062 = _3058 || _3060;
            bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3066 = _3062 || _3064;
            if (!_3066)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3068 = _2972;
            _2974 = _3068;
            if (!_3066)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3070 = _2978;
            _2980 = _3070;
            if (!_3066)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3072 = _2966;
            _2968 = _3072;
            if (!_3066)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3074 = _2958;
            _2960 = _3074;
            if (!_3066)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3076 = _2984;
            _2986 = _3076;
            if (!_3066)
            {
                _2992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3078 = _2992;
            bool _3080 = !_3066;
            _2994 = _3078;
            if (!_3080)
            {
                bool _3082 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3084 = isnan(_2736);
                bool _3086 = _3082 || _3084;
                bool _3088 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3090 = _3086 || _3088;
                if (!_3090)
                {
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = _2736 + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3096;
                    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3104 = 1.0 / _3098;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3122 = _3094 * _3104;
                    float _3124 = precise::clamp(_3122, 0.0, 1.0);
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3130 = fma(_3124, _3102, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3132 = fma(_3124, _3128, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3134 = fma(_3124, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3136 = fma(_3124, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3138 = fma(_3124, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3140 = fma(_3124, _3120, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2980 = _3134;
                    _2986 = _3138;
                    _2974 = _3130;
                    _2960 = _3136;
                    _2968 = _3132;
                    _2994 = _3140;
                    _3056 = true;
                }
                else
                {
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3056 = false;
    float _3142 = _2980;
    float _3144 = _2986;
    float _3146 = _2974;
    float _3148 = _2960;
    float _3150 = _2968;
    float _3152 = _2994;
    float _3154 = fma(_1598, -0.5, 0.5);
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3142;
    float _3160 = _3158 + _3144;
    float _3162 = _2942 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3164 = -_3146;
    float _3166 = _3164 + _3148;
    float _3168 = fma(_3156, _3160, _3142);
    out.m_103.x = 0.0;
    float _3170 = -_3150;
    float _3172 = _3170 + _3152;
    float _3174 = fma(_3156, _3166, _3146);
    float _3176 = _3168 * 0.586610972881317138671875;
    out.m_63.x = _3162;
    bool _3178 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3180 = fma(_3156, _3172, _3150);
    float _3182 = fma(_3174, 0.298911988735198974609375, _3176);
    bool _3184 = _2504 > 0.0;
    bool _3186 = isnan(_2504);
    bool _3188 = _3184 || _3186;
    bool _3190 = isnan(0.0);
    bool _3192 = _3188 || _3190;
    float _3194 = fma(_3180, 0.114477999508380889892578125, _3182);
    float _3196 = -_3194;
    float _3198 = _3174 + _3196;
    float _3200 = -_3194;
    float _3202 = _3168 + _3200;
    float _3204 = -_3194;
    float _3206 = _3180 + _3204;
    float _3208 = fma(_3198, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3210 = fma(_3202, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3212 = fma(_3206, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    bool _3214 = !_3178;
    if (!_3214)
    {
        float _3216 = -_2227;
        float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3220 = -_2229;
        float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3224 = -_2231;
        float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3228 = _3218 * _3218;
        float _3230 = fma(_3222, _3222, _3228);
        float _3232 = fma(_3226, _3226, _3230);
        float _3234 = sqrt(_3232);
        float _3236 = rsqrt(_3232);
        float _3238 = -_3234;
        float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3242 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3244 = precise::clamp(_3242, 0.0, 1.0);
        float _3246 = _3222 * _3236;
        float _3248 = _3218 * _3236;
        float _3250 = abs(_3244);
        float _3252 = log2(_3250);
        float _3254 = _3226 * _3236;
        float _3256 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3258 = _1598 * _3248;
        float _3260 = -_3248;
        float _3262 = -_3256;
        float _3264 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3262);
        float _3266 = fma(_1596, _3246, _3258);
        float _3268 = -_3254;
        float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3264);
        float _3272 = fma(_1616, _3254, _3266);
        float _3274 = precise::clamp(_3272, 0.0, 1.0);
        float _3276 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3278 = _3270 + _3276;
        float _3280 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3282 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3284 = precise::clamp(_3282, 0.0, 1.0);
        float _3286 = exp2(_3280);
        float _3288 = _3286 * _3284;
        float _3290 = _3274 * _3288;
        float _3292 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3296 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3292;
        out.m_103.y = _3294;
        out.m_103.z = _3296;
    }
    out.m_105.x = _3208;
    out.m_105.y = _3210;
    out.m_105.z = _3212;
    if (_3192)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3298 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3298;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3056 = false;
    bool _1662 = false;
    bool _620 = false;
    bool _504 = false;
    bool _228 = false;
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
        float _3355 = as_type<float>(_140);
        out.gl_Position.z = _3355;
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
        out.m_63.x = 0.0;
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
        float _3424 = as_type<float>(_178);
        out.gl_Position.z = _3424;
    }
    if (_172)
    {
        return out;
    }
    float _180 = in.m_67.x;
    float _182 = in.m_67.y;
    float _184 = in.m_67.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_186;
    float _208 = _200;
    float _226;
    if (!_206)
    {
        float _210 = in.m_69.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        float _230 = float(_124);
        float _232 = 1.0 / _230;
        float _234 = _158 * _232;
        _226 = _234;
    }
    _228 = false;
    float _236 = _226;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _236 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _236 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _236 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = 1.0 / _252;
    float _268 = 1.0 / _256;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _264;
    bool _278 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _280 = isnan(_236);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = _248 * _266;
    bool _292 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_236);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = 1.0 / _260;
    float _310 = _240 * _276;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _236 + _312;
    bool _316 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_236);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _314 * _268;
    bool _334 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_236);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_288;
    float _348 = _346 + 1.0;
    float _350 = _244 * _308;
    float _352 = -_344;
    float _354 = _352 + 1.0;
    float _356 = fma(_330, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_272, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = fma(_306, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _326 * _354;
    bool _364 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _366 = isnan(_236);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _384 = _302 * _348;
    float _386 = -_302;
    float _388 = _386 + 1.0;
    float _390 = _288 * _378;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = _374 * _388;
    float _402 = fma(_382, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_394, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_398, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = _356 * _400;
    float _410 = _358 * _400;
    float _412 = -_374;
    float _414 = _412 + 1.0;
    float _416 = _360 * _400;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_420, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_402, _384, _426);
    float _440 = fma(_406, _384, _430);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _450 = fma(_424, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_434, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_404, _384, _428);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _460 = fma(_436, _390, _438);
    float _462 = fma(_444, _332, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _464 = fma(_448, _332, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _466 = fma(_458, _332, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _468 = fma(_450, _390, _454);
    float _470 = fma(_452, _390, _440);
    float _472 = fma(_462, _362, _460);
    float _474 = fma(_464, _362, _468);
    float _476 = fma(_466, _362, _470);
    float _478 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _472);
    float _480 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _474);
    float _482 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _476);
    bool _484 = !_274;
    float _502;
    if (!_484)
    {
        float _486 = in.m_69.x;
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _490 = _486 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_124);
        float _508 = 1.0 / _506;
        float _510 = _158 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    bool _514 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = isnan(_512);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _532 = isnan(_512);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _512 + _546;
    float _550 = -_524;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = 1.0 / _528;
    float _558 = _540 * _552;
    float _560 = -_540;
    float _562 = _560 + 1.0;
    float _564 = in.m_71.x;
    float _566 = in.m_71.y;
    float _568 = in.m_71.z;
    float _570 = _544 * _556;
    float _572 = fma(_570, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _572 * _558;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _584 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[116].x, _576);
    float _586 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _594 = _482 * _568;
    float _596 = _480 * _566;
    float _598 = _478 * _564;
    out.m_73.x = _586;
    out.m_73.y = _588;
    out.m_73.z = _590;
    out.m_73.w = _592;
    bool _600 = !_554;
    float _618;
    if (!_600)
    {
        float _602 = in.m_69.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_124);
        float _624 = 1.0 / _622;
        float _626 = _158 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_69.z;
    float _632 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _634 = log2(_632);
    float _636 = in.m_69.x;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _640 = _638 != 0;
    float _642 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _644 = in.m_69.y;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _656 = _654 != 0;
    float _658 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _662 = _594 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _664 = !_656;
    int _666 = _664 ? 0 : 1;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _670 = _634 * _158;
    float _672 = _630 * 2.0;
    float _674 = exp2(_670);
    float _676 = _636 * 2.0;
    float _678 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _680 = _636 + (-0.5);
    float _682 = _644 * 2.0;
    float _684 = floor(_672);
    float _686 = _644 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _688 = -_660;
    float _690 = fma(_678, 2.0, _688);
    float _692 = _678;
    float _694 = _636;
    if (_640)
    {
        _692 = _636;
    }
    float _696 = _692;
    float _698 = fma(_686, -2.0, _668);
    float _700 = floor(_676);
    float _702 = _696;
    if (!_640)
    {
        _702 = _630;
    }
    float _704 = _702;
    float _706 = -_674;
    float _708 = _706 + 1.0;
    float _710 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _698);
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _714 = _684 > 0.0;
    float _716 = floor(_682);
    bool _718 = _684 >= 0.0;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = _636 + _644;
    int _730 = _726 ? 0 : 1;
    float _732 = _728 + (-1.0);
    bool _734 = _700 > 0.0;
    int _736 = ~_730;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _744 = _732;
    int _746 = _740;
    if (_640)
    {
        _744 = _644;
    }
    float _748 = _744;
    float _750 = _748;
    if (!_714)
    {
        int _752 = ~_730;
        int _754 = _752 + 1;
        _746 = _754;
    }
    int _756 = _746;
    bool _758 = _700 >= 0.0;
    bool _760 = isnan(_700);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = !_648;
    int _770 = _768 ? 0 : 1;
    if (!_640)
    {
        _750 = _636;
    }
    float _772 = _750;
    int _774 = abs(_770);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _778 = _772 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _782 = _716 > 0.0;
    float _784 = -_776;
    float _786 = fma(_712, 2.0, _784);
    bool _788 = _716 >= 0.0;
    bool _790 = isnan(_716);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = fma(_778, -2.0, _780);
    float _800 = in.m_75.x;
    float _802 = in.m_75.y;
    float _804 = in.m_75.z;
    float _806 = float(_774);
    float _808 = float(_756);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _812 = 1.0 + _810;
    int _814 = _766 ? 0 : 1;
    int _816 = _796 ? 0 : 1;
    float _818 = _806 * _808;
    float _820 = 1.0 / _812;
    float _822 = _818 * (-2.0);
    int _824 = ~_814;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _832 = ~_816;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _840 = _828;
    int _842 = _836;
    if (!_734)
    {
        int _844 = ~_814;
        int _846 = _844 + 1;
        _840 = _846;
    }
    int _848 = _840;
    float _850 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    if (!_782)
    {
        int _852 = ~_816;
        int _854 = _852 + 1;
        _842 = _854;
    }
    int _856 = _842;
    float _858 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].z, _838);
    float _860 = -_158;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[76].x, _690);
    float _864 = fma(_822, _800, _800);
    bool _866 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _868 = isnan(1.0);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _874 = _870 || _872;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _878 = !_652;
    int _880 = _878 ? 0 : 1;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _884 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _892 = _888 || _890;
    float _894 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[88].z, _876);
    int _896 = abs(_880);
    float _898 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[88].w, _882);
    float _900 = _892 ? _708 : 0.0;
    float _902 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _858);
    float _904 = float(_896);
    float _906 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _850);
    float _908 = float(_848);
    float _910 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _894);
    float _912 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _898);
    float _914 = -_158;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _786);
    float _918 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _798);
    if (_874)
    {
        float _920 = _900 * _820;
        _162 = _920;
    }
    float _922 = _162;
    float _924 = fma(_742, _822, _742);
    float _926 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    int _928 = abs(_666);
    float _930 = _644 + _630;
    float _932 = _904 * _908;
    float _934 = fma(_924, _922, _926);
    float _936 = _930 + (-1.0);
    float _938 = float(_928);
    float _940 = _932 * (-2.0);
    float _942 = float(_856);
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = _636 + _630;
    float _948 = fma(_940, _802, _802);
    float _950 = _934 * 0.15915493667125701904296875;
    float _952 = _938 * _942;
    float _954 = _644 + (-0.5);
    float _956 = fma(_944, _940, _944);
    float _958 = _946 + (-1.0);
    float _960 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].y, _948);
    float _962 = _952 * (-2.0);
    float _964 = _950 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(_956, _922, _960);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _972 = fma(_962, _804, _804);
    float _974 = in.m_77.x;
    float _976 = in.m_77.y;
    float _978 = in.m_77.z;
    float _980 = _630 + (-0.5);
    float _982 = fma(_970, _962, _970);
    float _984 = _950 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _968 * 0.15915493667125701904296875;
    float _990 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].z, _972);
    float _992 = fma(_982, _922, _990);
    float _994 = _988 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _992 * 0.15915493667125701904296875;
    float _1000 = _988 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _974);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _976);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _978);
    float _1010 = _998 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = _642 * _1004;
    float _1016 = _658 * _1006;
    float _1018 = _662 * _1008;
    float _1020 = in.m_60.x;
    float _1022 = in.m_60.y;
    float _1024 = in.m_60.z;
    float _1026 = _986 * _996;
    float _1028 = _966 * _996;
    float _1030 = _998 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = _986 * _1002;
    float _1036 = _966 * _1002;
    float _1038 = _986 * _1012;
    float _1040 = _966 * _1012;
    float _1042 = _1002 * _1012;
    float _1044 = _996 * _1012;
    float _1046 = _1038 * _1016;
    float _1048 = _1040 * _1016;
    float _1050 = fma(_1032, _1034, _1028);
    float _1052 = fma(_1032, _1028, _1034);
    float _1054 = -_1016;
    float _1056 = _1032 * _1054;
    float _1058 = -_1026;
    float _1060 = fma(_1032, _1036, _1058);
    float _1062 = -_1036;
    float _1064 = fma(_1032, _1026, _1062);
    float _1066 = fma(_1050, _1014, _1046);
    float _1068 = fma(_1042, _1014, _1056);
    float _1070 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = fma(_1060, _1014, _1048);
    float _1074 = fma(_1064, _1018, _1066);
    float _1076 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1078 = fma(_1044, _1018, _1068);
    float _1080 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1086 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1088 = fma(_1052, _1018, _1072);
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1082);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1084);
    float _1094 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1096 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1086);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1090);
    float _1100 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1092);
    float _1102 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1108 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1110 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1112 = _1102 + _1106;
    float _1114 = _1104 + _1108;
    float _1116 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1110);
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1120 = _1112 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1114 + _1122;
    float _1126 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1116);
    float _1128 = _1120 * _1120;
    float _1130 = _1124 * _1124;
    float _1132 = _1128 + _1130;
    float _1134 = sqrt(_1132);
    bool _1136 = _1134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = _1134 + _1138;
    float _1142 = _1100;
    float _1144 = _1024;
    float _1146 = _1140;
    float _1148 = _1074;
    float _1150 = _1126;
    float _1152 = _1114;
    int _1154 = as_type<int>(_974);
    int _1156 = as_type<int>(_978);
    float _1158 = _1128;
    float _1160 = _1130;
    float _1162 = _1060;
    if (_1136)
    {
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1164;
    }
    float _1166 = _1142;
    if (_1136)
    {
        float _1168 = rsqrt(_1132);
        _1144 = _1168;
    }
    float _1170 = _1144;
    if (_1136)
    {
        float _1172 = _1140 * _1166;
        _1146 = _1172;
    }
    float _1174 = _1146;
    float _1176 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1174;
    if (!_1136)
    {
        _1148 = _1112;
    }
    float _1180 = _1148;
    float _1182 = _1180;
    if (_1136)
    {
        float _1184 = _1174 * 0.15915493667125701904296875;
        _1178 = _1184;
    }
    float _1186 = _1178;
    float _1188 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1190 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1192 = _1020;
    float _1194 = _1186;
    if (_1136)
    {
        float _1196 = _1186 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        _1192 = _1198;
    }
    float _1200 = _1192;
    float _1202 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1188);
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1206 = _1190 + _1204;
    float _1208 = _1206;
    if (_1136)
    {
        float _1210 = _1206 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1210;
    }
    float _1212 = _1150;
    float _1214 = _1212;
    if (_1136)
    {
        float _1216 = fma(_1200, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1214 = _1216;
    }
    float _1218 = _1214;
    float _1220 = _1218;
    if (_1136)
    {
        float _1222 = _1170 * _1218;
        _1220 = _1222;
    }
    float _1224 = _1220;
    if (_1136)
    {
        float _1226 = fma(_1120, _1224, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1182 = _1226;
    }
    float _1228 = _1182;
    if (_1136)
    {
        float _1230 = fma(_1124, _1224, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1152 = _1230;
    }
    float _1232 = _1152;
    float _1234 = fma(_1228, 6.2500002968590706586837768554688e-05, 0.5);
    float _1236 = fma(_1232, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5125 = float2(_1234, _1236);
    float3 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5125, float2(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5125, float2(0.0), isnan(_5125)), level(0.0)).xyz;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = in.m_79.y;
    float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1252 = in.m_81.w;
    bool _1254 = _630 > 0.5;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1260 = _644 > 0.5;
    float _1262 = in.m_79.x;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1266 = _1264 != 0;
    float _1268 = 1.0 / _1258;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = in.m_83.x;
    float _1284 = in.m_83.y;
    float _1286 = in.m_83.z;
    float _1288 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1290 = _1276;
    if (_1136)
    {
        float _1292 = _1186 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        _1194 = _1294;
    }
    float _1296 = _1194;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1298;
    float _1302 = -_1248;
    float _1304 = _1302 + 1.0;
    float _1306 = _1300 * _1268;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1310 = _628 + _1308;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1314 = _1254 ? as_type<int>(_1304) : as_type<int>(_1248);
    out.m_85.w = _1252;
    bool _1316 = _976 != 0.0;
    bool _1318 = isnan(_976);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    float _1326 = _1276 ? as_type<float>(_1314) : _1248;
    bool _1328 = _974 == 0.0;
    bool _1330 = !_1324;
    bool _1332 = _1328 && _1330;
    bool _1334 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1336 = isnan(_628);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = fma(_1306, _1310, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1348 = _978 == 0.0;
    bool _1350 = _1348 && _1332;
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1354 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1356 = isnan(_628);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = fma(_1326, _1288, -0.5);
    float _1368 = _1248;
    if (_1266)
    {
        bool _1370 = _636 > 0.5;
        _1290 = _1370;
    }
    bool _1372 = _1290;
    if (_1280)
    {
        float _1374 = _1260 ? _1304 : _1248;
        _1368 = _1374;
    }
    float _1376 = _1368;
    float _1378 = -_918;
    float _1380 = fma(_912, _1366, _1378);
    float _1382 = _1282;
    float _1384 = _1286;
    float _1386 = _1284;
    float _1388 = _1262;
    int _1390 = as_type<int>(_1380);
    if (!_1266)
    {
        _694 = _1262;
    }
    float _1392 = _694;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1396 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1398 = -_1364;
    float _1400 = _1398 + 1.0;
    float _1402 = _1392;
    if (!_1350)
    {
        float _1404 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1382 = _1404;
    }
    float _1406 = _1382;
    if (!_1350)
    {
        float _1408 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1286);
        _1384 = _1408;
    }
    float _1410 = _1384;
    if (_1266)
    {
        float _1412 = -_1262;
        float _1414 = _1412 + 1.0;
        _1154 = as_type<int>(_1414);
    }
    int _1416 = _1154;
    if (!_1350)
    {
        float _1418 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1284);
        _1386 = _1418;
    }
    float _1420 = _1386;
    if (_1272)
    {
        float _1422 = -_1262;
        float _1424 = _1422 + 1.0;
        _1156 = as_type<int>(_1424);
    }
    int _1426 = _1156;
    float _1428 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1430 = -_1032;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1396);
    if (_1266)
    {
        float _1434 = _1372 ? as_type<float>(_1416) : _1262;
        _1402 = _1434;
    }
    float _1436 = _1402;
    float _1438 = _1344 * _1400;
    float _1440 = fma(_1428, _1376, -0.5);
    if (_1272)
    {
        float _1442 = _1260 ? as_type<float>(_1426) : _1262;
        _1388 = _1442;
    }
    float _1444 = _1388;
    float _1446 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1448 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1450 = -_710;
    float _1452 = fma(_906, _1440, _1450);
    float _1454 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1456 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = fma(_1448, _1444, -0.5);
    float _1460 = -_1032;
    float _1462 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1446);
    float _1464 = fma(_1454, _1436, -0.5);
    float _1466 = -_1032;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1470 = fma(_910, _1458, _916);
    float _1472 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1474 = fma(_902, _1464, _862);
    float _1476 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1462);
    float _1478 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1480 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1472);
    float _1482 = _1472;
    if (_1136)
    {
        float _1484 = _1296 + (-1.0);
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1490 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1492 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1494 = _1486;
    float _1496 = _1490;
    if (_1136)
    {
        float _1498 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1498;
    }
    float _1500 = _1494;
    float _1502 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1432);
    float _1504 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1468);
    float _1506 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1490);
    float _1508 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1478);
    float _1510 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1488);
    float _1512 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1492);
    float _1514 = _1500;
    if (_1136)
    {
        float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1518 = _1228 + _1516;
        _1496 = _1518;
    }
    float _1520 = _1496;
    if (_1136)
    {
        float _1522 = fma(_1206, _1296, _1500);
        _1208 = _1522;
    }
    float _1524 = _1208;
    float _1526 = _1476 * _1420;
    float _1528 = _1502 * _1420;
    float _1530 = _1504 * _1420;
    float _1532 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1508);
    float _1534 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1510);
    float _1536 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1512);
    float _1538 = _1536;
    if (_1136)
    {
        float _1540 = _1520 * _1520;
        _1158 = _1540;
    }
    float _1542 = _1158;
    if (_1136)
    {
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1546 = _1232 + _1544;
        _1514 = _1546;
    }
    float _1548 = _1514;
    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1552 = _1524 + _1550;
    float _1554 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1556 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1506);
    if (_1136)
    {
        float _1558 = _1548 * _1548;
        _1160 = _1558;
    }
    float _1560 = _1160;
    float _1562 = fma(_1552, _1552, _1542);
    float _1564 = _1346 * _1438;
    float _1566 = -_1344;
    float _1568 = _1566 + 1.0;
    float _1570 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1554);
    float _1572 = _1562 + _1560;
    float _1574 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1480);
    float _1576 = fma(_1556, _1406, _1528);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1564);
    float _1580 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1570);
    float _1582 = fma(_1574, _1406, _1526);
    float _1584 = sqrt(_1572);
    float _1586 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1578);
    float _1588 = fma(_1580, _1406, _1530);
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1596 = fma(_1532, _1410, _1582);
    float _1598 = fma(_1534, _1410, _1576);
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = _1452 + 0.5;
    float _1608 = _1380 + 0.5;
    float _1610 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1612 = _1474 + 0.5;
    float _1614 = _1470 + 0.5;
    float _1616 = fma(_1536, _1410, _1588);
    bool _1618 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1620 = isnan(_1584);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1626 = _1622 || _1624;
    out.m_87.x = _1600;
    out.m_87.y = _1602;
    out.m_87.z = _1604;
    out.m_87.w = _1610;
    out.m_89.x = _1612;
    out.m_89.y = _1606;
    out.m_91.x = _1614;
    out.m_91.y = _1608;
    out.m_93.x = _1596;
    out.m_93.y = _1598;
    out.m_93.z = _1616;
    if (!_1626)
    {
        _1162 = 1.0;
    }
    float _1628 = _1162;
    out.m_95.x = _1242;
    out.m_95.y = _1244;
    out.m_95.z = _1246;
    bool _1630 = !_1626;
    float _1632 = _1628;
    if (!_1630)
    {
        bool _1634 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1636 = isnan(_1584);
        bool _1638 = _1634 || _1636;
        bool _1640 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1642 = _1638 || _1640;
        if (!_1642)
        {
            float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1646 = _1584 + _1644;
            float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1650 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1648;
            float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1654 = _1652 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1656 = 1.0 / _1650;
            float _1658 = _1646 * _1656;
            float _1660 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1632 = _1660;
            _1662 = true;
        }
        else
        {
            bool _1664 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1666 = isnan(_1584);
            bool _1668 = _1664 || _1666;
            bool _1670 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1672 = _1668 || _1670;
            if (!_1672)
            {
                float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1676 = _1584 + _1674;
                float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1680 = _1678 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1684 = _1682 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1686 = 1.0 / _1680;
                float _1688 = _1676 * _1686;
                float _1690 = fma(_1688, _1684, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1632 = _1690;
                _1662 = true;
            }
            else
            {
                _1632 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1662 = false;
    float _1692 = _1632;
    float _1694 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1696 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1698 = floor(_1694);
    float _1700 = floor(_1696);
    float _1702 = -_1698;
    float _1704 = _1694 + _1702;
    float _1706 = -_1700;
    float _1708 = _1696 + _1706;
    float2 _5964 = float2(_1704, _1708);
    float _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5964, float2(0.0), isnan(_5964)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5964, float2(0.0), isnan(_5964)), level(0.0)).x;
    float _1712 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1718 = _1524 + _1716;
    float _1720 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1722 = _1190 + _1714;
    float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1726 = _1228 + _1724;
    float _1728 = fma(_1718, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1730 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    float _1732 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1734 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1736 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1738 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1732);
    float _1740 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1742 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1734);
    float _1744 = 1.0 / _1736;
    float _1746 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1738);
    float _1748 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1740);
    float _1750 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1742);
    float _1752 = fma(_1726, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1754 = _1746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1760 = -_1190;
    float _1762 = _1760 + _1728;
    float _1764 = _1754 + _1736;
    float _1766 = -_1102;
    float _1768 = _1766 + _1752;
    float _1770 = trunc(_1758);
    int _1772 = int(_1770);
    float _1774 = _1762 * _1762;
    float _1776 = _1764 * _1744;
    float _1778 = _1776 * 0.5;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1782 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1780);
    float _1784 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1786 = trunc(_1784);
    int _1788 = int(_1786);
    int _1790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1792 = _1772 + _1790;
    int _1794 = _1792 + 1;
    float _1796 = 1.0 / _1782;
    int _1798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1800 = _1788 + _1798;
    int _1802 = _1800 + 1;
    int _1804 = _1794 | _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1808 = _1796 * _1806;
    bool _1810 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1812 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1814 = !_1810;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = 2;
    int _1820 = _1804;
    int _1822 = _1816;
    float _1824 = _1752;
    float _1826 = _1728;
    float _1828 = _1768;
    float _1830 = _1758;
    if (!_1810)
    {
        _1818 = 1;
    }
    int _1832 = _1818;
    int _1834 = _1832;
    if (!_1812)
    {
        _1834 = _1816;
    }
    int _1836 = _1834;
    bool _1838 = _1794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1840 = _1836 << 6;
    bool _1842 = _1804 < 0;
    bool _1844 = _1842 || _1838;
    int _1846 = _1840 + 96;
    uint _1849 = uint(int(uint(_1846) >> uint(2)));
    uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
    int _1853 = int(_1849) & 3;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
    int _1857 = int(_1849) + 1;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    int _1861 = _1857 & 3;
    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[int(_1859)][_1861];
    bool _1865 = _1802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1867 = _1865 || _1844;
    int _1869 = _1840 + 104;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    if (!_1867)
    {
        int _1887 = _1802 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1889 = _1887 + _1794;
        _1390 = _1889;
    }
    int _1891 = _1390;
    int _1893 = _1840 + 48;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1913 = _1232 + _1911;
    float _1915 = fma(_1768, _1768, _1774);
    if (!_1867)
    {
        int _1917 = _1891 << 2;
        _1820 = _1917;
    }
    int _1919 = _1820;
    float _1921 = fma(_1913, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1923 = _1919;
    float _1925 = _1921;
    if (!_1867)
    {
        uint _1927 = uint(int(uint(_1891) >> uint(2)));
        _1822 = int(_1927);
    }
    int _1929 = _1822;
    if (!_1867)
    {
        int _1931 = 12 & _1919;
        _1923 = _1931;
    }
    int _1933 = _1923;
    int _1935 = _1840 + 64;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    float _1953 = -_1104;
    float _1955 = _1953 + _1921;
    if (!_1867)
    {
        int _1957 = _1929 << 4;
        int _1959 = _1957 + _1933;
        _1538 = as_type<float>(_1959);
    }
    float _1961 = _1538;
    float _1963 = fma(_1955, _1955, _1915);
    int _1965 = _1840 + 56;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    uint _1969 = uint(int(uint(int(_1967)) >> uint(2)));
    int _1971 = int(_1967) & 3;
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
    int _1975 = int(_1967) + 1;
    uint _1977 = uint(int(uint(_1975) >> uint(2)));
    int _1979 = _1975 & 3;
    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
    float _1983 = sqrt(_1963);
    int _1985 = _1840 + 72;
    uint _1987 = uint(int(uint(_1985) >> uint(2)));
    uint _1989 = uint(int(uint(int(_1987)) >> uint(2)));
    int _1991 = int(_1987) & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    int _1995 = int(_1987) + 1;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    int _1999 = _1995 & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    float _2003 = _1722 * _1863;
    int _2005 = _1840 + 80;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    uint _2009 = uint(int(uint(int(_2007)) >> uint(2)));
    int _2011 = int(_2007) & 3;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
    int _2015 = int(_2007) + 1;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    int _2019 = _2015 & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    bool _2023 = _1983 > 0.0;
    float _2025 = fma(_1102, _1855, _2003);
    float _2027 = fma(_1104, _1877, _2025);
    int _2029 = _1840 + 88;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _2025;
    if (!_1867)
    {
        float _2049 = floor(_1758);
        _2047 = _2049;
    }
    float _2051 = _2047;
    float _2053 = _2027 + _1885;
    float _2055 = _1961;
    if (!_1867)
    {
        int _2057 = as_type<int>(_1961) + 400;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
        int _2063 = int(_2059) & 3;
        float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
        _2055 = _2065;
    }
    float _2067 = _2055;
    float _2069 = 1.0 / _2053;
    bool _2071 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.5);
    bool _2079 = _2075 || _2077;
    float _2081 = _1722 * _1909;
    float _2083 = fma(_1102, _1901, _2081);
    float _2085 = _1722 * _1951;
    float _2087 = fma(_1102, _1943, _2085);
    bool _2089 = !_2023;
    float _2091 = _2081;
    float _2093 = _1901;
    float _2095 = _1993;
    if (!_2089)
    {
        float _2097 = _202 * _202;
        float _2099 = fma(_200, _200, _2097);
        float _2101 = rsqrt(_1963);
        float _2103 = fma(_204, _204, _2099);
        float _2105 = sqrt(_2103);
        float _2107 = _1768 * _2101;
        float _2109 = _1762 * _2101;
        float _2111 = _1955 * _2101;
        bool _2113 = _2105 > 0.0;
        bool _2115 = !_2113;
        _2091 = _2103;
        _1828 = _2107;
        if (!_2115)
        {
            float _2117 = rsqrt(_2103);
            float _2119 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2121 = _202 * _2117;
            float _2123 = _200 * _2117;
            float _2125 = _204 * _2117;
            float _2127 = _2109 * _2121;
            float _2129 = fma(_2107, _2123, _2127);
            float _2131 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2133 = fma(_2111, _2125, _2129);
            float _2135 = _2133 * _2131;
            float _2137 = fma(_200, _2135, _1752);
            float _2139 = fma(_202, _2135, _1728);
            float _2141 = fma(_204, _2135, _1921);
            _1824 = _2137;
            _1826 = _2139;
            _1925 = _2141;
            _2093 = _2121;
        }
    }
    float _2143 = _1824;
    float _2145 = _1826;
    float _2147 = _1925;
    float _2149 = _2091;
    float _2151 = _2093;
    float _2153 = _1828;
    float _2155 = fma(_1104, _1993, _2087);
    float _2157 = fma(_1104, _1973, _2083);
    float _2159 = _2149;
    float _2161 = _2151;
    float _2163 = _2153;
    if (_2079)
    {
        _2159 = _2143;
    }
    float _2165 = _2159;
    float _2167 = _2165;
    if (_2079)
    {
        _2095 = _2145;
    }
    float _2169 = _2095;
    float _2171 = _2169;
    if (_2079)
    {
        _208 = _2147;
    }
    float _2173 = _208;
    float _2175 = _2173;
    if (!_2079)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2179 = _1190 + _2177;
        float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2183 = _1102 + _2181;
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2187 = -_1190;
        float _2189 = _2187 + _2145;
        float _2191 = _2179 * _2179;
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2195 = _1104 + _2193;
        float _2197 = -_1102;
        float _2199 = _2197 + _2143;
        float _2201 = fma(_2183, _2183, _2191);
        float _2203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2205 = fma(_2195, _2195, _2201);
        float _2207 = sqrt(_2205);
        float _2209 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2211 = precise::min(_2207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2213 = _2211 * _2203;
        float _2215 = _2209 * _2213;
        float _2217 = -_1104;
        float _2219 = _2217 + _2147;
        float _2221 = fma(_2189, _2215, _1190);
        float _2223 = fma(_2199, _2215, _1102);
        float _2225 = fma(_2219, _2215, _1104);
        _2171 = _2221;
        _2167 = _2223;
        _2175 = _2225;
    }
    float _2227 = _2171;
    float _2229 = _2167;
    float _2231 = _2175;
    float _2233 = _2157 + _1981;
    float _2235 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2239 = _2155 + _2001;
    float _2241 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2243 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2245 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2235);
    float _2247 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2237);
    float _2249 = _2233 * _2069;
    float _2251 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2241);
    float _2253 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2243);
    float _2255 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2247);
    float _2257 = _2239 * _2069;
    bool _2259 = _2249 >= 0.0;
    float _2261 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2251);
    float _2263 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2253);
    float _2265 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2267 = _2249 <= 1.0;
    bool _2269 = _2267 && _2259;
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2273 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2275 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2277 = _2257 >= 0.0;
    bool _2279 = _2277 && _2269;
    float _2281 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2285 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2245);
    float _2287 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2275);
    bool _2289 = _2257 <= 1.0;
    bool _2291 = _2289 && _2279;
    float _2293 = -_2283;
    float _2295 = fma(_2293, _2281, 1.0);
    float _2297 = _2285 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2287);
    float _2301 = _1190;
    float _2303 = _2285;
    float _2305 = _2295;
    float _2307 = _2249;
    if (!_1867)
    {
        float _2309 = floor(_1784);
        _2301 = _2309;
    }
    float _2311 = _2301;
    float _2313 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1867)
    {
        float _2315 = -_2051;
        float _2317 = _1758 + _2315;
        _2303 = _2317;
    }
    float _2319 = _2303;
    float _2321 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2299);
    float _2323 = _1722 * _2021;
    float _2325 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2327 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2313);
    float _2329 = _2323;
    if (!_1867)
    {
        float _2331 = rint(_2067);
        float _2333 = precise::max(_2331, 0.0);
        uint _2335 = uint(_2333);
        uint _2337 = clamp(_2335, 0u, 65535u);
        _2161 = as_type<float>(_2337);
    }
    float _2339 = _2161;
    float _2341 = fma(_1102, _2013, _2323);
    if (_2291)
    {
        float _2343 = float(_1836);
        _2329 = _2343;
    }
    float _2345 = _2329;
    float _2347 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2325);
    float _2349 = fma(_1104, _2037, _2341);
    float _2351 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2327);
    float _2353 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2347);
    float _2355 = log2(_2295);
    float _2357 = _2349 + _2045;
    float _2359 = _2357 * _2069;
    float _2361 = 1.0 / _2321;
    float _2363 = _2357;
    if (!_1867)
    {
        float _2365 = -_2311;
        float _2367 = _1784 + _2365;
        _2305 = _2367;
    }
    float _2369 = _2305;
    float _2371 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2353);
    float _2373 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2351);
    float _2375 = _2345;
    if (_2291)
    {
        float _2377 = rint(_2345);
        float _2379 = precise::max(_2377, 0.0);
        uint _2381 = uint(_2379);
        uint _2383 = clamp(_2381, 0u, 65535u);
        _2375 = as_type<float>(_2383);
    }
    float _2385 = _2375;
    float _2387 = _2355 * 0.693147182464599609375;
    float _2389 = _2339;
    if (!_1867)
    {
        float3 _7098 = float3(_2319, _2369, float(as_type<int>(_2339)));
        float3 _7102 = select(_7098, float3(0.0), isnan(_7098));
        float _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7102.xy, uint(rint(_7102.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7102.xy, uint(rint(_7102.z)), level(0.0)).x;
        _2389 = _2391;
    }
    float _2393 = _2389;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2397 = _2371 * _2361;
    float _2399 = _2373 * _2361;
    float _2401 = fma(_2397, 0.5, 0.5);
    float _2403 = fma(_2399, -0.5, 0.5);
    float _2405 = _2257;
    float _2407 = _2361;
    if (_2291)
    {
        float3 _7132 = float3(_2249, _2257, float(as_type<int>(_2385)));
        float3 _7134 = select(_7132, float3(0.0), isnan(_7132));
        float _2409 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7134.xy, uint(rint(_7134.z)), _2359, level(0.0));
        _2405 = _2409;
    }
    float _2411 = _2405;
    float3 _7144 = float3(_2401, _2403, _2395);
    float _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7144, float3(0.0), isnan(_7144)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7144, float3(0.0), isnan(_7144)), level(0.0)).x;
    float3 _7153 = float3(_2401, _2403, _2395);
    float4 _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7153, float3(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7153, float3(0.0), isnan(_7153)), level(0.0)).xyzw;
    float _2418 = _2416.x;
    float _2420 = _2416.y;
    float _2422 = _2416.z;
    float _2424 = _2416.w;
    if (_1867)
    {
        _2363 = 1.0;
    }
    float _2426 = _2363;
    bool _2428 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    float _2438 = _2426;
    if (_2436)
    {
        _2407 = 1.0;
    }
    float _2440 = _2407;
    float _2442 = _2440;
    float _2444 = _2424;
    float _2446 = _2422;
    float _2448 = _2420;
    float _2450 = _2418;
    if (!_2436)
    {
        float _2452 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2454 = _2452 * 0.15915493667125701904296875;
        float _2456 = _2454 * 6.283185482025146484375;
        float _2458 = cos(_2456);
        float _2460 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2462 = _2460 * 0.15915493667125701904296875;
        float _2464 = _2454 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = 1.0 / _2458;
        float _2470 = _2462 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        float _2474 = _2466 * _2468;
        float _2476 = _2462 * 6.283185482025146484375;
        float _2478 = sin(_2476);
        float _2480 = _2472 * _2474;
        float _2482 = 1.0 / _2480;
        float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2486 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2484;
        float _2488 = 1.0 / _2486;
        float _2490 = _2478 * _2482;
        float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2494 = fma(_1808, _2490, _2492);
        float _2496 = _2494 * _2488;
        float _2498 = precise::clamp(_2496, 0.0, 1.0);
        _2307 = _2468;
        _1830 = _2482;
        _2442 = _2498;
    }
    float _2500 = _2307;
    float _2502 = _1830;
    float _2504 = _2442;
    float _2506 = _2500;
    if (!_1867)
    {
        int _2508 = _1891 << 4;
        int _2510 = _2508 + 2048;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        uint _2514 = uint(int(uint(int(_2512)) >> uint(2)));
        int _2516 = int(_2512) & 3;
        float _2518 = (*spvDescriptorSet0.vp_c15)._m0[int(_2514)][_2516];
        int _2520 = int(_2512) + 1;
        uint _2522 = uint(int(uint(_2520) >> uint(2)));
        int _2524 = _2520 & 3;
        float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
        int _2528 = _2510 + 8;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        uint _2532 = uint(int(uint(int(_2530)) >> uint(2)));
        int _2534 = int(_2530) & 3;
        float _2536 = (*spvDescriptorSet0.vp_c15)._m0[int(_2532)][_2534];
        int _2538 = int(_2530) + 1;
        uint _2540 = uint(int(uint(_2538) >> uint(2)));
        int _2542 = _2538 & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        float _2546 = _1722 * _2526;
        float _2548 = fma(_1102, _2518, _2546);
        float _2550 = fma(_1104, _2536, _2548);
        float _2552 = _2550 + _2544;
        float _2554 = precise::clamp(_2552, 0.0, 1.0);
        float _2556 = -_2554;
        float _2558 = _2556 + _2393;
        float _2560 = fma(_2558, 500.0, 1.5);
        float _2562 = exp2(_2560);
        float _2564 = 0.0 + _2562;
        float _2566 = precise::clamp(_2564, 0.0, 1.0);
        _2506 = _2526;
        _2438 = _2566;
    }
    float _2568 = _2506;
    float _2570 = _2438;
    float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2574 = _2227 + _2572;
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2578 = _2229 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2582 = _2231 + _2580;
    float _2584 = _2574 * _2574;
    float _2586 = fma(_2578, _2578, _2584);
    float _2588 = fma(_2582, _2582, _2586);
    float _2590 = rsqrt(_2588);
    float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2594 = _2578 * _2592;
    float _2596 = _2582 * _2592;
    float _2598 = _2594 * _2594;
    float _2600 = _2596 * _2596;
    float _2602 = _2598 + _2600;
    float _2604 = sqrt(_2602);
    bool _2606 = _2604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2610 = _2604 + _2608;
    float _2612 = _2582;
    float _2614 = _2584;
    float _2616 = _2610;
    float _2618 = _2568;
    float _2620 = _2592;
    if (_2606)
    {
        float _2622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2612 = _2622;
    }
    float _2624 = _2612;
    if (_2606)
    {
        float _2626 = rsqrt(_2602);
        _2614 = _2626;
    }
    float _2628 = _2614;
    float _2630 = _2628;
    if (_2606)
    {
        float _2632 = _2610 * _2624;
        _2616 = _2632;
    }
    float _2634 = _2616;
    if (_2606)
    {
        float _2636 = _2634 * 0.15915493667125701904296875;
        _2618 = _2636;
    }
    float _2638 = _2618;
    float _2640 = _2590;
    if (_2606)
    {
        float _2642 = _2638 * 6.283185482025146484375;
        float _2644 = sin(_2642);
        _2640 = _2644;
    }
    float _2646 = _2640;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2650 = precise::max(0.0, _2648);
    float _2652 = _2502;
    float _2654 = _2650;
    float _2656 = _2648;
    if (_2606)
    {
        float _2658 = _2638 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        _2652 = _2660;
    }
    float _2662 = _2652;
    float _2664 = -_2592;
    float _2666 = -_2650;
    float _2668 = fma(_2574, _2664, _2666);
    float _2670 = _2668;
    if (_2606)
    {
        float _2672 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2654 = _2672;
    }
    float _2674 = _2654;
    float _2676 = _2646;
    float _2678 = _2674;
    if (_2606)
    {
        float _2680 = fma(_2646, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = _2682;
    if (!_2606)
    {
        _2678 = _2596;
    }
    float _2686 = _2678;
    float _2688 = _2686;
    float _2690 = _2662;
    if (_2606)
    {
        float _2692 = _2662 + (-1.0);
        _2656 = _2692;
    }
    float _2694 = _2656;
    if (_2606)
    {
        float _2696 = _2628 * _2682;
        _2163 = _2696;
    }
    float _2698 = _2163;
    if (!_2606)
    {
        _2684 = _2594;
    }
    float _2700 = _2684;
    float _2702 = _2700;
    if (_2606)
    {
        float _2704 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2620 = _2704;
    }
    float _2706 = _2620;
    if (_2606)
    {
        float _2708 = _2594 * _2698;
        _2702 = _2708;
    }
    float _2710 = _2702;
    if (!_2606)
    {
        _2630 = _2598;
    }
    float _2712 = _2630;
    float _2714 = _2712;
    if (_2606)
    {
        float _2716 = _2596 * _2698;
        _2688 = _2716;
    }
    float _2718 = _2688;
    if (_2606)
    {
        float _2720 = fma(_2668, _2662, _2706);
        _2670 = _2720;
    }
    float _2722 = _2670;
    if (_2606)
    {
        float _2724 = _2710 * _2710;
        _2714 = _2724;
    }
    float _2726 = _2714;
    if (!_2606)
    {
        _2690 = _2600;
    }
    float _2728 = _2690;
    float _2730 = _2728;
    if (_2606)
    {
        float _2732 = _2718 * _2718;
        _2730 = _2732;
    }
    float _2734 = _2730;
    float _2736 = sqrt(_2588);
    float _2738 = fma(_2722, _2722, _2726);
    float _2740 = _2738 + _2734;
    float _2742 = rsqrt(_2740);
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2746 = fma(_2736, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2744);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = -_2748;
    float _2752 = _2750 + 1.0;
    float _2754 = _2742 * _2710;
    float _2756 = _2742 * _2722;
    float _2758 = _2742 * _2718;
    float _2760 = abs(_2752);
    float _2762 = log2(_2760);
    float _2764 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2766 = -_2764;
    float _2768 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2766);
    float _2770 = -_2758;
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2768);
    float _2774 = fma(_2772, -0.5, 0.5);
    float _2776 = fma(_2772, 0.5, 0.5);
    float _2778 = _2756 + 1.0;
    float _2780 = _2762 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2782 = fma(_2776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2784 = sqrt(_2774);
    float _2786 = fma(_2776, _2782, -0.212114393711090087890625);
    float _2788 = fma(_2776, _2786, 1.570728778839111328125);
    float _2790 = exp2(_2780);
    float _2792 = _2784 * 0.636619746685028076171875;
    float _2794 = -_2788;
    float _2796 = fma(_2792, _2794, 1.0);
    float _2798 = -_2756;
    float _2800 = fma(_2790, _2778, _2798);
    float _2802 = fma(_2800, 0.5, 0.5);
    float2 _7723 = float2(_2796, _2802);
    float3 _2804 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7723, float2(0.0), isnan(_7723)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7723, float2(0.0), isnan(_7723)), level(0.0)).xyz;
    float _2806 = _2804.x;
    float _2808 = _2804.y;
    float _2810 = _2804.z;
    float _2812 = abs(_1808);
    float _2814 = log2(_2812);
    float _2816 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2818 = -_1710;
    float _2820 = _2818 + 1.0;
    float _2822 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2816);
    bool _2824 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2826 = isnan(_2736);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2832 = _2828 || _2830;
    float _2834 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2822);
    float _2836 = _2321 * 0.5;
    float _2838 = _2762 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2840 = _1808 <= 8000.0;
    bool _2842 = isnan(_1808);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan(8000.0);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2834);
    float _2854 = fma(_2373, -0.5, _2836);
    float _2856 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2858 = exp2(_2838);
    out.gl_Position.x = _2371;
    out.gl_Position.y = _2373;
    out.gl_Position.z = _2852;
    out.gl_Position.w = _2321;
    float _2860 = _2762;
    if (!_2291)
    {
        _2860 = 1.0;
    }
    float _2862 = _2860;
    float _2864 = _2852 + _2321;
    float _2866 = _2862;
    if (_2291)
    {
        bool _2868 = _2411 >= _2359;
        bool _2870 = isnan(_2411);
        bool _2872 = _2868 || _2870;
        bool _2874 = isnan(_2359);
        bool _2876 = _2872 || _2874;
        float _2878 = float(_2876);
        _2866 = _2878;
    }
    float _2880 = _2866;
    float _2882 = _2371 + _2321;
    float _2884 = _2864 * 0.5;
    float _2886 = exp2(_2856);
    float _2888 = _2880 * _2570;
    float _2890 = _2882 * 0.5;
    out.m_97.x = _2890;
    out.m_97.y = _2854;
    out.m_97.z = _2884;
    out.m_97.w = _2321;
    float _2892 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2894 = precise::clamp(_2892, 0.0, 1.0);
    float _2896 = fma(_2894, -2.0, 3.0);
    float _2898 = _2894 * _2894;
    float _2900 = _2898 * _2896;
    float _2902 = -_2900;
    float _2904 = _2902 + 1.0;
    float _2906 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2900);
    float _2908 = _2850 * _2906;
    float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2912 = -_2858;
    float _2914 = _2912 + 1.0;
    float _2916 = _2820 * _2910;
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2922 = -_2918;
    float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2926 = _2920 * _2413;
    float _2928 = -_2920;
    float _2930 = _2928 + 1.0;
    float _2932 = -_2888;
    float _2934 = fma(_2932, _2924, 1.0);
    float _2936 = precise::clamp(_2934, 0.0, 1.0);
    float _2938 = _2424 * _2926;
    float _2940 = _2424 * _2930;
    float _2942 = _2504 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2944 = _2936 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2946 = _2930;
    float _2948 = _2938;
    if (!_2832)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2950 = _2946;
    out.m_99.x = _2944;
    float _2952 = _2810 * _2926;
    float _2954 = fma(_2806, _2938, _2418);
    float _2956 = fma(_2808, _2938, _2420);
    float _2958 = _2950;
    float _2960 = _2950;
    if (!_2832)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2962 = _2948;
    float _2964 = fma(_2424, _2952, _2422);
    float _2966 = _2962;
    float _2968 = _2962;
    if (!_2832)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _2444;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2832)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2976 = _2446;
    out.m_101.x = _2954;
    out.m_101.y = _2956;
    out.m_101.z = _2964;
    out.m_101.w = _2940;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2832)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2982 = _2448;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2832)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2988 = _2450;
    bool _2990 = !_2832;
    float _2992 = _2988;
    float _2994 = _2988;
    if (!_2990)
    {
        bool _2996 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2998 = isnan(_2736);
        bool _3000 = _2996 || _2998;
        bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3004 = _3000 || _3002;
        if (!_3004)
        {
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = _2736 + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3012 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3010;
            float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3018 = 1.0 / _3012;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3036 = _3008 * _3018;
            float _3038 = precise::clamp(_3036, 0.0, 1.0);
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3044 = fma(_3038, _3016, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3046 = fma(_3038, _3042, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3048 = fma(_3038, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3050 = fma(_3038, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3052 = fma(_3038, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3054 = fma(_3038, _3034, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2980 = _3048;
            _2986 = _3052;
            _2974 = _3044;
            _2960 = _3050;
            _2968 = _3046;
            _2994 = _3054;
            _3056 = true;
        }
        else
        {
            bool _3058 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3060 = isnan(_2736);
            bool _3062 = _3058 || _3060;
            bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3066 = _3062 || _3064;
            if (!_3066)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3068 = _2972;
            _2974 = _3068;
            if (!_3066)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3070 = _2978;
            _2980 = _3070;
            if (!_3066)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3072 = _2966;
            _2968 = _3072;
            if (!_3066)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3074 = _2958;
            _2960 = _3074;
            if (!_3066)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3076 = _2984;
            _2986 = _3076;
            if (!_3066)
            {
                _2992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3078 = _2992;
            bool _3080 = !_3066;
            _2994 = _3078;
            if (!_3080)
            {
                bool _3082 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3084 = isnan(_2736);
                bool _3086 = _3082 || _3084;
                bool _3088 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3090 = _3086 || _3088;
                if (!_3090)
                {
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = _2736 + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3096;
                    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3104 = 1.0 / _3098;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3122 = _3094 * _3104;
                    float _3124 = precise::clamp(_3122, 0.0, 1.0);
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3130 = fma(_3124, _3102, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3132 = fma(_3124, _3128, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3134 = fma(_3124, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3136 = fma(_3124, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3138 = fma(_3124, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3140 = fma(_3124, _3120, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2980 = _3134;
                    _2986 = _3138;
                    _2974 = _3130;
                    _2960 = _3136;
                    _2968 = _3132;
                    _2994 = _3140;
                    _3056 = true;
                }
                else
                {
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3056 = false;
    float _3142 = _2980;
    float _3144 = _2986;
    float _3146 = _2974;
    float _3148 = _2960;
    float _3150 = _2968;
    float _3152 = _2994;
    float _3154 = fma(_1598, -0.5, 0.5);
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3142;
    float _3160 = _3158 + _3144;
    float _3162 = _2942 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3164 = -_3146;
    float _3166 = _3164 + _3148;
    float _3168 = fma(_3156, _3160, _3142);
    out.m_103.x = 0.0;
    float _3170 = -_3150;
    float _3172 = _3170 + _3152;
    float _3174 = fma(_3156, _3166, _3146);
    float _3176 = _3168 * 0.586610972881317138671875;
    out.m_63.x = _3162;
    bool _3178 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3180 = fma(_3156, _3172, _3150);
    float _3182 = fma(_3174, 0.298911988735198974609375, _3176);
    bool _3184 = _2504 > 0.0;
    bool _3186 = isnan(_2504);
    bool _3188 = _3184 || _3186;
    bool _3190 = isnan(0.0);
    bool _3192 = _3188 || _3190;
    float _3194 = fma(_3180, 0.114477999508380889892578125, _3182);
    float _3196 = -_3194;
    float _3198 = _3174 + _3196;
    float _3200 = -_3194;
    float _3202 = _3168 + _3200;
    float _3204 = -_3194;
    float _3206 = _3180 + _3204;
    float _3208 = fma(_3198, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3210 = fma(_3202, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3212 = fma(_3206, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    bool _3214 = !_3178;
    if (!_3214)
    {
        float _3216 = -_2227;
        float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3220 = -_2229;
        float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3224 = -_2231;
        float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3228 = _3218 * _3218;
        float _3230 = fma(_3222, _3222, _3228);
        float _3232 = fma(_3226, _3226, _3230);
        float _3234 = sqrt(_3232);
        float _3236 = rsqrt(_3232);
        float _3238 = -_3234;
        float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3242 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3244 = precise::clamp(_3242, 0.0, 1.0);
        float _3246 = _3222 * _3236;
        float _3248 = _3218 * _3236;
        float _3250 = abs(_3244);
        float _3252 = log2(_3250);
        float _3254 = _3226 * _3236;
        float _3256 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3258 = _1598 * _3248;
        float _3260 = -_3248;
        float _3262 = -_3256;
        float _3264 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3262);
        float _3266 = fma(_1596, _3246, _3258);
        float _3268 = -_3254;
        float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3264);
        float _3272 = fma(_1616, _3254, _3266);
        float _3274 = precise::clamp(_3272, 0.0, 1.0);
        float _3276 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3278 = _3270 + _3276;
        float _3280 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3282 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3284 = precise::clamp(_3282, 0.0, 1.0);
        float _3286 = exp2(_3280);
        float _3288 = _3286 * _3284;
        float _3290 = _3274 * _3288;
        float _3292 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3296 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3292;
        out.m_103.y = _3294;
        out.m_103.z = _3296;
    }
    out.m_105.x = _3208;
    out.m_105.y = _3210;
    out.m_105.z = _3212;
    if (_3192)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3298 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3298;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3056 = false;
    bool _1662 = false;
    bool _620 = false;
    bool _504 = false;
    bool _228 = false;
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
        float _3355 = as_type<float>(_140);
        out.gl_Position.z = _3355;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_65.w;
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
        out.m_63.x = 0.0;
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
        float _3424 = as_type<float>(_178);
        out.gl_Position.z = _3424;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_67.x;
    float _182 = in.m_67.y;
    float _184 = in.m_67.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _182 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_184, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_186;
    float _208 = _200;
    float _226;
    if (!_206)
    {
        float _210 = in.m_69.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        float _230 = float(_124);
        float _232 = 1.0 / _230;
        float _234 = _158 * _232;
        _226 = _234;
    }
    _228 = false;
    float _236 = _226;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _236 + _238;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = _236 + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _236 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _256 = _254 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = 1.0 / _252;
    float _268 = 1.0 / _256;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _264;
    bool _278 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _280 = isnan(_236);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = _248 * _266;
    bool _292 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_236);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _304;
    float _308 = 1.0 / _260;
    float _310 = _240 * _276;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _314 = _236 + _312;
    bool _316 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _318 = isnan(_236);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = _314 * _268;
    bool _334 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_236);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_288;
    float _348 = _346 + 1.0;
    float _350 = _244 * _308;
    float _352 = -_344;
    float _354 = _352 + 1.0;
    float _356 = fma(_330, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_272, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = fma(_306, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _326 * _354;
    bool _364 = _236 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _366 = isnan(_236);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _384 = _302 * _348;
    float _386 = -_302;
    float _388 = _386 + 1.0;
    float _390 = _288 * _378;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = _374 * _388;
    float _402 = fma(_382, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_394, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_398, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = _356 * _400;
    float _410 = _358 * _400;
    float _412 = -_374;
    float _414 = _412 + 1.0;
    float _416 = _360 * _400;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _408);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _410);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_420, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_402, _384, _426);
    float _440 = fma(_406, _384, _430);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _450 = fma(_424, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_434, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_404, _384, _428);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _460 = fma(_436, _390, _438);
    float _462 = fma(_444, _332, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _464 = fma(_448, _332, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _466 = fma(_458, _332, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _468 = fma(_450, _390, _454);
    float _470 = fma(_452, _390, _440);
    float _472 = fma(_462, _362, _460);
    float _474 = fma(_464, _362, _468);
    float _476 = fma(_466, _362, _470);
    float _478 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _472);
    float _480 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _474);
    float _482 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _476);
    bool _484 = !_274;
    float _502;
    if (!_484)
    {
        float _486 = in.m_69.x;
        float _488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _490 = _486 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _492 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _494 = _492 * _488;
        float _496 = floor(_494);
        float _498 = -_496;
        float _500 = _494 + _498;
        _502 = _500;
        _504 = true;
    }
    else
    {
        float _506 = float(_124);
        float _508 = 1.0 / _506;
        float _510 = _158 * _508;
        _502 = _510;
    }
    _504 = false;
    float _512 = _502;
    bool _514 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = isnan(_512);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _530 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _532 = isnan(_512);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _512 + _546;
    float _550 = -_524;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = 1.0 / _528;
    float _558 = _540 * _552;
    float _560 = -_540;
    float _562 = _560 + 1.0;
    float _564 = in.m_71.x;
    float _566 = in.m_71.y;
    float _568 = in.m_71.z;
    float _570 = _544 * _556;
    float _572 = fma(_570, _548, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _574 = _572 * _558;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _584 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[116].x, _576);
    float _586 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _590 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _592 = _584 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _594 = _482 * _568;
    float _596 = _480 * _566;
    float _598 = _478 * _564;
    out.m_73.x = _586;
    out.m_73.y = _588;
    out.m_73.z = _590;
    out.m_73.w = _592;
    bool _600 = !_554;
    float _618;
    if (!_600)
    {
        float _602 = in.m_69.x;
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_124);
        float _624 = 1.0 / _622;
        float _626 = _158 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_69.z;
    float _632 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _634 = log2(_632);
    float _636 = in.m_69.x;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _640 = _638 != 0;
    float _642 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _644 = in.m_69.y;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _656 = _654 != 0;
    float _658 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _662 = _594 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _664 = !_656;
    int _666 = _664 ? 0 : 1;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _670 = _634 * _158;
    float _672 = _630 * 2.0;
    float _674 = exp2(_670);
    float _676 = _636 * 2.0;
    float _678 = _636 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _680 = _636 + (-0.5);
    float _682 = _644 * 2.0;
    float _684 = floor(_672);
    float _686 = _644 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _688 = -_660;
    float _690 = fma(_678, 2.0, _688);
    float _692 = _678;
    float _694 = _636;
    if (_640)
    {
        _692 = _636;
    }
    float _696 = _692;
    float _698 = fma(_686, -2.0, _668);
    float _700 = floor(_676);
    float _702 = _696;
    if (!_640)
    {
        _702 = _630;
    }
    float _704 = _702;
    float _706 = -_674;
    float _708 = _706 + 1.0;
    float _710 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _698);
    float _712 = _704 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _714 = _684 > 0.0;
    float _716 = floor(_682);
    bool _718 = _684 >= 0.0;
    bool _720 = isnan(_684);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = _636 + _644;
    int _730 = _726 ? 0 : 1;
    float _732 = _728 + (-1.0);
    bool _734 = _700 > 0.0;
    int _736 = ~_730;
    int _738 = _736 + 1;
    int _740 = _738 + 1;
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _744 = _732;
    int _746 = _740;
    if (_640)
    {
        _744 = _644;
    }
    float _748 = _744;
    float _750 = _748;
    if (!_714)
    {
        int _752 = ~_730;
        int _754 = _752 + 1;
        _746 = _754;
    }
    int _756 = _746;
    bool _758 = _700 >= 0.0;
    bool _760 = isnan(_700);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    bool _768 = !_648;
    int _770 = _768 ? 0 : 1;
    if (!_640)
    {
        _750 = _636;
    }
    float _772 = _750;
    int _774 = abs(_770);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _778 = _772 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _782 = _716 > 0.0;
    float _784 = -_776;
    float _786 = fma(_712, 2.0, _784);
    bool _788 = _716 >= 0.0;
    bool _790 = isnan(_716);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = fma(_778, -2.0, _780);
    float _800 = in.m_75.x;
    float _802 = in.m_75.y;
    float _804 = in.m_75.z;
    float _806 = float(_774);
    float _808 = float(_756);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _812 = 1.0 + _810;
    int _814 = _766 ? 0 : 1;
    int _816 = _796 ? 0 : 1;
    float _818 = _806 * _808;
    float _820 = 1.0 / _812;
    float _822 = _818 * (-2.0);
    int _824 = ~_814;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _832 = ~_816;
    int _834 = _832 + 1;
    int _836 = _834 + 1;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _840 = _828;
    int _842 = _836;
    if (!_734)
    {
        int _844 = ~_814;
        int _846 = _844 + 1;
        _840 = _846;
    }
    int _848 = _840;
    float _850 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    if (!_782)
    {
        int _852 = ~_816;
        int _854 = _852 + 1;
        _842 = _854;
    }
    int _856 = _842;
    float _858 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[78].z, _838);
    float _860 = -_158;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[76].x, _690);
    float _864 = fma(_822, _800, _800);
    bool _866 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _868 = isnan(1.0);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _874 = _870 || _872;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _878 = !_652;
    int _880 = _878 ? 0 : 1;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _884 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _892 = _888 || _890;
    float _894 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[88].z, _876);
    int _896 = abs(_880);
    float _898 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[88].w, _882);
    float _900 = _892 ? _708 : 0.0;
    float _902 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _858);
    float _904 = float(_896);
    float _906 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _850);
    float _908 = float(_848);
    float _910 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _894);
    float _912 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _898);
    float _914 = -_158;
    float _916 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _786);
    float _918 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _798);
    if (_874)
    {
        float _920 = _900 * _820;
        _162 = _920;
    }
    float _922 = _162;
    float _924 = fma(_742, _822, _742);
    float _926 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].x, _864);
    int _928 = abs(_666);
    float _930 = _644 + _630;
    float _932 = _904 * _908;
    float _934 = fma(_924, _922, _926);
    float _936 = _930 + (-1.0);
    float _938 = float(_928);
    float _940 = _932 * (-2.0);
    float _942 = float(_856);
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = _636 + _630;
    float _948 = fma(_940, _802, _802);
    float _950 = _934 * 0.15915493667125701904296875;
    float _952 = _938 * _942;
    float _954 = _644 + (-0.5);
    float _956 = fma(_944, _940, _944);
    float _958 = _946 + (-1.0);
    float _960 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].y, _948);
    float _962 = _952 * (-2.0);
    float _964 = _950 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(_956, _922, _960);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _972 = fma(_962, _804, _804);
    float _974 = in.m_77.x;
    float _976 = in.m_77.y;
    float _978 = in.m_77.z;
    float _980 = _630 + (-0.5);
    float _982 = fma(_970, _962, _970);
    float _984 = _950 * 6.283185482025146484375;
    float _986 = cos(_984);
    float _988 = _968 * 0.15915493667125701904296875;
    float _990 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[196].z, _972);
    float _992 = fma(_982, _922, _990);
    float _994 = _988 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _992 * 0.15915493667125701904296875;
    float _1000 = _988 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _974);
    float _1006 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _976);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _978);
    float _1010 = _998 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = _642 * _1004;
    float _1016 = _658 * _1006;
    float _1018 = _662 * _1008;
    float _1020 = in.m_60.x;
    float _1022 = in.m_60.y;
    float _1024 = in.m_60.z;
    float _1026 = _986 * _996;
    float _1028 = _966 * _996;
    float _1030 = _998 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = _986 * _1002;
    float _1036 = _966 * _1002;
    float _1038 = _986 * _1012;
    float _1040 = _966 * _1012;
    float _1042 = _1002 * _1012;
    float _1044 = _996 * _1012;
    float _1046 = _1038 * _1016;
    float _1048 = _1040 * _1016;
    float _1050 = fma(_1032, _1034, _1028);
    float _1052 = fma(_1032, _1028, _1034);
    float _1054 = -_1016;
    float _1056 = _1032 * _1054;
    float _1058 = -_1026;
    float _1060 = fma(_1032, _1036, _1058);
    float _1062 = -_1036;
    float _1064 = fma(_1032, _1026, _1062);
    float _1066 = fma(_1050, _1014, _1046);
    float _1068 = fma(_1042, _1014, _1056);
    float _1070 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1072 = fma(_1060, _1014, _1048);
    float _1074 = fma(_1064, _1018, _1066);
    float _1076 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1078 = fma(_1044, _1018, _1068);
    float _1080 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1070);
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1086 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1076);
    float _1088 = fma(_1052, _1018, _1072);
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1082);
    float _1092 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1084);
    float _1094 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1080);
    float _1096 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1086);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1090);
    float _1100 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1092);
    float _1102 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1108 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1110 = _1022 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1112 = _1102 + _1106;
    float _1114 = _1104 + _1108;
    float _1116 = fma(_1020, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1110);
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1120 = _1112 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1124 = _1114 + _1122;
    float _1126 = fma(_1024, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1116);
    float _1128 = _1120 * _1120;
    float _1130 = _1124 * _1124;
    float _1132 = _1128 + _1130;
    float _1134 = sqrt(_1132);
    bool _1136 = _1134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = _1134 + _1138;
    float _1142 = _1100;
    float _1144 = _1024;
    float _1146 = _1140;
    float _1148 = _1074;
    float _1150 = _1126;
    float _1152 = _1114;
    int _1154 = as_type<int>(_974);
    int _1156 = as_type<int>(_978);
    float _1158 = _1128;
    float _1160 = _1130;
    float _1162 = _1060;
    if (_1136)
    {
        float _1164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1164;
    }
    float _1166 = _1142;
    if (_1136)
    {
        float _1168 = rsqrt(_1132);
        _1144 = _1168;
    }
    float _1170 = _1144;
    if (_1136)
    {
        float _1172 = _1140 * _1166;
        _1146 = _1172;
    }
    float _1174 = _1146;
    float _1176 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1174;
    if (!_1136)
    {
        _1148 = _1112;
    }
    float _1180 = _1148;
    float _1182 = _1180;
    if (_1136)
    {
        float _1184 = _1174 * 0.15915493667125701904296875;
        _1178 = _1184;
    }
    float _1186 = _1178;
    float _1188 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1190 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1192 = _1020;
    float _1194 = _1186;
    if (_1136)
    {
        float _1196 = _1186 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        _1192 = _1198;
    }
    float _1200 = _1192;
    float _1202 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1188);
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1206 = _1190 + _1204;
    float _1208 = _1206;
    if (_1136)
    {
        float _1210 = _1206 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1210;
    }
    float _1212 = _1150;
    float _1214 = _1212;
    if (_1136)
    {
        float _1216 = fma(_1200, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1214 = _1216;
    }
    float _1218 = _1214;
    float _1220 = _1218;
    if (_1136)
    {
        float _1222 = _1170 * _1218;
        _1220 = _1222;
    }
    float _1224 = _1220;
    if (_1136)
    {
        float _1226 = fma(_1120, _1224, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1182 = _1226;
    }
    float _1228 = _1182;
    if (_1136)
    {
        float _1230 = fma(_1124, _1224, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1152 = _1230;
    }
    float _1232 = _1152;
    float _1234 = fma(_1228, 6.2500002968590706586837768554688e-05, 0.5);
    float _1236 = fma(_1232, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5125 = float2(_1234, _1236);
    float3 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5125, float2(0.0), isnan(_5125)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5125, float2(0.0), isnan(_5125)), level(0.0)).xyz;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = in.m_79.y;
    float _1250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1252 = in.m_81.w;
    bool _1254 = _630 > 0.5;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1258 = _1256 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1260 = _644 > 0.5;
    float _1262 = in.m_79.x;
    int _1264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1266 = _1264 != 0;
    float _1268 = 1.0 / _1258;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = in.m_83.x;
    float _1284 = in.m_83.y;
    float _1286 = in.m_83.z;
    float _1288 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1290 = _1276;
    if (_1136)
    {
        float _1292 = _1186 * 6.283185482025146484375;
        float _1294 = cos(_1292);
        _1194 = _1294;
    }
    float _1296 = _1194;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1298;
    float _1302 = -_1248;
    float _1304 = _1302 + 1.0;
    float _1306 = _1300 * _1268;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1310 = _628 + _1308;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1314 = _1254 ? as_type<int>(_1304) : as_type<int>(_1248);
    out.m_85.w = _1252;
    bool _1316 = _976 != 0.0;
    bool _1318 = isnan(_976);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(0.0);
    bool _1324 = _1320 || _1322;
    float _1326 = _1276 ? as_type<float>(_1314) : _1248;
    bool _1328 = _974 == 0.0;
    bool _1330 = !_1324;
    bool _1332 = _1328 && _1330;
    bool _1334 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1336 = isnan(_628);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = fma(_1306, _1310, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1348 = _978 == 0.0;
    bool _1350 = _1348 && _1332;
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1354 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1356 = isnan(_628);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = fma(_1326, _1288, -0.5);
    float _1368 = _1248;
    if (_1266)
    {
        bool _1370 = _636 > 0.5;
        _1290 = _1370;
    }
    bool _1372 = _1290;
    if (_1280)
    {
        float _1374 = _1260 ? _1304 : _1248;
        _1368 = _1374;
    }
    float _1376 = _1368;
    float _1378 = -_918;
    float _1380 = fma(_912, _1366, _1378);
    float _1382 = _1282;
    float _1384 = _1286;
    float _1386 = _1284;
    float _1388 = _1262;
    int _1390 = as_type<int>(_1380);
    if (!_1266)
    {
        _694 = _1262;
    }
    float _1392 = _694;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1396 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1398 = -_1364;
    float _1400 = _1398 + 1.0;
    float _1402 = _1392;
    if (!_1350)
    {
        float _1404 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1382 = _1404;
    }
    float _1406 = _1382;
    if (!_1350)
    {
        float _1408 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1286);
        _1384 = _1408;
    }
    float _1410 = _1384;
    if (_1266)
    {
        float _1412 = -_1262;
        float _1414 = _1412 + 1.0;
        _1154 = as_type<int>(_1414);
    }
    int _1416 = _1154;
    if (!_1350)
    {
        float _1418 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1284);
        _1386 = _1418;
    }
    float _1420 = _1386;
    if (_1272)
    {
        float _1422 = -_1262;
        float _1424 = _1422 + 1.0;
        _1156 = as_type<int>(_1424);
    }
    int _1426 = _1156;
    float _1428 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1430 = -_1032;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1396);
    if (_1266)
    {
        float _1434 = _1372 ? as_type<float>(_1416) : _1262;
        _1402 = _1434;
    }
    float _1436 = _1402;
    float _1438 = _1344 * _1400;
    float _1440 = fma(_1428, _1376, -0.5);
    if (_1272)
    {
        float _1442 = _1260 ? as_type<float>(_1426) : _1262;
        _1388 = _1442;
    }
    float _1444 = _1388;
    float _1446 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1448 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1450 = -_710;
    float _1452 = fma(_906, _1440, _1450);
    float _1454 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1456 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = fma(_1448, _1444, -0.5);
    float _1460 = -_1032;
    float _1462 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1446);
    float _1464 = fma(_1454, _1436, -0.5);
    float _1466 = -_1032;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1470 = fma(_910, _1458, _916);
    float _1472 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1474 = fma(_902, _1464, _862);
    float _1476 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1462);
    float _1478 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1480 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1472);
    float _1482 = _1472;
    if (_1136)
    {
        float _1484 = _1296 + (-1.0);
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1490 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1492 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1494 = _1486;
    float _1496 = _1490;
    if (_1136)
    {
        float _1498 = _1486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1498;
    }
    float _1500 = _1494;
    float _1502 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1432);
    float _1504 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1468);
    float _1506 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1490);
    float _1508 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1478);
    float _1510 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1488);
    float _1512 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1492);
    float _1514 = _1500;
    if (_1136)
    {
        float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1518 = _1228 + _1516;
        _1496 = _1518;
    }
    float _1520 = _1496;
    if (_1136)
    {
        float _1522 = fma(_1206, _1296, _1500);
        _1208 = _1522;
    }
    float _1524 = _1208;
    float _1526 = _1476 * _1420;
    float _1528 = _1502 * _1420;
    float _1530 = _1504 * _1420;
    float _1532 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1508);
    float _1534 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1510);
    float _1536 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1512);
    float _1538 = _1536;
    if (_1136)
    {
        float _1540 = _1520 * _1520;
        _1158 = _1540;
    }
    float _1542 = _1158;
    if (_1136)
    {
        float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1546 = _1232 + _1544;
        _1514 = _1546;
    }
    float _1548 = _1514;
    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1552 = _1524 + _1550;
    float _1554 = _1050 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1556 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1506);
    if (_1136)
    {
        float _1558 = _1548 * _1548;
        _1160 = _1558;
    }
    float _1560 = _1160;
    float _1562 = fma(_1552, _1552, _1542);
    float _1564 = _1346 * _1438;
    float _1566 = -_1344;
    float _1568 = _1566 + 1.0;
    float _1570 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1554);
    float _1572 = _1562 + _1560;
    float _1574 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1480);
    float _1576 = fma(_1556, _1406, _1528);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1564);
    float _1580 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1570);
    float _1582 = fma(_1574, _1406, _1526);
    float _1584 = sqrt(_1572);
    float _1586 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1578);
    float _1588 = fma(_1580, _1406, _1530);
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1596 = fma(_1532, _1410, _1582);
    float _1598 = fma(_1534, _1410, _1576);
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = _1452 + 0.5;
    float _1608 = _1380 + 0.5;
    float _1610 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1612 = _1474 + 0.5;
    float _1614 = _1470 + 0.5;
    float _1616 = fma(_1536, _1410, _1588);
    bool _1618 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1620 = isnan(_1584);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1626 = _1622 || _1624;
    out.m_87.x = _1600;
    out.m_87.y = _1602;
    out.m_87.z = _1604;
    out.m_87.w = _1610;
    out.m_89.x = _1612;
    out.m_89.y = _1606;
    out.m_91.x = _1614;
    out.m_91.y = _1608;
    out.m_93.x = _1596;
    out.m_93.y = _1598;
    out.m_93.z = _1616;
    if (!_1626)
    {
        _1162 = 1.0;
    }
    float _1628 = _1162;
    out.m_95.x = _1242;
    out.m_95.y = _1244;
    out.m_95.z = _1246;
    bool _1630 = !_1626;
    float _1632 = _1628;
    if (!_1630)
    {
        bool _1634 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1636 = isnan(_1584);
        bool _1638 = _1634 || _1636;
        bool _1640 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1642 = _1638 || _1640;
        if (!_1642)
        {
            float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1646 = _1584 + _1644;
            float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1650 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1648;
            float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1654 = _1652 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1656 = 1.0 / _1650;
            float _1658 = _1646 * _1656;
            float _1660 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1632 = _1660;
            _1662 = true;
        }
        else
        {
            bool _1664 = _1584 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1666 = isnan(_1584);
            bool _1668 = _1664 || _1666;
            bool _1670 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1672 = _1668 || _1670;
            if (!_1672)
            {
                float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1676 = _1584 + _1674;
                float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1680 = _1678 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1684 = _1682 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1686 = 1.0 / _1680;
                float _1688 = _1676 * _1686;
                float _1690 = fma(_1688, _1684, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1632 = _1690;
                _1662 = true;
            }
            else
            {
                _1632 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1662 = false;
    float _1692 = _1632;
    float _1694 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1696 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1698 = floor(_1694);
    float _1700 = floor(_1696);
    float _1702 = -_1698;
    float _1704 = _1694 + _1702;
    float _1706 = -_1700;
    float _1708 = _1696 + _1706;
    float2 _5964 = float2(_1704, _1708);
    float _1710 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5964, float2(0.0), isnan(_5964)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5964, float2(0.0), isnan(_5964)), level(0.0)).x;
    float _1712 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1714 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1718 = _1524 + _1716;
    float _1720 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1712);
    float _1722 = _1190 + _1714;
    float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1726 = _1228 + _1724;
    float _1728 = fma(_1718, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1730 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    float _1732 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1734 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1736 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1738 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1732);
    float _1740 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1742 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1734);
    float _1744 = 1.0 / _1736;
    float _1746 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1738);
    float _1748 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1740);
    float _1750 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1742);
    float _1752 = fma(_1726, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1754 = _1746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1756 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1748);
    float _1758 = _1750 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1760 = -_1190;
    float _1762 = _1760 + _1728;
    float _1764 = _1754 + _1736;
    float _1766 = -_1102;
    float _1768 = _1766 + _1752;
    float _1770 = trunc(_1758);
    int _1772 = int(_1770);
    float _1774 = _1762 * _1762;
    float _1776 = _1764 * _1744;
    float _1778 = _1776 * 0.5;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1782 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1780);
    float _1784 = _1756 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1786 = trunc(_1784);
    int _1788 = int(_1786);
    int _1790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1792 = _1772 + _1790;
    int _1794 = _1792 + 1;
    float _1796 = 1.0 / _1782;
    int _1798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1800 = _1788 + _1798;
    int _1802 = _1800 + 1;
    int _1804 = _1794 | _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1808 = _1796 * _1806;
    bool _1810 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1812 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1814 = !_1810;
    int _1816 = _1814 ? 0 : 1;
    int _1818 = 2;
    int _1820 = _1804;
    int _1822 = _1816;
    float _1824 = _1752;
    float _1826 = _1728;
    float _1828 = _1768;
    float _1830 = _1758;
    if (!_1810)
    {
        _1818 = 1;
    }
    int _1832 = _1818;
    int _1834 = _1832;
    if (!_1812)
    {
        _1834 = _1816;
    }
    int _1836 = _1834;
    bool _1838 = _1794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1840 = _1836 << 6;
    bool _1842 = _1804 < 0;
    bool _1844 = _1842 || _1838;
    int _1846 = _1840 + 96;
    uint _1849 = uint(int(uint(_1846) >> uint(2)));
    uint _1851 = uint(int(uint(int(_1849)) >> uint(2)));
    int _1853 = int(_1849) & 3;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
    int _1857 = int(_1849) + 1;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    int _1861 = _1857 & 3;
    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[int(_1859)][_1861];
    bool _1865 = _1802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1867 = _1865 || _1844;
    int _1869 = _1840 + 104;
    uint _1871 = uint(int(uint(_1869) >> uint(2)));
    uint _1873 = uint(int(uint(int(_1871)) >> uint(2)));
    int _1875 = int(_1871) & 3;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[int(_1873)][_1875];
    int _1879 = int(_1871) + 1;
    uint _1881 = uint(int(uint(_1879) >> uint(2)));
    int _1883 = _1879 & 3;
    float _1885 = (*spvDescriptorSet0.vp_c15)._m0[int(_1881)][_1883];
    if (!_1867)
    {
        int _1887 = _1802 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1889 = _1887 + _1794;
        _1390 = _1889;
    }
    int _1891 = _1390;
    int _1893 = _1840 + 48;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    float _1911 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1913 = _1232 + _1911;
    float _1915 = fma(_1768, _1768, _1774);
    if (!_1867)
    {
        int _1917 = _1891 << 2;
        _1820 = _1917;
    }
    int _1919 = _1820;
    float _1921 = fma(_1913, _1692, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1923 = _1919;
    float _1925 = _1921;
    if (!_1867)
    {
        uint _1927 = uint(int(uint(_1891) >> uint(2)));
        _1822 = int(_1927);
    }
    int _1929 = _1822;
    if (!_1867)
    {
        int _1931 = 12 & _1919;
        _1923 = _1931;
    }
    int _1933 = _1923;
    int _1935 = _1840 + 64;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    float _1953 = -_1104;
    float _1955 = _1953 + _1921;
    if (!_1867)
    {
        int _1957 = _1929 << 4;
        int _1959 = _1957 + _1933;
        _1538 = as_type<float>(_1959);
    }
    float _1961 = _1538;
    float _1963 = fma(_1955, _1955, _1915);
    int _1965 = _1840 + 56;
    uint _1967 = uint(int(uint(_1965) >> uint(2)));
    uint _1969 = uint(int(uint(int(_1967)) >> uint(2)));
    int _1971 = int(_1967) & 3;
    float _1973 = (*spvDescriptorSet0.vp_c15)._m0[int(_1969)][_1971];
    int _1975 = int(_1967) + 1;
    uint _1977 = uint(int(uint(_1975) >> uint(2)));
    int _1979 = _1975 & 3;
    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
    float _1983 = sqrt(_1963);
    int _1985 = _1840 + 72;
    uint _1987 = uint(int(uint(_1985) >> uint(2)));
    uint _1989 = uint(int(uint(int(_1987)) >> uint(2)));
    int _1991 = int(_1987) & 3;
    float _1993 = (*spvDescriptorSet0.vp_c15)._m0[int(_1989)][_1991];
    int _1995 = int(_1987) + 1;
    uint _1997 = uint(int(uint(_1995) >> uint(2)));
    int _1999 = _1995 & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    float _2003 = _1722 * _1863;
    int _2005 = _1840 + 80;
    uint _2007 = uint(int(uint(_2005) >> uint(2)));
    uint _2009 = uint(int(uint(int(_2007)) >> uint(2)));
    int _2011 = int(_2007) & 3;
    float _2013 = (*spvDescriptorSet0.vp_c15)._m0[int(_2009)][_2011];
    int _2015 = int(_2007) + 1;
    uint _2017 = uint(int(uint(_2015) >> uint(2)));
    int _2019 = _2015 & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    bool _2023 = _1983 > 0.0;
    float _2025 = fma(_1102, _1855, _2003);
    float _2027 = fma(_1104, _1877, _2025);
    int _2029 = _1840 + 88;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _2025;
    if (!_1867)
    {
        float _2049 = floor(_1758);
        _2047 = _2049;
    }
    float _2051 = _2047;
    float _2053 = _2027 + _1885;
    float _2055 = _1961;
    if (!_1867)
    {
        int _2057 = as_type<int>(_1961) + 400;
        uint _2059 = uint(int(uint(_2057) >> uint(2)));
        uint _2061 = uint(int(uint(int(_2059)) >> uint(2)));
        int _2063 = int(_2059) & 3;
        float _2065 = (*spvDescriptorSet0.vp_c15)._m0[int(_2061)][_2063];
        _2055 = _2065;
    }
    float _2067 = _2055;
    float _2069 = 1.0 / _2053;
    bool _2071 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.5);
    bool _2079 = _2075 || _2077;
    float _2081 = _1722 * _1909;
    float _2083 = fma(_1102, _1901, _2081);
    float _2085 = _1722 * _1951;
    float _2087 = fma(_1102, _1943, _2085);
    bool _2089 = !_2023;
    float _2091 = _2081;
    float _2093 = _1901;
    float _2095 = _1993;
    if (!_2089)
    {
        float _2097 = _202 * _202;
        float _2099 = fma(_200, _200, _2097);
        float _2101 = rsqrt(_1963);
        float _2103 = fma(_204, _204, _2099);
        float _2105 = sqrt(_2103);
        float _2107 = _1768 * _2101;
        float _2109 = _1762 * _2101;
        float _2111 = _1955 * _2101;
        bool _2113 = _2105 > 0.0;
        bool _2115 = !_2113;
        _2091 = _2103;
        _1828 = _2107;
        if (!_2115)
        {
            float _2117 = rsqrt(_2103);
            float _2119 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2121 = _202 * _2117;
            float _2123 = _200 * _2117;
            float _2125 = _204 * _2117;
            float _2127 = _2109 * _2121;
            float _2129 = fma(_2107, _2123, _2127);
            float _2131 = _2119 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2133 = fma(_2111, _2125, _2129);
            float _2135 = _2133 * _2131;
            float _2137 = fma(_200, _2135, _1752);
            float _2139 = fma(_202, _2135, _1728);
            float _2141 = fma(_204, _2135, _1921);
            _1824 = _2137;
            _1826 = _2139;
            _1925 = _2141;
            _2093 = _2121;
        }
    }
    float _2143 = _1824;
    float _2145 = _1826;
    float _2147 = _1925;
    float _2149 = _2091;
    float _2151 = _2093;
    float _2153 = _1828;
    float _2155 = fma(_1104, _1993, _2087);
    float _2157 = fma(_1104, _1973, _2083);
    float _2159 = _2149;
    float _2161 = _2151;
    float _2163 = _2153;
    if (_2079)
    {
        _2159 = _2143;
    }
    float _2165 = _2159;
    float _2167 = _2165;
    if (_2079)
    {
        _2095 = _2145;
    }
    float _2169 = _2095;
    float _2171 = _2169;
    if (_2079)
    {
        _208 = _2147;
    }
    float _2173 = _208;
    float _2175 = _2173;
    if (!_2079)
    {
        float _2177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2179 = _1190 + _2177;
        float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2183 = _1102 + _2181;
        float _2185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2187 = -_1190;
        float _2189 = _2187 + _2145;
        float _2191 = _2179 * _2179;
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2195 = _1104 + _2193;
        float _2197 = -_1102;
        float _2199 = _2197 + _2143;
        float _2201 = fma(_2183, _2183, _2191);
        float _2203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2205 = fma(_2195, _2195, _2201);
        float _2207 = sqrt(_2205);
        float _2209 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2211 = precise::min(_2207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2213 = _2211 * _2203;
        float _2215 = _2209 * _2213;
        float _2217 = -_1104;
        float _2219 = _2217 + _2147;
        float _2221 = fma(_2189, _2215, _1190);
        float _2223 = fma(_2199, _2215, _1102);
        float _2225 = fma(_2219, _2215, _1104);
        _2171 = _2221;
        _2167 = _2223;
        _2175 = _2225;
    }
    float _2227 = _2171;
    float _2229 = _2167;
    float _2231 = _2175;
    float _2233 = _2157 + _1981;
    float _2235 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2237 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2239 = _2155 + _2001;
    float _2241 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2243 = _2227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2245 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2235);
    float _2247 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2237);
    float _2249 = _2233 * _2069;
    float _2251 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2241);
    float _2253 = fma(_2229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2243);
    float _2255 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2247);
    float _2257 = _2239 * _2069;
    bool _2259 = _2249 >= 0.0;
    float _2261 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2251);
    float _2263 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2253);
    float _2265 = _2255 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2267 = _2249 <= 1.0;
    bool _2269 = _2267 && _2259;
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2273 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2275 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2277 = _2257 >= 0.0;
    bool _2279 = _2277 && _2269;
    float _2281 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2285 = fma(_2231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2245);
    float _2287 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2275);
    bool _2289 = _2257 <= 1.0;
    bool _2291 = _2289 && _2279;
    float _2293 = -_2283;
    float _2295 = fma(_2293, _2281, 1.0);
    float _2297 = _2285 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2299 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2287);
    float _2301 = _1190;
    float _2303 = _2285;
    float _2305 = _2295;
    float _2307 = _2249;
    if (!_1867)
    {
        float _2309 = floor(_1784);
        _2301 = _2309;
    }
    float _2311 = _2301;
    float _2313 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1867)
    {
        float _2315 = -_2051;
        float _2317 = _1758 + _2315;
        _2303 = _2317;
    }
    float _2319 = _2303;
    float _2321 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2299);
    float _2323 = _1722 * _2021;
    float _2325 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2327 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2313);
    float _2329 = _2323;
    if (!_1867)
    {
        float _2331 = rint(_2067);
        float _2333 = precise::max(_2331, 0.0);
        uint _2335 = uint(_2333);
        uint _2337 = clamp(_2335, 0u, 65535u);
        _2161 = as_type<float>(_2337);
    }
    float _2339 = _2161;
    float _2341 = fma(_1102, _2013, _2323);
    if (_2291)
    {
        float _2343 = float(_1836);
        _2329 = _2343;
    }
    float _2345 = _2329;
    float _2347 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2325);
    float _2349 = fma(_1104, _2037, _2341);
    float _2351 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2327);
    float _2353 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2347);
    float _2355 = log2(_2295);
    float _2357 = _2349 + _2045;
    float _2359 = _2357 * _2069;
    float _2361 = 1.0 / _2321;
    float _2363 = _2357;
    if (!_1867)
    {
        float _2365 = -_2311;
        float _2367 = _1784 + _2365;
        _2305 = _2367;
    }
    float _2369 = _2305;
    float _2371 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2353);
    float _2373 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2351);
    float _2375 = _2345;
    if (_2291)
    {
        float _2377 = rint(_2345);
        float _2379 = precise::max(_2377, 0.0);
        uint _2381 = uint(_2379);
        uint _2383 = clamp(_2381, 0u, 65535u);
        _2375 = as_type<float>(_2383);
    }
    float _2385 = _2375;
    float _2387 = _2355 * 0.693147182464599609375;
    float _2389 = _2339;
    if (!_1867)
    {
        float3 _7098 = float3(_2319, _2369, float(as_type<int>(_2339)));
        float3 _7102 = select(_7098, float3(0.0), isnan(_7098));
        float _2391 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7102.xy, uint(rint(_7102.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7102.xy, uint(rint(_7102.z)), level(0.0)).x;
        _2389 = _2391;
    }
    float _2393 = _2389;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2397 = _2371 * _2361;
    float _2399 = _2373 * _2361;
    float _2401 = fma(_2397, 0.5, 0.5);
    float _2403 = fma(_2399, -0.5, 0.5);
    float _2405 = _2257;
    float _2407 = _2361;
    if (_2291)
    {
        float3 _7132 = float3(_2249, _2257, float(as_type<int>(_2385)));
        float3 _7134 = select(_7132, float3(0.0), isnan(_7132));
        float _2409 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7134.xy, uint(rint(_7134.z)), _2359, level(0.0));
        _2405 = _2409;
    }
    float _2411 = _2405;
    float3 _7144 = float3(_2401, _2403, _2395);
    float _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7144, float3(0.0), isnan(_7144)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7144, float3(0.0), isnan(_7144)), level(0.0)).x;
    float3 _7153 = float3(_2401, _2403, _2395);
    float4 _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7153, float3(0.0), isnan(_7153)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7153, float3(0.0), isnan(_7153)), level(0.0)).xyzw;
    float _2418 = _2416.x;
    float _2420 = _2416.y;
    float _2422 = _2416.z;
    float _2424 = _2416.w;
    if (_1867)
    {
        _2363 = 1.0;
    }
    float _2426 = _2363;
    bool _2428 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2430 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2432 = _2428 || _2430;
    bool _2434 = isnan(0.5);
    bool _2436 = _2432 || _2434;
    float _2438 = _2426;
    if (_2436)
    {
        _2407 = 1.0;
    }
    float _2440 = _2407;
    float _2442 = _2440;
    float _2444 = _2424;
    float _2446 = _2422;
    float _2448 = _2420;
    float _2450 = _2418;
    if (!_2436)
    {
        float _2452 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2454 = _2452 * 0.15915493667125701904296875;
        float _2456 = _2454 * 6.283185482025146484375;
        float _2458 = cos(_2456);
        float _2460 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2462 = _2460 * 0.15915493667125701904296875;
        float _2464 = _2454 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = 1.0 / _2458;
        float _2470 = _2462 * 6.283185482025146484375;
        float _2472 = cos(_2470);
        float _2474 = _2466 * _2468;
        float _2476 = _2462 * 6.283185482025146484375;
        float _2478 = sin(_2476);
        float _2480 = _2472 * _2474;
        float _2482 = 1.0 / _2480;
        float _2484 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2486 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2484;
        float _2488 = 1.0 / _2486;
        float _2490 = _2478 * _2482;
        float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2494 = fma(_1808, _2490, _2492);
        float _2496 = _2494 * _2488;
        float _2498 = precise::clamp(_2496, 0.0, 1.0);
        _2307 = _2468;
        _1830 = _2482;
        _2442 = _2498;
    }
    float _2500 = _2307;
    float _2502 = _1830;
    float _2504 = _2442;
    float _2506 = _2500;
    if (!_1867)
    {
        int _2508 = _1891 << 4;
        int _2510 = _2508 + 2048;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        uint _2514 = uint(int(uint(int(_2512)) >> uint(2)));
        int _2516 = int(_2512) & 3;
        float _2518 = (*spvDescriptorSet0.vp_c15)._m0[int(_2514)][_2516];
        int _2520 = int(_2512) + 1;
        uint _2522 = uint(int(uint(_2520) >> uint(2)));
        int _2524 = _2520 & 3;
        float _2526 = (*spvDescriptorSet0.vp_c15)._m0[int(_2522)][_2524];
        int _2528 = _2510 + 8;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        uint _2532 = uint(int(uint(int(_2530)) >> uint(2)));
        int _2534 = int(_2530) & 3;
        float _2536 = (*spvDescriptorSet0.vp_c15)._m0[int(_2532)][_2534];
        int _2538 = int(_2530) + 1;
        uint _2540 = uint(int(uint(_2538) >> uint(2)));
        int _2542 = _2538 & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        float _2546 = _1722 * _2526;
        float _2548 = fma(_1102, _2518, _2546);
        float _2550 = fma(_1104, _2536, _2548);
        float _2552 = _2550 + _2544;
        float _2554 = precise::clamp(_2552, 0.0, 1.0);
        float _2556 = -_2554;
        float _2558 = _2556 + _2393;
        float _2560 = fma(_2558, 500.0, 1.5);
        float _2562 = exp2(_2560);
        float _2564 = 0.0 + _2562;
        float _2566 = precise::clamp(_2564, 0.0, 1.0);
        _2506 = _2526;
        _2438 = _2566;
    }
    float _2568 = _2506;
    float _2570 = _2438;
    float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2574 = _2227 + _2572;
    float _2576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2578 = _2229 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2582 = _2231 + _2580;
    float _2584 = _2574 * _2574;
    float _2586 = fma(_2578, _2578, _2584);
    float _2588 = fma(_2582, _2582, _2586);
    float _2590 = rsqrt(_2588);
    float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2594 = _2578 * _2592;
    float _2596 = _2582 * _2592;
    float _2598 = _2594 * _2594;
    float _2600 = _2596 * _2596;
    float _2602 = _2598 + _2600;
    float _2604 = sqrt(_2602);
    bool _2606 = _2604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2610 = _2604 + _2608;
    float _2612 = _2582;
    float _2614 = _2584;
    float _2616 = _2610;
    float _2618 = _2568;
    float _2620 = _2592;
    if (_2606)
    {
        float _2622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2612 = _2622;
    }
    float _2624 = _2612;
    if (_2606)
    {
        float _2626 = rsqrt(_2602);
        _2614 = _2626;
    }
    float _2628 = _2614;
    float _2630 = _2628;
    if (_2606)
    {
        float _2632 = _2610 * _2624;
        _2616 = _2632;
    }
    float _2634 = _2616;
    if (_2606)
    {
        float _2636 = _2634 * 0.15915493667125701904296875;
        _2618 = _2636;
    }
    float _2638 = _2618;
    float _2640 = _2590;
    if (_2606)
    {
        float _2642 = _2638 * 6.283185482025146484375;
        float _2644 = sin(_2642);
        _2640 = _2644;
    }
    float _2646 = _2640;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2650 = precise::max(0.0, _2648);
    float _2652 = _2502;
    float _2654 = _2650;
    float _2656 = _2648;
    if (_2606)
    {
        float _2658 = _2638 * 6.283185482025146484375;
        float _2660 = cos(_2658);
        _2652 = _2660;
    }
    float _2662 = _2652;
    float _2664 = -_2592;
    float _2666 = -_2650;
    float _2668 = fma(_2574, _2664, _2666);
    float _2670 = _2668;
    if (_2606)
    {
        float _2672 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2654 = _2672;
    }
    float _2674 = _2654;
    float _2676 = _2646;
    float _2678 = _2674;
    if (_2606)
    {
        float _2680 = fma(_2646, _2674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2676 = _2680;
    }
    float _2682 = _2676;
    float _2684 = _2682;
    if (!_2606)
    {
        _2678 = _2596;
    }
    float _2686 = _2678;
    float _2688 = _2686;
    float _2690 = _2662;
    if (_2606)
    {
        float _2692 = _2662 + (-1.0);
        _2656 = _2692;
    }
    float _2694 = _2656;
    if (_2606)
    {
        float _2696 = _2628 * _2682;
        _2163 = _2696;
    }
    float _2698 = _2163;
    if (!_2606)
    {
        _2684 = _2594;
    }
    float _2700 = _2684;
    float _2702 = _2700;
    if (_2606)
    {
        float _2704 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2620 = _2704;
    }
    float _2706 = _2620;
    if (_2606)
    {
        float _2708 = _2594 * _2698;
        _2702 = _2708;
    }
    float _2710 = _2702;
    if (!_2606)
    {
        _2630 = _2598;
    }
    float _2712 = _2630;
    float _2714 = _2712;
    if (_2606)
    {
        float _2716 = _2596 * _2698;
        _2688 = _2716;
    }
    float _2718 = _2688;
    if (_2606)
    {
        float _2720 = fma(_2668, _2662, _2706);
        _2670 = _2720;
    }
    float _2722 = _2670;
    if (_2606)
    {
        float _2724 = _2710 * _2710;
        _2714 = _2724;
    }
    float _2726 = _2714;
    if (!_2606)
    {
        _2690 = _2600;
    }
    float _2728 = _2690;
    float _2730 = _2728;
    if (_2606)
    {
        float _2732 = _2718 * _2718;
        _2730 = _2732;
    }
    float _2734 = _2730;
    float _2736 = sqrt(_2588);
    float _2738 = fma(_2722, _2722, _2726);
    float _2740 = _2738 + _2734;
    float _2742 = rsqrt(_2740);
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2746 = fma(_2736, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2744);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = -_2748;
    float _2752 = _2750 + 1.0;
    float _2754 = _2742 * _2710;
    float _2756 = _2742 * _2722;
    float _2758 = _2742 * _2718;
    float _2760 = abs(_2752);
    float _2762 = log2(_2760);
    float _2764 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2766 = -_2764;
    float _2768 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2766);
    float _2770 = -_2758;
    float _2772 = fma(_2770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2768);
    float _2774 = fma(_2772, -0.5, 0.5);
    float _2776 = fma(_2772, 0.5, 0.5);
    float _2778 = _2756 + 1.0;
    float _2780 = _2762 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2782 = fma(_2776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2784 = sqrt(_2774);
    float _2786 = fma(_2776, _2782, -0.212114393711090087890625);
    float _2788 = fma(_2776, _2786, 1.570728778839111328125);
    float _2790 = exp2(_2780);
    float _2792 = _2784 * 0.636619746685028076171875;
    float _2794 = -_2788;
    float _2796 = fma(_2792, _2794, 1.0);
    float _2798 = -_2756;
    float _2800 = fma(_2790, _2778, _2798);
    float _2802 = fma(_2800, 0.5, 0.5);
    float2 _7723 = float2(_2796, _2802);
    float3 _2804 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7723, float2(0.0), isnan(_7723)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7723, float2(0.0), isnan(_7723)), level(0.0)).xyz;
    float _2806 = _2804.x;
    float _2808 = _2804.y;
    float _2810 = _2804.z;
    float _2812 = abs(_1808);
    float _2814 = log2(_2812);
    float _2816 = _2265 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2818 = -_1710;
    float _2820 = _2818 + 1.0;
    float _2822 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2816);
    bool _2824 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2826 = isnan(_2736);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2832 = _2828 || _2830;
    float _2834 = fma(_2273, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2822);
    float _2836 = _2321 * 0.5;
    float _2838 = _2762 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2840 = _1808 <= 8000.0;
    bool _2842 = isnan(_1808);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan(8000.0);
    bool _2848 = _2844 || _2846;
    float _2850 = float(_2848);
    float _2852 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2834);
    float _2854 = fma(_2373, -0.5, _2836);
    float _2856 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2858 = exp2(_2838);
    out.gl_Position.x = _2371;
    out.gl_Position.y = _2373;
    out.gl_Position.z = _2852;
    out.gl_Position.w = _2321;
    float _2860 = _2762;
    if (!_2291)
    {
        _2860 = 1.0;
    }
    float _2862 = _2860;
    float _2864 = _2852 + _2321;
    float _2866 = _2862;
    if (_2291)
    {
        bool _2868 = _2411 >= _2359;
        bool _2870 = isnan(_2411);
        bool _2872 = _2868 || _2870;
        bool _2874 = isnan(_2359);
        bool _2876 = _2872 || _2874;
        float _2878 = float(_2876);
        _2866 = _2878;
    }
    float _2880 = _2866;
    float _2882 = _2371 + _2321;
    float _2884 = _2864 * 0.5;
    float _2886 = exp2(_2856);
    float _2888 = _2880 * _2570;
    float _2890 = _2882 * 0.5;
    out.m_97.x = _2890;
    out.m_97.y = _2854;
    out.m_97.z = _2884;
    out.m_97.w = _2321;
    float _2892 = fma(_2886, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2894 = precise::clamp(_2892, 0.0, 1.0);
    float _2896 = fma(_2894, -2.0, 3.0);
    float _2898 = _2894 * _2894;
    float _2900 = _2898 * _2896;
    float _2902 = -_2900;
    float _2904 = _2902 + 1.0;
    float _2906 = fma(_2904, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2900);
    float _2908 = _2850 * _2906;
    float _2910 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2912 = -_2858;
    float _2914 = _2912 + 1.0;
    float _2916 = _2820 * _2910;
    float _2918 = precise::clamp(_2916, 0.0, 1.0);
    float _2920 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2922 = -_2918;
    float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2926 = _2920 * _2413;
    float _2928 = -_2920;
    float _2930 = _2928 + 1.0;
    float _2932 = -_2888;
    float _2934 = fma(_2932, _2924, 1.0);
    float _2936 = precise::clamp(_2934, 0.0, 1.0);
    float _2938 = _2424 * _2926;
    float _2940 = _2424 * _2930;
    float _2942 = _2504 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2944 = _2936 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2946 = _2930;
    float _2948 = _2938;
    if (!_2832)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2950 = _2946;
    out.m_99.x = _2944;
    float _2952 = _2810 * _2926;
    float _2954 = fma(_2806, _2938, _2418);
    float _2956 = fma(_2808, _2938, _2420);
    float _2958 = _2950;
    float _2960 = _2950;
    if (!_2832)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2962 = _2948;
    float _2964 = fma(_2424, _2952, _2422);
    float _2966 = _2962;
    float _2968 = _2962;
    if (!_2832)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2970 = _2444;
    float _2972 = _2970;
    float _2974 = _2970;
    if (!_2832)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2976 = _2446;
    out.m_101.x = _2954;
    out.m_101.y = _2956;
    out.m_101.z = _2964;
    out.m_101.w = _2940;
    float _2978 = _2976;
    float _2980 = _2976;
    if (!_2832)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2982 = _2448;
    float _2984 = _2982;
    float _2986 = _2982;
    if (!_2832)
    {
        _2450 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2988 = _2450;
    bool _2990 = !_2832;
    float _2992 = _2988;
    float _2994 = _2988;
    if (!_2990)
    {
        bool _2996 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2998 = isnan(_2736);
        bool _3000 = _2996 || _2998;
        bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3004 = _3000 || _3002;
        if (!_3004)
        {
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = _2736 + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3012 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3010;
            float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3018 = 1.0 / _3012;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3032 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3036 = _3008 * _3018;
            float _3038 = precise::clamp(_3036, 0.0, 1.0);
            float _3040 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3044 = fma(_3038, _3016, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3046 = fma(_3038, _3042, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3048 = fma(_3038, _3022, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3050 = fma(_3038, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3052 = fma(_3038, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3054 = fma(_3038, _3034, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2980 = _3048;
            _2986 = _3052;
            _2974 = _3044;
            _2960 = _3050;
            _2968 = _3046;
            _2994 = _3054;
            _3056 = true;
        }
        else
        {
            bool _3058 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3060 = isnan(_2736);
            bool _3062 = _3058 || _3060;
            bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3066 = _3062 || _3064;
            if (!_3066)
            {
                _2972 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3068 = _2972;
            _2974 = _3068;
            if (!_3066)
            {
                _2978 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3070 = _2978;
            _2980 = _3070;
            if (!_3066)
            {
                _2966 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3072 = _2966;
            _2968 = _3072;
            if (!_3066)
            {
                _2958 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3074 = _2958;
            _2960 = _3074;
            if (!_3066)
            {
                _2984 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3076 = _2984;
            _2986 = _3076;
            if (!_3066)
            {
                _2992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3078 = _2992;
            bool _3080 = !_3066;
            _2994 = _3078;
            if (!_3080)
            {
                bool _3082 = _2736 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3084 = isnan(_2736);
                bool _3086 = _3082 || _3084;
                bool _3088 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3090 = _3086 || _3088;
                if (!_3090)
                {
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = _2736 + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3096;
                    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3104 = 1.0 / _3098;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3118 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3120 = _3118 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3122 = _3094 * _3104;
                    float _3124 = precise::clamp(_3122, 0.0, 1.0);
                    float _3126 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3128 = _3126 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3130 = fma(_3124, _3102, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3132 = fma(_3124, _3128, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3134 = fma(_3124, _3108, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3136 = fma(_3124, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3138 = fma(_3124, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3140 = fma(_3124, _3120, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2980 = _3134;
                    _2986 = _3138;
                    _2974 = _3130;
                    _2960 = _3136;
                    _2968 = _3132;
                    _2994 = _3140;
                    _3056 = true;
                }
                else
                {
                    _2980 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2986 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2974 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2960 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2968 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3056 = false;
    float _3142 = _2980;
    float _3144 = _2986;
    float _3146 = _2974;
    float _3148 = _2960;
    float _3150 = _2968;
    float _3152 = _2994;
    float _3154 = fma(_1598, -0.5, 0.5);
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3142;
    float _3160 = _3158 + _3144;
    float _3162 = _2942 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3164 = -_3146;
    float _3166 = _3164 + _3148;
    float _3168 = fma(_3156, _3160, _3142);
    out.m_103.x = 0.0;
    float _3170 = -_3150;
    float _3172 = _3170 + _3152;
    float _3174 = fma(_3156, _3166, _3146);
    float _3176 = _3168 * 0.586610972881317138671875;
    out.m_63.x = _3162;
    bool _3178 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3180 = fma(_3156, _3172, _3150);
    float _3182 = fma(_3174, 0.298911988735198974609375, _3176);
    bool _3184 = _2504 > 0.0;
    bool _3186 = isnan(_2504);
    bool _3188 = _3184 || _3186;
    bool _3190 = isnan(0.0);
    bool _3192 = _3188 || _3190;
    float _3194 = fma(_3180, 0.114477999508380889892578125, _3182);
    float _3196 = -_3194;
    float _3198 = _3174 + _3196;
    float _3200 = -_3194;
    float _3202 = _3168 + _3200;
    float _3204 = -_3194;
    float _3206 = _3180 + _3204;
    float _3208 = fma(_3198, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3210 = fma(_3202, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    float _3212 = fma(_3206, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3194);
    bool _3214 = !_3178;
    if (!_3214)
    {
        float _3216 = -_2227;
        float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3220 = -_2229;
        float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3224 = -_2231;
        float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3228 = _3218 * _3218;
        float _3230 = fma(_3222, _3222, _3228);
        float _3232 = fma(_3226, _3226, _3230);
        float _3234 = sqrt(_3232);
        float _3236 = rsqrt(_3232);
        float _3238 = -_3234;
        float _3240 = _3238 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3242 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3244 = precise::clamp(_3242, 0.0, 1.0);
        float _3246 = _3222 * _3236;
        float _3248 = _3218 * _3236;
        float _3250 = abs(_3244);
        float _3252 = log2(_3250);
        float _3254 = _3226 * _3236;
        float _3256 = _3246 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3258 = _1598 * _3248;
        float _3260 = -_3248;
        float _3262 = -_3256;
        float _3264 = fma(_3260, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3262);
        float _3266 = fma(_1596, _3246, _3258);
        float _3268 = -_3254;
        float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3264);
        float _3272 = fma(_1616, _3254, _3266);
        float _3274 = precise::clamp(_3272, 0.0, 1.0);
        float _3276 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3278 = _3270 + _3276;
        float _3280 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3282 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3284 = precise::clamp(_3282, 0.0, 1.0);
        float _3286 = exp2(_3280);
        float _3288 = _3286 * _3284;
        float _3290 = _3274 * _3288;
        float _3292 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3294 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3296 = _3290 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3292;
        out.m_103.y = _3294;
        out.m_103.z = _3296;
    }
    out.m_105.x = _3208;
    out.m_105.y = _3210;
    out.m_105.z = _3212;
    if (_3192)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3298 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3298;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

