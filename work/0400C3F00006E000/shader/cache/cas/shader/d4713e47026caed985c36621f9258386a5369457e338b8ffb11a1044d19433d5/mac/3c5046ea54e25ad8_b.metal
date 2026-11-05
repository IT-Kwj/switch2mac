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
    float4 m_77 [[user(locn0)]];
    float4 m_91 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_115 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_97 [[user(locn8)]];
    float4 m_101 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_113 [[user(locn12)]];
    float4 m_107 [[user(locn13)]];
    float4 m_111 [[user(locn14)]];
    float4 m_109 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(1)]];
    float4 m_69 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_87 [[attribute(8)]];
    float4 m_81 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_89 [[attribute(12)]];
    float4 m_83 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2952 = false;
    bool _630 = false;
    bool _476 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_58.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_61.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3251 = as_type<float>(_150);
        out.gl_Position.z = _3251;
    }
    if (!_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_63.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_61.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_188);
        out.gl_Position.z = _3321;
    }
    if (_180)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _190 = in.m_65.x;
    float _192 = in.m_65.y;
    float _194 = in.m_65.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_67.x;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = in.m_71.x;
    float _212 = in.m_71.y;
    float _214 = in.m_71.z;
    float _216 = _192 * _200;
    float _218 = _192 * _206;
    float _220 = fma(_190, _198, _216);
    float _222 = _192 * _212;
    float _224 = fma(_190, _204, _218);
    float _226 = fma(_194, _202, _220);
    float _228 = fma(_190, _210, _222);
    float _230 = fma(_194, _208, _224);
    float _232 = fma(_194, _214, _228);
    bool _234 = !_196;
    float _252;
    if (!_234)
    {
        float _236 = in.m_73.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        float _256 = float(_134);
        float _258 = 1.0 / _256;
        float _260 = _168 * _258;
        _252 = _260;
    }
    _254 = false;
    float _262 = _252;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _262 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _284;
    float _288 = 1.0 / _282;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _292 = 1.0 / _286;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    float _298 = 1.0 / _278;
    float _300 = _266 * _288;
    bool _302 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_262);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _270 * _292;
    bool _328 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_262);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_312;
    float _342 = _340 + 1.0;
    float _344 = _338 * _342;
    bool _346 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _348 = isnan(_262);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = _274 * _298;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = -_338;
    float _370 = _368 + 1.0;
    float _372 = fma(_296, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -_324;
    float _380 = _378 + 1.0;
    float _382 = _324 * _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = _356 * _380;
    float _394 = -_356;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _374 * _392;
    float _404 = _376 * _392;
    float _406 = _372 * _392;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _412 = fma(_400, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_386, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_390, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_412, _382, _408);
    float _434 = fma(_416, _326, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_426, _326, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_430, _326, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _440 = fma(_418, _382, _410);
    float _442 = fma(_420, _382, _422);
    float _444 = fma(_436, _344, _432);
    float _446 = fma(_434, _344, _440);
    float _448 = fma(_438, _344, _442);
    float _450 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _444);
    float _452 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _446);
    float _454 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _448);
    bool _456 = !_290;
    float _474;
    if (!_456)
    {
        float _458 = in.m_73.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_134);
        float _480 = 1.0 / _478;
        float _482 = _168 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _488 = _484 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = isnan(_484);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _512 = isnan(_484);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _522;
    bool _526 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = isnan(_484);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = 1.0 / _492;
    float _540 = -_504;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _484 + _544;
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _550 = 1.0 / _508;
    float _552 = _524 * _538;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = -_536;
    float _560 = _558 + 1.0;
    float _562 = fma(_552, _488, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _564 = _520 * _542;
    float _566 = -_520;
    float _568 = _566 + 1.0;
    float _570 = _504 * _560;
    float _572 = _556 * _550;
    float _574 = _562 * _564;
    float _576 = fma(_572, _546, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = fma(_576, _570, _578);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = in.m_75.x;
    float _596 = in.m_75.y;
    float _598 = in.m_75.z;
    float _600 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _592;
    out.m_77.y = _602;
    out.m_77.z = _586;
    out.m_77.w = _600;
    float _604 = _454 * _598;
    float _606 = _452 * _596;
    float _608 = _450 * _594;
    bool _610 = !_548;
    float _628;
    if (!_610)
    {
        float _612 = in.m_73.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_134);
        float _634 = 1.0 / _632;
        float _636 = _168 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = in.m_58.x;
    float _642 = in.m_58.y;
    float _644 = in.m_58.z;
    float _646 = in.m_67.w;
    float _648 = in.m_71.w;
    float _650 = _200 * _642;
    float _652 = _212 * _642;
    float _654 = fma(_198, _640, _650);
    float _656 = fma(_210, _640, _652);
    float _658 = fma(_202, _644, _654);
    float _660 = fma(_214, _644, _656);
    float _662 = _658 + _646;
    float _664 = _660 + _648;
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _668 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _670 = floor(_666);
    float _672 = floor(_668);
    float _674 = -_670;
    float _676 = _666 + _674;
    float _678 = -_672;
    float _680 = _668 + _678;
    float2 _4115 = float2(_676, _680);
    float _682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4115, float2(0.0), isnan(_4115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4115, float2(0.0), isnan(_4115)), level(0.0)).x;
    float _684 = in.m_73.z;
    float _686 = _206 * _642;
    float _688 = in.m_73.x;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _692 = _690 != 0;
    float _694 = fma(_204, _640, _686);
    float _696 = in.m_73.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _708 = _706 != 0;
    float _710 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _714 = !_700;
    int _716 = _714 ? 0 : 1;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _720 = abs(_716);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _724 = _684 * 2.0;
    float _726 = _688 * 2.0;
    float _728 = _688 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _730 = floor(_724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _734 = _696 * 2.0;
    float _736 = _696 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _738 = -_718;
    float _740 = fma(_728, 2.0, _738);
    float _742 = _688 + _696;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _746 = 1.0 + _744;
    float _748 = fma(_736, -2.0, _712);
    float _750 = floor(_726);
    float _752 = _736;
    float _754 = _726;
    int _756 = 2;
    if (!_692)
    {
        _752 = _684;
    }
    float _758 = _752;
    float _760 = _742 + (-1.0);
    float _762 = _758;
    if (_692)
    {
        _762 = _696;
    }
    float _764 = _762;
    float _766 = -_168;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _740);
    float _770 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _748);
    float _772 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _774 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _776 = floor(_734);
    bool _778 = _730 > 0.0;
    float _780 = _764 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _782 = _730 >= 0.0;
    bool _784 = isnan(_730);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _730;
    int _794 = as_type<int>(_770);
    if (!_692)
    {
        _754 = _696;
    }
    float _796 = _754;
    float _798 = _796;
    if (!_692)
    {
        _792 = _684;
    }
    float _800 = _792;
    float _802 = 1.0 / _746;
    float _804 = _800;
    if (_692)
    {
        _798 = _688;
    }
    float _806 = _798;
    if (_692)
    {
        _804 = _696;
    }
    float _808 = _804;
    bool _810 = _750 > 0.0;
    bool _812 = _750 >= 0.0;
    bool _814 = isnan(_750);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    float _822 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _732);
    int _824 = _790 ? 0 : 1;
    float _826 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    bool _828 = _776 > 0.0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _832 = _776 >= 0.0;
    bool _834 = isnan(_776);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _844 = log2(_842);
    float _846 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    float _848 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _850 = ~_824;
    int _852 = _850 + 1;
    int _854 = _852 + 1;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _858 = _854;
    if (!_778)
    {
        int _860 = ~_824;
        int _862 = _860 + 1;
        _858 = _862;
    }
    int _864 = _858;
    float _866 = -_722;
    float _868 = fma(_848, 2.0, _866);
    float _870 = fma(_780, -2.0, _856);
    float _872 = float(_864);
    float _874 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    float _876 = float(_720);
    float _878 = _688 + (-0.5);
    int _880 = _840 ? 0 : 1;
    float _882 = -_168;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[81].x, _868);
    float _886 = _844 * _168;
    float _888 = _876 * _872;
    int _890 = ~_880;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = in.m_79.x;
    float _898 = in.m_79.y;
    float _900 = in.m_79.z;
    int _902 = _894;
    if (!_828)
    {
        int _904 = ~_880;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _912 = exp2(_886);
    int _914 = _820 ? 0 : 1;
    float _916 = _888 * (-2.0);
    float _918 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    bool _920 = !_704;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _870);
    int _926 = ~_914;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _930;
    if (!_810)
    {
        int _934 = ~_914;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    bool _942 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _944 = isnan(1.0);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _950 = _946 || _948;
    int _952 = abs(_922);
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _956 = -_912;
    float _958 = _956 + 1.0;
    bool _960 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _968 = _964 || _966;
    float _970 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[78].w, _954);
    bool _972 = !_708;
    int _974 = _972 ? 0 : 1;
    float _976 = fma(_916, _896, _896);
    float _978 = float(_952);
    float _980 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _970);
    float _982 = float(_938);
    float _984 = fma(_772, _916, _772);
    float _986 = _968 ? _958 : 0.0;
    float _988 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    int _990 = abs(_974);
    float _992 = _978 * _982;
    float _994 = _696 + _684;
    if (_950)
    {
        float _996 = _986 * _802;
        _170 = _996;
    }
    float _998 = _170;
    float _1000 = _992 * (-2.0);
    float _1002 = fma(_984, _998, _988);
    float _1004 = _994 + (-1.0);
    float _1006 = float(_990);
    float _1008 = fma(_1000, _898, _898);
    float _1010 = float(_908);
    float _1012 = _696 + (-0.5);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1016 = _688 + _684;
    float _1018 = _1002 * 0.15915493667125701904296875;
    float _1020 = _1006 * _1010;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1008);
    float _1024 = fma(_1014, _1000, _1014);
    float _1026 = _1016 + (-1.0);
    float _1028 = _1020 * (-2.0);
    float _1030 = _1018 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(_1024, _998, _1022);
    float _1036 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1038 = fma(_1028, _900, _900);
    float _1040 = _684 + (-0.5);
    float _1042 = in.m_81.x;
    float _1044 = in.m_81.y;
    float _1046 = in.m_81.z;
    float _1048 = fma(_1036, _1028, _1036);
    float _1050 = _1034 * 0.15915493667125701904296875;
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1038);
    float _1054 = _1018 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1060 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1062 = fma(_1048, _998, _1052);
    float _1064 = in.m_69.w;
    float _1066 = _1062 * 0.15915493667125701904296875;
    float _1068 = _1050 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_208, _644, _694);
    float _1074 = _1050 * 6.283185482025146484375;
    float _1076 = cos(_1074);
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1042);
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1044);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1046);
    float _1084 = _1066 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = _1078 * _1058;
    float _1090 = _1080 * _1060;
    float _1092 = _1032 * _1070;
    float _1094 = _1056 * _1070;
    float _1096 = _1082 * _710;
    float _1098 = _1072 + _1064;
    float _1100 = _1066 * 6.283185482025146484375;
    float _1102 = sin(_1100);
    float _1104 = _1056 * _1076;
    float _1106 = _1032 * _1076;
    float _1108 = _1098 + _774;
    float _1110 = _1056 * _1086;
    float _1112 = _1076 * _1086;
    float _1114 = _1032 * _1086;
    float _1116 = _1070 * _1086;
    float _1118 = _1110 * _1090;
    float _1120 = fma(_1102, _1104, _1092);
    float _1122 = -_1090;
    float _1124 = _1102 * _1122;
    float _1126 = -_1106;
    float _1128 = fma(_1102, _1094, _1126);
    float _1130 = -_1094;
    float _1132 = fma(_1102, _1106, _1130);
    float _1134 = fma(_1120, _1088, _1118);
    float _1136 = _1114 * _1090;
    float _1138 = fma(_1112, _1088, _1124);
    float _1140 = fma(_1102, _1092, _1104);
    float _1142 = fma(_1128, _1096, _1134);
    float _1144 = fma(_1132, _1088, _1136);
    float _1146 = fma(_1116, _1096, _1138);
    float _1148 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1150 = fma(_1140, _1096, _1144);
    float _1152 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1154 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1156 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1148);
    float _1158 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1160 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1152);
    float _1162 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1164 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1156);
    float _1166 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1160);
    float _1170 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1162);
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1174 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1166);
    float _1176 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1178 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1170);
    float _1180 = _664 + _1172;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1184 = _662 + _1176;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1190 = _1180 + _1188;
    float _1192 = 1.0 / _1182;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1184 + _1194;
    float _1198 = _1186 + _1182;
    float _1200 = _1190 * _1190;
    float _1202 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1154);
    float _1204 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1206 = fma(_1196, _1196, _1200);
    float _1208 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1202);
    float _1210 = sqrt(_1206);
    float _1212 = _1198 * _1192;
    float _1214 = _1212 * 0.5;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1218 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1216);
    float _1220 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1222 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1220);
    float _1224 = 1.0 / _1218;
    bool _1226 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1210 + _1228;
    float _1232 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1222);
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1236 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1238 = trunc(_1234);
    int _1240 = int(_1238);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1244 = _1224 * _1242;
    float _1246 = _1192;
    float _1248 = _1224;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1252 = _1070;
    float _1254 = _1184;
    float _1256 = _1180;
    if (_1226)
    {
        float _1258 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1258;
    }
    float _1260 = _1246;
    bool _1262 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1264 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1266 = 0.0;
    if (_1226)
    {
        float _1268 = rsqrt(_1206);
        _1266 = _1268;
    }
    float _1270 = _1266;
    if (!_1262)
    {
        _756 = 1;
    }
    int _1272 = _756;
    int _1274 = _1272;
    if (_1226)
    {
        float _1276 = _1230 * _1260;
        _1248 = _1276;
    }
    float _1278 = _1248;
    float _1280 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1204);
    float _1282 = _1098 + _1236;
    float _1284 = _1282;
    if (_1226)
    {
        float _1286 = _1278 * 0.15915493667125701904296875;
        _1250 = _1286;
    }
    float _1288 = _1250;
    bool _1290 = !_1262;
    int _1292 = _1290 ? 0 : 1;
    float _1294 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1280);
    if (_1226)
    {
        float _1296 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1296;
    }
    float _1298 = _1252;
    float _1300 = 0.0;
    if (_1226)
    {
        float _1302 = _1288 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    if (!_1264)
    {
        _1274 = _1292;
    }
    int _1308 = _1274;
    float _1310 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1312 = _1308 << 6;
    float _1314 = _1056;
    if (_1226)
    {
        float _1316 = _1288 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        _1314 = _1318;
    }
    float _1320 = _1314;
    int _1322 = _1312 + 96;
    uint _1325 = uint(int(uint(_1322) >> uint(2)));
    uint _1327 = uint(int(uint(int(_1325)) >> uint(2)));
    int _1329 = int(_1325) & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    int _1333 = int(_1325) + 1;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    int _1337 = _1333 & 3;
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[int(_1335)][_1337];
    float _1341 = trunc(_1310);
    int _1343 = int(_1341);
    int _1345 = _1312 + 104;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
    int _1351 = int(_1347) & 3;
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
    int _1355 = int(_1347) + 1;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    int _1359 = _1355 & 3;
    float _1361 = (*spvDescriptorSet0.vp_c15)._m0[int(_1357)][_1359];
    float _1363 = 0.0;
    if (_1226)
    {
        float _1365 = _1306 + (-1.0);
        _1363 = _1365;
    }
    float _1367 = _1363;
    float _1369 = _1367;
    if (_1226)
    {
        float _1371 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1371;
    }
    float _1373 = _1369;
    float _1375 = 0.0;
    if (_1226)
    {
        float _1377 = fma(_1320, _1298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1375 = _1377;
    }
    float _1379 = _1375;
    int _1381 = _1312 + 48;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    float _1399 = _1379;
    if (_1226)
    {
        float _1401 = fma(_1282, _1306, _1373);
        _1284 = _1401;
    }
    float _1403 = _1284;
    int _1405 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1407 = _1240 + _1405;
    int _1409 = _1407 + 1;
    uint _1411 = uint(_1409);
    if (_1226)
    {
        float _1413 = _1270 * _1379;
        _1399 = _1413;
    }
    float _1415 = _1399;
    float _1417 = -_1098;
    float _1419 = _1417 + _1403;
    bool _1421 = _1409 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1226)
    {
        float _1423 = fma(_1196, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1254 = _1423;
    }
    float _1425 = _1254;
    int _1427 = _1312 + 64;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    int _1445 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1447 = _1343 + _1445;
    int _1449 = _1447 + 1;
    if (_1226)
    {
        float _1451 = fma(_1190, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1256 = _1451;
    }
    float _1453 = _1256;
    float _1455 = -_662;
    float _1457 = _1455 + _1425;
    float _1459 = _1419 * _1419;
    int _1461 = _1409 | _1449;
    float _1463 = -_664;
    float _1465 = _1463 + _1453;
    int _1467 = _1312 + 56;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = int(_1469) + 1;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    int _1481 = _1477 & 3;
    float _1483 = (*spvDescriptorSet0.vp_c15)._m0[int(_1479)][_1481];
    float _1485 = fma(_1457, _1457, _1459);
    bool _1487 = _1461 < 0;
    bool _1489 = _1487 || _1421;
    float _1491 = fma(_1465, _1465, _1485);
    bool _1493 = _1449 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1495 = _1493 || _1489;
    int _1497 = _1312 + 72;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    float _1515 = sqrt(_1491);
    int _1517 = _1312 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    float _1535 = _1108 * _1339;
    float _1537 = _1491;
    if (!_1495)
    {
        int _1539 = _1449 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1541 = _1539 + _1409;
        _1411 = uint(_1541);
    }
    uint _1543 = _1411;
    float _1545 = fma(_662, _1331, _1535);
    float _1547 = fma(_664, _1353, _1545);
    bool _1549 = _1515 > 0.0;
    float _1551 = _1545;
    float _1553 = _1515;
    if (!_1495)
    {
        float _1555 = floor(_1234);
        _1551 = _1555;
    }
    float _1557 = _1551;
    float _1559 = _1547 + _1361;
    float _1561 = _1108 * _1397;
    int _1563 = as_type<int>(_1397);
    if (!_1495)
    {
        uint _1565 = uint(int(uint(int(_1543)) >> uint(2)));
        _1563 = int(_1565);
    }
    int _1567 = _1563;
    float _1569 = fma(_662, _1389, _1561);
    float _1571 = 1.0 / _1559;
    int _1573 = _1567;
    if (!_1549)
    {
        _1553 = _1453;
    }
    float _1575 = _1553;
    float _1577 = _1108 * _1443;
    int _1579 = as_type<int>(_1443);
    int _1581 = as_type<int>(_1577);
    float _1583 = _1435;
    float _1585 = _1575;
    float _1587 = _1575;
    if (!_1495)
    {
        int _1589 = int(_1543) << 2;
        _1579 = _1589;
    }
    int _1591 = _1579;
    float _1593 = fma(_662, _1435, _1577);
    float _1595 = as_type<float>(_1591);
    if (!_1495)
    {
        int _1597 = 12 & _1591;
        _1581 = _1597;
    }
    int _1599 = _1581;
    if (!_1549)
    {
        _1583 = _1425;
    }
    float _1601 = _1583;
    float _1603 = fma(_664, _1475, _1569);
    float _1605 = _1601;
    float _1607 = _1601;
    float _1609 = _1533;
    if (!_1495)
    {
        int _1611 = _1567 << 4;
        int _1613 = _1611 + _1599;
        _1573 = _1613;
    }
    int _1615 = _1573;
    if (!_1549)
    {
        _1595 = _1403;
    }
    float _1617 = _1595;
    float _1619 = _1603 + _1483;
    float _1621 = fma(_664, _1505, _1593);
    float _1623 = _1621 + _1513;
    bool _1625 = !_1549;
    float _1627 = _1617;
    float _1629 = _1617;
    float _1631 = _1571;
    if (!_1625)
    {
        float _1633 = _230 * _230;
        float _1635 = rsqrt(_1491);
        float _1637 = fma(_226, _226, _1633);
        float _1639 = fma(_232, _232, _1637);
        float _1641 = sqrt(_1639);
        float _1643 = _1457 * _1635;
        float _1645 = _1419 * _1635;
        float _1647 = _1465 * _1635;
        bool _1649 = _1641 > 0.0;
        _1537 = _1635;
        if (!_1649)
        {
            _1605 = _1425;
        }
        float _1651 = _1605;
        _1607 = _1651;
        if (!_1649)
        {
            _1627 = _1403;
        }
        float _1653 = _1627;
        _1629 = _1653;
        if (!_1649)
        {
            _1585 = _1453;
        }
        float _1655 = _1585;
        bool _1657 = !_1649;
        _1587 = _1655;
        if (!_1657)
        {
            float _1659 = rsqrt(_1639);
            float _1661 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1663 = _230 * _1659;
            float _1665 = _226 * _1659;
            float _1667 = _1645 * _1663;
            float _1669 = _232 * _1659;
            float _1671 = fma(_1643, _1665, _1667);
            float _1673 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1675 = fma(_1647, _1669, _1671);
            float _1677 = _1675 * _1673;
            float _1679 = fma(_230, _1677, _1403);
            float _1681 = fma(_226, _1677, _1425);
            float _1683 = fma(_232, _1677, _1453);
            _1629 = _1679;
            _1607 = _1681;
            _1587 = _1683;
        }
    }
    float _1685 = _1629;
    float _1687 = _1607;
    float _1689 = _1587;
    float _1691 = _1537;
    int _1693 = _1312 + 88;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
    int _1699 = int(_1695) & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    int _1703 = int(_1695) + 1;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    int _1707 = _1703 & 3;
    float _1709 = (*spvDescriptorSet0.vp_c15)._m0[int(_1705)][_1707];
    float _1711 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1713 = _1619 * _1571;
    float _1715 = _1623 * _1571;
    float _1717 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1719 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1711);
    float _1723 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1725 = _1457;
    if (!_1495)
    {
        int _1727 = _1615 + 400;
        uint _1729 = uint(int(uint(_1727) >> uint(2)));
        uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
        int _1733 = int(_1729) & 3;
        float _1735 = (*spvDescriptorSet0.vp_c15)._m0[int(_1731)][_1733];
        _1725 = _1735;
    }
    float _1737 = _1725;
    float _1739 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1717);
    float _1741 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1719);
    float _1743 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1721);
    bool _1745 = _1713 >= 0.0;
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1739);
    float _1749 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1741);
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1757 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1759 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1761 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1765 = _1713 <= 1.0;
    bool _1767 = _1765 && _1745;
    float _1769 = -_1759;
    float _1771 = fma(_1769, _1723, 1.0);
    float _1773 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1775 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1763);
    float _1777 = _226;
    float _1779 = _1755;
    float _1781 = _1751;
    if (!_1495)
    {
        float _1783 = floor(_1310);
        _1777 = _1783;
    }
    float _1785 = _1777;
    bool _1787 = _1715 >= 0.0;
    bool _1789 = _1787 && _1767;
    float _1791 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1793 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    float _1795 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1797 = _1715 <= 1.0;
    bool _1799 = _1797 && _1789;
    float _1801 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1803 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1793);
    float _1805 = log2(_1771);
    float _1807 = _1108 * _1533;
    float _1809 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1795);
    float _1811 = fma(_662, _1525, _1807);
    float _1813 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1809);
    float _1815 = 1.0 / _1803;
    float _1817 = _1809;
    if (!_1495)
    {
        float _1819 = -_1785;
        float _1821 = _1310 + _1819;
        _1817 = _1821;
    }
    float _1823 = _1817;
    if (_1799)
    {
        float _1825 = float(_1308);
        _1609 = _1825;
    }
    float _1827 = _1609;
    float _1829 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1813);
    float _1831 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1801);
    float _1833 = fma(_664, _1701, _1811);
    float _1835 = _1805 * 0.693147182464599609375;
    float _1837 = _1807;
    float _1839 = _1827;
    if (_1799)
    {
        float _1841 = rint(_1827);
        float _1843 = precise::max(_1841, 0.0);
        uint _1845 = uint(_1843);
        uint _1847 = clamp(_1845, 0u, 65535u);
        _1837 = as_type<float>(_1847);
    }
    float _1849 = _1837;
    float _1851 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1831);
    float _1853 = _1833 + _1709;
    float _1855 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1857 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1851);
    float _1859 = _1853 * _1571;
    float _1861 = _1829 * _1815;
    float _1863 = _1835;
    float _1865 = _1737;
    if (!_1495)
    {
        float _1867 = rint(_1737);
        float _1869 = precise::max(_1867, 0.0);
        uint _1871 = uint(_1869);
        uint _1873 = clamp(_1871, 0u, 65535u);
        _1863 = as_type<float>(_1873);
    }
    float _1875 = _1863;
    float _1877 = _1857 * _1815;
    if (!_1495)
    {
        float _1879 = -_1557;
        float _1881 = _1234 + _1879;
        _1839 = _1881;
    }
    float _1883 = _1839;
    float _1885 = fma(_1861, -0.5, 0.5);
    float _1887 = fma(_1877, 0.5, 0.5);
    float _1889 = _1557;
    if (_1799)
    {
        float3 _6085 = float3(_1713, _1715, float(as_type<int>(_1849)));
        float3 _6089 = select(_6085, float3(0.0), isnan(_6085));
        float _1891 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6089.xy, uint(rint(_6089.z)), _1859, level(0.0));
        _1889 = _1891;
    }
    float _1893 = _1889;
    float3 _6099 = float3(_1887, _1885, _1855);
    float _1895 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6099, float3(0.0), isnan(_6099)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6099, float3(0.0), isnan(_6099)), level(0.0)).x;
    float3 _6108 = float3(_1887, _1885, _1855);
    float4 _1898 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6108, float3(0.0), isnan(_6108)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6108, float3(0.0), isnan(_6108)), level(0.0)).xyzw;
    float _1900 = _1898.x;
    float _1902 = _1898.y;
    float _1904 = _1898.z;
    float _1906 = _1898.w;
    float _1908 = _1691;
    if (!_1495)
    {
        float3 _6131 = float3(_1883, _1823, float(as_type<int>(_1875)));
        float3 _6133 = select(_6131, float3(0.0), isnan(_6131));
        float _1910 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6133.xy, uint(rint(_6133.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6133.xy, uint(rint(_6133.z)), level(0.0)).x;
        _1908 = _1910;
    }
    float _1912 = _1908;
    if (_1495)
    {
        _1631 = 1.0;
    }
    float _1914 = _1631;
    float _1916 = _1914;
    float _1918 = _1893;
    float _1920 = _1895;
    if (!_1495)
    {
        int _1922 = int(_1543) << 4;
        int _1924 = _1922 + 2048;
        uint _1926 = uint(int(uint(_1924) >> uint(2)));
        uint _1928 = uint(int(uint(int(_1926)) >> uint(2)));
        int _1930 = int(_1926) & 3;
        float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
        int _1934 = int(_1926) + 1;
        uint _1936 = uint(int(uint(_1934) >> uint(2)));
        int _1938 = _1934 & 3;
        float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
        int _1942 = _1924 + 8;
        uint _1944 = uint(int(uint(_1942) >> uint(2)));
        uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
        int _1948 = int(_1944) & 3;
        float _1950 = (*spvDescriptorSet0.vp_c15)._m0[int(_1946)][_1948];
        int _1952 = int(_1944) + 1;
        uint _1954 = uint(int(uint(_1952) >> uint(2)));
        int _1956 = _1952 & 3;
        float _1958 = (*spvDescriptorSet0.vp_c15)._m0[int(_1954)][_1956];
        float _1960 = _1108 * _1940;
        float _1962 = fma(_662, _1932, _1960);
        float _1964 = fma(_664, _1950, _1962);
        float _1966 = _1964 + _1958;
        float _1968 = precise::clamp(_1966, 0.0, 1.0);
        float _1970 = -_1968;
        float _1972 = _1970 + _1912;
        float _1974 = fma(_1972, 500.0, 1.5);
        float _1976 = exp2(_1974);
        float _1978 = 0.0 + _1976;
        float _1980 = precise::clamp(_1978, 0.0, 1.0);
        _1916 = _1980;
    }
    float _1982 = _1916;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1986 = _1685 + _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1687 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1689 + _1992;
    float _1996 = _1986 * _1986;
    float _1998 = fma(_1990, _1990, _1996);
    float _2000 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2002 = fma(_1994, _1994, _1998);
    float _2004 = precise::max(0.0, _2000);
    float _2006 = rsqrt(_2002);
    float _2008 = sqrt(_2002);
    float _2010 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2012 = _1990 * _2010;
    float _2014 = _1994 * _2010;
    float _2016 = -_2010;
    float _2018 = -_2004;
    float _2020 = fma(_1986, _2016, _2018);
    float _2022 = _2012 * _2012;
    float _2024 = _2014 * _2014;
    float _2026 = _2022 + _2024;
    float _2028 = sqrt(_2026);
    bool _2030 = _2028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = _2028 + _2032;
    float _2036 = _664;
    float _2038 = _2004;
    float _2040 = _2026;
    float _2042 = _2034;
    float _2044 = _2010;
    float _2046 = _2012;
    float _2048 = _2014;
    float _2050 = _2022;
    float _2052 = _2024;
    float _2054 = _2020;
    bool _2056 = _2030;
    if (_2030)
    {
        float _2058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2058;
    }
    float _2060 = _2036;
    if (_2030)
    {
        float _2062 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2062;
    }
    float _2064 = _2038;
    float _2066 = _2064;
    if (_2030)
    {
        float _2068 = rsqrt(_2026);
        _2040 = _2068;
    }
    float _2070 = _2040;
    if (_2030)
    {
        float _2072 = _2034 * _2060;
        _2042 = _2072;
    }
    float _2074 = _2042;
    if (_2030)
    {
        float _2076 = _2074 * 0.15915493667125701904296875;
        _1865 = _2076;
    }
    float _2078 = _1865;
    float _2080 = _2060;
    float _2082 = _2078;
    if (_2030)
    {
        float _2084 = _2078 * 6.283185482025146484375;
        float _2086 = sin(_2084);
        _2080 = _2086;
    }
    float _2088 = _2080;
    float _2090 = _2074;
    if (_2030)
    {
        float _2092 = _2078 * 6.283185482025146484375;
        float _2094 = cos(_2092);
        _2090 = _2094;
    }
    float _2096 = _2090;
    float _2098 = _2088;
    if (_2030)
    {
        float _2100 = fma(_2088, _2064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2044 = _2100;
    }
    float _2102 = _2044;
    float _2104 = _2102;
    if (_2030)
    {
        float _2106 = _2070 * _2102;
        _2104 = _2106;
    }
    float _2108 = _2104;
    if (_2030)
    {
        float _2110 = _2096 + (-1.0);
        _2066 = _2110;
    }
    float _2112 = _2066;
    if (_2030)
    {
        float _2114 = _2012 * _2108;
        _2046 = _2114;
    }
    float _2116 = _2046;
    if (_2030)
    {
        float _2118 = _2014 * _2108;
        _2048 = _2118;
    }
    float _2120 = _2048;
    if (_2030)
    {
        float _2122 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2122;
    }
    float _2124 = _2098;
    if (_2030)
    {
        float _2126 = _2116 * _2116;
        _2050 = _2126;
    }
    float _2128 = _2050;
    if (_2030)
    {
        float _2130 = _2120 * _2120;
        _2052 = _2130;
    }
    float _2132 = _2052;
    if (_2030)
    {
        float _2134 = fma(_2020, _2096, _2124);
        _2054 = _2134;
    }
    float _2136 = _2054;
    float _2138 = fma(_2136, _2136, _2128);
    float _2140 = _2138 + _2132;
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2144 = fma(_2008, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2142);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = -_2146;
    float _2150 = _2148 + 1.0;
    float _2152 = rsqrt(_2140);
    float _2154 = abs(_2150);
    float _2156 = log2(_2154);
    float _2158 = _2152 * _2116;
    float _2160 = _2152 * _2136;
    float _2162 = _2152 * _2120;
    float _2164 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2166 = -_2164;
    float _2168 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = -_2162;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2174 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2176 = fma(_2172, -0.5, 0.5);
    float _2178 = exp2(_2174);
    float _2180 = fma(_2172, 0.5, 0.5);
    float _2182 = _2160 + 1.0;
    float _2184 = fma(_2180, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2186 = sqrt(_2176);
    float _2188 = fma(_2180, _2184, -0.212114393711090087890625);
    float _2190 = fma(_1453, 6.2500002968590706586837768554688e-05, 0.5);
    float _2192 = fma(_2180, _2188, 1.570728778839111328125);
    float _2194 = -_2160;
    float _2196 = fma(_2178, _2182, _2194);
    float _2198 = _2186 * 0.636619746685028076171875;
    float _2200 = fma(_2196, 0.5, 0.5);
    float _2202 = fma(_1425, 6.2500002968590706586837768554688e-05, 0.5);
    float _2204 = -_2192;
    float _2206 = fma(_2198, _2204, 1.0);
    float2 _6582 = float2(_2206, _2200);
    float3 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6582, float2(0.0), isnan(_6582)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6582, float2(0.0), isnan(_6582)), level(0.0)).xyz;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float2 _6596 = float2(_2202, _2190);
    float3 _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6596, float2(0.0), isnan(_6596)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6596, float2(0.0), isnan(_6596)), level(0.0)).xyz;
    float _2220 = _2218.x;
    float _2222 = _2218.y;
    float _2224 = _2218.z;
    float _2226 = in.m_73.w;
    float _2228 = -_682;
    float _2230 = _2228 + 1.0;
    float _2232 = in.m_83.x;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    float _2238 = in.m_83.y;
    bool _2240 = _696 > 0.5;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2248 = _684 > 0.5;
    out.m_85.x = _1687;
    out.m_85.y = _1685;
    out.m_85.z = _1689;
    int _2250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2252 = _2250 != 0;
    int _2254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2236)
    {
        bool _2256 = _688 > 0.5;
        _2056 = _2256;
    }
    bool _2258 = _2056;
    float _2260 = 1.0 / _2244;
    float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2264 = _638 + _2262;
    bool _2266 = _2226 > 0.5;
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2268;
    float _2272 = _2232;
    if (_2236)
    {
        float _2274 = -_2232;
        float _2276 = _2274 + 1.0;
        _2254 = as_type<int>(_2276);
    }
    int _2278 = _2254;
    if (!_2236)
    {
        _2082 = _2232;
    }
    float _2280 = _2082;
    float _2282 = -_2238;
    float _2284 = _2282 + 1.0;
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2288 = _2280;
    float _2290 = _2238;
    if (_2236)
    {
        float _2292 = _2258 ? as_type<float>(_2278) : _2232;
        _2288 = _2292;
    }
    float _2294 = _2288;
    float _2296 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2300 = _2298 != 0;
    float _2302 = _2270 * _2260;
    int _2304 = _2240 ? as_type<int>(_2284) : as_type<int>(_2238);
    int _2306 = _2266 ? as_type<int>(_2284) : as_type<int>(_2238);
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2310 = _2308 != 0;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2314 = _2312 != 0;
    float _2316 = _2300 ? as_type<float>(_2304) : _2238;
    float _2318 = _2252 ? as_type<float>(_2306) : _2238;
    float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2324 = _2322 != 0;
    float _2326 = fma(_2296, _2316, -0.5);
    float _2328 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2330 = fma(_2302, _2264, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2332 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2334 = isnan(_638);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = -_770;
    float _2346 = fma(_980, _2326, _2344);
    int _2348 = as_type<int>(_2286);
    float _2350 = _2330;
    if (_2310)
    {
        float _2352 = -_2232;
        float _2354 = _2352 + 1.0;
        _794 = as_type<int>(_2354);
    }
    int _2356 = _794;
    float _2358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2314)
    {
        float _2360 = -_2232;
        float _2362 = _2360 + 1.0;
        _2348 = as_type<int>(_2362);
    }
    int _2364 = _2348;
    float _2366 = 0.0;
    if (!_2310)
    {
        _2366 = _2232;
    }
    float _2368 = _2366;
    float _2370 = in.m_87.x;
    float _2372 = in.m_87.y;
    float _2374 = in.m_87.z;
    float _2376 = _2368;
    if (_2310)
    {
        float _2378 = _2248 ? as_type<float>(_2356) : _2232;
        _2376 = _2378;
    }
    float _2380 = _2376;
    float _2382 = fma(_2318, _2328, -0.5);
    if (_2324)
    {
        float _2384 = _2248 ? _2284 : _2238;
        _2290 = _2384;
    }
    float _2386 = _2290;
    float _2388 = -_2342;
    float _2390 = _2388 + 1.0;
    if (_2314)
    {
        float _2392 = _2240 ? as_type<float>(_2364) : _2232;
        _2272 = _2392;
    }
    float _2394 = _2272;
    float _2396 = -_924;
    float _2398 = fma(_826, _2382, _2396);
    float _2400 = in.m_89.x;
    float _2402 = in.m_89.y;
    float _2404 = in.m_89.z;
    float _2406 = in.m_89.w;
    bool _2408 = _1044 != 0.0;
    bool _2410 = isnan(_1044);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan(0.0);
    bool _2416 = _2412 || _2414;
    float _2418 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2420 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2422 = isnan(_638);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2434 = _1042 == 0.0;
    bool _2436 = !_2416;
    bool _2438 = _2434 && _2436;
    float _2440 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2442 = fma(_2418, _2294, -0.5);
    float _2444 = _2430 * _2390;
    bool _2446 = _1046 == 0.0;
    bool _2448 = _2446 && _2438;
    float _2450 = fma(_2440, _2380, -0.5);
    float _2452 = -_2430;
    float _2454 = _2452 + 1.0;
    float _2456 = _2330 * _2444;
    float _2458 = fma(_940, _2442, _768);
    float _2460 = fma(_874, _2450, _884);
    float _2462 = _2394 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2464 = abs(_1244);
    float _2466 = log2(_2464);
    float _2468 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2456);
    float _2470 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2468);
    float _2472 = _2456;
    float _2474 = _2430;
    if (_2448)
    {
        _2350 = _2370;
    }
    float _2476 = _2350;
    float _2478 = _2476;
    if (!_2448)
    {
        float _2480 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2370);
        _2478 = _2480;
    }
    float _2482 = _2478;
    float _2484 = _2402 * _2374;
    if (_2448)
    {
        _2472 = _2372;
    }
    float _2486 = _2472;
    float _2488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2490 = _2486;
    if (_2448)
    {
        _2474 = _2374;
    }
    float _2492 = _2474;
    float _2494 = _2492;
    if (!_2448)
    {
        float _2496 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2372);
        _2490 = _2496;
    }
    float _2498 = _2490;
    if (!_2448)
    {
        float _2500 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2374);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = _2400 * _2372;
    float _2506 = -_2484;
    float _2508 = fma(_2404, _2372, _2506);
    float _2510 = _2346 + 0.5;
    float _2512 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2514 = _2404 * _2370;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2520 = _2398 + 0.5;
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2524 = exp2(_2512);
    float _2526 = -_2514;
    float _2528 = fma(_2400, _2374, _2526);
    float _2530 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2532 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2534 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2536 = _2470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2538 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2540 = -_2504;
    float _2542 = fma(_2402, _2370, _2540);
    float _2544 = _2462 * _2488;
    float _2546 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_91.x = _2530;
    out.m_91.y = _2532;
    out.m_91.z = _2534;
    out.m_91.w = _2536;
    float _2548 = _2538 * _2432;
    float _2550 = _2458 + 0.5;
    float _2552 = _2528 * _2406;
    float _2554 = _2508 * _2406;
    float _2556 = -_1102;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2546);
    out.m_93.x = _2544;
    out.m_93.y = _2548;
    float _2560 = _2460 + 0.5;
    float _2562 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2564 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2558);
    bool _2566 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2568 = isnan(0.5);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2574 = _2570 || _2572;
    out.m_95.x = _2550;
    out.m_95.y = _2510;
    out.m_95.z = _2560;
    out.m_95.w = _2520;
    float _2576 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2578 = _2542 * _2406;
    float _2580 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2582 = -_1102;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2576);
    float _2586 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2588 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2590 = -_1102;
    float _2592 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2580);
    float _2594 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2586);
    float _2600 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2588);
    float _2602 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2562);
    float _2604 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2584);
    float _2610 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2612 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2614 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2598);
    float _2616 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2600);
    float _2618 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2602);
    float _2620 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2622 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2624 = _2608 * _2402;
    float _2626 = _2564 * _2402;
    float _2628 = _2608 * _2498;
    float _2630 = _2552 * _2608;
    float _2632 = _2564 * _2498;
    float _2634 = fma(_2596, -2.0, 3.0);
    float _2636 = _2596 * _2596;
    float _2638 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2610);
    float _2640 = _2552 * _2564;
    float _2642 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2644 = _2620 * _2402;
    float _2646 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2622);
    float _2648 = fma(_2614, _2482, _2628);
    float _2650 = fma(_2616, _2400, _2626);
    float _2652 = fma(_2614, _2400, _2624);
    float _2654 = fma(_2554, _2614, _2630);
    float _2656 = fma(_2616, _2482, _2632);
    float _2658 = fma(_2554, _2616, _2640);
    float _2660 = fma(_2618, _2400, _2644);
    float _2662 = fma(_2646, _2404, _2650);
    float _2664 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2666 = fma(_2642, _2404, _2652);
    float _2668 = fma(_2578, _2642, _2654);
    float _2670 = fma(_2642, _2502, _2648);
    float _2672 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2674 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2664);
    float _2676 = _2620 * _2498;
    float _2678 = _2552 * _2620;
    float _2680 = exp2(_2672);
    float _2682 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2638);
    float _2684 = _2636 * _2634;
    float _2686 = fma(_2618, _2482, _2676);
    float _2688 = fma(_2554, _2618, _2678);
    float _2690 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2674);
    float _2692 = fma(_2682, _2404, _2660);
    float _2694 = fma(_2578, _2646, _2658);
    float _2696 = -_2684;
    float _2698 = _2696 + 1.0;
    float _2700 = fma(_2646, _2502, _2656);
    float _2702 = fma(_2682, _2502, _2686);
    float _2704 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2690);
    bool _2706 = _1244 <= 8000.0;
    bool _2708 = isnan(_1244);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan(8000.0);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2684);
    float _2720 = fma(_2578, _2682, _2688);
    float _2722 = _2690;
    float _2724 = _2716;
    if (!_2574)
    {
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2728 = _1244 + _2726;
        _2722 = _2728;
    }
    float _2730 = _2722;
    float _2732 = _1803 * 0.5;
    float _2734 = _2716 * _2718;
    float _2736 = -_2680;
    float _2738 = _2736 + 1.0;
    out.m_97.x = _2668;
    out.m_97.y = _2694;
    out.m_97.z = _2720;
    float _2740 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2574)
    {
        _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2742 = _1779;
    out.m_99.x = _2666;
    out.m_99.y = _2662;
    out.m_99.z = _2692;
    float _2744 = _2230 * _2740;
    float _2746 = precise::clamp(_2744, 0.0, 1.0);
    float _2748 = _2742;
    float _2750 = _2746;
    if (!_2574)
    {
        float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2754 = _2742 + _2752;
        _2748 = _2754;
    }
    float _2756 = _2748;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1829;
    out.gl_Position.z = _2704;
    out.gl_Position.w = _1803;
    if (!_1799)
    {
        _2724 = 1.0;
    }
    float _2758 = _2724;
    float _2760 = _2704 + _1803;
    float _2762 = _1857 + _1803;
    float _2764 = fma(_1829, -0.5, _2732);
    float _2766 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2768 = _2760 * 0.5;
    float _2770 = _2762 * 0.5;
    float _2772 = _2624;
    float _2774 = _2758;
    if (!_2574)
    {
        float _2776 = 1.0 / _2756;
        _2772 = _2776;
    }
    float _2778 = _2772;
    float _2780 = _2766 * _1895;
    float _2782 = -_2766;
    float _2784 = _2782 + 1.0;
    out.m_101.x = _2670;
    out.m_101.y = _2700;
    out.m_101.z = _2702;
    float _2786 = _2784;
    if (_1799)
    {
        bool _2788 = _1893 >= _1859;
        bool _2790 = isnan(_1893);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan(_1859);
        bool _2796 = _2792 || _2794;
        float _2798 = float(_2796);
        _2774 = _2798;
    }
    float _2800 = _2774;
    bool _2802 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2804 = isnan(_2008);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2810 = _2806 || _2808;
    out.m_103.x = _2770;
    out.m_103.y = _2764;
    out.m_103.z = _2768;
    out.m_103.w = _1803;
    if (_2574)
    {
        _1781 = 1.0;
    }
    float _2812 = _1781;
    float _2814 = _2800 * _1982;
    out.m_105.x = 1.0;
    out.m_105.y = 1.0;
    out.m_105.z = 1.0;
    float _2816 = _2812;
    if (!_2574)
    {
        float _2818 = _2730 * _2778;
        float _2820 = precise::clamp(_2818, 0.0, 1.0);
        _2816 = _2820;
    }
    float _2822 = _2816;
    if (!_2810)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2824 = _1918;
    float _2826 = _1906 * _2780;
    float _2828 = _1906 * _2784;
    float _2830 = -_2746;
    float _2832 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2834 = _2824;
    float _2836 = _2824;
    if (!_2810)
    {
        _2750 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2838 = _2750;
    float _2840 = _2838;
    float _2842 = _2838;
    if (!_2810)
    {
        _1920 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2844 = _1920;
    float _2846 = -_2814;
    float _2848 = fma(_2846, _2832, 1.0);
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2850;
    float _2854 = _2844;
    float _2856 = _2844;
    if (!_2810)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2858 = _2786;
    float _2860 = _2216 * _2780;
    float _2862 = fma(_2212, _2826, _1900);
    float _2864 = fma(_2214, _2826, _1902);
    out.m_107.x = _2220;
    out.m_107.y = _2222;
    out.m_107.z = _2224;
    float _2866 = fma(_1906, _2860, _1904);
    float _2868 = _2850 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2870 = _2822 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2872 = _2868;
    float _2874 = _2858;
    float _2876 = _2858;
    if (!_2810)
    {
        _2852 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2878 = _2852;
    out.m_109.x = _2862;
    out.m_109.y = _2864;
    out.m_109.z = _2866;
    out.m_109.w = _2828;
    out.m_111.x = _2868;
    float _2880 = _2878;
    float _2882 = _2878;
    if (!_2810)
    {
        _2872 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2884 = _2872;
    bool _2886 = !_2810;
    float _2888 = _2884;
    float _2890 = _2884;
    if (!_2886)
    {
        bool _2892 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2894 = isnan(_2008);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2900 = _2896 || _2898;
        if (!_2900)
        {
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2904 = _2008 + _2902;
            float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2908 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2906;
            float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2914 = 1.0 / _2908;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2932 = _2904 * _2914;
            float _2934 = precise::clamp(_2932, 0.0, 1.0);
            float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2940 = fma(_2934, _2912, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2942 = fma(_2934, _2938, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2944 = fma(_2934, _2918, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2946 = fma(_2934, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2948 = fma(_2934, _2926, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2950 = fma(_2934, _2930, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2842 = _2940;
            _2876 = _2948;
            _2836 = _2944;
            _2856 = _2946;
            _2882 = _2942;
            _2890 = _2950;
            _2952 = true;
        }
        else
        {
            bool _2954 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2956 = isnan(_2008);
            bool _2958 = _2954 || _2956;
            bool _2960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2962 = _2958 || _2960;
            if (!_2962)
            {
                _2834 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2964 = _2834;
            _2836 = _2964;
            if (!_2962)
            {
                _2840 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2966 = _2840;
            _2842 = _2966;
            if (!_2962)
            {
                _2880 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2968 = _2880;
            _2882 = _2968;
            if (!_2962)
            {
                _2854 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2970 = _2854;
            _2856 = _2970;
            if (!_2962)
            {
                _2874 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2972 = _2874;
            _2876 = _2972;
            if (!_2962)
            {
                _2888 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2974 = _2888;
            bool _2976 = !_2962;
            _2890 = _2974;
            if (!_2976)
            {
                bool _2978 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2980 = isnan(_2008);
                bool _2982 = _2978 || _2980;
                bool _2984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2986 = _2982 || _2984;
                if (!_2986)
                {
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2990 = _2008 + _2988;
                    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2994 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2992;
                    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3000 = 1.0 / _2994;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3018 = _2990 * _3000;
                    float _3020 = precise::clamp(_3018, 0.0, 1.0);
                    float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3026 = fma(_3020, _2998, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3028 = fma(_3020, _3024, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3030 = fma(_3020, _3004, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3032 = fma(_3020, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3034 = fma(_3020, _3012, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3036 = fma(_3020, _3016, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2842 = _3026;
                    _2876 = _3034;
                    _2836 = _3030;
                    _2856 = _3032;
                    _2882 = _3028;
                    _2890 = _3036;
                    _2952 = true;
                }
                else
                {
                    _2842 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2876 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2836 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2856 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2882 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2890 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2952 = false;
    float _3038 = _2842;
    float _3040 = _2876;
    float _3042 = _2836;
    float _3044 = _2856;
    float _3046 = _2882;
    float _3048 = _2890;
    float _3050 = fma(_2700, -0.5, 0.5);
    float _3052 = precise::clamp(_3050, 0.0, 1.0);
    float _3054 = -_3038;
    float _3056 = _3054 + _3040;
    float _3058 = _2870 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3060 = -_3042;
    float _3062 = _3060 + _3044;
    out.m_113.x = 0.0;
    float _3064 = fma(_3052, _3056, _3038);
    float _3066 = fma(_3052, _3062, _3042);
    out.m_61.x = _3058;
    float _3068 = -_3046;
    float _3070 = _3068 + _3048;
    float _3072 = _3064 * 0.586610972881317138671875;
    bool _3074 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3076 = fma(_3052, _3070, _3046);
    float _3078 = fma(_3066, 0.298911988735198974609375, _3072);
    bool _3080 = _2822 > 0.0;
    bool _3082 = isnan(_2822);
    bool _3084 = _3080 || _3082;
    bool _3086 = isnan(0.0);
    bool _3088 = _3084 || _3086;
    float _3090 = fma(_3076, 0.114477999508380889892578125, _3078);
    float _3092 = -_3090;
    float _3094 = _3064 + _3092;
    float _3096 = -_3090;
    float _3098 = _3066 + _3096;
    float _3100 = -_3090;
    float _3102 = _3076 + _3100;
    float _3104 = fma(_3094, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    float _3106 = fma(_3098, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    float _3108 = fma(_3102, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    bool _3110 = !_3074;
    if (!_3110)
    {
        float _3112 = -_1685;
        float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3116 = -_1687;
        float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3120 = -_1689;
        float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3124 = _3114 * _3114;
        float _3126 = fma(_3118, _3118, _3124);
        float _3128 = fma(_3122, _3122, _3126);
        float _3130 = sqrt(_3128);
        float _3132 = rsqrt(_3128);
        float _3134 = -_3130;
        float _3136 = _3134 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3138 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3140 = precise::clamp(_3138, 0.0, 1.0);
        float _3142 = _3118 * _3132;
        float _3144 = _3114 * _3132;
        float _3146 = abs(_3140);
        float _3148 = log2(_3146);
        float _3150 = _3122 * _3132;
        float _3152 = _3142 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3154 = _2700 * _3144;
        float _3156 = -_3144;
        float _3158 = -_3152;
        float _3160 = fma(_3156, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3158);
        float _3162 = fma(_2670, _3142, _3154);
        float _3164 = -_3150;
        float _3166 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3160);
        float _3168 = fma(_2702, _3150, _3162);
        float _3170 = precise::clamp(_3168, 0.0, 1.0);
        float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3174 = _3166 + _3172;
        float _3176 = _3148 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3178 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        float _3182 = exp2(_3176);
        float _3184 = _3182 * _3180;
        float _3186 = _3170 * _3184;
        float _3188 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3190 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3192 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _3188;
        out.m_113.y = _3190;
        out.m_113.z = _3192;
    }
    out.m_115.x = _3106;
    out.m_115.y = _3104;
    out.m_115.z = _3108;
    if (_3088)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3194 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3194;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2952 = false;
    bool _630 = false;
    bool _476 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_58.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_61.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3251 = as_type<float>(_150);
        out.gl_Position.z = _3251;
    }
    if (!_138)
    {
        return out;
    }
    float _154 = in.m_63.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_61.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_188);
        out.gl_Position.z = _3321;
    }
    if (_180)
    {
        return out;
    }
    float _190 = in.m_65.x;
    float _192 = in.m_65.y;
    float _194 = in.m_65.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_67.x;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = in.m_71.x;
    float _212 = in.m_71.y;
    float _214 = in.m_71.z;
    float _216 = _192 * _200;
    float _218 = _192 * _206;
    float _220 = fma(_190, _198, _216);
    float _222 = _192 * _212;
    float _224 = fma(_190, _204, _218);
    float _226 = fma(_194, _202, _220);
    float _228 = fma(_190, _210, _222);
    float _230 = fma(_194, _208, _224);
    float _232 = fma(_194, _214, _228);
    bool _234 = !_196;
    float _252;
    if (!_234)
    {
        float _236 = in.m_73.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        float _256 = float(_134);
        float _258 = 1.0 / _256;
        float _260 = _168 * _258;
        _252 = _260;
    }
    _254 = false;
    float _262 = _252;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _262 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _284;
    float _288 = 1.0 / _282;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _292 = 1.0 / _286;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    float _298 = 1.0 / _278;
    float _300 = _266 * _288;
    bool _302 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_262);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _270 * _292;
    bool _328 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_262);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_312;
    float _342 = _340 + 1.0;
    float _344 = _338 * _342;
    bool _346 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _348 = isnan(_262);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = _274 * _298;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = -_338;
    float _370 = _368 + 1.0;
    float _372 = fma(_296, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -_324;
    float _380 = _378 + 1.0;
    float _382 = _324 * _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = _356 * _380;
    float _394 = -_356;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _374 * _392;
    float _404 = _376 * _392;
    float _406 = _372 * _392;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _412 = fma(_400, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_386, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_390, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_412, _382, _408);
    float _434 = fma(_416, _326, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_426, _326, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_430, _326, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _440 = fma(_418, _382, _410);
    float _442 = fma(_420, _382, _422);
    float _444 = fma(_436, _344, _432);
    float _446 = fma(_434, _344, _440);
    float _448 = fma(_438, _344, _442);
    float _450 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _444);
    float _452 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _446);
    float _454 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _448);
    bool _456 = !_290;
    float _474;
    if (!_456)
    {
        float _458 = in.m_73.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_134);
        float _480 = 1.0 / _478;
        float _482 = _168 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _488 = _484 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = isnan(_484);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _512 = isnan(_484);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _522;
    bool _526 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = isnan(_484);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = 1.0 / _492;
    float _540 = -_504;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _484 + _544;
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _550 = 1.0 / _508;
    float _552 = _524 * _538;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = -_536;
    float _560 = _558 + 1.0;
    float _562 = fma(_552, _488, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _564 = _520 * _542;
    float _566 = -_520;
    float _568 = _566 + 1.0;
    float _570 = _504 * _560;
    float _572 = _556 * _550;
    float _574 = _562 * _564;
    float _576 = fma(_572, _546, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = fma(_576, _570, _578);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = in.m_75.x;
    float _596 = in.m_75.y;
    float _598 = in.m_75.z;
    float _600 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _592;
    out.m_77.y = _602;
    out.m_77.z = _586;
    out.m_77.w = _600;
    float _604 = _454 * _598;
    float _606 = _452 * _596;
    float _608 = _450 * _594;
    bool _610 = !_548;
    float _628;
    if (!_610)
    {
        float _612 = in.m_73.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_134);
        float _634 = 1.0 / _632;
        float _636 = _168 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = in.m_58.x;
    float _642 = in.m_58.y;
    float _644 = in.m_58.z;
    float _646 = in.m_67.w;
    float _648 = in.m_71.w;
    float _650 = _200 * _642;
    float _652 = _212 * _642;
    float _654 = fma(_198, _640, _650);
    float _656 = fma(_210, _640, _652);
    float _658 = fma(_202, _644, _654);
    float _660 = fma(_214, _644, _656);
    float _662 = _658 + _646;
    float _664 = _660 + _648;
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _668 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _670 = floor(_666);
    float _672 = floor(_668);
    float _674 = -_670;
    float _676 = _666 + _674;
    float _678 = -_672;
    float _680 = _668 + _678;
    float2 _4115 = float2(_676, _680);
    float _682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4115, float2(0.0), isnan(_4115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4115, float2(0.0), isnan(_4115)), level(0.0)).x;
    float _684 = in.m_73.z;
    float _686 = _206 * _642;
    float _688 = in.m_73.x;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _692 = _690 != 0;
    float _694 = fma(_204, _640, _686);
    float _696 = in.m_73.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _708 = _706 != 0;
    float _710 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _714 = !_700;
    int _716 = _714 ? 0 : 1;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _720 = abs(_716);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _724 = _684 * 2.0;
    float _726 = _688 * 2.0;
    float _728 = _688 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _730 = floor(_724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _734 = _696 * 2.0;
    float _736 = _696 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _738 = -_718;
    float _740 = fma(_728, 2.0, _738);
    float _742 = _688 + _696;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _746 = 1.0 + _744;
    float _748 = fma(_736, -2.0, _712);
    float _750 = floor(_726);
    float _752 = _736;
    float _754 = _726;
    int _756 = 2;
    if (!_692)
    {
        _752 = _684;
    }
    float _758 = _752;
    float _760 = _742 + (-1.0);
    float _762 = _758;
    if (_692)
    {
        _762 = _696;
    }
    float _764 = _762;
    float _766 = -_168;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _740);
    float _770 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _748);
    float _772 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _774 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _776 = floor(_734);
    bool _778 = _730 > 0.0;
    float _780 = _764 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _782 = _730 >= 0.0;
    bool _784 = isnan(_730);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _730;
    int _794 = as_type<int>(_770);
    if (!_692)
    {
        _754 = _696;
    }
    float _796 = _754;
    float _798 = _796;
    if (!_692)
    {
        _792 = _684;
    }
    float _800 = _792;
    float _802 = 1.0 / _746;
    float _804 = _800;
    if (_692)
    {
        _798 = _688;
    }
    float _806 = _798;
    if (_692)
    {
        _804 = _696;
    }
    float _808 = _804;
    bool _810 = _750 > 0.0;
    bool _812 = _750 >= 0.0;
    bool _814 = isnan(_750);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    float _822 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _732);
    int _824 = _790 ? 0 : 1;
    float _826 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    bool _828 = _776 > 0.0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _832 = _776 >= 0.0;
    bool _834 = isnan(_776);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _844 = log2(_842);
    float _846 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    float _848 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _850 = ~_824;
    int _852 = _850 + 1;
    int _854 = _852 + 1;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _858 = _854;
    if (!_778)
    {
        int _860 = ~_824;
        int _862 = _860 + 1;
        _858 = _862;
    }
    int _864 = _858;
    float _866 = -_722;
    float _868 = fma(_848, 2.0, _866);
    float _870 = fma(_780, -2.0, _856);
    float _872 = float(_864);
    float _874 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    float _876 = float(_720);
    float _878 = _688 + (-0.5);
    int _880 = _840 ? 0 : 1;
    float _882 = -_168;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[81].x, _868);
    float _886 = _844 * _168;
    float _888 = _876 * _872;
    int _890 = ~_880;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = in.m_79.x;
    float _898 = in.m_79.y;
    float _900 = in.m_79.z;
    int _902 = _894;
    if (!_828)
    {
        int _904 = ~_880;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _912 = exp2(_886);
    int _914 = _820 ? 0 : 1;
    float _916 = _888 * (-2.0);
    float _918 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    bool _920 = !_704;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _870);
    int _926 = ~_914;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _930;
    if (!_810)
    {
        int _934 = ~_914;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    bool _942 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _944 = isnan(1.0);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _950 = _946 || _948;
    int _952 = abs(_922);
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _956 = -_912;
    float _958 = _956 + 1.0;
    bool _960 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _968 = _964 || _966;
    float _970 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[78].w, _954);
    bool _972 = !_708;
    int _974 = _972 ? 0 : 1;
    float _976 = fma(_916, _896, _896);
    float _978 = float(_952);
    float _980 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _970);
    float _982 = float(_938);
    float _984 = fma(_772, _916, _772);
    float _986 = _968 ? _958 : 0.0;
    float _988 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    int _990 = abs(_974);
    float _992 = _978 * _982;
    float _994 = _696 + _684;
    if (_950)
    {
        float _996 = _986 * _802;
        _170 = _996;
    }
    float _998 = _170;
    float _1000 = _992 * (-2.0);
    float _1002 = fma(_984, _998, _988);
    float _1004 = _994 + (-1.0);
    float _1006 = float(_990);
    float _1008 = fma(_1000, _898, _898);
    float _1010 = float(_908);
    float _1012 = _696 + (-0.5);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1016 = _688 + _684;
    float _1018 = _1002 * 0.15915493667125701904296875;
    float _1020 = _1006 * _1010;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1008);
    float _1024 = fma(_1014, _1000, _1014);
    float _1026 = _1016 + (-1.0);
    float _1028 = _1020 * (-2.0);
    float _1030 = _1018 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(_1024, _998, _1022);
    float _1036 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1038 = fma(_1028, _900, _900);
    float _1040 = _684 + (-0.5);
    float _1042 = in.m_81.x;
    float _1044 = in.m_81.y;
    float _1046 = in.m_81.z;
    float _1048 = fma(_1036, _1028, _1036);
    float _1050 = _1034 * 0.15915493667125701904296875;
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1038);
    float _1054 = _1018 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1060 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1062 = fma(_1048, _998, _1052);
    float _1064 = in.m_69.w;
    float _1066 = _1062 * 0.15915493667125701904296875;
    float _1068 = _1050 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_208, _644, _694);
    float _1074 = _1050 * 6.283185482025146484375;
    float _1076 = cos(_1074);
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1042);
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1044);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1046);
    float _1084 = _1066 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = _1078 * _1058;
    float _1090 = _1080 * _1060;
    float _1092 = _1032 * _1070;
    float _1094 = _1056 * _1070;
    float _1096 = _1082 * _710;
    float _1098 = _1072 + _1064;
    float _1100 = _1066 * 6.283185482025146484375;
    float _1102 = sin(_1100);
    float _1104 = _1056 * _1076;
    float _1106 = _1032 * _1076;
    float _1108 = _1098 + _774;
    float _1110 = _1056 * _1086;
    float _1112 = _1076 * _1086;
    float _1114 = _1032 * _1086;
    float _1116 = _1070 * _1086;
    float _1118 = _1110 * _1090;
    float _1120 = fma(_1102, _1104, _1092);
    float _1122 = -_1090;
    float _1124 = _1102 * _1122;
    float _1126 = -_1106;
    float _1128 = fma(_1102, _1094, _1126);
    float _1130 = -_1094;
    float _1132 = fma(_1102, _1106, _1130);
    float _1134 = fma(_1120, _1088, _1118);
    float _1136 = _1114 * _1090;
    float _1138 = fma(_1112, _1088, _1124);
    float _1140 = fma(_1102, _1092, _1104);
    float _1142 = fma(_1128, _1096, _1134);
    float _1144 = fma(_1132, _1088, _1136);
    float _1146 = fma(_1116, _1096, _1138);
    float _1148 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1150 = fma(_1140, _1096, _1144);
    float _1152 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1154 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1156 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1148);
    float _1158 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1160 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1152);
    float _1162 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1164 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1156);
    float _1166 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1160);
    float _1170 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1162);
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1174 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1166);
    float _1176 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1178 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1170);
    float _1180 = _664 + _1172;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1184 = _662 + _1176;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1190 = _1180 + _1188;
    float _1192 = 1.0 / _1182;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1184 + _1194;
    float _1198 = _1186 + _1182;
    float _1200 = _1190 * _1190;
    float _1202 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1154);
    float _1204 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1206 = fma(_1196, _1196, _1200);
    float _1208 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1202);
    float _1210 = sqrt(_1206);
    float _1212 = _1198 * _1192;
    float _1214 = _1212 * 0.5;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1218 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1216);
    float _1220 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1222 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1220);
    float _1224 = 1.0 / _1218;
    bool _1226 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1210 + _1228;
    float _1232 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1222);
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1236 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1238 = trunc(_1234);
    int _1240 = int(_1238);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1244 = _1224 * _1242;
    float _1246 = _1192;
    float _1248 = _1224;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1252 = _1070;
    float _1254 = _1184;
    float _1256 = _1180;
    if (_1226)
    {
        float _1258 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1258;
    }
    float _1260 = _1246;
    bool _1262 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1264 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1266 = 0.0;
    if (_1226)
    {
        float _1268 = rsqrt(_1206);
        _1266 = _1268;
    }
    float _1270 = _1266;
    if (!_1262)
    {
        _756 = 1;
    }
    int _1272 = _756;
    int _1274 = _1272;
    if (_1226)
    {
        float _1276 = _1230 * _1260;
        _1248 = _1276;
    }
    float _1278 = _1248;
    float _1280 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1204);
    float _1282 = _1098 + _1236;
    float _1284 = _1282;
    if (_1226)
    {
        float _1286 = _1278 * 0.15915493667125701904296875;
        _1250 = _1286;
    }
    float _1288 = _1250;
    bool _1290 = !_1262;
    int _1292 = _1290 ? 0 : 1;
    float _1294 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1280);
    if (_1226)
    {
        float _1296 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1296;
    }
    float _1298 = _1252;
    float _1300 = 0.0;
    if (_1226)
    {
        float _1302 = _1288 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    if (!_1264)
    {
        _1274 = _1292;
    }
    int _1308 = _1274;
    float _1310 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1312 = _1308 << 6;
    float _1314 = _1056;
    if (_1226)
    {
        float _1316 = _1288 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        _1314 = _1318;
    }
    float _1320 = _1314;
    int _1322 = _1312 + 96;
    uint _1325 = uint(int(uint(_1322) >> uint(2)));
    uint _1327 = uint(int(uint(int(_1325)) >> uint(2)));
    int _1329 = int(_1325) & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    int _1333 = int(_1325) + 1;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    int _1337 = _1333 & 3;
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[int(_1335)][_1337];
    float _1341 = trunc(_1310);
    int _1343 = int(_1341);
    int _1345 = _1312 + 104;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
    int _1351 = int(_1347) & 3;
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
    int _1355 = int(_1347) + 1;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    int _1359 = _1355 & 3;
    float _1361 = (*spvDescriptorSet0.vp_c15)._m0[int(_1357)][_1359];
    float _1363 = 0.0;
    if (_1226)
    {
        float _1365 = _1306 + (-1.0);
        _1363 = _1365;
    }
    float _1367 = _1363;
    float _1369 = _1367;
    if (_1226)
    {
        float _1371 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1371;
    }
    float _1373 = _1369;
    float _1375 = 0.0;
    if (_1226)
    {
        float _1377 = fma(_1320, _1298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1375 = _1377;
    }
    float _1379 = _1375;
    int _1381 = _1312 + 48;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    float _1399 = _1379;
    if (_1226)
    {
        float _1401 = fma(_1282, _1306, _1373);
        _1284 = _1401;
    }
    float _1403 = _1284;
    int _1405 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1407 = _1240 + _1405;
    int _1409 = _1407 + 1;
    uint _1411 = uint(_1409);
    if (_1226)
    {
        float _1413 = _1270 * _1379;
        _1399 = _1413;
    }
    float _1415 = _1399;
    float _1417 = -_1098;
    float _1419 = _1417 + _1403;
    bool _1421 = _1409 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1226)
    {
        float _1423 = fma(_1196, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1254 = _1423;
    }
    float _1425 = _1254;
    int _1427 = _1312 + 64;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    int _1445 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1447 = _1343 + _1445;
    int _1449 = _1447 + 1;
    if (_1226)
    {
        float _1451 = fma(_1190, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1256 = _1451;
    }
    float _1453 = _1256;
    float _1455 = -_662;
    float _1457 = _1455 + _1425;
    float _1459 = _1419 * _1419;
    int _1461 = _1409 | _1449;
    float _1463 = -_664;
    float _1465 = _1463 + _1453;
    int _1467 = _1312 + 56;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = int(_1469) + 1;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    int _1481 = _1477 & 3;
    float _1483 = (*spvDescriptorSet0.vp_c15)._m0[int(_1479)][_1481];
    float _1485 = fma(_1457, _1457, _1459);
    bool _1487 = _1461 < 0;
    bool _1489 = _1487 || _1421;
    float _1491 = fma(_1465, _1465, _1485);
    bool _1493 = _1449 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1495 = _1493 || _1489;
    int _1497 = _1312 + 72;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    float _1515 = sqrt(_1491);
    int _1517 = _1312 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    float _1535 = _1108 * _1339;
    float _1537 = _1491;
    if (!_1495)
    {
        int _1539 = _1449 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1541 = _1539 + _1409;
        _1411 = uint(_1541);
    }
    uint _1543 = _1411;
    float _1545 = fma(_662, _1331, _1535);
    float _1547 = fma(_664, _1353, _1545);
    bool _1549 = _1515 > 0.0;
    float _1551 = _1545;
    float _1553 = _1515;
    if (!_1495)
    {
        float _1555 = floor(_1234);
        _1551 = _1555;
    }
    float _1557 = _1551;
    float _1559 = _1547 + _1361;
    float _1561 = _1108 * _1397;
    int _1563 = as_type<int>(_1397);
    if (!_1495)
    {
        uint _1565 = uint(int(uint(int(_1543)) >> uint(2)));
        _1563 = int(_1565);
    }
    int _1567 = _1563;
    float _1569 = fma(_662, _1389, _1561);
    float _1571 = 1.0 / _1559;
    int _1573 = _1567;
    if (!_1549)
    {
        _1553 = _1453;
    }
    float _1575 = _1553;
    float _1577 = _1108 * _1443;
    int _1579 = as_type<int>(_1443);
    int _1581 = as_type<int>(_1577);
    float _1583 = _1435;
    float _1585 = _1575;
    float _1587 = _1575;
    if (!_1495)
    {
        int _1589 = int(_1543) << 2;
        _1579 = _1589;
    }
    int _1591 = _1579;
    float _1593 = fma(_662, _1435, _1577);
    float _1595 = as_type<float>(_1591);
    if (!_1495)
    {
        int _1597 = 12 & _1591;
        _1581 = _1597;
    }
    int _1599 = _1581;
    if (!_1549)
    {
        _1583 = _1425;
    }
    float _1601 = _1583;
    float _1603 = fma(_664, _1475, _1569);
    float _1605 = _1601;
    float _1607 = _1601;
    float _1609 = _1533;
    if (!_1495)
    {
        int _1611 = _1567 << 4;
        int _1613 = _1611 + _1599;
        _1573 = _1613;
    }
    int _1615 = _1573;
    if (!_1549)
    {
        _1595 = _1403;
    }
    float _1617 = _1595;
    float _1619 = _1603 + _1483;
    float _1621 = fma(_664, _1505, _1593);
    float _1623 = _1621 + _1513;
    bool _1625 = !_1549;
    float _1627 = _1617;
    float _1629 = _1617;
    float _1631 = _1571;
    if (!_1625)
    {
        float _1633 = _230 * _230;
        float _1635 = rsqrt(_1491);
        float _1637 = fma(_226, _226, _1633);
        float _1639 = fma(_232, _232, _1637);
        float _1641 = sqrt(_1639);
        float _1643 = _1457 * _1635;
        float _1645 = _1419 * _1635;
        float _1647 = _1465 * _1635;
        bool _1649 = _1641 > 0.0;
        _1537 = _1635;
        if (!_1649)
        {
            _1605 = _1425;
        }
        float _1651 = _1605;
        _1607 = _1651;
        if (!_1649)
        {
            _1627 = _1403;
        }
        float _1653 = _1627;
        _1629 = _1653;
        if (!_1649)
        {
            _1585 = _1453;
        }
        float _1655 = _1585;
        bool _1657 = !_1649;
        _1587 = _1655;
        if (!_1657)
        {
            float _1659 = rsqrt(_1639);
            float _1661 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1663 = _230 * _1659;
            float _1665 = _226 * _1659;
            float _1667 = _1645 * _1663;
            float _1669 = _232 * _1659;
            float _1671 = fma(_1643, _1665, _1667);
            float _1673 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1675 = fma(_1647, _1669, _1671);
            float _1677 = _1675 * _1673;
            float _1679 = fma(_230, _1677, _1403);
            float _1681 = fma(_226, _1677, _1425);
            float _1683 = fma(_232, _1677, _1453);
            _1629 = _1679;
            _1607 = _1681;
            _1587 = _1683;
        }
    }
    float _1685 = _1629;
    float _1687 = _1607;
    float _1689 = _1587;
    float _1691 = _1537;
    int _1693 = _1312 + 88;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
    int _1699 = int(_1695) & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    int _1703 = int(_1695) + 1;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    int _1707 = _1703 & 3;
    float _1709 = (*spvDescriptorSet0.vp_c15)._m0[int(_1705)][_1707];
    float _1711 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1713 = _1619 * _1571;
    float _1715 = _1623 * _1571;
    float _1717 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1719 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1711);
    float _1723 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1725 = _1457;
    if (!_1495)
    {
        int _1727 = _1615 + 400;
        uint _1729 = uint(int(uint(_1727) >> uint(2)));
        uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
        int _1733 = int(_1729) & 3;
        float _1735 = (*spvDescriptorSet0.vp_c15)._m0[int(_1731)][_1733];
        _1725 = _1735;
    }
    float _1737 = _1725;
    float _1739 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1717);
    float _1741 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1719);
    float _1743 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1721);
    bool _1745 = _1713 >= 0.0;
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1739);
    float _1749 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1741);
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1757 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1759 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1761 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1765 = _1713 <= 1.0;
    bool _1767 = _1765 && _1745;
    float _1769 = -_1759;
    float _1771 = fma(_1769, _1723, 1.0);
    float _1773 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1775 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1763);
    float _1777 = _226;
    float _1779 = _1755;
    float _1781 = _1751;
    if (!_1495)
    {
        float _1783 = floor(_1310);
        _1777 = _1783;
    }
    float _1785 = _1777;
    bool _1787 = _1715 >= 0.0;
    bool _1789 = _1787 && _1767;
    float _1791 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1793 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    float _1795 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1797 = _1715 <= 1.0;
    bool _1799 = _1797 && _1789;
    float _1801 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1803 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1793);
    float _1805 = log2(_1771);
    float _1807 = _1108 * _1533;
    float _1809 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1795);
    float _1811 = fma(_662, _1525, _1807);
    float _1813 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1809);
    float _1815 = 1.0 / _1803;
    float _1817 = _1809;
    if (!_1495)
    {
        float _1819 = -_1785;
        float _1821 = _1310 + _1819;
        _1817 = _1821;
    }
    float _1823 = _1817;
    if (_1799)
    {
        float _1825 = float(_1308);
        _1609 = _1825;
    }
    float _1827 = _1609;
    float _1829 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1813);
    float _1831 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1801);
    float _1833 = fma(_664, _1701, _1811);
    float _1835 = _1805 * 0.693147182464599609375;
    float _1837 = _1807;
    float _1839 = _1827;
    if (_1799)
    {
        float _1841 = rint(_1827);
        float _1843 = precise::max(_1841, 0.0);
        uint _1845 = uint(_1843);
        uint _1847 = clamp(_1845, 0u, 65535u);
        _1837 = as_type<float>(_1847);
    }
    float _1849 = _1837;
    float _1851 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1831);
    float _1853 = _1833 + _1709;
    float _1855 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1857 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1851);
    float _1859 = _1853 * _1571;
    float _1861 = _1829 * _1815;
    float _1863 = _1835;
    float _1865 = _1737;
    if (!_1495)
    {
        float _1867 = rint(_1737);
        float _1869 = precise::max(_1867, 0.0);
        uint _1871 = uint(_1869);
        uint _1873 = clamp(_1871, 0u, 65535u);
        _1863 = as_type<float>(_1873);
    }
    float _1875 = _1863;
    float _1877 = _1857 * _1815;
    if (!_1495)
    {
        float _1879 = -_1557;
        float _1881 = _1234 + _1879;
        _1839 = _1881;
    }
    float _1883 = _1839;
    float _1885 = fma(_1861, -0.5, 0.5);
    float _1887 = fma(_1877, 0.5, 0.5);
    float _1889 = _1557;
    if (_1799)
    {
        float3 _6085 = float3(_1713, _1715, float(as_type<int>(_1849)));
        float3 _6089 = select(_6085, float3(0.0), isnan(_6085));
        float _1891 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6089.xy, uint(rint(_6089.z)), _1859, level(0.0));
        _1889 = _1891;
    }
    float _1893 = _1889;
    float3 _6099 = float3(_1887, _1885, _1855);
    float _1895 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6099, float3(0.0), isnan(_6099)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6099, float3(0.0), isnan(_6099)), level(0.0)).x;
    float3 _6108 = float3(_1887, _1885, _1855);
    float4 _1898 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6108, float3(0.0), isnan(_6108)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6108, float3(0.0), isnan(_6108)), level(0.0)).xyzw;
    float _1900 = _1898.x;
    float _1902 = _1898.y;
    float _1904 = _1898.z;
    float _1906 = _1898.w;
    float _1908 = _1691;
    if (!_1495)
    {
        float3 _6131 = float3(_1883, _1823, float(as_type<int>(_1875)));
        float3 _6133 = select(_6131, float3(0.0), isnan(_6131));
        float _1910 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6133.xy, uint(rint(_6133.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6133.xy, uint(rint(_6133.z)), level(0.0)).x;
        _1908 = _1910;
    }
    float _1912 = _1908;
    if (_1495)
    {
        _1631 = 1.0;
    }
    float _1914 = _1631;
    float _1916 = _1914;
    float _1918 = _1893;
    float _1920 = _1895;
    if (!_1495)
    {
        int _1922 = int(_1543) << 4;
        int _1924 = _1922 + 2048;
        uint _1926 = uint(int(uint(_1924) >> uint(2)));
        uint _1928 = uint(int(uint(int(_1926)) >> uint(2)));
        int _1930 = int(_1926) & 3;
        float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
        int _1934 = int(_1926) + 1;
        uint _1936 = uint(int(uint(_1934) >> uint(2)));
        int _1938 = _1934 & 3;
        float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
        int _1942 = _1924 + 8;
        uint _1944 = uint(int(uint(_1942) >> uint(2)));
        uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
        int _1948 = int(_1944) & 3;
        float _1950 = (*spvDescriptorSet0.vp_c15)._m0[int(_1946)][_1948];
        int _1952 = int(_1944) + 1;
        uint _1954 = uint(int(uint(_1952) >> uint(2)));
        int _1956 = _1952 & 3;
        float _1958 = (*spvDescriptorSet0.vp_c15)._m0[int(_1954)][_1956];
        float _1960 = _1108 * _1940;
        float _1962 = fma(_662, _1932, _1960);
        float _1964 = fma(_664, _1950, _1962);
        float _1966 = _1964 + _1958;
        float _1968 = precise::clamp(_1966, 0.0, 1.0);
        float _1970 = -_1968;
        float _1972 = _1970 + _1912;
        float _1974 = fma(_1972, 500.0, 1.5);
        float _1976 = exp2(_1974);
        float _1978 = 0.0 + _1976;
        float _1980 = precise::clamp(_1978, 0.0, 1.0);
        _1916 = _1980;
    }
    float _1982 = _1916;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1986 = _1685 + _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1687 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1689 + _1992;
    float _1996 = _1986 * _1986;
    float _1998 = fma(_1990, _1990, _1996);
    float _2000 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2002 = fma(_1994, _1994, _1998);
    float _2004 = precise::max(0.0, _2000);
    float _2006 = rsqrt(_2002);
    float _2008 = sqrt(_2002);
    float _2010 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2012 = _1990 * _2010;
    float _2014 = _1994 * _2010;
    float _2016 = -_2010;
    float _2018 = -_2004;
    float _2020 = fma(_1986, _2016, _2018);
    float _2022 = _2012 * _2012;
    float _2024 = _2014 * _2014;
    float _2026 = _2022 + _2024;
    float _2028 = sqrt(_2026);
    bool _2030 = _2028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = _2028 + _2032;
    float _2036 = _664;
    float _2038 = _2004;
    float _2040 = _2026;
    float _2042 = _2034;
    float _2044 = _2010;
    float _2046 = _2012;
    float _2048 = _2014;
    float _2050 = _2022;
    float _2052 = _2024;
    float _2054 = _2020;
    bool _2056 = _2030;
    if (_2030)
    {
        float _2058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2058;
    }
    float _2060 = _2036;
    if (_2030)
    {
        float _2062 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2062;
    }
    float _2064 = _2038;
    float _2066 = _2064;
    if (_2030)
    {
        float _2068 = rsqrt(_2026);
        _2040 = _2068;
    }
    float _2070 = _2040;
    if (_2030)
    {
        float _2072 = _2034 * _2060;
        _2042 = _2072;
    }
    float _2074 = _2042;
    if (_2030)
    {
        float _2076 = _2074 * 0.15915493667125701904296875;
        _1865 = _2076;
    }
    float _2078 = _1865;
    float _2080 = _2060;
    float _2082 = _2078;
    if (_2030)
    {
        float _2084 = _2078 * 6.283185482025146484375;
        float _2086 = sin(_2084);
        _2080 = _2086;
    }
    float _2088 = _2080;
    float _2090 = _2074;
    if (_2030)
    {
        float _2092 = _2078 * 6.283185482025146484375;
        float _2094 = cos(_2092);
        _2090 = _2094;
    }
    float _2096 = _2090;
    float _2098 = _2088;
    if (_2030)
    {
        float _2100 = fma(_2088, _2064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2044 = _2100;
    }
    float _2102 = _2044;
    float _2104 = _2102;
    if (_2030)
    {
        float _2106 = _2070 * _2102;
        _2104 = _2106;
    }
    float _2108 = _2104;
    if (_2030)
    {
        float _2110 = _2096 + (-1.0);
        _2066 = _2110;
    }
    float _2112 = _2066;
    if (_2030)
    {
        float _2114 = _2012 * _2108;
        _2046 = _2114;
    }
    float _2116 = _2046;
    if (_2030)
    {
        float _2118 = _2014 * _2108;
        _2048 = _2118;
    }
    float _2120 = _2048;
    if (_2030)
    {
        float _2122 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2122;
    }
    float _2124 = _2098;
    if (_2030)
    {
        float _2126 = _2116 * _2116;
        _2050 = _2126;
    }
    float _2128 = _2050;
    if (_2030)
    {
        float _2130 = _2120 * _2120;
        _2052 = _2130;
    }
    float _2132 = _2052;
    if (_2030)
    {
        float _2134 = fma(_2020, _2096, _2124);
        _2054 = _2134;
    }
    float _2136 = _2054;
    float _2138 = fma(_2136, _2136, _2128);
    float _2140 = _2138 + _2132;
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2144 = fma(_2008, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2142);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = -_2146;
    float _2150 = _2148 + 1.0;
    float _2152 = rsqrt(_2140);
    float _2154 = abs(_2150);
    float _2156 = log2(_2154);
    float _2158 = _2152 * _2116;
    float _2160 = _2152 * _2136;
    float _2162 = _2152 * _2120;
    float _2164 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2166 = -_2164;
    float _2168 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = -_2162;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2174 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2176 = fma(_2172, -0.5, 0.5);
    float _2178 = exp2(_2174);
    float _2180 = fma(_2172, 0.5, 0.5);
    float _2182 = _2160 + 1.0;
    float _2184 = fma(_2180, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2186 = sqrt(_2176);
    float _2188 = fma(_2180, _2184, -0.212114393711090087890625);
    float _2190 = fma(_1453, 6.2500002968590706586837768554688e-05, 0.5);
    float _2192 = fma(_2180, _2188, 1.570728778839111328125);
    float _2194 = -_2160;
    float _2196 = fma(_2178, _2182, _2194);
    float _2198 = _2186 * 0.636619746685028076171875;
    float _2200 = fma(_2196, 0.5, 0.5);
    float _2202 = fma(_1425, 6.2500002968590706586837768554688e-05, 0.5);
    float _2204 = -_2192;
    float _2206 = fma(_2198, _2204, 1.0);
    float2 _6582 = float2(_2206, _2200);
    float3 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6582, float2(0.0), isnan(_6582)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6582, float2(0.0), isnan(_6582)), level(0.0)).xyz;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float2 _6596 = float2(_2202, _2190);
    float3 _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6596, float2(0.0), isnan(_6596)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6596, float2(0.0), isnan(_6596)), level(0.0)).xyz;
    float _2220 = _2218.x;
    float _2222 = _2218.y;
    float _2224 = _2218.z;
    float _2226 = in.m_73.w;
    float _2228 = -_682;
    float _2230 = _2228 + 1.0;
    float _2232 = in.m_83.x;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    float _2238 = in.m_83.y;
    bool _2240 = _696 > 0.5;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2248 = _684 > 0.5;
    out.m_85.x = _1687;
    out.m_85.y = _1685;
    out.m_85.z = _1689;
    int _2250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2252 = _2250 != 0;
    int _2254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2236)
    {
        bool _2256 = _688 > 0.5;
        _2056 = _2256;
    }
    bool _2258 = _2056;
    float _2260 = 1.0 / _2244;
    float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2264 = _638 + _2262;
    bool _2266 = _2226 > 0.5;
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2268;
    float _2272 = _2232;
    if (_2236)
    {
        float _2274 = -_2232;
        float _2276 = _2274 + 1.0;
        _2254 = as_type<int>(_2276);
    }
    int _2278 = _2254;
    if (!_2236)
    {
        _2082 = _2232;
    }
    float _2280 = _2082;
    float _2282 = -_2238;
    float _2284 = _2282 + 1.0;
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2288 = _2280;
    float _2290 = _2238;
    if (_2236)
    {
        float _2292 = _2258 ? as_type<float>(_2278) : _2232;
        _2288 = _2292;
    }
    float _2294 = _2288;
    float _2296 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2300 = _2298 != 0;
    float _2302 = _2270 * _2260;
    int _2304 = _2240 ? as_type<int>(_2284) : as_type<int>(_2238);
    int _2306 = _2266 ? as_type<int>(_2284) : as_type<int>(_2238);
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2310 = _2308 != 0;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2314 = _2312 != 0;
    float _2316 = _2300 ? as_type<float>(_2304) : _2238;
    float _2318 = _2252 ? as_type<float>(_2306) : _2238;
    float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2324 = _2322 != 0;
    float _2326 = fma(_2296, _2316, -0.5);
    float _2328 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2330 = fma(_2302, _2264, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2332 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2334 = isnan(_638);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = -_770;
    float _2346 = fma(_980, _2326, _2344);
    int _2348 = as_type<int>(_2286);
    float _2350 = _2330;
    if (_2310)
    {
        float _2352 = -_2232;
        float _2354 = _2352 + 1.0;
        _794 = as_type<int>(_2354);
    }
    int _2356 = _794;
    float _2358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2314)
    {
        float _2360 = -_2232;
        float _2362 = _2360 + 1.0;
        _2348 = as_type<int>(_2362);
    }
    int _2364 = _2348;
    float _2366 = 0.0;
    if (!_2310)
    {
        _2366 = _2232;
    }
    float _2368 = _2366;
    float _2370 = in.m_87.x;
    float _2372 = in.m_87.y;
    float _2374 = in.m_87.z;
    float _2376 = _2368;
    if (_2310)
    {
        float _2378 = _2248 ? as_type<float>(_2356) : _2232;
        _2376 = _2378;
    }
    float _2380 = _2376;
    float _2382 = fma(_2318, _2328, -0.5);
    if (_2324)
    {
        float _2384 = _2248 ? _2284 : _2238;
        _2290 = _2384;
    }
    float _2386 = _2290;
    float _2388 = -_2342;
    float _2390 = _2388 + 1.0;
    if (_2314)
    {
        float _2392 = _2240 ? as_type<float>(_2364) : _2232;
        _2272 = _2392;
    }
    float _2394 = _2272;
    float _2396 = -_924;
    float _2398 = fma(_826, _2382, _2396);
    float _2400 = in.m_89.x;
    float _2402 = in.m_89.y;
    float _2404 = in.m_89.z;
    float _2406 = in.m_89.w;
    bool _2408 = _1044 != 0.0;
    bool _2410 = isnan(_1044);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan(0.0);
    bool _2416 = _2412 || _2414;
    float _2418 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2420 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2422 = isnan(_638);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2434 = _1042 == 0.0;
    bool _2436 = !_2416;
    bool _2438 = _2434 && _2436;
    float _2440 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2442 = fma(_2418, _2294, -0.5);
    float _2444 = _2430 * _2390;
    bool _2446 = _1046 == 0.0;
    bool _2448 = _2446 && _2438;
    float _2450 = fma(_2440, _2380, -0.5);
    float _2452 = -_2430;
    float _2454 = _2452 + 1.0;
    float _2456 = _2330 * _2444;
    float _2458 = fma(_940, _2442, _768);
    float _2460 = fma(_874, _2450, _884);
    float _2462 = _2394 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2464 = abs(_1244);
    float _2466 = log2(_2464);
    float _2468 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2456);
    float _2470 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2468);
    float _2472 = _2456;
    float _2474 = _2430;
    if (_2448)
    {
        _2350 = _2370;
    }
    float _2476 = _2350;
    float _2478 = _2476;
    if (!_2448)
    {
        float _2480 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2370);
        _2478 = _2480;
    }
    float _2482 = _2478;
    float _2484 = _2402 * _2374;
    if (_2448)
    {
        _2472 = _2372;
    }
    float _2486 = _2472;
    float _2488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2490 = _2486;
    if (_2448)
    {
        _2474 = _2374;
    }
    float _2492 = _2474;
    float _2494 = _2492;
    if (!_2448)
    {
        float _2496 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2372);
        _2490 = _2496;
    }
    float _2498 = _2490;
    if (!_2448)
    {
        float _2500 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2374);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = _2400 * _2372;
    float _2506 = -_2484;
    float _2508 = fma(_2404, _2372, _2506);
    float _2510 = _2346 + 0.5;
    float _2512 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2514 = _2404 * _2370;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2520 = _2398 + 0.5;
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2524 = exp2(_2512);
    float _2526 = -_2514;
    float _2528 = fma(_2400, _2374, _2526);
    float _2530 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2532 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2534 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2536 = _2470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2538 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2540 = -_2504;
    float _2542 = fma(_2402, _2370, _2540);
    float _2544 = _2462 * _2488;
    float _2546 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_91.x = _2530;
    out.m_91.y = _2532;
    out.m_91.z = _2534;
    out.m_91.w = _2536;
    float _2548 = _2538 * _2432;
    float _2550 = _2458 + 0.5;
    float _2552 = _2528 * _2406;
    float _2554 = _2508 * _2406;
    float _2556 = -_1102;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2546);
    out.m_93.x = _2544;
    out.m_93.y = _2548;
    float _2560 = _2460 + 0.5;
    float _2562 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2564 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2558);
    bool _2566 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2568 = isnan(0.5);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2574 = _2570 || _2572;
    out.m_95.x = _2550;
    out.m_95.y = _2510;
    out.m_95.z = _2560;
    out.m_95.w = _2520;
    float _2576 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2578 = _2542 * _2406;
    float _2580 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2582 = -_1102;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2576);
    float _2586 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2588 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2590 = -_1102;
    float _2592 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2580);
    float _2594 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2586);
    float _2600 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2588);
    float _2602 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2562);
    float _2604 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2584);
    float _2610 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2612 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2614 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2598);
    float _2616 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2600);
    float _2618 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2602);
    float _2620 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2622 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2624 = _2608 * _2402;
    float _2626 = _2564 * _2402;
    float _2628 = _2608 * _2498;
    float _2630 = _2552 * _2608;
    float _2632 = _2564 * _2498;
    float _2634 = fma(_2596, -2.0, 3.0);
    float _2636 = _2596 * _2596;
    float _2638 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2610);
    float _2640 = _2552 * _2564;
    float _2642 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2644 = _2620 * _2402;
    float _2646 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2622);
    float _2648 = fma(_2614, _2482, _2628);
    float _2650 = fma(_2616, _2400, _2626);
    float _2652 = fma(_2614, _2400, _2624);
    float _2654 = fma(_2554, _2614, _2630);
    float _2656 = fma(_2616, _2482, _2632);
    float _2658 = fma(_2554, _2616, _2640);
    float _2660 = fma(_2618, _2400, _2644);
    float _2662 = fma(_2646, _2404, _2650);
    float _2664 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2666 = fma(_2642, _2404, _2652);
    float _2668 = fma(_2578, _2642, _2654);
    float _2670 = fma(_2642, _2502, _2648);
    float _2672 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2674 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2664);
    float _2676 = _2620 * _2498;
    float _2678 = _2552 * _2620;
    float _2680 = exp2(_2672);
    float _2682 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2638);
    float _2684 = _2636 * _2634;
    float _2686 = fma(_2618, _2482, _2676);
    float _2688 = fma(_2554, _2618, _2678);
    float _2690 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2674);
    float _2692 = fma(_2682, _2404, _2660);
    float _2694 = fma(_2578, _2646, _2658);
    float _2696 = -_2684;
    float _2698 = _2696 + 1.0;
    float _2700 = fma(_2646, _2502, _2656);
    float _2702 = fma(_2682, _2502, _2686);
    float _2704 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2690);
    bool _2706 = _1244 <= 8000.0;
    bool _2708 = isnan(_1244);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan(8000.0);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2684);
    float _2720 = fma(_2578, _2682, _2688);
    float _2722 = _2690;
    float _2724 = _2716;
    if (!_2574)
    {
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2728 = _1244 + _2726;
        _2722 = _2728;
    }
    float _2730 = _2722;
    float _2732 = _1803 * 0.5;
    float _2734 = _2716 * _2718;
    float _2736 = -_2680;
    float _2738 = _2736 + 1.0;
    out.m_97.x = _2668;
    out.m_97.y = _2694;
    out.m_97.z = _2720;
    float _2740 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2574)
    {
        _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2742 = _1779;
    out.m_99.x = _2666;
    out.m_99.y = _2662;
    out.m_99.z = _2692;
    float _2744 = _2230 * _2740;
    float _2746 = precise::clamp(_2744, 0.0, 1.0);
    float _2748 = _2742;
    float _2750 = _2746;
    if (!_2574)
    {
        float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2754 = _2742 + _2752;
        _2748 = _2754;
    }
    float _2756 = _2748;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1829;
    out.gl_Position.z = _2704;
    out.gl_Position.w = _1803;
    if (!_1799)
    {
        _2724 = 1.0;
    }
    float _2758 = _2724;
    float _2760 = _2704 + _1803;
    float _2762 = _1857 + _1803;
    float _2764 = fma(_1829, -0.5, _2732);
    float _2766 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2768 = _2760 * 0.5;
    float _2770 = _2762 * 0.5;
    float _2772 = _2624;
    float _2774 = _2758;
    if (!_2574)
    {
        float _2776 = 1.0 / _2756;
        _2772 = _2776;
    }
    float _2778 = _2772;
    float _2780 = _2766 * _1895;
    float _2782 = -_2766;
    float _2784 = _2782 + 1.0;
    out.m_101.x = _2670;
    out.m_101.y = _2700;
    out.m_101.z = _2702;
    float _2786 = _2784;
    if (_1799)
    {
        bool _2788 = _1893 >= _1859;
        bool _2790 = isnan(_1893);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan(_1859);
        bool _2796 = _2792 || _2794;
        float _2798 = float(_2796);
        _2774 = _2798;
    }
    float _2800 = _2774;
    bool _2802 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2804 = isnan(_2008);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2810 = _2806 || _2808;
    out.m_103.x = _2770;
    out.m_103.y = _2764;
    out.m_103.z = _2768;
    out.m_103.w = _1803;
    if (_2574)
    {
        _1781 = 1.0;
    }
    float _2812 = _1781;
    float _2814 = _2800 * _1982;
    out.m_105.x = 1.0;
    out.m_105.y = 1.0;
    out.m_105.z = 1.0;
    float _2816 = _2812;
    if (!_2574)
    {
        float _2818 = _2730 * _2778;
        float _2820 = precise::clamp(_2818, 0.0, 1.0);
        _2816 = _2820;
    }
    float _2822 = _2816;
    if (!_2810)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2824 = _1918;
    float _2826 = _1906 * _2780;
    float _2828 = _1906 * _2784;
    float _2830 = -_2746;
    float _2832 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2834 = _2824;
    float _2836 = _2824;
    if (!_2810)
    {
        _2750 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2838 = _2750;
    float _2840 = _2838;
    float _2842 = _2838;
    if (!_2810)
    {
        _1920 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2844 = _1920;
    float _2846 = -_2814;
    float _2848 = fma(_2846, _2832, 1.0);
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2850;
    float _2854 = _2844;
    float _2856 = _2844;
    if (!_2810)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2858 = _2786;
    float _2860 = _2216 * _2780;
    float _2862 = fma(_2212, _2826, _1900);
    float _2864 = fma(_2214, _2826, _1902);
    out.m_107.x = _2220;
    out.m_107.y = _2222;
    out.m_107.z = _2224;
    float _2866 = fma(_1906, _2860, _1904);
    float _2868 = _2850 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2870 = _2822 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2872 = _2868;
    float _2874 = _2858;
    float _2876 = _2858;
    if (!_2810)
    {
        _2852 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2878 = _2852;
    out.m_109.x = _2862;
    out.m_109.y = _2864;
    out.m_109.z = _2866;
    out.m_109.w = _2828;
    out.m_111.x = _2868;
    float _2880 = _2878;
    float _2882 = _2878;
    if (!_2810)
    {
        _2872 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2884 = _2872;
    bool _2886 = !_2810;
    float _2888 = _2884;
    float _2890 = _2884;
    if (!_2886)
    {
        bool _2892 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2894 = isnan(_2008);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2900 = _2896 || _2898;
        if (!_2900)
        {
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2904 = _2008 + _2902;
            float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2908 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2906;
            float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2914 = 1.0 / _2908;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2932 = _2904 * _2914;
            float _2934 = precise::clamp(_2932, 0.0, 1.0);
            float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2940 = fma(_2934, _2912, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2942 = fma(_2934, _2938, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2944 = fma(_2934, _2918, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2946 = fma(_2934, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2948 = fma(_2934, _2926, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2950 = fma(_2934, _2930, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2842 = _2940;
            _2876 = _2948;
            _2836 = _2944;
            _2856 = _2946;
            _2882 = _2942;
            _2890 = _2950;
            _2952 = true;
        }
        else
        {
            bool _2954 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2956 = isnan(_2008);
            bool _2958 = _2954 || _2956;
            bool _2960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2962 = _2958 || _2960;
            if (!_2962)
            {
                _2834 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2964 = _2834;
            _2836 = _2964;
            if (!_2962)
            {
                _2840 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2966 = _2840;
            _2842 = _2966;
            if (!_2962)
            {
                _2880 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2968 = _2880;
            _2882 = _2968;
            if (!_2962)
            {
                _2854 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2970 = _2854;
            _2856 = _2970;
            if (!_2962)
            {
                _2874 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2972 = _2874;
            _2876 = _2972;
            if (!_2962)
            {
                _2888 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2974 = _2888;
            bool _2976 = !_2962;
            _2890 = _2974;
            if (!_2976)
            {
                bool _2978 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2980 = isnan(_2008);
                bool _2982 = _2978 || _2980;
                bool _2984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2986 = _2982 || _2984;
                if (!_2986)
                {
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2990 = _2008 + _2988;
                    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2994 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2992;
                    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3000 = 1.0 / _2994;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3018 = _2990 * _3000;
                    float _3020 = precise::clamp(_3018, 0.0, 1.0);
                    float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3026 = fma(_3020, _2998, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3028 = fma(_3020, _3024, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3030 = fma(_3020, _3004, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3032 = fma(_3020, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3034 = fma(_3020, _3012, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3036 = fma(_3020, _3016, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2842 = _3026;
                    _2876 = _3034;
                    _2836 = _3030;
                    _2856 = _3032;
                    _2882 = _3028;
                    _2890 = _3036;
                    _2952 = true;
                }
                else
                {
                    _2842 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2876 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2836 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2856 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2882 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2890 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2952 = false;
    float _3038 = _2842;
    float _3040 = _2876;
    float _3042 = _2836;
    float _3044 = _2856;
    float _3046 = _2882;
    float _3048 = _2890;
    float _3050 = fma(_2700, -0.5, 0.5);
    float _3052 = precise::clamp(_3050, 0.0, 1.0);
    float _3054 = -_3038;
    float _3056 = _3054 + _3040;
    float _3058 = _2870 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3060 = -_3042;
    float _3062 = _3060 + _3044;
    out.m_113.x = 0.0;
    float _3064 = fma(_3052, _3056, _3038);
    float _3066 = fma(_3052, _3062, _3042);
    out.m_61.x = _3058;
    float _3068 = -_3046;
    float _3070 = _3068 + _3048;
    float _3072 = _3064 * 0.586610972881317138671875;
    bool _3074 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3076 = fma(_3052, _3070, _3046);
    float _3078 = fma(_3066, 0.298911988735198974609375, _3072);
    bool _3080 = _2822 > 0.0;
    bool _3082 = isnan(_2822);
    bool _3084 = _3080 || _3082;
    bool _3086 = isnan(0.0);
    bool _3088 = _3084 || _3086;
    float _3090 = fma(_3076, 0.114477999508380889892578125, _3078);
    float _3092 = -_3090;
    float _3094 = _3064 + _3092;
    float _3096 = -_3090;
    float _3098 = _3066 + _3096;
    float _3100 = -_3090;
    float _3102 = _3076 + _3100;
    float _3104 = fma(_3094, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    float _3106 = fma(_3098, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    float _3108 = fma(_3102, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    bool _3110 = !_3074;
    if (!_3110)
    {
        float _3112 = -_1685;
        float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3116 = -_1687;
        float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3120 = -_1689;
        float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3124 = _3114 * _3114;
        float _3126 = fma(_3118, _3118, _3124);
        float _3128 = fma(_3122, _3122, _3126);
        float _3130 = sqrt(_3128);
        float _3132 = rsqrt(_3128);
        float _3134 = -_3130;
        float _3136 = _3134 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3138 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3140 = precise::clamp(_3138, 0.0, 1.0);
        float _3142 = _3118 * _3132;
        float _3144 = _3114 * _3132;
        float _3146 = abs(_3140);
        float _3148 = log2(_3146);
        float _3150 = _3122 * _3132;
        float _3152 = _3142 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3154 = _2700 * _3144;
        float _3156 = -_3144;
        float _3158 = -_3152;
        float _3160 = fma(_3156, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3158);
        float _3162 = fma(_2670, _3142, _3154);
        float _3164 = -_3150;
        float _3166 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3160);
        float _3168 = fma(_2702, _3150, _3162);
        float _3170 = precise::clamp(_3168, 0.0, 1.0);
        float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3174 = _3166 + _3172;
        float _3176 = _3148 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3178 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        float _3182 = exp2(_3176);
        float _3184 = _3182 * _3180;
        float _3186 = _3170 * _3184;
        float _3188 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3190 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3192 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _3188;
        out.m_113.y = _3190;
        out.m_113.z = _3192;
    }
    out.m_115.x = _3106;
    out.m_115.y = _3104;
    out.m_115.z = _3108;
    if (_3088)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3194 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3194;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2952 = false;
    bool _630 = false;
    bool _476 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_58.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_61.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3251 = as_type<float>(_150);
        out.gl_Position.z = _3251;
    }
    if (!_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_63.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_61.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_188);
        out.gl_Position.z = _3321;
    }
    if (_180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _190 = in.m_65.x;
    float _192 = in.m_65.y;
    float _194 = in.m_65.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_67.x;
    float _200 = in.m_67.y;
    float _202 = in.m_67.z;
    float _204 = in.m_69.x;
    float _206 = in.m_69.y;
    float _208 = in.m_69.z;
    float _210 = in.m_71.x;
    float _212 = in.m_71.y;
    float _214 = in.m_71.z;
    float _216 = _192 * _200;
    float _218 = _192 * _206;
    float _220 = fma(_190, _198, _216);
    float _222 = _192 * _212;
    float _224 = fma(_190, _204, _218);
    float _226 = fma(_194, _202, _220);
    float _228 = fma(_190, _210, _222);
    float _230 = fma(_194, _208, _224);
    float _232 = fma(_194, _214, _228);
    bool _234 = !_196;
    float _252;
    if (!_234)
    {
        float _236 = in.m_73.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        float _256 = float(_134);
        float _258 = 1.0 / _256;
        float _260 = _168 * _258;
        _252 = _260;
    }
    _254 = false;
    float _262 = _252;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = _262 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _284;
    float _288 = 1.0 / _282;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _292 = 1.0 / _286;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _294;
    float _298 = 1.0 / _278;
    float _300 = _266 * _288;
    bool _302 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _316 = isnan(_262);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = _270 * _292;
    bool _328 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _330 = isnan(_262);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_312;
    float _342 = _340 + 1.0;
    float _344 = _338 * _342;
    bool _346 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _348 = isnan(_262);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = _274 * _298;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _364;
    float _368 = -_338;
    float _370 = _368 + 1.0;
    float _372 = fma(_296, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _374 = fma(_362, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_366, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -_324;
    float _380 = _378 + 1.0;
    float _382 = _324 * _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = _356 * _380;
    float _394 = -_356;
    float _396 = _394 + 1.0;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = _374 * _392;
    float _404 = _376 * _392;
    float _406 = _372 * _392;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _412 = fma(_400, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_386, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_390, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_412, _382, _408);
    float _434 = fma(_416, _326, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_426, _326, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_430, _326, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _440 = fma(_418, _382, _410);
    float _442 = fma(_420, _382, _422);
    float _444 = fma(_436, _344, _432);
    float _446 = fma(_434, _344, _440);
    float _448 = fma(_438, _344, _442);
    float _450 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].x, _444);
    float _452 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].y, _446);
    float _454 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[146].z, _448);
    bool _456 = !_290;
    float _474;
    if (!_456)
    {
        float _458 = in.m_73.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_134);
        float _480 = 1.0 / _478;
        float _482 = _168 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _488 = _484 + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _494 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = isnan(_484);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _512 = isnan(_484);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _522;
    bool _526 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = isnan(_484);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = 1.0 / _492;
    float _540 = -_504;
    float _542 = _540 + 1.0;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _484 + _544;
    bool _548 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _550 = 1.0 / _508;
    float _552 = _524 * _538;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = -_536;
    float _560 = _558 + 1.0;
    float _562 = fma(_552, _488, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _564 = _520 * _542;
    float _566 = -_520;
    float _568 = _566 + 1.0;
    float _570 = _504 * _560;
    float _572 = _556 * _550;
    float _574 = _562 * _564;
    float _576 = fma(_572, _546, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _582 = fma(_576, _570, _578);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = in.m_75.x;
    float _596 = in.m_75.y;
    float _598 = in.m_75.z;
    float _600 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_77.x = _592;
    out.m_77.y = _602;
    out.m_77.z = _586;
    out.m_77.w = _600;
    float _604 = _454 * _598;
    float _606 = _452 * _596;
    float _608 = _450 * _594;
    bool _610 = !_548;
    float _628;
    if (!_610)
    {
        float _612 = in.m_73.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_134);
        float _634 = 1.0 / _632;
        float _636 = _168 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = in.m_58.x;
    float _642 = in.m_58.y;
    float _644 = in.m_58.z;
    float _646 = in.m_67.w;
    float _648 = in.m_71.w;
    float _650 = _200 * _642;
    float _652 = _212 * _642;
    float _654 = fma(_198, _640, _650);
    float _656 = fma(_210, _640, _652);
    float _658 = fma(_202, _644, _654);
    float _660 = fma(_214, _644, _656);
    float _662 = _658 + _646;
    float _664 = _660 + _648;
    float _666 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _668 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _670 = floor(_666);
    float _672 = floor(_668);
    float _674 = -_670;
    float _676 = _666 + _674;
    float _678 = -_672;
    float _680 = _668 + _678;
    float2 _4115 = float2(_676, _680);
    float _682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4115, float2(0.0), isnan(_4115)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4115, float2(0.0), isnan(_4115)), level(0.0)).x;
    float _684 = in.m_73.z;
    float _686 = _206 * _642;
    float _688 = in.m_73.x;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _692 = _690 != 0;
    float _694 = fma(_204, _640, _686);
    float _696 = in.m_73.y;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _700 = _698 != 0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _704 = _702 != 0;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _708 = _706 != 0;
    float _710 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _714 = !_700;
    int _716 = _714 ? 0 : 1;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _720 = abs(_716);
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _724 = _684 * 2.0;
    float _726 = _688 * 2.0;
    float _728 = _688 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _730 = floor(_724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _734 = _696 * 2.0;
    float _736 = _696 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _738 = -_718;
    float _740 = fma(_728, 2.0, _738);
    float _742 = _688 + _696;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _746 = 1.0 + _744;
    float _748 = fma(_736, -2.0, _712);
    float _750 = floor(_726);
    float _752 = _736;
    float _754 = _726;
    int _756 = 2;
    if (!_692)
    {
        _752 = _684;
    }
    float _758 = _752;
    float _760 = _742 + (-1.0);
    float _762 = _758;
    if (_692)
    {
        _762 = _696;
    }
    float _764 = _762;
    float _766 = -_168;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _740);
    float _770 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _748);
    float _772 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _774 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _776 = floor(_734);
    bool _778 = _730 > 0.0;
    float _780 = _764 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _782 = _730 >= 0.0;
    bool _784 = isnan(_730);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    float _792 = _730;
    int _794 = as_type<int>(_770);
    if (!_692)
    {
        _754 = _696;
    }
    float _796 = _754;
    float _798 = _796;
    if (!_692)
    {
        _792 = _684;
    }
    float _800 = _792;
    float _802 = 1.0 / _746;
    float _804 = _800;
    if (_692)
    {
        _798 = _688;
    }
    float _806 = _798;
    if (_692)
    {
        _804 = _696;
    }
    float _808 = _804;
    bool _810 = _750 > 0.0;
    bool _812 = _750 >= 0.0;
    bool _814 = isnan(_750);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    float _822 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _732);
    int _824 = _790 ? 0 : 1;
    float _826 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _822);
    bool _828 = _776 > 0.0;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _832 = _776 >= 0.0;
    bool _834 = isnan(_776);
    bool _836 = _832 || _834;
    bool _838 = isnan(0.0);
    bool _840 = _836 || _838;
    float _842 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _844 = log2(_842);
    float _846 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    float _848 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _850 = ~_824;
    int _852 = _850 + 1;
    int _854 = _852 + 1;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _858 = _854;
    if (!_778)
    {
        int _860 = ~_824;
        int _862 = _860 + 1;
        _858 = _862;
    }
    int _864 = _858;
    float _866 = -_722;
    float _868 = fma(_848, 2.0, _866);
    float _870 = fma(_780, -2.0, _856);
    float _872 = float(_864);
    float _874 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    float _876 = float(_720);
    float _878 = _688 + (-0.5);
    int _880 = _840 ? 0 : 1;
    float _882 = -_168;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[81].x, _868);
    float _886 = _844 * _168;
    float _888 = _876 * _872;
    int _890 = ~_880;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = in.m_79.x;
    float _898 = in.m_79.y;
    float _900 = in.m_79.z;
    int _902 = _894;
    if (!_828)
    {
        int _904 = ~_880;
        int _906 = _904 + 1;
        _902 = _906;
    }
    int _908 = _902;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _912 = exp2(_886);
    int _914 = _820 ? 0 : 1;
    float _916 = _888 * (-2.0);
    float _918 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    bool _920 = !_704;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _870);
    int _926 = ~_914;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _930;
    if (!_810)
    {
        int _934 = ~_914;
        int _936 = _934 + 1;
        _932 = _936;
    }
    int _938 = _932;
    float _940 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    bool _942 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _944 = isnan(1.0);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _950 = _946 || _948;
    int _952 = abs(_922);
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _956 = -_912;
    float _958 = _956 + 1.0;
    bool _960 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _968 = _964 || _966;
    float _970 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[78].w, _954);
    bool _972 = !_708;
    int _974 = _972 ? 0 : 1;
    float _976 = fma(_916, _896, _896);
    float _978 = float(_952);
    float _980 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _970);
    float _982 = float(_938);
    float _984 = fma(_772, _916, _772);
    float _986 = _968 ? _958 : 0.0;
    float _988 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    int _990 = abs(_974);
    float _992 = _978 * _982;
    float _994 = _696 + _684;
    if (_950)
    {
        float _996 = _986 * _802;
        _170 = _996;
    }
    float _998 = _170;
    float _1000 = _992 * (-2.0);
    float _1002 = fma(_984, _998, _988);
    float _1004 = _994 + (-1.0);
    float _1006 = float(_990);
    float _1008 = fma(_1000, _898, _898);
    float _1010 = float(_908);
    float _1012 = _696 + (-0.5);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1016 = _688 + _684;
    float _1018 = _1002 * 0.15915493667125701904296875;
    float _1020 = _1006 * _1010;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1008);
    float _1024 = fma(_1014, _1000, _1014);
    float _1026 = _1016 + (-1.0);
    float _1028 = _1020 * (-2.0);
    float _1030 = _1018 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(_1024, _998, _1022);
    float _1036 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1038 = fma(_1028, _900, _900);
    float _1040 = _684 + (-0.5);
    float _1042 = in.m_81.x;
    float _1044 = in.m_81.y;
    float _1046 = in.m_81.z;
    float _1048 = fma(_1036, _1028, _1036);
    float _1050 = _1034 * 0.15915493667125701904296875;
    float _1052 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1038);
    float _1054 = _1018 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1060 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1062 = fma(_1048, _998, _1052);
    float _1064 = in.m_69.w;
    float _1066 = _1062 * 0.15915493667125701904296875;
    float _1068 = _1050 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_208, _644, _694);
    float _1074 = _1050 * 6.283185482025146484375;
    float _1076 = cos(_1074);
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1042);
    float _1080 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1044);
    float _1082 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1046);
    float _1084 = _1066 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = _1078 * _1058;
    float _1090 = _1080 * _1060;
    float _1092 = _1032 * _1070;
    float _1094 = _1056 * _1070;
    float _1096 = _1082 * _710;
    float _1098 = _1072 + _1064;
    float _1100 = _1066 * 6.283185482025146484375;
    float _1102 = sin(_1100);
    float _1104 = _1056 * _1076;
    float _1106 = _1032 * _1076;
    float _1108 = _1098 + _774;
    float _1110 = _1056 * _1086;
    float _1112 = _1076 * _1086;
    float _1114 = _1032 * _1086;
    float _1116 = _1070 * _1086;
    float _1118 = _1110 * _1090;
    float _1120 = fma(_1102, _1104, _1092);
    float _1122 = -_1090;
    float _1124 = _1102 * _1122;
    float _1126 = -_1106;
    float _1128 = fma(_1102, _1094, _1126);
    float _1130 = -_1094;
    float _1132 = fma(_1102, _1106, _1130);
    float _1134 = fma(_1120, _1088, _1118);
    float _1136 = _1114 * _1090;
    float _1138 = fma(_1112, _1088, _1124);
    float _1140 = fma(_1102, _1092, _1104);
    float _1142 = fma(_1128, _1096, _1134);
    float _1144 = fma(_1132, _1088, _1136);
    float _1146 = fma(_1116, _1096, _1138);
    float _1148 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1150 = fma(_1140, _1096, _1144);
    float _1152 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1154 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1156 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1148);
    float _1158 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1160 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1152);
    float _1162 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1164 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1156);
    float _1166 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1158);
    float _1168 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1160);
    float _1170 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1162);
    float _1172 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1174 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1166);
    float _1176 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1178 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1170);
    float _1180 = _664 + _1172;
    float _1182 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1184 = _662 + _1176;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1190 = _1180 + _1188;
    float _1192 = 1.0 / _1182;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1196 = _1184 + _1194;
    float _1198 = _1186 + _1182;
    float _1200 = _1190 * _1190;
    float _1202 = fma(_1146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1154);
    float _1204 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1206 = fma(_1196, _1196, _1200);
    float _1208 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1202);
    float _1210 = sqrt(_1206);
    float _1212 = _1198 * _1192;
    float _1214 = _1212 * 0.5;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1218 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1216);
    float _1220 = _1108 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1222 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1220);
    float _1224 = 1.0 / _1218;
    bool _1226 = _1210 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1210 + _1228;
    float _1232 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1222);
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1236 = _1208 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1238 = trunc(_1234);
    int _1240 = int(_1238);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1244 = _1224 * _1242;
    float _1246 = _1192;
    float _1248 = _1224;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1252 = _1070;
    float _1254 = _1184;
    float _1256 = _1180;
    if (_1226)
    {
        float _1258 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1258;
    }
    float _1260 = _1246;
    bool _1262 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1264 = _1244 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1266 = 0.0;
    if (_1226)
    {
        float _1268 = rsqrt(_1206);
        _1266 = _1268;
    }
    float _1270 = _1266;
    if (!_1262)
    {
        _756 = 1;
    }
    int _1272 = _756;
    int _1274 = _1272;
    if (_1226)
    {
        float _1276 = _1230 * _1260;
        _1248 = _1276;
    }
    float _1278 = _1248;
    float _1280 = fma(_662, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1204);
    float _1282 = _1098 + _1236;
    float _1284 = _1282;
    if (_1226)
    {
        float _1286 = _1278 * 0.15915493667125701904296875;
        _1250 = _1286;
    }
    float _1288 = _1250;
    bool _1290 = !_1262;
    int _1292 = _1290 ? 0 : 1;
    float _1294 = fma(_664, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1280);
    if (_1226)
    {
        float _1296 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1296;
    }
    float _1298 = _1252;
    float _1300 = 0.0;
    if (_1226)
    {
        float _1302 = _1288 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    if (!_1264)
    {
        _1274 = _1292;
    }
    int _1308 = _1274;
    float _1310 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1312 = _1308 << 6;
    float _1314 = _1056;
    if (_1226)
    {
        float _1316 = _1288 * 6.283185482025146484375;
        float _1318 = sin(_1316);
        _1314 = _1318;
    }
    float _1320 = _1314;
    int _1322 = _1312 + 96;
    uint _1325 = uint(int(uint(_1322) >> uint(2)));
    uint _1327 = uint(int(uint(int(_1325)) >> uint(2)));
    int _1329 = int(_1325) & 3;
    float _1331 = (*spvDescriptorSet0.vp_c15)._m0[int(_1327)][_1329];
    int _1333 = int(_1325) + 1;
    uint _1335 = uint(int(uint(_1333) >> uint(2)));
    int _1337 = _1333 & 3;
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[int(_1335)][_1337];
    float _1341 = trunc(_1310);
    int _1343 = int(_1341);
    int _1345 = _1312 + 104;
    uint _1347 = uint(int(uint(_1345) >> uint(2)));
    uint _1349 = uint(int(uint(int(_1347)) >> uint(2)));
    int _1351 = int(_1347) & 3;
    float _1353 = (*spvDescriptorSet0.vp_c15)._m0[int(_1349)][_1351];
    int _1355 = int(_1347) + 1;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    int _1359 = _1355 & 3;
    float _1361 = (*spvDescriptorSet0.vp_c15)._m0[int(_1357)][_1359];
    float _1363 = 0.0;
    if (_1226)
    {
        float _1365 = _1306 + (-1.0);
        _1363 = _1365;
    }
    float _1367 = _1363;
    float _1369 = _1367;
    if (_1226)
    {
        float _1371 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1369 = _1371;
    }
    float _1373 = _1369;
    float _1375 = 0.0;
    if (_1226)
    {
        float _1377 = fma(_1320, _1298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1375 = _1377;
    }
    float _1379 = _1375;
    int _1381 = _1312 + 48;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    float _1399 = _1379;
    if (_1226)
    {
        float _1401 = fma(_1282, _1306, _1373);
        _1284 = _1401;
    }
    float _1403 = _1284;
    int _1405 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1407 = _1240 + _1405;
    int _1409 = _1407 + 1;
    uint _1411 = uint(_1409);
    if (_1226)
    {
        float _1413 = _1270 * _1379;
        _1399 = _1413;
    }
    float _1415 = _1399;
    float _1417 = -_1098;
    float _1419 = _1417 + _1403;
    bool _1421 = _1409 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1226)
    {
        float _1423 = fma(_1196, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1254 = _1423;
    }
    float _1425 = _1254;
    int _1427 = _1312 + 64;
    uint _1429 = uint(int(uint(_1427) >> uint(2)));
    uint _1431 = uint(int(uint(int(_1429)) >> uint(2)));
    int _1433 = int(_1429) & 3;
    float _1435 = (*spvDescriptorSet0.vp_c15)._m0[int(_1431)][_1433];
    int _1437 = int(_1429) + 1;
    uint _1439 = uint(int(uint(_1437) >> uint(2)));
    int _1441 = _1437 & 3;
    float _1443 = (*spvDescriptorSet0.vp_c15)._m0[int(_1439)][_1441];
    int _1445 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1447 = _1343 + _1445;
    int _1449 = _1447 + 1;
    if (_1226)
    {
        float _1451 = fma(_1190, _1415, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1256 = _1451;
    }
    float _1453 = _1256;
    float _1455 = -_662;
    float _1457 = _1455 + _1425;
    float _1459 = _1419 * _1419;
    int _1461 = _1409 | _1449;
    float _1463 = -_664;
    float _1465 = _1463 + _1453;
    int _1467 = _1312 + 56;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    uint _1471 = uint(int(uint(int(_1469)) >> uint(2)));
    int _1473 = int(_1469) & 3;
    float _1475 = (*spvDescriptorSet0.vp_c15)._m0[int(_1471)][_1473];
    int _1477 = int(_1469) + 1;
    uint _1479 = uint(int(uint(_1477) >> uint(2)));
    int _1481 = _1477 & 3;
    float _1483 = (*spvDescriptorSet0.vp_c15)._m0[int(_1479)][_1481];
    float _1485 = fma(_1457, _1457, _1459);
    bool _1487 = _1461 < 0;
    bool _1489 = _1487 || _1421;
    float _1491 = fma(_1465, _1465, _1485);
    bool _1493 = _1449 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1495 = _1493 || _1489;
    int _1497 = _1312 + 72;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c15)._m0[int(_1509)][_1511];
    float _1515 = sqrt(_1491);
    int _1517 = _1312 + 80;
    uint _1519 = uint(int(uint(_1517) >> uint(2)));
    uint _1521 = uint(int(uint(int(_1519)) >> uint(2)));
    int _1523 = int(_1519) & 3;
    float _1525 = (*spvDescriptorSet0.vp_c15)._m0[int(_1521)][_1523];
    int _1527 = int(_1519) + 1;
    uint _1529 = uint(int(uint(_1527) >> uint(2)));
    int _1531 = _1527 & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    float _1535 = _1108 * _1339;
    float _1537 = _1491;
    if (!_1495)
    {
        int _1539 = _1449 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1541 = _1539 + _1409;
        _1411 = uint(_1541);
    }
    uint _1543 = _1411;
    float _1545 = fma(_662, _1331, _1535);
    float _1547 = fma(_664, _1353, _1545);
    bool _1549 = _1515 > 0.0;
    float _1551 = _1545;
    float _1553 = _1515;
    if (!_1495)
    {
        float _1555 = floor(_1234);
        _1551 = _1555;
    }
    float _1557 = _1551;
    float _1559 = _1547 + _1361;
    float _1561 = _1108 * _1397;
    int _1563 = as_type<int>(_1397);
    if (!_1495)
    {
        uint _1565 = uint(int(uint(int(_1543)) >> uint(2)));
        _1563 = int(_1565);
    }
    int _1567 = _1563;
    float _1569 = fma(_662, _1389, _1561);
    float _1571 = 1.0 / _1559;
    int _1573 = _1567;
    if (!_1549)
    {
        _1553 = _1453;
    }
    float _1575 = _1553;
    float _1577 = _1108 * _1443;
    int _1579 = as_type<int>(_1443);
    int _1581 = as_type<int>(_1577);
    float _1583 = _1435;
    float _1585 = _1575;
    float _1587 = _1575;
    if (!_1495)
    {
        int _1589 = int(_1543) << 2;
        _1579 = _1589;
    }
    int _1591 = _1579;
    float _1593 = fma(_662, _1435, _1577);
    float _1595 = as_type<float>(_1591);
    if (!_1495)
    {
        int _1597 = 12 & _1591;
        _1581 = _1597;
    }
    int _1599 = _1581;
    if (!_1549)
    {
        _1583 = _1425;
    }
    float _1601 = _1583;
    float _1603 = fma(_664, _1475, _1569);
    float _1605 = _1601;
    float _1607 = _1601;
    float _1609 = _1533;
    if (!_1495)
    {
        int _1611 = _1567 << 4;
        int _1613 = _1611 + _1599;
        _1573 = _1613;
    }
    int _1615 = _1573;
    if (!_1549)
    {
        _1595 = _1403;
    }
    float _1617 = _1595;
    float _1619 = _1603 + _1483;
    float _1621 = fma(_664, _1505, _1593);
    float _1623 = _1621 + _1513;
    bool _1625 = !_1549;
    float _1627 = _1617;
    float _1629 = _1617;
    float _1631 = _1571;
    if (!_1625)
    {
        float _1633 = _230 * _230;
        float _1635 = rsqrt(_1491);
        float _1637 = fma(_226, _226, _1633);
        float _1639 = fma(_232, _232, _1637);
        float _1641 = sqrt(_1639);
        float _1643 = _1457 * _1635;
        float _1645 = _1419 * _1635;
        float _1647 = _1465 * _1635;
        bool _1649 = _1641 > 0.0;
        _1537 = _1635;
        if (!_1649)
        {
            _1605 = _1425;
        }
        float _1651 = _1605;
        _1607 = _1651;
        if (!_1649)
        {
            _1627 = _1403;
        }
        float _1653 = _1627;
        _1629 = _1653;
        if (!_1649)
        {
            _1585 = _1453;
        }
        float _1655 = _1585;
        bool _1657 = !_1649;
        _1587 = _1655;
        if (!_1657)
        {
            float _1659 = rsqrt(_1639);
            float _1661 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1663 = _230 * _1659;
            float _1665 = _226 * _1659;
            float _1667 = _1645 * _1663;
            float _1669 = _232 * _1659;
            float _1671 = fma(_1643, _1665, _1667);
            float _1673 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1675 = fma(_1647, _1669, _1671);
            float _1677 = _1675 * _1673;
            float _1679 = fma(_230, _1677, _1403);
            float _1681 = fma(_226, _1677, _1425);
            float _1683 = fma(_232, _1677, _1453);
            _1629 = _1679;
            _1607 = _1681;
            _1587 = _1683;
        }
    }
    float _1685 = _1629;
    float _1687 = _1607;
    float _1689 = _1587;
    float _1691 = _1537;
    int _1693 = _1312 + 88;
    uint _1695 = uint(int(uint(_1693) >> uint(2)));
    uint _1697 = uint(int(uint(int(_1695)) >> uint(2)));
    int _1699 = int(_1695) & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    int _1703 = int(_1695) + 1;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    int _1707 = _1703 & 3;
    float _1709 = (*spvDescriptorSet0.vp_c15)._m0[int(_1705)][_1707];
    float _1711 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1713 = _1619 * _1571;
    float _1715 = _1623 * _1571;
    float _1717 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1719 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1721 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1711);
    float _1723 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1725 = _1457;
    if (!_1495)
    {
        int _1727 = _1615 + 400;
        uint _1729 = uint(int(uint(_1727) >> uint(2)));
        uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
        int _1733 = int(_1729) & 3;
        float _1735 = (*spvDescriptorSet0.vp_c15)._m0[int(_1731)][_1733];
        _1725 = _1735;
    }
    float _1737 = _1725;
    float _1739 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1717);
    float _1741 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1719);
    float _1743 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1721);
    bool _1745 = _1713 >= 0.0;
    float _1747 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1739);
    float _1749 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1741);
    float _1751 = _1743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1753 = _1685 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1755 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1757 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1759 = _1751 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1761 = fma(_1687, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1753);
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1765 = _1713 <= 1.0;
    bool _1767 = _1765 && _1745;
    float _1769 = -_1759;
    float _1771 = fma(_1769, _1723, 1.0);
    float _1773 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1761);
    float _1775 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1763);
    float _1777 = _226;
    float _1779 = _1755;
    float _1781 = _1751;
    if (!_1495)
    {
        float _1783 = floor(_1310);
        _1777 = _1783;
    }
    float _1785 = _1777;
    bool _1787 = _1715 >= 0.0;
    bool _1789 = _1787 && _1767;
    float _1791 = _1773 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1793 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1775);
    float _1795 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1797 = _1715 <= 1.0;
    bool _1799 = _1797 && _1789;
    float _1801 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1803 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1793);
    float _1805 = log2(_1771);
    float _1807 = _1108 * _1533;
    float _1809 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1795);
    float _1811 = fma(_662, _1525, _1807);
    float _1813 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1809);
    float _1815 = 1.0 / _1803;
    float _1817 = _1809;
    if (!_1495)
    {
        float _1819 = -_1785;
        float _1821 = _1310 + _1819;
        _1817 = _1821;
    }
    float _1823 = _1817;
    if (_1799)
    {
        float _1825 = float(_1308);
        _1609 = _1825;
    }
    float _1827 = _1609;
    float _1829 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1813);
    float _1831 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1801);
    float _1833 = fma(_664, _1701, _1811);
    float _1835 = _1805 * 0.693147182464599609375;
    float _1837 = _1807;
    float _1839 = _1827;
    if (_1799)
    {
        float _1841 = rint(_1827);
        float _1843 = precise::max(_1841, 0.0);
        uint _1845 = uint(_1843);
        uint _1847 = clamp(_1845, 0u, 65535u);
        _1837 = as_type<float>(_1847);
    }
    float _1849 = _1837;
    float _1851 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1831);
    float _1853 = _1833 + _1709;
    float _1855 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1857 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1851);
    float _1859 = _1853 * _1571;
    float _1861 = _1829 * _1815;
    float _1863 = _1835;
    float _1865 = _1737;
    if (!_1495)
    {
        float _1867 = rint(_1737);
        float _1869 = precise::max(_1867, 0.0);
        uint _1871 = uint(_1869);
        uint _1873 = clamp(_1871, 0u, 65535u);
        _1863 = as_type<float>(_1873);
    }
    float _1875 = _1863;
    float _1877 = _1857 * _1815;
    if (!_1495)
    {
        float _1879 = -_1557;
        float _1881 = _1234 + _1879;
        _1839 = _1881;
    }
    float _1883 = _1839;
    float _1885 = fma(_1861, -0.5, 0.5);
    float _1887 = fma(_1877, 0.5, 0.5);
    float _1889 = _1557;
    if (_1799)
    {
        float3 _6085 = float3(_1713, _1715, float(as_type<int>(_1849)));
        float3 _6089 = select(_6085, float3(0.0), isnan(_6085));
        float _1891 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6089.xy, uint(rint(_6089.z)), _1859, level(0.0));
        _1889 = _1891;
    }
    float _1893 = _1889;
    float3 _6099 = float3(_1887, _1885, _1855);
    float _1895 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6099, float3(0.0), isnan(_6099)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6099, float3(0.0), isnan(_6099)), level(0.0)).x;
    float3 _6108 = float3(_1887, _1885, _1855);
    float4 _1898 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6108, float3(0.0), isnan(_6108)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6108, float3(0.0), isnan(_6108)), level(0.0)).xyzw;
    float _1900 = _1898.x;
    float _1902 = _1898.y;
    float _1904 = _1898.z;
    float _1906 = _1898.w;
    float _1908 = _1691;
    if (!_1495)
    {
        float3 _6131 = float3(_1883, _1823, float(as_type<int>(_1875)));
        float3 _6133 = select(_6131, float3(0.0), isnan(_6131));
        float _1910 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6133.xy, uint(rint(_6133.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6133.xy, uint(rint(_6133.z)), level(0.0)).x;
        _1908 = _1910;
    }
    float _1912 = _1908;
    if (_1495)
    {
        _1631 = 1.0;
    }
    float _1914 = _1631;
    float _1916 = _1914;
    float _1918 = _1893;
    float _1920 = _1895;
    if (!_1495)
    {
        int _1922 = int(_1543) << 4;
        int _1924 = _1922 + 2048;
        uint _1926 = uint(int(uint(_1924) >> uint(2)));
        uint _1928 = uint(int(uint(int(_1926)) >> uint(2)));
        int _1930 = int(_1926) & 3;
        float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
        int _1934 = int(_1926) + 1;
        uint _1936 = uint(int(uint(_1934) >> uint(2)));
        int _1938 = _1934 & 3;
        float _1940 = (*spvDescriptorSet0.vp_c15)._m0[int(_1936)][_1938];
        int _1942 = _1924 + 8;
        uint _1944 = uint(int(uint(_1942) >> uint(2)));
        uint _1946 = uint(int(uint(int(_1944)) >> uint(2)));
        int _1948 = int(_1944) & 3;
        float _1950 = (*spvDescriptorSet0.vp_c15)._m0[int(_1946)][_1948];
        int _1952 = int(_1944) + 1;
        uint _1954 = uint(int(uint(_1952) >> uint(2)));
        int _1956 = _1952 & 3;
        float _1958 = (*spvDescriptorSet0.vp_c15)._m0[int(_1954)][_1956];
        float _1960 = _1108 * _1940;
        float _1962 = fma(_662, _1932, _1960);
        float _1964 = fma(_664, _1950, _1962);
        float _1966 = _1964 + _1958;
        float _1968 = precise::clamp(_1966, 0.0, 1.0);
        float _1970 = -_1968;
        float _1972 = _1970 + _1912;
        float _1974 = fma(_1972, 500.0, 1.5);
        float _1976 = exp2(_1974);
        float _1978 = 0.0 + _1976;
        float _1980 = precise::clamp(_1978, 0.0, 1.0);
        _1916 = _1980;
    }
    float _1982 = _1916;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1986 = _1685 + _1984;
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1687 + _1988;
    float _1992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1994 = _1689 + _1992;
    float _1996 = _1986 * _1986;
    float _1998 = fma(_1990, _1990, _1996);
    float _2000 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2002 = fma(_1994, _1994, _1998);
    float _2004 = precise::max(0.0, _2000);
    float _2006 = rsqrt(_2002);
    float _2008 = sqrt(_2002);
    float _2010 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2012 = _1990 * _2010;
    float _2014 = _1994 * _2010;
    float _2016 = -_2010;
    float _2018 = -_2004;
    float _2020 = fma(_1986, _2016, _2018);
    float _2022 = _2012 * _2012;
    float _2024 = _2014 * _2014;
    float _2026 = _2022 + _2024;
    float _2028 = sqrt(_2026);
    bool _2030 = _2028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2032 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = _2028 + _2032;
    float _2036 = _664;
    float _2038 = _2004;
    float _2040 = _2026;
    float _2042 = _2034;
    float _2044 = _2010;
    float _2046 = _2012;
    float _2048 = _2014;
    float _2050 = _2022;
    float _2052 = _2024;
    float _2054 = _2020;
    bool _2056 = _2030;
    if (_2030)
    {
        float _2058 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2058;
    }
    float _2060 = _2036;
    if (_2030)
    {
        float _2062 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2062;
    }
    float _2064 = _2038;
    float _2066 = _2064;
    if (_2030)
    {
        float _2068 = rsqrt(_2026);
        _2040 = _2068;
    }
    float _2070 = _2040;
    if (_2030)
    {
        float _2072 = _2034 * _2060;
        _2042 = _2072;
    }
    float _2074 = _2042;
    if (_2030)
    {
        float _2076 = _2074 * 0.15915493667125701904296875;
        _1865 = _2076;
    }
    float _2078 = _1865;
    float _2080 = _2060;
    float _2082 = _2078;
    if (_2030)
    {
        float _2084 = _2078 * 6.283185482025146484375;
        float _2086 = sin(_2084);
        _2080 = _2086;
    }
    float _2088 = _2080;
    float _2090 = _2074;
    if (_2030)
    {
        float _2092 = _2078 * 6.283185482025146484375;
        float _2094 = cos(_2092);
        _2090 = _2094;
    }
    float _2096 = _2090;
    float _2098 = _2088;
    if (_2030)
    {
        float _2100 = fma(_2088, _2064, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2044 = _2100;
    }
    float _2102 = _2044;
    float _2104 = _2102;
    if (_2030)
    {
        float _2106 = _2070 * _2102;
        _2104 = _2106;
    }
    float _2108 = _2104;
    if (_2030)
    {
        float _2110 = _2096 + (-1.0);
        _2066 = _2110;
    }
    float _2112 = _2066;
    if (_2030)
    {
        float _2114 = _2012 * _2108;
        _2046 = _2114;
    }
    float _2116 = _2046;
    if (_2030)
    {
        float _2118 = _2014 * _2108;
        _2048 = _2118;
    }
    float _2120 = _2048;
    if (_2030)
    {
        float _2122 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2122;
    }
    float _2124 = _2098;
    if (_2030)
    {
        float _2126 = _2116 * _2116;
        _2050 = _2126;
    }
    float _2128 = _2050;
    if (_2030)
    {
        float _2130 = _2120 * _2120;
        _2052 = _2130;
    }
    float _2132 = _2052;
    if (_2030)
    {
        float _2134 = fma(_2020, _2096, _2124);
        _2054 = _2134;
    }
    float _2136 = _2054;
    float _2138 = fma(_2136, _2136, _2128);
    float _2140 = _2138 + _2132;
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2144 = fma(_2008, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2142);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = -_2146;
    float _2150 = _2148 + 1.0;
    float _2152 = rsqrt(_2140);
    float _2154 = abs(_2150);
    float _2156 = log2(_2154);
    float _2158 = _2152 * _2116;
    float _2160 = _2152 * _2136;
    float _2162 = _2152 * _2120;
    float _2164 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2166 = -_2164;
    float _2168 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = -_2162;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2174 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2176 = fma(_2172, -0.5, 0.5);
    float _2178 = exp2(_2174);
    float _2180 = fma(_2172, 0.5, 0.5);
    float _2182 = _2160 + 1.0;
    float _2184 = fma(_2180, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2186 = sqrt(_2176);
    float _2188 = fma(_2180, _2184, -0.212114393711090087890625);
    float _2190 = fma(_1453, 6.2500002968590706586837768554688e-05, 0.5);
    float _2192 = fma(_2180, _2188, 1.570728778839111328125);
    float _2194 = -_2160;
    float _2196 = fma(_2178, _2182, _2194);
    float _2198 = _2186 * 0.636619746685028076171875;
    float _2200 = fma(_2196, 0.5, 0.5);
    float _2202 = fma(_1425, 6.2500002968590706586837768554688e-05, 0.5);
    float _2204 = -_2192;
    float _2206 = fma(_2198, _2204, 1.0);
    float2 _6582 = float2(_2206, _2200);
    float3 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6582, float2(0.0), isnan(_6582)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6582, float2(0.0), isnan(_6582)), level(0.0)).xyz;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float2 _6596 = float2(_2202, _2190);
    float3 _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6596, float2(0.0), isnan(_6596)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6596, float2(0.0), isnan(_6596)), level(0.0)).xyz;
    float _2220 = _2218.x;
    float _2222 = _2218.y;
    float _2224 = _2218.z;
    float _2226 = in.m_73.w;
    float _2228 = -_682;
    float _2230 = _2228 + 1.0;
    float _2232 = in.m_83.x;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2236 = _2234 != 0;
    float _2238 = in.m_83.y;
    bool _2240 = _696 > 0.5;
    float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2244 = _2242 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2248 = _684 > 0.5;
    out.m_85.x = _1687;
    out.m_85.y = _1685;
    out.m_85.z = _1689;
    int _2250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2252 = _2250 != 0;
    int _2254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_2236)
    {
        bool _2256 = _688 > 0.5;
        _2056 = _2256;
    }
    bool _2258 = _2056;
    float _2260 = 1.0 / _2244;
    float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2264 = _638 + _2262;
    bool _2266 = _2226 > 0.5;
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2268;
    float _2272 = _2232;
    if (_2236)
    {
        float _2274 = -_2232;
        float _2276 = _2274 + 1.0;
        _2254 = as_type<int>(_2276);
    }
    int _2278 = _2254;
    if (!_2236)
    {
        _2082 = _2232;
    }
    float _2280 = _2082;
    float _2282 = -_2238;
    float _2284 = _2282 + 1.0;
    float _2286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2288 = _2280;
    float _2290 = _2238;
    if (_2236)
    {
        float _2292 = _2258 ? as_type<float>(_2278) : _2232;
        _2288 = _2292;
    }
    float _2294 = _2288;
    float _2296 = _2246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2300 = _2298 != 0;
    float _2302 = _2270 * _2260;
    int _2304 = _2240 ? as_type<int>(_2284) : as_type<int>(_2238);
    int _2306 = _2266 ? as_type<int>(_2284) : as_type<int>(_2238);
    int _2308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2310 = _2308 != 0;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2314 = _2312 != 0;
    float _2316 = _2300 ? as_type<float>(_2304) : _2238;
    float _2318 = _2252 ? as_type<float>(_2306) : _2238;
    float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2324 = _2322 != 0;
    float _2326 = fma(_2296, _2316, -0.5);
    float _2328 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2330 = fma(_2302, _2264, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2332 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2334 = isnan(_638);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    float _2344 = -_770;
    float _2346 = fma(_980, _2326, _2344);
    int _2348 = as_type<int>(_2286);
    float _2350 = _2330;
    if (_2310)
    {
        float _2352 = -_2232;
        float _2354 = _2352 + 1.0;
        _794 = as_type<int>(_2354);
    }
    int _2356 = _794;
    float _2358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2314)
    {
        float _2360 = -_2232;
        float _2362 = _2360 + 1.0;
        _2348 = as_type<int>(_2362);
    }
    int _2364 = _2348;
    float _2366 = 0.0;
    if (!_2310)
    {
        _2366 = _2232;
    }
    float _2368 = _2366;
    float _2370 = in.m_87.x;
    float _2372 = in.m_87.y;
    float _2374 = in.m_87.z;
    float _2376 = _2368;
    if (_2310)
    {
        float _2378 = _2248 ? as_type<float>(_2356) : _2232;
        _2376 = _2378;
    }
    float _2380 = _2376;
    float _2382 = fma(_2318, _2328, -0.5);
    if (_2324)
    {
        float _2384 = _2248 ? _2284 : _2238;
        _2290 = _2384;
    }
    float _2386 = _2290;
    float _2388 = -_2342;
    float _2390 = _2388 + 1.0;
    if (_2314)
    {
        float _2392 = _2240 ? as_type<float>(_2364) : _2232;
        _2272 = _2392;
    }
    float _2394 = _2272;
    float _2396 = -_924;
    float _2398 = fma(_826, _2382, _2396);
    float _2400 = in.m_89.x;
    float _2402 = in.m_89.y;
    float _2404 = in.m_89.z;
    float _2406 = in.m_89.w;
    bool _2408 = _1044 != 0.0;
    bool _2410 = isnan(_1044);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan(0.0);
    bool _2416 = _2412 || _2414;
    float _2418 = _2320 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2420 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2422 = isnan(_638);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2434 = _1042 == 0.0;
    bool _2436 = !_2416;
    bool _2438 = _2434 && _2436;
    float _2440 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2442 = fma(_2418, _2294, -0.5);
    float _2444 = _2430 * _2390;
    bool _2446 = _1046 == 0.0;
    bool _2448 = _2446 && _2438;
    float _2450 = fma(_2440, _2380, -0.5);
    float _2452 = -_2430;
    float _2454 = _2452 + 1.0;
    float _2456 = _2330 * _2444;
    float _2458 = fma(_940, _2442, _768);
    float _2460 = fma(_874, _2450, _884);
    float _2462 = _2394 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2464 = abs(_1244);
    float _2466 = log2(_2464);
    float _2468 = fma(_2454, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2456);
    float _2470 = fma(_2342, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2468);
    float _2472 = _2456;
    float _2474 = _2430;
    if (_2448)
    {
        _2350 = _2370;
    }
    float _2476 = _2350;
    float _2478 = _2476;
    if (!_2448)
    {
        float _2480 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2370);
        _2478 = _2480;
    }
    float _2482 = _2478;
    float _2484 = _2402 * _2374;
    if (_2448)
    {
        _2472 = _2372;
    }
    float _2486 = _2472;
    float _2488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2490 = _2486;
    if (_2448)
    {
        _2474 = _2374;
    }
    float _2492 = _2474;
    float _2494 = _2492;
    if (!_2448)
    {
        float _2496 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2372);
        _2490 = _2496;
    }
    float _2498 = _2490;
    if (!_2448)
    {
        float _2500 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2374);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = _2400 * _2372;
    float _2506 = -_2484;
    float _2508 = fma(_2404, _2372, _2506);
    float _2510 = _2346 + 0.5;
    float _2512 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2514 = _2404 * _2370;
    float _2516 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2520 = _2398 + 0.5;
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2524 = exp2(_2512);
    float _2526 = -_2514;
    float _2528 = fma(_2400, _2374, _2526);
    float _2530 = _2516 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2532 = _2518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2534 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2536 = _2470 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2538 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2540 = -_2504;
    float _2542 = fma(_2402, _2370, _2540);
    float _2544 = _2462 * _2488;
    float _2546 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_91.x = _2530;
    out.m_91.y = _2532;
    out.m_91.z = _2534;
    out.m_91.w = _2536;
    float _2548 = _2538 * _2432;
    float _2550 = _2458 + 0.5;
    float _2552 = _2528 * _2406;
    float _2554 = _2508 * _2406;
    float _2556 = -_1102;
    float _2558 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2546);
    out.m_93.x = _2544;
    out.m_93.y = _2548;
    float _2560 = _2460 + 0.5;
    float _2562 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2564 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2558);
    bool _2566 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2568 = isnan(0.5);
    bool _2570 = _2566 || _2568;
    bool _2572 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2574 = _2570 || _2572;
    out.m_95.x = _2550;
    out.m_95.y = _2510;
    out.m_95.z = _2560;
    out.m_95.w = _2520;
    float _2576 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2578 = _2542 * _2406;
    float _2580 = _1110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2582 = -_1102;
    float _2584 = fma(_2582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2576);
    float _2586 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2588 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2590 = -_1102;
    float _2592 = fma(_2590, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2580);
    float _2594 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2586);
    float _2600 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2588);
    float _2602 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2562);
    float _2604 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2584);
    float _2610 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2612 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2614 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2598);
    float _2616 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2600);
    float _2618 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2602);
    float _2620 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2622 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2624 = _2608 * _2402;
    float _2626 = _2564 * _2402;
    float _2628 = _2608 * _2498;
    float _2630 = _2552 * _2608;
    float _2632 = _2564 * _2498;
    float _2634 = fma(_2596, -2.0, 3.0);
    float _2636 = _2596 * _2596;
    float _2638 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2610);
    float _2640 = _2552 * _2564;
    float _2642 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2644 = _2620 * _2402;
    float _2646 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2622);
    float _2648 = fma(_2614, _2482, _2628);
    float _2650 = fma(_2616, _2400, _2626);
    float _2652 = fma(_2614, _2400, _2624);
    float _2654 = fma(_2554, _2614, _2630);
    float _2656 = fma(_2616, _2482, _2632);
    float _2658 = fma(_2554, _2616, _2640);
    float _2660 = fma(_2618, _2400, _2644);
    float _2662 = fma(_2646, _2404, _2650);
    float _2664 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2666 = fma(_2642, _2404, _2652);
    float _2668 = fma(_2578, _2642, _2654);
    float _2670 = fma(_2642, _2502, _2648);
    float _2672 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2674 = fma(_1757, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2664);
    float _2676 = _2620 * _2498;
    float _2678 = _2552 * _2620;
    float _2680 = exp2(_2672);
    float _2682 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2638);
    float _2684 = _2636 * _2634;
    float _2686 = fma(_2618, _2482, _2676);
    float _2688 = fma(_2554, _2618, _2678);
    float _2690 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2674);
    float _2692 = fma(_2682, _2404, _2660);
    float _2694 = fma(_2578, _2646, _2658);
    float _2696 = -_2684;
    float _2698 = _2696 + 1.0;
    float _2700 = fma(_2646, _2502, _2656);
    float _2702 = fma(_2682, _2502, _2686);
    float _2704 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2690);
    bool _2706 = _1244 <= 8000.0;
    bool _2708 = isnan(_1244);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan(8000.0);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2684);
    float _2720 = fma(_2578, _2682, _2688);
    float _2722 = _2690;
    float _2724 = _2716;
    if (!_2574)
    {
        float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2728 = _1244 + _2726;
        _2722 = _2728;
    }
    float _2730 = _2722;
    float _2732 = _1803 * 0.5;
    float _2734 = _2716 * _2718;
    float _2736 = -_2680;
    float _2738 = _2736 + 1.0;
    out.m_97.x = _2668;
    out.m_97.y = _2694;
    out.m_97.z = _2720;
    float _2740 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    if (!_2574)
    {
        _1779 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2742 = _1779;
    out.m_99.x = _2666;
    out.m_99.y = _2662;
    out.m_99.z = _2692;
    float _2744 = _2230 * _2740;
    float _2746 = precise::clamp(_2744, 0.0, 1.0);
    float _2748 = _2742;
    float _2750 = _2746;
    if (!_2574)
    {
        float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2754 = _2742 + _2752;
        _2748 = _2754;
    }
    float _2756 = _2748;
    out.gl_Position.x = _1857;
    out.gl_Position.y = _1829;
    out.gl_Position.z = _2704;
    out.gl_Position.w = _1803;
    if (!_1799)
    {
        _2724 = 1.0;
    }
    float _2758 = _2724;
    float _2760 = _2704 + _1803;
    float _2762 = _1857 + _1803;
    float _2764 = fma(_1829, -0.5, _2732);
    float _2766 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2768 = _2760 * 0.5;
    float _2770 = _2762 * 0.5;
    float _2772 = _2624;
    float _2774 = _2758;
    if (!_2574)
    {
        float _2776 = 1.0 / _2756;
        _2772 = _2776;
    }
    float _2778 = _2772;
    float _2780 = _2766 * _1895;
    float _2782 = -_2766;
    float _2784 = _2782 + 1.0;
    out.m_101.x = _2670;
    out.m_101.y = _2700;
    out.m_101.z = _2702;
    float _2786 = _2784;
    if (_1799)
    {
        bool _2788 = _1893 >= _1859;
        bool _2790 = isnan(_1893);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan(_1859);
        bool _2796 = _2792 || _2794;
        float _2798 = float(_2796);
        _2774 = _2798;
    }
    float _2800 = _2774;
    bool _2802 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2804 = isnan(_2008);
    bool _2806 = _2802 || _2804;
    bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2810 = _2806 || _2808;
    out.m_103.x = _2770;
    out.m_103.y = _2764;
    out.m_103.z = _2768;
    out.m_103.w = _1803;
    if (_2574)
    {
        _1781 = 1.0;
    }
    float _2812 = _1781;
    float _2814 = _2800 * _1982;
    out.m_105.x = 1.0;
    out.m_105.y = 1.0;
    out.m_105.z = 1.0;
    float _2816 = _2812;
    if (!_2574)
    {
        float _2818 = _2730 * _2778;
        float _2820 = precise::clamp(_2818, 0.0, 1.0);
        _2816 = _2820;
    }
    float _2822 = _2816;
    if (!_2810)
    {
        _1918 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2824 = _1918;
    float _2826 = _1906 * _2780;
    float _2828 = _1906 * _2784;
    float _2830 = -_2746;
    float _2832 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2834 = _2824;
    float _2836 = _2824;
    if (!_2810)
    {
        _2750 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2838 = _2750;
    float _2840 = _2838;
    float _2842 = _2838;
    if (!_2810)
    {
        _1920 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2844 = _1920;
    float _2846 = -_2814;
    float _2848 = fma(_2846, _2832, 1.0);
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2850;
    float _2854 = _2844;
    float _2856 = _2844;
    if (!_2810)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2858 = _2786;
    float _2860 = _2216 * _2780;
    float _2862 = fma(_2212, _2826, _1900);
    float _2864 = fma(_2214, _2826, _1902);
    out.m_107.x = _2220;
    out.m_107.y = _2222;
    out.m_107.z = _2224;
    float _2866 = fma(_1906, _2860, _1904);
    float _2868 = _2850 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2870 = _2822 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2872 = _2868;
    float _2874 = _2858;
    float _2876 = _2858;
    if (!_2810)
    {
        _2852 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2878 = _2852;
    out.m_109.x = _2862;
    out.m_109.y = _2864;
    out.m_109.z = _2866;
    out.m_109.w = _2828;
    out.m_111.x = _2868;
    float _2880 = _2878;
    float _2882 = _2878;
    if (!_2810)
    {
        _2872 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2884 = _2872;
    bool _2886 = !_2810;
    float _2888 = _2884;
    float _2890 = _2884;
    if (!_2886)
    {
        bool _2892 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2894 = isnan(_2008);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2900 = _2896 || _2898;
        if (!_2900)
        {
            float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2904 = _2008 + _2902;
            float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2908 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2906;
            float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2914 = 1.0 / _2908;
            float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2932 = _2904 * _2914;
            float _2934 = precise::clamp(_2932, 0.0, 1.0);
            float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2940 = fma(_2934, _2912, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2942 = fma(_2934, _2938, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2944 = fma(_2934, _2918, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2946 = fma(_2934, _2922, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2948 = fma(_2934, _2926, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2950 = fma(_2934, _2930, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2842 = _2940;
            _2876 = _2948;
            _2836 = _2944;
            _2856 = _2946;
            _2882 = _2942;
            _2890 = _2950;
            _2952 = true;
        }
        else
        {
            bool _2954 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2956 = isnan(_2008);
            bool _2958 = _2954 || _2956;
            bool _2960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2962 = _2958 || _2960;
            if (!_2962)
            {
                _2834 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2964 = _2834;
            _2836 = _2964;
            if (!_2962)
            {
                _2840 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2966 = _2840;
            _2842 = _2966;
            if (!_2962)
            {
                _2880 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2968 = _2880;
            _2882 = _2968;
            if (!_2962)
            {
                _2854 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2970 = _2854;
            _2856 = _2970;
            if (!_2962)
            {
                _2874 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2972 = _2874;
            _2876 = _2972;
            if (!_2962)
            {
                _2888 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2974 = _2888;
            bool _2976 = !_2962;
            _2890 = _2974;
            if (!_2976)
            {
                bool _2978 = _2008 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2980 = isnan(_2008);
                bool _2982 = _2978 || _2980;
                bool _2984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2986 = _2982 || _2984;
                if (!_2986)
                {
                    float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2990 = _2008 + _2988;
                    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2994 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2992;
                    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3000 = 1.0 / _2994;
                    float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3004 = _3002 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3008 = _3006 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3014 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3016 = _3014 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3018 = _2990 * _3000;
                    float _3020 = precise::clamp(_3018, 0.0, 1.0);
                    float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3026 = fma(_3020, _2998, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3028 = fma(_3020, _3024, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3030 = fma(_3020, _3004, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3032 = fma(_3020, _3008, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3034 = fma(_3020, _3012, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3036 = fma(_3020, _3016, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2842 = _3026;
                    _2876 = _3034;
                    _2836 = _3030;
                    _2856 = _3032;
                    _2882 = _3028;
                    _2890 = _3036;
                    _2952 = true;
                }
                else
                {
                    _2842 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2876 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2836 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2856 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2882 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2890 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2952 = false;
    float _3038 = _2842;
    float _3040 = _2876;
    float _3042 = _2836;
    float _3044 = _2856;
    float _3046 = _2882;
    float _3048 = _2890;
    float _3050 = fma(_2700, -0.5, 0.5);
    float _3052 = precise::clamp(_3050, 0.0, 1.0);
    float _3054 = -_3038;
    float _3056 = _3054 + _3040;
    float _3058 = _2870 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3060 = -_3042;
    float _3062 = _3060 + _3044;
    out.m_113.x = 0.0;
    float _3064 = fma(_3052, _3056, _3038);
    float _3066 = fma(_3052, _3062, _3042);
    out.m_61.x = _3058;
    float _3068 = -_3046;
    float _3070 = _3068 + _3048;
    float _3072 = _3064 * 0.586610972881317138671875;
    bool _3074 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3076 = fma(_3052, _3070, _3046);
    float _3078 = fma(_3066, 0.298911988735198974609375, _3072);
    bool _3080 = _2822 > 0.0;
    bool _3082 = isnan(_2822);
    bool _3084 = _3080 || _3082;
    bool _3086 = isnan(0.0);
    bool _3088 = _3084 || _3086;
    float _3090 = fma(_3076, 0.114477999508380889892578125, _3078);
    float _3092 = -_3090;
    float _3094 = _3064 + _3092;
    float _3096 = -_3090;
    float _3098 = _3066 + _3096;
    float _3100 = -_3090;
    float _3102 = _3076 + _3100;
    float _3104 = fma(_3094, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    float _3106 = fma(_3098, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    float _3108 = fma(_3102, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3090);
    bool _3110 = !_3074;
    if (!_3110)
    {
        float _3112 = -_1685;
        float _3114 = _3112 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3116 = -_1687;
        float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3120 = -_1689;
        float _3122 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3124 = _3114 * _3114;
        float _3126 = fma(_3118, _3118, _3124);
        float _3128 = fma(_3122, _3122, _3126);
        float _3130 = sqrt(_3128);
        float _3132 = rsqrt(_3128);
        float _3134 = -_3130;
        float _3136 = _3134 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3138 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3140 = precise::clamp(_3138, 0.0, 1.0);
        float _3142 = _3118 * _3132;
        float _3144 = _3114 * _3132;
        float _3146 = abs(_3140);
        float _3148 = log2(_3146);
        float _3150 = _3122 * _3132;
        float _3152 = _3142 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3154 = _2700 * _3144;
        float _3156 = -_3144;
        float _3158 = -_3152;
        float _3160 = fma(_3156, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3158);
        float _3162 = fma(_2670, _3142, _3154);
        float _3164 = -_3150;
        float _3166 = fma(_3164, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3160);
        float _3168 = fma(_2702, _3150, _3162);
        float _3170 = precise::clamp(_3168, 0.0, 1.0);
        float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3174 = _3166 + _3172;
        float _3176 = _3148 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3178 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3180 = precise::clamp(_3178, 0.0, 1.0);
        float _3182 = exp2(_3176);
        float _3184 = _3182 * _3180;
        float _3186 = _3170 * _3184;
        float _3188 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3190 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3192 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _3188;
        out.m_113.y = _3190;
        out.m_113.z = _3192;
    }
    out.m_115.x = _3106;
    out.m_115.y = _3104;
    out.m_115.z = _3108;
    if (_3088)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3194 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3194;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

