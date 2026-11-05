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
    bool _2862 = false;
    bool _1560 = false;
    bool _688 = false;
    bool _542 = false;
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
        float _3161 = as_type<float>(_150);
        out.gl_Position.z = _3161;
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
    if (_164)
    {
        float _170 = float(_134);
        _144 = _170;
    }
    float _172 = _144;
    bool _174 = _168 >= _172;
    bool _176 = !_164;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _152 = as_type<int>(_184);
    }
    int _186 = _152;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3230 = as_type<float>(_186);
        out.gl_Position.z = _3230;
    }
    if (_178)
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
    float _318 = -_314;
    float _320 = _318 + 1.0;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _288;
    float _326 = _264 * _290;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _260 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = 1.0 / _284;
    float _340 = _268 * _316;
    bool _342 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_260);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_352;
    float _356 = _354 + 1.0;
    float _358 = _330 * _324;
    bool _360 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _362 = isnan(_260);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _370 * _356;
    float _374 = _272 * _338;
    float _376 = -_370;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = _302 * _378;
    float _390 = -_302;
    float _392 = _390 + 1.0;
    float _394 = fma(_382, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_386, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _398 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _400 = isnan(_260);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _314 * _392;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = _408 * _320;
    float _426 = fma(_414, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_418, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_422, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _396 * _424;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = _394 * _424;
    float _444 = _336 * _424;
    float _446 = -_408;
    float _448 = _446 + 1.0;
    float _450 = in.m_75.x;
    float _452 = in.m_75.y;
    float _454 = in.m_75.z;
    float _456 = fma(_436, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_440, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _464;
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _432);
    float _470 = fma(_428, _410, _460);
    float _472 = fma(_426, _410, _462);
    float _474 = fma(_466, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_430, _410, _468);
    float _490 = fma(_478, _358, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _358, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_486, _358, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = fma(_456, _388, _470);
    float _498 = fma(_458, _388, _472);
    float _500 = fma(_474, _388, _488);
    float _502 = fma(_490, _372, _496);
    float _504 = fma(_492, _372, _498);
    float _506 = fma(_494, _372, _500);
    float _508 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].x, _502);
    float _510 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].y, _504);
    float _512 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].z, _506);
    float _514 = _508 * _450;
    float _516 = _510 * _452;
    float _518 = _512 * _454;
    bool _520 = !_322;
    float _522 = _516;
    float _540;
    if (!_520)
    {
        float _524 = in.m_73.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_134);
        float _546 = 1.0 / _544;
        float _548 = _168 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _550 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _560 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _562 = isnan(_550);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _576 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _578 = isnan(_550);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _588;
    bool _592 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = isnan(_550);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = 1.0 / _558;
    float _606 = -_570;
    float _608 = _606 + 1.0;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _612 = _586 * _608;
    float _614 = -_586;
    float _616 = _614 + 1.0;
    float _618 = 1.0 / _574;
    float _620 = _590 * _604;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = fma(_620, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _628 = _624 * _618;
    float _630 = _626 * _612;
    float _632 = -_602;
    float _634 = _632 + 1.0;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _638 = _550 + _636;
    float _640 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[115].x, _630);
    float _642 = _570 * _634;
    float _644 = fma(_628, _638, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = fma(_644, _642, _640);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[117].x, _648);
    float _656 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_77.x = _656;
    out.m_77.y = _658;
    out.m_77.z = _660;
    out.m_77.w = _662;
    bool _664 = !_610;
    float _666 = _660;
    float _668 = _662;
    float _686;
    if (!_664)
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
    float _698 = in.m_79.y;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _702 = _696 + _700;
    float _704 = in.m_73.w;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _708 = _706 != 0;
    float _710 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _712 = in.m_58.x;
    float _714 = in.m_58.y;
    float _716 = in.m_58.z;
    float _718 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _720 = in.m_73.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _724 = _722 != 0;
    float _726 = in.m_73.y;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _736 = _734 != 0;
    float _738 = in.m_73.x;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _742 = _740 != 0;
    float _744 = -_698;
    float _746 = _744 + 1.0;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    bool _748 = _704 > 0.5;
    float _750 = in.m_67.w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _754 = _204 * _714;
    float _756 = _198 * _714;
    float _758 = _210 * _714;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _762 = _720 > 0.5;
    float _764 = fma(_202, _712, _754);
    float _766 = _720;
    float _768 = _698;
    float _770 = _718;
    if (!_708)
    {
        _666 = _720;
    }
    float _772 = _666;
    float _774 = in.m_69.w;
    float _776 = _772;
    if (!_708)
    {
        _668 = _726;
    }
    float _778 = _668;
    float _780 = fma(_196, _712, _756);
    float _782 = _778;
    if (_708)
    {
        _776 = _726;
    }
    float _784 = _776;
    float _786 = in.m_71.w;
    if (_708)
    {
        _782 = _738;
    }
    float _788 = _782;
    float _790 = fma(_208, _712, _758);
    if (_708)
    {
        _766 = _726;
    }
    float _792 = _766;
    float _794 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _796 = _748 ? as_type<int>(_746) : as_type<int>(_698);
    float _798 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].z, _752);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _802 = _800 != 0;
    float _804 = -_732;
    float _806 = fma(_794, 2.0, _804);
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _810 = _808 != 0;
    float _812 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _814 = in.m_83.x;
    float _816 = in.m_83.y;
    float _818 = in.m_83.z;
    float _820 = in.m_83.w;
    float _822 = _736 ? as_type<float>(_796) : _698;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _826 = _726 > 0.5;
    float _828 = fma(_206, _716, _764);
    float _830 = fma(_812, -2.0, _760);
    int _832 = _826 ? as_type<int>(_746) : as_type<int>(_698);
    float _834 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].w, _824);
    float _836 = fma(_212, _716, _790);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = _802 ? as_type<float>(_832) : _698;
    float _844 = fma(_200, _716, _780);
    bool _846 = _802;
    if (_724)
    {
        bool _848 = _738 > 0.5;
        _846 = _848;
    }
    bool _850 = _846;
    float _852 = _828 + _774;
    float _854 = 1.0 / _840;
    float _856 = _844 + _750;
    float _858 = _836 + _786;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _862 = _856 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _866 = _852 + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _878 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _880;
    float _884 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _886 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _876);
    float _888 = _862 * _862;
    float _890 = 1.0 / _870;
    float _892 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _884);
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _858 + _894;
    float _898 = fma(_866, _866, _888);
    float _900 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].x, _878);
    float _902 = _882 * _854;
    float _904 = in.m_79.x;
    float _906 = fma(_896, _896, _898);
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _910 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _918 = _696 + _916;
    float _920 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _886);
    float _922 = _898;
    float _924 = _872;
    if (_810)
    {
        float _926 = _762 ? _746 : _698;
        _768 = _926;
    }
    float _928 = _768;
    float _930 = _784 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _932 = sqrt(_906);
    float _934 = _914 * _890;
    float _936 = fma(_902, _918, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_85.x = _892;
    out.m_85.y = _920;
    out.m_85.z = _910;
    float _938 = fma(_934, _702, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _940 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _942 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _944 = isnan(_696);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = rsqrt(_906);
    float _956 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _960 = fma(_940, _842, -0.5);
    float _962 = fma(_822, _956, -0.5);
    bool _964 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _966 = isnan(_696);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _798);
    float _978 = _710 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _980 = _932 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _982 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _834);
    float _984 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    float _986 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].w, _958);
    float _988 = _930;
    if (!_724)
    {
        _922 = _904;
    }
    float _990 = _922;
    float _992 = -_974;
    float _994 = _992 + 1.0;
    float _996 = precise::min(_978, _980);
    float _998 = -_984;
    float _1000 = fma(_982, _960, _998);
    bool _1002 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1004 = isnan(_696);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = in.m_87.x;
    float _1016 = in.m_87.y;
    float _1018 = in.m_87.z;
    float _1020 = _990;
    if (!_724)
    {
        _924 = _990;
    }
    float _1022 = _924;
    float _1024 = _954 * _996;
    int _1026 = as_type<int>(_1024);
    float _1028 = _1022;
    float _1030 = _954;
    if (_724)
    {
        _1020 = _904;
    }
    float _1032 = _1020;
    float _1034 = _1012 * _994;
    float _1036 = -_1012;
    float _1038 = _1036 + 1.0;
    float _1040 = _862 * _1024;
    float _1042 = _866 * _1024;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1048 = _952 * _1038;
    float _1050 = -_1040;
    float _1052 = _862 + _1050;
    float _1054 = -_1042;
    float _1056 = _866 + _1054;
    float _1058 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1046);
    float _1060 = _936 * _1048;
    float _1062 = _1052 * _1052;
    float _1064 = _896 * _1024;
    float _1066 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1070 = fma(_1056, _1056, _1062);
    float _1072 = -_1064;
    float _1074 = _896 + _1072;
    float _1076 = -_1044;
    float _1078 = fma(_1066, 2.0, _1076);
    float _1080 = in.m_89.x;
    float _1082 = in.m_89.y;
    float _1084 = in.m_89.z;
    bool _1086 = _1016 != 0.0;
    bool _1088 = isnan(_1016);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = fma(_1074, _1074, _1070);
    int _1098 = as_type<int>(_1066);
    int _1100 = as_type<int>(_1068);
    float _1102 = _1058;
    if (_724)
    {
        float _1104 = -_1032;
        float _1106 = _1104 + 1.0;
        _1098 = as_type<int>(_1106);
    }
    int _1108 = _1098;
    float _1110 = fma(_930, -2.0, _1068);
    bool _1112 = _1014 == 0.0;
    bool _1114 = !_1094;
    bool _1116 = _1112 && _1114;
    float _1118 = sqrt(_1096);
    float _1120 = as_type<float>(_1108);
    if (_730)
    {
        float _1122 = -_1032;
        float _1124 = _1122 + 1.0;
        _1100 = as_type<int>(_1124);
    }
    int _1126 = _1100;
    if (_742)
    {
        float _1128 = -_1032;
        float _1130 = _1128 + 1.0;
        _1026 = as_type<int>(_1130);
    }
    int _1132 = _1026;
    bool _1134 = _1018 == 0.0;
    bool _1136 = _1134 && _1116;
    float _1138 = -_952;
    float _1140 = _1138 + 1.0;
    if (_724)
    {
        float _1142 = _850 ? as_type<float>(_1108) : _1032;
        _1028 = _1142;
    }
    float _1144 = _1028;
    float _1146 = -_168;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    if (!_730)
    {
        _988 = _1032;
    }
    float _1150 = _988;
    float _1152 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1060);
    float _1154 = _1150;
    if (!_742)
    {
        _1120 = _1032;
    }
    float _1156 = _1120;
    float _1158 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1058);
    float _1160 = _1156;
    if (_730)
    {
        float _1162 = _762 ? as_type<float>(_1126) : _1032;
        _1154 = _1162;
    }
    float _1164 = _1154;
    float _1166 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _986);
    if (_742)
    {
        float _1168 = _826 ? as_type<float>(_1132) : _1032;
        _1160 = _1168;
    }
    float _1170 = _1160;
    float _1172 = -_168;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1078);
    float _1176 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1110);
    float _1178 = _954 * _1118;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_1136)
    {
        _1030 = _1080;
    }
    float _1182 = _1030;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1016);
    float _1188 = _1180 * _1178;
    float _1190 = _1182;
    float _1192 = _1188;
    if (_1136)
    {
        _522 = _1182;
    }
    float _1194 = _522;
    float _1196 = _718 * _1178;
    float _1198 = _1194;
    if (!_1136)
    {
        _1190 = _1080;
    }
    float _1200 = _1190;
    float _1202 = _710 * _1178;
    float _1204 = _1188 * _1186;
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1014);
    if (_1136)
    {
        _1102 = _1082;
    }
    float _1208 = _1102;
    float _1210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1018);
    float _1212 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1214 = _1202 * _1206;
    float _1216 = _1208;
    if (_1136)
    {
        _770 = _1208;
    }
    float _1218 = _770;
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1218;
    if (!_1136)
    {
        _1216 = _1082;
    }
    float _1224 = _1216;
    float _1226 = _1196 * _1210;
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1212);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1234 = _1228;
    if (_1136)
    {
        _1192 = _1084;
    }
    float _1236 = _1192;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1240 = fma(_938, _1034, _1152);
    float _1242 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1232);
    float _1244 = _1236;
    if (_1136)
    {
        _1234 = _1236;
    }
    float _1246 = _1234;
    float _1248 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1250 = _1246;
    if (!_1136)
    {
        _1244 = _1084;
    }
    float _1252 = _1244;
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1256 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1258 = _858 + _1248;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = _852 + _1254;
    float _1264 = -_1176;
    float _1266 = fma(_1166, _962, _1264);
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1270 = _1258 + _1268;
    float _1272 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_1256, _1144, -0.5);
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1262 + _1276;
    float _1280 = _1270 * _1270;
    float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1284 = fma(_1272, _1164, -0.5);
    float _1286 = _1262;
    if (!_1136)
    {
        float _1288 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1252);
        _1250 = _1288;
    }
    float _1290 = _1250;
    float _1292 = fma(_1278, _1278, _1280);
    float _1294 = _1290;
    if (!_1136)
    {
        float _1296 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1224);
        _1222 = _1296;
    }
    float _1298 = _1222;
    float _1300 = _928 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1302 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1136)
    {
        float _1304 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1200);
        _1198 = _1304;
    }
    float _1306 = _1198;
    float _1308 = sqrt(_1292);
    float _1310 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1312 = _1302 * _1260;
    float _1314 = _818 * _1200;
    float _1316 = _816 * _1252;
    float _1318 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1320 = _814 * _1224;
    float _1322 = -_1314;
    float _1324 = fma(_814, _1252, _1322);
    float _1326 = _1300 * _1282;
    float _1328 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1318);
    float _1330 = -_1316;
    float _1332 = fma(_818, _1224, _1330);
    float _1334 = -_1320;
    float _1336 = fma(_816, _1200, _1334);
    float _1338 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1240);
    out.m_91.x = _1312;
    out.m_91.y = _1326;
    float _1340 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1342 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1344 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1348 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1350 = _856 + _1340;
    float _1352 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1342);
    float _1354 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1346);
    float _1356 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1348);
    float _1358 = fma(_976, _1274, _1148);
    float _1360 = fma(_1158, _1284, _1174);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1364 = _1346;
    float _1366 = _1306;
    if (!_1344)
    {
        _1364 = _1258;
    }
    float _1368 = _1364;
    float _1370 = _1368;
    if (!_1344)
    {
        _1366 = _1350;
    }
    float _1372 = _1366;
    bool _1374 = !_1344;
    float _1376 = _1372;
    if (!_1374)
    {
        float _1378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1382 = _1308 + _1380;
        float _1384 = _1350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = rsqrt(_1292);
        float _1388 = _1382 * _1378;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1390 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = _1390 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        float _1400 = _1394 + (-1.0);
        float _1402 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1398, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1406 = fma(_1350, _1394, _1402);
        float _1408 = _1386 * _1404;
        float _1410 = fma(_1278, _1408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1412 = fma(_1270, _1408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1376 = _1406;
        _1286 = _1410;
        _1370 = _1412;
    }
    float _1414 = _1376;
    float _1416 = _1286;
    float _1418 = _1370;
    float _1420 = -_1040;
    float _1422 = _1420 + _1414;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1426 = -_1042;
    float _1428 = _1426 + _1416;
    float _1430 = -_1064;
    float _1432 = _1430 + _1418;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1436 = _1422 + _1434;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1428 + _1440;
    float _1444 = _1324 * _820;
    float _1446 = _1436 * _1436;
    float _1448 = _1332 * _820;
    float _1450 = _1336 * _820;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1454 = fma(_1442, _1442, _1446);
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1458 = _1432 + _1456;
    float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1462 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = fma(_1458, _1458, _1454);
    float _1468 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1474 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1460);
    float _1476 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1452);
    float _1478 = sqrt(_1466);
    float _1480 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    float _1482 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1474);
    out.m_93.x = _1464;
    out.m_93.y = _1468;
    out.m_93.z = _1470;
    out.m_93.w = _1472;
    float _1484 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1354);
    float _1486 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1476);
    float _1488 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1480);
    float _1490 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1352);
    float _1492 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1356);
    out.m_95.w = _996;
    float _1494 = -_1042;
    float _1496 = _852 + _1494;
    float _1498 = -_1040;
    float _1500 = _856 + _1498;
    out.m_97.x = _1482;
    out.m_97.y = _1486;
    out.m_97.z = _1488;
    float _1502 = -_1064;
    float _1504 = _858 + _1502;
    bool _1506 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1508 = isnan(_1478);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1514 = _1510 || _1512;
    float _1516 = _1000 + 0.5;
    float _1518 = _1266 + 0.5;
    float _1520 = _1360 + 0.5;
    float _1522 = _1358 + 0.5;
    out.m_99.x = _1202;
    out.m_101.x = _1522;
    out.m_101.y = _1516;
    out.m_101.z = _1520;
    out.m_101.w = _1518;
    out.m_103.x = _1490;
    out.m_103.y = _1484;
    out.m_103.z = _1492;
    float _1524 = _1450;
    if (!_1514)
    {
        _1294 = 1.0;
    }
    float _1526 = _1294;
    bool _1528 = !_1514;
    float _1530 = _1526;
    if (!_1528)
    {
        bool _1532 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1534 = isnan(_1478);
        bool _1536 = _1532 || _1534;
        bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1540 = _1536 || _1538;
        if (!_1540)
        {
            float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1544 = _1478 + _1542;
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1554 = 1.0 / _1548;
            float _1556 = _1544 * _1554;
            float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1530 = _1558;
            _1560 = true;
        }
        else
        {
            bool _1562 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1564 = isnan(_1478);
            bool _1566 = _1562 || _1564;
            bool _1568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1570 = _1566 || _1568;
            if (!_1570)
            {
                float _1572 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1574 = _1478 + _1572;
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1576 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1584 = 1.0 / _1578;
                float _1586 = _1574 * _1584;
                float _1588 = fma(_1586, _1582, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1530 = _1588;
                _1560 = true;
            }
            else
            {
                _1530 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1560 = false;
    float _1590 = _1530;
    float _1592 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1594 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1596 = floor(_1592);
    float _1598 = floor(_1594);
    float _1600 = -_1596;
    float _1602 = _1592 + _1600;
    float _1604 = -_1598;
    float _1606 = _1594 + _1604;
    float2 _5643 = float2(_1602, _1606);
    float _1608 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).x;
    float _1610 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1612 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1616 = _1428 + _1614;
    float _1618 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1610);
    float _1620 = _1500 + _1612;
    float _1622 = fma(_1616, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1624 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1618);
    float _1626 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1628 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1630 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1626);
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1636 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1628);
    float _1638 = 1.0 / _1630;
    float _1640 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1632);
    float _1642 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1634);
    float _1644 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1636);
    float _1646 = -_1496;
    float _1648 = _1646 + _1622;
    float _1650 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1652 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1642);
    float _1654 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1656 = _1650 + _1630;
    float _1658 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1660 = trunc(_1654);
    int _1662 = int(_1660);
    float _1664 = _1656 * _1638;
    float _1666 = _1664 * 0.5;
    float _1668 = trunc(_1658);
    int _1670 = int(_1668);
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1672);
    float _1676 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1678 = _1432 + _1676;
    float _1680 = fma(_1678, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1682 = 1.0 / _1674;
    int _1684 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1686 = _1662 + _1684;
    int _1688 = _1686 + 1;
    float _1690 = -_1504;
    float _1692 = _1690 + _1680;
    int _1694 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1696 = _1670 + _1694;
    int _1698 = _1696 + 1;
    int _1700 = _1698 | _1688;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1704 = _1682 * _1702;
    bool _1706 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1708 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1710 = !_1706;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = 2;
    float _1716 = _1680;
    float _1718 = _1654;
    if (!_1706)
    {
        _1714 = 1;
    }
    int _1720 = _1714;
    int _1722 = _1720;
    if (!_1708)
    {
        _1722 = _1712;
    }
    int _1724 = _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1728 = _1422 + _1726;
    bool _1730 = _1698 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1732 = _1724 << 6;
    float _1734 = fma(_1728, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1736 = _1700 < 0;
    bool _1738 = _1736 || _1730;
    int _1740 = _1732 + 96;
    uint _1743 = uint(int(uint(_1740) >> uint(2)));
    uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
    int _1747 = int(_1743) & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    int _1751 = int(_1743) + 1;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    int _1755 = _1751 & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    float _1759 = -_1500;
    float _1761 = _1759 + _1734;
    bool _1763 = _1688 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1765 = _1763 || _1738;
    float _1767 = _1761 * _1761;
    int _1769 = _1732 + 104;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
    int _1775 = int(_1771) & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    int _1779 = int(_1771) + 1;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    int _1783 = _1779 & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    float _1787 = fma(_1648, _1648, _1767);
    float _1789 = fma(_1692, _1692, _1787);
    int _1791 = _1732 + 64;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
    int _1797 = int(_1793) & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = int(_1793) + 1;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    int _1805 = _1801 & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    float _1809 = sqrt(_1789);
    int _1811 = _1732 + 48;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    uint _1815 = uint(int(uint(int(_1813)) >> uint(2)));
    int _1817 = int(_1813) & 3;
    float _1819 = (*spvDescriptorSet0.vp_c15)._m0[int(_1815)][_1817];
    int _1821 = int(_1813) + 1;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    int _1825 = _1821 & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = _1732 + 72;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    uint _1833 = uint(int(uint(int(_1831)) >> uint(2)));
    int _1835 = int(_1831) & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = int(_1831) + 1;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    int _1843 = _1839 & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    bool _1847 = _1809 > 0.0;
    int _1849 = _1732 + 56;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    int _1867 = _1732 + 80;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    float _1885 = _1620 * _1757;
    float _1887 = fma(_1496, _1749, _1885);
    float _1889 = fma(_1504, _1777, _1887);
    float _1891 = _1887;
    int _1893 = as_type<int>(_1749);
    float _1895 = _1761;
    float _1897 = as_type<float>(_1724);
    if (!_1765)
    {
        float _1899 = floor(_1658);
        _1891 = _1899;
    }
    float _1901 = _1891;
    float _1903 = _1889 + _1785;
    float _1905 = _1620 * _1807;
    uint _1907 = as_type<uint>(_1807);
    if (!_1765)
    {
        int _1909 = _1688 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1911 = _1909 + _1698;
        _1907 = uint(_1911);
    }
    uint _1913 = _1907;
    float _1915 = fma(_1496, _1799, _1905);
    float _1917 = 1.0 / _1903;
    int _1919 = as_type<int>(_1915);
    if (!_1765)
    {
        uint _1921 = uint(int(uint(int(_1913)) >> uint(2)));
        _1893 = int(_1921);
    }
    int _1923 = _1893;
    float _1925 = _1620 * _1827;
    float _1927 = fma(_1496, _1819, _1925);
    float _1929 = _1819;
    float _1931 = _1927;
    if (!_1847)
    {
        _1929 = _1622;
    }
    float _1933 = _1929;
    float _1935 = fma(_1504, _1837, _1915);
    float _1937 = _1933;
    if (!_1765)
    {
        int _1939 = int(_1913) << 2;
        _1919 = _1939;
    }
    int _1941 = _1919;
    int _1943 = _1941;
    if (!_1765)
    {
        int _1945 = 12 & _1941;
        _1943 = _1945;
    }
    int _1947 = _1943;
    float _1949 = fma(_1504, _1857, _1927);
    if (!_1847)
    {
        _1931 = _1734;
    }
    float _1951 = _1931;
    bool _1953 = !_1847;
    float _1955 = _1951;
    float _1957 = _1951;
    if (!_1953)
    {
        float _1959 = _224 * _224;
        float _1961 = rsqrt(_1789);
        float _1963 = fma(_228, _228, _1959);
        float _1965 = fma(_230, _230, _1963);
        float _1967 = sqrt(_1965);
        float _1969 = _1648 * _1961;
        float _1971 = _1761 * _1961;
        float _1973 = _1692 * _1961;
        bool _1975 = _1967 > 0.0;
        float _1977 = _1967;
        _1524 = _1971;
        if (!_1975)
        {
            _1977 = _1622;
        }
        float _1979 = _1977;
        _1937 = _1979;
        if (!_1975)
        {
            _1955 = _1734;
        }
        float _1981 = _1955;
        bool _1983 = !_1975;
        _1957 = _1981;
        if (!_1983)
        {
            float _1985 = rsqrt(_1965);
            float _1987 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1989 = _224 * _1985;
            float _1991 = _228 * _1985;
            float _1993 = _1971 * _1989;
            float _1995 = _230 * _1985;
            float _1997 = fma(_1969, _1991, _1993);
            float _1999 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2001 = fma(_1973, _1995, _1997);
            float _2003 = _2001 * _1999;
            float _2005 = fma(_228, _2003, _1622);
            float _2007 = fma(_224, _2003, _1734);
            float _2009 = fma(_230, _2003, _1680);
            _1957 = _2007;
            _1937 = _2005;
            _1716 = _2009;
        }
    }
    float _2011 = _1957;
    float _2013 = _1937;
    float _2015 = _1716;
    float _2017 = _1524;
    float _2019 = _2017;
    if (!_1765)
    {
        int _2021 = _1923 << 4;
        int _2023 = _2021 + _1947;
        _1895 = as_type<float>(_2023);
    }
    float _2025 = _1895;
    float _2027 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2029 = _1732 + 88;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2051 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2027);
    float _2053 = _1949 + _1865;
    float _2055 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2047);
    float _2057 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2049);
    float _2059 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2051);
    float _2061 = _2025;
    if (!_1765)
    {
        int _2063 = as_type<int>(_2025) + 400;
        uint _2065 = uint(int(uint(_2063) >> uint(2)));
        uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
        int _2069 = int(_2065) & 3;
        float _2071 = (*spvDescriptorSet0.vp_c15)._m0[int(_2067)][_2069];
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _1935 + _1845;
    float _2077 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2079 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2081 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2057);
    float _2083 = _2053 * _1917;
    float _2085 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2087 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2089 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2079);
    float _2091 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2095 = _2083 >= 0.0;
    float _2097 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2099 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2101 = _2075 * _1917;
    float _2103 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2089);
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    bool _2107 = _2083 <= 1.0;
    bool _2109 = _2107 && _2095;
    float _2111 = -_2099;
    float _2113 = fma(_2111, _2097, 1.0);
    float _2115 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2117 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2105);
    bool _2119 = _2101 >= 0.0;
    bool _2121 = _2119 && _2109;
    float _2123 = log2(_2113);
    float _2125 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2127 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    bool _2129 = _2101 <= 1.0;
    bool _2131 = _2129 && _2121;
    float _2133 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2135 = _1620 * _1883;
    float _2137 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2125);
    float _2139 = _2075;
    float _2141 = _2091;
    if (!_1765)
    {
        float _2143 = -_1901;
        float _2145 = _1658 + _2143;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = 1.0 / _2127;
    float _2151 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2133);
    float _2153 = fma(_1496, _1875, _2135);
    float _2155 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2137);
    float _2157 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2151);
    float _2159 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2155);
    float _2161 = _230;
    float _2163 = _2159;
    if (!_1765)
    {
        float _2165 = floor(_1654);
        _2161 = _2165;
    }
    float _2167 = _2161;
    if (_2131)
    {
        float _2169 = float(_1724);
        _1897 = _2169;
    }
    float _2171 = _1897;
    float _2173 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2157);
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = fma(_1504, _2037, _2153);
    float _2179 = _2137;
    float _2181 = _2177;
    float _2183 = _2171;
    if (_2131)
    {
        float _2185 = rint(_2171);
        float _2187 = precise::max(_2185, 0.0);
        uint _2189 = uint(_2187);
        uint _2191 = clamp(_2189, 0u, 65535u);
        _2179 = as_type<float>(_2191);
    }
    float _2193 = _2179;
    float _2195 = _2159 * _2149;
    float _2197 = _2173 * _2149;
    float _2199 = fma(_2195, 0.5, 0.5);
    float _2201 = fma(_2197, -0.5, 0.5);
    float _2203 = _2149;
    if (!_1765)
    {
        float _2205 = rint(_2073);
        float _2207 = precise::max(_2205, 0.0);
        uint _2209 = uint(_2207);
        uint _2211 = clamp(_2209, 0u, 65535u);
        _2203 = as_type<float>(_2211);
    }
    float _2213 = _2203;
    if (!_1765)
    {
        float _2215 = -_2167;
        float _2217 = _1654 + _2215;
        _1718 = _2217;
    }
    float _2219 = _1718;
    float _2221 = _2177 + _2045;
    float _2223 = _2221 * _1917;
    float _2225 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = _2101;
    float _2229 = _2223;
    if (_2131)
    {
        float3 _6704 = float3(_2083, _2101, float(as_type<int>(_2193)));
        float3 _6708 = select(_6704, float3(0.0), isnan(_6704));
        float _2231 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6708.xy, uint(rint(_6708.z)), _2223, level(0.0));
        _2227 = _2231;
    }
    float _2233 = _2227;
    float3 _6718 = float3(_2199, _2201, _2225);
    float _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6718, float3(0.0), isnan(_6718)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6718, float3(0.0), isnan(_6718)), level(0.0)).x;
    float3 _6727 = float3(_2199, _2201, _2225);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6727, float3(0.0), isnan(_6727)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6727, float3(0.0), isnan(_6727)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float _2248 = _2147;
    if (!_1765)
    {
        float3 _6750 = float3(_2147, _2219, float(as_type<int>(_2213)));
        float3 _6752 = select(_6750, float3(0.0), isnan(_6750));
        float _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6752.xy, uint(rint(_6752.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6752.xy, uint(rint(_6752.z)), level(0.0)).x;
        _2248 = _2250;
    }
    float _2252 = _2248;
    if (_1765)
    {
        _2181 = 1.0;
    }
    float _2254 = _2181;
    float _2256 = _2254;
    if (!_1765)
    {
        int _2258 = int(_1913) << 4;
        int _2260 = _2258 + 2048;
        uint _2262 = uint(int(uint(_2260) >> uint(2)));
        uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
        int _2266 = int(_2262) & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        int _2270 = int(_2262) + 1;
        uint _2272 = uint(int(uint(_2270) >> uint(2)));
        int _2274 = _2270 & 3;
        float _2276 = (*spvDescriptorSet0.vp_c15)._m0[int(_2272)][_2274];
        int _2278 = _2260 + 8;
        uint _2280 = uint(int(uint(_2278) >> uint(2)));
        uint _2282 = uint(int(uint(int(_2280)) >> uint(2)));
        int _2284 = int(_2280) & 3;
        float _2286 = (*spvDescriptorSet0.vp_c15)._m0[int(_2282)][_2284];
        int _2288 = int(_2280) + 1;
        uint _2290 = uint(int(uint(_2288) >> uint(2)));
        int _2292 = _2288 & 3;
        float _2294 = (*spvDescriptorSet0.vp_c15)._m0[int(_2290)][_2292];
        float _2296 = _1620 * _2276;
        float _2298 = fma(_1496, _2268, _2296);
        float _2300 = fma(_1504, _2286, _2298);
        float _2302 = _2300 + _2294;
        float _2304 = precise::clamp(_2302, 0.0, 1.0);
        float _2306 = -_2304;
        float _2308 = _2306 + _2252;
        float _2310 = fma(_2308, 500.0, 1.5);
        float _2312 = exp2(_2310);
        float _2314 = 0.0 + _2312;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        _2183 = _2294;
        _2256 = _2316;
    }
    float _2318 = _2183;
    float _2320 = _2256;
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2324 = _2011 + _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2328 = _2013 + _2326;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2015 + _2330;
    float _2334 = _2324 * _2324;
    float _2336 = fma(_2328, _2328, _2334);
    float _2338 = fma(_2332, _2332, _2336);
    float _2340 = rsqrt(_2338);
    float _2342 = sqrt(_2338);
    float _2344 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2346 = _2328 * _2344;
    float _2348 = _2332 * _2344;
    float _2350 = _2346 * _2346;
    float _2352 = _2348 * _2348;
    float _2354 = _2350 + _2352;
    float _2356 = sqrt(_2354);
    bool _2358 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2362 = _2356 + _2360;
    float _2364 = _2332;
    float _2366 = _2354;
    float _2368 = _2362;
    float _2370 = _2318;
    float _2372 = _2324;
    if (_2358)
    {
        float _2374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2374;
    }
    float _2376 = _2364;
    if (_2358)
    {
        float _2378 = rsqrt(_2354);
        _2366 = _2378;
    }
    float _2380 = _2366;
    if (_2358)
    {
        float _2382 = _2362 * _2376;
        _2368 = _2382;
    }
    float _2384 = _2368;
    if (_2358)
    {
        float _2386 = _2384 * 0.15915493667125701904296875;
        _2370 = _2386;
    }
    float _2388 = _2370;
    float _2390 = _2334;
    float _2392 = _2388;
    if (_2358)
    {
        float _2394 = _2388 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        _2390 = _2396;
    }
    float _2398 = _2390;
    float _2400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2402 = precise::max(0.0, _2400);
    float _2404 = _2340;
    float _2406 = _2402;
    float _2408 = _2400;
    if (_2358)
    {
        float _2410 = _2388 * 6.283185482025146484375;
        float _2412 = cos(_2410);
        _2404 = _2412;
    }
    float _2414 = _2404;
    float _2416 = -_2344;
    float _2418 = -_2402;
    float _2420 = fma(_2324, _2416, _2418);
    if (!_2358)
    {
        _2406 = _2346;
    }
    float _2422 = _2406;
    float _2424 = _2422;
    if (_2358)
    {
        float _2426 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2408 = _2426;
    }
    float _2428 = _2408;
    float _2430 = _2398;
    float _2432 = _2428;
    if (_2358)
    {
        float _2434 = fma(_2398, _2428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2430 = _2434;
    }
    float _2436 = _2430;
    float _2438 = _2436;
    if (!_2358)
    {
        _2432 = _2420;
    }
    float _2440 = _2432;
    float _2442 = _2440;
    float _2444 = _2414;
    if (_2358)
    {
        float _2446 = _2414 + (-1.0);
        _2372 = _2446;
    }
    float _2448 = _2372;
    float _2450 = _2448;
    if (_2358)
    {
        float _2452 = _2380 * _2436;
        _2019 = _2452;
    }
    float _2454 = _2019;
    if (!_2358)
    {
        _2438 = _2350;
    }
    float _2456 = _2438;
    float _2458 = _2456;
    if (_2358)
    {
        float _2460 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2460;
    }
    float _2462 = _2392;
    if (_2358)
    {
        float _2464 = _2346 * _2454;
        _2424 = _2464;
    }
    float _2466 = _2424;
    if (!_2358)
    {
        _2450 = _2348;
    }
    float _2468 = _2450;
    float _2470 = _2468;
    if (_2358)
    {
        float _2472 = _2348 * _2454;
        _2470 = _2472;
    }
    float _2474 = _2470;
    if (_2358)
    {
        float _2476 = fma(_2420, _2414, _2462);
        _2442 = _2476;
    }
    float _2478 = _2442;
    if (_2358)
    {
        float _2480 = _2466 * _2466;
        _2458 = _2480;
    }
    float _2482 = _2458;
    if (!_2358)
    {
        _2444 = _2352;
    }
    float _2484 = _2444;
    float _2486 = _2484;
    if (_2358)
    {
        float _2488 = _2474 * _2474;
        _2486 = _2488;
    }
    float _2490 = _2486;
    float _2492 = fma(_2478, _2478, _2482);
    float _2494 = _2492 + _2490;
    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2498 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2496);
    float _2500 = precise::clamp(_2498, 0.0, 1.0);
    float _2502 = rsqrt(_2494);
    float _2504 = -_2500;
    float _2506 = _2504 + 1.0;
    float _2508 = _2502 * _2478;
    float _2510 = _2502 * _2466;
    float _2512 = abs(_2506);
    float _2514 = log2(_2512);
    float _2516 = _2502 * _2474;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2520 = -_2518;
    float _2522 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = -_2516;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2528 = fma(_2526, -0.5, 0.5);
    float _2530 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2532 = fma(_2526, 0.5, 0.5);
    float _2534 = _2508 + 1.0;
    float _2536 = sqrt(_2528);
    float _2538 = fma(_2532, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2532, _2538, -0.212114393711090087890625);
    float _2542 = exp2(_2530);
    float _2544 = fma(_2532, _2540, 1.570728778839111328125);
    float _2546 = _2536 * 0.636619746685028076171875;
    float _2548 = -_2544;
    float _2550 = fma(_2546, _2548, 1.0);
    float _2552 = -_2508;
    float _2554 = fma(_2542, _2534, _2552);
    float _2556 = fma(_2554, 0.5, 0.5);
    float2 _7227 = float2(_2550, _2556);
    float3 _2560 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7227, float2(0.0), isnan(_7227)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7227, float2(0.0), isnan(_7227)), level(0.0)).xyz;
    float _2562 = _2560.x;
    float _2564 = _2560.y;
    float _2566 = _2560.z;
    float _2568 = abs(_1704);
    float _2570 = log2(_2568);
    float _2572 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2574 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2576 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.5);
    bool _2584 = _2580 || _2582;
    float _2586 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2588 = -_1608;
    float _2590 = _2588 + 1.0;
    out.m_105.x = _1496;
    out.m_105.y = _1500;
    out.m_105.z = _1504;
    float _2592 = exp2(_2574);
    float _2594 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2586);
    float _2596 = _2127 * 0.5;
    out.m_107.x = _2013;
    out.m_107.y = _2011;
    out.m_107.z = _2015;
    float _2598 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2594);
    float _2600 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2602 = _2594;
    float _2604 = _2536;
    if (!_2584)
    {
        float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2608 = _1704 + _2606;
        _2602 = _2608;
    }
    float _2610 = _2602;
    if (!_2584)
    {
        _2604 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2612 = _2604;
    out.gl_Position.x = _2159;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2598;
    out.gl_Position.w = _2127;
    bool _2614 = _1704 <= 8000.0;
    bool _2616 = isnan(_1704);
    bool _2618 = _2614 || _2616;
    bool _2620 = isnan(8000.0);
    bool _2622 = _2618 || _2620;
    float _2624 = float(_2622);
    float _2626 = exp2(_2600);
    float _2628 = _2624;
    if (_2584)
    {
        _2141 = 1.0;
    }
    float _2630 = _2141;
    float _2632 = -_2592;
    float _2634 = _2632 + 1.0;
    float _2636 = fma(_2626, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2626;
    float _2642 = _2630;
    if (!_2584)
    {
        float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2646 = _2612 + _2644;
        _2640 = _2646;
    }
    float _2648 = _2640;
    float _2650 = fma(_2638, -2.0, 3.0);
    float _2652 = _2638 * _2638;
    float _2654 = _2352;
    if (!_2584)
    {
        float _2656 = 1.0 / _2648;
        _2654 = _2656;
    }
    float _2658 = _2654;
    float _2660 = _2652 * _2650;
    float _2662 = -_2660;
    float _2664 = _2662 + 1.0;
    float _2666 = _2159 + _2127;
    float _2668 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2660);
    float _2670 = _2598 + _2127;
    float _2672 = _2666 * 0.5;
    float _2674 = fma(_2173, -0.5, _2596);
    float _2676 = _2624 * _2668;
    if (!_2131)
    {
        _2628 = 1.0;
    }
    float _2678 = _2628;
    float _2680 = _2670 * 0.5;
    float _2682 = _2678;
    if (_2131)
    {
        bool _2684 = _2233 >= _2223;
        bool _2686 = isnan(_2233);
        bool _2688 = _2684 || _2686;
        bool _2690 = isnan(_2223);
        bool _2692 = _2688 || _2690;
        float _2694 = float(_2692);
        _2682 = _2694;
    }
    float _2696 = _2682;
    float _2698 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2700 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2702 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2704 = isnan(_2342);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2710 = _2706 || _2708;
    out.m_109.x = _2672;
    out.m_109.y = _2674;
    out.m_109.z = _2680;
    out.m_109.w = _2127;
    float _2712 = _2590 * _2698;
    float _2714 = precise::clamp(_2712, 0.0, 1.0);
    float _2716 = _2700 * _2235;
    float _2718 = _2696 * _2320;
    float _2720 = -_2700;
    float _2722 = _2720 + 1.0;
    float _2724 = -_2714;
    float _2726 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2728 = _2718;
    float _2730 = _2722;
    float _2732 = _2714;
    if (!_2584)
    {
        float _2734 = _2610 * _2658;
        float _2736 = precise::clamp(_2734, 0.0, 1.0);
        _2642 = _2736;
    }
    float _2738 = _2642;
    float _2740 = -_2718;
    float _2742 = fma(_2740, _2726, 1.0);
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = _2744;
    if (!_2710)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2748 = _2728;
    float _2750 = _2744 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2752 = _2246 * _2716;
    float _2754 = _2246 * _2722;
    float _2756 = _2748;
    float _2758 = _2748;
    if (!_2710)
    {
        _2163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2760 = _2163;
    out.m_111.x = _2750;
    float _2762 = _2760;
    float _2764 = _2760;
    if (!_2710)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2766 = _2229;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2710)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2772 = _2730;
    float _2774 = _2772;
    float _2776 = _2772;
    if (!_2710)
    {
        _2732 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2778 = _2732;
    float _2780 = _2778;
    float _2782 = _2778;
    if (!_2710)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2784 = _2746;
    float _2786 = _2566 * _2716;
    float _2788 = fma(_2562, _2752, _2240);
    float _2790 = fma(_2564, _2752, _2242);
    float _2792 = _2738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2794 = fma(_2246, _2786, _2244);
    out.m_113.x = _2788;
    out.m_113.y = _2790;
    out.m_113.z = _2794;
    out.m_113.w = _2754;
    bool _2796 = !_2710;
    float _2798 = _2784;
    float _2800 = _2784;
    if (!_2796)
    {
        bool _2802 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2804 = isnan(_2342);
        bool _2806 = _2802 || _2804;
        bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2810 = _2806 || _2808;
        if (!_2810)
        {
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2814 = _2342 + _2812;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2818 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2816;
            float _2820 = 1.0 / _2818;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2842 = _2814 * _2820;
            float _2844 = precise::clamp(_2842, 0.0, 1.0);
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2850 = fma(_2844, _2824, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2852 = fma(_2844, _2848, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2854 = fma(_2844, _2828, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2856 = fma(_2844, _2832, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2858 = fma(_2844, _2836, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2860 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2764 = _2852;
            _2782 = _2858;
            _2758 = _2850;
            _2776 = _2856;
            _2770 = _2854;
            _2800 = _2860;
            _2862 = true;
        }
        else
        {
            bool _2864 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2866 = isnan(_2342);
            bool _2868 = _2864 || _2866;
            bool _2870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2872 = _2868 || _2870;
            if (!_2872)
            {
                _2756 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2874 = _2756;
            _2758 = _2874;
            if (!_2872)
            {
                _2762 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2876 = _2762;
            _2764 = _2876;
            if (!_2872)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2878 = _2768;
            _2770 = _2878;
            if (!_2872)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2880 = _2774;
            _2776 = _2880;
            if (!_2872)
            {
                _2780 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2882 = _2780;
            _2782 = _2882;
            if (!_2872)
            {
                _2798 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2884 = _2798;
            bool _2886 = !_2872;
            _2800 = _2884;
            if (!_2886)
            {
                bool _2888 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2890 = isnan(_2342);
                bool _2892 = _2888 || _2890;
                bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2896 = _2892 || _2894;
                if (!_2896)
                {
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2900 = _2342 + _2898;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2902;
                    float _2906 = 1.0 / _2904;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2928 = _2900 * _2906;
                    float _2930 = precise::clamp(_2928, 0.0, 1.0);
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2936 = fma(_2930, _2910, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2938 = fma(_2930, _2934, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2940 = fma(_2930, _2914, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2942 = fma(_2930, _2918, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2944 = fma(_2930, _2922, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2946 = fma(_2930, _2926, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2764 = _2938;
                    _2782 = _2944;
                    _2758 = _2936;
                    _2776 = _2942;
                    _2770 = _2940;
                    _2800 = _2946;
                    _2862 = true;
                }
                else
                {
                    _2764 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2782 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2758 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2800 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2862 = false;
    float _2948 = _2764;
    float _2950 = _2782;
    float _2952 = _2758;
    float _2954 = _2776;
    float _2956 = _2770;
    float _2958 = _2800;
    float _2960 = fma(_1484, -0.5, 0.5);
    float _2962 = precise::clamp(_2960, 0.0, 1.0);
    float _2964 = -_2948;
    float _2966 = _2964 + _2950;
    float _2968 = _2792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2970 = -_2952;
    float _2972 = _2970 + _2954;
    float _2974 = fma(_2962, _2966, _2948);
    out.m_115.x = 0.0;
    float _2976 = -_2956;
    float _2978 = _2976 + _2958;
    float _2980 = fma(_2962, _2972, _2952);
    float _2982 = _2974 * 0.586610972881317138671875;
    out.m_61.x = _2968;
    bool _2984 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2986 = fma(_2962, _2978, _2956);
    float _2988 = fma(_2980, 0.298911988735198974609375, _2982);
    bool _2990 = _2738 > 0.0;
    bool _2992 = isnan(_2738);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan(0.0);
    bool _2998 = _2994 || _2996;
    float _3000 = fma(_2986, 0.114477999508380889892578125, _2988);
    float _3002 = -_3000;
    float _3004 = _2980 + _3002;
    float _3006 = -_3000;
    float _3008 = _2974 + _3006;
    float _3010 = -_3000;
    float _3012 = _2986 + _3010;
    float _3014 = fma(_3004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    float _3016 = fma(_3008, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    float _3018 = fma(_3012, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    bool _3020 = !_2984;
    if (!_3020)
    {
        float _3022 = -_2011;
        float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3026 = -_2013;
        float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3030 = -_2015;
        float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3034 = _3024 * _3024;
        float _3036 = fma(_3028, _3028, _3034);
        float _3038 = fma(_3032, _3032, _3036);
        float _3040 = sqrt(_3038);
        float _3042 = rsqrt(_3038);
        float _3044 = -_3040;
        float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3048 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = _3028 * _3042;
        float _3054 = _3024 * _3042;
        float _3056 = abs(_3050);
        float _3058 = log2(_3056);
        float _3060 = _3032 * _3042;
        float _3062 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3064 = _1484 * _3054;
        float _3066 = -_3054;
        float _3068 = -_3062;
        float _3070 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3068);
        float _3072 = fma(_1490, _3052, _3064);
        float _3074 = -_3060;
        float _3076 = fma(_3074, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3070);
        float _3078 = fma(_1492, _3060, _3072);
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3084 = _3076 + _3082;
        float _3086 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3088 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        float _3092 = exp2(_3086);
        float _3094 = _3092 * _3090;
        float _3096 = _3080 * _3094;
        float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3100 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3102 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_115.x = _3098;
        out.m_115.y = _3100;
        out.m_115.z = _3102;
    }
    out.m_95.x = _3014;
    out.m_95.y = _3016;
    out.m_95.z = _3018;
    if (_2998)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3104;
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
    bool _2862 = false;
    bool _1560 = false;
    bool _688 = false;
    bool _542 = false;
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
        float _3161 = as_type<float>(_150);
        out.gl_Position.z = _3161;
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
    if (_164)
    {
        float _170 = float(_134);
        _144 = _170;
    }
    float _172 = _144;
    bool _174 = _168 >= _172;
    bool _176 = !_164;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _152 = as_type<int>(_184);
    }
    int _186 = _152;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3230 = as_type<float>(_186);
        out.gl_Position.z = _3230;
    }
    if (_178)
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
    float _318 = -_314;
    float _320 = _318 + 1.0;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _288;
    float _326 = _264 * _290;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _260 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = 1.0 / _284;
    float _340 = _268 * _316;
    bool _342 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_260);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_352;
    float _356 = _354 + 1.0;
    float _358 = _330 * _324;
    bool _360 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _362 = isnan(_260);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _370 * _356;
    float _374 = _272 * _338;
    float _376 = -_370;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = _302 * _378;
    float _390 = -_302;
    float _392 = _390 + 1.0;
    float _394 = fma(_382, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_386, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _398 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _400 = isnan(_260);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _314 * _392;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = _408 * _320;
    float _426 = fma(_414, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_418, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_422, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _396 * _424;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = _394 * _424;
    float _444 = _336 * _424;
    float _446 = -_408;
    float _448 = _446 + 1.0;
    float _450 = in.m_75.x;
    float _452 = in.m_75.y;
    float _454 = in.m_75.z;
    float _456 = fma(_436, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_440, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _464;
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _432);
    float _470 = fma(_428, _410, _460);
    float _472 = fma(_426, _410, _462);
    float _474 = fma(_466, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_430, _410, _468);
    float _490 = fma(_478, _358, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _358, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_486, _358, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = fma(_456, _388, _470);
    float _498 = fma(_458, _388, _472);
    float _500 = fma(_474, _388, _488);
    float _502 = fma(_490, _372, _496);
    float _504 = fma(_492, _372, _498);
    float _506 = fma(_494, _372, _500);
    float _508 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].x, _502);
    float _510 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].y, _504);
    float _512 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].z, _506);
    float _514 = _508 * _450;
    float _516 = _510 * _452;
    float _518 = _512 * _454;
    bool _520 = !_322;
    float _522 = _516;
    float _540;
    if (!_520)
    {
        float _524 = in.m_73.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_134);
        float _546 = 1.0 / _544;
        float _548 = _168 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _550 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _560 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _562 = isnan(_550);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _576 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _578 = isnan(_550);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _588;
    bool _592 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = isnan(_550);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = 1.0 / _558;
    float _606 = -_570;
    float _608 = _606 + 1.0;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _612 = _586 * _608;
    float _614 = -_586;
    float _616 = _614 + 1.0;
    float _618 = 1.0 / _574;
    float _620 = _590 * _604;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = fma(_620, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _628 = _624 * _618;
    float _630 = _626 * _612;
    float _632 = -_602;
    float _634 = _632 + 1.0;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _638 = _550 + _636;
    float _640 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[115].x, _630);
    float _642 = _570 * _634;
    float _644 = fma(_628, _638, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = fma(_644, _642, _640);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[117].x, _648);
    float _656 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_77.x = _656;
    out.m_77.y = _658;
    out.m_77.z = _660;
    out.m_77.w = _662;
    bool _664 = !_610;
    float _666 = _660;
    float _668 = _662;
    float _686;
    if (!_664)
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
    float _698 = in.m_79.y;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _702 = _696 + _700;
    float _704 = in.m_73.w;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _708 = _706 != 0;
    float _710 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _712 = in.m_58.x;
    float _714 = in.m_58.y;
    float _716 = in.m_58.z;
    float _718 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _720 = in.m_73.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _724 = _722 != 0;
    float _726 = in.m_73.y;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _736 = _734 != 0;
    float _738 = in.m_73.x;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _742 = _740 != 0;
    float _744 = -_698;
    float _746 = _744 + 1.0;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    bool _748 = _704 > 0.5;
    float _750 = in.m_67.w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _754 = _204 * _714;
    float _756 = _198 * _714;
    float _758 = _210 * _714;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _762 = _720 > 0.5;
    float _764 = fma(_202, _712, _754);
    float _766 = _720;
    float _768 = _698;
    float _770 = _718;
    if (!_708)
    {
        _666 = _720;
    }
    float _772 = _666;
    float _774 = in.m_69.w;
    float _776 = _772;
    if (!_708)
    {
        _668 = _726;
    }
    float _778 = _668;
    float _780 = fma(_196, _712, _756);
    float _782 = _778;
    if (_708)
    {
        _776 = _726;
    }
    float _784 = _776;
    float _786 = in.m_71.w;
    if (_708)
    {
        _782 = _738;
    }
    float _788 = _782;
    float _790 = fma(_208, _712, _758);
    if (_708)
    {
        _766 = _726;
    }
    float _792 = _766;
    float _794 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _796 = _748 ? as_type<int>(_746) : as_type<int>(_698);
    float _798 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].z, _752);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _802 = _800 != 0;
    float _804 = -_732;
    float _806 = fma(_794, 2.0, _804);
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _810 = _808 != 0;
    float _812 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _814 = in.m_83.x;
    float _816 = in.m_83.y;
    float _818 = in.m_83.z;
    float _820 = in.m_83.w;
    float _822 = _736 ? as_type<float>(_796) : _698;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _826 = _726 > 0.5;
    float _828 = fma(_206, _716, _764);
    float _830 = fma(_812, -2.0, _760);
    int _832 = _826 ? as_type<int>(_746) : as_type<int>(_698);
    float _834 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].w, _824);
    float _836 = fma(_212, _716, _790);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = _802 ? as_type<float>(_832) : _698;
    float _844 = fma(_200, _716, _780);
    bool _846 = _802;
    if (_724)
    {
        bool _848 = _738 > 0.5;
        _846 = _848;
    }
    bool _850 = _846;
    float _852 = _828 + _774;
    float _854 = 1.0 / _840;
    float _856 = _844 + _750;
    float _858 = _836 + _786;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _862 = _856 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _866 = _852 + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _878 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _880;
    float _884 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _886 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _876);
    float _888 = _862 * _862;
    float _890 = 1.0 / _870;
    float _892 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _884);
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _858 + _894;
    float _898 = fma(_866, _866, _888);
    float _900 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].x, _878);
    float _902 = _882 * _854;
    float _904 = in.m_79.x;
    float _906 = fma(_896, _896, _898);
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _910 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _918 = _696 + _916;
    float _920 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _886);
    float _922 = _898;
    float _924 = _872;
    if (_810)
    {
        float _926 = _762 ? _746 : _698;
        _768 = _926;
    }
    float _928 = _768;
    float _930 = _784 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _932 = sqrt(_906);
    float _934 = _914 * _890;
    float _936 = fma(_902, _918, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_85.x = _892;
    out.m_85.y = _920;
    out.m_85.z = _910;
    float _938 = fma(_934, _702, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _940 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _942 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _944 = isnan(_696);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = rsqrt(_906);
    float _956 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _960 = fma(_940, _842, -0.5);
    float _962 = fma(_822, _956, -0.5);
    bool _964 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _966 = isnan(_696);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _798);
    float _978 = _710 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _980 = _932 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _982 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _834);
    float _984 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    float _986 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].w, _958);
    float _988 = _930;
    if (!_724)
    {
        _922 = _904;
    }
    float _990 = _922;
    float _992 = -_974;
    float _994 = _992 + 1.0;
    float _996 = precise::min(_978, _980);
    float _998 = -_984;
    float _1000 = fma(_982, _960, _998);
    bool _1002 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1004 = isnan(_696);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = in.m_87.x;
    float _1016 = in.m_87.y;
    float _1018 = in.m_87.z;
    float _1020 = _990;
    if (!_724)
    {
        _924 = _990;
    }
    float _1022 = _924;
    float _1024 = _954 * _996;
    int _1026 = as_type<int>(_1024);
    float _1028 = _1022;
    float _1030 = _954;
    if (_724)
    {
        _1020 = _904;
    }
    float _1032 = _1020;
    float _1034 = _1012 * _994;
    float _1036 = -_1012;
    float _1038 = _1036 + 1.0;
    float _1040 = _862 * _1024;
    float _1042 = _866 * _1024;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1048 = _952 * _1038;
    float _1050 = -_1040;
    float _1052 = _862 + _1050;
    float _1054 = -_1042;
    float _1056 = _866 + _1054;
    float _1058 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1046);
    float _1060 = _936 * _1048;
    float _1062 = _1052 * _1052;
    float _1064 = _896 * _1024;
    float _1066 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1070 = fma(_1056, _1056, _1062);
    float _1072 = -_1064;
    float _1074 = _896 + _1072;
    float _1076 = -_1044;
    float _1078 = fma(_1066, 2.0, _1076);
    float _1080 = in.m_89.x;
    float _1082 = in.m_89.y;
    float _1084 = in.m_89.z;
    bool _1086 = _1016 != 0.0;
    bool _1088 = isnan(_1016);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = fma(_1074, _1074, _1070);
    int _1098 = as_type<int>(_1066);
    int _1100 = as_type<int>(_1068);
    float _1102 = _1058;
    if (_724)
    {
        float _1104 = -_1032;
        float _1106 = _1104 + 1.0;
        _1098 = as_type<int>(_1106);
    }
    int _1108 = _1098;
    float _1110 = fma(_930, -2.0, _1068);
    bool _1112 = _1014 == 0.0;
    bool _1114 = !_1094;
    bool _1116 = _1112 && _1114;
    float _1118 = sqrt(_1096);
    float _1120 = as_type<float>(_1108);
    if (_730)
    {
        float _1122 = -_1032;
        float _1124 = _1122 + 1.0;
        _1100 = as_type<int>(_1124);
    }
    int _1126 = _1100;
    if (_742)
    {
        float _1128 = -_1032;
        float _1130 = _1128 + 1.0;
        _1026 = as_type<int>(_1130);
    }
    int _1132 = _1026;
    bool _1134 = _1018 == 0.0;
    bool _1136 = _1134 && _1116;
    float _1138 = -_952;
    float _1140 = _1138 + 1.0;
    if (_724)
    {
        float _1142 = _850 ? as_type<float>(_1108) : _1032;
        _1028 = _1142;
    }
    float _1144 = _1028;
    float _1146 = -_168;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    if (!_730)
    {
        _988 = _1032;
    }
    float _1150 = _988;
    float _1152 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1060);
    float _1154 = _1150;
    if (!_742)
    {
        _1120 = _1032;
    }
    float _1156 = _1120;
    float _1158 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1058);
    float _1160 = _1156;
    if (_730)
    {
        float _1162 = _762 ? as_type<float>(_1126) : _1032;
        _1154 = _1162;
    }
    float _1164 = _1154;
    float _1166 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _986);
    if (_742)
    {
        float _1168 = _826 ? as_type<float>(_1132) : _1032;
        _1160 = _1168;
    }
    float _1170 = _1160;
    float _1172 = -_168;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1078);
    float _1176 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1110);
    float _1178 = _954 * _1118;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_1136)
    {
        _1030 = _1080;
    }
    float _1182 = _1030;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1016);
    float _1188 = _1180 * _1178;
    float _1190 = _1182;
    float _1192 = _1188;
    if (_1136)
    {
        _522 = _1182;
    }
    float _1194 = _522;
    float _1196 = _718 * _1178;
    float _1198 = _1194;
    if (!_1136)
    {
        _1190 = _1080;
    }
    float _1200 = _1190;
    float _1202 = _710 * _1178;
    float _1204 = _1188 * _1186;
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1014);
    if (_1136)
    {
        _1102 = _1082;
    }
    float _1208 = _1102;
    float _1210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1018);
    float _1212 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1214 = _1202 * _1206;
    float _1216 = _1208;
    if (_1136)
    {
        _770 = _1208;
    }
    float _1218 = _770;
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1218;
    if (!_1136)
    {
        _1216 = _1082;
    }
    float _1224 = _1216;
    float _1226 = _1196 * _1210;
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1212);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1234 = _1228;
    if (_1136)
    {
        _1192 = _1084;
    }
    float _1236 = _1192;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1240 = fma(_938, _1034, _1152);
    float _1242 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1232);
    float _1244 = _1236;
    if (_1136)
    {
        _1234 = _1236;
    }
    float _1246 = _1234;
    float _1248 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1250 = _1246;
    if (!_1136)
    {
        _1244 = _1084;
    }
    float _1252 = _1244;
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1256 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1258 = _858 + _1248;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = _852 + _1254;
    float _1264 = -_1176;
    float _1266 = fma(_1166, _962, _1264);
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1270 = _1258 + _1268;
    float _1272 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_1256, _1144, -0.5);
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1262 + _1276;
    float _1280 = _1270 * _1270;
    float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1284 = fma(_1272, _1164, -0.5);
    float _1286 = _1262;
    if (!_1136)
    {
        float _1288 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1252);
        _1250 = _1288;
    }
    float _1290 = _1250;
    float _1292 = fma(_1278, _1278, _1280);
    float _1294 = _1290;
    if (!_1136)
    {
        float _1296 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1224);
        _1222 = _1296;
    }
    float _1298 = _1222;
    float _1300 = _928 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1302 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1136)
    {
        float _1304 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1200);
        _1198 = _1304;
    }
    float _1306 = _1198;
    float _1308 = sqrt(_1292);
    float _1310 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1312 = _1302 * _1260;
    float _1314 = _818 * _1200;
    float _1316 = _816 * _1252;
    float _1318 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1320 = _814 * _1224;
    float _1322 = -_1314;
    float _1324 = fma(_814, _1252, _1322);
    float _1326 = _1300 * _1282;
    float _1328 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1318);
    float _1330 = -_1316;
    float _1332 = fma(_818, _1224, _1330);
    float _1334 = -_1320;
    float _1336 = fma(_816, _1200, _1334);
    float _1338 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1240);
    out.m_91.x = _1312;
    out.m_91.y = _1326;
    float _1340 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1342 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1344 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1348 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1350 = _856 + _1340;
    float _1352 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1342);
    float _1354 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1346);
    float _1356 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1348);
    float _1358 = fma(_976, _1274, _1148);
    float _1360 = fma(_1158, _1284, _1174);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1364 = _1346;
    float _1366 = _1306;
    if (!_1344)
    {
        _1364 = _1258;
    }
    float _1368 = _1364;
    float _1370 = _1368;
    if (!_1344)
    {
        _1366 = _1350;
    }
    float _1372 = _1366;
    bool _1374 = !_1344;
    float _1376 = _1372;
    if (!_1374)
    {
        float _1378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1382 = _1308 + _1380;
        float _1384 = _1350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = rsqrt(_1292);
        float _1388 = _1382 * _1378;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1390 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = _1390 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        float _1400 = _1394 + (-1.0);
        float _1402 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1398, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1406 = fma(_1350, _1394, _1402);
        float _1408 = _1386 * _1404;
        float _1410 = fma(_1278, _1408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1412 = fma(_1270, _1408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1376 = _1406;
        _1286 = _1410;
        _1370 = _1412;
    }
    float _1414 = _1376;
    float _1416 = _1286;
    float _1418 = _1370;
    float _1420 = -_1040;
    float _1422 = _1420 + _1414;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1426 = -_1042;
    float _1428 = _1426 + _1416;
    float _1430 = -_1064;
    float _1432 = _1430 + _1418;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1436 = _1422 + _1434;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1428 + _1440;
    float _1444 = _1324 * _820;
    float _1446 = _1436 * _1436;
    float _1448 = _1332 * _820;
    float _1450 = _1336 * _820;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1454 = fma(_1442, _1442, _1446);
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1458 = _1432 + _1456;
    float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1462 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = fma(_1458, _1458, _1454);
    float _1468 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1474 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1460);
    float _1476 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1452);
    float _1478 = sqrt(_1466);
    float _1480 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    float _1482 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1474);
    out.m_93.x = _1464;
    out.m_93.y = _1468;
    out.m_93.z = _1470;
    out.m_93.w = _1472;
    float _1484 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1354);
    float _1486 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1476);
    float _1488 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1480);
    float _1490 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1352);
    float _1492 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1356);
    out.m_95.w = _996;
    float _1494 = -_1042;
    float _1496 = _852 + _1494;
    float _1498 = -_1040;
    float _1500 = _856 + _1498;
    out.m_97.x = _1482;
    out.m_97.y = _1486;
    out.m_97.z = _1488;
    float _1502 = -_1064;
    float _1504 = _858 + _1502;
    bool _1506 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1508 = isnan(_1478);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1514 = _1510 || _1512;
    float _1516 = _1000 + 0.5;
    float _1518 = _1266 + 0.5;
    float _1520 = _1360 + 0.5;
    float _1522 = _1358 + 0.5;
    out.m_99.x = _1202;
    out.m_101.x = _1522;
    out.m_101.y = _1516;
    out.m_101.z = _1520;
    out.m_101.w = _1518;
    out.m_103.x = _1490;
    out.m_103.y = _1484;
    out.m_103.z = _1492;
    float _1524 = _1450;
    if (!_1514)
    {
        _1294 = 1.0;
    }
    float _1526 = _1294;
    bool _1528 = !_1514;
    float _1530 = _1526;
    if (!_1528)
    {
        bool _1532 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1534 = isnan(_1478);
        bool _1536 = _1532 || _1534;
        bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1540 = _1536 || _1538;
        if (!_1540)
        {
            float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1544 = _1478 + _1542;
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1554 = 1.0 / _1548;
            float _1556 = _1544 * _1554;
            float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1530 = _1558;
            _1560 = true;
        }
        else
        {
            bool _1562 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1564 = isnan(_1478);
            bool _1566 = _1562 || _1564;
            bool _1568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1570 = _1566 || _1568;
            if (!_1570)
            {
                float _1572 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1574 = _1478 + _1572;
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1576 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1584 = 1.0 / _1578;
                float _1586 = _1574 * _1584;
                float _1588 = fma(_1586, _1582, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1530 = _1588;
                _1560 = true;
            }
            else
            {
                _1530 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1560 = false;
    float _1590 = _1530;
    float _1592 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1594 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1596 = floor(_1592);
    float _1598 = floor(_1594);
    float _1600 = -_1596;
    float _1602 = _1592 + _1600;
    float _1604 = -_1598;
    float _1606 = _1594 + _1604;
    float2 _5643 = float2(_1602, _1606);
    float _1608 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).x;
    float _1610 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1612 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1616 = _1428 + _1614;
    float _1618 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1610);
    float _1620 = _1500 + _1612;
    float _1622 = fma(_1616, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1624 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1618);
    float _1626 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1628 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1630 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1626);
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1636 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1628);
    float _1638 = 1.0 / _1630;
    float _1640 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1632);
    float _1642 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1634);
    float _1644 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1636);
    float _1646 = -_1496;
    float _1648 = _1646 + _1622;
    float _1650 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1652 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1642);
    float _1654 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1656 = _1650 + _1630;
    float _1658 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1660 = trunc(_1654);
    int _1662 = int(_1660);
    float _1664 = _1656 * _1638;
    float _1666 = _1664 * 0.5;
    float _1668 = trunc(_1658);
    int _1670 = int(_1668);
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1672);
    float _1676 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1678 = _1432 + _1676;
    float _1680 = fma(_1678, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1682 = 1.0 / _1674;
    int _1684 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1686 = _1662 + _1684;
    int _1688 = _1686 + 1;
    float _1690 = -_1504;
    float _1692 = _1690 + _1680;
    int _1694 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1696 = _1670 + _1694;
    int _1698 = _1696 + 1;
    int _1700 = _1698 | _1688;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1704 = _1682 * _1702;
    bool _1706 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1708 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1710 = !_1706;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = 2;
    float _1716 = _1680;
    float _1718 = _1654;
    if (!_1706)
    {
        _1714 = 1;
    }
    int _1720 = _1714;
    int _1722 = _1720;
    if (!_1708)
    {
        _1722 = _1712;
    }
    int _1724 = _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1728 = _1422 + _1726;
    bool _1730 = _1698 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1732 = _1724 << 6;
    float _1734 = fma(_1728, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1736 = _1700 < 0;
    bool _1738 = _1736 || _1730;
    int _1740 = _1732 + 96;
    uint _1743 = uint(int(uint(_1740) >> uint(2)));
    uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
    int _1747 = int(_1743) & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    int _1751 = int(_1743) + 1;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    int _1755 = _1751 & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    float _1759 = -_1500;
    float _1761 = _1759 + _1734;
    bool _1763 = _1688 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1765 = _1763 || _1738;
    float _1767 = _1761 * _1761;
    int _1769 = _1732 + 104;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
    int _1775 = int(_1771) & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    int _1779 = int(_1771) + 1;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    int _1783 = _1779 & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    float _1787 = fma(_1648, _1648, _1767);
    float _1789 = fma(_1692, _1692, _1787);
    int _1791 = _1732 + 64;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
    int _1797 = int(_1793) & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = int(_1793) + 1;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    int _1805 = _1801 & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    float _1809 = sqrt(_1789);
    int _1811 = _1732 + 48;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    uint _1815 = uint(int(uint(int(_1813)) >> uint(2)));
    int _1817 = int(_1813) & 3;
    float _1819 = (*spvDescriptorSet0.vp_c15)._m0[int(_1815)][_1817];
    int _1821 = int(_1813) + 1;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    int _1825 = _1821 & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = _1732 + 72;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    uint _1833 = uint(int(uint(int(_1831)) >> uint(2)));
    int _1835 = int(_1831) & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = int(_1831) + 1;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    int _1843 = _1839 & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    bool _1847 = _1809 > 0.0;
    int _1849 = _1732 + 56;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    int _1867 = _1732 + 80;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    float _1885 = _1620 * _1757;
    float _1887 = fma(_1496, _1749, _1885);
    float _1889 = fma(_1504, _1777, _1887);
    float _1891 = _1887;
    int _1893 = as_type<int>(_1749);
    float _1895 = _1761;
    float _1897 = as_type<float>(_1724);
    if (!_1765)
    {
        float _1899 = floor(_1658);
        _1891 = _1899;
    }
    float _1901 = _1891;
    float _1903 = _1889 + _1785;
    float _1905 = _1620 * _1807;
    uint _1907 = as_type<uint>(_1807);
    if (!_1765)
    {
        int _1909 = _1688 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1911 = _1909 + _1698;
        _1907 = uint(_1911);
    }
    uint _1913 = _1907;
    float _1915 = fma(_1496, _1799, _1905);
    float _1917 = 1.0 / _1903;
    int _1919 = as_type<int>(_1915);
    if (!_1765)
    {
        uint _1921 = uint(int(uint(int(_1913)) >> uint(2)));
        _1893 = int(_1921);
    }
    int _1923 = _1893;
    float _1925 = _1620 * _1827;
    float _1927 = fma(_1496, _1819, _1925);
    float _1929 = _1819;
    float _1931 = _1927;
    if (!_1847)
    {
        _1929 = _1622;
    }
    float _1933 = _1929;
    float _1935 = fma(_1504, _1837, _1915);
    float _1937 = _1933;
    if (!_1765)
    {
        int _1939 = int(_1913) << 2;
        _1919 = _1939;
    }
    int _1941 = _1919;
    int _1943 = _1941;
    if (!_1765)
    {
        int _1945 = 12 & _1941;
        _1943 = _1945;
    }
    int _1947 = _1943;
    float _1949 = fma(_1504, _1857, _1927);
    if (!_1847)
    {
        _1931 = _1734;
    }
    float _1951 = _1931;
    bool _1953 = !_1847;
    float _1955 = _1951;
    float _1957 = _1951;
    if (!_1953)
    {
        float _1959 = _224 * _224;
        float _1961 = rsqrt(_1789);
        float _1963 = fma(_228, _228, _1959);
        float _1965 = fma(_230, _230, _1963);
        float _1967 = sqrt(_1965);
        float _1969 = _1648 * _1961;
        float _1971 = _1761 * _1961;
        float _1973 = _1692 * _1961;
        bool _1975 = _1967 > 0.0;
        float _1977 = _1967;
        _1524 = _1971;
        if (!_1975)
        {
            _1977 = _1622;
        }
        float _1979 = _1977;
        _1937 = _1979;
        if (!_1975)
        {
            _1955 = _1734;
        }
        float _1981 = _1955;
        bool _1983 = !_1975;
        _1957 = _1981;
        if (!_1983)
        {
            float _1985 = rsqrt(_1965);
            float _1987 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1989 = _224 * _1985;
            float _1991 = _228 * _1985;
            float _1993 = _1971 * _1989;
            float _1995 = _230 * _1985;
            float _1997 = fma(_1969, _1991, _1993);
            float _1999 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2001 = fma(_1973, _1995, _1997);
            float _2003 = _2001 * _1999;
            float _2005 = fma(_228, _2003, _1622);
            float _2007 = fma(_224, _2003, _1734);
            float _2009 = fma(_230, _2003, _1680);
            _1957 = _2007;
            _1937 = _2005;
            _1716 = _2009;
        }
    }
    float _2011 = _1957;
    float _2013 = _1937;
    float _2015 = _1716;
    float _2017 = _1524;
    float _2019 = _2017;
    if (!_1765)
    {
        int _2021 = _1923 << 4;
        int _2023 = _2021 + _1947;
        _1895 = as_type<float>(_2023);
    }
    float _2025 = _1895;
    float _2027 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2029 = _1732 + 88;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2051 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2027);
    float _2053 = _1949 + _1865;
    float _2055 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2047);
    float _2057 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2049);
    float _2059 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2051);
    float _2061 = _2025;
    if (!_1765)
    {
        int _2063 = as_type<int>(_2025) + 400;
        uint _2065 = uint(int(uint(_2063) >> uint(2)));
        uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
        int _2069 = int(_2065) & 3;
        float _2071 = (*spvDescriptorSet0.vp_c15)._m0[int(_2067)][_2069];
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _1935 + _1845;
    float _2077 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2079 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2081 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2057);
    float _2083 = _2053 * _1917;
    float _2085 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2087 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2089 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2079);
    float _2091 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2095 = _2083 >= 0.0;
    float _2097 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2099 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2101 = _2075 * _1917;
    float _2103 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2089);
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    bool _2107 = _2083 <= 1.0;
    bool _2109 = _2107 && _2095;
    float _2111 = -_2099;
    float _2113 = fma(_2111, _2097, 1.0);
    float _2115 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2117 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2105);
    bool _2119 = _2101 >= 0.0;
    bool _2121 = _2119 && _2109;
    float _2123 = log2(_2113);
    float _2125 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2127 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    bool _2129 = _2101 <= 1.0;
    bool _2131 = _2129 && _2121;
    float _2133 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2135 = _1620 * _1883;
    float _2137 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2125);
    float _2139 = _2075;
    float _2141 = _2091;
    if (!_1765)
    {
        float _2143 = -_1901;
        float _2145 = _1658 + _2143;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = 1.0 / _2127;
    float _2151 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2133);
    float _2153 = fma(_1496, _1875, _2135);
    float _2155 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2137);
    float _2157 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2151);
    float _2159 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2155);
    float _2161 = _230;
    float _2163 = _2159;
    if (!_1765)
    {
        float _2165 = floor(_1654);
        _2161 = _2165;
    }
    float _2167 = _2161;
    if (_2131)
    {
        float _2169 = float(_1724);
        _1897 = _2169;
    }
    float _2171 = _1897;
    float _2173 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2157);
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = fma(_1504, _2037, _2153);
    float _2179 = _2137;
    float _2181 = _2177;
    float _2183 = _2171;
    if (_2131)
    {
        float _2185 = rint(_2171);
        float _2187 = precise::max(_2185, 0.0);
        uint _2189 = uint(_2187);
        uint _2191 = clamp(_2189, 0u, 65535u);
        _2179 = as_type<float>(_2191);
    }
    float _2193 = _2179;
    float _2195 = _2159 * _2149;
    float _2197 = _2173 * _2149;
    float _2199 = fma(_2195, 0.5, 0.5);
    float _2201 = fma(_2197, -0.5, 0.5);
    float _2203 = _2149;
    if (!_1765)
    {
        float _2205 = rint(_2073);
        float _2207 = precise::max(_2205, 0.0);
        uint _2209 = uint(_2207);
        uint _2211 = clamp(_2209, 0u, 65535u);
        _2203 = as_type<float>(_2211);
    }
    float _2213 = _2203;
    if (!_1765)
    {
        float _2215 = -_2167;
        float _2217 = _1654 + _2215;
        _1718 = _2217;
    }
    float _2219 = _1718;
    float _2221 = _2177 + _2045;
    float _2223 = _2221 * _1917;
    float _2225 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = _2101;
    float _2229 = _2223;
    if (_2131)
    {
        float3 _6704 = float3(_2083, _2101, float(as_type<int>(_2193)));
        float3 _6708 = select(_6704, float3(0.0), isnan(_6704));
        float _2231 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6708.xy, uint(rint(_6708.z)), _2223, level(0.0));
        _2227 = _2231;
    }
    float _2233 = _2227;
    float3 _6718 = float3(_2199, _2201, _2225);
    float _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6718, float3(0.0), isnan(_6718)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6718, float3(0.0), isnan(_6718)), level(0.0)).x;
    float3 _6727 = float3(_2199, _2201, _2225);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6727, float3(0.0), isnan(_6727)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6727, float3(0.0), isnan(_6727)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float _2248 = _2147;
    if (!_1765)
    {
        float3 _6750 = float3(_2147, _2219, float(as_type<int>(_2213)));
        float3 _6752 = select(_6750, float3(0.0), isnan(_6750));
        float _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6752.xy, uint(rint(_6752.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6752.xy, uint(rint(_6752.z)), level(0.0)).x;
        _2248 = _2250;
    }
    float _2252 = _2248;
    if (_1765)
    {
        _2181 = 1.0;
    }
    float _2254 = _2181;
    float _2256 = _2254;
    if (!_1765)
    {
        int _2258 = int(_1913) << 4;
        int _2260 = _2258 + 2048;
        uint _2262 = uint(int(uint(_2260) >> uint(2)));
        uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
        int _2266 = int(_2262) & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        int _2270 = int(_2262) + 1;
        uint _2272 = uint(int(uint(_2270) >> uint(2)));
        int _2274 = _2270 & 3;
        float _2276 = (*spvDescriptorSet0.vp_c15)._m0[int(_2272)][_2274];
        int _2278 = _2260 + 8;
        uint _2280 = uint(int(uint(_2278) >> uint(2)));
        uint _2282 = uint(int(uint(int(_2280)) >> uint(2)));
        int _2284 = int(_2280) & 3;
        float _2286 = (*spvDescriptorSet0.vp_c15)._m0[int(_2282)][_2284];
        int _2288 = int(_2280) + 1;
        uint _2290 = uint(int(uint(_2288) >> uint(2)));
        int _2292 = _2288 & 3;
        float _2294 = (*spvDescriptorSet0.vp_c15)._m0[int(_2290)][_2292];
        float _2296 = _1620 * _2276;
        float _2298 = fma(_1496, _2268, _2296);
        float _2300 = fma(_1504, _2286, _2298);
        float _2302 = _2300 + _2294;
        float _2304 = precise::clamp(_2302, 0.0, 1.0);
        float _2306 = -_2304;
        float _2308 = _2306 + _2252;
        float _2310 = fma(_2308, 500.0, 1.5);
        float _2312 = exp2(_2310);
        float _2314 = 0.0 + _2312;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        _2183 = _2294;
        _2256 = _2316;
    }
    float _2318 = _2183;
    float _2320 = _2256;
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2324 = _2011 + _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2328 = _2013 + _2326;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2015 + _2330;
    float _2334 = _2324 * _2324;
    float _2336 = fma(_2328, _2328, _2334);
    float _2338 = fma(_2332, _2332, _2336);
    float _2340 = rsqrt(_2338);
    float _2342 = sqrt(_2338);
    float _2344 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2346 = _2328 * _2344;
    float _2348 = _2332 * _2344;
    float _2350 = _2346 * _2346;
    float _2352 = _2348 * _2348;
    float _2354 = _2350 + _2352;
    float _2356 = sqrt(_2354);
    bool _2358 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2362 = _2356 + _2360;
    float _2364 = _2332;
    float _2366 = _2354;
    float _2368 = _2362;
    float _2370 = _2318;
    float _2372 = _2324;
    if (_2358)
    {
        float _2374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2374;
    }
    float _2376 = _2364;
    if (_2358)
    {
        float _2378 = rsqrt(_2354);
        _2366 = _2378;
    }
    float _2380 = _2366;
    if (_2358)
    {
        float _2382 = _2362 * _2376;
        _2368 = _2382;
    }
    float _2384 = _2368;
    if (_2358)
    {
        float _2386 = _2384 * 0.15915493667125701904296875;
        _2370 = _2386;
    }
    float _2388 = _2370;
    float _2390 = _2334;
    float _2392 = _2388;
    if (_2358)
    {
        float _2394 = _2388 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        _2390 = _2396;
    }
    float _2398 = _2390;
    float _2400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2402 = precise::max(0.0, _2400);
    float _2404 = _2340;
    float _2406 = _2402;
    float _2408 = _2400;
    if (_2358)
    {
        float _2410 = _2388 * 6.283185482025146484375;
        float _2412 = cos(_2410);
        _2404 = _2412;
    }
    float _2414 = _2404;
    float _2416 = -_2344;
    float _2418 = -_2402;
    float _2420 = fma(_2324, _2416, _2418);
    if (!_2358)
    {
        _2406 = _2346;
    }
    float _2422 = _2406;
    float _2424 = _2422;
    if (_2358)
    {
        float _2426 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2408 = _2426;
    }
    float _2428 = _2408;
    float _2430 = _2398;
    float _2432 = _2428;
    if (_2358)
    {
        float _2434 = fma(_2398, _2428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2430 = _2434;
    }
    float _2436 = _2430;
    float _2438 = _2436;
    if (!_2358)
    {
        _2432 = _2420;
    }
    float _2440 = _2432;
    float _2442 = _2440;
    float _2444 = _2414;
    if (_2358)
    {
        float _2446 = _2414 + (-1.0);
        _2372 = _2446;
    }
    float _2448 = _2372;
    float _2450 = _2448;
    if (_2358)
    {
        float _2452 = _2380 * _2436;
        _2019 = _2452;
    }
    float _2454 = _2019;
    if (!_2358)
    {
        _2438 = _2350;
    }
    float _2456 = _2438;
    float _2458 = _2456;
    if (_2358)
    {
        float _2460 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2460;
    }
    float _2462 = _2392;
    if (_2358)
    {
        float _2464 = _2346 * _2454;
        _2424 = _2464;
    }
    float _2466 = _2424;
    if (!_2358)
    {
        _2450 = _2348;
    }
    float _2468 = _2450;
    float _2470 = _2468;
    if (_2358)
    {
        float _2472 = _2348 * _2454;
        _2470 = _2472;
    }
    float _2474 = _2470;
    if (_2358)
    {
        float _2476 = fma(_2420, _2414, _2462);
        _2442 = _2476;
    }
    float _2478 = _2442;
    if (_2358)
    {
        float _2480 = _2466 * _2466;
        _2458 = _2480;
    }
    float _2482 = _2458;
    if (!_2358)
    {
        _2444 = _2352;
    }
    float _2484 = _2444;
    float _2486 = _2484;
    if (_2358)
    {
        float _2488 = _2474 * _2474;
        _2486 = _2488;
    }
    float _2490 = _2486;
    float _2492 = fma(_2478, _2478, _2482);
    float _2494 = _2492 + _2490;
    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2498 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2496);
    float _2500 = precise::clamp(_2498, 0.0, 1.0);
    float _2502 = rsqrt(_2494);
    float _2504 = -_2500;
    float _2506 = _2504 + 1.0;
    float _2508 = _2502 * _2478;
    float _2510 = _2502 * _2466;
    float _2512 = abs(_2506);
    float _2514 = log2(_2512);
    float _2516 = _2502 * _2474;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2520 = -_2518;
    float _2522 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = -_2516;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2528 = fma(_2526, -0.5, 0.5);
    float _2530 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2532 = fma(_2526, 0.5, 0.5);
    float _2534 = _2508 + 1.0;
    float _2536 = sqrt(_2528);
    float _2538 = fma(_2532, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2532, _2538, -0.212114393711090087890625);
    float _2542 = exp2(_2530);
    float _2544 = fma(_2532, _2540, 1.570728778839111328125);
    float _2546 = _2536 * 0.636619746685028076171875;
    float _2548 = -_2544;
    float _2550 = fma(_2546, _2548, 1.0);
    float _2552 = -_2508;
    float _2554 = fma(_2542, _2534, _2552);
    float _2556 = fma(_2554, 0.5, 0.5);
    float2 _7227 = float2(_2550, _2556);
    float3 _2560 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7227, float2(0.0), isnan(_7227)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7227, float2(0.0), isnan(_7227)), level(0.0)).xyz;
    float _2562 = _2560.x;
    float _2564 = _2560.y;
    float _2566 = _2560.z;
    float _2568 = abs(_1704);
    float _2570 = log2(_2568);
    float _2572 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2574 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2576 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.5);
    bool _2584 = _2580 || _2582;
    float _2586 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2588 = -_1608;
    float _2590 = _2588 + 1.0;
    out.m_105.x = _1496;
    out.m_105.y = _1500;
    out.m_105.z = _1504;
    float _2592 = exp2(_2574);
    float _2594 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2586);
    float _2596 = _2127 * 0.5;
    out.m_107.x = _2013;
    out.m_107.y = _2011;
    out.m_107.z = _2015;
    float _2598 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2594);
    float _2600 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2602 = _2594;
    float _2604 = _2536;
    if (!_2584)
    {
        float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2608 = _1704 + _2606;
        _2602 = _2608;
    }
    float _2610 = _2602;
    if (!_2584)
    {
        _2604 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2612 = _2604;
    out.gl_Position.x = _2159;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2598;
    out.gl_Position.w = _2127;
    bool _2614 = _1704 <= 8000.0;
    bool _2616 = isnan(_1704);
    bool _2618 = _2614 || _2616;
    bool _2620 = isnan(8000.0);
    bool _2622 = _2618 || _2620;
    float _2624 = float(_2622);
    float _2626 = exp2(_2600);
    float _2628 = _2624;
    if (_2584)
    {
        _2141 = 1.0;
    }
    float _2630 = _2141;
    float _2632 = -_2592;
    float _2634 = _2632 + 1.0;
    float _2636 = fma(_2626, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2626;
    float _2642 = _2630;
    if (!_2584)
    {
        float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2646 = _2612 + _2644;
        _2640 = _2646;
    }
    float _2648 = _2640;
    float _2650 = fma(_2638, -2.0, 3.0);
    float _2652 = _2638 * _2638;
    float _2654 = _2352;
    if (!_2584)
    {
        float _2656 = 1.0 / _2648;
        _2654 = _2656;
    }
    float _2658 = _2654;
    float _2660 = _2652 * _2650;
    float _2662 = -_2660;
    float _2664 = _2662 + 1.0;
    float _2666 = _2159 + _2127;
    float _2668 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2660);
    float _2670 = _2598 + _2127;
    float _2672 = _2666 * 0.5;
    float _2674 = fma(_2173, -0.5, _2596);
    float _2676 = _2624 * _2668;
    if (!_2131)
    {
        _2628 = 1.0;
    }
    float _2678 = _2628;
    float _2680 = _2670 * 0.5;
    float _2682 = _2678;
    if (_2131)
    {
        bool _2684 = _2233 >= _2223;
        bool _2686 = isnan(_2233);
        bool _2688 = _2684 || _2686;
        bool _2690 = isnan(_2223);
        bool _2692 = _2688 || _2690;
        float _2694 = float(_2692);
        _2682 = _2694;
    }
    float _2696 = _2682;
    float _2698 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2700 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2702 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2704 = isnan(_2342);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2710 = _2706 || _2708;
    out.m_109.x = _2672;
    out.m_109.y = _2674;
    out.m_109.z = _2680;
    out.m_109.w = _2127;
    float _2712 = _2590 * _2698;
    float _2714 = precise::clamp(_2712, 0.0, 1.0);
    float _2716 = _2700 * _2235;
    float _2718 = _2696 * _2320;
    float _2720 = -_2700;
    float _2722 = _2720 + 1.0;
    float _2724 = -_2714;
    float _2726 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2728 = _2718;
    float _2730 = _2722;
    float _2732 = _2714;
    if (!_2584)
    {
        float _2734 = _2610 * _2658;
        float _2736 = precise::clamp(_2734, 0.0, 1.0);
        _2642 = _2736;
    }
    float _2738 = _2642;
    float _2740 = -_2718;
    float _2742 = fma(_2740, _2726, 1.0);
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = _2744;
    if (!_2710)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2748 = _2728;
    float _2750 = _2744 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2752 = _2246 * _2716;
    float _2754 = _2246 * _2722;
    float _2756 = _2748;
    float _2758 = _2748;
    if (!_2710)
    {
        _2163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2760 = _2163;
    out.m_111.x = _2750;
    float _2762 = _2760;
    float _2764 = _2760;
    if (!_2710)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2766 = _2229;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2710)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2772 = _2730;
    float _2774 = _2772;
    float _2776 = _2772;
    if (!_2710)
    {
        _2732 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2778 = _2732;
    float _2780 = _2778;
    float _2782 = _2778;
    if (!_2710)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2784 = _2746;
    float _2786 = _2566 * _2716;
    float _2788 = fma(_2562, _2752, _2240);
    float _2790 = fma(_2564, _2752, _2242);
    float _2792 = _2738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2794 = fma(_2246, _2786, _2244);
    out.m_113.x = _2788;
    out.m_113.y = _2790;
    out.m_113.z = _2794;
    out.m_113.w = _2754;
    bool _2796 = !_2710;
    float _2798 = _2784;
    float _2800 = _2784;
    if (!_2796)
    {
        bool _2802 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2804 = isnan(_2342);
        bool _2806 = _2802 || _2804;
        bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2810 = _2806 || _2808;
        if (!_2810)
        {
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2814 = _2342 + _2812;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2818 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2816;
            float _2820 = 1.0 / _2818;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2842 = _2814 * _2820;
            float _2844 = precise::clamp(_2842, 0.0, 1.0);
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2850 = fma(_2844, _2824, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2852 = fma(_2844, _2848, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2854 = fma(_2844, _2828, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2856 = fma(_2844, _2832, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2858 = fma(_2844, _2836, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2860 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2764 = _2852;
            _2782 = _2858;
            _2758 = _2850;
            _2776 = _2856;
            _2770 = _2854;
            _2800 = _2860;
            _2862 = true;
        }
        else
        {
            bool _2864 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2866 = isnan(_2342);
            bool _2868 = _2864 || _2866;
            bool _2870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2872 = _2868 || _2870;
            if (!_2872)
            {
                _2756 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2874 = _2756;
            _2758 = _2874;
            if (!_2872)
            {
                _2762 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2876 = _2762;
            _2764 = _2876;
            if (!_2872)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2878 = _2768;
            _2770 = _2878;
            if (!_2872)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2880 = _2774;
            _2776 = _2880;
            if (!_2872)
            {
                _2780 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2882 = _2780;
            _2782 = _2882;
            if (!_2872)
            {
                _2798 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2884 = _2798;
            bool _2886 = !_2872;
            _2800 = _2884;
            if (!_2886)
            {
                bool _2888 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2890 = isnan(_2342);
                bool _2892 = _2888 || _2890;
                bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2896 = _2892 || _2894;
                if (!_2896)
                {
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2900 = _2342 + _2898;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2902;
                    float _2906 = 1.0 / _2904;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2928 = _2900 * _2906;
                    float _2930 = precise::clamp(_2928, 0.0, 1.0);
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2936 = fma(_2930, _2910, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2938 = fma(_2930, _2934, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2940 = fma(_2930, _2914, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2942 = fma(_2930, _2918, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2944 = fma(_2930, _2922, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2946 = fma(_2930, _2926, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2764 = _2938;
                    _2782 = _2944;
                    _2758 = _2936;
                    _2776 = _2942;
                    _2770 = _2940;
                    _2800 = _2946;
                    _2862 = true;
                }
                else
                {
                    _2764 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2782 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2758 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2800 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2862 = false;
    float _2948 = _2764;
    float _2950 = _2782;
    float _2952 = _2758;
    float _2954 = _2776;
    float _2956 = _2770;
    float _2958 = _2800;
    float _2960 = fma(_1484, -0.5, 0.5);
    float _2962 = precise::clamp(_2960, 0.0, 1.0);
    float _2964 = -_2948;
    float _2966 = _2964 + _2950;
    float _2968 = _2792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2970 = -_2952;
    float _2972 = _2970 + _2954;
    float _2974 = fma(_2962, _2966, _2948);
    out.m_115.x = 0.0;
    float _2976 = -_2956;
    float _2978 = _2976 + _2958;
    float _2980 = fma(_2962, _2972, _2952);
    float _2982 = _2974 * 0.586610972881317138671875;
    out.m_61.x = _2968;
    bool _2984 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2986 = fma(_2962, _2978, _2956);
    float _2988 = fma(_2980, 0.298911988735198974609375, _2982);
    bool _2990 = _2738 > 0.0;
    bool _2992 = isnan(_2738);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan(0.0);
    bool _2998 = _2994 || _2996;
    float _3000 = fma(_2986, 0.114477999508380889892578125, _2988);
    float _3002 = -_3000;
    float _3004 = _2980 + _3002;
    float _3006 = -_3000;
    float _3008 = _2974 + _3006;
    float _3010 = -_3000;
    float _3012 = _2986 + _3010;
    float _3014 = fma(_3004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    float _3016 = fma(_3008, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    float _3018 = fma(_3012, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    bool _3020 = !_2984;
    if (!_3020)
    {
        float _3022 = -_2011;
        float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3026 = -_2013;
        float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3030 = -_2015;
        float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3034 = _3024 * _3024;
        float _3036 = fma(_3028, _3028, _3034);
        float _3038 = fma(_3032, _3032, _3036);
        float _3040 = sqrt(_3038);
        float _3042 = rsqrt(_3038);
        float _3044 = -_3040;
        float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3048 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = _3028 * _3042;
        float _3054 = _3024 * _3042;
        float _3056 = abs(_3050);
        float _3058 = log2(_3056);
        float _3060 = _3032 * _3042;
        float _3062 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3064 = _1484 * _3054;
        float _3066 = -_3054;
        float _3068 = -_3062;
        float _3070 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3068);
        float _3072 = fma(_1490, _3052, _3064);
        float _3074 = -_3060;
        float _3076 = fma(_3074, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3070);
        float _3078 = fma(_1492, _3060, _3072);
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3084 = _3076 + _3082;
        float _3086 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3088 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        float _3092 = exp2(_3086);
        float _3094 = _3092 * _3090;
        float _3096 = _3080 * _3094;
        float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3100 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3102 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_115.x = _3098;
        out.m_115.y = _3100;
        out.m_115.z = _3102;
    }
    out.m_95.x = _3014;
    out.m_95.y = _3016;
    out.m_95.z = _3018;
    if (_2998)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3104;
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
    bool _2862 = false;
    bool _1560 = false;
    bool _688 = false;
    bool _542 = false;
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
        float _3161 = as_type<float>(_150);
        out.gl_Position.z = _3161;
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
    if (_164)
    {
        float _170 = float(_134);
        _144 = _170;
    }
    float _172 = _144;
    bool _174 = _168 >= _172;
    bool _176 = !_164;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_61.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _152 = as_type<int>(_184);
    }
    int _186 = _152;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3230 = as_type<float>(_186);
        out.gl_Position.z = _3230;
    }
    if (_178)
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
    float _318 = -_314;
    float _320 = _318 + 1.0;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _288;
    float _326 = _264 * _290;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _260 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = 1.0 / _284;
    float _340 = _268 * _316;
    bool _342 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_260);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_352;
    float _356 = _354 + 1.0;
    float _358 = _330 * _324;
    bool _360 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _362 = isnan(_260);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _370 * _356;
    float _374 = _272 * _338;
    float _376 = -_370;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = _302 * _378;
    float _390 = -_302;
    float _392 = _390 + 1.0;
    float _394 = fma(_382, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_386, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _398 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _400 = isnan(_260);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _314 * _392;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = _408 * _320;
    float _426 = fma(_414, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_418, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_422, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _396 * _424;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = _394 * _424;
    float _444 = _336 * _424;
    float _446 = -_408;
    float _448 = _446 + 1.0;
    float _450 = in.m_75.x;
    float _452 = in.m_75.y;
    float _454 = in.m_75.z;
    float _456 = fma(_436, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_440, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _460 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _462 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _464;
    float _468 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _432);
    float _470 = fma(_428, _410, _460);
    float _472 = fma(_426, _410, _462);
    float _474 = fma(_466, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_430, _410, _468);
    float _490 = fma(_478, _358, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _358, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_486, _358, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = fma(_456, _388, _470);
    float _498 = fma(_458, _388, _472);
    float _500 = fma(_474, _388, _488);
    float _502 = fma(_490, _372, _496);
    float _504 = fma(_492, _372, _498);
    float _506 = fma(_494, _372, _500);
    float _508 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].x, _502);
    float _510 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].y, _504);
    float _512 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[147].z, _506);
    float _514 = _508 * _450;
    float _516 = _510 * _452;
    float _518 = _512 * _454;
    bool _520 = !_322;
    float _522 = _516;
    float _540;
    if (!_520)
    {
        float _524 = in.m_73.x;
        float _526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _528 = _524 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _532 = _530 * _526;
        float _534 = floor(_532);
        float _536 = -_534;
        float _538 = _532 + _536;
        _540 = _538;
        _542 = true;
    }
    else
    {
        float _544 = float(_134);
        float _546 = 1.0 / _544;
        float _548 = _168 * _546;
        _540 = _548;
    }
    _542 = false;
    float _550 = _540;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _550 + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _560 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _562 = isnan(_550);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _576 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _578 = isnan(_550);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _588;
    bool _592 = _550 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _594 = isnan(_550);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = 1.0 / _558;
    float _606 = -_570;
    float _608 = _606 + 1.0;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _612 = _586 * _608;
    float _614 = -_586;
    float _616 = _614 + 1.0;
    float _618 = 1.0 / _574;
    float _620 = _590 * _604;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _626 = fma(_620, _554, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _628 = _624 * _618;
    float _630 = _626 * _612;
    float _632 = -_602;
    float _634 = _632 + 1.0;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _638 = _550 + _636;
    float _640 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[115].x, _630);
    float _642 = _570 * _634;
    float _644 = fma(_628, _638, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = fma(_644, _642, _640);
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[117].x, _648);
    float _656 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_77.x = _656;
    out.m_77.y = _658;
    out.m_77.z = _660;
    out.m_77.w = _662;
    bool _664 = !_610;
    float _666 = _660;
    float _668 = _662;
    float _686;
    if (!_664)
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
    float _698 = in.m_79.y;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _702 = _696 + _700;
    float _704 = in.m_73.w;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _708 = _706 != 0;
    float _710 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _712 = in.m_58.x;
    float _714 = in.m_58.y;
    float _716 = in.m_58.z;
    float _718 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _720 = in.m_73.z;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _724 = _722 != 0;
    float _726 = in.m_73.y;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _730 = _728 != 0;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _736 = _734 != 0;
    float _738 = in.m_73.x;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _742 = _740 != 0;
    float _744 = -_698;
    float _746 = _744 + 1.0;
    out.m_81.x = 1.0;
    out.m_81.y = 1.0;
    out.m_81.z = 1.0;
    bool _748 = _704 > 0.5;
    float _750 = in.m_67.w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _754 = _204 * _714;
    float _756 = _198 * _714;
    float _758 = _210 * _714;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _762 = _720 > 0.5;
    float _764 = fma(_202, _712, _754);
    float _766 = _720;
    float _768 = _698;
    float _770 = _718;
    if (!_708)
    {
        _666 = _720;
    }
    float _772 = _666;
    float _774 = in.m_69.w;
    float _776 = _772;
    if (!_708)
    {
        _668 = _726;
    }
    float _778 = _668;
    float _780 = fma(_196, _712, _756);
    float _782 = _778;
    if (_708)
    {
        _776 = _726;
    }
    float _784 = _776;
    float _786 = in.m_71.w;
    if (_708)
    {
        _782 = _738;
    }
    float _788 = _782;
    float _790 = fma(_208, _712, _758);
    if (_708)
    {
        _766 = _726;
    }
    float _792 = _766;
    float _794 = _738 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _796 = _748 ? as_type<int>(_746) : as_type<int>(_698);
    float _798 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[78].z, _752);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _802 = _800 != 0;
    float _804 = -_732;
    float _806 = fma(_794, 2.0, _804);
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _810 = _808 != 0;
    float _812 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _814 = in.m_83.x;
    float _816 = in.m_83.y;
    float _818 = in.m_83.z;
    float _820 = in.m_83.w;
    float _822 = _736 ? as_type<float>(_796) : _698;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _826 = _726 > 0.5;
    float _828 = fma(_206, _716, _764);
    float _830 = fma(_812, -2.0, _760);
    int _832 = _826 ? as_type<int>(_746) : as_type<int>(_698);
    float _834 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].w, _824);
    float _836 = fma(_212, _716, _790);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = _802 ? as_type<float>(_832) : _698;
    float _844 = fma(_200, _716, _780);
    bool _846 = _802;
    if (_724)
    {
        bool _848 = _738 > 0.5;
        _846 = _848;
    }
    bool _850 = _846;
    float _852 = _828 + _774;
    float _854 = 1.0 / _840;
    float _856 = _844 + _750;
    float _858 = _836 + _786;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _862 = _856 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _866 = _852 + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _878 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _880;
    float _884 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _886 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _876);
    float _888 = _862 * _862;
    float _890 = 1.0 / _870;
    float _892 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _884);
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _858 + _894;
    float _898 = fma(_866, _866, _888);
    float _900 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].x, _878);
    float _902 = _882 * _854;
    float _904 = in.m_79.x;
    float _906 = fma(_896, _896, _898);
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _910 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _900);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _918 = _696 + _916;
    float _920 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _886);
    float _922 = _898;
    float _924 = _872;
    if (_810)
    {
        float _926 = _762 ? _746 : _698;
        _768 = _926;
    }
    float _928 = _768;
    float _930 = _784 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _932 = sqrt(_906);
    float _934 = _914 * _890;
    float _936 = fma(_902, _918, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    out.m_85.x = _892;
    out.m_85.y = _920;
    out.m_85.z = _910;
    float _938 = fma(_934, _702, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _940 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _942 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _944 = isnan(_696);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = rsqrt(_906);
    float _956 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _960 = fma(_940, _842, -0.5);
    float _962 = fma(_822, _956, -0.5);
    bool _964 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _966 = isnan(_696);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _798);
    float _978 = _710 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _980 = _932 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _982 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _834);
    float _984 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _830);
    float _986 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].w, _958);
    float _988 = _930;
    if (!_724)
    {
        _922 = _904;
    }
    float _990 = _922;
    float _992 = -_974;
    float _994 = _992 + 1.0;
    float _996 = precise::min(_978, _980);
    float _998 = -_984;
    float _1000 = fma(_982, _960, _998);
    bool _1002 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1004 = isnan(_696);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = in.m_87.x;
    float _1016 = in.m_87.y;
    float _1018 = in.m_87.z;
    float _1020 = _990;
    if (!_724)
    {
        _924 = _990;
    }
    float _1022 = _924;
    float _1024 = _954 * _996;
    int _1026 = as_type<int>(_1024);
    float _1028 = _1022;
    float _1030 = _954;
    if (_724)
    {
        _1020 = _904;
    }
    float _1032 = _1020;
    float _1034 = _1012 * _994;
    float _1036 = -_1012;
    float _1038 = _1036 + 1.0;
    float _1040 = _862 * _1024;
    float _1042 = _866 * _1024;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1048 = _952 * _1038;
    float _1050 = -_1040;
    float _1052 = _862 + _1050;
    float _1054 = -_1042;
    float _1056 = _866 + _1054;
    float _1058 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1046);
    float _1060 = _936 * _1048;
    float _1062 = _1052 * _1052;
    float _1064 = _896 * _1024;
    float _1066 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1070 = fma(_1056, _1056, _1062);
    float _1072 = -_1064;
    float _1074 = _896 + _1072;
    float _1076 = -_1044;
    float _1078 = fma(_1066, 2.0, _1076);
    float _1080 = in.m_89.x;
    float _1082 = in.m_89.y;
    float _1084 = in.m_89.z;
    bool _1086 = _1016 != 0.0;
    bool _1088 = isnan(_1016);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = fma(_1074, _1074, _1070);
    int _1098 = as_type<int>(_1066);
    int _1100 = as_type<int>(_1068);
    float _1102 = _1058;
    if (_724)
    {
        float _1104 = -_1032;
        float _1106 = _1104 + 1.0;
        _1098 = as_type<int>(_1106);
    }
    int _1108 = _1098;
    float _1110 = fma(_930, -2.0, _1068);
    bool _1112 = _1014 == 0.0;
    bool _1114 = !_1094;
    bool _1116 = _1112 && _1114;
    float _1118 = sqrt(_1096);
    float _1120 = as_type<float>(_1108);
    if (_730)
    {
        float _1122 = -_1032;
        float _1124 = _1122 + 1.0;
        _1100 = as_type<int>(_1124);
    }
    int _1126 = _1100;
    if (_742)
    {
        float _1128 = -_1032;
        float _1130 = _1128 + 1.0;
        _1026 = as_type<int>(_1130);
    }
    int _1132 = _1026;
    bool _1134 = _1018 == 0.0;
    bool _1136 = _1134 && _1116;
    float _1138 = -_952;
    float _1140 = _1138 + 1.0;
    if (_724)
    {
        float _1142 = _850 ? as_type<float>(_1108) : _1032;
        _1028 = _1142;
    }
    float _1144 = _1028;
    float _1146 = -_168;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[76].x, _806);
    if (!_730)
    {
        _988 = _1032;
    }
    float _1150 = _988;
    float _1152 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1060);
    float _1154 = _1150;
    if (!_742)
    {
        _1120 = _1032;
    }
    float _1156 = _1120;
    float _1158 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1058);
    float _1160 = _1156;
    if (_730)
    {
        float _1162 = _762 ? as_type<float>(_1126) : _1032;
        _1154 = _1162;
    }
    float _1164 = _1154;
    float _1166 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _986);
    if (_742)
    {
        float _1168 = _826 ? as_type<float>(_1132) : _1032;
        _1160 = _1168;
    }
    float _1170 = _1160;
    float _1172 = -_168;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1078);
    float _1176 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1110);
    float _1178 = _954 * _1118;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_1136)
    {
        _1030 = _1080;
    }
    float _1182 = _1030;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1016);
    float _1188 = _1180 * _1178;
    float _1190 = _1182;
    float _1192 = _1188;
    if (_1136)
    {
        _522 = _1182;
    }
    float _1194 = _522;
    float _1196 = _718 * _1178;
    float _1198 = _1194;
    if (!_1136)
    {
        _1190 = _1080;
    }
    float _1200 = _1190;
    float _1202 = _710 * _1178;
    float _1204 = _1188 * _1186;
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1014);
    if (_1136)
    {
        _1102 = _1082;
    }
    float _1208 = _1102;
    float _1210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1018);
    float _1212 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1214 = _1202 * _1206;
    float _1216 = _1208;
    if (_1136)
    {
        _770 = _1208;
    }
    float _1218 = _770;
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1218;
    if (!_1136)
    {
        _1216 = _1082;
    }
    float _1224 = _1216;
    float _1226 = _1196 * _1210;
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1212);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1232 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1234 = _1228;
    if (_1136)
    {
        _1192 = _1084;
    }
    float _1236 = _1192;
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1240 = fma(_938, _1034, _1152);
    float _1242 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1232);
    float _1244 = _1236;
    if (_1136)
    {
        _1234 = _1236;
    }
    float _1246 = _1234;
    float _1248 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1250 = _1246;
    if (!_1136)
    {
        _1244 = _1084;
    }
    float _1252 = _1244;
    float _1254 = _1242 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1256 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1258 = _858 + _1248;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = _852 + _1254;
    float _1264 = -_1176;
    float _1266 = fma(_1166, _962, _1264);
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1270 = _1258 + _1268;
    float _1272 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1274 = fma(_1256, _1144, -0.5);
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1262 + _1276;
    float _1280 = _1270 * _1270;
    float _1282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1284 = fma(_1272, _1164, -0.5);
    float _1286 = _1262;
    if (!_1136)
    {
        float _1288 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1252);
        _1250 = _1288;
    }
    float _1290 = _1250;
    float _1292 = fma(_1278, _1278, _1280);
    float _1294 = _1290;
    if (!_1136)
    {
        float _1296 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1224);
        _1222 = _1296;
    }
    float _1298 = _1222;
    float _1300 = _928 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1302 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1136)
    {
        float _1304 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1200);
        _1198 = _1304;
    }
    float _1306 = _1198;
    float _1308 = sqrt(_1292);
    float _1310 = _1204 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1312 = _1302 * _1260;
    float _1314 = _818 * _1200;
    float _1316 = _816 * _1252;
    float _1318 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1320 = _814 * _1224;
    float _1322 = -_1314;
    float _1324 = fma(_814, _1252, _1322);
    float _1326 = _1300 * _1282;
    float _1328 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1318);
    float _1330 = -_1316;
    float _1332 = fma(_818, _1224, _1330);
    float _1334 = -_1320;
    float _1336 = fma(_816, _1200, _1334);
    float _1338 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1240);
    out.m_91.x = _1312;
    out.m_91.y = _1326;
    float _1340 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1342 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1344 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1346 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1348 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1350 = _856 + _1340;
    float _1352 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1342);
    float _1354 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1346);
    float _1356 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1348);
    float _1358 = fma(_976, _1274, _1148);
    float _1360 = fma(_1158, _1284, _1174);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1364 = _1346;
    float _1366 = _1306;
    if (!_1344)
    {
        _1364 = _1258;
    }
    float _1368 = _1364;
    float _1370 = _1368;
    if (!_1344)
    {
        _1366 = _1350;
    }
    float _1372 = _1366;
    bool _1374 = !_1344;
    float _1376 = _1372;
    if (!_1374)
    {
        float _1378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1382 = _1308 + _1380;
        float _1384 = _1350 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = rsqrt(_1292);
        float _1388 = _1382 * _1378;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = _1390 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = _1390 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        float _1400 = _1394 + (-1.0);
        float _1402 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1398, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1406 = fma(_1350, _1394, _1402);
        float _1408 = _1386 * _1404;
        float _1410 = fma(_1278, _1408, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1412 = fma(_1270, _1408, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1376 = _1406;
        _1286 = _1410;
        _1370 = _1412;
    }
    float _1414 = _1376;
    float _1416 = _1286;
    float _1418 = _1370;
    float _1420 = -_1040;
    float _1422 = _1420 + _1414;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1426 = -_1042;
    float _1428 = _1426 + _1416;
    float _1430 = -_1064;
    float _1432 = _1430 + _1418;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1436 = _1422 + _1434;
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _1428 + _1440;
    float _1444 = _1324 * _820;
    float _1446 = _1436 * _1436;
    float _1448 = _1332 * _820;
    float _1450 = _1336 * _820;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1454 = fma(_1442, _1442, _1446);
    float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1458 = _1432 + _1456;
    float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1462 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1466 = fma(_1458, _1458, _1454);
    float _1468 = _1424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1474 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1460);
    float _1476 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1452);
    float _1478 = sqrt(_1466);
    float _1480 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    float _1482 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1474);
    out.m_93.x = _1464;
    out.m_93.y = _1468;
    out.m_93.z = _1470;
    out.m_93.w = _1472;
    float _1484 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1354);
    float _1486 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1476);
    float _1488 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1480);
    float _1490 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1352);
    float _1492 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1356);
    out.m_95.w = _996;
    float _1494 = -_1042;
    float _1496 = _852 + _1494;
    float _1498 = -_1040;
    float _1500 = _856 + _1498;
    out.m_97.x = _1482;
    out.m_97.y = _1486;
    out.m_97.z = _1488;
    float _1502 = -_1064;
    float _1504 = _858 + _1502;
    bool _1506 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1508 = isnan(_1478);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1514 = _1510 || _1512;
    float _1516 = _1000 + 0.5;
    float _1518 = _1266 + 0.5;
    float _1520 = _1360 + 0.5;
    float _1522 = _1358 + 0.5;
    out.m_99.x = _1202;
    out.m_101.x = _1522;
    out.m_101.y = _1516;
    out.m_101.z = _1520;
    out.m_101.w = _1518;
    out.m_103.x = _1490;
    out.m_103.y = _1484;
    out.m_103.z = _1492;
    float _1524 = _1450;
    if (!_1514)
    {
        _1294 = 1.0;
    }
    float _1526 = _1294;
    bool _1528 = !_1514;
    float _1530 = _1526;
    if (!_1528)
    {
        bool _1532 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1534 = isnan(_1478);
        bool _1536 = _1532 || _1534;
        bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1540 = _1536 || _1538;
        if (!_1540)
        {
            float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1544 = _1478 + _1542;
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1554 = 1.0 / _1548;
            float _1556 = _1544 * _1554;
            float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1530 = _1558;
            _1560 = true;
        }
        else
        {
            bool _1562 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1564 = isnan(_1478);
            bool _1566 = _1562 || _1564;
            bool _1568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1570 = _1566 || _1568;
            if (!_1570)
            {
                float _1572 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1574 = _1478 + _1572;
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1576 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1584 = 1.0 / _1578;
                float _1586 = _1574 * _1584;
                float _1588 = fma(_1586, _1582, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1530 = _1588;
                _1560 = true;
            }
            else
            {
                _1530 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1560 = false;
    float _1590 = _1530;
    float _1592 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1594 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1596 = floor(_1592);
    float _1598 = floor(_1594);
    float _1600 = -_1596;
    float _1602 = _1592 + _1600;
    float _1604 = -_1598;
    float _1606 = _1594 + _1604;
    float2 _5643 = float2(_1602, _1606);
    float _1608 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5643, float2(0.0), isnan(_5643)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5643, float2(0.0), isnan(_5643)), level(0.0)).x;
    float _1610 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1612 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1616 = _1428 + _1614;
    float _1618 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1610);
    float _1620 = _1500 + _1612;
    float _1622 = fma(_1616, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1624 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1618);
    float _1626 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1628 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1630 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1632 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1626);
    float _1634 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1636 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1628);
    float _1638 = 1.0 / _1630;
    float _1640 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1632);
    float _1642 = fma(_1496, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1634);
    float _1644 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1636);
    float _1646 = -_1496;
    float _1648 = _1646 + _1622;
    float _1650 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1652 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1642);
    float _1654 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1656 = _1650 + _1630;
    float _1658 = _1652 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1660 = trunc(_1654);
    int _1662 = int(_1660);
    float _1664 = _1656 * _1638;
    float _1666 = _1664 * 0.5;
    float _1668 = trunc(_1658);
    int _1670 = int(_1668);
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1674 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1672);
    float _1676 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1678 = _1432 + _1676;
    float _1680 = fma(_1678, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1682 = 1.0 / _1674;
    int _1684 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1686 = _1662 + _1684;
    int _1688 = _1686 + 1;
    float _1690 = -_1504;
    float _1692 = _1690 + _1680;
    int _1694 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1696 = _1670 + _1694;
    int _1698 = _1696 + 1;
    int _1700 = _1698 | _1688;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1704 = _1682 * _1702;
    bool _1706 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1708 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1710 = !_1706;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = 2;
    float _1716 = _1680;
    float _1718 = _1654;
    if (!_1706)
    {
        _1714 = 1;
    }
    int _1720 = _1714;
    int _1722 = _1720;
    if (!_1708)
    {
        _1722 = _1712;
    }
    int _1724 = _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1728 = _1422 + _1726;
    bool _1730 = _1698 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1732 = _1724 << 6;
    float _1734 = fma(_1728, _1590, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1736 = _1700 < 0;
    bool _1738 = _1736 || _1730;
    int _1740 = _1732 + 96;
    uint _1743 = uint(int(uint(_1740) >> uint(2)));
    uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
    int _1747 = int(_1743) & 3;
    float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
    int _1751 = int(_1743) + 1;
    uint _1753 = uint(int(uint(_1751) >> uint(2)));
    int _1755 = _1751 & 3;
    float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
    float _1759 = -_1500;
    float _1761 = _1759 + _1734;
    bool _1763 = _1688 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1765 = _1763 || _1738;
    float _1767 = _1761 * _1761;
    int _1769 = _1732 + 104;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
    int _1775 = int(_1771) & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    int _1779 = int(_1771) + 1;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    int _1783 = _1779 & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    float _1787 = fma(_1648, _1648, _1767);
    float _1789 = fma(_1692, _1692, _1787);
    int _1791 = _1732 + 64;
    uint _1793 = uint(int(uint(_1791) >> uint(2)));
    uint _1795 = uint(int(uint(int(_1793)) >> uint(2)));
    int _1797 = int(_1793) & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    int _1801 = int(_1793) + 1;
    uint _1803 = uint(int(uint(_1801) >> uint(2)));
    int _1805 = _1801 & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    float _1809 = sqrt(_1789);
    int _1811 = _1732 + 48;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    uint _1815 = uint(int(uint(int(_1813)) >> uint(2)));
    int _1817 = int(_1813) & 3;
    float _1819 = (*spvDescriptorSet0.vp_c15)._m0[int(_1815)][_1817];
    int _1821 = int(_1813) + 1;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    int _1825 = _1821 & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = _1732 + 72;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    uint _1833 = uint(int(uint(int(_1831)) >> uint(2)));
    int _1835 = int(_1831) & 3;
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[int(_1833)][_1835];
    int _1839 = int(_1831) + 1;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    int _1843 = _1839 & 3;
    float _1845 = (*spvDescriptorSet0.vp_c15)._m0[int(_1841)][_1843];
    bool _1847 = _1809 > 0.0;
    int _1849 = _1732 + 56;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    int _1867 = _1732 + 80;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.vp_c15)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    float _1885 = _1620 * _1757;
    float _1887 = fma(_1496, _1749, _1885);
    float _1889 = fma(_1504, _1777, _1887);
    float _1891 = _1887;
    int _1893 = as_type<int>(_1749);
    float _1895 = _1761;
    float _1897 = as_type<float>(_1724);
    if (!_1765)
    {
        float _1899 = floor(_1658);
        _1891 = _1899;
    }
    float _1901 = _1891;
    float _1903 = _1889 + _1785;
    float _1905 = _1620 * _1807;
    uint _1907 = as_type<uint>(_1807);
    if (!_1765)
    {
        int _1909 = _1688 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1911 = _1909 + _1698;
        _1907 = uint(_1911);
    }
    uint _1913 = _1907;
    float _1915 = fma(_1496, _1799, _1905);
    float _1917 = 1.0 / _1903;
    int _1919 = as_type<int>(_1915);
    if (!_1765)
    {
        uint _1921 = uint(int(uint(int(_1913)) >> uint(2)));
        _1893 = int(_1921);
    }
    int _1923 = _1893;
    float _1925 = _1620 * _1827;
    float _1927 = fma(_1496, _1819, _1925);
    float _1929 = _1819;
    float _1931 = _1927;
    if (!_1847)
    {
        _1929 = _1622;
    }
    float _1933 = _1929;
    float _1935 = fma(_1504, _1837, _1915);
    float _1937 = _1933;
    if (!_1765)
    {
        int _1939 = int(_1913) << 2;
        _1919 = _1939;
    }
    int _1941 = _1919;
    int _1943 = _1941;
    if (!_1765)
    {
        int _1945 = 12 & _1941;
        _1943 = _1945;
    }
    int _1947 = _1943;
    float _1949 = fma(_1504, _1857, _1927);
    if (!_1847)
    {
        _1931 = _1734;
    }
    float _1951 = _1931;
    bool _1953 = !_1847;
    float _1955 = _1951;
    float _1957 = _1951;
    if (!_1953)
    {
        float _1959 = _224 * _224;
        float _1961 = rsqrt(_1789);
        float _1963 = fma(_228, _228, _1959);
        float _1965 = fma(_230, _230, _1963);
        float _1967 = sqrt(_1965);
        float _1969 = _1648 * _1961;
        float _1971 = _1761 * _1961;
        float _1973 = _1692 * _1961;
        bool _1975 = _1967 > 0.0;
        float _1977 = _1967;
        _1524 = _1971;
        if (!_1975)
        {
            _1977 = _1622;
        }
        float _1979 = _1977;
        _1937 = _1979;
        if (!_1975)
        {
            _1955 = _1734;
        }
        float _1981 = _1955;
        bool _1983 = !_1975;
        _1957 = _1981;
        if (!_1983)
        {
            float _1985 = rsqrt(_1965);
            float _1987 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1989 = _224 * _1985;
            float _1991 = _228 * _1985;
            float _1993 = _1971 * _1989;
            float _1995 = _230 * _1985;
            float _1997 = fma(_1969, _1991, _1993);
            float _1999 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2001 = fma(_1973, _1995, _1997);
            float _2003 = _2001 * _1999;
            float _2005 = fma(_228, _2003, _1622);
            float _2007 = fma(_224, _2003, _1734);
            float _2009 = fma(_230, _2003, _1680);
            _1957 = _2007;
            _1937 = _2005;
            _1716 = _2009;
        }
    }
    float _2011 = _1957;
    float _2013 = _1937;
    float _2015 = _1716;
    float _2017 = _1524;
    float _2019 = _2017;
    if (!_1765)
    {
        int _2021 = _1923 << 4;
        int _2023 = _2021 + _1947;
        _1895 = as_type<float>(_2023);
    }
    float _2025 = _1895;
    float _2027 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2029 = _1732 + 88;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    float _2047 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2051 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2027);
    float _2053 = _1949 + _1865;
    float _2055 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2047);
    float _2057 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2049);
    float _2059 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2051);
    float _2061 = _2025;
    if (!_1765)
    {
        int _2063 = as_type<int>(_2025) + 400;
        uint _2065 = uint(int(uint(_2063) >> uint(2)));
        uint _2067 = uint(int(uint(int(_2065)) >> uint(2)));
        int _2069 = int(_2065) & 3;
        float _2071 = (*spvDescriptorSet0.vp_c15)._m0[int(_2067)][_2069];
        _2061 = _2071;
    }
    float _2073 = _2061;
    float _2075 = _1935 + _1845;
    float _2077 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2079 = _2011 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2081 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2057);
    float _2083 = _2053 * _1917;
    float _2085 = _2059 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2087 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2089 = fma(_2013, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2079);
    float _2091 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2093 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2095 = _2083 >= 0.0;
    float _2097 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2099 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2101 = _2075 * _1917;
    float _2103 = fma(_2015, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2089);
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    bool _2107 = _2083 <= 1.0;
    bool _2109 = _2107 && _2095;
    float _2111 = -_2099;
    float _2113 = fma(_2111, _2097, 1.0);
    float _2115 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2117 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2105);
    bool _2119 = _2101 >= 0.0;
    bool _2121 = _2119 && _2109;
    float _2123 = log2(_2113);
    float _2125 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2127 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    bool _2129 = _2101 <= 1.0;
    bool _2131 = _2129 && _2121;
    float _2133 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2135 = _1620 * _1883;
    float _2137 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2125);
    float _2139 = _2075;
    float _2141 = _2091;
    if (!_1765)
    {
        float _2143 = -_1901;
        float _2145 = _1658 + _2143;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = 1.0 / _2127;
    float _2151 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2133);
    float _2153 = fma(_1496, _1875, _2135);
    float _2155 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2137);
    float _2157 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2151);
    float _2159 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2155);
    float _2161 = _230;
    float _2163 = _2159;
    if (!_1765)
    {
        float _2165 = floor(_1654);
        _2161 = _2165;
    }
    float _2167 = _2161;
    if (_2131)
    {
        float _2169 = float(_1724);
        _1897 = _2169;
    }
    float _2171 = _1897;
    float _2173 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2157);
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = fma(_1504, _2037, _2153);
    float _2179 = _2137;
    float _2181 = _2177;
    float _2183 = _2171;
    if (_2131)
    {
        float _2185 = rint(_2171);
        float _2187 = precise::max(_2185, 0.0);
        uint _2189 = uint(_2187);
        uint _2191 = clamp(_2189, 0u, 65535u);
        _2179 = as_type<float>(_2191);
    }
    float _2193 = _2179;
    float _2195 = _2159 * _2149;
    float _2197 = _2173 * _2149;
    float _2199 = fma(_2195, 0.5, 0.5);
    float _2201 = fma(_2197, -0.5, 0.5);
    float _2203 = _2149;
    if (!_1765)
    {
        float _2205 = rint(_2073);
        float _2207 = precise::max(_2205, 0.0);
        uint _2209 = uint(_2207);
        uint _2211 = clamp(_2209, 0u, 65535u);
        _2203 = as_type<float>(_2211);
    }
    float _2213 = _2203;
    if (!_1765)
    {
        float _2215 = -_2167;
        float _2217 = _1654 + _2215;
        _1718 = _2217;
    }
    float _2219 = _1718;
    float _2221 = _2177 + _2045;
    float _2223 = _2221 * _1917;
    float _2225 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2227 = _2101;
    float _2229 = _2223;
    if (_2131)
    {
        float3 _6704 = float3(_2083, _2101, float(as_type<int>(_2193)));
        float3 _6708 = select(_6704, float3(0.0), isnan(_6704));
        float _2231 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6708.xy, uint(rint(_6708.z)), _2223, level(0.0));
        _2227 = _2231;
    }
    float _2233 = _2227;
    float3 _6718 = float3(_2199, _2201, _2225);
    float _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6718, float3(0.0), isnan(_6718)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6718, float3(0.0), isnan(_6718)), level(0.0)).x;
    float3 _6727 = float3(_2199, _2201, _2225);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6727, float3(0.0), isnan(_6727)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6727, float3(0.0), isnan(_6727)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float _2248 = _2147;
    if (!_1765)
    {
        float3 _6750 = float3(_2147, _2219, float(as_type<int>(_2213)));
        float3 _6752 = select(_6750, float3(0.0), isnan(_6750));
        float _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6752.xy, uint(rint(_6752.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6752.xy, uint(rint(_6752.z)), level(0.0)).x;
        _2248 = _2250;
    }
    float _2252 = _2248;
    if (_1765)
    {
        _2181 = 1.0;
    }
    float _2254 = _2181;
    float _2256 = _2254;
    if (!_1765)
    {
        int _2258 = int(_1913) << 4;
        int _2260 = _2258 + 2048;
        uint _2262 = uint(int(uint(_2260) >> uint(2)));
        uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
        int _2266 = int(_2262) & 3;
        float _2268 = (*spvDescriptorSet0.vp_c15)._m0[int(_2264)][_2266];
        int _2270 = int(_2262) + 1;
        uint _2272 = uint(int(uint(_2270) >> uint(2)));
        int _2274 = _2270 & 3;
        float _2276 = (*spvDescriptorSet0.vp_c15)._m0[int(_2272)][_2274];
        int _2278 = _2260 + 8;
        uint _2280 = uint(int(uint(_2278) >> uint(2)));
        uint _2282 = uint(int(uint(int(_2280)) >> uint(2)));
        int _2284 = int(_2280) & 3;
        float _2286 = (*spvDescriptorSet0.vp_c15)._m0[int(_2282)][_2284];
        int _2288 = int(_2280) + 1;
        uint _2290 = uint(int(uint(_2288) >> uint(2)));
        int _2292 = _2288 & 3;
        float _2294 = (*spvDescriptorSet0.vp_c15)._m0[int(_2290)][_2292];
        float _2296 = _1620 * _2276;
        float _2298 = fma(_1496, _2268, _2296);
        float _2300 = fma(_1504, _2286, _2298);
        float _2302 = _2300 + _2294;
        float _2304 = precise::clamp(_2302, 0.0, 1.0);
        float _2306 = -_2304;
        float _2308 = _2306 + _2252;
        float _2310 = fma(_2308, 500.0, 1.5);
        float _2312 = exp2(_2310);
        float _2314 = 0.0 + _2312;
        float _2316 = precise::clamp(_2314, 0.0, 1.0);
        _2183 = _2294;
        _2256 = _2316;
    }
    float _2318 = _2183;
    float _2320 = _2256;
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2324 = _2011 + _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2328 = _2013 + _2326;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2015 + _2330;
    float _2334 = _2324 * _2324;
    float _2336 = fma(_2328, _2328, _2334);
    float _2338 = fma(_2332, _2332, _2336);
    float _2340 = rsqrt(_2338);
    float _2342 = sqrt(_2338);
    float _2344 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2346 = _2328 * _2344;
    float _2348 = _2332 * _2344;
    float _2350 = _2346 * _2346;
    float _2352 = _2348 * _2348;
    float _2354 = _2350 + _2352;
    float _2356 = sqrt(_2354);
    bool _2358 = _2356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2362 = _2356 + _2360;
    float _2364 = _2332;
    float _2366 = _2354;
    float _2368 = _2362;
    float _2370 = _2318;
    float _2372 = _2324;
    if (_2358)
    {
        float _2374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2374;
    }
    float _2376 = _2364;
    if (_2358)
    {
        float _2378 = rsqrt(_2354);
        _2366 = _2378;
    }
    float _2380 = _2366;
    if (_2358)
    {
        float _2382 = _2362 * _2376;
        _2368 = _2382;
    }
    float _2384 = _2368;
    if (_2358)
    {
        float _2386 = _2384 * 0.15915493667125701904296875;
        _2370 = _2386;
    }
    float _2388 = _2370;
    float _2390 = _2334;
    float _2392 = _2388;
    if (_2358)
    {
        float _2394 = _2388 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        _2390 = _2396;
    }
    float _2398 = _2390;
    float _2400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2402 = precise::max(0.0, _2400);
    float _2404 = _2340;
    float _2406 = _2402;
    float _2408 = _2400;
    if (_2358)
    {
        float _2410 = _2388 * 6.283185482025146484375;
        float _2412 = cos(_2410);
        _2404 = _2412;
    }
    float _2414 = _2404;
    float _2416 = -_2344;
    float _2418 = -_2402;
    float _2420 = fma(_2324, _2416, _2418);
    if (!_2358)
    {
        _2406 = _2346;
    }
    float _2422 = _2406;
    float _2424 = _2422;
    if (_2358)
    {
        float _2426 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2408 = _2426;
    }
    float _2428 = _2408;
    float _2430 = _2398;
    float _2432 = _2428;
    if (_2358)
    {
        float _2434 = fma(_2398, _2428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2430 = _2434;
    }
    float _2436 = _2430;
    float _2438 = _2436;
    if (!_2358)
    {
        _2432 = _2420;
    }
    float _2440 = _2432;
    float _2442 = _2440;
    float _2444 = _2414;
    if (_2358)
    {
        float _2446 = _2414 + (-1.0);
        _2372 = _2446;
    }
    float _2448 = _2372;
    float _2450 = _2448;
    if (_2358)
    {
        float _2452 = _2380 * _2436;
        _2019 = _2452;
    }
    float _2454 = _2019;
    if (!_2358)
    {
        _2438 = _2350;
    }
    float _2456 = _2438;
    float _2458 = _2456;
    if (_2358)
    {
        float _2460 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2460;
    }
    float _2462 = _2392;
    if (_2358)
    {
        float _2464 = _2346 * _2454;
        _2424 = _2464;
    }
    float _2466 = _2424;
    if (!_2358)
    {
        _2450 = _2348;
    }
    float _2468 = _2450;
    float _2470 = _2468;
    if (_2358)
    {
        float _2472 = _2348 * _2454;
        _2470 = _2472;
    }
    float _2474 = _2470;
    if (_2358)
    {
        float _2476 = fma(_2420, _2414, _2462);
        _2442 = _2476;
    }
    float _2478 = _2442;
    if (_2358)
    {
        float _2480 = _2466 * _2466;
        _2458 = _2480;
    }
    float _2482 = _2458;
    if (!_2358)
    {
        _2444 = _2352;
    }
    float _2484 = _2444;
    float _2486 = _2484;
    if (_2358)
    {
        float _2488 = _2474 * _2474;
        _2486 = _2488;
    }
    float _2490 = _2486;
    float _2492 = fma(_2478, _2478, _2482);
    float _2494 = _2492 + _2490;
    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2498 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2496);
    float _2500 = precise::clamp(_2498, 0.0, 1.0);
    float _2502 = rsqrt(_2494);
    float _2504 = -_2500;
    float _2506 = _2504 + 1.0;
    float _2508 = _2502 * _2478;
    float _2510 = _2502 * _2466;
    float _2512 = abs(_2506);
    float _2514 = log2(_2512);
    float _2516 = _2502 * _2474;
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2520 = -_2518;
    float _2522 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2520);
    float _2524 = -_2516;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2522);
    float _2528 = fma(_2526, -0.5, 0.5);
    float _2530 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2532 = fma(_2526, 0.5, 0.5);
    float _2534 = _2508 + 1.0;
    float _2536 = sqrt(_2528);
    float _2538 = fma(_2532, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2532, _2538, -0.212114393711090087890625);
    float _2542 = exp2(_2530);
    float _2544 = fma(_2532, _2540, 1.570728778839111328125);
    float _2546 = _2536 * 0.636619746685028076171875;
    float _2548 = -_2544;
    float _2550 = fma(_2546, _2548, 1.0);
    float _2552 = -_2508;
    float _2554 = fma(_2542, _2534, _2552);
    float _2556 = fma(_2554, 0.5, 0.5);
    float2 _7227 = float2(_2550, _2556);
    float3 _2560 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7227, float2(0.0), isnan(_7227)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7227, float2(0.0), isnan(_7227)), level(0.0)).xyz;
    float _2562 = _2560.x;
    float _2564 = _2560.y;
    float _2566 = _2560.z;
    float _2568 = abs(_1704);
    float _2570 = log2(_2568);
    float _2572 = _2085 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2574 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2576 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan(0.5);
    bool _2584 = _2580 || _2582;
    float _2586 = fma(_2091, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2572);
    float _2588 = -_1608;
    float _2590 = _2588 + 1.0;
    out.m_105.x = _1496;
    out.m_105.y = _1500;
    out.m_105.z = _1504;
    float _2592 = exp2(_2574);
    float _2594 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2586);
    float _2596 = _2127 * 0.5;
    out.m_107.x = _2013;
    out.m_107.y = _2011;
    out.m_107.z = _2015;
    float _2598 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2594);
    float _2600 = _2570 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2602 = _2594;
    float _2604 = _2536;
    if (!_2584)
    {
        float _2606 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2608 = _1704 + _2606;
        _2602 = _2608;
    }
    float _2610 = _2602;
    if (!_2584)
    {
        _2604 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2612 = _2604;
    out.gl_Position.x = _2159;
    out.gl_Position.y = _2173;
    out.gl_Position.z = _2598;
    out.gl_Position.w = _2127;
    bool _2614 = _1704 <= 8000.0;
    bool _2616 = isnan(_1704);
    bool _2618 = _2614 || _2616;
    bool _2620 = isnan(8000.0);
    bool _2622 = _2618 || _2620;
    float _2624 = float(_2622);
    float _2626 = exp2(_2600);
    float _2628 = _2624;
    if (_2584)
    {
        _2141 = 1.0;
    }
    float _2630 = _2141;
    float _2632 = -_2592;
    float _2634 = _2632 + 1.0;
    float _2636 = fma(_2626, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2626;
    float _2642 = _2630;
    if (!_2584)
    {
        float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2646 = _2612 + _2644;
        _2640 = _2646;
    }
    float _2648 = _2640;
    float _2650 = fma(_2638, -2.0, 3.0);
    float _2652 = _2638 * _2638;
    float _2654 = _2352;
    if (!_2584)
    {
        float _2656 = 1.0 / _2648;
        _2654 = _2656;
    }
    float _2658 = _2654;
    float _2660 = _2652 * _2650;
    float _2662 = -_2660;
    float _2664 = _2662 + 1.0;
    float _2666 = _2159 + _2127;
    float _2668 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2660);
    float _2670 = _2598 + _2127;
    float _2672 = _2666 * 0.5;
    float _2674 = fma(_2173, -0.5, _2596);
    float _2676 = _2624 * _2668;
    if (!_2131)
    {
        _2628 = 1.0;
    }
    float _2678 = _2628;
    float _2680 = _2670 * 0.5;
    float _2682 = _2678;
    if (_2131)
    {
        bool _2684 = _2233 >= _2223;
        bool _2686 = isnan(_2233);
        bool _2688 = _2684 || _2686;
        bool _2690 = isnan(_2223);
        bool _2692 = _2688 || _2690;
        float _2694 = float(_2692);
        _2682 = _2694;
    }
    float _2696 = _2682;
    float _2698 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2700 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2702 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2704 = isnan(_2342);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2710 = _2706 || _2708;
    out.m_109.x = _2672;
    out.m_109.y = _2674;
    out.m_109.z = _2680;
    out.m_109.w = _2127;
    float _2712 = _2590 * _2698;
    float _2714 = precise::clamp(_2712, 0.0, 1.0);
    float _2716 = _2700 * _2235;
    float _2718 = _2696 * _2320;
    float _2720 = -_2700;
    float _2722 = _2720 + 1.0;
    float _2724 = -_2714;
    float _2726 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2728 = _2718;
    float _2730 = _2722;
    float _2732 = _2714;
    if (!_2584)
    {
        float _2734 = _2610 * _2658;
        float _2736 = precise::clamp(_2734, 0.0, 1.0);
        _2642 = _2736;
    }
    float _2738 = _2642;
    float _2740 = -_2718;
    float _2742 = fma(_2740, _2726, 1.0);
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = _2744;
    if (!_2710)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2748 = _2728;
    float _2750 = _2744 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2752 = _2246 * _2716;
    float _2754 = _2246 * _2722;
    float _2756 = _2748;
    float _2758 = _2748;
    if (!_2710)
    {
        _2163 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2760 = _2163;
    out.m_111.x = _2750;
    float _2762 = _2760;
    float _2764 = _2760;
    if (!_2710)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2766 = _2229;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2710)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2772 = _2730;
    float _2774 = _2772;
    float _2776 = _2772;
    if (!_2710)
    {
        _2732 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2778 = _2732;
    float _2780 = _2778;
    float _2782 = _2778;
    if (!_2710)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2784 = _2746;
    float _2786 = _2566 * _2716;
    float _2788 = fma(_2562, _2752, _2240);
    float _2790 = fma(_2564, _2752, _2242);
    float _2792 = _2738 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2794 = fma(_2246, _2786, _2244);
    out.m_113.x = _2788;
    out.m_113.y = _2790;
    out.m_113.z = _2794;
    out.m_113.w = _2754;
    bool _2796 = !_2710;
    float _2798 = _2784;
    float _2800 = _2784;
    if (!_2796)
    {
        bool _2802 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2804 = isnan(_2342);
        bool _2806 = _2802 || _2804;
        bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2810 = _2806 || _2808;
        if (!_2810)
        {
            float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2814 = _2342 + _2812;
            float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2818 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2816;
            float _2820 = 1.0 / _2818;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2842 = _2814 * _2820;
            float _2844 = precise::clamp(_2842, 0.0, 1.0);
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2850 = fma(_2844, _2824, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2852 = fma(_2844, _2848, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2854 = fma(_2844, _2828, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2856 = fma(_2844, _2832, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2858 = fma(_2844, _2836, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2860 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2764 = _2852;
            _2782 = _2858;
            _2758 = _2850;
            _2776 = _2856;
            _2770 = _2854;
            _2800 = _2860;
            _2862 = true;
        }
        else
        {
            bool _2864 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2866 = isnan(_2342);
            bool _2868 = _2864 || _2866;
            bool _2870 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2872 = _2868 || _2870;
            if (!_2872)
            {
                _2756 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2874 = _2756;
            _2758 = _2874;
            if (!_2872)
            {
                _2762 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2876 = _2762;
            _2764 = _2876;
            if (!_2872)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2878 = _2768;
            _2770 = _2878;
            if (!_2872)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2880 = _2774;
            _2776 = _2880;
            if (!_2872)
            {
                _2780 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2882 = _2780;
            _2782 = _2882;
            if (!_2872)
            {
                _2798 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2884 = _2798;
            bool _2886 = !_2872;
            _2800 = _2884;
            if (!_2886)
            {
                bool _2888 = _2342 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2890 = isnan(_2342);
                bool _2892 = _2888 || _2890;
                bool _2894 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2896 = _2892 || _2894;
                if (!_2896)
                {
                    float _2898 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2900 = _2342 + _2898;
                    float _2902 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2902;
                    float _2906 = 1.0 / _2904;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2912 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2920 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2922 = _2920 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2928 = _2900 * _2906;
                    float _2930 = precise::clamp(_2928, 0.0, 1.0);
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2936 = fma(_2930, _2910, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2938 = fma(_2930, _2934, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2940 = fma(_2930, _2914, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2942 = fma(_2930, _2918, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2944 = fma(_2930, _2922, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2946 = fma(_2930, _2926, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2764 = _2938;
                    _2782 = _2944;
                    _2758 = _2936;
                    _2776 = _2942;
                    _2770 = _2940;
                    _2800 = _2946;
                    _2862 = true;
                }
                else
                {
                    _2764 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2782 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2758 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2800 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2862 = false;
    float _2948 = _2764;
    float _2950 = _2782;
    float _2952 = _2758;
    float _2954 = _2776;
    float _2956 = _2770;
    float _2958 = _2800;
    float _2960 = fma(_1484, -0.5, 0.5);
    float _2962 = precise::clamp(_2960, 0.0, 1.0);
    float _2964 = -_2948;
    float _2966 = _2964 + _2950;
    float _2968 = _2792 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2970 = -_2952;
    float _2972 = _2970 + _2954;
    float _2974 = fma(_2962, _2966, _2948);
    out.m_115.x = 0.0;
    float _2976 = -_2956;
    float _2978 = _2976 + _2958;
    float _2980 = fma(_2962, _2972, _2952);
    float _2982 = _2974 * 0.586610972881317138671875;
    out.m_61.x = _2968;
    bool _2984 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2986 = fma(_2962, _2978, _2956);
    float _2988 = fma(_2980, 0.298911988735198974609375, _2982);
    bool _2990 = _2738 > 0.0;
    bool _2992 = isnan(_2738);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan(0.0);
    bool _2998 = _2994 || _2996;
    float _3000 = fma(_2986, 0.114477999508380889892578125, _2988);
    float _3002 = -_3000;
    float _3004 = _2980 + _3002;
    float _3006 = -_3000;
    float _3008 = _2974 + _3006;
    float _3010 = -_3000;
    float _3012 = _2986 + _3010;
    float _3014 = fma(_3004, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    float _3016 = fma(_3008, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    float _3018 = fma(_3012, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3000);
    bool _3020 = !_2984;
    if (!_3020)
    {
        float _3022 = -_2011;
        float _3024 = _3022 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3026 = -_2013;
        float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3030 = -_2015;
        float _3032 = _3030 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3034 = _3024 * _3024;
        float _3036 = fma(_3028, _3028, _3034);
        float _3038 = fma(_3032, _3032, _3036);
        float _3040 = sqrt(_3038);
        float _3042 = rsqrt(_3038);
        float _3044 = -_3040;
        float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3048 = _3046 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3050 = precise::clamp(_3048, 0.0, 1.0);
        float _3052 = _3028 * _3042;
        float _3054 = _3024 * _3042;
        float _3056 = abs(_3050);
        float _3058 = log2(_3056);
        float _3060 = _3032 * _3042;
        float _3062 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3064 = _1484 * _3054;
        float _3066 = -_3054;
        float _3068 = -_3062;
        float _3070 = fma(_3066, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3068);
        float _3072 = fma(_1490, _3052, _3064);
        float _3074 = -_3060;
        float _3076 = fma(_3074, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3070);
        float _3078 = fma(_1492, _3060, _3072);
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3084 = _3076 + _3082;
        float _3086 = _3058 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3088 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3090 = precise::clamp(_3088, 0.0, 1.0);
        float _3092 = exp2(_3086);
        float _3094 = _3092 * _3090;
        float _3096 = _3080 * _3094;
        float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3100 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3102 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_115.x = _3098;
        out.m_115.y = _3100;
        out.m_115.z = _3102;
    }
    out.m_95.x = _3014;
    out.m_95.y = _3016;
    out.m_95.z = _3018;
    if (_2998)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3104 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3104;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

