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
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_93 [[user(locn1)]];
    float4 m_115 [[user(locn2)]];
    float4 m_111 [[user(locn3)]];
    float4 m_113 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_99 [[user(locn7)]];
    float4 m_101 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_105 [[user(locn10)]];
    float4 m_109 [[user(locn11)]];
    float4 m_61 [[user(locn12)]];
    float4 m_103 [[user(locn13)]];
    float4 m_107 [[user(locn14)]];
    float4 m_81 [[user(locn15)]];
    float4 m_85 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_65 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_89 [[attribute(8)]];
    float4 m_87 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_83 [[attribute(12)]];
    float4 m_79 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2868 = false;
    bool _1550 = false;
    bool _688 = false;
    bool _546 = false;
    bool _252 = false;
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
        float _3167 = as_type<float>(_150);
        out.gl_Position.z = _3167;
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
    float _170 = 0.0;
    if (_164)
    {
        float _172 = float(_134);
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    if (_180)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _144;
    if (_180)
    {
        out.m_61.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _152 = as_type<int>(_184);
    }
    int _186 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3235 = as_type<float>(_186);
        out.gl_Position.z = _3235;
    }
    if (_180)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_67.x;
    float _198 = in.m_67.y;
    float _200 = in.m_67.z;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_73.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_134);
        float _256 = 1.0 / _254;
        float _258 = _168 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _290 = 1.0 / _276;
    bool _292 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_260);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    bool _304 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_260);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _280;
    float _318 = -_302;
    float _320 = _318 + 1.0;
    float _322 = _314 * _320;
    float _324 = -_314;
    float _326 = _324 + 1.0;
    float _328 = 1.0 / _288;
    float _330 = _264 * _290;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _260 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = fma(_338, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = 1.0 / _284;
    float _354 = _268 * _316;
    bool _356 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_260);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_342, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _370 = -_366;
    float _372 = _370 + 1.0;
    float _374 = _334 * _328;
    bool _376 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _378 = isnan(_260);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _386 * _372;
    float _390 = _272 * _352;
    float _392 = -_386;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _302 * _394;
    float _406 = fma(_398, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_402, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _410 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_260);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = _420 * _326;
    float _432 = -_420;
    float _434 = _432 + 1.0;
    float _436 = fma(_424, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _438 = fma(_428, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _440 = _406 * _430;
    float _442 = _350 * _430;
    float _444 = _408 * _430;
    float _446 = in.m_75.x;
    float _448 = in.m_75.y;
    float _450 = in.m_75.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _462 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _464 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_346, _390, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _470 = fma(_458, _390, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_436, _322, _460);
    float _474 = fma(_368, _322, _462);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_438, _322, _468);
    float _490 = fma(_478, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_464, _404, _472);
    float _496 = fma(_466, _404, _474);
    float _498 = fma(_486, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _500 = fma(_470, _404, _488);
    float _502 = fma(_490, _388, _494);
    float _504 = fma(_492, _388, _496);
    float _506 = fma(_498, _388, _500);
    float _508 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].x, _502);
    float _510 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].y, _504);
    float _512 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].z, _506);
    float _514 = _508 * _446;
    float _516 = _510 * _448;
    float _518 = _512 * _450;
    bool _520 = !_348;
    float _522 = _460;
    float _524 = _464;
    float _526 = _516;
    float _544;
    if (!_520)
    {
        float _528 = in.m_73.x;
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _536 = _534 * _530;
        float _538 = floor(_536);
        float _540 = -_538;
        float _542 = _536 + _540;
        _544 = _542;
        _546 = true;
    }
    else
    {
        float _548 = float(_134);
        float _550 = 1.0 / _548;
        float _552 = _168 * _550;
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
    float _616 = _590 * _612;
    float _618 = -_590;
    float _620 = _618 + 1.0;
    float _622 = 1.0 / _578;
    float _624 = _594 * _608;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = fma(_624, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _632 = _628 * _622;
    float _634 = _630 * _616;
    float _636 = -_606;
    float _638 = _636 + 1.0;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _554 + _640;
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _634);
    float _646 = _574 * _638;
    float _648 = fma(_632, _642, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_648, _646, _644);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[117].x, _652);
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_77.x = _660;
    out.m_77.y = _662;
    out.m_77.z = _664;
    out.m_77.w = _666;
    bool _668 = !_614;
    float _686;
    if (!_668)
    {
        float _670 = in.m_73.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_134);
        float _692 = 1.0 / _690;
        float _694 = _168 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_58.x;
    float _700 = in.m_58.y;
    float _702 = in.m_58.z;
    float _704 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = in.m_73.w;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _714 = in.m_79.y;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _718 = in.m_73.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_73.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _728 = _726 != 0;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _734 = _732 != 0;
    float _736 = in.m_73.x;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _740 = _738 != 0;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _744 = _204 * _700;
    float _746 = _198 * _700;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _748 = _210 * _700;
    bool _750 = _706 > 0.5;
    float _752 = fma(_202, _698, _744);
    float _754 = in.m_67.w;
    float _756 = -_714;
    float _758 = _756 + 1.0;
    float _760 = fma(_196, _698, _746);
    float _762 = fma(_208, _698, _748);
    float _764 = in.m_69.w;
    bool _766 = _718 > 0.5;
    float _768 = fma(_200, _702, _760);
    float _770 = _718;
    float _772 = _714;
    float _774 = _712;
    if (!_710)
    {
        _522 = _718;
    }
    float _776 = _522;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _780 = _776;
    if (!_710)
    {
        _524 = _724;
    }
    float _782 = _524;
    float _784 = in.m_71.w;
    float _786 = _782;
    if (_710)
    {
        _780 = _724;
    }
    float _788 = _780;
    float _790 = fma(_206, _702, _752);
    int _792 = as_type<int>(_788);
    if (_710)
    {
        _786 = _736;
    }
    float _794 = _786;
    float _796 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_710)
    {
        _770 = _724;
    }
    float _798 = _770;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _802 = _750 ? as_type<int>(_758) : as_type<int>(_714);
    float _804 = -_778;
    float _806 = fma(_796, 2.0, _804);
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _810 = _808 != 0;
    float _812 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _816 = _814 != 0;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _820 = in.m_83.x;
    float _822 = in.m_83.y;
    float _824 = in.m_83.z;
    float _826 = in.m_83.w;
    float _828 = _734 ? as_type<float>(_802) : _714;
    float _830 = fma(_812, -2.0, _730);
    bool _832 = _724 > 0.5;
    float _834 = fma(_212, _702, _762);
    float _836 = _768 + _754;
    float _838 = _790 + _764;
    int _840 = _832 ? as_type<int>(_758) : as_type<int>(_714);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _844 = _836 + _842;
    float _846 = _834 + _784;
    float _848 = _810 ? as_type<float>(_840) : _714;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _854 = _844 * _844;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = 1.0 / _852;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _874 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].w, _818);
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _878 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _880 = 1.0 / _864;
    float _882 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _884 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _878);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _890 = _838 + _888;
    float _892 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _882);
    float _894 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    bool _896 = _810;
    float _898 = _800;
    float _900 = _836;
    if (_722)
    {
        bool _902 = _736 > 0.5;
        _896 = _902;
    }
    bool _904 = _896;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _908 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _910 = fma(_890, _890, _854);
    float _912 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].z, _892);
    float _914 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].z, _894);
    float _916 = _872 * _860;
    float _918 = fma(_858, _858, _910);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _922 = _696 + _920;
    float _924 = _868 * _880;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _928 = _696 + _926;
    float _930 = sqrt(_918);
    float _932 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _876);
    float _934 = fma(_924, _922, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _936 = fma(_916, _928, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    out.m_85.x = _908;
    out.m_85.y = _912;
    out.m_85.z = _914;
    float _938 = _800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _940 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    if (_816)
    {
        float _942 = _766 ? _758 : _714;
        _772 = _942;
    }
    float _944 = _772;
    float _946 = fma(_938, _848, -0.5);
    float _948 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _932);
    float _950 = in.m_79.x;
    float _952 = _716 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _956 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _958 = _906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _960 = rsqrt(_918);
    float _962 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _964 = _930 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _968 = fma(_828, _958, -0.5);
    float _970 = _742 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _972 = precise::min(_962, _964);
    float _974 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[83].w, _966);
    bool _976 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _978 = isnan(_696);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_940;
    float _990 = fma(_956, _946, _988);
    bool _992 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _994 = isnan(_696);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = in.m_87.x;
    float _1006 = in.m_87.y;
    float _1008 = in.m_87.z;
    bool _1010 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1012 = isnan(_696);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -_986;
    float _1024 = _1022 + 1.0;
    float _1026 = _960 * _972;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1030 = _1020 * _1024;
    float _1032 = -_1020;
    float _1034 = _1032 + 1.0;
    float _1036 = _844 * _1026;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1040 = _960;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1044 = _950;
    if (!_722)
    {
        _898 = _950;
    }
    float _1046 = _898;
    float _1048 = _1002 * _1034;
    float _1050 = _890 * _1026;
    float _1052 = -_1036;
    float _1054 = _844 + _1052;
    float _1056 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1038);
    float _1058 = _794 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1060 = -_1050;
    float _1062 = _890 + _1060;
    float _1064 = _1054 * _1054;
    float _1066 = _858 * _1026;
    float _1068 = -_954;
    float _1070 = fma(_1058, 2.0, _1068);
    float _1072 = _934 * _1048;
    float _1074 = fma(_1062, _1062, _1064);
    float _1076 = -_1066;
    float _1078 = _858 + _1076;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1082 = in.m_89.x;
    float _1084 = in.m_89.y;
    float _1086 = in.m_89.z;
    bool _1088 = _1006 != 0.0;
    bool _1090 = isnan(_1006);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.0);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_1078, _1078, _1074);
    float _1100 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1102 = _1046;
    if (_722)
    {
        float _1104 = -_950;
        float _1106 = _1104 + 1.0;
        _792 = as_type<int>(_1106);
    }
    int _1108 = _792;
    bool _1110 = _1004 == 0.0;
    bool _1112 = !_1096;
    bool _1114 = _1110 && _1112;
    float _1116 = sqrt(_1098);
    float _1118 = fma(_1100, -2.0, _1080);
    float _1120 = -_1002;
    float _1122 = _1120 + 1.0;
    bool _1124 = _1008 == 0.0;
    bool _1126 = _1124 && _1114;
    float _1128 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1056);
    float _1130 = -_168;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1070);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1072);
    float _1136 = -_168;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    float _1140 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1118);
    float _1142 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _974);
    float _1144 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1146 = fma(_936, _1030, _1134);
    int _1148 = 0;
    float _1150 = as_type<float>(_1108);
    if (_728)
    {
        float _1152 = -_950;
        float _1154 = _1152 + 1.0;
        _1148 = as_type<int>(_1154);
    }
    int _1156 = _1148;
    if (_722)
    {
        float _1158 = _904 ? as_type<float>(_1108) : _950;
        _1102 = _1158;
    }
    float _1160 = _1102;
    float _1162 = -_1140;
    float _1164 = fma(_1142, _968, _1162);
    float _1166 = _960 * _1116;
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    if (_1126)
    {
        _1040 = _1082;
    }
    float _1170 = _1040;
    float _1172 = fma(_952, _1160, -0.5);
    float _1174 = _1144 * _1166;
    float _1176 = _704 * _1166;
    float _1178 = _712 * _1166;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1182 = _1170;
    if (_1126)
    {
        _526 = _1170;
    }
    float _1184 = _526;
    float _1186 = _1174 * _1168;
    float _1188 = _1184;
    if (_1126)
    {
        _1042 = _1084;
    }
    float _1190 = _1042;
    float _1192 = _1176 * _1180;
    float _1194 = _1190;
    if (!_1126)
    {
        _1182 = _1082;
    }
    float _1196 = _1182;
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    if (_1126)
    {
        _774 = _1190;
    }
    float _1200 = _774;
    float _1202 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1204 = _1202;
    float _1206 = _1200;
    if (!_1126)
    {
        _1194 = _1084;
    }
    float _1208 = _1194;
    float _1210 = _1178 * _1198;
    float _1212 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1214 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1202);
    float _1216 = _1214;
    if (_1126)
    {
        _1204 = _1086;
    }
    float _1218 = _1204;
    float _1220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1212);
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1214);
    float _1226 = _1218;
    if (_1126)
    {
        _1216 = _1218;
    }
    float _1228 = _1216;
    int _1230 = 0;
    float _1232 = _1228;
    if (_740)
    {
        float _1234 = -_950;
        float _1236 = _1234 + 1.0;
        _1230 = as_type<int>(_1236);
    }
    int _1238 = _1230;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1222);
    float _1242 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_1126)
    {
        _1226 = _1086;
    }
    float _1244 = _1226;
    float _1246 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = _846 + _1242;
    float _1252 = _1250;
    if (!_728)
    {
        _1150 = _950;
    }
    float _1254 = _1150;
    float _1256 = _1254;
    if (!_1126)
    {
        float _1258 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1244);
        _1232 = _1258;
    }
    float _1260 = _1232;
    float _1262 = _838 + _1248;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1250 + _1264;
    float _1268 = _1262;
    if (_728)
    {
        float _1270 = _766 ? as_type<float>(_1156) : _950;
        _1256 = _1270;
    }
    float _1272 = _1256;
    if (!_1126)
    {
        float _1274 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1196);
        _1188 = _1274;
    }
    float _1276 = _1188;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1280 = _1262 + _1278;
    float _1282 = _1266 * _1266;
    if (_740)
    {
        float _1284 = _832 ? as_type<float>(_1238) : _950;
        _1044 = _1284;
    }
    float _1286 = _1044;
    float _1288 = fma(_970, _1272, -0.5);
    float _1290 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1292 = fma(_1280, _1280, _1282);
    if (!_1126)
    {
        float _1294 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1208);
        _1206 = _1294;
    }
    float _1296 = _1206;
    float _1298 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1300 = _820 * _1208;
    float _1302 = sqrt(_1292);
    float _1304 = _944 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1306 = _1298 * _1220;
    float _1308 = _824 * _1196;
    float _1310 = _822 * _1244;
    float _1312 = -_1300;
    float _1314 = fma(_822, _1196, _1312);
    float _1316 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1290);
    float _1318 = -_1308;
    float _1320 = fma(_820, _1244, _1318);
    float _1322 = -_1310;
    float _1324 = fma(_824, _1208, _1322);
    float _1326 = _1304 * _1028;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1330 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1146);
    float _1332 = fma(_948, _1172, _1138);
    float _1334 = fma(_1128, _1288, _1132);
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1340 = _1302 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1344 = _836 + _1328;
    out.m_91.x = _1306;
    out.m_91.y = _1326;
    float _1346 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1348 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1338);
    float _1350 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1342);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = _1306;
    int _1356 = as_type<int>(_1334);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (!_1340)
    {
        _1354 = _1250;
    }
    float _1360 = _1354;
    float _1362 = _1360;
    if (!_1340)
    {
        _1252 = _1344;
    }
    float _1364 = _1252;
    bool _1366 = !_1340;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1302 + _1372;
        float _1376 = rsqrt(_1292);
        float _1378 = _1374 * _1370;
        float _1380 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1378 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        float _1392 = fma(_1386, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = _1376 * _1392;
        float _1396 = _1390 + (-1.0);
        float _1398 = fma(_1280, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1266, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1344, _1390, _1402);
        _1368 = _1404;
        _1268 = _1398;
        _1362 = _1400;
    }
    float _1406 = _1368;
    float _1408 = _1268;
    float _1410 = _1362;
    float _1412 = -_1036;
    float _1414 = _1412 + _1406;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1418 = -_1050;
    float _1420 = _1418 + _1408;
    float _1422 = _1320 * _826;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1414 + _1424;
    float _1428 = _1324 * _826;
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1314 * _826;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1420 + _1434;
    float _1438 = _1426 * _1426;
    float _1440 = -_1066;
    float _1442 = _1440 + _1410;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1446 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = fma(_1436, _1436, _1438);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1452 = _1442 + _1450;
    float _1454 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1456 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1460 = fma(_1452, _1452, _1448);
    float _1462 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    float _1468 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1454);
    float _1470 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1472 = sqrt(_1460);
    out.m_93.x = _1458;
    out.m_93.y = _1462;
    out.m_93.z = _1430;
    out.m_93.w = _1464;
    float _1474 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1476 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1468);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1480 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1346);
    float _1482 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1348);
    float _1484 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1350);
    out.m_95.w = _972;
    float _1486 = -_1036;
    float _1488 = _836 + _1486;
    float _1490 = -_1050;
    float _1492 = _838 + _1490;
    out.m_97.x = _1476;
    out.m_97.y = _1474;
    out.m_97.z = _1478;
    float _1494 = -_1066;
    float _1496 = _846 + _1494;
    float _1498 = _990 + 0.5;
    float _1500 = _1164 + 0.5;
    float _1502 = _1334 + 0.5;
    float _1504 = _1332 + 0.5;
    out.m_99.x = _1176;
    bool _1506 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1508 = isnan(_1472);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1514 = _1510 || _1512;
    out.m_101.x = _1504;
    out.m_101.y = _1498;
    out.m_101.z = _1502;
    out.m_101.w = _1500;
    out.m_103.x = _1480;
    out.m_103.y = _1482;
    out.m_103.z = _1484;
    if (!_1514)
    {
        _900 = 1.0;
    }
    float _1516 = _900;
    bool _1518 = !_1514;
    float _1520 = _1516;
    if (!_1518)
    {
        bool _1522 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1524 = isnan(_1472);
        bool _1526 = _1522 || _1524;
        bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1530 = _1526 || _1528;
        if (!_1530)
        {
            float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1534 = _1472 + _1532;
            float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1538 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1536;
            float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1542 = _1540 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1544 = 1.0 / _1538;
            float _1546 = _1534 * _1544;
            float _1548 = fma(_1546, _1542, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1520 = _1548;
            _1550 = true;
        }
        else
        {
            bool _1552 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1554 = isnan(_1472);
            bool _1556 = _1552 || _1554;
            bool _1558 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1560 = _1556 || _1558;
            if (!_1560)
            {
                float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1564 = _1472 + _1562;
                float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1572 = _1570 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1574 = 1.0 / _1568;
                float _1576 = _1564 * _1574;
                float _1578 = fma(_1576, _1572, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1520 = _1578;
                _1550 = true;
            }
            else
            {
                _1520 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1550 = false;
    float _1580 = _1520;
    float _1582 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1584 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1586 = floor(_1582);
    float _1588 = floor(_1584);
    float _1590 = -_1586;
    float _1592 = _1582 + _1590;
    float _1594 = -_1588;
    float _1596 = _1584 + _1594;
    float2 _5628 = float2(_1592, _1596);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5628, float2(0.0), isnan(_5628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5628, float2(0.0), isnan(_5628)), level(0.0)).x;
    float _1600 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1602 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1606 = _1442 + _1604;
    float _1608 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1600);
    float _1610 = _1488 + _1602;
    float _1612 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1608);
    float _1614 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1616 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1618 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1622 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1614);
    float _1624 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1616);
    float _1626 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1618);
    float _1628 = 1.0 / _1620;
    float _1630 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1622);
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1624);
    float _1634 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1626);
    float _1636 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1638 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1644 = _1414 + _1642;
    float _1646 = _1636 + _1620;
    float _1648 = fma(_1644, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1650 = _1646 * _1628;
    float _1652 = _1650 * 0.5;
    float _1654 = -_1488;
    float _1656 = _1654 + _1648;
    float _1658 = trunc(_1638);
    int _1660 = int(_1658);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1662);
    float _1666 = _1656 * _1656;
    float _1668 = 1.0 / _1664;
    float _1670 = trunc(_1640);
    int _1672 = int(_1670);
    int _1674 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1676 = _1660 + _1674;
    int _1678 = _1676 + 1;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1682 = _1668 * _1680;
    bool _1684 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1686 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1688 = !_1684;
    int _1690 = _1688 ? 0 : 1;
    int _1692 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1694 = _1672 + _1692;
    int _1696 = _1694 + 1;
    float _1698 = fma(_1606, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1700 = _1678 | _1696;
    float _1702 = -_1496;
    float _1704 = _1702 + _1698;
    int _1706 = 2;
    int _1708 = _1678;
    int _1710 = as_type<int>(_1596);
    float _1712 = _1698;
    if (!_1684)
    {
        _1706 = 1;
    }
    int _1714 = _1706;
    int _1716 = _1714;
    if (!_1686)
    {
        _1716 = _1690;
    }
    int _1718 = _1716;
    bool _1720 = _1678 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1722 = _1718 << 6;
    bool _1724 = _1700 < 0;
    bool _1726 = _1724 || _1720;
    int _1728 = _1722 + 96;
    uint _1731 = uint(int(uint(_1728) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    bool _1747 = _1696 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1749 = _1747 || _1726;
    int _1751 = _1722 + 104;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = as_type<float>(_1718);
    if (!_1749)
    {
        int _1771 = _1696 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1773 = _1771 + _1678;
        _1708 = _1773;
    }
    int _1775 = _1708;
    int _1777 = _1722 + 48;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1797 = _1420 + _1795;
    if (!_1749)
    {
        int _1799 = _1775 << 2;
        _1356 = _1799;
    }
    int _1801 = _1356;
    float _1803 = fma(_1797, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1805 = _1801;
    if (!_1749)
    {
        uint _1807 = uint(int(uint(_1775) >> uint(2)));
        _1710 = int(_1807);
    }
    int _1809 = _1710;
    int _1811 = _1722 + 64;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    uint _1815 = uint(int(uint(int(_1813)) >> uint(2)));
    int _1817 = int(_1813) & 3;
    float _1819 = (*spvDescriptorSet0.vp_c15)._m0[int(_1815)][_1817];
    int _1821 = int(_1813) + 1;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    int _1825 = _1821 & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    if (!_1749)
    {
        int _1829 = 12 & _1801;
        _1805 = _1829;
    }
    int _1831 = _1805;
    if (!_1749)
    {
        int _1833 = _1809 << 4;
        int _1835 = _1833 + _1831;
        _1358 = as_type<float>(_1835);
    }
    float _1837 = _1358;
    float _1839 = -_1492;
    float _1841 = _1839 + _1803;
    int _1843 = _1722 + 56;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    uint _1847 = uint(int(uint(int(_1845)) >> uint(2)));
    int _1849 = int(_1845) & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    int _1853 = int(_1845) + 1;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    int _1857 = _1853 & 3;
    float _1859 = (*spvDescriptorSet0.vp_c15)._m0[int(_1855)][_1857];
    float _1861 = fma(_1841, _1841, _1666);
    float _1863 = fma(_1704, _1704, _1861);
    int _1865 = _1722 + 72;
    uint _1867 = uint(int(uint(_1865) >> uint(2)));
    uint _1869 = uint(int(uint(int(_1867)) >> uint(2)));
    int _1871 = int(_1867) & 3;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
    int _1875 = int(_1867) + 1;
    uint _1877 = uint(int(uint(_1875) >> uint(2)));
    int _1879 = _1875 & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    float _1883 = sqrt(_1863);
    int _1885 = _1722 + 80;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    uint _1889 = uint(int(uint(int(_1887)) >> uint(2)));
    int _1891 = int(_1887) & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    int _1895 = int(_1887) + 1;
    uint _1897 = uint(int(uint(_1895) >> uint(2)));
    int _1899 = _1895 & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    float _1903 = _1610 * _1745;
    float _1905 = fma(_1492, _1737, _1903);
    int _1907 = _1722 + 88;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    float _1925 = fma(_1496, _1759, _1905);
    bool _1927 = _1883 > 0.0;
    float _1929 = _1925 + _1767;
    float _1931 = _1837;
    float _1933 = _1737;
    float _1935 = _1905;
    float _1937 = _1841;
    if (!_1749)
    {
        int _1939 = as_type<int>(_1837) + 400;
        uint _1941 = uint(int(uint(_1939) >> uint(2)));
        uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
        int _1945 = int(_1941) & 3;
        float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
        _1931 = _1947;
    }
    float _1949 = _1931;
    float _1951 = _1610 * _1793;
    float _1953 = 1.0 / _1929;
    float _1955 = fma(_1492, _1785, _1951);
    if (!_1927)
    {
        _1933 = _1803;
    }
    float _1957 = _1933;
    float _1959 = _1610 * _1827;
    float _1961 = _1957;
    float _1963 = _1819;
    if (!_1927)
    {
        _1935 = _1648;
    }
    float _1965 = _1935;
    float _1967 = fma(_1492, _1819, _1959);
    float _1969 = fma(_1496, _1851, _1955);
    float _1971 = fma(_1496, _1873, _1967);
    bool _1973 = !_1927;
    float _1975 = _1965;
    if (!_1973)
    {
        float _1977 = _224 * _224;
        float _1979 = fma(_228, _228, _1977);
        float _1981 = fma(_230, _230, _1979);
        float _1983 = rsqrt(_1863);
        float _1985 = sqrt(_1981);
        float _1987 = _1841 * _1983;
        float _1989 = _1656 * _1983;
        float _1991 = _1704 * _1983;
        bool _1993 = _1985 > 0.0;
        float _1995 = _1983;
        float _1997 = _1985;
        _1963 = _1987;
        if (!_1993)
        {
            _1995 = _1803;
        }
        float _1999 = _1995;
        _1961 = _1999;
        if (!_1993)
        {
            _1997 = _1648;
        }
        float _2001 = _1997;
        bool _2003 = !_1993;
        _1975 = _2001;
        if (!_2003)
        {
            float _2005 = rsqrt(_1981);
            float _2007 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2009 = _224 * _2005;
            float _2011 = _228 * _2005;
            float _2013 = _1989 * _2009;
            float _2015 = _230 * _2005;
            float _2017 = fma(_1987, _2011, _2013);
            float _2019 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2021 = fma(_1991, _2015, _2017);
            float _2023 = _2021 * _2019;
            float _2025 = fma(_228, _2023, _1803);
            float _2027 = fma(_224, _2023, _1648);
            float _2029 = fma(_230, _2023, _1698);
            _1975 = _2027;
            _1961 = _2025;
            _1712 = _2029;
        }
    }
    float _2031 = _1975;
    float _2033 = _1961;
    float _2035 = _1712;
    float _2037 = _1963;
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2041 = _1969 + _1859;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2045 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2039);
    float _2049 = _2041 * _1953;
    float _2051 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2043);
    float _2053 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2045);
    float _2055 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2047);
    float _2057 = _1971 + _1881;
    float _2059 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2051);
    bool _2061 = _2049 >= 0.0;
    float _2063 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2065 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2053);
    float _2067 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = _2057 * _1953;
    float _2071 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2073 = _2049 <= 1.0;
    bool _2075 = _2073 && _2061;
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2063);
    float _2079 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2081 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2083 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2085 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2087 = _2069 >= 0.0;
    bool _2089 = _2087 && _2075;
    float _2091 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2077);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2081);
    float _2095 = -_2085;
    float _2097 = fma(_2095, _2083, 1.0);
    bool _2099 = _2069 <= 1.0;
    bool _2101 = _2099 && _2089;
    float _2103 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2105 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2093);
    float _2107 = _1610 * _1901;
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = _2037;
    if (!_1749)
    {
        float _2113 = floor(_1638);
        _2111 = _2113;
    }
    float _2115 = _2111;
    float _2117 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2105);
    float _2119 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2121 = fma(_1492, _1893, _2107);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2125 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2119);
    float _2127 = fma(_1496, _1915, _2121);
    float _2129 = _1967;
    float _2131 = _2125;
    if (!_1749)
    {
        float _2133 = floor(_1640);
        _2129 = _2133;
    }
    float _2135 = _2129;
    if (_2101)
    {
        float _2137 = float(_1718);
        _1769 = _2137;
    }
    float _2139 = _1769;
    float _2141 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2123);
    float _2143 = _2127 + _1923;
    float _2145 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2141);
    float _2147 = _2143 * _1953;
    float _2149 = log2(_2097);
    float _2151 = _2139;
    if (!_1749)
    {
        float _2153 = -_2115;
        float _2155 = _1638 + _2153;
        _1937 = _2155;
    }
    float _2157 = _1937;
    float _2159 = 1.0 / _2117;
    float _2161 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    if (!_1749)
    {
        float _2163 = -_2135;
        float _2165 = _1640 + _2163;
        _2131 = _2165;
    }
    float _2167 = _2131;
    float _2169 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2161);
    float _2171 = _1949;
    if (!_1749)
    {
        float _2173 = rint(_1949);
        float _2175 = precise::max(_2173, 0.0);
        uint _2177 = uint(_2175);
        uint _2179 = clamp(_2177, 0u, 65535u);
        _2171 = as_type<float>(_2179);
    }
    float _2181 = _2171;
    float _2183 = _2149 * 0.693147182464599609375;
    float _2185 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2187 = _2123;
    float _2189 = _2185;
    if (_2101)
    {
        float _2191 = rint(_2139);
        float _2193 = precise::max(_2191, 0.0);
        uint _2195 = uint(_2193);
        uint _2197 = clamp(_2195, 0u, 65535u);
        _2187 = as_type<float>(_2197);
    }
    float _2199 = _2187;
    float _2201 = _2145 * _2159;
    float _2203 = _2169 * _2159;
    float _2205 = fma(_2201, 0.5, 0.5);
    float _2207 = fma(_2203, -0.5, 0.5);
    float _2209 = _2181;
    float _2211 = _2203;
    if (!_1749)
    {
        float3 _6681 = float3(_2157, _2167, float(as_type<int>(_2181)));
        float3 _6685 = select(_6681, float3(0.0), isnan(_6681));
        float _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6685.xy, uint(rint(_6685.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6685.xy, uint(rint(_6685.z)), level(0.0)).x;
        _2209 = _2213;
    }
    float _2215 = _2209;
    float _2217 = _2069;
    if (_2101)
    {
        float3 _6700 = float3(_2049, _2069, float(as_type<int>(_2199)));
        float3 _6702 = select(_6700, float3(0.0), isnan(_6700));
        float _2219 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6702.xy, uint(rint(_6702.z)), _2147, level(0.0));
        _2217 = _2219;
    }
    float _2221 = _2217;
    float3 _6712 = float3(_2205, _2207, _2185);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6712, float3(0.0), isnan(_6712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6712, float3(0.0), isnan(_6712)), level(0.0)).x;
    float3 _6721 = float3(_2205, _2207, _2185);
    float4 _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2228 = _2226.x;
    float _2230 = _2226.y;
    float _2232 = _2226.z;
    float _2234 = _2226.w;
    if (_1749)
    {
        _2211 = 1.0;
    }
    float _2236 = _2211;
    bool _2238 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(0.5);
    bool _2246 = _2242 || _2244;
    float _2248 = _2236;
    if (_2246)
    {
        _2151 = 1.0;
    }
    float _2250 = _2151;
    float _2252 = _2250;
    if (!_2246)
    {
        float _2254 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2256 = _2254 * 0.15915493667125701904296875;
        float _2258 = _2256 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        float _2262 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = _2256 * 6.283185482025146484375;
        float _2268 = sin(_2266);
        float _2270 = 1.0 / _2260;
        float _2272 = _2264 * 6.283185482025146484375;
        float _2274 = cos(_2272);
        float _2276 = _2268 * _2270;
        float _2278 = _2264 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = _2274 * _2276;
        float _2284 = 1.0 / _2282;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2288 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2286;
        float _2290 = 1.0 / _2288;
        float _2292 = _2280 * _2284;
        float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2296 = fma(_1682, _2292, _2294);
        float _2298 = _2296 * _2290;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        _2189 = _2264;
        _2252 = _2300;
    }
    float _2302 = _2189;
    float _2304 = _2252;
    float _2306 = _2302;
    if (!_1749)
    {
        int _2308 = _1775 << 4;
        int _2310 = _2308 + 2048;
        uint _2312 = uint(int(uint(_2310) >> uint(2)));
        uint _2314 = uint(int(uint(int(_2312)) >> uint(2)));
        int _2316 = int(_2312) & 3;
        float _2318 = (*spvDescriptorSet0.vp_c15)._m0[int(_2314)][_2316];
        int _2320 = int(_2312) + 1;
        uint _2322 = uint(int(uint(_2320) >> uint(2)));
        int _2324 = _2320 & 3;
        float _2326 = (*spvDescriptorSet0.vp_c15)._m0[int(_2322)][_2324];
        int _2328 = _2310 + 8;
        uint _2330 = uint(int(uint(_2328) >> uint(2)));
        uint _2332 = uint(int(uint(int(_2330)) >> uint(2)));
        int _2334 = int(_2330) & 3;
        float _2336 = (*spvDescriptorSet0.vp_c15)._m0[int(_2332)][_2334];
        int _2338 = int(_2330) + 1;
        uint _2340 = uint(int(uint(_2338) >> uint(2)));
        int _2342 = _2338 & 3;
        float _2344 = (*spvDescriptorSet0.vp_c15)._m0[int(_2340)][_2342];
        float _2346 = _1610 * _2326;
        float _2348 = fma(_1492, _2318, _2346);
        float _2350 = fma(_1496, _2336, _2348);
        float _2352 = _2350 + _2344;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        float _2356 = -_2354;
        float _2358 = _2356 + _2215;
        float _2360 = fma(_2358, 500.0, 1.5);
        float _2362 = exp2(_2360);
        float _2364 = 0.0 + _2362;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2306 = _2344;
        _2248 = _2366;
    }
    float _2368 = _2306;
    float _2370 = _2248;
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2374 = _2031 + _2372;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2378 = _2033 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2382 = _2035 + _2380;
    float _2384 = _2374 * _2374;
    float _2386 = fma(_2378, _2378, _2384);
    float _2388 = fma(_2382, _2382, _2386);
    float _2390 = rsqrt(_2388);
    float _2392 = sqrt(_2388);
    float _2394 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2396 = _2378 * _2394;
    float _2398 = _2382 * _2394;
    float _2400 = _2396 * _2396;
    float _2402 = _2398 * _2398;
    float _2404 = _2400 + _2402;
    float _2406 = sqrt(_2404);
    bool _2408 = _2406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2412 = _2406 + _2410;
    float _2414 = _2382;
    float _2416 = _2404;
    float _2418 = _2412;
    float _2420 = _2368;
    float _2422 = _2394;
    if (_2408)
    {
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2414 = _2424;
    }
    float _2426 = _2414;
    if (_2408)
    {
        float _2428 = rsqrt(_2404);
        _2416 = _2428;
    }
    float _2430 = _2416;
    if (_2408)
    {
        float _2432 = _2412 * _2426;
        _2418 = _2432;
    }
    float _2434 = _2418;
    if (_2408)
    {
        float _2436 = _2434 * 0.15915493667125701904296875;
        _2420 = _2436;
    }
    float _2438 = _2420;
    float _2440 = _2384;
    float _2442 = _2438;
    if (_2408)
    {
        float _2444 = _2438 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        _2440 = _2446;
    }
    float _2448 = _2440;
    float _2450 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2452 = precise::max(0.0, _2450);
    float _2454 = _2390;
    float _2456 = _2452;
    float _2458 = _2450;
    if (_2408)
    {
        float _2460 = _2438 * 6.283185482025146484375;
        float _2462 = cos(_2460);
        _2454 = _2462;
    }
    float _2464 = _2454;
    float _2466 = -_2394;
    float _2468 = -_2452;
    float _2470 = fma(_2374, _2466, _2468);
    float _2472 = _2470;
    if (!_2408)
    {
        _2456 = _2396;
    }
    float _2474 = _2456;
    float _2476 = _2474;
    if (_2408)
    {
        float _2478 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2458 = _2478;
    }
    float _2480 = _2458;
    float _2482 = _2448;
    float _2484 = _2480;
    if (_2408)
    {
        float _2486 = fma(_2448, _2480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2482 = _2486;
    }
    float _2488 = _2482;
    float _2490 = _2488;
    float _2492 = _2464;
    if (_2408)
    {
        float _2494 = _2464 + (-1.0);
        _2484 = _2494;
    }
    float _2496 = _2484;
    float _2498 = _2496;
    if (_2408)
    {
        float _2500 = _2430 * _2488;
        _2422 = _2500;
    }
    float _2502 = _2422;
    if (!_2408)
    {
        _2490 = _2400;
    }
    float _2504 = _2490;
    float _2506 = _2504;
    if (_2408)
    {
        float _2508 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2442 = _2508;
    }
    float _2510 = _2442;
    if (_2408)
    {
        float _2512 = _2396 * _2502;
        _2476 = _2512;
    }
    float _2514 = _2476;
    if (!_2408)
    {
        _2498 = _2398;
    }
    float _2516 = _2498;
    float _2518 = _2516;
    if (_2408)
    {
        float _2520 = _2398 * _2502;
        _2518 = _2520;
    }
    float _2522 = _2518;
    if (_2408)
    {
        float _2524 = fma(_2470, _2464, _2510);
        _2472 = _2524;
    }
    float _2526 = _2472;
    if (_2408)
    {
        float _2528 = _2514 * _2514;
        _2506 = _2528;
    }
    float _2530 = _2506;
    if (!_2408)
    {
        _2492 = _2402;
    }
    float _2532 = _2492;
    float _2534 = _2532;
    if (_2408)
    {
        float _2536 = _2522 * _2522;
        _2534 = _2536;
    }
    float _2538 = _2534;
    float _2540 = fma(_2526, _2526, _2530);
    float _2542 = _2540 + _2538;
    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2546 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2544);
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = rsqrt(_2542);
    float _2552 = -_2548;
    float _2554 = _2552 + 1.0;
    float _2556 = abs(_2554);
    float _2558 = log2(_2556);
    float _2560 = _2550 * _2514;
    float _2562 = _2550 * _2526;
    float _2564 = _2550 * _2522;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2568 = -_2566;
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2568);
    float _2572 = -_2564;
    float _2574 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2570);
    float _2576 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2578 = fma(_2574, -0.5, 0.5);
    float _2580 = fma(_2574, 0.5, 0.5);
    float _2582 = _2562 + 1.0;
    float _2584 = exp2(_2576);
    float _2586 = fma(_2580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2588 = fma(_2580, _2586, -0.212114393711090087890625);
    float _2590 = sqrt(_2578);
    float _2592 = fma(_2580, _2588, 1.570728778839111328125);
    float _2594 = -_2562;
    float _2596 = fma(_2584, _2582, _2594);
    float _2598 = fma(_2596, 0.5, 0.5);
    float _2600 = _2590 * 0.636619746685028076171875;
    float _2602 = -_2592;
    float _2604 = fma(_2600, _2602, 1.0);
    float2 _7286 = float2(_2604, _2598);
    float3 _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7286, float2(0.0), isnan(_7286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7286, float2(0.0), isnan(_7286)), level(0.0)).xyz;
    float _2610 = _2608.x;
    float _2612 = _2608.y;
    float _2614 = _2608.z;
    float _2616 = abs(_1682);
    float _2618 = log2(_2616);
    float _2620 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2622 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2624 = -_1598;
    float _2626 = _2624 + 1.0;
    float _2628 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2620);
    out.m_105.x = _1492;
    out.m_105.y = _1488;
    out.m_105.z = _1496;
    float _2630 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2628);
    float _2632 = exp2(_2622);
    bool _2634 = _1682 <= 8000.0;
    bool _2636 = isnan(_1682);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(8000.0);
    bool _2642 = _2638 || _2640;
    float _2644 = float(_2642);
    out.m_107.x = _2033;
    out.m_107.y = _2031;
    out.m_107.z = _2035;
    float _2646 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2630);
    float _2648 = _2117 * 0.5;
    bool _2650 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2652 = isnan(_2392);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2658 = _2654 || _2656;
    float _2660 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2662 = _2646 + _2117;
    float _2664 = fma(_2169, -0.5, _2648);
    float _2666 = _2145 + _2117;
    float _2668 = _2662 * 0.5;
    float _2670 = exp2(_2660);
    out.gl_Position.x = _2145;
    out.gl_Position.y = _2169;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _2117;
    float _2672 = _2666 * 0.5;
    float _2674 = -_2632;
    float _2676 = _2674 + 1.0;
    out.m_109.x = _2672;
    out.m_109.y = _2664;
    out.m_109.z = _2668;
    out.m_109.w = _2117;
    float _2678 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2680 = _2676;
    if (!_2658)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2682 = _2680;
    float _2684 = _2304 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2686 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = fma(_2688, -2.0, 3.0);
    float _2692 = _2688 * _2688;
    float _2694 = _2692 * _2690;
    float _2696 = -_2694;
    float _2698 = _2696 + 1.0;
    float _2700 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2694);
    float _2702 = _2644 * _2700;
    float _2704 = _2700;
    float _2706 = _2682;
    float _2708 = _2682;
    if (!_2101)
    {
        _2704 = 1.0;
    }
    float _2710 = _2704;
    float _2712 = _2710;
    if (_2101)
    {
        bool _2714 = _2221 >= _2147;
        bool _2716 = isnan(_2221);
        bool _2718 = _2714 || _2716;
        bool _2720 = isnan(_2147);
        bool _2722 = _2718 || _2720;
        float _2724 = float(_2722);
        _2712 = _2724;
    }
    float _2726 = _2712;
    float _2728 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2730 = _2626 * _2728;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2726 * _2370;
    float _2736 = _2678 * _2223;
    float _2738 = -_2678;
    float _2740 = _2738 + 1.0;
    float _2742 = -_2732;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = _2234 * _2736;
    float _2748 = _2234 * _2740;
    float _2750 = -_2734;
    float _2752 = fma(_2750, _2744, 1.0);
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = _2740;
    float _2758 = _2734;
    float _2760 = _2754;
    float _2762 = _2746;
    float _2764 = _2736;
    if (!_2658)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2766 = _2756;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2658)
    {
        _2758 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2772 = _2758;
    float _2774 = _2754 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2776 = _2772;
    float _2778 = _2772;
    if (!_2658)
    {
        _2760 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2780 = _2760;
    out.m_111.x = _2774;
    float _2782 = _2614 * _2736;
    float _2784 = fma(_2610, _2746, _2228);
    float _2786 = fma(_2612, _2746, _2230);
    float _2788 = _2780;
    float _2790 = _2780;
    if (!_2658)
    {
        _2762 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2792 = _2762;
    float _2794 = fma(_2234, _2782, _2232);
    float _2796 = _2792;
    float _2798 = _2792;
    if (!_2658)
    {
        _2764 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2800 = _2764;
    out.m_113.x = _2784;
    out.m_113.y = _2786;
    out.m_113.z = _2794;
    out.m_113.w = _2748;
    bool _2802 = !_2658;
    float _2804 = _2800;
    float _2806 = _2800;
    if (!_2802)
    {
        bool _2808 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2810 = isnan(_2392);
        bool _2812 = _2808 || _2810;
        bool _2814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2816 = _2812 || _2814;
        if (!_2816)
        {
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2820 = _2392 + _2818;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2824 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2822;
            float _2826 = 1.0 / _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2848 = _2820 * _2826;
            float _2850 = precise::clamp(_2848, 0.0, 1.0);
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2856 = fma(_2850, _2830, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2858 = fma(_2850, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2860 = fma(_2850, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2862 = fma(_2850, _2838, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2864 = fma(_2850, _2842, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2866 = fma(_2850, _2846, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2708 = _2856;
            _2806 = _2864;
            _2770 = _2858;
            _2778 = _2862;
            _2798 = _2860;
            _2790 = _2866;
            _2868 = true;
        }
        else
        {
            bool _2870 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2872 = isnan(_2392);
            bool _2874 = _2870 || _2872;
            bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2878 = _2874 || _2876;
            if (!_2878)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2880 = _2768;
            _2770 = _2880;
            if (!_2878)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2882 = _2706;
            _2708 = _2882;
            if (!_2878)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2884 = _2796;
            _2798 = _2884;
            if (!_2878)
            {
                _2776 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2886 = _2776;
            _2778 = _2886;
            if (!_2878)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2888 = _2804;
            _2806 = _2888;
            if (!_2878)
            {
                _2788 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2890 = _2788;
            bool _2892 = !_2878;
            _2790 = _2890;
            if (!_2892)
            {
                bool _2894 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2896 = isnan(_2392);
                bool _2898 = _2894 || _2896;
                bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2902 = _2898 || _2900;
                if (!_2902)
                {
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2906 = _2392 + _2904;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2908;
                    float _2912 = 1.0 / _2910;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2934 = _2906 * _2912;
                    float _2936 = precise::clamp(_2934, 0.0, 1.0);
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2942 = fma(_2936, _2916, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2944 = fma(_2936, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2946 = fma(_2936, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2948 = fma(_2936, _2924, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2950 = fma(_2936, _2928, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2952 = fma(_2936, _2932, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2708 = _2942;
                    _2806 = _2950;
                    _2770 = _2944;
                    _2778 = _2948;
                    _2798 = _2946;
                    _2790 = _2952;
                    _2868 = true;
                }
                else
                {
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2778 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2790 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2868 = false;
    float _2954 = _2708;
    float _2956 = _2806;
    float _2958 = _2770;
    float _2960 = _2778;
    float _2962 = _2798;
    float _2964 = _2790;
    float _2966 = fma(_1482, -0.5, 0.5);
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = -_2954;
    float _2972 = _2970 + _2956;
    float _2974 = _2684 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2976 = -_2958;
    float _2978 = _2976 + _2960;
    out.m_115.x = 0.0;
    float _2980 = fma(_2968, _2972, _2954);
    float _2982 = fma(_2968, _2978, _2958);
    out.m_61.x = _2974;
    float _2984 = -_2962;
    float _2986 = _2984 + _2964;
    float _2988 = _2980 * 0.586610972881317138671875;
    bool _2990 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2992 = fma(_2968, _2986, _2962);
    float _2994 = fma(_2982, 0.298911988735198974609375, _2988);
    bool _2996 = _2304 > 0.0;
    bool _2998 = isnan(_2304);
    bool _3000 = _2996 || _2998;
    bool _3002 = isnan(0.0);
    bool _3004 = _3000 || _3002;
    float _3006 = fma(_2992, 0.114477999508380889892578125, _2994);
    float _3008 = -_3006;
    float _3010 = _2980 + _3008;
    float _3012 = -_3006;
    float _3014 = _2982 + _3012;
    float _3016 = -_3006;
    float _3018 = _2992 + _3016;
    float _3020 = fma(_3010, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    float _3022 = fma(_3014, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    float _3024 = fma(_3018, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    bool _3026 = !_2990;
    if (!_3026)
    {
        float _3028 = -_2031;
        float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3032 = -_2033;
        float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3036 = -_2035;
        float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3040 = _3030 * _3030;
        float _3042 = fma(_3034, _3034, _3040);
        float _3044 = fma(_3038, _3038, _3042);
        float _3046 = sqrt(_3044);
        float _3048 = rsqrt(_3044);
        float _3050 = -_3046;
        float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3056 = precise::clamp(_3054, 0.0, 1.0);
        float _3058 = _3034 * _3048;
        float _3060 = _3030 * _3048;
        float _3062 = abs(_3056);
        float _3064 = log2(_3062);
        float _3066 = _3038 * _3048;
        float _3068 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3070 = _1482 * _3060;
        float _3072 = -_3060;
        float _3074 = -_3068;
        float _3076 = fma(_3072, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3074);
        float _3078 = fma(_1480, _3058, _3070);
        float _3080 = -_3066;
        float _3082 = fma(_3080, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3076);
        float _3084 = fma(_1484, _3066, _3078);
        float _3086 = precise::clamp(_3084, 0.0, 1.0);
        float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3090 = _3082 + _3088;
        float _3092 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3094 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3096 = precise::clamp(_3094, 0.0, 1.0);
        float _3098 = exp2(_3092);
        float _3100 = _3098 * _3096;
        float _3102 = _3086 * _3100;
        float _3104 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3108 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_115.x = _3104;
        out.m_115.y = _3106;
        out.m_115.z = _3108;
    }
    out.m_95.x = _3022;
    out.m_95.y = _3020;
    out.m_95.z = _3024;
    if (_3004)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3110 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3110;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2868 = false;
    bool _1550 = false;
    bool _688 = false;
    bool _546 = false;
    bool _252 = false;
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
        float _3167 = as_type<float>(_150);
        out.gl_Position.z = _3167;
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
    float _170 = 0.0;
    if (_164)
    {
        float _172 = float(_134);
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    if (_180)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _144;
    if (_180)
    {
        out.m_61.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _152 = as_type<int>(_184);
    }
    int _186 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3235 = as_type<float>(_186);
        out.gl_Position.z = _3235;
    }
    if (_180)
    {
        return out;
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_67.x;
    float _198 = in.m_67.y;
    float _200 = in.m_67.z;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_73.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_134);
        float _256 = 1.0 / _254;
        float _258 = _168 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _290 = 1.0 / _276;
    bool _292 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_260);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    bool _304 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_260);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _280;
    float _318 = -_302;
    float _320 = _318 + 1.0;
    float _322 = _314 * _320;
    float _324 = -_314;
    float _326 = _324 + 1.0;
    float _328 = 1.0 / _288;
    float _330 = _264 * _290;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _260 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = fma(_338, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = 1.0 / _284;
    float _354 = _268 * _316;
    bool _356 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_260);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_342, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _370 = -_366;
    float _372 = _370 + 1.0;
    float _374 = _334 * _328;
    bool _376 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _378 = isnan(_260);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _386 * _372;
    float _390 = _272 * _352;
    float _392 = -_386;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _302 * _394;
    float _406 = fma(_398, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_402, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _410 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_260);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = _420 * _326;
    float _432 = -_420;
    float _434 = _432 + 1.0;
    float _436 = fma(_424, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _438 = fma(_428, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _440 = _406 * _430;
    float _442 = _350 * _430;
    float _444 = _408 * _430;
    float _446 = in.m_75.x;
    float _448 = in.m_75.y;
    float _450 = in.m_75.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _462 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _464 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_346, _390, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _470 = fma(_458, _390, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_436, _322, _460);
    float _474 = fma(_368, _322, _462);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_438, _322, _468);
    float _490 = fma(_478, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_464, _404, _472);
    float _496 = fma(_466, _404, _474);
    float _498 = fma(_486, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _500 = fma(_470, _404, _488);
    float _502 = fma(_490, _388, _494);
    float _504 = fma(_492, _388, _496);
    float _506 = fma(_498, _388, _500);
    float _508 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].x, _502);
    float _510 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].y, _504);
    float _512 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].z, _506);
    float _514 = _508 * _446;
    float _516 = _510 * _448;
    float _518 = _512 * _450;
    bool _520 = !_348;
    float _522 = _460;
    float _524 = _464;
    float _526 = _516;
    float _544;
    if (!_520)
    {
        float _528 = in.m_73.x;
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _536 = _534 * _530;
        float _538 = floor(_536);
        float _540 = -_538;
        float _542 = _536 + _540;
        _544 = _542;
        _546 = true;
    }
    else
    {
        float _548 = float(_134);
        float _550 = 1.0 / _548;
        float _552 = _168 * _550;
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
    float _616 = _590 * _612;
    float _618 = -_590;
    float _620 = _618 + 1.0;
    float _622 = 1.0 / _578;
    float _624 = _594 * _608;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = fma(_624, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _632 = _628 * _622;
    float _634 = _630 * _616;
    float _636 = -_606;
    float _638 = _636 + 1.0;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _554 + _640;
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _634);
    float _646 = _574 * _638;
    float _648 = fma(_632, _642, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_648, _646, _644);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[117].x, _652);
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_77.x = _660;
    out.m_77.y = _662;
    out.m_77.z = _664;
    out.m_77.w = _666;
    bool _668 = !_614;
    float _686;
    if (!_668)
    {
        float _670 = in.m_73.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_134);
        float _692 = 1.0 / _690;
        float _694 = _168 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_58.x;
    float _700 = in.m_58.y;
    float _702 = in.m_58.z;
    float _704 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = in.m_73.w;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _714 = in.m_79.y;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _718 = in.m_73.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_73.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _728 = _726 != 0;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _734 = _732 != 0;
    float _736 = in.m_73.x;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _740 = _738 != 0;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _744 = _204 * _700;
    float _746 = _198 * _700;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _748 = _210 * _700;
    bool _750 = _706 > 0.5;
    float _752 = fma(_202, _698, _744);
    float _754 = in.m_67.w;
    float _756 = -_714;
    float _758 = _756 + 1.0;
    float _760 = fma(_196, _698, _746);
    float _762 = fma(_208, _698, _748);
    float _764 = in.m_69.w;
    bool _766 = _718 > 0.5;
    float _768 = fma(_200, _702, _760);
    float _770 = _718;
    float _772 = _714;
    float _774 = _712;
    if (!_710)
    {
        _522 = _718;
    }
    float _776 = _522;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _780 = _776;
    if (!_710)
    {
        _524 = _724;
    }
    float _782 = _524;
    float _784 = in.m_71.w;
    float _786 = _782;
    if (_710)
    {
        _780 = _724;
    }
    float _788 = _780;
    float _790 = fma(_206, _702, _752);
    int _792 = as_type<int>(_788);
    if (_710)
    {
        _786 = _736;
    }
    float _794 = _786;
    float _796 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_710)
    {
        _770 = _724;
    }
    float _798 = _770;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _802 = _750 ? as_type<int>(_758) : as_type<int>(_714);
    float _804 = -_778;
    float _806 = fma(_796, 2.0, _804);
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _810 = _808 != 0;
    float _812 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _816 = _814 != 0;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _820 = in.m_83.x;
    float _822 = in.m_83.y;
    float _824 = in.m_83.z;
    float _826 = in.m_83.w;
    float _828 = _734 ? as_type<float>(_802) : _714;
    float _830 = fma(_812, -2.0, _730);
    bool _832 = _724 > 0.5;
    float _834 = fma(_212, _702, _762);
    float _836 = _768 + _754;
    float _838 = _790 + _764;
    int _840 = _832 ? as_type<int>(_758) : as_type<int>(_714);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _844 = _836 + _842;
    float _846 = _834 + _784;
    float _848 = _810 ? as_type<float>(_840) : _714;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _854 = _844 * _844;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = 1.0 / _852;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _874 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].w, _818);
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _878 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _880 = 1.0 / _864;
    float _882 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _884 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _878);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _890 = _838 + _888;
    float _892 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _882);
    float _894 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    bool _896 = _810;
    float _898 = _800;
    float _900 = _836;
    if (_722)
    {
        bool _902 = _736 > 0.5;
        _896 = _902;
    }
    bool _904 = _896;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _908 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _910 = fma(_890, _890, _854);
    float _912 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].z, _892);
    float _914 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].z, _894);
    float _916 = _872 * _860;
    float _918 = fma(_858, _858, _910);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _922 = _696 + _920;
    float _924 = _868 * _880;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _928 = _696 + _926;
    float _930 = sqrt(_918);
    float _932 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _876);
    float _934 = fma(_924, _922, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _936 = fma(_916, _928, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    out.m_85.x = _908;
    out.m_85.y = _912;
    out.m_85.z = _914;
    float _938 = _800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _940 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    if (_816)
    {
        float _942 = _766 ? _758 : _714;
        _772 = _942;
    }
    float _944 = _772;
    float _946 = fma(_938, _848, -0.5);
    float _948 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _932);
    float _950 = in.m_79.x;
    float _952 = _716 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _956 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _958 = _906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _960 = rsqrt(_918);
    float _962 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _964 = _930 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _968 = fma(_828, _958, -0.5);
    float _970 = _742 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _972 = precise::min(_962, _964);
    float _974 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[83].w, _966);
    bool _976 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _978 = isnan(_696);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_940;
    float _990 = fma(_956, _946, _988);
    bool _992 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _994 = isnan(_696);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = in.m_87.x;
    float _1006 = in.m_87.y;
    float _1008 = in.m_87.z;
    bool _1010 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1012 = isnan(_696);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -_986;
    float _1024 = _1022 + 1.0;
    float _1026 = _960 * _972;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1030 = _1020 * _1024;
    float _1032 = -_1020;
    float _1034 = _1032 + 1.0;
    float _1036 = _844 * _1026;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1040 = _960;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1044 = _950;
    if (!_722)
    {
        _898 = _950;
    }
    float _1046 = _898;
    float _1048 = _1002 * _1034;
    float _1050 = _890 * _1026;
    float _1052 = -_1036;
    float _1054 = _844 + _1052;
    float _1056 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1038);
    float _1058 = _794 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1060 = -_1050;
    float _1062 = _890 + _1060;
    float _1064 = _1054 * _1054;
    float _1066 = _858 * _1026;
    float _1068 = -_954;
    float _1070 = fma(_1058, 2.0, _1068);
    float _1072 = _934 * _1048;
    float _1074 = fma(_1062, _1062, _1064);
    float _1076 = -_1066;
    float _1078 = _858 + _1076;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1082 = in.m_89.x;
    float _1084 = in.m_89.y;
    float _1086 = in.m_89.z;
    bool _1088 = _1006 != 0.0;
    bool _1090 = isnan(_1006);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.0);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_1078, _1078, _1074);
    float _1100 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1102 = _1046;
    if (_722)
    {
        float _1104 = -_950;
        float _1106 = _1104 + 1.0;
        _792 = as_type<int>(_1106);
    }
    int _1108 = _792;
    bool _1110 = _1004 == 0.0;
    bool _1112 = !_1096;
    bool _1114 = _1110 && _1112;
    float _1116 = sqrt(_1098);
    float _1118 = fma(_1100, -2.0, _1080);
    float _1120 = -_1002;
    float _1122 = _1120 + 1.0;
    bool _1124 = _1008 == 0.0;
    bool _1126 = _1124 && _1114;
    float _1128 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1056);
    float _1130 = -_168;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1070);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1072);
    float _1136 = -_168;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    float _1140 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1118);
    float _1142 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _974);
    float _1144 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1146 = fma(_936, _1030, _1134);
    int _1148 = 0;
    float _1150 = as_type<float>(_1108);
    if (_728)
    {
        float _1152 = -_950;
        float _1154 = _1152 + 1.0;
        _1148 = as_type<int>(_1154);
    }
    int _1156 = _1148;
    if (_722)
    {
        float _1158 = _904 ? as_type<float>(_1108) : _950;
        _1102 = _1158;
    }
    float _1160 = _1102;
    float _1162 = -_1140;
    float _1164 = fma(_1142, _968, _1162);
    float _1166 = _960 * _1116;
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    if (_1126)
    {
        _1040 = _1082;
    }
    float _1170 = _1040;
    float _1172 = fma(_952, _1160, -0.5);
    float _1174 = _1144 * _1166;
    float _1176 = _704 * _1166;
    float _1178 = _712 * _1166;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1182 = _1170;
    if (_1126)
    {
        _526 = _1170;
    }
    float _1184 = _526;
    float _1186 = _1174 * _1168;
    float _1188 = _1184;
    if (_1126)
    {
        _1042 = _1084;
    }
    float _1190 = _1042;
    float _1192 = _1176 * _1180;
    float _1194 = _1190;
    if (!_1126)
    {
        _1182 = _1082;
    }
    float _1196 = _1182;
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    if (_1126)
    {
        _774 = _1190;
    }
    float _1200 = _774;
    float _1202 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1204 = _1202;
    float _1206 = _1200;
    if (!_1126)
    {
        _1194 = _1084;
    }
    float _1208 = _1194;
    float _1210 = _1178 * _1198;
    float _1212 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1214 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1202);
    float _1216 = _1214;
    if (_1126)
    {
        _1204 = _1086;
    }
    float _1218 = _1204;
    float _1220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1212);
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1214);
    float _1226 = _1218;
    if (_1126)
    {
        _1216 = _1218;
    }
    float _1228 = _1216;
    int _1230 = 0;
    float _1232 = _1228;
    if (_740)
    {
        float _1234 = -_950;
        float _1236 = _1234 + 1.0;
        _1230 = as_type<int>(_1236);
    }
    int _1238 = _1230;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1222);
    float _1242 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_1126)
    {
        _1226 = _1086;
    }
    float _1244 = _1226;
    float _1246 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = _846 + _1242;
    float _1252 = _1250;
    if (!_728)
    {
        _1150 = _950;
    }
    float _1254 = _1150;
    float _1256 = _1254;
    if (!_1126)
    {
        float _1258 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1244);
        _1232 = _1258;
    }
    float _1260 = _1232;
    float _1262 = _838 + _1248;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1250 + _1264;
    float _1268 = _1262;
    if (_728)
    {
        float _1270 = _766 ? as_type<float>(_1156) : _950;
        _1256 = _1270;
    }
    float _1272 = _1256;
    if (!_1126)
    {
        float _1274 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1196);
        _1188 = _1274;
    }
    float _1276 = _1188;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1280 = _1262 + _1278;
    float _1282 = _1266 * _1266;
    if (_740)
    {
        float _1284 = _832 ? as_type<float>(_1238) : _950;
        _1044 = _1284;
    }
    float _1286 = _1044;
    float _1288 = fma(_970, _1272, -0.5);
    float _1290 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1292 = fma(_1280, _1280, _1282);
    if (!_1126)
    {
        float _1294 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1208);
        _1206 = _1294;
    }
    float _1296 = _1206;
    float _1298 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1300 = _820 * _1208;
    float _1302 = sqrt(_1292);
    float _1304 = _944 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1306 = _1298 * _1220;
    float _1308 = _824 * _1196;
    float _1310 = _822 * _1244;
    float _1312 = -_1300;
    float _1314 = fma(_822, _1196, _1312);
    float _1316 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1290);
    float _1318 = -_1308;
    float _1320 = fma(_820, _1244, _1318);
    float _1322 = -_1310;
    float _1324 = fma(_824, _1208, _1322);
    float _1326 = _1304 * _1028;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1330 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1146);
    float _1332 = fma(_948, _1172, _1138);
    float _1334 = fma(_1128, _1288, _1132);
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1340 = _1302 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1344 = _836 + _1328;
    out.m_91.x = _1306;
    out.m_91.y = _1326;
    float _1346 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1348 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1338);
    float _1350 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1342);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = _1306;
    int _1356 = as_type<int>(_1334);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (!_1340)
    {
        _1354 = _1250;
    }
    float _1360 = _1354;
    float _1362 = _1360;
    if (!_1340)
    {
        _1252 = _1344;
    }
    float _1364 = _1252;
    bool _1366 = !_1340;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1302 + _1372;
        float _1376 = rsqrt(_1292);
        float _1378 = _1374 * _1370;
        float _1380 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1378 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        float _1392 = fma(_1386, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = _1376 * _1392;
        float _1396 = _1390 + (-1.0);
        float _1398 = fma(_1280, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1266, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1344, _1390, _1402);
        _1368 = _1404;
        _1268 = _1398;
        _1362 = _1400;
    }
    float _1406 = _1368;
    float _1408 = _1268;
    float _1410 = _1362;
    float _1412 = -_1036;
    float _1414 = _1412 + _1406;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1418 = -_1050;
    float _1420 = _1418 + _1408;
    float _1422 = _1320 * _826;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1414 + _1424;
    float _1428 = _1324 * _826;
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1314 * _826;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1420 + _1434;
    float _1438 = _1426 * _1426;
    float _1440 = -_1066;
    float _1442 = _1440 + _1410;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1446 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = fma(_1436, _1436, _1438);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1452 = _1442 + _1450;
    float _1454 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1456 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1460 = fma(_1452, _1452, _1448);
    float _1462 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    float _1468 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1454);
    float _1470 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1472 = sqrt(_1460);
    out.m_93.x = _1458;
    out.m_93.y = _1462;
    out.m_93.z = _1430;
    out.m_93.w = _1464;
    float _1474 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1476 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1468);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1480 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1346);
    float _1482 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1348);
    float _1484 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1350);
    out.m_95.w = _972;
    float _1486 = -_1036;
    float _1488 = _836 + _1486;
    float _1490 = -_1050;
    float _1492 = _838 + _1490;
    out.m_97.x = _1476;
    out.m_97.y = _1474;
    out.m_97.z = _1478;
    float _1494 = -_1066;
    float _1496 = _846 + _1494;
    float _1498 = _990 + 0.5;
    float _1500 = _1164 + 0.5;
    float _1502 = _1334 + 0.5;
    float _1504 = _1332 + 0.5;
    out.m_99.x = _1176;
    bool _1506 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1508 = isnan(_1472);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1514 = _1510 || _1512;
    out.m_101.x = _1504;
    out.m_101.y = _1498;
    out.m_101.z = _1502;
    out.m_101.w = _1500;
    out.m_103.x = _1480;
    out.m_103.y = _1482;
    out.m_103.z = _1484;
    if (!_1514)
    {
        _900 = 1.0;
    }
    float _1516 = _900;
    bool _1518 = !_1514;
    float _1520 = _1516;
    if (!_1518)
    {
        bool _1522 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1524 = isnan(_1472);
        bool _1526 = _1522 || _1524;
        bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1530 = _1526 || _1528;
        if (!_1530)
        {
            float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1534 = _1472 + _1532;
            float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1538 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1536;
            float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1542 = _1540 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1544 = 1.0 / _1538;
            float _1546 = _1534 * _1544;
            float _1548 = fma(_1546, _1542, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1520 = _1548;
            _1550 = true;
        }
        else
        {
            bool _1552 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1554 = isnan(_1472);
            bool _1556 = _1552 || _1554;
            bool _1558 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1560 = _1556 || _1558;
            if (!_1560)
            {
                float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1564 = _1472 + _1562;
                float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1572 = _1570 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1574 = 1.0 / _1568;
                float _1576 = _1564 * _1574;
                float _1578 = fma(_1576, _1572, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1520 = _1578;
                _1550 = true;
            }
            else
            {
                _1520 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1550 = false;
    float _1580 = _1520;
    float _1582 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1584 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1586 = floor(_1582);
    float _1588 = floor(_1584);
    float _1590 = -_1586;
    float _1592 = _1582 + _1590;
    float _1594 = -_1588;
    float _1596 = _1584 + _1594;
    float2 _5628 = float2(_1592, _1596);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5628, float2(0.0), isnan(_5628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5628, float2(0.0), isnan(_5628)), level(0.0)).x;
    float _1600 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1602 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1606 = _1442 + _1604;
    float _1608 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1600);
    float _1610 = _1488 + _1602;
    float _1612 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1608);
    float _1614 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1616 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1618 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1622 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1614);
    float _1624 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1616);
    float _1626 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1618);
    float _1628 = 1.0 / _1620;
    float _1630 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1622);
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1624);
    float _1634 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1626);
    float _1636 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1638 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1644 = _1414 + _1642;
    float _1646 = _1636 + _1620;
    float _1648 = fma(_1644, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1650 = _1646 * _1628;
    float _1652 = _1650 * 0.5;
    float _1654 = -_1488;
    float _1656 = _1654 + _1648;
    float _1658 = trunc(_1638);
    int _1660 = int(_1658);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1662);
    float _1666 = _1656 * _1656;
    float _1668 = 1.0 / _1664;
    float _1670 = trunc(_1640);
    int _1672 = int(_1670);
    int _1674 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1676 = _1660 + _1674;
    int _1678 = _1676 + 1;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1682 = _1668 * _1680;
    bool _1684 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1686 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1688 = !_1684;
    int _1690 = _1688 ? 0 : 1;
    int _1692 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1694 = _1672 + _1692;
    int _1696 = _1694 + 1;
    float _1698 = fma(_1606, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1700 = _1678 | _1696;
    float _1702 = -_1496;
    float _1704 = _1702 + _1698;
    int _1706 = 2;
    int _1708 = _1678;
    int _1710 = as_type<int>(_1596);
    float _1712 = _1698;
    if (!_1684)
    {
        _1706 = 1;
    }
    int _1714 = _1706;
    int _1716 = _1714;
    if (!_1686)
    {
        _1716 = _1690;
    }
    int _1718 = _1716;
    bool _1720 = _1678 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1722 = _1718 << 6;
    bool _1724 = _1700 < 0;
    bool _1726 = _1724 || _1720;
    int _1728 = _1722 + 96;
    uint _1731 = uint(int(uint(_1728) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    bool _1747 = _1696 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1749 = _1747 || _1726;
    int _1751 = _1722 + 104;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = as_type<float>(_1718);
    if (!_1749)
    {
        int _1771 = _1696 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1773 = _1771 + _1678;
        _1708 = _1773;
    }
    int _1775 = _1708;
    int _1777 = _1722 + 48;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1797 = _1420 + _1795;
    if (!_1749)
    {
        int _1799 = _1775 << 2;
        _1356 = _1799;
    }
    int _1801 = _1356;
    float _1803 = fma(_1797, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1805 = _1801;
    if (!_1749)
    {
        uint _1807 = uint(int(uint(_1775) >> uint(2)));
        _1710 = int(_1807);
    }
    int _1809 = _1710;
    int _1811 = _1722 + 64;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    uint _1815 = uint(int(uint(int(_1813)) >> uint(2)));
    int _1817 = int(_1813) & 3;
    float _1819 = (*spvDescriptorSet0.vp_c15)._m0[int(_1815)][_1817];
    int _1821 = int(_1813) + 1;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    int _1825 = _1821 & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    if (!_1749)
    {
        int _1829 = 12 & _1801;
        _1805 = _1829;
    }
    int _1831 = _1805;
    if (!_1749)
    {
        int _1833 = _1809 << 4;
        int _1835 = _1833 + _1831;
        _1358 = as_type<float>(_1835);
    }
    float _1837 = _1358;
    float _1839 = -_1492;
    float _1841 = _1839 + _1803;
    int _1843 = _1722 + 56;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    uint _1847 = uint(int(uint(int(_1845)) >> uint(2)));
    int _1849 = int(_1845) & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    int _1853 = int(_1845) + 1;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    int _1857 = _1853 & 3;
    float _1859 = (*spvDescriptorSet0.vp_c15)._m0[int(_1855)][_1857];
    float _1861 = fma(_1841, _1841, _1666);
    float _1863 = fma(_1704, _1704, _1861);
    int _1865 = _1722 + 72;
    uint _1867 = uint(int(uint(_1865) >> uint(2)));
    uint _1869 = uint(int(uint(int(_1867)) >> uint(2)));
    int _1871 = int(_1867) & 3;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
    int _1875 = int(_1867) + 1;
    uint _1877 = uint(int(uint(_1875) >> uint(2)));
    int _1879 = _1875 & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    float _1883 = sqrt(_1863);
    int _1885 = _1722 + 80;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    uint _1889 = uint(int(uint(int(_1887)) >> uint(2)));
    int _1891 = int(_1887) & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    int _1895 = int(_1887) + 1;
    uint _1897 = uint(int(uint(_1895) >> uint(2)));
    int _1899 = _1895 & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    float _1903 = _1610 * _1745;
    float _1905 = fma(_1492, _1737, _1903);
    int _1907 = _1722 + 88;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    float _1925 = fma(_1496, _1759, _1905);
    bool _1927 = _1883 > 0.0;
    float _1929 = _1925 + _1767;
    float _1931 = _1837;
    float _1933 = _1737;
    float _1935 = _1905;
    float _1937 = _1841;
    if (!_1749)
    {
        int _1939 = as_type<int>(_1837) + 400;
        uint _1941 = uint(int(uint(_1939) >> uint(2)));
        uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
        int _1945 = int(_1941) & 3;
        float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
        _1931 = _1947;
    }
    float _1949 = _1931;
    float _1951 = _1610 * _1793;
    float _1953 = 1.0 / _1929;
    float _1955 = fma(_1492, _1785, _1951);
    if (!_1927)
    {
        _1933 = _1803;
    }
    float _1957 = _1933;
    float _1959 = _1610 * _1827;
    float _1961 = _1957;
    float _1963 = _1819;
    if (!_1927)
    {
        _1935 = _1648;
    }
    float _1965 = _1935;
    float _1967 = fma(_1492, _1819, _1959);
    float _1969 = fma(_1496, _1851, _1955);
    float _1971 = fma(_1496, _1873, _1967);
    bool _1973 = !_1927;
    float _1975 = _1965;
    if (!_1973)
    {
        float _1977 = _224 * _224;
        float _1979 = fma(_228, _228, _1977);
        float _1981 = fma(_230, _230, _1979);
        float _1983 = rsqrt(_1863);
        float _1985 = sqrt(_1981);
        float _1987 = _1841 * _1983;
        float _1989 = _1656 * _1983;
        float _1991 = _1704 * _1983;
        bool _1993 = _1985 > 0.0;
        float _1995 = _1983;
        float _1997 = _1985;
        _1963 = _1987;
        if (!_1993)
        {
            _1995 = _1803;
        }
        float _1999 = _1995;
        _1961 = _1999;
        if (!_1993)
        {
            _1997 = _1648;
        }
        float _2001 = _1997;
        bool _2003 = !_1993;
        _1975 = _2001;
        if (!_2003)
        {
            float _2005 = rsqrt(_1981);
            float _2007 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2009 = _224 * _2005;
            float _2011 = _228 * _2005;
            float _2013 = _1989 * _2009;
            float _2015 = _230 * _2005;
            float _2017 = fma(_1987, _2011, _2013);
            float _2019 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2021 = fma(_1991, _2015, _2017);
            float _2023 = _2021 * _2019;
            float _2025 = fma(_228, _2023, _1803);
            float _2027 = fma(_224, _2023, _1648);
            float _2029 = fma(_230, _2023, _1698);
            _1975 = _2027;
            _1961 = _2025;
            _1712 = _2029;
        }
    }
    float _2031 = _1975;
    float _2033 = _1961;
    float _2035 = _1712;
    float _2037 = _1963;
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2041 = _1969 + _1859;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2045 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2039);
    float _2049 = _2041 * _1953;
    float _2051 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2043);
    float _2053 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2045);
    float _2055 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2047);
    float _2057 = _1971 + _1881;
    float _2059 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2051);
    bool _2061 = _2049 >= 0.0;
    float _2063 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2065 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2053);
    float _2067 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = _2057 * _1953;
    float _2071 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2073 = _2049 <= 1.0;
    bool _2075 = _2073 && _2061;
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2063);
    float _2079 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2081 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2083 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2085 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2087 = _2069 >= 0.0;
    bool _2089 = _2087 && _2075;
    float _2091 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2077);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2081);
    float _2095 = -_2085;
    float _2097 = fma(_2095, _2083, 1.0);
    bool _2099 = _2069 <= 1.0;
    bool _2101 = _2099 && _2089;
    float _2103 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2105 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2093);
    float _2107 = _1610 * _1901;
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = _2037;
    if (!_1749)
    {
        float _2113 = floor(_1638);
        _2111 = _2113;
    }
    float _2115 = _2111;
    float _2117 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2105);
    float _2119 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2121 = fma(_1492, _1893, _2107);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2125 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2119);
    float _2127 = fma(_1496, _1915, _2121);
    float _2129 = _1967;
    float _2131 = _2125;
    if (!_1749)
    {
        float _2133 = floor(_1640);
        _2129 = _2133;
    }
    float _2135 = _2129;
    if (_2101)
    {
        float _2137 = float(_1718);
        _1769 = _2137;
    }
    float _2139 = _1769;
    float _2141 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2123);
    float _2143 = _2127 + _1923;
    float _2145 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2141);
    float _2147 = _2143 * _1953;
    float _2149 = log2(_2097);
    float _2151 = _2139;
    if (!_1749)
    {
        float _2153 = -_2115;
        float _2155 = _1638 + _2153;
        _1937 = _2155;
    }
    float _2157 = _1937;
    float _2159 = 1.0 / _2117;
    float _2161 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    if (!_1749)
    {
        float _2163 = -_2135;
        float _2165 = _1640 + _2163;
        _2131 = _2165;
    }
    float _2167 = _2131;
    float _2169 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2161);
    float _2171 = _1949;
    if (!_1749)
    {
        float _2173 = rint(_1949);
        float _2175 = precise::max(_2173, 0.0);
        uint _2177 = uint(_2175);
        uint _2179 = clamp(_2177, 0u, 65535u);
        _2171 = as_type<float>(_2179);
    }
    float _2181 = _2171;
    float _2183 = _2149 * 0.693147182464599609375;
    float _2185 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2187 = _2123;
    float _2189 = _2185;
    if (_2101)
    {
        float _2191 = rint(_2139);
        float _2193 = precise::max(_2191, 0.0);
        uint _2195 = uint(_2193);
        uint _2197 = clamp(_2195, 0u, 65535u);
        _2187 = as_type<float>(_2197);
    }
    float _2199 = _2187;
    float _2201 = _2145 * _2159;
    float _2203 = _2169 * _2159;
    float _2205 = fma(_2201, 0.5, 0.5);
    float _2207 = fma(_2203, -0.5, 0.5);
    float _2209 = _2181;
    float _2211 = _2203;
    if (!_1749)
    {
        float3 _6681 = float3(_2157, _2167, float(as_type<int>(_2181)));
        float3 _6685 = select(_6681, float3(0.0), isnan(_6681));
        float _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6685.xy, uint(rint(_6685.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6685.xy, uint(rint(_6685.z)), level(0.0)).x;
        _2209 = _2213;
    }
    float _2215 = _2209;
    float _2217 = _2069;
    if (_2101)
    {
        float3 _6700 = float3(_2049, _2069, float(as_type<int>(_2199)));
        float3 _6702 = select(_6700, float3(0.0), isnan(_6700));
        float _2219 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6702.xy, uint(rint(_6702.z)), _2147, level(0.0));
        _2217 = _2219;
    }
    float _2221 = _2217;
    float3 _6712 = float3(_2205, _2207, _2185);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6712, float3(0.0), isnan(_6712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6712, float3(0.0), isnan(_6712)), level(0.0)).x;
    float3 _6721 = float3(_2205, _2207, _2185);
    float4 _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2228 = _2226.x;
    float _2230 = _2226.y;
    float _2232 = _2226.z;
    float _2234 = _2226.w;
    if (_1749)
    {
        _2211 = 1.0;
    }
    float _2236 = _2211;
    bool _2238 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(0.5);
    bool _2246 = _2242 || _2244;
    float _2248 = _2236;
    if (_2246)
    {
        _2151 = 1.0;
    }
    float _2250 = _2151;
    float _2252 = _2250;
    if (!_2246)
    {
        float _2254 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2256 = _2254 * 0.15915493667125701904296875;
        float _2258 = _2256 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        float _2262 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = _2256 * 6.283185482025146484375;
        float _2268 = sin(_2266);
        float _2270 = 1.0 / _2260;
        float _2272 = _2264 * 6.283185482025146484375;
        float _2274 = cos(_2272);
        float _2276 = _2268 * _2270;
        float _2278 = _2264 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = _2274 * _2276;
        float _2284 = 1.0 / _2282;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2288 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2286;
        float _2290 = 1.0 / _2288;
        float _2292 = _2280 * _2284;
        float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2296 = fma(_1682, _2292, _2294);
        float _2298 = _2296 * _2290;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        _2189 = _2264;
        _2252 = _2300;
    }
    float _2302 = _2189;
    float _2304 = _2252;
    float _2306 = _2302;
    if (!_1749)
    {
        int _2308 = _1775 << 4;
        int _2310 = _2308 + 2048;
        uint _2312 = uint(int(uint(_2310) >> uint(2)));
        uint _2314 = uint(int(uint(int(_2312)) >> uint(2)));
        int _2316 = int(_2312) & 3;
        float _2318 = (*spvDescriptorSet0.vp_c15)._m0[int(_2314)][_2316];
        int _2320 = int(_2312) + 1;
        uint _2322 = uint(int(uint(_2320) >> uint(2)));
        int _2324 = _2320 & 3;
        float _2326 = (*spvDescriptorSet0.vp_c15)._m0[int(_2322)][_2324];
        int _2328 = _2310 + 8;
        uint _2330 = uint(int(uint(_2328) >> uint(2)));
        uint _2332 = uint(int(uint(int(_2330)) >> uint(2)));
        int _2334 = int(_2330) & 3;
        float _2336 = (*spvDescriptorSet0.vp_c15)._m0[int(_2332)][_2334];
        int _2338 = int(_2330) + 1;
        uint _2340 = uint(int(uint(_2338) >> uint(2)));
        int _2342 = _2338 & 3;
        float _2344 = (*spvDescriptorSet0.vp_c15)._m0[int(_2340)][_2342];
        float _2346 = _1610 * _2326;
        float _2348 = fma(_1492, _2318, _2346);
        float _2350 = fma(_1496, _2336, _2348);
        float _2352 = _2350 + _2344;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        float _2356 = -_2354;
        float _2358 = _2356 + _2215;
        float _2360 = fma(_2358, 500.0, 1.5);
        float _2362 = exp2(_2360);
        float _2364 = 0.0 + _2362;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2306 = _2344;
        _2248 = _2366;
    }
    float _2368 = _2306;
    float _2370 = _2248;
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2374 = _2031 + _2372;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2378 = _2033 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2382 = _2035 + _2380;
    float _2384 = _2374 * _2374;
    float _2386 = fma(_2378, _2378, _2384);
    float _2388 = fma(_2382, _2382, _2386);
    float _2390 = rsqrt(_2388);
    float _2392 = sqrt(_2388);
    float _2394 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2396 = _2378 * _2394;
    float _2398 = _2382 * _2394;
    float _2400 = _2396 * _2396;
    float _2402 = _2398 * _2398;
    float _2404 = _2400 + _2402;
    float _2406 = sqrt(_2404);
    bool _2408 = _2406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2412 = _2406 + _2410;
    float _2414 = _2382;
    float _2416 = _2404;
    float _2418 = _2412;
    float _2420 = _2368;
    float _2422 = _2394;
    if (_2408)
    {
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2414 = _2424;
    }
    float _2426 = _2414;
    if (_2408)
    {
        float _2428 = rsqrt(_2404);
        _2416 = _2428;
    }
    float _2430 = _2416;
    if (_2408)
    {
        float _2432 = _2412 * _2426;
        _2418 = _2432;
    }
    float _2434 = _2418;
    if (_2408)
    {
        float _2436 = _2434 * 0.15915493667125701904296875;
        _2420 = _2436;
    }
    float _2438 = _2420;
    float _2440 = _2384;
    float _2442 = _2438;
    if (_2408)
    {
        float _2444 = _2438 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        _2440 = _2446;
    }
    float _2448 = _2440;
    float _2450 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2452 = precise::max(0.0, _2450);
    float _2454 = _2390;
    float _2456 = _2452;
    float _2458 = _2450;
    if (_2408)
    {
        float _2460 = _2438 * 6.283185482025146484375;
        float _2462 = cos(_2460);
        _2454 = _2462;
    }
    float _2464 = _2454;
    float _2466 = -_2394;
    float _2468 = -_2452;
    float _2470 = fma(_2374, _2466, _2468);
    float _2472 = _2470;
    if (!_2408)
    {
        _2456 = _2396;
    }
    float _2474 = _2456;
    float _2476 = _2474;
    if (_2408)
    {
        float _2478 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2458 = _2478;
    }
    float _2480 = _2458;
    float _2482 = _2448;
    float _2484 = _2480;
    if (_2408)
    {
        float _2486 = fma(_2448, _2480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2482 = _2486;
    }
    float _2488 = _2482;
    float _2490 = _2488;
    float _2492 = _2464;
    if (_2408)
    {
        float _2494 = _2464 + (-1.0);
        _2484 = _2494;
    }
    float _2496 = _2484;
    float _2498 = _2496;
    if (_2408)
    {
        float _2500 = _2430 * _2488;
        _2422 = _2500;
    }
    float _2502 = _2422;
    if (!_2408)
    {
        _2490 = _2400;
    }
    float _2504 = _2490;
    float _2506 = _2504;
    if (_2408)
    {
        float _2508 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2442 = _2508;
    }
    float _2510 = _2442;
    if (_2408)
    {
        float _2512 = _2396 * _2502;
        _2476 = _2512;
    }
    float _2514 = _2476;
    if (!_2408)
    {
        _2498 = _2398;
    }
    float _2516 = _2498;
    float _2518 = _2516;
    if (_2408)
    {
        float _2520 = _2398 * _2502;
        _2518 = _2520;
    }
    float _2522 = _2518;
    if (_2408)
    {
        float _2524 = fma(_2470, _2464, _2510);
        _2472 = _2524;
    }
    float _2526 = _2472;
    if (_2408)
    {
        float _2528 = _2514 * _2514;
        _2506 = _2528;
    }
    float _2530 = _2506;
    if (!_2408)
    {
        _2492 = _2402;
    }
    float _2532 = _2492;
    float _2534 = _2532;
    if (_2408)
    {
        float _2536 = _2522 * _2522;
        _2534 = _2536;
    }
    float _2538 = _2534;
    float _2540 = fma(_2526, _2526, _2530);
    float _2542 = _2540 + _2538;
    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2546 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2544);
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = rsqrt(_2542);
    float _2552 = -_2548;
    float _2554 = _2552 + 1.0;
    float _2556 = abs(_2554);
    float _2558 = log2(_2556);
    float _2560 = _2550 * _2514;
    float _2562 = _2550 * _2526;
    float _2564 = _2550 * _2522;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2568 = -_2566;
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2568);
    float _2572 = -_2564;
    float _2574 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2570);
    float _2576 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2578 = fma(_2574, -0.5, 0.5);
    float _2580 = fma(_2574, 0.5, 0.5);
    float _2582 = _2562 + 1.0;
    float _2584 = exp2(_2576);
    float _2586 = fma(_2580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2588 = fma(_2580, _2586, -0.212114393711090087890625);
    float _2590 = sqrt(_2578);
    float _2592 = fma(_2580, _2588, 1.570728778839111328125);
    float _2594 = -_2562;
    float _2596 = fma(_2584, _2582, _2594);
    float _2598 = fma(_2596, 0.5, 0.5);
    float _2600 = _2590 * 0.636619746685028076171875;
    float _2602 = -_2592;
    float _2604 = fma(_2600, _2602, 1.0);
    float2 _7286 = float2(_2604, _2598);
    float3 _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7286, float2(0.0), isnan(_7286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7286, float2(0.0), isnan(_7286)), level(0.0)).xyz;
    float _2610 = _2608.x;
    float _2612 = _2608.y;
    float _2614 = _2608.z;
    float _2616 = abs(_1682);
    float _2618 = log2(_2616);
    float _2620 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2622 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2624 = -_1598;
    float _2626 = _2624 + 1.0;
    float _2628 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2620);
    out.m_105.x = _1492;
    out.m_105.y = _1488;
    out.m_105.z = _1496;
    float _2630 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2628);
    float _2632 = exp2(_2622);
    bool _2634 = _1682 <= 8000.0;
    bool _2636 = isnan(_1682);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(8000.0);
    bool _2642 = _2638 || _2640;
    float _2644 = float(_2642);
    out.m_107.x = _2033;
    out.m_107.y = _2031;
    out.m_107.z = _2035;
    float _2646 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2630);
    float _2648 = _2117 * 0.5;
    bool _2650 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2652 = isnan(_2392);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2658 = _2654 || _2656;
    float _2660 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2662 = _2646 + _2117;
    float _2664 = fma(_2169, -0.5, _2648);
    float _2666 = _2145 + _2117;
    float _2668 = _2662 * 0.5;
    float _2670 = exp2(_2660);
    out.gl_Position.x = _2145;
    out.gl_Position.y = _2169;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _2117;
    float _2672 = _2666 * 0.5;
    float _2674 = -_2632;
    float _2676 = _2674 + 1.0;
    out.m_109.x = _2672;
    out.m_109.y = _2664;
    out.m_109.z = _2668;
    out.m_109.w = _2117;
    float _2678 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2680 = _2676;
    if (!_2658)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2682 = _2680;
    float _2684 = _2304 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2686 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = fma(_2688, -2.0, 3.0);
    float _2692 = _2688 * _2688;
    float _2694 = _2692 * _2690;
    float _2696 = -_2694;
    float _2698 = _2696 + 1.0;
    float _2700 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2694);
    float _2702 = _2644 * _2700;
    float _2704 = _2700;
    float _2706 = _2682;
    float _2708 = _2682;
    if (!_2101)
    {
        _2704 = 1.0;
    }
    float _2710 = _2704;
    float _2712 = _2710;
    if (_2101)
    {
        bool _2714 = _2221 >= _2147;
        bool _2716 = isnan(_2221);
        bool _2718 = _2714 || _2716;
        bool _2720 = isnan(_2147);
        bool _2722 = _2718 || _2720;
        float _2724 = float(_2722);
        _2712 = _2724;
    }
    float _2726 = _2712;
    float _2728 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2730 = _2626 * _2728;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2726 * _2370;
    float _2736 = _2678 * _2223;
    float _2738 = -_2678;
    float _2740 = _2738 + 1.0;
    float _2742 = -_2732;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = _2234 * _2736;
    float _2748 = _2234 * _2740;
    float _2750 = -_2734;
    float _2752 = fma(_2750, _2744, 1.0);
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = _2740;
    float _2758 = _2734;
    float _2760 = _2754;
    float _2762 = _2746;
    float _2764 = _2736;
    if (!_2658)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2766 = _2756;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2658)
    {
        _2758 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2772 = _2758;
    float _2774 = _2754 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2776 = _2772;
    float _2778 = _2772;
    if (!_2658)
    {
        _2760 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2780 = _2760;
    out.m_111.x = _2774;
    float _2782 = _2614 * _2736;
    float _2784 = fma(_2610, _2746, _2228);
    float _2786 = fma(_2612, _2746, _2230);
    float _2788 = _2780;
    float _2790 = _2780;
    if (!_2658)
    {
        _2762 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2792 = _2762;
    float _2794 = fma(_2234, _2782, _2232);
    float _2796 = _2792;
    float _2798 = _2792;
    if (!_2658)
    {
        _2764 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2800 = _2764;
    out.m_113.x = _2784;
    out.m_113.y = _2786;
    out.m_113.z = _2794;
    out.m_113.w = _2748;
    bool _2802 = !_2658;
    float _2804 = _2800;
    float _2806 = _2800;
    if (!_2802)
    {
        bool _2808 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2810 = isnan(_2392);
        bool _2812 = _2808 || _2810;
        bool _2814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2816 = _2812 || _2814;
        if (!_2816)
        {
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2820 = _2392 + _2818;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2824 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2822;
            float _2826 = 1.0 / _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2848 = _2820 * _2826;
            float _2850 = precise::clamp(_2848, 0.0, 1.0);
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2856 = fma(_2850, _2830, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2858 = fma(_2850, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2860 = fma(_2850, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2862 = fma(_2850, _2838, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2864 = fma(_2850, _2842, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2866 = fma(_2850, _2846, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2708 = _2856;
            _2806 = _2864;
            _2770 = _2858;
            _2778 = _2862;
            _2798 = _2860;
            _2790 = _2866;
            _2868 = true;
        }
        else
        {
            bool _2870 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2872 = isnan(_2392);
            bool _2874 = _2870 || _2872;
            bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2878 = _2874 || _2876;
            if (!_2878)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2880 = _2768;
            _2770 = _2880;
            if (!_2878)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2882 = _2706;
            _2708 = _2882;
            if (!_2878)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2884 = _2796;
            _2798 = _2884;
            if (!_2878)
            {
                _2776 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2886 = _2776;
            _2778 = _2886;
            if (!_2878)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2888 = _2804;
            _2806 = _2888;
            if (!_2878)
            {
                _2788 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2890 = _2788;
            bool _2892 = !_2878;
            _2790 = _2890;
            if (!_2892)
            {
                bool _2894 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2896 = isnan(_2392);
                bool _2898 = _2894 || _2896;
                bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2902 = _2898 || _2900;
                if (!_2902)
                {
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2906 = _2392 + _2904;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2908;
                    float _2912 = 1.0 / _2910;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2934 = _2906 * _2912;
                    float _2936 = precise::clamp(_2934, 0.0, 1.0);
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2942 = fma(_2936, _2916, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2944 = fma(_2936, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2946 = fma(_2936, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2948 = fma(_2936, _2924, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2950 = fma(_2936, _2928, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2952 = fma(_2936, _2932, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2708 = _2942;
                    _2806 = _2950;
                    _2770 = _2944;
                    _2778 = _2948;
                    _2798 = _2946;
                    _2790 = _2952;
                    _2868 = true;
                }
                else
                {
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2778 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2790 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2868 = false;
    float _2954 = _2708;
    float _2956 = _2806;
    float _2958 = _2770;
    float _2960 = _2778;
    float _2962 = _2798;
    float _2964 = _2790;
    float _2966 = fma(_1482, -0.5, 0.5);
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = -_2954;
    float _2972 = _2970 + _2956;
    float _2974 = _2684 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2976 = -_2958;
    float _2978 = _2976 + _2960;
    out.m_115.x = 0.0;
    float _2980 = fma(_2968, _2972, _2954);
    float _2982 = fma(_2968, _2978, _2958);
    out.m_61.x = _2974;
    float _2984 = -_2962;
    float _2986 = _2984 + _2964;
    float _2988 = _2980 * 0.586610972881317138671875;
    bool _2990 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2992 = fma(_2968, _2986, _2962);
    float _2994 = fma(_2982, 0.298911988735198974609375, _2988);
    bool _2996 = _2304 > 0.0;
    bool _2998 = isnan(_2304);
    bool _3000 = _2996 || _2998;
    bool _3002 = isnan(0.0);
    bool _3004 = _3000 || _3002;
    float _3006 = fma(_2992, 0.114477999508380889892578125, _2994);
    float _3008 = -_3006;
    float _3010 = _2980 + _3008;
    float _3012 = -_3006;
    float _3014 = _2982 + _3012;
    float _3016 = -_3006;
    float _3018 = _2992 + _3016;
    float _3020 = fma(_3010, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    float _3022 = fma(_3014, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    float _3024 = fma(_3018, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    bool _3026 = !_2990;
    if (!_3026)
    {
        float _3028 = -_2031;
        float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3032 = -_2033;
        float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3036 = -_2035;
        float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3040 = _3030 * _3030;
        float _3042 = fma(_3034, _3034, _3040);
        float _3044 = fma(_3038, _3038, _3042);
        float _3046 = sqrt(_3044);
        float _3048 = rsqrt(_3044);
        float _3050 = -_3046;
        float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3056 = precise::clamp(_3054, 0.0, 1.0);
        float _3058 = _3034 * _3048;
        float _3060 = _3030 * _3048;
        float _3062 = abs(_3056);
        float _3064 = log2(_3062);
        float _3066 = _3038 * _3048;
        float _3068 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3070 = _1482 * _3060;
        float _3072 = -_3060;
        float _3074 = -_3068;
        float _3076 = fma(_3072, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3074);
        float _3078 = fma(_1480, _3058, _3070);
        float _3080 = -_3066;
        float _3082 = fma(_3080, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3076);
        float _3084 = fma(_1484, _3066, _3078);
        float _3086 = precise::clamp(_3084, 0.0, 1.0);
        float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3090 = _3082 + _3088;
        float _3092 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3094 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3096 = precise::clamp(_3094, 0.0, 1.0);
        float _3098 = exp2(_3092);
        float _3100 = _3098 * _3096;
        float _3102 = _3086 * _3100;
        float _3104 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3108 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_115.x = _3104;
        out.m_115.y = _3106;
        out.m_115.z = _3108;
    }
    out.m_95.x = _3022;
    out.m_95.y = _3020;
    out.m_95.z = _3024;
    if (_3004)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3110 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3110;
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
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2868 = false;
    bool _1550 = false;
    bool _688 = false;
    bool _546 = false;
    bool _252 = false;
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
        float _3167 = as_type<float>(_150);
        out.gl_Position.z = _3167;
    }
    if (!_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_63.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = 0.0;
    if (_164)
    {
        float _172 = float(_134);
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    if (_180)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _144;
    if (_180)
    {
        out.m_61.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _152 = as_type<int>(_184);
    }
    int _186 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3235 = as_type<float>(_186);
        out.gl_Position.z = _3235;
    }
    if (_180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_65.x;
    float _190 = in.m_65.y;
    float _192 = in.m_65.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_67.x;
    float _198 = in.m_67.y;
    float _200 = in.m_67.z;
    float _202 = in.m_69.x;
    float _204 = in.m_69.y;
    float _206 = in.m_69.z;
    float _208 = in.m_71.x;
    float _210 = in.m_71.y;
    float _212 = in.m_71.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_73.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_134);
        float _256 = 1.0 / _254;
        float _258 = _168 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _290 = 1.0 / _276;
    bool _292 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_260);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    bool _304 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_260);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _280;
    float _318 = -_302;
    float _320 = _318 + 1.0;
    float _322 = _314 * _320;
    float _324 = -_314;
    float _326 = _324 + 1.0;
    float _328 = 1.0 / _288;
    float _330 = _264 * _290;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _260 + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _344;
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = fma(_338, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _352 = 1.0 / _284;
    float _354 = _268 * _316;
    bool _356 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_260);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = fma(_342, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _370 = -_366;
    float _372 = _370 + 1.0;
    float _374 = _334 * _328;
    bool _376 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _378 = isnan(_260);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = _386 * _372;
    float _390 = _272 * _352;
    float _392 = -_386;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = _302 * _394;
    float _406 = fma(_398, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_402, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _410 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _412 = isnan(_260);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = _420 * _326;
    float _432 = -_420;
    float _434 = _432 + 1.0;
    float _436 = fma(_424, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _438 = fma(_428, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _440 = _406 * _430;
    float _442 = _350 * _430;
    float _444 = _408 * _430;
    float _446 = in.m_75.x;
    float _448 = in.m_75.y;
    float _450 = in.m_75.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _440);
    float _462 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _464 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_346, _390, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _470 = fma(_458, _390, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_436, _322, _460);
    float _474 = fma(_368, _322, _462);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_438, _322, _468);
    float _490 = fma(_478, _374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_464, _404, _472);
    float _496 = fma(_466, _404, _474);
    float _498 = fma(_486, _374, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _500 = fma(_470, _404, _488);
    float _502 = fma(_490, _388, _494);
    float _504 = fma(_492, _388, _496);
    float _506 = fma(_498, _388, _500);
    float _508 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].x, _502);
    float _510 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].y, _504);
    float _512 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[147].z, _506);
    float _514 = _508 * _446;
    float _516 = _510 * _448;
    float _518 = _512 * _450;
    bool _520 = !_348;
    float _522 = _460;
    float _524 = _464;
    float _526 = _516;
    float _544;
    if (!_520)
    {
        float _528 = in.m_73.x;
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _532 = _528 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _536 = _534 * _530;
        float _538 = floor(_536);
        float _540 = -_538;
        float _542 = _536 + _540;
        _544 = _542;
        _546 = true;
    }
    else
    {
        float _548 = float(_134);
        float _550 = 1.0 / _548;
        float _552 = _168 * _550;
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
    float _616 = _590 * _612;
    float _618 = -_590;
    float _620 = _618 + 1.0;
    float _622 = 1.0 / _578;
    float _624 = _594 * _608;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = fma(_624, _558, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _632 = _628 * _622;
    float _634 = _630 * _616;
    float _636 = -_606;
    float _638 = _636 + 1.0;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _642 = _554 + _640;
    float _644 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _634);
    float _646 = _574 * _638;
    float _648 = fma(_632, _642, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = fma(_648, _646, _644);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[117].x, _652);
    float _660 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_77.x = _660;
    out.m_77.y = _662;
    out.m_77.z = _664;
    out.m_77.w = _666;
    bool _668 = !_614;
    float _686;
    if (!_668)
    {
        float _670 = in.m_73.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        float _690 = float(_134);
        float _692 = 1.0 / _690;
        float _694 = _168 * _692;
        _686 = _694;
    }
    _688 = false;
    float _696 = _686;
    float _698 = in.m_58.x;
    float _700 = in.m_58.y;
    float _702 = in.m_58.z;
    float _704 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = in.m_73.w;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _714 = in.m_79.y;
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _718 = in.m_73.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_73.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _728 = _726 != 0;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _734 = _732 != 0;
    float _736 = in.m_73.x;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _740 = _738 != 0;
    float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _744 = _204 * _700;
    float _746 = _198 * _700;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    float _748 = _210 * _700;
    bool _750 = _706 > 0.5;
    float _752 = fma(_202, _698, _744);
    float _754 = in.m_67.w;
    float _756 = -_714;
    float _758 = _756 + 1.0;
    float _760 = fma(_196, _698, _746);
    float _762 = fma(_208, _698, _748);
    float _764 = in.m_69.w;
    bool _766 = _718 > 0.5;
    float _768 = fma(_200, _702, _760);
    float _770 = _718;
    float _772 = _714;
    float _774 = _712;
    if (!_710)
    {
        _522 = _718;
    }
    float _776 = _522;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _780 = _776;
    if (!_710)
    {
        _524 = _724;
    }
    float _782 = _524;
    float _784 = in.m_71.w;
    float _786 = _782;
    if (_710)
    {
        _780 = _724;
    }
    float _788 = _780;
    float _790 = fma(_206, _702, _752);
    int _792 = as_type<int>(_788);
    if (_710)
    {
        _786 = _736;
    }
    float _794 = _786;
    float _796 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_710)
    {
        _770 = _724;
    }
    float _798 = _770;
    float _800 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _802 = _750 ? as_type<int>(_758) : as_type<int>(_714);
    float _804 = -_778;
    float _806 = fma(_796, 2.0, _804);
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _810 = _808 != 0;
    float _812 = _724 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _816 = _814 != 0;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _820 = in.m_83.x;
    float _822 = in.m_83.y;
    float _824 = in.m_83.z;
    float _826 = in.m_83.w;
    float _828 = _734 ? as_type<float>(_802) : _714;
    float _830 = fma(_812, -2.0, _730);
    bool _832 = _724 > 0.5;
    float _834 = fma(_212, _702, _762);
    float _836 = _768 + _754;
    float _838 = _790 + _764;
    int _840 = _832 ? as_type<int>(_758) : as_type<int>(_714);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _844 = _836 + _842;
    float _846 = _834 + _784;
    float _848 = _810 ? as_type<float>(_840) : _714;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _854 = _844 * _844;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = 1.0 / _852;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _874 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[78].w, _818);
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _878 = _822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _880 = 1.0 / _864;
    float _882 = _822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _884 = _822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _878);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _890 = _838 + _888;
    float _892 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _882);
    float _894 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    bool _896 = _810;
    float _898 = _800;
    float _900 = _836;
    if (_722)
    {
        bool _902 = _736 > 0.5;
        _896 = _902;
    }
    bool _904 = _896;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _908 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _910 = fma(_890, _890, _854);
    float _912 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].z, _892);
    float _914 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].z, _894);
    float _916 = _872 * _860;
    float _918 = fma(_858, _858, _910);
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _922 = _696 + _920;
    float _924 = _868 * _880;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _928 = _696 + _926;
    float _930 = sqrt(_918);
    float _932 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _876);
    float _934 = fma(_924, _922, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _936 = fma(_916, _928, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    out.m_85.x = _908;
    out.m_85.y = _912;
    out.m_85.z = _914;
    float _938 = _800 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _940 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    if (_816)
    {
        float _942 = _766 ? _758 : _714;
        _772 = _942;
    }
    float _944 = _772;
    float _946 = fma(_938, _848, -0.5);
    float _948 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _932);
    float _950 = in.m_79.x;
    float _952 = _716 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _956 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _958 = _906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _960 = rsqrt(_918);
    float _962 = _704 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _964 = _930 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _968 = fma(_828, _958, -0.5);
    float _970 = _742 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _972 = precise::min(_962, _964);
    float _974 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[83].w, _966);
    bool _976 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _978 = isnan(_696);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_940;
    float _990 = fma(_956, _946, _988);
    bool _992 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _994 = isnan(_696);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = in.m_87.x;
    float _1006 = in.m_87.y;
    float _1008 = in.m_87.z;
    bool _1010 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1012 = isnan(_696);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -_986;
    float _1024 = _1022 + 1.0;
    float _1026 = _960 * _972;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1030 = _1020 * _1024;
    float _1032 = -_1020;
    float _1034 = _1032 + 1.0;
    float _1036 = _844 * _1026;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1040 = _960;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1044 = _950;
    if (!_722)
    {
        _898 = _950;
    }
    float _1046 = _898;
    float _1048 = _1002 * _1034;
    float _1050 = _890 * _1026;
    float _1052 = -_1036;
    float _1054 = _844 + _1052;
    float _1056 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1038);
    float _1058 = _794 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1060 = -_1050;
    float _1062 = _890 + _1060;
    float _1064 = _1054 * _1054;
    float _1066 = _858 * _1026;
    float _1068 = -_954;
    float _1070 = fma(_1058, 2.0, _1068);
    float _1072 = _934 * _1048;
    float _1074 = fma(_1062, _1062, _1064);
    float _1076 = -_1066;
    float _1078 = _858 + _1076;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1082 = in.m_89.x;
    float _1084 = in.m_89.y;
    float _1086 = in.m_89.z;
    bool _1088 = _1006 != 0.0;
    bool _1090 = isnan(_1006);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan(0.0);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_1078, _1078, _1074);
    float _1100 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1102 = _1046;
    if (_722)
    {
        float _1104 = -_950;
        float _1106 = _1104 + 1.0;
        _792 = as_type<int>(_1106);
    }
    int _1108 = _792;
    bool _1110 = _1004 == 0.0;
    bool _1112 = !_1096;
    bool _1114 = _1110 && _1112;
    float _1116 = sqrt(_1098);
    float _1118 = fma(_1100, -2.0, _1080);
    float _1120 = -_1002;
    float _1122 = _1120 + 1.0;
    bool _1124 = _1008 == 0.0;
    bool _1126 = _1124 && _1114;
    float _1128 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1056);
    float _1130 = -_168;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1070);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1072);
    float _1136 = -_168;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    float _1140 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1118);
    float _1142 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _974);
    float _1144 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1146 = fma(_936, _1030, _1134);
    int _1148 = 0;
    float _1150 = as_type<float>(_1108);
    if (_728)
    {
        float _1152 = -_950;
        float _1154 = _1152 + 1.0;
        _1148 = as_type<int>(_1154);
    }
    int _1156 = _1148;
    if (_722)
    {
        float _1158 = _904 ? as_type<float>(_1108) : _950;
        _1102 = _1158;
    }
    float _1160 = _1102;
    float _1162 = -_1140;
    float _1164 = fma(_1142, _968, _1162);
    float _1166 = _960 * _1116;
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    if (_1126)
    {
        _1040 = _1082;
    }
    float _1170 = _1040;
    float _1172 = fma(_952, _1160, -0.5);
    float _1174 = _1144 * _1166;
    float _1176 = _704 * _1166;
    float _1178 = _712 * _1166;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1182 = _1170;
    if (_1126)
    {
        _526 = _1170;
    }
    float _1184 = _526;
    float _1186 = _1174 * _1168;
    float _1188 = _1184;
    if (_1126)
    {
        _1042 = _1084;
    }
    float _1190 = _1042;
    float _1192 = _1176 * _1180;
    float _1194 = _1190;
    if (!_1126)
    {
        _1182 = _1082;
    }
    float _1196 = _1182;
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    if (_1126)
    {
        _774 = _1190;
    }
    float _1200 = _774;
    float _1202 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1204 = _1202;
    float _1206 = _1200;
    if (!_1126)
    {
        _1194 = _1084;
    }
    float _1208 = _1194;
    float _1210 = _1178 * _1198;
    float _1212 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1214 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1202);
    float _1216 = _1214;
    if (_1126)
    {
        _1204 = _1086;
    }
    float _1218 = _1204;
    float _1220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1212);
    float _1224 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1214);
    float _1226 = _1218;
    if (_1126)
    {
        _1216 = _1218;
    }
    float _1228 = _1216;
    int _1230 = 0;
    float _1232 = _1228;
    if (_740)
    {
        float _1234 = -_950;
        float _1236 = _1234 + 1.0;
        _1230 = as_type<int>(_1236);
    }
    int _1238 = _1230;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1222);
    float _1242 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_1126)
    {
        _1226 = _1086;
    }
    float _1244 = _1226;
    float _1246 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = _846 + _1242;
    float _1252 = _1250;
    if (!_728)
    {
        _1150 = _950;
    }
    float _1254 = _1150;
    float _1256 = _1254;
    if (!_1126)
    {
        float _1258 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1244);
        _1232 = _1258;
    }
    float _1260 = _1232;
    float _1262 = _838 + _1248;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1250 + _1264;
    float _1268 = _1262;
    if (_728)
    {
        float _1270 = _766 ? as_type<float>(_1156) : _950;
        _1256 = _1270;
    }
    float _1272 = _1256;
    if (!_1126)
    {
        float _1274 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1196);
        _1188 = _1274;
    }
    float _1276 = _1188;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1280 = _1262 + _1278;
    float _1282 = _1266 * _1266;
    if (_740)
    {
        float _1284 = _832 ? as_type<float>(_1238) : _950;
        _1044 = _1284;
    }
    float _1286 = _1044;
    float _1288 = fma(_970, _1272, -0.5);
    float _1290 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1292 = fma(_1280, _1280, _1282);
    if (!_1126)
    {
        float _1294 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1208);
        _1206 = _1294;
    }
    float _1296 = _1206;
    float _1298 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1300 = _820 * _1208;
    float _1302 = sqrt(_1292);
    float _1304 = _944 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1306 = _1298 * _1220;
    float _1308 = _824 * _1196;
    float _1310 = _822 * _1244;
    float _1312 = -_1300;
    float _1314 = fma(_822, _1196, _1312);
    float _1316 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1290);
    float _1318 = -_1308;
    float _1320 = fma(_820, _1244, _1318);
    float _1322 = -_1310;
    float _1324 = fma(_824, _1208, _1322);
    float _1326 = _1304 * _1028;
    float _1328 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1330 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1146);
    float _1332 = fma(_948, _1172, _1138);
    float _1334 = fma(_1128, _1288, _1132);
    float _1336 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1340 = _1302 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1296 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1344 = _836 + _1328;
    out.m_91.x = _1306;
    out.m_91.y = _1326;
    float _1346 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1348 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1338);
    float _1350 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1342);
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = _1306;
    int _1356 = as_type<int>(_1334);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (!_1340)
    {
        _1354 = _1250;
    }
    float _1360 = _1354;
    float _1362 = _1360;
    if (!_1340)
    {
        _1252 = _1344;
    }
    float _1364 = _1252;
    bool _1366 = !_1340;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1302 + _1372;
        float _1376 = rsqrt(_1292);
        float _1378 = _1374 * _1370;
        float _1380 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = _1378 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        float _1392 = fma(_1386, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = _1376 * _1392;
        float _1396 = _1390 + (-1.0);
        float _1398 = fma(_1280, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1266, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1344, _1390, _1402);
        _1368 = _1404;
        _1268 = _1398;
        _1362 = _1400;
    }
    float _1406 = _1368;
    float _1408 = _1268;
    float _1410 = _1362;
    float _1412 = -_1036;
    float _1414 = _1412 + _1406;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1418 = -_1050;
    float _1420 = _1418 + _1408;
    float _1422 = _1320 * _826;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1414 + _1424;
    float _1428 = _1324 * _826;
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = _1314 * _826;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1420 + _1434;
    float _1438 = _1426 * _1426;
    float _1440 = -_1066;
    float _1442 = _1440 + _1410;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1446 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = fma(_1436, _1436, _1438);
    float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1452 = _1442 + _1450;
    float _1454 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1456 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1458 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1460 = fma(_1452, _1452, _1448);
    float _1462 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1464 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    float _1468 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1454);
    float _1470 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1456);
    float _1472 = sqrt(_1460);
    out.m_93.x = _1458;
    out.m_93.y = _1462;
    out.m_93.z = _1430;
    out.m_93.w = _1464;
    float _1474 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1466);
    float _1476 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1468);
    float _1478 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1480 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1346);
    float _1482 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1348);
    float _1484 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1350);
    out.m_95.w = _972;
    float _1486 = -_1036;
    float _1488 = _836 + _1486;
    float _1490 = -_1050;
    float _1492 = _838 + _1490;
    out.m_97.x = _1476;
    out.m_97.y = _1474;
    out.m_97.z = _1478;
    float _1494 = -_1066;
    float _1496 = _846 + _1494;
    float _1498 = _990 + 0.5;
    float _1500 = _1164 + 0.5;
    float _1502 = _1334 + 0.5;
    float _1504 = _1332 + 0.5;
    out.m_99.x = _1176;
    bool _1506 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1508 = isnan(_1472);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1514 = _1510 || _1512;
    out.m_101.x = _1504;
    out.m_101.y = _1498;
    out.m_101.z = _1502;
    out.m_101.w = _1500;
    out.m_103.x = _1480;
    out.m_103.y = _1482;
    out.m_103.z = _1484;
    if (!_1514)
    {
        _900 = 1.0;
    }
    float _1516 = _900;
    bool _1518 = !_1514;
    float _1520 = _1516;
    if (!_1518)
    {
        bool _1522 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1524 = isnan(_1472);
        bool _1526 = _1522 || _1524;
        bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1530 = _1526 || _1528;
        if (!_1530)
        {
            float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1534 = _1472 + _1532;
            float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1538 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1536;
            float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1542 = _1540 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1544 = 1.0 / _1538;
            float _1546 = _1534 * _1544;
            float _1548 = fma(_1546, _1542, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1520 = _1548;
            _1550 = true;
        }
        else
        {
            bool _1552 = _1472 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1554 = isnan(_1472);
            bool _1556 = _1552 || _1554;
            bool _1558 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1560 = _1556 || _1558;
            if (!_1560)
            {
                float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1564 = _1472 + _1562;
                float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1568 = _1566 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1572 = _1570 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1574 = 1.0 / _1568;
                float _1576 = _1564 * _1574;
                float _1578 = fma(_1576, _1572, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1520 = _1578;
                _1550 = true;
            }
            else
            {
                _1520 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1550 = false;
    float _1580 = _1520;
    float _1582 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1584 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1586 = floor(_1582);
    float _1588 = floor(_1584);
    float _1590 = -_1586;
    float _1592 = _1582 + _1590;
    float _1594 = -_1588;
    float _1596 = _1584 + _1594;
    float2 _5628 = float2(_1592, _1596);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5628, float2(0.0), isnan(_5628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5628, float2(0.0), isnan(_5628)), level(0.0)).x;
    float _1600 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1602 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1606 = _1442 + _1604;
    float _1608 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1600);
    float _1610 = _1488 + _1602;
    float _1612 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1608);
    float _1614 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1616 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1618 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1622 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1614);
    float _1624 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1616);
    float _1626 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1618);
    float _1628 = 1.0 / _1620;
    float _1630 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1622);
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1624);
    float _1634 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1626);
    float _1636 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1638 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1644 = _1414 + _1642;
    float _1646 = _1636 + _1620;
    float _1648 = fma(_1644, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1650 = _1646 * _1628;
    float _1652 = _1650 * 0.5;
    float _1654 = -_1488;
    float _1656 = _1654 + _1648;
    float _1658 = trunc(_1638);
    int _1660 = int(_1658);
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1662);
    float _1666 = _1656 * _1656;
    float _1668 = 1.0 / _1664;
    float _1670 = trunc(_1640);
    int _1672 = int(_1670);
    int _1674 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1676 = _1660 + _1674;
    int _1678 = _1676 + 1;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1682 = _1668 * _1680;
    bool _1684 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1686 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1688 = !_1684;
    int _1690 = _1688 ? 0 : 1;
    int _1692 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1694 = _1672 + _1692;
    int _1696 = _1694 + 1;
    float _1698 = fma(_1606, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _1700 = _1678 | _1696;
    float _1702 = -_1496;
    float _1704 = _1702 + _1698;
    int _1706 = 2;
    int _1708 = _1678;
    int _1710 = as_type<int>(_1596);
    float _1712 = _1698;
    if (!_1684)
    {
        _1706 = 1;
    }
    int _1714 = _1706;
    int _1716 = _1714;
    if (!_1686)
    {
        _1716 = _1690;
    }
    int _1718 = _1716;
    bool _1720 = _1678 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1722 = _1718 << 6;
    bool _1724 = _1700 < 0;
    bool _1726 = _1724 || _1720;
    int _1728 = _1722 + 96;
    uint _1731 = uint(int(uint(_1728) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    bool _1747 = _1696 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1749 = _1747 || _1726;
    int _1751 = _1722 + 104;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    uint _1755 = uint(int(uint(int(_1753)) >> uint(2)));
    int _1757 = int(_1753) & 3;
    float _1759 = (*spvDescriptorSet0.vp_c15)._m0[int(_1755)][_1757];
    int _1761 = int(_1753) + 1;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    int _1765 = _1761 & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    float _1769 = as_type<float>(_1718);
    if (!_1749)
    {
        int _1771 = _1696 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1773 = _1771 + _1678;
        _1708 = _1773;
    }
    int _1775 = _1708;
    int _1777 = _1722 + 48;
    uint _1779 = uint(int(uint(_1777) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c15)._m0[int(_1789)][_1791];
    float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1797 = _1420 + _1795;
    if (!_1749)
    {
        int _1799 = _1775 << 2;
        _1356 = _1799;
    }
    int _1801 = _1356;
    float _1803 = fma(_1797, _1580, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1805 = _1801;
    if (!_1749)
    {
        uint _1807 = uint(int(uint(_1775) >> uint(2)));
        _1710 = int(_1807);
    }
    int _1809 = _1710;
    int _1811 = _1722 + 64;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    uint _1815 = uint(int(uint(int(_1813)) >> uint(2)));
    int _1817 = int(_1813) & 3;
    float _1819 = (*spvDescriptorSet0.vp_c15)._m0[int(_1815)][_1817];
    int _1821 = int(_1813) + 1;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    int _1825 = _1821 & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    if (!_1749)
    {
        int _1829 = 12 & _1801;
        _1805 = _1829;
    }
    int _1831 = _1805;
    if (!_1749)
    {
        int _1833 = _1809 << 4;
        int _1835 = _1833 + _1831;
        _1358 = as_type<float>(_1835);
    }
    float _1837 = _1358;
    float _1839 = -_1492;
    float _1841 = _1839 + _1803;
    int _1843 = _1722 + 56;
    uint _1845 = uint(int(uint(_1843) >> uint(2)));
    uint _1847 = uint(int(uint(int(_1845)) >> uint(2)));
    int _1849 = int(_1845) & 3;
    float _1851 = (*spvDescriptorSet0.vp_c15)._m0[int(_1847)][_1849];
    int _1853 = int(_1845) + 1;
    uint _1855 = uint(int(uint(_1853) >> uint(2)));
    int _1857 = _1853 & 3;
    float _1859 = (*spvDescriptorSet0.vp_c15)._m0[int(_1855)][_1857];
    float _1861 = fma(_1841, _1841, _1666);
    float _1863 = fma(_1704, _1704, _1861);
    int _1865 = _1722 + 72;
    uint _1867 = uint(int(uint(_1865) >> uint(2)));
    uint _1869 = uint(int(uint(int(_1867)) >> uint(2)));
    int _1871 = int(_1867) & 3;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
    int _1875 = int(_1867) + 1;
    uint _1877 = uint(int(uint(_1875) >> uint(2)));
    int _1879 = _1875 & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    float _1883 = sqrt(_1863);
    int _1885 = _1722 + 80;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    uint _1889 = uint(int(uint(int(_1887)) >> uint(2)));
    int _1891 = int(_1887) & 3;
    float _1893 = (*spvDescriptorSet0.vp_c15)._m0[int(_1889)][_1891];
    int _1895 = int(_1887) + 1;
    uint _1897 = uint(int(uint(_1895) >> uint(2)));
    int _1899 = _1895 & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    float _1903 = _1610 * _1745;
    float _1905 = fma(_1492, _1737, _1903);
    int _1907 = _1722 + 88;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    float _1925 = fma(_1496, _1759, _1905);
    bool _1927 = _1883 > 0.0;
    float _1929 = _1925 + _1767;
    float _1931 = _1837;
    float _1933 = _1737;
    float _1935 = _1905;
    float _1937 = _1841;
    if (!_1749)
    {
        int _1939 = as_type<int>(_1837) + 400;
        uint _1941 = uint(int(uint(_1939) >> uint(2)));
        uint _1943 = uint(int(uint(int(_1941)) >> uint(2)));
        int _1945 = int(_1941) & 3;
        float _1947 = (*spvDescriptorSet0.vp_c15)._m0[int(_1943)][_1945];
        _1931 = _1947;
    }
    float _1949 = _1931;
    float _1951 = _1610 * _1793;
    float _1953 = 1.0 / _1929;
    float _1955 = fma(_1492, _1785, _1951);
    if (!_1927)
    {
        _1933 = _1803;
    }
    float _1957 = _1933;
    float _1959 = _1610 * _1827;
    float _1961 = _1957;
    float _1963 = _1819;
    if (!_1927)
    {
        _1935 = _1648;
    }
    float _1965 = _1935;
    float _1967 = fma(_1492, _1819, _1959);
    float _1969 = fma(_1496, _1851, _1955);
    float _1971 = fma(_1496, _1873, _1967);
    bool _1973 = !_1927;
    float _1975 = _1965;
    if (!_1973)
    {
        float _1977 = _224 * _224;
        float _1979 = fma(_228, _228, _1977);
        float _1981 = fma(_230, _230, _1979);
        float _1983 = rsqrt(_1863);
        float _1985 = sqrt(_1981);
        float _1987 = _1841 * _1983;
        float _1989 = _1656 * _1983;
        float _1991 = _1704 * _1983;
        bool _1993 = _1985 > 0.0;
        float _1995 = _1983;
        float _1997 = _1985;
        _1963 = _1987;
        if (!_1993)
        {
            _1995 = _1803;
        }
        float _1999 = _1995;
        _1961 = _1999;
        if (!_1993)
        {
            _1997 = _1648;
        }
        float _2001 = _1997;
        bool _2003 = !_1993;
        _1975 = _2001;
        if (!_2003)
        {
            float _2005 = rsqrt(_1981);
            float _2007 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2009 = _224 * _2005;
            float _2011 = _228 * _2005;
            float _2013 = _1989 * _2009;
            float _2015 = _230 * _2005;
            float _2017 = fma(_1987, _2011, _2013);
            float _2019 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2021 = fma(_1991, _2015, _2017);
            float _2023 = _2021 * _2019;
            float _2025 = fma(_228, _2023, _1803);
            float _2027 = fma(_224, _2023, _1648);
            float _2029 = fma(_230, _2023, _1698);
            _1975 = _2027;
            _1961 = _2025;
            _1712 = _2029;
        }
    }
    float _2031 = _1975;
    float _2033 = _1961;
    float _2035 = _1712;
    float _2037 = _1963;
    float _2039 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2041 = _1969 + _1859;
    float _2043 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2045 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2047 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2039);
    float _2049 = _2041 * _1953;
    float _2051 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2043);
    float _2053 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2045);
    float _2055 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2047);
    float _2057 = _1971 + _1881;
    float _2059 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2051);
    bool _2061 = _2049 >= 0.0;
    float _2063 = _2031 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2065 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2053);
    float _2067 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2069 = _2057 * _1953;
    float _2071 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2073 = _2049 <= 1.0;
    bool _2075 = _2073 && _2061;
    float _2077 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2063);
    float _2079 = _2065 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2081 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2083 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2085 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2087 = _2069 >= 0.0;
    bool _2089 = _2087 && _2075;
    float _2091 = fma(_2035, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2077);
    float _2093 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2081);
    float _2095 = -_2085;
    float _2097 = fma(_2095, _2083, 1.0);
    bool _2099 = _2069 <= 1.0;
    bool _2101 = _2099 && _2089;
    float _2103 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2105 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2093);
    float _2107 = _1610 * _1901;
    float _2109 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2111 = _2037;
    if (!_1749)
    {
        float _2113 = floor(_1638);
        _2111 = _2113;
    }
    float _2115 = _2111;
    float _2117 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2105);
    float _2119 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2121 = fma(_1492, _1893, _2107);
    float _2123 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2109);
    float _2125 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2119);
    float _2127 = fma(_1496, _1915, _2121);
    float _2129 = _1967;
    float _2131 = _2125;
    if (!_1749)
    {
        float _2133 = floor(_1640);
        _2129 = _2133;
    }
    float _2135 = _2129;
    if (_2101)
    {
        float _2137 = float(_1718);
        _1769 = _2137;
    }
    float _2139 = _1769;
    float _2141 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2123);
    float _2143 = _2127 + _1923;
    float _2145 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2141);
    float _2147 = _2143 * _1953;
    float _2149 = log2(_2097);
    float _2151 = _2139;
    if (!_1749)
    {
        float _2153 = -_2115;
        float _2155 = _1638 + _2153;
        _1937 = _2155;
    }
    float _2157 = _1937;
    float _2159 = 1.0 / _2117;
    float _2161 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2125);
    if (!_1749)
    {
        float _2163 = -_2135;
        float _2165 = _1640 + _2163;
        _2131 = _2165;
    }
    float _2167 = _2131;
    float _2169 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2161);
    float _2171 = _1949;
    if (!_1749)
    {
        float _2173 = rint(_1949);
        float _2175 = precise::max(_2173, 0.0);
        uint _2177 = uint(_2175);
        uint _2179 = clamp(_2177, 0u, 65535u);
        _2171 = as_type<float>(_2179);
    }
    float _2181 = _2171;
    float _2183 = _2149 * 0.693147182464599609375;
    float _2185 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2187 = _2123;
    float _2189 = _2185;
    if (_2101)
    {
        float _2191 = rint(_2139);
        float _2193 = precise::max(_2191, 0.0);
        uint _2195 = uint(_2193);
        uint _2197 = clamp(_2195, 0u, 65535u);
        _2187 = as_type<float>(_2197);
    }
    float _2199 = _2187;
    float _2201 = _2145 * _2159;
    float _2203 = _2169 * _2159;
    float _2205 = fma(_2201, 0.5, 0.5);
    float _2207 = fma(_2203, -0.5, 0.5);
    float _2209 = _2181;
    float _2211 = _2203;
    if (!_1749)
    {
        float3 _6681 = float3(_2157, _2167, float(as_type<int>(_2181)));
        float3 _6685 = select(_6681, float3(0.0), isnan(_6681));
        float _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6685.xy, uint(rint(_6685.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6685.xy, uint(rint(_6685.z)), level(0.0)).x;
        _2209 = _2213;
    }
    float _2215 = _2209;
    float _2217 = _2069;
    if (_2101)
    {
        float3 _6700 = float3(_2049, _2069, float(as_type<int>(_2199)));
        float3 _6702 = select(_6700, float3(0.0), isnan(_6700));
        float _2219 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6702.xy, uint(rint(_6702.z)), _2147, level(0.0));
        _2217 = _2219;
    }
    float _2221 = _2217;
    float3 _6712 = float3(_2205, _2207, _2185);
    float _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6712, float3(0.0), isnan(_6712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6712, float3(0.0), isnan(_6712)), level(0.0)).x;
    float3 _6721 = float3(_2205, _2207, _2185);
    float4 _2226 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6721, float3(0.0), isnan(_6721)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6721, float3(0.0), isnan(_6721)), level(0.0)).xyzw;
    float _2228 = _2226.x;
    float _2230 = _2226.y;
    float _2232 = _2226.z;
    float _2234 = _2226.w;
    if (_1749)
    {
        _2211 = 1.0;
    }
    float _2236 = _2211;
    bool _2238 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2240 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2242 = _2238 || _2240;
    bool _2244 = isnan(0.5);
    bool _2246 = _2242 || _2244;
    float _2248 = _2236;
    if (_2246)
    {
        _2151 = 1.0;
    }
    float _2250 = _2151;
    float _2252 = _2250;
    if (!_2246)
    {
        float _2254 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2256 = _2254 * 0.15915493667125701904296875;
        float _2258 = _2256 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        float _2262 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = _2256 * 6.283185482025146484375;
        float _2268 = sin(_2266);
        float _2270 = 1.0 / _2260;
        float _2272 = _2264 * 6.283185482025146484375;
        float _2274 = cos(_2272);
        float _2276 = _2268 * _2270;
        float _2278 = _2264 * 6.283185482025146484375;
        float _2280 = sin(_2278);
        float _2282 = _2274 * _2276;
        float _2284 = 1.0 / _2282;
        float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2288 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2286;
        float _2290 = 1.0 / _2288;
        float _2292 = _2280 * _2284;
        float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2296 = fma(_1682, _2292, _2294);
        float _2298 = _2296 * _2290;
        float _2300 = precise::clamp(_2298, 0.0, 1.0);
        _2189 = _2264;
        _2252 = _2300;
    }
    float _2302 = _2189;
    float _2304 = _2252;
    float _2306 = _2302;
    if (!_1749)
    {
        int _2308 = _1775 << 4;
        int _2310 = _2308 + 2048;
        uint _2312 = uint(int(uint(_2310) >> uint(2)));
        uint _2314 = uint(int(uint(int(_2312)) >> uint(2)));
        int _2316 = int(_2312) & 3;
        float _2318 = (*spvDescriptorSet0.vp_c15)._m0[int(_2314)][_2316];
        int _2320 = int(_2312) + 1;
        uint _2322 = uint(int(uint(_2320) >> uint(2)));
        int _2324 = _2320 & 3;
        float _2326 = (*spvDescriptorSet0.vp_c15)._m0[int(_2322)][_2324];
        int _2328 = _2310 + 8;
        uint _2330 = uint(int(uint(_2328) >> uint(2)));
        uint _2332 = uint(int(uint(int(_2330)) >> uint(2)));
        int _2334 = int(_2330) & 3;
        float _2336 = (*spvDescriptorSet0.vp_c15)._m0[int(_2332)][_2334];
        int _2338 = int(_2330) + 1;
        uint _2340 = uint(int(uint(_2338) >> uint(2)));
        int _2342 = _2338 & 3;
        float _2344 = (*spvDescriptorSet0.vp_c15)._m0[int(_2340)][_2342];
        float _2346 = _1610 * _2326;
        float _2348 = fma(_1492, _2318, _2346);
        float _2350 = fma(_1496, _2336, _2348);
        float _2352 = _2350 + _2344;
        float _2354 = precise::clamp(_2352, 0.0, 1.0);
        float _2356 = -_2354;
        float _2358 = _2356 + _2215;
        float _2360 = fma(_2358, 500.0, 1.5);
        float _2362 = exp2(_2360);
        float _2364 = 0.0 + _2362;
        float _2366 = precise::clamp(_2364, 0.0, 1.0);
        _2306 = _2344;
        _2248 = _2366;
    }
    float _2368 = _2306;
    float _2370 = _2248;
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2374 = _2031 + _2372;
    float _2376 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2378 = _2033 + _2376;
    float _2380 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2382 = _2035 + _2380;
    float _2384 = _2374 * _2374;
    float _2386 = fma(_2378, _2378, _2384);
    float _2388 = fma(_2382, _2382, _2386);
    float _2390 = rsqrt(_2388);
    float _2392 = sqrt(_2388);
    float _2394 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2396 = _2378 * _2394;
    float _2398 = _2382 * _2394;
    float _2400 = _2396 * _2396;
    float _2402 = _2398 * _2398;
    float _2404 = _2400 + _2402;
    float _2406 = sqrt(_2404);
    bool _2408 = _2406 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2412 = _2406 + _2410;
    float _2414 = _2382;
    float _2416 = _2404;
    float _2418 = _2412;
    float _2420 = _2368;
    float _2422 = _2394;
    if (_2408)
    {
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2414 = _2424;
    }
    float _2426 = _2414;
    if (_2408)
    {
        float _2428 = rsqrt(_2404);
        _2416 = _2428;
    }
    float _2430 = _2416;
    if (_2408)
    {
        float _2432 = _2412 * _2426;
        _2418 = _2432;
    }
    float _2434 = _2418;
    if (_2408)
    {
        float _2436 = _2434 * 0.15915493667125701904296875;
        _2420 = _2436;
    }
    float _2438 = _2420;
    float _2440 = _2384;
    float _2442 = _2438;
    if (_2408)
    {
        float _2444 = _2438 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        _2440 = _2446;
    }
    float _2448 = _2440;
    float _2450 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2452 = precise::max(0.0, _2450);
    float _2454 = _2390;
    float _2456 = _2452;
    float _2458 = _2450;
    if (_2408)
    {
        float _2460 = _2438 * 6.283185482025146484375;
        float _2462 = cos(_2460);
        _2454 = _2462;
    }
    float _2464 = _2454;
    float _2466 = -_2394;
    float _2468 = -_2452;
    float _2470 = fma(_2374, _2466, _2468);
    float _2472 = _2470;
    if (!_2408)
    {
        _2456 = _2396;
    }
    float _2474 = _2456;
    float _2476 = _2474;
    if (_2408)
    {
        float _2478 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2458 = _2478;
    }
    float _2480 = _2458;
    float _2482 = _2448;
    float _2484 = _2480;
    if (_2408)
    {
        float _2486 = fma(_2448, _2480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2482 = _2486;
    }
    float _2488 = _2482;
    float _2490 = _2488;
    float _2492 = _2464;
    if (_2408)
    {
        float _2494 = _2464 + (-1.0);
        _2484 = _2494;
    }
    float _2496 = _2484;
    float _2498 = _2496;
    if (_2408)
    {
        float _2500 = _2430 * _2488;
        _2422 = _2500;
    }
    float _2502 = _2422;
    if (!_2408)
    {
        _2490 = _2400;
    }
    float _2504 = _2490;
    float _2506 = _2504;
    if (_2408)
    {
        float _2508 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2442 = _2508;
    }
    float _2510 = _2442;
    if (_2408)
    {
        float _2512 = _2396 * _2502;
        _2476 = _2512;
    }
    float _2514 = _2476;
    if (!_2408)
    {
        _2498 = _2398;
    }
    float _2516 = _2498;
    float _2518 = _2516;
    if (_2408)
    {
        float _2520 = _2398 * _2502;
        _2518 = _2520;
    }
    float _2522 = _2518;
    if (_2408)
    {
        float _2524 = fma(_2470, _2464, _2510);
        _2472 = _2524;
    }
    float _2526 = _2472;
    if (_2408)
    {
        float _2528 = _2514 * _2514;
        _2506 = _2528;
    }
    float _2530 = _2506;
    if (!_2408)
    {
        _2492 = _2402;
    }
    float _2532 = _2492;
    float _2534 = _2532;
    if (_2408)
    {
        float _2536 = _2522 * _2522;
        _2534 = _2536;
    }
    float _2538 = _2534;
    float _2540 = fma(_2526, _2526, _2530);
    float _2542 = _2540 + _2538;
    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2546 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2544);
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = rsqrt(_2542);
    float _2552 = -_2548;
    float _2554 = _2552 + 1.0;
    float _2556 = abs(_2554);
    float _2558 = log2(_2556);
    float _2560 = _2550 * _2514;
    float _2562 = _2550 * _2526;
    float _2564 = _2550 * _2522;
    float _2566 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2568 = -_2566;
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2568);
    float _2572 = -_2564;
    float _2574 = fma(_2572, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2570);
    float _2576 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2578 = fma(_2574, -0.5, 0.5);
    float _2580 = fma(_2574, 0.5, 0.5);
    float _2582 = _2562 + 1.0;
    float _2584 = exp2(_2576);
    float _2586 = fma(_2580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2588 = fma(_2580, _2586, -0.212114393711090087890625);
    float _2590 = sqrt(_2578);
    float _2592 = fma(_2580, _2588, 1.570728778839111328125);
    float _2594 = -_2562;
    float _2596 = fma(_2584, _2582, _2594);
    float _2598 = fma(_2596, 0.5, 0.5);
    float _2600 = _2590 * 0.636619746685028076171875;
    float _2602 = -_2592;
    float _2604 = fma(_2600, _2602, 1.0);
    float2 _7286 = float2(_2604, _2598);
    float3 _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7286, float2(0.0), isnan(_7286)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7286, float2(0.0), isnan(_7286)), level(0.0)).xyz;
    float _2610 = _2608.x;
    float _2612 = _2608.y;
    float _2614 = _2608.z;
    float _2616 = abs(_1682);
    float _2618 = log2(_2616);
    float _2620 = _2067 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2622 = _2558 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2624 = -_1598;
    float _2626 = _2624 + 1.0;
    float _2628 = fma(_2079, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2620);
    out.m_105.x = _1492;
    out.m_105.y = _1488;
    out.m_105.z = _1496;
    float _2630 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2628);
    float _2632 = exp2(_2622);
    bool _2634 = _1682 <= 8000.0;
    bool _2636 = isnan(_1682);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan(8000.0);
    bool _2642 = _2638 || _2640;
    float _2644 = float(_2642);
    out.m_107.x = _2033;
    out.m_107.y = _2031;
    out.m_107.z = _2035;
    float _2646 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2630);
    float _2648 = _2117 * 0.5;
    bool _2650 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2652 = isnan(_2392);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2658 = _2654 || _2656;
    float _2660 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2662 = _2646 + _2117;
    float _2664 = fma(_2169, -0.5, _2648);
    float _2666 = _2145 + _2117;
    float _2668 = _2662 * 0.5;
    float _2670 = exp2(_2660);
    out.gl_Position.x = _2145;
    out.gl_Position.y = _2169;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _2117;
    float _2672 = _2666 * 0.5;
    float _2674 = -_2632;
    float _2676 = _2674 + 1.0;
    out.m_109.x = _2672;
    out.m_109.y = _2664;
    out.m_109.z = _2668;
    out.m_109.w = _2117;
    float _2678 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2680 = _2676;
    if (!_2658)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2682 = _2680;
    float _2684 = _2304 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2686 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2688 = precise::clamp(_2686, 0.0, 1.0);
    float _2690 = fma(_2688, -2.0, 3.0);
    float _2692 = _2688 * _2688;
    float _2694 = _2692 * _2690;
    float _2696 = -_2694;
    float _2698 = _2696 + 1.0;
    float _2700 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2694);
    float _2702 = _2644 * _2700;
    float _2704 = _2700;
    float _2706 = _2682;
    float _2708 = _2682;
    if (!_2101)
    {
        _2704 = 1.0;
    }
    float _2710 = _2704;
    float _2712 = _2710;
    if (_2101)
    {
        bool _2714 = _2221 >= _2147;
        bool _2716 = isnan(_2221);
        bool _2718 = _2714 || _2716;
        bool _2720 = isnan(_2147);
        bool _2722 = _2718 || _2720;
        float _2724 = float(_2722);
        _2712 = _2724;
    }
    float _2726 = _2712;
    float _2728 = _2702 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2730 = _2626 * _2728;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2726 * _2370;
    float _2736 = _2678 * _2223;
    float _2738 = -_2678;
    float _2740 = _2738 + 1.0;
    float _2742 = -_2732;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2746 = _2234 * _2736;
    float _2748 = _2234 * _2740;
    float _2750 = -_2734;
    float _2752 = fma(_2750, _2744, 1.0);
    float _2754 = precise::clamp(_2752, 0.0, 1.0);
    float _2756 = _2740;
    float _2758 = _2734;
    float _2760 = _2754;
    float _2762 = _2746;
    float _2764 = _2736;
    if (!_2658)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2766 = _2756;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2658)
    {
        _2758 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2772 = _2758;
    float _2774 = _2754 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2776 = _2772;
    float _2778 = _2772;
    if (!_2658)
    {
        _2760 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2780 = _2760;
    out.m_111.x = _2774;
    float _2782 = _2614 * _2736;
    float _2784 = fma(_2610, _2746, _2228);
    float _2786 = fma(_2612, _2746, _2230);
    float _2788 = _2780;
    float _2790 = _2780;
    if (!_2658)
    {
        _2762 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2792 = _2762;
    float _2794 = fma(_2234, _2782, _2232);
    float _2796 = _2792;
    float _2798 = _2792;
    if (!_2658)
    {
        _2764 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2800 = _2764;
    out.m_113.x = _2784;
    out.m_113.y = _2786;
    out.m_113.z = _2794;
    out.m_113.w = _2748;
    bool _2802 = !_2658;
    float _2804 = _2800;
    float _2806 = _2800;
    if (!_2802)
    {
        bool _2808 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2810 = isnan(_2392);
        bool _2812 = _2808 || _2810;
        bool _2814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2816 = _2812 || _2814;
        if (!_2816)
        {
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2820 = _2392 + _2818;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2824 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2822;
            float _2826 = 1.0 / _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2846 = _2844 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2848 = _2820 * _2826;
            float _2850 = precise::clamp(_2848, 0.0, 1.0);
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2856 = fma(_2850, _2830, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2858 = fma(_2850, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2860 = fma(_2850, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2862 = fma(_2850, _2838, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2864 = fma(_2850, _2842, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2866 = fma(_2850, _2846, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2708 = _2856;
            _2806 = _2864;
            _2770 = _2858;
            _2778 = _2862;
            _2798 = _2860;
            _2790 = _2866;
            _2868 = true;
        }
        else
        {
            bool _2870 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2872 = isnan(_2392);
            bool _2874 = _2870 || _2872;
            bool _2876 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2878 = _2874 || _2876;
            if (!_2878)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2880 = _2768;
            _2770 = _2880;
            if (!_2878)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2882 = _2706;
            _2708 = _2882;
            if (!_2878)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2884 = _2796;
            _2798 = _2884;
            if (!_2878)
            {
                _2776 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2886 = _2776;
            _2778 = _2886;
            if (!_2878)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2888 = _2804;
            _2806 = _2888;
            if (!_2878)
            {
                _2788 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2890 = _2788;
            bool _2892 = !_2878;
            _2790 = _2890;
            if (!_2892)
            {
                bool _2894 = _2392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2896 = isnan(_2392);
                bool _2898 = _2894 || _2896;
                bool _2900 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2902 = _2898 || _2900;
                if (!_2902)
                {
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2906 = _2392 + _2904;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2910 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2908;
                    float _2912 = 1.0 / _2910;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2930 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2934 = _2906 * _2912;
                    float _2936 = precise::clamp(_2934, 0.0, 1.0);
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2942 = fma(_2936, _2916, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2944 = fma(_2936, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2946 = fma(_2936, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2948 = fma(_2936, _2924, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2950 = fma(_2936, _2928, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2952 = fma(_2936, _2932, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2708 = _2942;
                    _2806 = _2950;
                    _2770 = _2944;
                    _2778 = _2948;
                    _2798 = _2946;
                    _2790 = _2952;
                    _2868 = true;
                }
                else
                {
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2778 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2790 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2868 = false;
    float _2954 = _2708;
    float _2956 = _2806;
    float _2958 = _2770;
    float _2960 = _2778;
    float _2962 = _2798;
    float _2964 = _2790;
    float _2966 = fma(_1482, -0.5, 0.5);
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = -_2954;
    float _2972 = _2970 + _2956;
    float _2974 = _2684 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2976 = -_2958;
    float _2978 = _2976 + _2960;
    out.m_115.x = 0.0;
    float _2980 = fma(_2968, _2972, _2954);
    float _2982 = fma(_2968, _2978, _2958);
    out.m_61.x = _2974;
    float _2984 = -_2962;
    float _2986 = _2984 + _2964;
    float _2988 = _2980 * 0.586610972881317138671875;
    bool _2990 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2992 = fma(_2968, _2986, _2962);
    float _2994 = fma(_2982, 0.298911988735198974609375, _2988);
    bool _2996 = _2304 > 0.0;
    bool _2998 = isnan(_2304);
    bool _3000 = _2996 || _2998;
    bool _3002 = isnan(0.0);
    bool _3004 = _3000 || _3002;
    float _3006 = fma(_2992, 0.114477999508380889892578125, _2994);
    float _3008 = -_3006;
    float _3010 = _2980 + _3008;
    float _3012 = -_3006;
    float _3014 = _2982 + _3012;
    float _3016 = -_3006;
    float _3018 = _2992 + _3016;
    float _3020 = fma(_3010, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    float _3022 = fma(_3014, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    float _3024 = fma(_3018, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3006);
    bool _3026 = !_2990;
    if (!_3026)
    {
        float _3028 = -_2031;
        float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3032 = -_2033;
        float _3034 = _3032 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3036 = -_2035;
        float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3040 = _3030 * _3030;
        float _3042 = fma(_3034, _3034, _3040);
        float _3044 = fma(_3038, _3038, _3042);
        float _3046 = sqrt(_3044);
        float _3048 = rsqrt(_3044);
        float _3050 = -_3046;
        float _3052 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3056 = precise::clamp(_3054, 0.0, 1.0);
        float _3058 = _3034 * _3048;
        float _3060 = _3030 * _3048;
        float _3062 = abs(_3056);
        float _3064 = log2(_3062);
        float _3066 = _3038 * _3048;
        float _3068 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3070 = _1482 * _3060;
        float _3072 = -_3060;
        float _3074 = -_3068;
        float _3076 = fma(_3072, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3074);
        float _3078 = fma(_1480, _3058, _3070);
        float _3080 = -_3066;
        float _3082 = fma(_3080, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3076);
        float _3084 = fma(_1484, _3066, _3078);
        float _3086 = precise::clamp(_3084, 0.0, 1.0);
        float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3090 = _3082 + _3088;
        float _3092 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3094 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3096 = precise::clamp(_3094, 0.0, 1.0);
        float _3098 = exp2(_3092);
        float _3100 = _3098 * _3096;
        float _3102 = _3086 * _3100;
        float _3104 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3108 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_115.x = _3104;
        out.m_115.y = _3106;
        out.m_115.z = _3108;
    }
    out.m_95.x = _3022;
    out.m_95.y = _3020;
    out.m_95.z = _3024;
    if (_3004)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3110 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3110;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

