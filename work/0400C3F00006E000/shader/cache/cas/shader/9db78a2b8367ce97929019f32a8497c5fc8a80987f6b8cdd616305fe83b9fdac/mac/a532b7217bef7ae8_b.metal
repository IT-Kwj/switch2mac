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
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_101 [[user(locn2)]];
    float4 m_111 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_93 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_97 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_109 [[user(locn11)]];
    float4 m_105 [[user(locn12)]];
    float4 m_107 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_73 [[attribute(2)]];
    float4 m_75 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_87 [[attribute(7)]];
    float4 m_85 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
    float4 m_79 [[attribute(10)]];
    float4 m_89 [[attribute(11)]];
    float4 m_81 [[attribute(12)]];
    float4 m_77 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2830 = false;
    bool _1622 = false;
    bool _342 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_58.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (!_134)
    {
        out.m_61.x = 0.0;
    }
    int _140 = 0;
    if (!_134)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3114 = as_type<float>(_144);
        out.gl_Position.z = _3114;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_63.w;
    float _150 = float(_130);
    float _152 = -_148;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_148);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    bool _166 = _154 >= _150;
    bool _168 = !_164;
    bool _170 = _166 || _168;
    float _172 = _148;
    float _174 = _154;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _172;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3179 = as_type<float>(_180);
        out.gl_Position.z = _3179;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = 1.0 / _150;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _154 * _182;
    bool _188 = !_184;
    float _206;
    if (!_188)
    {
        float _190 = in.m_65.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        _206 = _186;
    }
    _208 = false;
    float _210 = _206;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _218 = 1.0 / _214;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _226 = _216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _228 = _220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _210 + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _238 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _242 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_210);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = _236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = _234 * _218;
    out.m_67.x = _226;
    out.m_67.y = _228;
    out.m_67.z = _230;
    float _258 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_210);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -_252;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _290 = _270 * _278;
    float _292 = fma(_274, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_282, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_286, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = -_270;
    float _300 = _298 + 1.0;
    float _302 = _292 * _290;
    float _304 = _294 * _290;
    float _306 = _296 * _290;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _310 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    out.m_69.x = _238;
    out.m_69.y = _254;
    out.m_69.z = _258;
    out.m_69.w = _308;
    float _316 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].y, _312);
    float _318 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].x, _310);
    float _320 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].z, _314);
    bool _322 = !_288;
    float _340;
    if (!_322)
    {
        float _324 = in.m_65.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        _340 = _186;
    }
    _342 = false;
    float _344 = _340;
    float _346 = in.m_65.z;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _350 = _344 + _348;
    float _352 = in.m_65.x;
    float _354 = _186 * _186;
    float _356 = in.m_65.y;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _362 = in.m_71.x;
    float _364 = in.m_71.y;
    float _366 = in.m_71.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _372 = 1.0 / _360;
    float _374 = in.m_73.x;
    float _376 = in.m_73.y;
    float _378 = in.m_73.z;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _388 = in.m_75.x;
    float _390 = in.m_75.y;
    float _392 = in.m_75.z;
    bool _394 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _396 = isnan(_344);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _370;
    float _408 = _346 * 2.0;
    float _410 = in.m_77.x;
    float _412 = in.m_77.y;
    float _414 = in.m_77.z;
    float _416 = in.m_77.w;
    float _418 = _352 * 2.0;
    float _420 = in.m_65.w;
    float _422 = floor(_408);
    float _424 = _356 * 2.0;
    float _426 = in.m_79.x;
    float _428 = in.m_79.y;
    float _430 = in.m_79.z;
    float _432 = _352 + _356;
    float _434 = _432 + (-1.0);
    float _436 = floor(_418);
    bool _438 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _440 = isnan(_344);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    bool _450 = _422 > 0.0;
    float _452 = floor(_424);
    bool _454 = _422 >= 0.0;
    bool _456 = isnan(_422);
    bool _458 = _454 || _456;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    int _464 = _462 ? 0 : 1;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _472 = _470 != 0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _476 = _474 != 0;
    float _478 = 1.0 / _416;
    int _480 = ~_464;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _318 * _426;
    bool _488 = _436 > 0.0;
    float _490 = _316 * _428;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = _320 * _430;
    int _504 = _484;
    int _506 = as_type<int>(_354);
    float _508 = _486;
    if (!_450)
    {
        int _510 = ~_464;
        int _512 = _510 + 1;
        _504 = _512;
    }
    int _514 = _504;
    float _516 = 1.0 / _382;
    float _518 = in.m_58.x;
    float _520 = in.m_58.y;
    float _522 = in.m_58.z;
    int _524 = _500 ? 0 : 1;
    float _526 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _528 = _452 >= 0.0;
    bool _530 = isnan(_452);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    int _538 = ~_524;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    int _544 = _542;
    if (!_488)
    {
        int _546 = ~_524;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = 1.0 / _386;
    int _554 = _536 ? 0 : 1;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _570 = _568 != 0;
    bool _572 = !_468;
    int _574 = _572 ? 0 : 1;
    bool _576 = _420 > 0.5;
    float _578 = _520 * _364;
    float _580 = _520 * _376;
    float _582 = _520 * _390;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _588 = fma(_518, _362, _578);
    float _590 = fma(_518, _388, _582);
    float _592 = fma(_518, _374, _580);
    float _594 = fma(_522, _392, _590);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _600 = fma(_522, _378, _592);
    float _602 = 1.0 / _586;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _612 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[191].x, 1.0);
    float _614 = fma(_522, _366, _588);
    float _616 = _606 * _372;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _618;
    float _622 = 1.0 / _598;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _632 = _626 * _406;
    float _634 = _620 * _552;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _636;
    float _640 = 1.0 / _610;
    bool _642 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _644 = isnan(_344);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = _356 + _346;
    float _656 = _630 * _516;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _662 = _654 + (-1.0);
    bool _664 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _666 = isnan(_344);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = _638 * _622;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _678;
    bool _682 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _684 = isnan(_344);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_616, _350, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _696 = !_472;
    int _698 = _696 ? 0 : 1;
    float _700 = _680 * _602;
    float _702 = -_652;
    float _704 = _702 + 1.0;
    float _706 = -_692;
    float _708 = _706 + 1.0;
    float _710 = _660 * _640;
    float _712 = _352 + _346;
    float _714 = _692 * _704;
    float _716 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _718 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _720 = isnan(_344);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _674 * _708;
    float _732 = -_674;
    float _734 = _732 + 1.0;
    float _736 = _712 + (-1.0);
    bool _738 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _740 = isnan(_344);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_728;
    float _752 = _750 + 1.0;
    float _754 = _728 * _734;
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _758 = _452 > 0.0;
    float _760 = -_748;
    float _762 = _760 + 1.0;
    float _764 = _748 * _752;
    bool _766 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _768 = isnan(_344);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -_448;
    float _780 = _778 + 1.0;
    float _782 = _404 * _762;
    float _784 = -_404;
    float _786 = _784 + 1.0;
    int _788 = abs(_574);
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = in.m_81.x;
    float _796 = _776 * _786;
    float _798 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _800 = _448 * _792;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _804 = _344 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _808 = _344 + _806;
    float _810 = float(_788);
    float _812 = _694 * _800;
    float _814 = fma(_656, _804, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _822 = _344 + _820;
    float _824 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[159].y, _812);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _828 = _344 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _832 = _344 + _830;
    float _834 = fma(_634, _822, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _836 = fma(_814, _796, _824);
    float _838 = fma(_632, _828, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _842 = _344 + _840;
    float _844 = fma(_700, _808, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _846 = fma(_834, _782, _836);
    float _848 = fma(_676, _832, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _850 = fma(_710, _842, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _852 = float(_514);
    float _854 = fma(_838, _764, _846);
    int _856 = abs(_698);
    float _858 = _818 * _154;
    float _860 = in.m_83.x;
    float _862 = in.m_83.y;
    float _864 = in.m_83.z;
    float _866 = fma(_844, _754, _854);
    float _868 = float(_856);
    float _870 = _810 * _852;
    float _872 = float(_550);
    float _874 = exp2(_858);
    float _876 = fma(_850, _730, _866);
    int _878 = ~_554;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _868 * _872;
    float _886 = in.m_81.y;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _890 = 1.0 + _888;
    int _892 = _882;
    bool _894 = _570;
    float _896 = _632;
    float _898 = _814;
    float _900 = _854;
    if (!_758)
    {
        int _902 = ~_554;
        int _904 = _902 + 1;
        _892 = _904;
    }
    int _906 = _892;
    float _908 = _870 * (-2.0);
    bool _910 = !_476;
    int _912 = _910 ? 0 : 1;
    float _914 = 1.0 / _890;
    bool _916 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _918 = isnan(1.0);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _924 = _920 || _922;
    float _926 = fma(_848, _714, _876);
    bool _928 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _936 = _932 || _934;
    float _938 = fma(_798, _908, _798);
    int _940 = abs(_912);
    float _942 = -_874;
    float _944 = _942 + 1.0;
    float _946 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[166].y, _926);
    float _948 = _884 * (-2.0);
    float _950 = fma(_908, _860, _860);
    float _952 = _946 * _154;
    float _954 = _936 ? _944 : 0.0;
    float _956 = fma(_716, _948, _716);
    bool _958 = _936;
    float _960 = _950;
    if (_558)
    {
        bool _962 = _352 > 0.5;
        _958 = _962;
    }
    bool _964 = _958;
    float _966 = _352 + (-0.5);
    float _968 = float(_940);
    if (_924)
    {
        float _970 = _954 * _914;
        _174 = _970;
    }
    float _972 = _174;
    float _974 = float(_906);
    float _976 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _950);
    float _978 = fma(_948, _862, _862);
    float _980 = -_886;
    float _982 = _980 + 1.0;
    bool _984 = _356 > 0.5;
    float _986 = fma(_938, _972, _976);
    float _988 = _356 + (-0.5);
    float _990 = in.m_85.x;
    float _992 = in.m_85.y;
    float _994 = in.m_85.z;
    float _996 = _968 * _974;
    int _998 = _576 ? as_type<int>(_982) : as_type<int>(_886);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1002 = _986 * 0.15915493667125701904296875;
    float _1004 = _996 * (-2.0);
    float _1006 = _566 ? as_type<float>(_998) : _886;
    float _1008 = fma(_956, _972, _1000);
    float _1010 = _886;
    int _1012 = as_type<int>(_982);
    if (_570)
    {
        float _1014 = _984 ? _982 : _886;
        _1010 = _1014;
    }
    float _1016 = _1010;
    float _1018 = fma(_1004, _864, _864);
    if (_562)
    {
        bool _1020 = _346 > 0.5;
        _894 = _1020;
    }
    bool _1022 = _894;
    float _1024 = _346 + (-0.5);
    float _1026 = _1008 * 0.15915493667125701904296875;
    float _1028 = _1026;
    if (_558)
    {
        float _1030 = -_794;
        float _1032 = _1030 + 1.0;
        _1012 = as_type<int>(_1032);
    }
    int _1034 = _1012;
    float _1036 = fma(_756, _1004, _756);
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1018);
    float _1040 = _612 * _952;
    if (!_558)
    {
        _896 = _794;
    }
    float _1042 = _896;
    float _1044 = fma(_1036, _972, _1038);
    float _1046 = _1042;
    if (_558)
    {
        float _1048 = _964 ? as_type<float>(_1034) : _794;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = fma(_410, 2.0, -1.0);
    float _1054 = fma(_412, 2.0, -1.0);
    float _1056 = _1044 * 0.15915493667125701904296875;
    float _1058 = _1002 * 6.283185482025146484375;
    float _1060 = sin(_1058);
    float _1062 = fma(_414, 2.0, -1.0);
    float _1064 = -_1052;
    float _1066 = _1064 + _990;
    float _1068 = fma(_1052, _1040, _990);
    float _1070 = -_1054;
    float _1072 = _1070 + _992;
    float _1074 = fma(_1054, _1040, _992);
    float _1076 = -_1062;
    float _1078 = _1076 + _994;
    float _1080 = -_1066;
    float _1082 = fma(_1080, _354, _1068);
    float _1084 = _1002 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = -_1072;
    float _1090 = fma(_1088, _354, _1074);
    float _1092 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1094 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1096 = _594 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1090);
    bool _1100 = _1090 != 0.0;
    bool _1102 = isnan(_1090);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1026 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1062, _1040, _994);
    float _1116 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1082);
    bool _1118 = _1082 == 0.0;
    bool _1120 = !_1108;
    bool _1122 = _1118 && _1120;
    float _1124 = -_1078;
    float _1126 = fma(_1124, _354, _1114);
    if (_562)
    {
        float _1128 = -_794;
        float _1130 = _1128 + 1.0;
        _506 = as_type<int>(_1130);
    }
    int _1132 = _506;
    float _1134 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = _1026 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    if (!_562)
    {
        _508 = _794;
    }
    float _1140 = _508;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1126);
    float _1144 = _1140;
    if (_562)
    {
        float _1146 = _1022 ? as_type<float>(_1132) : _794;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = _1116 * _1134;
    float _1152 = _1098 * _526;
    float _1154 = _1142 * _1092;
    bool _1156 = _1126 == 0.0;
    bool _1158 = _1156 && _1122;
    float _1160 = _1056 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = _1086 * _1112;
    float _1166 = _1060 * _1112;
    float _1168 = _1056 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = _1086 * _1138;
    float _1174 = _1060 * _1138;
    float _1176 = _1086 * _1162;
    float _1178 = _1138 * _1162;
    float _1180 = _1060 * _1162;
    float _1182 = _1112 * _1162;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1188 = fma(_1170, _1172, _1166);
    float _1190 = fma(_1170, _1166, _1172);
    float _1192 = -_1164;
    float _1194 = fma(_1170, _1174, _1192);
    float _1196 = -_1174;
    float _1198 = fma(_1170, _1164, _1196);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1202 = in.m_87.x;
    float _1204 = in.m_87.y;
    float _1206 = in.m_87.z;
    float _1208 = -_1170;
    float _1210 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1184);
    float _1212 = -_1170;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1186);
    float _1216 = -_1152;
    float _1218 = _1170 * _1216;
    float _1220 = _1176 * _1152;
    float _1222 = -_1170;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1200);
    float _1226 = _1180 * _1152;
    float _1228 = fma(_1178, _1150, _1218);
    float _1230 = fma(_1188, _1150, _1220);
    float _1232 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1234 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1236 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1238 = fma(_1194, _1150, _1226);
    float _1240 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1232);
    float _1242 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1234);
    float _1244 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1246 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1250 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1236);
    float _1252 = fma(_1198, _1154, _1230);
    float _1254 = fma(_1190, _1154, _1238);
    float _1256 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1214);
    float _1258 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1244);
    float _1260 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1262 = _1238;
    float _1264 = _1246;
    if (_1158)
    {
        _960 = _1204;
    }
    float _1266 = _960;
    float _1268 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    float _1270 = fma(_1182, _1154, _1228);
    float _1272 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1274 = _1266;
    if (_1158)
    {
        _1262 = _1266;
    }
    float _1276 = _1262;
    float _1278 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1210);
    float _1280 = _1276;
    if (!_1158)
    {
        _1274 = _1204;
    }
    float _1282 = _1274;
    float _1284 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1286 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1224);
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1272);
    if (_1158)
    {
        _898 = _1202;
    }
    float _1290 = _898;
    float _1292 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1284);
    float _1294 = _1290;
    if (_1158)
    {
        _900 = _1206;
    }
    float _1296 = _900;
    float _1298 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1288);
    float _1300 = _1296;
    if (_1158)
    {
        _1028 = _1290;
    }
    float _1302 = _1028;
    float _1304 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1292);
    float _1306 = _1302;
    if (_1158)
    {
        _1264 = _1296;
    }
    float _1308 = _1264;
    float _1310 = in.m_89.x;
    float _1312 = in.m_89.y;
    float _1314 = in.m_89.z;
    float _1316 = in.m_89.w;
    float _1318 = _1308;
    if (!_1158)
    {
        _1294 = _1202;
    }
    float _1320 = _1294;
    float _1322 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_1158)
    {
        _1300 = _1206;
    }
    float _1324 = _1300;
    float _1326 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1328 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1258);
    float _1330 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1260);
    float _1332 = _1094 + _1322;
    float _1334 = _1096 + _1326;
    float _1336 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1240);
    float _1338 = _1332;
    float _1340 = _1334;
    if (!_1158)
    {
        float _1342 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1320);
        _1306 = _1342;
    }
    float _1344 = _1306;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1348 = _1332 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1352 = _1334 + _1350;
    float _1354 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1268);
    float _1356 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = _1348 * _1348;
    float _1360 = _1352 * _1352;
    float _1362 = _1344;
    float _1364 = _1358;
    float _1366 = _1360;
    float _1368 = _1352;
    if (!_1158)
    {
        float _1370 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1324);
        _1318 = _1370;
    }
    float _1372 = _1318;
    float _1374 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1376 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1242);
    float _1378 = _1358 + _1360;
    float _1380 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1250);
    if (!_1158)
    {
        float _1382 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1280 = _1382;
    }
    float _1384 = _1280;
    float _1386 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1374);
    float _1388 = sqrt(_1378);
    float _1390 = _1278 * _1312;
    float _1392 = _1256 * _1312;
    float _1394 = _1286 * _1312;
    float _1396 = _1314 * _1320;
    float _1398 = fma(_1336, _1310, _1390);
    float _1400 = _1310 * _1282;
    float _1402 = _1312 * _1324;
    float _1404 = fma(_1376, _1310, _1392);
    float _1406 = fma(_1380, _1310, _1394);
    float _1408 = -_1396;
    float _1410 = fma(_1310, _1324, _1408);
    float _1412 = -_1400;
    float _1414 = fma(_1312, _1320, _1412);
    float _1416 = -_1402;
    float _1418 = fma(_1314, _1282, _1416);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1422 = _1410 * _1316;
    float _1424 = _1414 * _1316;
    bool _1426 = _1388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1418 * _1316;
    float _1430 = _600 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1432 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1434 = fma(_1328, _1314, _1398);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1438 = fma(_1330, _1314, _1404);
    float _1440 = fma(_1354, _1314, _1406);
    float _1442 = _1278 * _1384;
    float _1444 = _1256 * _1384;
    float _1446 = _1286 * _1384;
    float _1448 = _1430 + _1432;
    float _1450 = fma(_1336, _1344, _1442);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1454 = fma(_1376, _1344, _1444);
    float _1456 = fma(_1380, _1344, _1446);
    float _1458 = _1454;
    float _1460 = _1394;
    if (!_1426)
    {
        _1362 = _1448;
    }
    float _1462 = _1362;
    bool _1464 = !_1426;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1388 + _1470;
        float _1474 = rsqrt(_1378);
        float _1476 = _1472 * _1468;
        float _1478 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1480 = _1476 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = cos(_1486);
        float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1492 = _1474 * _1490;
        float _1494 = fma(_1348, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1496 = _1488 + (-1.0);
        float _1498 = fma(_1352, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1502 = _1494 + _1500;
        float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1508 = _1498 + _1506;
        float _1510 = _1502 * _1502;
        float _1512 = fma(_1448, _1488, _1504);
        float _1514 = _1508 * _1508;
        _1466 = _1512;
        _1364 = _1510;
        _1366 = _1514;
        _1338 = _1494;
        _1340 = _1498;
    }
    float _1516 = _1466;
    float _1518 = _1364;
    float _1520 = _1366;
    float _1522 = _1338;
    float _1524 = _1340;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1528 = _1516 + _1526;
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1532 = _1422 * _1256;
    float _1534 = _1422 * _1278;
    float _1536 = fma(_1528, _1528, _1518);
    float _1538 = _1422 * _1286;
    float _1540 = fma(_1428, _1376, _1532);
    float _1542 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1544 = _1536 + _1520;
    float _1546 = fma(_1428, _1336, _1534);
    float _1548 = fma(_1428, _1380, _1538);
    float _1550 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1552 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1554 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1556 = sqrt(_1544);
    float _1558 = _1542 * _1420;
    float _1560 = fma(_1328, _1372, _1450);
    float _1562 = fma(_1424, _1328, _1546);
    float _1564 = fma(_1330, _1372, _1454);
    float _1566 = fma(_1424, _1354, _1548);
    float _1568 = _1550 * _1452;
    float _1570 = _1552 * _1436;
    float _1572 = _1554 * _1530;
    float _1574 = fma(_1424, _1330, _1540);
    float _1576 = fma(_1354, _1372, _1456);
    out.m_91.w = _416;
    out.m_93.x = _1558;
    out.m_93.y = _1570;
    out.m_93.z = _1572;
    out.m_93.w = _1568;
    bool _1578 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1580 = isnan(_1556);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1586 = _1582 || _1584;
    out.m_95.x = _1434;
    out.m_95.y = _1438;
    out.m_95.z = _1440;
    out.m_97.x = _1562;
    out.m_97.y = _1574;
    out.m_97.z = _1566;
    out.m_99.x = _1560;
    out.m_99.y = _1564;
    out.m_99.z = _1576;
    if (!_1586)
    {
        _1458 = 1.0;
    }
    float _1588 = _1458;
    bool _1590 = !_1586;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1556);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1556 + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1610 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1608;
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1616 = 1.0 / _1610;
            float _1618 = _1606 * _1616;
            float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1592 = _1620;
            _1622 = true;
        }
        else
        {
            bool _1624 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1556);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1556 + _1634;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1646 = 1.0 / _1640;
                float _1648 = _1636 * _1646;
                float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1592 = _1650;
                _1622 = true;
            }
            else
            {
                _1592 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1622 = false;
    float _1652 = _1592;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1656 = _1522 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1524 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1674 = _1516 + _1672;
    float _1676 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1678 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = fma(_1674, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1682 = _1674;
    float _1684 = _1652;
    float _1686 = _1678;
    if (_1670)
    {
        _1682 = _1676;
    }
    float _1688 = _1682;
    float _1690 = _1688;
    if (_1670)
    {
        _1684 = _1680;
    }
    float _1692 = _1684;
    float _1694 = _1692;
    if (!_1670)
    {
        float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1698 = _1430 + _1696;
        float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1702 = _1094 + _1700;
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1706 = -_1096;
        float _1708 = _1706 + _1678;
        float _1710 = _1698 * _1698;
        float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1714 = _1096 + _1712;
        float _1716 = fma(_1702, _1702, _1710);
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1720 = fma(_1714, _1714, _1716);
        float _1722 = sqrt(_1720);
        float _1724 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1726 = precise::min(_1722, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1728 = _1726 * _1718;
        float _1730 = -_1094;
        float _1732 = _1730 + _1676;
        float _1734 = -_1430;
        float _1736 = _1734 + _1680;
        float _1738 = _1724 * _1728;
        float _1740 = fma(_1732, _1738, _1094);
        float _1742 = fma(_1736, _1738, _1430);
        float _1744 = fma(_1708, _1738, _1096);
        _1694 = _1742;
        _1690 = _1740;
        _1686 = _1744;
    }
    float _1746 = _1694;
    float _1748 = _1690;
    float _1750 = _1686;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1754 = _1746 + _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1758 = _1748 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1762 = _1750 + _1760;
    float _1764 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1766 = _1754 * _1754;
    float _1768 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1764);
    float _1770 = fma(_1758, _1758, _1766);
    float _1772 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1768);
    float _1774 = fma(_1762, _1762, _1770);
    float _1776 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1778 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = rsqrt(_1774);
    float _1782 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1776);
    float _1784 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1782);
    float _1786 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1788 = 1.0 / _1778;
    float _1790 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1792 = _1790 + _1778;
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1796 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1798 = floor(_1786);
    float _1800 = _1758 * _1794;
    float _1802 = _1762 * _1794;
    float _1804 = _1430 + _1796;
    float _1806 = _1800 * _1800;
    float _1808 = _1802 * _1802;
    float _1810 = _1792 * _1788;
    float _1812 = _1810 * 0.5;
    float _1814 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1816 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1818 = _1806 + _1808;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1822 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1820);
    float _1824 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1814);
    float _1826 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1816);
    float _1828 = sqrt(_1818);
    float _1830 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1824);
    float _1832 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1826);
    float _1834 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1836 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1838 = 1.0 / _1822;
    float _1840 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1842 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = trunc(_1834);
    int _1846 = int(_1844);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1850 = _1838 * _1848;
    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = _1828 + _1852;
    float _1856 = trunc(_1836);
    int _1858 = int(_1856);
    bool _1860 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1862 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _1864 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1866 = _1846 + _1864;
    int _1868 = _1866 + 1;
    float _1870 = _1796;
    int _1872 = 2;
    float _1874 = _1854;
    float _1876 = _1818;
    float _1878 = _1800;
    float _1880 = _1802;
    float _1882 = _1806;
    int _1884 = _1868;
    if (_1842)
    {
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1886;
    }
    float _1888 = _1870;
    if (!_1860)
    {
        _1872 = 1;
    }
    int _1890 = _1872;
    float _1892 = floor(_1840);
    int _1894 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1896 = _1858 + _1894;
    int _1898 = _1896 + 1;
    int _1900 = _1890;
    if (_1842)
    {
        float _1902 = _1854 * _1888;
        _1874 = _1902;
    }
    float _1904 = _1874;
    if (_1842)
    {
        float _1906 = rsqrt(_1818);
        _1876 = _1906;
    }
    float _1908 = _1876;
    float _1910 = _1908;
    if (_1842)
    {
        float _1912 = _1904 * 0.15915493667125701904296875;
        _1368 = _1912;
    }
    float _1914 = _1368;
    bool _1916 = !_1860;
    int _1918 = _1916 ? 0 : 1;
    float _1920 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1922 = _1920;
    if (!_1862)
    {
        _1900 = _1918;
    }
    int _1924 = _1900;
    float _1926 = _1830;
    if (_1842)
    {
        float _1928 = _1914 * 6.283185482025146484375;
        float _1930 = sin(_1928);
        _1926 = _1930;
    }
    float _1932 = _1926;
    float _1934 = precise::max(0.0, _1920);
    float _1936 = -_1892;
    float _1938 = _1840 + _1936;
    int _1940 = _1924 << 6;
    float _1942 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1944 = _1868 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1946 = -_1794;
    float _1948 = -_1934;
    float _1950 = fma(_1754, _1946, _1948);
    int _1952 = _1940 + 96;
    uint _1955 = uint(int(uint(_1952) >> uint(2)));
    uint _1957 = uint(int(uint(int(_1955)) >> uint(2)));
    int _1959 = int(_1955) & 3;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[int(_1957)][_1959];
    int _1963 = int(_1955) + 1;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    int _1967 = _1963 & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    int _1971 = _1868 | _1898;
    float _1973 = _1914;
    float _1975 = _1950;
    if (_1842)
    {
        float _1977 = _1914 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        _1973 = _1979;
    }
    float _1981 = _1973;
    if (_1842)
    {
        float _1983 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1922 = _1983;
    }
    float _1985 = _1922;
    float _1987 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1942);
    bool _1989 = _1971 < 0;
    bool _1991 = _1989 || _1944;
    int _1993 = _1940 + 48;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    uint _1997 = uint(int(uint(int(_1995)) >> uint(2)));
    int _1999 = int(_1995) & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    int _2003 = int(_1995) + 1;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    int _2007 = _2003 & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    if (_1842)
    {
        float _2011 = fma(_1932, _1985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1460 = _2011;
    }
    float _2013 = _1460;
    bool _2015 = _1898 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2017 = _2015 || _1991;
    float _2019 = sqrt(_1774);
    float _2021 = 0.0;
    float _2023 = _2013;
    if (_1842)
    {
        float _2025 = _1908 * _2013;
        _2021 = _2025;
    }
    float _2027 = _2021;
    int _2029 = _1940 + 64;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    if (_1842)
    {
        float _2047 = _1800 * _2027;
        _1878 = _2047;
    }
    float _2049 = _1878;
    if (_1842)
    {
        float _2051 = _1981 + (-1.0);
        _1910 = _2051;
    }
    float _2053 = _1910;
    if (_1842)
    {
        float _2055 = _1802 * _2027;
        _1880 = _2055;
    }
    float _2057 = _1880;
    if (_1842)
    {
        float _2059 = _2049 * _2049;
        _1882 = _2059;
    }
    float _2061 = _1882;
    if (_1842)
    {
        float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2063;
    }
    float _2065 = _2023;
    float _2067 = _2065;
    if (!_2017)
    {
        int _2069 = _1898 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2071 = _2069 + _1868;
        _1884 = _2071;
    }
    int _2073 = _1884;
    int _2075 = _1940 + 104;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
    int _2081 = int(_2077) & 3;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
    int _2085 = int(_2077) + 1;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    int _2089 = _2085 & 3;
    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[int(_2087)][_2089];
    int _2093 = as_type<int>(_2053);
    if (!_2017)
    {
        float _2095 = floor(_1836);
        _2093 = as_type<int>(_2095);
    }
    int _2097 = _2093;
    if (_1842)
    {
        float _2099 = fma(_1950, _1981, _2065);
        _1975 = _2099;
    }
    float _2101 = _1975;
    if (!_1842)
    {
        _2067 = _1808;
    }
    float _2103 = _2067;
    float _2105 = _2103;
    if (_1842)
    {
        float _2107 = _2057 * _2057;
        _2105 = _2107;
    }
    float _2109 = _2105;
    float _2111 = -_1798;
    float _2113 = _1786 + _2111;
    float _2115 = fma(_2101, _2101, _2061);
    int _2117 = _1940 + 80;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    uint _2121 = uint(int(uint(int(_2119)) >> uint(2)));
    int _2123 = int(_2119) & 3;
    float _2125 = (*spvDescriptorSet0.vp_c15)._m0[int(_2121)][_2123];
    int _2127 = int(_2119) + 1;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    int _2131 = _2127 & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    float _2135 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1987);
    float _2137 = _2115 + _2109;
    float _2139 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2141 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2143 = _1940 + 72;
    uint _2145 = uint(int(uint(_2143) >> uint(2)));
    uint _2147 = uint(int(uint(int(_2145)) >> uint(2)));
    int _2149 = int(_2145) & 3;
    float _2151 = (*spvDescriptorSet0.vp_c15)._m0[int(_2147)][_2149];
    int _2153 = int(_2145) + 1;
    uint _2155 = uint(int(uint(_2153) >> uint(2)));
    int _2157 = _2153 & 3;
    float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
    float _2161 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2163 = -_2161;
    float _2165 = fma(_2163, _2139, 1.0);
    int _2167 = _1940 + 56;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
    int _2173 = int(_2169) & 3;
    float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
    int _2177 = int(_2169) + 1;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    int _2181 = _2177 & 3;
    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
    float _2185 = _1804 * _1969;
    float _2187 = log2(_2165);
    float _2189 = fma(_1094, _1961, _2185);
    int _2191 = _1940 + 88;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
    int _2197 = int(_2193) & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    int _2201 = int(_2193) + 1;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    int _2205 = _2201 & 3;
    float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
    float _2209 = _1804 * _2009;
    float _2211 = _1961;
    if (!_2017)
    {
        float _2213 = floor(_1834);
        _2211 = _2213;
    }
    float _2215 = _2211;
    float _2217 = fma(_1094, _2001, _2209);
    float _2219 = _1804 * _2045;
    float _2221 = _2045;
    int _2223 = _2097;
    int _2225 = as_type<int>(_2037);
    if (!_2017)
    {
        float _2227 = -as_type<float>(_2097);
        float _2229 = _1836 + _2227;
        _2221 = _2229;
    }
    float _2231 = _2221;
    if (!_2017)
    {
        int _2233 = _2073 << 2;
        _2223 = _2233;
    }
    int _2235 = _2223;
    float _2237 = rsqrt(_2137);
    float _2239 = fma(_1094, _2037, _2219);
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    if (!_2017)
    {
        uint _2247 = uint(int(uint(_2073) >> uint(2)));
        _2225 = int(_2247);
    }
    int _2249 = _2225;
    float _2251 = _2187 * 0.693147182464599609375;
    float _2253 = fma(_1096, _2083, _2189);
    float _2255 = -_2245;
    float _2257 = _2255 + 1.0;
    float2 _6532 = float2(_1938, _2113);
    float _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6532, float2(0.0), isnan(_6532)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6532, float2(0.0), isnan(_6532)), level(0.0)).x;
    float _2261 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2263 = _2253 + _2091;
    float _2265 = _1804 * _2133;
    int _2267 = as_type<int>(_2133);
    float _2269 = _2265;
    if (!_2017)
    {
        int _2271 = 12 & _2235;
        _2267 = _2271;
    }
    int _2273 = _2267;
    float _2275 = 1.0 / _2263;
    float _2277 = _2237 * _2049;
    float _2279 = fma(_1094, _2125, _2265);
    if (!_2017)
    {
        int _2281 = _2249 << 4;
        int _2283 = _2281 + _2273;
        _2269 = as_type<float>(_2283);
    }
    float _2285 = _2269;
    float _2287 = _2237 * _2101;
    float _2289 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2291 = fma(_1096, _2151, _2239);
    float _2293 = _2237 * _2057;
    float _2295 = abs(_2257);
    float _2297 = log2(_2295);
    float _2299 = -_2289;
    float _2301 = fma(_2287, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2299);
    float _2303 = _2285;
    if (!_2017)
    {
        int _2305 = as_type<int>(_2285) + 400;
        uint _2307 = uint(int(uint(_2305) >> uint(2)));
        uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
        int _2311 = int(_2307) & 3;
        float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
        _2303 = _2313;
    }
    float _2315 = _2303;
    float _2317 = -_2293;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2301);
    float _2321 = fma(_1096, _2175, _2217);
    float _2323 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2325 = fma(_2319, -0.5, 0.5);
    float _2327 = _2321 + _2183;
    float _2329 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2323);
    float _2331 = fma(_2319, 0.5, 0.5);
    float _2333 = fma(_1096, _2199, _2279);
    float _2335 = _2291 + _2159;
    float _2337 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2339 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2343 = _2335 * _2275;
    float _2345 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2337);
    float _2347 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2349 = exp2(_2341);
    float _2351 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2329);
    float _2353 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2345);
    float _2355 = _2327 * _2275;
    float _2357 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2347);
    float _2359 = _2333 + _2207;
    float _2361 = _2353 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2363 = _2351 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2365 = _2355 >= 0.0;
    float _2367 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2369 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2371 = fma(_2331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _2373 = _2355 <= 1.0;
    bool _2375 = _2373 && _2365;
    float _2377 = sqrt(_2325);
    float _2379 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2369);
    float _2381 = fma(_2331, _2371, -0.212114393711090087890625);
    bool _2383 = _2343 >= 0.0;
    bool _2385 = _2383 && _2375;
    float _2387 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2389 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2379);
    float _2391 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2393 = _2343 <= 1.0;
    bool _2395 = _2393 && _2385;
    float _2397 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2387);
    float _2399 = _2287 + 1.0;
    float _2401 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2389);
    float _2403 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2391);
    float _2405 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2397);
    float _2407 = -_2287;
    float _2409 = fma(_2349, _2399, _2407);
    float _2411 = 1.0 / _2401;
    float _2413 = fma(_2331, _2381, 1.570728778839111328125);
    float _2415 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2403);
    float _2417 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2405);
    float _2419 = _2377 * 0.636619746685028076171875;
    float _2421 = _2359 * _2275;
    float _2423 = _2381;
    float _2425 = _2415;
    if (_2395)
    {
        float _2427 = float(_1924);
        _2423 = _2427;
    }
    float _2429 = _2423;
    float _2431 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2415);
    float _2433 = _2431;
    if (!_2017)
    {
        float _2435 = -_2215;
        float _2437 = _1834 + _2435;
        _2425 = _2437;
    }
    float _2439 = _2425;
    float _2441 = fma(_2409, 0.5, 0.5);
    float _2443 = -_2413;
    float _2445 = fma(_2419, _2443, 1.0);
    float _2447 = _2315;
    if (!_2017)
    {
        float _2449 = rint(_2315);
        float _2451 = precise::max(_2449, 0.0);
        uint _2453 = uint(_2451);
        uint _2455 = clamp(_2453, 0u, 65535u);
        _2447 = as_type<float>(_2455);
    }
    float _2457 = _2447;
    float _2459 = _2417 * _2411;
    float _2461 = _2431 * _2411;
    float _2463 = _2429;
    if (_2395)
    {
        float _2465 = rint(_2429);
        float _2467 = precise::max(_2465, 0.0);
        uint _2469 = uint(_2467);
        uint _2471 = clamp(_2469, 0u, 65535u);
        _2463 = as_type<float>(_2471);
    }
    float _2473 = _2463;
    float _2475 = fma(_2459, 0.5, 0.5);
    float _2477 = fma(_2461, -0.5, 0.5);
    float _2479 = _2473;
    if (_2395)
    {
        float3 _6911 = float3(_2355, _2343, float(as_type<int>(_2473)));
        float3 _6915 = select(_6911, float3(0.0), isnan(_6911));
        float _2481 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6915.xy, uint(rint(_6915.z)), _2421, level(0.0));
        _2479 = _2481;
    }
    float _2483 = _2479;
    float3 _6925 = float3(_2475, _2477, _2261);
    float _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6925, float3(0.0), isnan(_6925)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6925, float3(0.0), isnan(_6925)), level(0.0)).x;
    float3 _6934 = float3(_2475, _2477, _2261);
    float4 _2488 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).xyzw;
    float _2490 = _2488.x;
    float _2492 = _2488.y;
    float _2494 = _2488.z;
    float _2496 = _2488.w;
    float2 _6950 = float2(_2445, _2441);
    float3 _2500 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6950, float2(0.0), isnan(_6950)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6950, float2(0.0), isnan(_6950)), level(0.0)).xyz;
    float _2502 = _2500.x;
    float _2504 = _2500.y;
    float _2506 = _2500.z;
    float _2508 = _2439;
    if (!_2017)
    {
        float3 _6971 = float3(_2439, _2231, float(as_type<int>(_2457)));
        float3 _6973 = select(_6971, float3(0.0), isnan(_6971));
        float _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6973.xy, uint(rint(_6973.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6973.xy, uint(rint(_6973.z)), level(0.0)).x;
        _2508 = _2510;
    }
    float _2512 = _2508;
    float _2514 = abs(_1850);
    float _2516 = log2(_2514);
    out.m_101.x = _1758;
    out.m_101.y = _1754;
    out.m_101.z = _1762;
    bool _2518 = _1850 <= 8000.0;
    bool _2520 = isnan(_1850);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(8000.0);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2532 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2534 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2536 = exp2(_2530);
    float _2538 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2534);
    float _2540 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2538);
    float _2542 = fma(_2536, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = fma(_2544, -2.0, 3.0);
    float _2548 = _2544 * _2544;
    float _2550 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2552 = _2548 * _2546;
    float _2554 = _2540 + _2401;
    float _2556 = exp2(_2550);
    float _2558 = _2554 * 0.5;
    float _2560 = -_2552;
    float _2562 = _2560 + 1.0;
    out.gl_Position.x = _2417;
    out.gl_Position.y = _2431;
    out.gl_Position.z = _2540;
    out.gl_Position.w = _2401;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2552);
    float _2566 = _2562;
    float _2568 = _2417;
    if (!_2395)
    {
        _2566 = 1.0;
    }
    float _2570 = _2566;
    out.m_103.z = _2558;
    out.m_103.w = _2401;
    float _2572 = _2528 * _2564;
    float _2574 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2576 = -_2556;
    float _2578 = _2576 + 1.0;
    float _2580 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2582 = _2578;
    float _2584 = _2570;
    if (_2017)
    {
        _2582 = 1.0;
    }
    float _2586 = _2582;
    float _2588 = -_2259;
    float _2590 = _2588 + 1.0;
    float _2592 = _2590 * _2574;
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = _2586;
    if (_2395)
    {
        bool _2598 = _2483 >= _2421;
        bool _2600 = isnan(_2483);
        bool _2602 = _2598 || _2600;
        bool _2604 = isnan(_2421);
        bool _2606 = _2602 || _2604;
        float _2608 = float(_2606);
        _2584 = _2608;
    }
    float _2610 = _2584;
    if (!_2017)
    {
        int _2612 = _2073 << 4;
        int _2614 = _2612 + 2048;
        uint _2616 = uint(int(uint(_2614) >> uint(2)));
        uint _2618 = uint(int(uint(int(_2616)) >> uint(2)));
        int _2620 = int(_2616) & 3;
        float _2622 = (*spvDescriptorSet0.vp_c15)._m0[int(_2618)][_2620];
        int _2624 = int(_2616) + 1;
        uint _2626 = uint(int(uint(_2624) >> uint(2)));
        int _2628 = _2624 & 3;
        float _2630 = (*spvDescriptorSet0.vp_c15)._m0[int(_2626)][_2628];
        int _2632 = _2614 + 8;
        uint _2634 = uint(int(uint(_2632) >> uint(2)));
        uint _2636 = uint(int(uint(int(_2634)) >> uint(2)));
        int _2638 = int(_2634) & 3;
        float _2640 = (*spvDescriptorSet0.vp_c15)._m0[int(_2636)][_2638];
        int _2642 = int(_2634) + 1;
        uint _2644 = uint(int(uint(_2642) >> uint(2)));
        int _2646 = _2642 & 3;
        float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
        float _2650 = _1804 * _2630;
        float _2652 = fma(_1094, _2622, _2650);
        float _2654 = fma(_1096, _2640, _2652);
        float _2656 = _2654 + _2648;
        float _2658 = precise::clamp(_2656, 0.0, 1.0);
        float _2660 = -_2658;
        float _2662 = _2660 + _2512;
        float _2664 = fma(_2662, 500.0, 1.5);
        float _2666 = exp2(_2664);
        float _2668 = 0.0 + _2666;
        float _2670 = precise::clamp(_2668, 0.0, 1.0);
        _2596 = _2670;
        _2568 = _2640;
        _2433 = _2648;
    }
    float _2672 = _2596;
    float _2674 = _2568;
    float _2676 = _2433;
    float _2678 = _2610 * _2672;
    float _2680 = _2580 * _2485;
    float _2682 = -_2594;
    float _2684 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2686 = -_2580;
    float _2688 = _2686 + 1.0;
    bool _2690 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2692 = isnan(_2019);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2698 = _2694 || _2696;
    float _2700 = _2496 * _2680;
    float _2702 = -_2678;
    float _2704 = fma(_2702, _2684, 1.0);
    float _2706 = precise::clamp(_2704, 0.0, 1.0);
    float _2708 = _2506 * _2680;
    float _2710 = _2496 * _2688;
    float _2712 = fma(_2502, _2700, _2490);
    float _2714 = fma(_2504, _2700, _2492);
    float _2716 = _2706 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2718 = fma(_2496, _2708, _2494);
    out.m_105.x = _2716;
    float _2720 = _2676;
    float _2722 = _2674;
    float _2724 = _2684;
    float _2726 = _2688;
    float _2728 = _2700;
    float _2730 = _2706;
    if (!_2698)
    {
        _2720 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2732 = _2720;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2698)
    {
        _2722 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2738 = _2722;
    out.m_107.x = _2712;
    out.m_107.y = _2714;
    out.m_107.z = _2718;
    out.m_107.w = _2710;
    float _2740 = _2738;
    float _2742 = _2738;
    if (!_2698)
    {
        _2724 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2744 = _2724;
    float _2746 = _2744;
    float _2748 = _2744;
    if (!_2698)
    {
        _2726 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2750 = _2726;
    float _2752 = _2750;
    float _2754 = _2750;
    if (!_2698)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2756 = _2728;
    float _2758 = _2756;
    float _2760 = _2756;
    if (!_2698)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2762 = _2730;
    bool _2764 = !_2698;
    float _2766 = _2762;
    float _2768 = _2762;
    if (!_2764)
    {
        bool _2770 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2772 = isnan(_2019);
        bool _2774 = _2770 || _2772;
        bool _2776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2778 = _2774 || _2776;
        if (!_2778)
        {
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2782 = _2019 + _2780;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2786 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2784;
            float _2788 = 1.0 / _2786;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2810 = _2782 * _2788;
            float _2812 = precise::clamp(_2810, 0.0, 1.0);
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = fma(_2812, _2792, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2820 = fma(_2812, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2822 = fma(_2812, _2796, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2824 = fma(_2812, _2800, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2826 = fma(_2812, _2804, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2828 = fma(_2812, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2742 = _2820;
            _2760 = _2826;
            _2736 = _2818;
            _2754 = _2824;
            _2748 = _2822;
            _2768 = _2828;
            _2830 = true;
        }
        else
        {
            bool _2832 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2834 = isnan(_2019);
            bool _2836 = _2832 || _2834;
            bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2840 = _2836 || _2838;
            if (!_2840)
            {
                _2734 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2842 = _2734;
            _2736 = _2842;
            if (!_2840)
            {
                _2740 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2844 = _2740;
            _2742 = _2844;
            if (!_2840)
            {
                _2746 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2846 = _2746;
            _2748 = _2846;
            if (!_2840)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2848 = _2752;
            _2754 = _2848;
            if (!_2840)
            {
                _2758 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2850 = _2758;
            _2760 = _2850;
            if (!_2840)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2852 = _2766;
            bool _2854 = !_2840;
            _2768 = _2852;
            if (!_2854)
            {
                bool _2856 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2858 = isnan(_2019);
                bool _2860 = _2856 || _2858;
                bool _2862 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2864 = _2860 || _2862;
                if (!_2864)
                {
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2868 = _2019 + _2866;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2872 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2870;
                    float _2874 = 1.0 / _2872;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2896 = _2868 * _2874;
                    float _2898 = precise::clamp(_2896, 0.0, 1.0);
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = fma(_2898, _2878, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2906 = fma(_2898, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2908 = fma(_2898, _2882, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2910 = fma(_2898, _2886, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2912 = fma(_2898, _2890, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2914 = fma(_2898, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2742 = _2906;
                    _2760 = _2912;
                    _2736 = _2904;
                    _2754 = _2910;
                    _2748 = _2908;
                    _2768 = _2914;
                    _2830 = true;
                }
                else
                {
                    _2742 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2760 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2736 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2748 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2830 = false;
    float _2916 = _2742;
    float _2918 = _2760;
    float _2920 = _2736;
    float _2922 = _2754;
    float _2924 = _2748;
    float _2926 = _2768;
    float _2928 = fma(_1564, -0.5, 0.5);
    float _2930 = precise::clamp(_2928, 0.0, 1.0);
    float _2932 = -_2916;
    float _2934 = _2932 + _2918;
    float _2936 = -_2920;
    float _2938 = _2936 + _2922;
    float _2940 = -_2924;
    float _2942 = _2940 + _2926;
    bool _2944 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2946 = fma(_2930, _2934, _2916);
    float _2948 = fma(_2930, _2938, _2920);
    float _2950 = fma(_2930, _2942, _2924);
    float _2952 = _2946 * 0.586610972881317138671875;
    out.m_109.x = 0.0;
    float _2954 = fma(_2948, 0.298911988735198974609375, _2952);
    float _2956 = fma(_2950, 0.114477999508380889892578125, _2954);
    float _2958 = -_2956;
    float _2960 = _2948 + _2958;
    float _2962 = -_2956;
    float _2964 = _2946 + _2962;
    float _2966 = -_2956;
    float _2968 = _2950 + _2966;
    float _2970 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2972 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2976 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    out.m_61.x = _2970;
    out.m_111.x = _2972;
    out.m_111.y = _2974;
    out.m_111.z = _2976;
    if (!_2944)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2978 = -_1746;
    float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2982 = -_1748;
    float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2986 = -_1750;
    float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2990 = _2980 * _2980;
    float _2992 = fma(_2984, _2984, _2990);
    float _2994 = fma(_2988, _2988, _2992);
    float _2996 = sqrt(_2994);
    float _2998 = rsqrt(_2994);
    float _3000 = -_2996;
    float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3004 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3006 = precise::clamp(_3004, 0.0, 1.0);
    float _3008 = _2984 * _2998;
    float _3010 = _2980 * _2998;
    float _3012 = abs(_3006);
    float _3014 = log2(_3012);
    float _3016 = _2988 * _2998;
    float _3018 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3020 = _1564 * _3010;
    float _3022 = -_3010;
    float _3024 = -_3018;
    float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3024);
    float _3028 = fma(_1560, _3008, _3020);
    float _3030 = -_3016;
    float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3026);
    float _3034 = fma(_1576, _3016, _3028);
    float _3036 = precise::clamp(_3034, 0.0, 1.0);
    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3040 = _3032 + _3038;
    float _3042 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3044 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3046 = precise::clamp(_3044, 0.0, 1.0);
    float _3048 = exp2(_3042);
    float _3050 = _3048 * _3046;
    float _3052 = _3036 * _3050;
    float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3056 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3058 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _3054;
    out.m_109.y = _3056;
    out.m_109.z = _3058;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2830 = false;
    bool _1622 = false;
    bool _342 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_58.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (!_134)
    {
        out.m_61.x = 0.0;
    }
    int _140 = 0;
    if (!_134)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3114 = as_type<float>(_144);
        out.gl_Position.z = _3114;
    }
    if (!_134)
    {
        return out;
    }
    float _148 = in.m_63.w;
    float _150 = float(_130);
    float _152 = -_148;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_148);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    bool _166 = _154 >= _150;
    bool _168 = !_164;
    bool _170 = _166 || _168;
    float _172 = _148;
    float _174 = _154;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _172;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3179 = as_type<float>(_180);
        out.gl_Position.z = _3179;
    }
    if (_170)
    {
        return out;
    }
    float _182 = 1.0 / _150;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _154 * _182;
    bool _188 = !_184;
    float _206;
    if (!_188)
    {
        float _190 = in.m_65.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        _206 = _186;
    }
    _208 = false;
    float _210 = _206;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _218 = 1.0 / _214;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _226 = _216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _228 = _220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _210 + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _238 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _242 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_210);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = _236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = _234 * _218;
    out.m_67.x = _226;
    out.m_67.y = _228;
    out.m_67.z = _230;
    float _258 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_210);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -_252;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _290 = _270 * _278;
    float _292 = fma(_274, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_282, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_286, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = -_270;
    float _300 = _298 + 1.0;
    float _302 = _292 * _290;
    float _304 = _294 * _290;
    float _306 = _296 * _290;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _310 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    out.m_69.x = _238;
    out.m_69.y = _254;
    out.m_69.z = _258;
    out.m_69.w = _308;
    float _316 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].y, _312);
    float _318 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].x, _310);
    float _320 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].z, _314);
    bool _322 = !_288;
    float _340;
    if (!_322)
    {
        float _324 = in.m_65.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        _340 = _186;
    }
    _342 = false;
    float _344 = _340;
    float _346 = in.m_65.z;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _350 = _344 + _348;
    float _352 = in.m_65.x;
    float _354 = _186 * _186;
    float _356 = in.m_65.y;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _362 = in.m_71.x;
    float _364 = in.m_71.y;
    float _366 = in.m_71.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _372 = 1.0 / _360;
    float _374 = in.m_73.x;
    float _376 = in.m_73.y;
    float _378 = in.m_73.z;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _388 = in.m_75.x;
    float _390 = in.m_75.y;
    float _392 = in.m_75.z;
    bool _394 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _396 = isnan(_344);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _370;
    float _408 = _346 * 2.0;
    float _410 = in.m_77.x;
    float _412 = in.m_77.y;
    float _414 = in.m_77.z;
    float _416 = in.m_77.w;
    float _418 = _352 * 2.0;
    float _420 = in.m_65.w;
    float _422 = floor(_408);
    float _424 = _356 * 2.0;
    float _426 = in.m_79.x;
    float _428 = in.m_79.y;
    float _430 = in.m_79.z;
    float _432 = _352 + _356;
    float _434 = _432 + (-1.0);
    float _436 = floor(_418);
    bool _438 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _440 = isnan(_344);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    bool _450 = _422 > 0.0;
    float _452 = floor(_424);
    bool _454 = _422 >= 0.0;
    bool _456 = isnan(_422);
    bool _458 = _454 || _456;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    int _464 = _462 ? 0 : 1;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _472 = _470 != 0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _476 = _474 != 0;
    float _478 = 1.0 / _416;
    int _480 = ~_464;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _318 * _426;
    bool _488 = _436 > 0.0;
    float _490 = _316 * _428;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = _320 * _430;
    int _504 = _484;
    int _506 = as_type<int>(_354);
    float _508 = _486;
    if (!_450)
    {
        int _510 = ~_464;
        int _512 = _510 + 1;
        _504 = _512;
    }
    int _514 = _504;
    float _516 = 1.0 / _382;
    float _518 = in.m_58.x;
    float _520 = in.m_58.y;
    float _522 = in.m_58.z;
    int _524 = _500 ? 0 : 1;
    float _526 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _528 = _452 >= 0.0;
    bool _530 = isnan(_452);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    int _538 = ~_524;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    int _544 = _542;
    if (!_488)
    {
        int _546 = ~_524;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = 1.0 / _386;
    int _554 = _536 ? 0 : 1;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _570 = _568 != 0;
    bool _572 = !_468;
    int _574 = _572 ? 0 : 1;
    bool _576 = _420 > 0.5;
    float _578 = _520 * _364;
    float _580 = _520 * _376;
    float _582 = _520 * _390;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _588 = fma(_518, _362, _578);
    float _590 = fma(_518, _388, _582);
    float _592 = fma(_518, _374, _580);
    float _594 = fma(_522, _392, _590);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _600 = fma(_522, _378, _592);
    float _602 = 1.0 / _586;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _612 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[191].x, 1.0);
    float _614 = fma(_522, _366, _588);
    float _616 = _606 * _372;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _618;
    float _622 = 1.0 / _598;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _632 = _626 * _406;
    float _634 = _620 * _552;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _636;
    float _640 = 1.0 / _610;
    bool _642 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _644 = isnan(_344);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = _356 + _346;
    float _656 = _630 * _516;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _662 = _654 + (-1.0);
    bool _664 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _666 = isnan(_344);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = _638 * _622;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _678;
    bool _682 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _684 = isnan(_344);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_616, _350, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _696 = !_472;
    int _698 = _696 ? 0 : 1;
    float _700 = _680 * _602;
    float _702 = -_652;
    float _704 = _702 + 1.0;
    float _706 = -_692;
    float _708 = _706 + 1.0;
    float _710 = _660 * _640;
    float _712 = _352 + _346;
    float _714 = _692 * _704;
    float _716 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _718 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _720 = isnan(_344);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _674 * _708;
    float _732 = -_674;
    float _734 = _732 + 1.0;
    float _736 = _712 + (-1.0);
    bool _738 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _740 = isnan(_344);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_728;
    float _752 = _750 + 1.0;
    float _754 = _728 * _734;
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _758 = _452 > 0.0;
    float _760 = -_748;
    float _762 = _760 + 1.0;
    float _764 = _748 * _752;
    bool _766 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _768 = isnan(_344);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -_448;
    float _780 = _778 + 1.0;
    float _782 = _404 * _762;
    float _784 = -_404;
    float _786 = _784 + 1.0;
    int _788 = abs(_574);
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = in.m_81.x;
    float _796 = _776 * _786;
    float _798 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _800 = _448 * _792;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _804 = _344 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _808 = _344 + _806;
    float _810 = float(_788);
    float _812 = _694 * _800;
    float _814 = fma(_656, _804, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _822 = _344 + _820;
    float _824 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[159].y, _812);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _828 = _344 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _832 = _344 + _830;
    float _834 = fma(_634, _822, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _836 = fma(_814, _796, _824);
    float _838 = fma(_632, _828, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _842 = _344 + _840;
    float _844 = fma(_700, _808, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _846 = fma(_834, _782, _836);
    float _848 = fma(_676, _832, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _850 = fma(_710, _842, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _852 = float(_514);
    float _854 = fma(_838, _764, _846);
    int _856 = abs(_698);
    float _858 = _818 * _154;
    float _860 = in.m_83.x;
    float _862 = in.m_83.y;
    float _864 = in.m_83.z;
    float _866 = fma(_844, _754, _854);
    float _868 = float(_856);
    float _870 = _810 * _852;
    float _872 = float(_550);
    float _874 = exp2(_858);
    float _876 = fma(_850, _730, _866);
    int _878 = ~_554;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _868 * _872;
    float _886 = in.m_81.y;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _890 = 1.0 + _888;
    int _892 = _882;
    bool _894 = _570;
    float _896 = _632;
    float _898 = _814;
    float _900 = _854;
    if (!_758)
    {
        int _902 = ~_554;
        int _904 = _902 + 1;
        _892 = _904;
    }
    int _906 = _892;
    float _908 = _870 * (-2.0);
    bool _910 = !_476;
    int _912 = _910 ? 0 : 1;
    float _914 = 1.0 / _890;
    bool _916 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _918 = isnan(1.0);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _924 = _920 || _922;
    float _926 = fma(_848, _714, _876);
    bool _928 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _936 = _932 || _934;
    float _938 = fma(_798, _908, _798);
    int _940 = abs(_912);
    float _942 = -_874;
    float _944 = _942 + 1.0;
    float _946 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[166].y, _926);
    float _948 = _884 * (-2.0);
    float _950 = fma(_908, _860, _860);
    float _952 = _946 * _154;
    float _954 = _936 ? _944 : 0.0;
    float _956 = fma(_716, _948, _716);
    bool _958 = _936;
    float _960 = _950;
    if (_558)
    {
        bool _962 = _352 > 0.5;
        _958 = _962;
    }
    bool _964 = _958;
    float _966 = _352 + (-0.5);
    float _968 = float(_940);
    if (_924)
    {
        float _970 = _954 * _914;
        _174 = _970;
    }
    float _972 = _174;
    float _974 = float(_906);
    float _976 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _950);
    float _978 = fma(_948, _862, _862);
    float _980 = -_886;
    float _982 = _980 + 1.0;
    bool _984 = _356 > 0.5;
    float _986 = fma(_938, _972, _976);
    float _988 = _356 + (-0.5);
    float _990 = in.m_85.x;
    float _992 = in.m_85.y;
    float _994 = in.m_85.z;
    float _996 = _968 * _974;
    int _998 = _576 ? as_type<int>(_982) : as_type<int>(_886);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1002 = _986 * 0.15915493667125701904296875;
    float _1004 = _996 * (-2.0);
    float _1006 = _566 ? as_type<float>(_998) : _886;
    float _1008 = fma(_956, _972, _1000);
    float _1010 = _886;
    int _1012 = as_type<int>(_982);
    if (_570)
    {
        float _1014 = _984 ? _982 : _886;
        _1010 = _1014;
    }
    float _1016 = _1010;
    float _1018 = fma(_1004, _864, _864);
    if (_562)
    {
        bool _1020 = _346 > 0.5;
        _894 = _1020;
    }
    bool _1022 = _894;
    float _1024 = _346 + (-0.5);
    float _1026 = _1008 * 0.15915493667125701904296875;
    float _1028 = _1026;
    if (_558)
    {
        float _1030 = -_794;
        float _1032 = _1030 + 1.0;
        _1012 = as_type<int>(_1032);
    }
    int _1034 = _1012;
    float _1036 = fma(_756, _1004, _756);
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1018);
    float _1040 = _612 * _952;
    if (!_558)
    {
        _896 = _794;
    }
    float _1042 = _896;
    float _1044 = fma(_1036, _972, _1038);
    float _1046 = _1042;
    if (_558)
    {
        float _1048 = _964 ? as_type<float>(_1034) : _794;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = fma(_410, 2.0, -1.0);
    float _1054 = fma(_412, 2.0, -1.0);
    float _1056 = _1044 * 0.15915493667125701904296875;
    float _1058 = _1002 * 6.283185482025146484375;
    float _1060 = sin(_1058);
    float _1062 = fma(_414, 2.0, -1.0);
    float _1064 = -_1052;
    float _1066 = _1064 + _990;
    float _1068 = fma(_1052, _1040, _990);
    float _1070 = -_1054;
    float _1072 = _1070 + _992;
    float _1074 = fma(_1054, _1040, _992);
    float _1076 = -_1062;
    float _1078 = _1076 + _994;
    float _1080 = -_1066;
    float _1082 = fma(_1080, _354, _1068);
    float _1084 = _1002 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = -_1072;
    float _1090 = fma(_1088, _354, _1074);
    float _1092 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1094 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1096 = _594 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1090);
    bool _1100 = _1090 != 0.0;
    bool _1102 = isnan(_1090);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1026 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1062, _1040, _994);
    float _1116 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1082);
    bool _1118 = _1082 == 0.0;
    bool _1120 = !_1108;
    bool _1122 = _1118 && _1120;
    float _1124 = -_1078;
    float _1126 = fma(_1124, _354, _1114);
    if (_562)
    {
        float _1128 = -_794;
        float _1130 = _1128 + 1.0;
        _506 = as_type<int>(_1130);
    }
    int _1132 = _506;
    float _1134 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = _1026 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    if (!_562)
    {
        _508 = _794;
    }
    float _1140 = _508;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1126);
    float _1144 = _1140;
    if (_562)
    {
        float _1146 = _1022 ? as_type<float>(_1132) : _794;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = _1116 * _1134;
    float _1152 = _1098 * _526;
    float _1154 = _1142 * _1092;
    bool _1156 = _1126 == 0.0;
    bool _1158 = _1156 && _1122;
    float _1160 = _1056 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = _1086 * _1112;
    float _1166 = _1060 * _1112;
    float _1168 = _1056 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = _1086 * _1138;
    float _1174 = _1060 * _1138;
    float _1176 = _1086 * _1162;
    float _1178 = _1138 * _1162;
    float _1180 = _1060 * _1162;
    float _1182 = _1112 * _1162;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1188 = fma(_1170, _1172, _1166);
    float _1190 = fma(_1170, _1166, _1172);
    float _1192 = -_1164;
    float _1194 = fma(_1170, _1174, _1192);
    float _1196 = -_1174;
    float _1198 = fma(_1170, _1164, _1196);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1202 = in.m_87.x;
    float _1204 = in.m_87.y;
    float _1206 = in.m_87.z;
    float _1208 = -_1170;
    float _1210 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1184);
    float _1212 = -_1170;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1186);
    float _1216 = -_1152;
    float _1218 = _1170 * _1216;
    float _1220 = _1176 * _1152;
    float _1222 = -_1170;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1200);
    float _1226 = _1180 * _1152;
    float _1228 = fma(_1178, _1150, _1218);
    float _1230 = fma(_1188, _1150, _1220);
    float _1232 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1234 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1236 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1238 = fma(_1194, _1150, _1226);
    float _1240 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1232);
    float _1242 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1234);
    float _1244 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1246 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1250 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1236);
    float _1252 = fma(_1198, _1154, _1230);
    float _1254 = fma(_1190, _1154, _1238);
    float _1256 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1214);
    float _1258 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1244);
    float _1260 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1262 = _1238;
    float _1264 = _1246;
    if (_1158)
    {
        _960 = _1204;
    }
    float _1266 = _960;
    float _1268 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    float _1270 = fma(_1182, _1154, _1228);
    float _1272 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1274 = _1266;
    if (_1158)
    {
        _1262 = _1266;
    }
    float _1276 = _1262;
    float _1278 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1210);
    float _1280 = _1276;
    if (!_1158)
    {
        _1274 = _1204;
    }
    float _1282 = _1274;
    float _1284 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1286 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1224);
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1272);
    if (_1158)
    {
        _898 = _1202;
    }
    float _1290 = _898;
    float _1292 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1284);
    float _1294 = _1290;
    if (_1158)
    {
        _900 = _1206;
    }
    float _1296 = _900;
    float _1298 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1288);
    float _1300 = _1296;
    if (_1158)
    {
        _1028 = _1290;
    }
    float _1302 = _1028;
    float _1304 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1292);
    float _1306 = _1302;
    if (_1158)
    {
        _1264 = _1296;
    }
    float _1308 = _1264;
    float _1310 = in.m_89.x;
    float _1312 = in.m_89.y;
    float _1314 = in.m_89.z;
    float _1316 = in.m_89.w;
    float _1318 = _1308;
    if (!_1158)
    {
        _1294 = _1202;
    }
    float _1320 = _1294;
    float _1322 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_1158)
    {
        _1300 = _1206;
    }
    float _1324 = _1300;
    float _1326 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1328 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1258);
    float _1330 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1260);
    float _1332 = _1094 + _1322;
    float _1334 = _1096 + _1326;
    float _1336 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1240);
    float _1338 = _1332;
    float _1340 = _1334;
    if (!_1158)
    {
        float _1342 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1320);
        _1306 = _1342;
    }
    float _1344 = _1306;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1348 = _1332 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1352 = _1334 + _1350;
    float _1354 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1268);
    float _1356 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = _1348 * _1348;
    float _1360 = _1352 * _1352;
    float _1362 = _1344;
    float _1364 = _1358;
    float _1366 = _1360;
    float _1368 = _1352;
    if (!_1158)
    {
        float _1370 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1324);
        _1318 = _1370;
    }
    float _1372 = _1318;
    float _1374 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1376 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1242);
    float _1378 = _1358 + _1360;
    float _1380 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1250);
    if (!_1158)
    {
        float _1382 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1280 = _1382;
    }
    float _1384 = _1280;
    float _1386 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1374);
    float _1388 = sqrt(_1378);
    float _1390 = _1278 * _1312;
    float _1392 = _1256 * _1312;
    float _1394 = _1286 * _1312;
    float _1396 = _1314 * _1320;
    float _1398 = fma(_1336, _1310, _1390);
    float _1400 = _1310 * _1282;
    float _1402 = _1312 * _1324;
    float _1404 = fma(_1376, _1310, _1392);
    float _1406 = fma(_1380, _1310, _1394);
    float _1408 = -_1396;
    float _1410 = fma(_1310, _1324, _1408);
    float _1412 = -_1400;
    float _1414 = fma(_1312, _1320, _1412);
    float _1416 = -_1402;
    float _1418 = fma(_1314, _1282, _1416);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1422 = _1410 * _1316;
    float _1424 = _1414 * _1316;
    bool _1426 = _1388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1418 * _1316;
    float _1430 = _600 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1432 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1434 = fma(_1328, _1314, _1398);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1438 = fma(_1330, _1314, _1404);
    float _1440 = fma(_1354, _1314, _1406);
    float _1442 = _1278 * _1384;
    float _1444 = _1256 * _1384;
    float _1446 = _1286 * _1384;
    float _1448 = _1430 + _1432;
    float _1450 = fma(_1336, _1344, _1442);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1454 = fma(_1376, _1344, _1444);
    float _1456 = fma(_1380, _1344, _1446);
    float _1458 = _1454;
    float _1460 = _1394;
    if (!_1426)
    {
        _1362 = _1448;
    }
    float _1462 = _1362;
    bool _1464 = !_1426;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1388 + _1470;
        float _1474 = rsqrt(_1378);
        float _1476 = _1472 * _1468;
        float _1478 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1480 = _1476 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = cos(_1486);
        float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1492 = _1474 * _1490;
        float _1494 = fma(_1348, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1496 = _1488 + (-1.0);
        float _1498 = fma(_1352, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1502 = _1494 + _1500;
        float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1508 = _1498 + _1506;
        float _1510 = _1502 * _1502;
        float _1512 = fma(_1448, _1488, _1504);
        float _1514 = _1508 * _1508;
        _1466 = _1512;
        _1364 = _1510;
        _1366 = _1514;
        _1338 = _1494;
        _1340 = _1498;
    }
    float _1516 = _1466;
    float _1518 = _1364;
    float _1520 = _1366;
    float _1522 = _1338;
    float _1524 = _1340;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1528 = _1516 + _1526;
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1532 = _1422 * _1256;
    float _1534 = _1422 * _1278;
    float _1536 = fma(_1528, _1528, _1518);
    float _1538 = _1422 * _1286;
    float _1540 = fma(_1428, _1376, _1532);
    float _1542 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1544 = _1536 + _1520;
    float _1546 = fma(_1428, _1336, _1534);
    float _1548 = fma(_1428, _1380, _1538);
    float _1550 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1552 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1554 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1556 = sqrt(_1544);
    float _1558 = _1542 * _1420;
    float _1560 = fma(_1328, _1372, _1450);
    float _1562 = fma(_1424, _1328, _1546);
    float _1564 = fma(_1330, _1372, _1454);
    float _1566 = fma(_1424, _1354, _1548);
    float _1568 = _1550 * _1452;
    float _1570 = _1552 * _1436;
    float _1572 = _1554 * _1530;
    float _1574 = fma(_1424, _1330, _1540);
    float _1576 = fma(_1354, _1372, _1456);
    out.m_91.w = _416;
    out.m_93.x = _1558;
    out.m_93.y = _1570;
    out.m_93.z = _1572;
    out.m_93.w = _1568;
    bool _1578 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1580 = isnan(_1556);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1586 = _1582 || _1584;
    out.m_95.x = _1434;
    out.m_95.y = _1438;
    out.m_95.z = _1440;
    out.m_97.x = _1562;
    out.m_97.y = _1574;
    out.m_97.z = _1566;
    out.m_99.x = _1560;
    out.m_99.y = _1564;
    out.m_99.z = _1576;
    if (!_1586)
    {
        _1458 = 1.0;
    }
    float _1588 = _1458;
    bool _1590 = !_1586;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1556);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1556 + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1610 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1608;
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1616 = 1.0 / _1610;
            float _1618 = _1606 * _1616;
            float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1592 = _1620;
            _1622 = true;
        }
        else
        {
            bool _1624 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1556);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1556 + _1634;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1646 = 1.0 / _1640;
                float _1648 = _1636 * _1646;
                float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1592 = _1650;
                _1622 = true;
            }
            else
            {
                _1592 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1622 = false;
    float _1652 = _1592;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1656 = _1522 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1524 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1674 = _1516 + _1672;
    float _1676 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1678 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = fma(_1674, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1682 = _1674;
    float _1684 = _1652;
    float _1686 = _1678;
    if (_1670)
    {
        _1682 = _1676;
    }
    float _1688 = _1682;
    float _1690 = _1688;
    if (_1670)
    {
        _1684 = _1680;
    }
    float _1692 = _1684;
    float _1694 = _1692;
    if (!_1670)
    {
        float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1698 = _1430 + _1696;
        float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1702 = _1094 + _1700;
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1706 = -_1096;
        float _1708 = _1706 + _1678;
        float _1710 = _1698 * _1698;
        float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1714 = _1096 + _1712;
        float _1716 = fma(_1702, _1702, _1710);
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1720 = fma(_1714, _1714, _1716);
        float _1722 = sqrt(_1720);
        float _1724 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1726 = precise::min(_1722, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1728 = _1726 * _1718;
        float _1730 = -_1094;
        float _1732 = _1730 + _1676;
        float _1734 = -_1430;
        float _1736 = _1734 + _1680;
        float _1738 = _1724 * _1728;
        float _1740 = fma(_1732, _1738, _1094);
        float _1742 = fma(_1736, _1738, _1430);
        float _1744 = fma(_1708, _1738, _1096);
        _1694 = _1742;
        _1690 = _1740;
        _1686 = _1744;
    }
    float _1746 = _1694;
    float _1748 = _1690;
    float _1750 = _1686;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1754 = _1746 + _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1758 = _1748 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1762 = _1750 + _1760;
    float _1764 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1766 = _1754 * _1754;
    float _1768 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1764);
    float _1770 = fma(_1758, _1758, _1766);
    float _1772 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1768);
    float _1774 = fma(_1762, _1762, _1770);
    float _1776 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1778 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = rsqrt(_1774);
    float _1782 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1776);
    float _1784 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1782);
    float _1786 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1788 = 1.0 / _1778;
    float _1790 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1792 = _1790 + _1778;
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1796 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1798 = floor(_1786);
    float _1800 = _1758 * _1794;
    float _1802 = _1762 * _1794;
    float _1804 = _1430 + _1796;
    float _1806 = _1800 * _1800;
    float _1808 = _1802 * _1802;
    float _1810 = _1792 * _1788;
    float _1812 = _1810 * 0.5;
    float _1814 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1816 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1818 = _1806 + _1808;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1822 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1820);
    float _1824 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1814);
    float _1826 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1816);
    float _1828 = sqrt(_1818);
    float _1830 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1824);
    float _1832 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1826);
    float _1834 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1836 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1838 = 1.0 / _1822;
    float _1840 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1842 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = trunc(_1834);
    int _1846 = int(_1844);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1850 = _1838 * _1848;
    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = _1828 + _1852;
    float _1856 = trunc(_1836);
    int _1858 = int(_1856);
    bool _1860 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1862 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _1864 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1866 = _1846 + _1864;
    int _1868 = _1866 + 1;
    float _1870 = _1796;
    int _1872 = 2;
    float _1874 = _1854;
    float _1876 = _1818;
    float _1878 = _1800;
    float _1880 = _1802;
    float _1882 = _1806;
    int _1884 = _1868;
    if (_1842)
    {
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1886;
    }
    float _1888 = _1870;
    if (!_1860)
    {
        _1872 = 1;
    }
    int _1890 = _1872;
    float _1892 = floor(_1840);
    int _1894 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1896 = _1858 + _1894;
    int _1898 = _1896 + 1;
    int _1900 = _1890;
    if (_1842)
    {
        float _1902 = _1854 * _1888;
        _1874 = _1902;
    }
    float _1904 = _1874;
    if (_1842)
    {
        float _1906 = rsqrt(_1818);
        _1876 = _1906;
    }
    float _1908 = _1876;
    float _1910 = _1908;
    if (_1842)
    {
        float _1912 = _1904 * 0.15915493667125701904296875;
        _1368 = _1912;
    }
    float _1914 = _1368;
    bool _1916 = !_1860;
    int _1918 = _1916 ? 0 : 1;
    float _1920 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1922 = _1920;
    if (!_1862)
    {
        _1900 = _1918;
    }
    int _1924 = _1900;
    float _1926 = _1830;
    if (_1842)
    {
        float _1928 = _1914 * 6.283185482025146484375;
        float _1930 = sin(_1928);
        _1926 = _1930;
    }
    float _1932 = _1926;
    float _1934 = precise::max(0.0, _1920);
    float _1936 = -_1892;
    float _1938 = _1840 + _1936;
    int _1940 = _1924 << 6;
    float _1942 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1944 = _1868 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1946 = -_1794;
    float _1948 = -_1934;
    float _1950 = fma(_1754, _1946, _1948);
    int _1952 = _1940 + 96;
    uint _1955 = uint(int(uint(_1952) >> uint(2)));
    uint _1957 = uint(int(uint(int(_1955)) >> uint(2)));
    int _1959 = int(_1955) & 3;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[int(_1957)][_1959];
    int _1963 = int(_1955) + 1;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    int _1967 = _1963 & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    int _1971 = _1868 | _1898;
    float _1973 = _1914;
    float _1975 = _1950;
    if (_1842)
    {
        float _1977 = _1914 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        _1973 = _1979;
    }
    float _1981 = _1973;
    if (_1842)
    {
        float _1983 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1922 = _1983;
    }
    float _1985 = _1922;
    float _1987 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1942);
    bool _1989 = _1971 < 0;
    bool _1991 = _1989 || _1944;
    int _1993 = _1940 + 48;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    uint _1997 = uint(int(uint(int(_1995)) >> uint(2)));
    int _1999 = int(_1995) & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    int _2003 = int(_1995) + 1;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    int _2007 = _2003 & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    if (_1842)
    {
        float _2011 = fma(_1932, _1985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1460 = _2011;
    }
    float _2013 = _1460;
    bool _2015 = _1898 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2017 = _2015 || _1991;
    float _2019 = sqrt(_1774);
    float _2021 = 0.0;
    float _2023 = _2013;
    if (_1842)
    {
        float _2025 = _1908 * _2013;
        _2021 = _2025;
    }
    float _2027 = _2021;
    int _2029 = _1940 + 64;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    if (_1842)
    {
        float _2047 = _1800 * _2027;
        _1878 = _2047;
    }
    float _2049 = _1878;
    if (_1842)
    {
        float _2051 = _1981 + (-1.0);
        _1910 = _2051;
    }
    float _2053 = _1910;
    if (_1842)
    {
        float _2055 = _1802 * _2027;
        _1880 = _2055;
    }
    float _2057 = _1880;
    if (_1842)
    {
        float _2059 = _2049 * _2049;
        _1882 = _2059;
    }
    float _2061 = _1882;
    if (_1842)
    {
        float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2063;
    }
    float _2065 = _2023;
    float _2067 = _2065;
    if (!_2017)
    {
        int _2069 = _1898 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2071 = _2069 + _1868;
        _1884 = _2071;
    }
    int _2073 = _1884;
    int _2075 = _1940 + 104;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
    int _2081 = int(_2077) & 3;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
    int _2085 = int(_2077) + 1;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    int _2089 = _2085 & 3;
    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[int(_2087)][_2089];
    int _2093 = as_type<int>(_2053);
    if (!_2017)
    {
        float _2095 = floor(_1836);
        _2093 = as_type<int>(_2095);
    }
    int _2097 = _2093;
    if (_1842)
    {
        float _2099 = fma(_1950, _1981, _2065);
        _1975 = _2099;
    }
    float _2101 = _1975;
    if (!_1842)
    {
        _2067 = _1808;
    }
    float _2103 = _2067;
    float _2105 = _2103;
    if (_1842)
    {
        float _2107 = _2057 * _2057;
        _2105 = _2107;
    }
    float _2109 = _2105;
    float _2111 = -_1798;
    float _2113 = _1786 + _2111;
    float _2115 = fma(_2101, _2101, _2061);
    int _2117 = _1940 + 80;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    uint _2121 = uint(int(uint(int(_2119)) >> uint(2)));
    int _2123 = int(_2119) & 3;
    float _2125 = (*spvDescriptorSet0.vp_c15)._m0[int(_2121)][_2123];
    int _2127 = int(_2119) + 1;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    int _2131 = _2127 & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    float _2135 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1987);
    float _2137 = _2115 + _2109;
    float _2139 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2141 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2143 = _1940 + 72;
    uint _2145 = uint(int(uint(_2143) >> uint(2)));
    uint _2147 = uint(int(uint(int(_2145)) >> uint(2)));
    int _2149 = int(_2145) & 3;
    float _2151 = (*spvDescriptorSet0.vp_c15)._m0[int(_2147)][_2149];
    int _2153 = int(_2145) + 1;
    uint _2155 = uint(int(uint(_2153) >> uint(2)));
    int _2157 = _2153 & 3;
    float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
    float _2161 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2163 = -_2161;
    float _2165 = fma(_2163, _2139, 1.0);
    int _2167 = _1940 + 56;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
    int _2173 = int(_2169) & 3;
    float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
    int _2177 = int(_2169) + 1;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    int _2181 = _2177 & 3;
    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
    float _2185 = _1804 * _1969;
    float _2187 = log2(_2165);
    float _2189 = fma(_1094, _1961, _2185);
    int _2191 = _1940 + 88;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
    int _2197 = int(_2193) & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    int _2201 = int(_2193) + 1;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    int _2205 = _2201 & 3;
    float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
    float _2209 = _1804 * _2009;
    float _2211 = _1961;
    if (!_2017)
    {
        float _2213 = floor(_1834);
        _2211 = _2213;
    }
    float _2215 = _2211;
    float _2217 = fma(_1094, _2001, _2209);
    float _2219 = _1804 * _2045;
    float _2221 = _2045;
    int _2223 = _2097;
    int _2225 = as_type<int>(_2037);
    if (!_2017)
    {
        float _2227 = -as_type<float>(_2097);
        float _2229 = _1836 + _2227;
        _2221 = _2229;
    }
    float _2231 = _2221;
    if (!_2017)
    {
        int _2233 = _2073 << 2;
        _2223 = _2233;
    }
    int _2235 = _2223;
    float _2237 = rsqrt(_2137);
    float _2239 = fma(_1094, _2037, _2219);
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    if (!_2017)
    {
        uint _2247 = uint(int(uint(_2073) >> uint(2)));
        _2225 = int(_2247);
    }
    int _2249 = _2225;
    float _2251 = _2187 * 0.693147182464599609375;
    float _2253 = fma(_1096, _2083, _2189);
    float _2255 = -_2245;
    float _2257 = _2255 + 1.0;
    float2 _6532 = float2(_1938, _2113);
    float _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6532, float2(0.0), isnan(_6532)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6532, float2(0.0), isnan(_6532)), level(0.0)).x;
    float _2261 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2263 = _2253 + _2091;
    float _2265 = _1804 * _2133;
    int _2267 = as_type<int>(_2133);
    float _2269 = _2265;
    if (!_2017)
    {
        int _2271 = 12 & _2235;
        _2267 = _2271;
    }
    int _2273 = _2267;
    float _2275 = 1.0 / _2263;
    float _2277 = _2237 * _2049;
    float _2279 = fma(_1094, _2125, _2265);
    if (!_2017)
    {
        int _2281 = _2249 << 4;
        int _2283 = _2281 + _2273;
        _2269 = as_type<float>(_2283);
    }
    float _2285 = _2269;
    float _2287 = _2237 * _2101;
    float _2289 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2291 = fma(_1096, _2151, _2239);
    float _2293 = _2237 * _2057;
    float _2295 = abs(_2257);
    float _2297 = log2(_2295);
    float _2299 = -_2289;
    float _2301 = fma(_2287, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2299);
    float _2303 = _2285;
    if (!_2017)
    {
        int _2305 = as_type<int>(_2285) + 400;
        uint _2307 = uint(int(uint(_2305) >> uint(2)));
        uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
        int _2311 = int(_2307) & 3;
        float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
        _2303 = _2313;
    }
    float _2315 = _2303;
    float _2317 = -_2293;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2301);
    float _2321 = fma(_1096, _2175, _2217);
    float _2323 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2325 = fma(_2319, -0.5, 0.5);
    float _2327 = _2321 + _2183;
    float _2329 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2323);
    float _2331 = fma(_2319, 0.5, 0.5);
    float _2333 = fma(_1096, _2199, _2279);
    float _2335 = _2291 + _2159;
    float _2337 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2339 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2343 = _2335 * _2275;
    float _2345 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2337);
    float _2347 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2349 = exp2(_2341);
    float _2351 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2329);
    float _2353 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2345);
    float _2355 = _2327 * _2275;
    float _2357 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2347);
    float _2359 = _2333 + _2207;
    float _2361 = _2353 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2363 = _2351 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2365 = _2355 >= 0.0;
    float _2367 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2369 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2371 = fma(_2331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _2373 = _2355 <= 1.0;
    bool _2375 = _2373 && _2365;
    float _2377 = sqrt(_2325);
    float _2379 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2369);
    float _2381 = fma(_2331, _2371, -0.212114393711090087890625);
    bool _2383 = _2343 >= 0.0;
    bool _2385 = _2383 && _2375;
    float _2387 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2389 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2379);
    float _2391 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2393 = _2343 <= 1.0;
    bool _2395 = _2393 && _2385;
    float _2397 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2387);
    float _2399 = _2287 + 1.0;
    float _2401 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2389);
    float _2403 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2391);
    float _2405 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2397);
    float _2407 = -_2287;
    float _2409 = fma(_2349, _2399, _2407);
    float _2411 = 1.0 / _2401;
    float _2413 = fma(_2331, _2381, 1.570728778839111328125);
    float _2415 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2403);
    float _2417 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2405);
    float _2419 = _2377 * 0.636619746685028076171875;
    float _2421 = _2359 * _2275;
    float _2423 = _2381;
    float _2425 = _2415;
    if (_2395)
    {
        float _2427 = float(_1924);
        _2423 = _2427;
    }
    float _2429 = _2423;
    float _2431 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2415);
    float _2433 = _2431;
    if (!_2017)
    {
        float _2435 = -_2215;
        float _2437 = _1834 + _2435;
        _2425 = _2437;
    }
    float _2439 = _2425;
    float _2441 = fma(_2409, 0.5, 0.5);
    float _2443 = -_2413;
    float _2445 = fma(_2419, _2443, 1.0);
    float _2447 = _2315;
    if (!_2017)
    {
        float _2449 = rint(_2315);
        float _2451 = precise::max(_2449, 0.0);
        uint _2453 = uint(_2451);
        uint _2455 = clamp(_2453, 0u, 65535u);
        _2447 = as_type<float>(_2455);
    }
    float _2457 = _2447;
    float _2459 = _2417 * _2411;
    float _2461 = _2431 * _2411;
    float _2463 = _2429;
    if (_2395)
    {
        float _2465 = rint(_2429);
        float _2467 = precise::max(_2465, 0.0);
        uint _2469 = uint(_2467);
        uint _2471 = clamp(_2469, 0u, 65535u);
        _2463 = as_type<float>(_2471);
    }
    float _2473 = _2463;
    float _2475 = fma(_2459, 0.5, 0.5);
    float _2477 = fma(_2461, -0.5, 0.5);
    float _2479 = _2473;
    if (_2395)
    {
        float3 _6911 = float3(_2355, _2343, float(as_type<int>(_2473)));
        float3 _6915 = select(_6911, float3(0.0), isnan(_6911));
        float _2481 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6915.xy, uint(rint(_6915.z)), _2421, level(0.0));
        _2479 = _2481;
    }
    float _2483 = _2479;
    float3 _6925 = float3(_2475, _2477, _2261);
    float _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6925, float3(0.0), isnan(_6925)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6925, float3(0.0), isnan(_6925)), level(0.0)).x;
    float3 _6934 = float3(_2475, _2477, _2261);
    float4 _2488 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).xyzw;
    float _2490 = _2488.x;
    float _2492 = _2488.y;
    float _2494 = _2488.z;
    float _2496 = _2488.w;
    float2 _6950 = float2(_2445, _2441);
    float3 _2500 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6950, float2(0.0), isnan(_6950)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6950, float2(0.0), isnan(_6950)), level(0.0)).xyz;
    float _2502 = _2500.x;
    float _2504 = _2500.y;
    float _2506 = _2500.z;
    float _2508 = _2439;
    if (!_2017)
    {
        float3 _6971 = float3(_2439, _2231, float(as_type<int>(_2457)));
        float3 _6973 = select(_6971, float3(0.0), isnan(_6971));
        float _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6973.xy, uint(rint(_6973.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6973.xy, uint(rint(_6973.z)), level(0.0)).x;
        _2508 = _2510;
    }
    float _2512 = _2508;
    float _2514 = abs(_1850);
    float _2516 = log2(_2514);
    out.m_101.x = _1758;
    out.m_101.y = _1754;
    out.m_101.z = _1762;
    bool _2518 = _1850 <= 8000.0;
    bool _2520 = isnan(_1850);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(8000.0);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2532 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2534 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2536 = exp2(_2530);
    float _2538 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2534);
    float _2540 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2538);
    float _2542 = fma(_2536, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = fma(_2544, -2.0, 3.0);
    float _2548 = _2544 * _2544;
    float _2550 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2552 = _2548 * _2546;
    float _2554 = _2540 + _2401;
    float _2556 = exp2(_2550);
    float _2558 = _2554 * 0.5;
    float _2560 = -_2552;
    float _2562 = _2560 + 1.0;
    out.gl_Position.x = _2417;
    out.gl_Position.y = _2431;
    out.gl_Position.z = _2540;
    out.gl_Position.w = _2401;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2552);
    float _2566 = _2562;
    float _2568 = _2417;
    if (!_2395)
    {
        _2566 = 1.0;
    }
    float _2570 = _2566;
    out.m_103.z = _2558;
    out.m_103.w = _2401;
    float _2572 = _2528 * _2564;
    float _2574 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2576 = -_2556;
    float _2578 = _2576 + 1.0;
    float _2580 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2582 = _2578;
    float _2584 = _2570;
    if (_2017)
    {
        _2582 = 1.0;
    }
    float _2586 = _2582;
    float _2588 = -_2259;
    float _2590 = _2588 + 1.0;
    float _2592 = _2590 * _2574;
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = _2586;
    if (_2395)
    {
        bool _2598 = _2483 >= _2421;
        bool _2600 = isnan(_2483);
        bool _2602 = _2598 || _2600;
        bool _2604 = isnan(_2421);
        bool _2606 = _2602 || _2604;
        float _2608 = float(_2606);
        _2584 = _2608;
    }
    float _2610 = _2584;
    if (!_2017)
    {
        int _2612 = _2073 << 4;
        int _2614 = _2612 + 2048;
        uint _2616 = uint(int(uint(_2614) >> uint(2)));
        uint _2618 = uint(int(uint(int(_2616)) >> uint(2)));
        int _2620 = int(_2616) & 3;
        float _2622 = (*spvDescriptorSet0.vp_c15)._m0[int(_2618)][_2620];
        int _2624 = int(_2616) + 1;
        uint _2626 = uint(int(uint(_2624) >> uint(2)));
        int _2628 = _2624 & 3;
        float _2630 = (*spvDescriptorSet0.vp_c15)._m0[int(_2626)][_2628];
        int _2632 = _2614 + 8;
        uint _2634 = uint(int(uint(_2632) >> uint(2)));
        uint _2636 = uint(int(uint(int(_2634)) >> uint(2)));
        int _2638 = int(_2634) & 3;
        float _2640 = (*spvDescriptorSet0.vp_c15)._m0[int(_2636)][_2638];
        int _2642 = int(_2634) + 1;
        uint _2644 = uint(int(uint(_2642) >> uint(2)));
        int _2646 = _2642 & 3;
        float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
        float _2650 = _1804 * _2630;
        float _2652 = fma(_1094, _2622, _2650);
        float _2654 = fma(_1096, _2640, _2652);
        float _2656 = _2654 + _2648;
        float _2658 = precise::clamp(_2656, 0.0, 1.0);
        float _2660 = -_2658;
        float _2662 = _2660 + _2512;
        float _2664 = fma(_2662, 500.0, 1.5);
        float _2666 = exp2(_2664);
        float _2668 = 0.0 + _2666;
        float _2670 = precise::clamp(_2668, 0.0, 1.0);
        _2596 = _2670;
        _2568 = _2640;
        _2433 = _2648;
    }
    float _2672 = _2596;
    float _2674 = _2568;
    float _2676 = _2433;
    float _2678 = _2610 * _2672;
    float _2680 = _2580 * _2485;
    float _2682 = -_2594;
    float _2684 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2686 = -_2580;
    float _2688 = _2686 + 1.0;
    bool _2690 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2692 = isnan(_2019);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2698 = _2694 || _2696;
    float _2700 = _2496 * _2680;
    float _2702 = -_2678;
    float _2704 = fma(_2702, _2684, 1.0);
    float _2706 = precise::clamp(_2704, 0.0, 1.0);
    float _2708 = _2506 * _2680;
    float _2710 = _2496 * _2688;
    float _2712 = fma(_2502, _2700, _2490);
    float _2714 = fma(_2504, _2700, _2492);
    float _2716 = _2706 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2718 = fma(_2496, _2708, _2494);
    out.m_105.x = _2716;
    float _2720 = _2676;
    float _2722 = _2674;
    float _2724 = _2684;
    float _2726 = _2688;
    float _2728 = _2700;
    float _2730 = _2706;
    if (!_2698)
    {
        _2720 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2732 = _2720;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2698)
    {
        _2722 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2738 = _2722;
    out.m_107.x = _2712;
    out.m_107.y = _2714;
    out.m_107.z = _2718;
    out.m_107.w = _2710;
    float _2740 = _2738;
    float _2742 = _2738;
    if (!_2698)
    {
        _2724 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2744 = _2724;
    float _2746 = _2744;
    float _2748 = _2744;
    if (!_2698)
    {
        _2726 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2750 = _2726;
    float _2752 = _2750;
    float _2754 = _2750;
    if (!_2698)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2756 = _2728;
    float _2758 = _2756;
    float _2760 = _2756;
    if (!_2698)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2762 = _2730;
    bool _2764 = !_2698;
    float _2766 = _2762;
    float _2768 = _2762;
    if (!_2764)
    {
        bool _2770 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2772 = isnan(_2019);
        bool _2774 = _2770 || _2772;
        bool _2776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2778 = _2774 || _2776;
        if (!_2778)
        {
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2782 = _2019 + _2780;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2786 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2784;
            float _2788 = 1.0 / _2786;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2810 = _2782 * _2788;
            float _2812 = precise::clamp(_2810, 0.0, 1.0);
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = fma(_2812, _2792, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2820 = fma(_2812, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2822 = fma(_2812, _2796, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2824 = fma(_2812, _2800, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2826 = fma(_2812, _2804, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2828 = fma(_2812, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2742 = _2820;
            _2760 = _2826;
            _2736 = _2818;
            _2754 = _2824;
            _2748 = _2822;
            _2768 = _2828;
            _2830 = true;
        }
        else
        {
            bool _2832 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2834 = isnan(_2019);
            bool _2836 = _2832 || _2834;
            bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2840 = _2836 || _2838;
            if (!_2840)
            {
                _2734 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2842 = _2734;
            _2736 = _2842;
            if (!_2840)
            {
                _2740 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2844 = _2740;
            _2742 = _2844;
            if (!_2840)
            {
                _2746 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2846 = _2746;
            _2748 = _2846;
            if (!_2840)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2848 = _2752;
            _2754 = _2848;
            if (!_2840)
            {
                _2758 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2850 = _2758;
            _2760 = _2850;
            if (!_2840)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2852 = _2766;
            bool _2854 = !_2840;
            _2768 = _2852;
            if (!_2854)
            {
                bool _2856 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2858 = isnan(_2019);
                bool _2860 = _2856 || _2858;
                bool _2862 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2864 = _2860 || _2862;
                if (!_2864)
                {
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2868 = _2019 + _2866;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2872 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2870;
                    float _2874 = 1.0 / _2872;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2896 = _2868 * _2874;
                    float _2898 = precise::clamp(_2896, 0.0, 1.0);
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = fma(_2898, _2878, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2906 = fma(_2898, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2908 = fma(_2898, _2882, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2910 = fma(_2898, _2886, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2912 = fma(_2898, _2890, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2914 = fma(_2898, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2742 = _2906;
                    _2760 = _2912;
                    _2736 = _2904;
                    _2754 = _2910;
                    _2748 = _2908;
                    _2768 = _2914;
                    _2830 = true;
                }
                else
                {
                    _2742 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2760 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2736 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2748 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2830 = false;
    float _2916 = _2742;
    float _2918 = _2760;
    float _2920 = _2736;
    float _2922 = _2754;
    float _2924 = _2748;
    float _2926 = _2768;
    float _2928 = fma(_1564, -0.5, 0.5);
    float _2930 = precise::clamp(_2928, 0.0, 1.0);
    float _2932 = -_2916;
    float _2934 = _2932 + _2918;
    float _2936 = -_2920;
    float _2938 = _2936 + _2922;
    float _2940 = -_2924;
    float _2942 = _2940 + _2926;
    bool _2944 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2946 = fma(_2930, _2934, _2916);
    float _2948 = fma(_2930, _2938, _2920);
    float _2950 = fma(_2930, _2942, _2924);
    float _2952 = _2946 * 0.586610972881317138671875;
    out.m_109.x = 0.0;
    float _2954 = fma(_2948, 0.298911988735198974609375, _2952);
    float _2956 = fma(_2950, 0.114477999508380889892578125, _2954);
    float _2958 = -_2956;
    float _2960 = _2948 + _2958;
    float _2962 = -_2956;
    float _2964 = _2946 + _2962;
    float _2966 = -_2956;
    float _2968 = _2950 + _2966;
    float _2970 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2972 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2976 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    out.m_61.x = _2970;
    out.m_111.x = _2972;
    out.m_111.y = _2974;
    out.m_111.z = _2976;
    if (!_2944)
    {
        return out;
    }
    float _2978 = -_1746;
    float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2982 = -_1748;
    float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2986 = -_1750;
    float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2990 = _2980 * _2980;
    float _2992 = fma(_2984, _2984, _2990);
    float _2994 = fma(_2988, _2988, _2992);
    float _2996 = sqrt(_2994);
    float _2998 = rsqrt(_2994);
    float _3000 = -_2996;
    float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3004 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3006 = precise::clamp(_3004, 0.0, 1.0);
    float _3008 = _2984 * _2998;
    float _3010 = _2980 * _2998;
    float _3012 = abs(_3006);
    float _3014 = log2(_3012);
    float _3016 = _2988 * _2998;
    float _3018 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3020 = _1564 * _3010;
    float _3022 = -_3010;
    float _3024 = -_3018;
    float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3024);
    float _3028 = fma(_1560, _3008, _3020);
    float _3030 = -_3016;
    float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3026);
    float _3034 = fma(_1576, _3016, _3028);
    float _3036 = precise::clamp(_3034, 0.0, 1.0);
    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3040 = _3032 + _3038;
    float _3042 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3044 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3046 = precise::clamp(_3044, 0.0, 1.0);
    float _3048 = exp2(_3042);
    float _3050 = _3048 * _3046;
    float _3052 = _3036 * _3050;
    float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3056 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3058 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _3054;
    out.m_109.y = _3056;
    out.m_109.z = _3058;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2830 = false;
    bool _1622 = false;
    bool _342 = false;
    bool _208 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_58.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (!_134)
    {
        out.m_61.x = 0.0;
    }
    int _140 = 0;
    if (!_134)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3114 = as_type<float>(_144);
        out.gl_Position.z = _3114;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_63.w;
    float _150 = float(_130);
    float _152 = -_148;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_148);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    bool _166 = _154 >= _150;
    bool _168 = !_164;
    bool _170 = _166 || _168;
    float _172 = _148;
    float _174 = _154;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _172;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _178 = _176 * 5.0;
        _146 = as_type<int>(_178);
    }
    int _180 = _146;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3179 = as_type<float>(_180);
        out.gl_Position.z = _3179;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = 1.0 / _150;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _154 * _182;
    bool _188 = !_184;
    float _206;
    if (!_188)
    {
        float _190 = in.m_65.x;
        float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _196 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _198 = _196 * _192;
        float _200 = floor(_198);
        float _202 = -_200;
        float _204 = _198 + _202;
        _206 = _204;
        _208 = true;
    }
    else
    {
        _206 = _186;
    }
    _208 = false;
    float _210 = _206;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _218 = 1.0 / _214;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _226 = _216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _228 = _220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _210 + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _238 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _242 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_210);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = _236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = _234 * _218;
    out.m_67.x = _226;
    out.m_67.y = _228;
    out.m_67.z = _230;
    float _258 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_210);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -_252;
    float _278 = _276 + 1.0;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _284;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _290 = _270 * _278;
    float _292 = fma(_274, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_282, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_286, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = -_270;
    float _300 = _298 + 1.0;
    float _302 = _292 * _290;
    float _304 = _294 * _290;
    float _306 = _296 * _290;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _310 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _312 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _314 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    out.m_69.x = _238;
    out.m_69.y = _254;
    out.m_69.z = _258;
    out.m_69.w = _308;
    float _316 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].y, _312);
    float _318 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].x, _310);
    float _320 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[144].z, _314);
    bool _322 = !_288;
    float _340;
    if (!_322)
    {
        float _324 = in.m_65.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        _340 = _186;
    }
    _342 = false;
    float _344 = _340;
    float _346 = in.m_65.z;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _350 = _344 + _348;
    float _352 = in.m_65.x;
    float _354 = _186 * _186;
    float _356 = in.m_65.y;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _362 = in.m_71.x;
    float _364 = in.m_71.y;
    float _366 = in.m_71.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _372 = 1.0 / _360;
    float _374 = in.m_73.x;
    float _376 = in.m_73.y;
    float _378 = in.m_73.z;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _388 = in.m_75.x;
    float _390 = in.m_75.y;
    float _392 = in.m_75.z;
    bool _394 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _396 = isnan(_344);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _370;
    float _408 = _346 * 2.0;
    float _410 = in.m_77.x;
    float _412 = in.m_77.y;
    float _414 = in.m_77.z;
    float _416 = in.m_77.w;
    float _418 = _352 * 2.0;
    float _420 = in.m_65.w;
    float _422 = floor(_408);
    float _424 = _356 * 2.0;
    float _426 = in.m_79.x;
    float _428 = in.m_79.y;
    float _430 = in.m_79.z;
    float _432 = _352 + _356;
    float _434 = _432 + (-1.0);
    float _436 = floor(_418);
    bool _438 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _440 = isnan(_344);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    bool _450 = _422 > 0.0;
    float _452 = floor(_424);
    bool _454 = _422 >= 0.0;
    bool _456 = isnan(_422);
    bool _458 = _454 || _456;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    int _464 = _462 ? 0 : 1;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _472 = _470 != 0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _476 = _474 != 0;
    float _478 = 1.0 / _416;
    int _480 = ~_464;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _318 * _426;
    bool _488 = _436 > 0.0;
    float _490 = _316 * _428;
    bool _492 = _436 >= 0.0;
    bool _494 = isnan(_436);
    bool _496 = _492 || _494;
    bool _498 = isnan(0.0);
    bool _500 = _496 || _498;
    float _502 = _320 * _430;
    int _504 = _484;
    int _506 = as_type<int>(_354);
    float _508 = _486;
    if (!_450)
    {
        int _510 = ~_464;
        int _512 = _510 + 1;
        _504 = _512;
    }
    int _514 = _504;
    float _516 = 1.0 / _382;
    float _518 = in.m_58.x;
    float _520 = in.m_58.y;
    float _522 = in.m_58.z;
    int _524 = _500 ? 0 : 1;
    float _526 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _528 = _452 >= 0.0;
    bool _530 = isnan(_452);
    bool _532 = _528 || _530;
    bool _534 = isnan(0.0);
    bool _536 = _532 || _534;
    int _538 = ~_524;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    int _544 = _542;
    if (!_488)
    {
        int _546 = ~_524;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    float _552 = 1.0 / _386;
    int _554 = _536 ? 0 : 1;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _570 = _568 != 0;
    bool _572 = !_468;
    int _574 = _572 ? 0 : 1;
    bool _576 = _420 > 0.5;
    float _578 = _520 * _364;
    float _580 = _520 * _376;
    float _582 = _520 * _390;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _588 = fma(_518, _362, _578);
    float _590 = fma(_518, _388, _582);
    float _592 = fma(_518, _374, _580);
    float _594 = fma(_522, _392, _590);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _600 = fma(_522, _378, _592);
    float _602 = 1.0 / _586;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _612 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[191].x, 1.0);
    float _614 = fma(_522, _366, _588);
    float _616 = _606 * _372;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _618;
    float _622 = 1.0 / _598;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _632 = _626 * _406;
    float _634 = _620 * _552;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _636;
    float _640 = 1.0 / _610;
    bool _642 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _644 = isnan(_344);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = _356 + _346;
    float _656 = _630 * _516;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _662 = _654 + (-1.0);
    bool _664 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _666 = isnan(_344);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = _638 * _622;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _678;
    bool _682 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _684 = isnan(_344);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = fma(_616, _350, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _696 = !_472;
    int _698 = _696 ? 0 : 1;
    float _700 = _680 * _602;
    float _702 = -_652;
    float _704 = _702 + 1.0;
    float _706 = -_692;
    float _708 = _706 + 1.0;
    float _710 = _660 * _640;
    float _712 = _352 + _346;
    float _714 = _692 * _704;
    float _716 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _718 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _720 = isnan(_344);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = _674 * _708;
    float _732 = -_674;
    float _734 = _732 + 1.0;
    float _736 = _712 + (-1.0);
    bool _738 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _740 = isnan(_344);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_728;
    float _752 = _750 + 1.0;
    float _754 = _728 * _734;
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _758 = _452 > 0.0;
    float _760 = -_748;
    float _762 = _760 + 1.0;
    float _764 = _748 * _752;
    bool _766 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _768 = isnan(_344);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = -_448;
    float _780 = _778 + 1.0;
    float _782 = _404 * _762;
    float _784 = -_404;
    float _786 = _784 + 1.0;
    int _788 = abs(_574);
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = in.m_81.x;
    float _796 = _776 * _786;
    float _798 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _800 = _448 * _792;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _804 = _344 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _808 = _344 + _806;
    float _810 = float(_788);
    float _812 = _694 * _800;
    float _814 = fma(_656, _804, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _816 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _818 = log2(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _822 = _344 + _820;
    float _824 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[159].y, _812);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _828 = _344 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _832 = _344 + _830;
    float _834 = fma(_634, _822, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _836 = fma(_814, _796, _824);
    float _838 = fma(_632, _828, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _842 = _344 + _840;
    float _844 = fma(_700, _808, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _846 = fma(_834, _782, _836);
    float _848 = fma(_676, _832, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _850 = fma(_710, _842, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _852 = float(_514);
    float _854 = fma(_838, _764, _846);
    int _856 = abs(_698);
    float _858 = _818 * _154;
    float _860 = in.m_83.x;
    float _862 = in.m_83.y;
    float _864 = in.m_83.z;
    float _866 = fma(_844, _754, _854);
    float _868 = float(_856);
    float _870 = _810 * _852;
    float _872 = float(_550);
    float _874 = exp2(_858);
    float _876 = fma(_850, _730, _866);
    int _878 = ~_554;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = _868 * _872;
    float _886 = in.m_81.y;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _890 = 1.0 + _888;
    int _892 = _882;
    bool _894 = _570;
    float _896 = _632;
    float _898 = _814;
    float _900 = _854;
    if (!_758)
    {
        int _902 = ~_554;
        int _904 = _902 + 1;
        _892 = _904;
    }
    int _906 = _892;
    float _908 = _870 * (-2.0);
    bool _910 = !_476;
    int _912 = _910 ? 0 : 1;
    float _914 = 1.0 / _890;
    bool _916 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _918 = isnan(1.0);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _924 = _920 || _922;
    float _926 = fma(_848, _714, _876);
    bool _928 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _936 = _932 || _934;
    float _938 = fma(_798, _908, _798);
    int _940 = abs(_912);
    float _942 = -_874;
    float _944 = _942 + 1.0;
    float _946 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[166].y, _926);
    float _948 = _884 * (-2.0);
    float _950 = fma(_908, _860, _860);
    float _952 = _946 * _154;
    float _954 = _936 ? _944 : 0.0;
    float _956 = fma(_716, _948, _716);
    bool _958 = _936;
    float _960 = _950;
    if (_558)
    {
        bool _962 = _352 > 0.5;
        _958 = _962;
    }
    bool _964 = _958;
    float _966 = _352 + (-0.5);
    float _968 = float(_940);
    if (_924)
    {
        float _970 = _954 * _914;
        _174 = _970;
    }
    float _972 = _174;
    float _974 = float(_906);
    float _976 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _950);
    float _978 = fma(_948, _862, _862);
    float _980 = -_886;
    float _982 = _980 + 1.0;
    bool _984 = _356 > 0.5;
    float _986 = fma(_938, _972, _976);
    float _988 = _356 + (-0.5);
    float _990 = in.m_85.x;
    float _992 = in.m_85.y;
    float _994 = in.m_85.z;
    float _996 = _968 * _974;
    int _998 = _576 ? as_type<int>(_982) : as_type<int>(_886);
    float _1000 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1002 = _986 * 0.15915493667125701904296875;
    float _1004 = _996 * (-2.0);
    float _1006 = _566 ? as_type<float>(_998) : _886;
    float _1008 = fma(_956, _972, _1000);
    float _1010 = _886;
    int _1012 = as_type<int>(_982);
    if (_570)
    {
        float _1014 = _984 ? _982 : _886;
        _1010 = _1014;
    }
    float _1016 = _1010;
    float _1018 = fma(_1004, _864, _864);
    if (_562)
    {
        bool _1020 = _346 > 0.5;
        _894 = _1020;
    }
    bool _1022 = _894;
    float _1024 = _346 + (-0.5);
    float _1026 = _1008 * 0.15915493667125701904296875;
    float _1028 = _1026;
    if (_558)
    {
        float _1030 = -_794;
        float _1032 = _1030 + 1.0;
        _1012 = as_type<int>(_1032);
    }
    int _1034 = _1012;
    float _1036 = fma(_756, _1004, _756);
    float _1038 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1018);
    float _1040 = _612 * _952;
    if (!_558)
    {
        _896 = _794;
    }
    float _1042 = _896;
    float _1044 = fma(_1036, _972, _1038);
    float _1046 = _1042;
    if (_558)
    {
        float _1048 = _964 ? as_type<float>(_1034) : _794;
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = fma(_410, 2.0, -1.0);
    float _1054 = fma(_412, 2.0, -1.0);
    float _1056 = _1044 * 0.15915493667125701904296875;
    float _1058 = _1002 * 6.283185482025146484375;
    float _1060 = sin(_1058);
    float _1062 = fma(_414, 2.0, -1.0);
    float _1064 = -_1052;
    float _1066 = _1064 + _990;
    float _1068 = fma(_1052, _1040, _990);
    float _1070 = -_1054;
    float _1072 = _1070 + _992;
    float _1074 = fma(_1054, _1040, _992);
    float _1076 = -_1062;
    float _1078 = _1076 + _994;
    float _1080 = -_1066;
    float _1082 = fma(_1080, _354, _1068);
    float _1084 = _1002 * 6.283185482025146484375;
    float _1086 = cos(_1084);
    float _1088 = -_1072;
    float _1090 = fma(_1088, _354, _1074);
    float _1092 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1094 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1096 = _594 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1090);
    bool _1100 = _1090 != 0.0;
    bool _1102 = isnan(_1090);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = _1026 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    float _1114 = fma(_1062, _1040, _994);
    float _1116 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1082);
    bool _1118 = _1082 == 0.0;
    bool _1120 = !_1108;
    bool _1122 = _1118 && _1120;
    float _1124 = -_1078;
    float _1126 = fma(_1124, _354, _1114);
    if (_562)
    {
        float _1128 = -_794;
        float _1130 = _1128 + 1.0;
        _506 = as_type<int>(_1130);
    }
    int _1132 = _506;
    float _1134 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1136 = _1026 * 6.283185482025146484375;
    float _1138 = cos(_1136);
    if (!_562)
    {
        _508 = _794;
    }
    float _1140 = _508;
    float _1142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1126);
    float _1144 = _1140;
    if (_562)
    {
        float _1146 = _1022 ? as_type<float>(_1132) : _794;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = _1116 * _1134;
    float _1152 = _1098 * _526;
    float _1154 = _1142 * _1092;
    bool _1156 = _1126 == 0.0;
    bool _1158 = _1156 && _1122;
    float _1160 = _1056 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = _1086 * _1112;
    float _1166 = _1060 * _1112;
    float _1168 = _1056 * 6.283185482025146484375;
    float _1170 = sin(_1168);
    float _1172 = _1086 * _1138;
    float _1174 = _1060 * _1138;
    float _1176 = _1086 * _1162;
    float _1178 = _1138 * _1162;
    float _1180 = _1060 * _1162;
    float _1182 = _1112 * _1162;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1188 = fma(_1170, _1172, _1166);
    float _1190 = fma(_1170, _1166, _1172);
    float _1192 = -_1164;
    float _1194 = fma(_1170, _1174, _1192);
    float _1196 = -_1174;
    float _1198 = fma(_1170, _1164, _1196);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1202 = in.m_87.x;
    float _1204 = in.m_87.y;
    float _1206 = in.m_87.z;
    float _1208 = -_1170;
    float _1210 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1184);
    float _1212 = -_1170;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1186);
    float _1216 = -_1152;
    float _1218 = _1170 * _1216;
    float _1220 = _1176 * _1152;
    float _1222 = -_1170;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1200);
    float _1226 = _1180 * _1152;
    float _1228 = fma(_1178, _1150, _1218);
    float _1230 = fma(_1188, _1150, _1220);
    float _1232 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1234 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1236 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1238 = fma(_1194, _1150, _1226);
    float _1240 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1232);
    float _1242 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1234);
    float _1244 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1246 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1248 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1250 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1236);
    float _1252 = fma(_1198, _1154, _1230);
    float _1254 = fma(_1190, _1154, _1238);
    float _1256 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1214);
    float _1258 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1244);
    float _1260 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1246);
    float _1262 = _1238;
    float _1264 = _1246;
    if (_1158)
    {
        _960 = _1204;
    }
    float _1266 = _960;
    float _1268 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1248);
    float _1270 = fma(_1182, _1154, _1228);
    float _1272 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1274 = _1266;
    if (_1158)
    {
        _1262 = _1266;
    }
    float _1276 = _1262;
    float _1278 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1210);
    float _1280 = _1276;
    if (!_1158)
    {
        _1274 = _1204;
    }
    float _1282 = _1274;
    float _1284 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1286 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1224);
    float _1288 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1272);
    if (_1158)
    {
        _898 = _1202;
    }
    float _1290 = _898;
    float _1292 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1284);
    float _1294 = _1290;
    if (_1158)
    {
        _900 = _1206;
    }
    float _1296 = _900;
    float _1298 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1288);
    float _1300 = _1296;
    if (_1158)
    {
        _1028 = _1290;
    }
    float _1302 = _1028;
    float _1304 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1292);
    float _1306 = _1302;
    if (_1158)
    {
        _1264 = _1296;
    }
    float _1308 = _1264;
    float _1310 = in.m_89.x;
    float _1312 = in.m_89.y;
    float _1314 = in.m_89.z;
    float _1316 = in.m_89.w;
    float _1318 = _1308;
    if (!_1158)
    {
        _1294 = _1202;
    }
    float _1320 = _1294;
    float _1322 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_1158)
    {
        _1300 = _1206;
    }
    float _1324 = _1300;
    float _1326 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1328 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1258);
    float _1330 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1260);
    float _1332 = _1094 + _1322;
    float _1334 = _1096 + _1326;
    float _1336 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1240);
    float _1338 = _1332;
    float _1340 = _1334;
    if (!_1158)
    {
        float _1342 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1320);
        _1306 = _1342;
    }
    float _1344 = _1306;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1348 = _1332 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1352 = _1334 + _1350;
    float _1354 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1268);
    float _1356 = _1252 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = _1348 * _1348;
    float _1360 = _1352 * _1352;
    float _1362 = _1344;
    float _1364 = _1358;
    float _1366 = _1360;
    float _1368 = _1352;
    if (!_1158)
    {
        float _1370 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1324);
        _1318 = _1370;
    }
    float _1372 = _1318;
    float _1374 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1376 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1242);
    float _1378 = _1358 + _1360;
    float _1380 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1250);
    if (!_1158)
    {
        float _1382 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1280 = _1382;
    }
    float _1384 = _1280;
    float _1386 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1374);
    float _1388 = sqrt(_1378);
    float _1390 = _1278 * _1312;
    float _1392 = _1256 * _1312;
    float _1394 = _1286 * _1312;
    float _1396 = _1314 * _1320;
    float _1398 = fma(_1336, _1310, _1390);
    float _1400 = _1310 * _1282;
    float _1402 = _1312 * _1324;
    float _1404 = fma(_1376, _1310, _1392);
    float _1406 = fma(_1380, _1310, _1394);
    float _1408 = -_1396;
    float _1410 = fma(_1310, _1324, _1408);
    float _1412 = -_1400;
    float _1414 = fma(_1312, _1320, _1412);
    float _1416 = -_1402;
    float _1418 = fma(_1314, _1282, _1416);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1422 = _1410 * _1316;
    float _1424 = _1414 * _1316;
    bool _1426 = _1388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = _1418 * _1316;
    float _1430 = _600 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1432 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1434 = fma(_1328, _1314, _1398);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1438 = fma(_1330, _1314, _1404);
    float _1440 = fma(_1354, _1314, _1406);
    float _1442 = _1278 * _1384;
    float _1444 = _1256 * _1384;
    float _1446 = _1286 * _1384;
    float _1448 = _1430 + _1432;
    float _1450 = fma(_1336, _1344, _1442);
    float _1452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1454 = fma(_1376, _1344, _1444);
    float _1456 = fma(_1380, _1344, _1446);
    float _1458 = _1454;
    float _1460 = _1394;
    if (!_1426)
    {
        _1362 = _1448;
    }
    float _1462 = _1362;
    bool _1464 = !_1426;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1388 + _1470;
        float _1474 = rsqrt(_1378);
        float _1476 = _1472 * _1468;
        float _1478 = _1448 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1480 = _1476 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = cos(_1486);
        float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1492 = _1474 * _1490;
        float _1494 = fma(_1348, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1496 = _1488 + (-1.0);
        float _1498 = fma(_1352, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1502 = _1494 + _1500;
        float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1508 = _1498 + _1506;
        float _1510 = _1502 * _1502;
        float _1512 = fma(_1448, _1488, _1504);
        float _1514 = _1508 * _1508;
        _1466 = _1512;
        _1364 = _1510;
        _1366 = _1514;
        _1338 = _1494;
        _1340 = _1498;
    }
    float _1516 = _1466;
    float _1518 = _1364;
    float _1520 = _1366;
    float _1522 = _1338;
    float _1524 = _1340;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1528 = _1516 + _1526;
    float _1530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1532 = _1422 * _1256;
    float _1534 = _1422 * _1278;
    float _1536 = fma(_1528, _1528, _1518);
    float _1538 = _1422 * _1286;
    float _1540 = fma(_1428, _1376, _1532);
    float _1542 = _1050 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1544 = _1536 + _1520;
    float _1546 = fma(_1428, _1336, _1534);
    float _1548 = fma(_1428, _1380, _1538);
    float _1550 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1552 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1554 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1556 = sqrt(_1544);
    float _1558 = _1542 * _1420;
    float _1560 = fma(_1328, _1372, _1450);
    float _1562 = fma(_1424, _1328, _1546);
    float _1564 = fma(_1330, _1372, _1454);
    float _1566 = fma(_1424, _1354, _1548);
    float _1568 = _1550 * _1452;
    float _1570 = _1552 * _1436;
    float _1572 = _1554 * _1530;
    float _1574 = fma(_1424, _1330, _1540);
    float _1576 = fma(_1354, _1372, _1456);
    out.m_91.w = _416;
    out.m_93.x = _1558;
    out.m_93.y = _1570;
    out.m_93.z = _1572;
    out.m_93.w = _1568;
    bool _1578 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1580 = isnan(_1556);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1586 = _1582 || _1584;
    out.m_95.x = _1434;
    out.m_95.y = _1438;
    out.m_95.z = _1440;
    out.m_97.x = _1562;
    out.m_97.y = _1574;
    out.m_97.z = _1566;
    out.m_99.x = _1560;
    out.m_99.y = _1564;
    out.m_99.z = _1576;
    if (!_1586)
    {
        _1458 = 1.0;
    }
    float _1588 = _1458;
    bool _1590 = !_1586;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1556);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1556 + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1610 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1608;
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1616 = 1.0 / _1610;
            float _1618 = _1606 * _1616;
            float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1592 = _1620;
            _1622 = true;
        }
        else
        {
            bool _1624 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1556);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1556 + _1634;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1646 = 1.0 / _1640;
                float _1648 = _1636 * _1646;
                float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1592 = _1650;
                _1622 = true;
            }
            else
            {
                _1592 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1622 = false;
    float _1652 = _1592;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1656 = _1522 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1524 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1674 = _1516 + _1672;
    float _1676 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1678 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = fma(_1674, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1682 = _1674;
    float _1684 = _1652;
    float _1686 = _1678;
    if (_1670)
    {
        _1682 = _1676;
    }
    float _1688 = _1682;
    float _1690 = _1688;
    if (_1670)
    {
        _1684 = _1680;
    }
    float _1692 = _1684;
    float _1694 = _1692;
    if (!_1670)
    {
        float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1698 = _1430 + _1696;
        float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1702 = _1094 + _1700;
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1706 = -_1096;
        float _1708 = _1706 + _1678;
        float _1710 = _1698 * _1698;
        float _1712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1714 = _1096 + _1712;
        float _1716 = fma(_1702, _1702, _1710);
        float _1718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1720 = fma(_1714, _1714, _1716);
        float _1722 = sqrt(_1720);
        float _1724 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1726 = precise::min(_1722, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1728 = _1726 * _1718;
        float _1730 = -_1094;
        float _1732 = _1730 + _1676;
        float _1734 = -_1430;
        float _1736 = _1734 + _1680;
        float _1738 = _1724 * _1728;
        float _1740 = fma(_1732, _1738, _1094);
        float _1742 = fma(_1736, _1738, _1430);
        float _1744 = fma(_1708, _1738, _1096);
        _1694 = _1742;
        _1690 = _1740;
        _1686 = _1744;
    }
    float _1746 = _1694;
    float _1748 = _1690;
    float _1750 = _1686;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1754 = _1746 + _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1758 = _1748 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1762 = _1750 + _1760;
    float _1764 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1766 = _1754 * _1754;
    float _1768 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1764);
    float _1770 = fma(_1758, _1758, _1766);
    float _1772 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1768);
    float _1774 = fma(_1762, _1762, _1770);
    float _1776 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1778 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1780 = rsqrt(_1774);
    float _1782 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1776);
    float _1784 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1782);
    float _1786 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1788 = 1.0 / _1778;
    float _1790 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1792 = _1790 + _1778;
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1796 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1798 = floor(_1786);
    float _1800 = _1758 * _1794;
    float _1802 = _1762 * _1794;
    float _1804 = _1430 + _1796;
    float _1806 = _1800 * _1800;
    float _1808 = _1802 * _1802;
    float _1810 = _1792 * _1788;
    float _1812 = _1810 * 0.5;
    float _1814 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1816 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1818 = _1806 + _1808;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1822 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1820);
    float _1824 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1814);
    float _1826 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1816);
    float _1828 = sqrt(_1818);
    float _1830 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1824);
    float _1832 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1826);
    float _1834 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1836 = _1832 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1838 = 1.0 / _1822;
    float _1840 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1842 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = trunc(_1834);
    int _1846 = int(_1844);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1850 = _1838 * _1848;
    float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1854 = _1828 + _1852;
    float _1856 = trunc(_1836);
    int _1858 = int(_1856);
    bool _1860 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1862 = _1850 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _1864 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1866 = _1846 + _1864;
    int _1868 = _1866 + 1;
    float _1870 = _1796;
    int _1872 = 2;
    float _1874 = _1854;
    float _1876 = _1818;
    float _1878 = _1800;
    float _1880 = _1802;
    float _1882 = _1806;
    int _1884 = _1868;
    if (_1842)
    {
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1886;
    }
    float _1888 = _1870;
    if (!_1860)
    {
        _1872 = 1;
    }
    int _1890 = _1872;
    float _1892 = floor(_1840);
    int _1894 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1896 = _1858 + _1894;
    int _1898 = _1896 + 1;
    int _1900 = _1890;
    if (_1842)
    {
        float _1902 = _1854 * _1888;
        _1874 = _1902;
    }
    float _1904 = _1874;
    if (_1842)
    {
        float _1906 = rsqrt(_1818);
        _1876 = _1906;
    }
    float _1908 = _1876;
    float _1910 = _1908;
    if (_1842)
    {
        float _1912 = _1904 * 0.15915493667125701904296875;
        _1368 = _1912;
    }
    float _1914 = _1368;
    bool _1916 = !_1860;
    int _1918 = _1916 ? 0 : 1;
    float _1920 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1922 = _1920;
    if (!_1862)
    {
        _1900 = _1918;
    }
    int _1924 = _1900;
    float _1926 = _1830;
    if (_1842)
    {
        float _1928 = _1914 * 6.283185482025146484375;
        float _1930 = sin(_1928);
        _1926 = _1930;
    }
    float _1932 = _1926;
    float _1934 = precise::max(0.0, _1920);
    float _1936 = -_1892;
    float _1938 = _1840 + _1936;
    int _1940 = _1924 << 6;
    float _1942 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1944 = _1868 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1946 = -_1794;
    float _1948 = -_1934;
    float _1950 = fma(_1754, _1946, _1948);
    int _1952 = _1940 + 96;
    uint _1955 = uint(int(uint(_1952) >> uint(2)));
    uint _1957 = uint(int(uint(int(_1955)) >> uint(2)));
    int _1959 = int(_1955) & 3;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[int(_1957)][_1959];
    int _1963 = int(_1955) + 1;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    int _1967 = _1963 & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    int _1971 = _1868 | _1898;
    float _1973 = _1914;
    float _1975 = _1950;
    if (_1842)
    {
        float _1977 = _1914 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        _1973 = _1979;
    }
    float _1981 = _1973;
    if (_1842)
    {
        float _1983 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1922 = _1983;
    }
    float _1985 = _1922;
    float _1987 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1942);
    bool _1989 = _1971 < 0;
    bool _1991 = _1989 || _1944;
    int _1993 = _1940 + 48;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    uint _1997 = uint(int(uint(int(_1995)) >> uint(2)));
    int _1999 = int(_1995) & 3;
    float _2001 = (*spvDescriptorSet0.vp_c15)._m0[int(_1997)][_1999];
    int _2003 = int(_1995) + 1;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    int _2007 = _2003 & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    if (_1842)
    {
        float _2011 = fma(_1932, _1985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1460 = _2011;
    }
    float _2013 = _1460;
    bool _2015 = _1898 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2017 = _2015 || _1991;
    float _2019 = sqrt(_1774);
    float _2021 = 0.0;
    float _2023 = _2013;
    if (_1842)
    {
        float _2025 = _1908 * _2013;
        _2021 = _2025;
    }
    float _2027 = _2021;
    int _2029 = _1940 + 64;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    uint _2033 = uint(int(uint(int(_2031)) >> uint(2)));
    int _2035 = int(_2031) & 3;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[int(_2033)][_2035];
    int _2039 = int(_2031) + 1;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    int _2043 = _2039 & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    if (_1842)
    {
        float _2047 = _1800 * _2027;
        _1878 = _2047;
    }
    float _2049 = _1878;
    if (_1842)
    {
        float _2051 = _1981 + (-1.0);
        _1910 = _2051;
    }
    float _2053 = _1910;
    if (_1842)
    {
        float _2055 = _1802 * _2027;
        _1880 = _2055;
    }
    float _2057 = _1880;
    if (_1842)
    {
        float _2059 = _2049 * _2049;
        _1882 = _2059;
    }
    float _2061 = _1882;
    if (_1842)
    {
        float _2063 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2023 = _2063;
    }
    float _2065 = _2023;
    float _2067 = _2065;
    if (!_2017)
    {
        int _2069 = _1898 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2071 = _2069 + _1868;
        _1884 = _2071;
    }
    int _2073 = _1884;
    int _2075 = _1940 + 104;
    uint _2077 = uint(int(uint(_2075) >> uint(2)));
    uint _2079 = uint(int(uint(int(_2077)) >> uint(2)));
    int _2081 = int(_2077) & 3;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[int(_2079)][_2081];
    int _2085 = int(_2077) + 1;
    uint _2087 = uint(int(uint(_2085) >> uint(2)));
    int _2089 = _2085 & 3;
    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[int(_2087)][_2089];
    int _2093 = as_type<int>(_2053);
    if (!_2017)
    {
        float _2095 = floor(_1836);
        _2093 = as_type<int>(_2095);
    }
    int _2097 = _2093;
    if (_1842)
    {
        float _2099 = fma(_1950, _1981, _2065);
        _1975 = _2099;
    }
    float _2101 = _1975;
    if (!_1842)
    {
        _2067 = _1808;
    }
    float _2103 = _2067;
    float _2105 = _2103;
    if (_1842)
    {
        float _2107 = _2057 * _2057;
        _2105 = _2107;
    }
    float _2109 = _2105;
    float _2111 = -_1798;
    float _2113 = _1786 + _2111;
    float _2115 = fma(_2101, _2101, _2061);
    int _2117 = _1940 + 80;
    uint _2119 = uint(int(uint(_2117) >> uint(2)));
    uint _2121 = uint(int(uint(int(_2119)) >> uint(2)));
    int _2123 = int(_2119) & 3;
    float _2125 = (*spvDescriptorSet0.vp_c15)._m0[int(_2121)][_2123];
    int _2127 = int(_2119) + 1;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    int _2131 = _2127 & 3;
    float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
    float _2135 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1987);
    float _2137 = _2115 + _2109;
    float _2139 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2141 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2143 = _1940 + 72;
    uint _2145 = uint(int(uint(_2143) >> uint(2)));
    uint _2147 = uint(int(uint(int(_2145)) >> uint(2)));
    int _2149 = int(_2145) & 3;
    float _2151 = (*spvDescriptorSet0.vp_c15)._m0[int(_2147)][_2149];
    int _2153 = int(_2145) + 1;
    uint _2155 = uint(int(uint(_2153) >> uint(2)));
    int _2157 = _2153 & 3;
    float _2159 = (*spvDescriptorSet0.vp_c15)._m0[int(_2155)][_2157];
    float _2161 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2163 = -_2161;
    float _2165 = fma(_2163, _2139, 1.0);
    int _2167 = _1940 + 56;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
    int _2173 = int(_2169) & 3;
    float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
    int _2177 = int(_2169) + 1;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    int _2181 = _2177 & 3;
    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[int(_2179)][_2181];
    float _2185 = _1804 * _1969;
    float _2187 = log2(_2165);
    float _2189 = fma(_1094, _1961, _2185);
    int _2191 = _1940 + 88;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
    int _2197 = int(_2193) & 3;
    float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
    int _2201 = int(_2193) + 1;
    uint _2203 = uint(int(uint(_2201) >> uint(2)));
    int _2205 = _2201 & 3;
    float _2207 = (*spvDescriptorSet0.vp_c15)._m0[int(_2203)][_2205];
    float _2209 = _1804 * _2009;
    float _2211 = _1961;
    if (!_2017)
    {
        float _2213 = floor(_1834);
        _2211 = _2213;
    }
    float _2215 = _2211;
    float _2217 = fma(_1094, _2001, _2209);
    float _2219 = _1804 * _2045;
    float _2221 = _2045;
    int _2223 = _2097;
    int _2225 = as_type<int>(_2037);
    if (!_2017)
    {
        float _2227 = -as_type<float>(_2097);
        float _2229 = _1836 + _2227;
        _2221 = _2229;
    }
    float _2231 = _2221;
    if (!_2017)
    {
        int _2233 = _2073 << 2;
        _2223 = _2233;
    }
    int _2235 = _2223;
    float _2237 = rsqrt(_2137);
    float _2239 = fma(_1094, _2037, _2219);
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    if (!_2017)
    {
        uint _2247 = uint(int(uint(_2073) >> uint(2)));
        _2225 = int(_2247);
    }
    int _2249 = _2225;
    float _2251 = _2187 * 0.693147182464599609375;
    float _2253 = fma(_1096, _2083, _2189);
    float _2255 = -_2245;
    float _2257 = _2255 + 1.0;
    float2 _6532 = float2(_1938, _2113);
    float _2259 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6532, float2(0.0), isnan(_6532)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6532, float2(0.0), isnan(_6532)), level(0.0)).x;
    float _2261 = _2251 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2263 = _2253 + _2091;
    float _2265 = _1804 * _2133;
    int _2267 = as_type<int>(_2133);
    float _2269 = _2265;
    if (!_2017)
    {
        int _2271 = 12 & _2235;
        _2267 = _2271;
    }
    int _2273 = _2267;
    float _2275 = 1.0 / _2263;
    float _2277 = _2237 * _2049;
    float _2279 = fma(_1094, _2125, _2265);
    if (!_2017)
    {
        int _2281 = _2249 << 4;
        int _2283 = _2281 + _2273;
        _2269 = as_type<float>(_2283);
    }
    float _2285 = _2269;
    float _2287 = _2237 * _2101;
    float _2289 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2291 = fma(_1096, _2151, _2239);
    float _2293 = _2237 * _2057;
    float _2295 = abs(_2257);
    float _2297 = log2(_2295);
    float _2299 = -_2289;
    float _2301 = fma(_2287, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2299);
    float _2303 = _2285;
    if (!_2017)
    {
        int _2305 = as_type<int>(_2285) + 400;
        uint _2307 = uint(int(uint(_2305) >> uint(2)));
        uint _2309 = uint(int(uint(int(_2307)) >> uint(2)));
        int _2311 = int(_2307) & 3;
        float _2313 = (*spvDescriptorSet0.vp_c15)._m0[int(_2309)][_2311];
        _2303 = _2313;
    }
    float _2315 = _2303;
    float _2317 = -_2293;
    float _2319 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2301);
    float _2321 = fma(_1096, _2175, _2217);
    float _2323 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2325 = fma(_2319, -0.5, 0.5);
    float _2327 = _2321 + _2183;
    float _2329 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2323);
    float _2331 = fma(_2319, 0.5, 0.5);
    float _2333 = fma(_1096, _2199, _2279);
    float _2335 = _2291 + _2159;
    float _2337 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2339 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2343 = _2335 * _2275;
    float _2345 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2337);
    float _2347 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2349 = exp2(_2341);
    float _2351 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2329);
    float _2353 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2345);
    float _2355 = _2327 * _2275;
    float _2357 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2347);
    float _2359 = _2333 + _2207;
    float _2361 = _2353 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2363 = _2351 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2365 = _2355 >= 0.0;
    float _2367 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2369 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2371 = fma(_2331, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _2373 = _2355 <= 1.0;
    bool _2375 = _2373 && _2365;
    float _2377 = sqrt(_2325);
    float _2379 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2369);
    float _2381 = fma(_2331, _2371, -0.212114393711090087890625);
    bool _2383 = _2343 >= 0.0;
    bool _2385 = _2383 && _2375;
    float _2387 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2389 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2379);
    float _2391 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2393 = _2343 <= 1.0;
    bool _2395 = _2393 && _2385;
    float _2397 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2387);
    float _2399 = _2287 + 1.0;
    float _2401 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2389);
    float _2403 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2391);
    float _2405 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2397);
    float _2407 = -_2287;
    float _2409 = fma(_2349, _2399, _2407);
    float _2411 = 1.0 / _2401;
    float _2413 = fma(_2331, _2381, 1.570728778839111328125);
    float _2415 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2403);
    float _2417 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2405);
    float _2419 = _2377 * 0.636619746685028076171875;
    float _2421 = _2359 * _2275;
    float _2423 = _2381;
    float _2425 = _2415;
    if (_2395)
    {
        float _2427 = float(_1924);
        _2423 = _2427;
    }
    float _2429 = _2423;
    float _2431 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2415);
    float _2433 = _2431;
    if (!_2017)
    {
        float _2435 = -_2215;
        float _2437 = _1834 + _2435;
        _2425 = _2437;
    }
    float _2439 = _2425;
    float _2441 = fma(_2409, 0.5, 0.5);
    float _2443 = -_2413;
    float _2445 = fma(_2419, _2443, 1.0);
    float _2447 = _2315;
    if (!_2017)
    {
        float _2449 = rint(_2315);
        float _2451 = precise::max(_2449, 0.0);
        uint _2453 = uint(_2451);
        uint _2455 = clamp(_2453, 0u, 65535u);
        _2447 = as_type<float>(_2455);
    }
    float _2457 = _2447;
    float _2459 = _2417 * _2411;
    float _2461 = _2431 * _2411;
    float _2463 = _2429;
    if (_2395)
    {
        float _2465 = rint(_2429);
        float _2467 = precise::max(_2465, 0.0);
        uint _2469 = uint(_2467);
        uint _2471 = clamp(_2469, 0u, 65535u);
        _2463 = as_type<float>(_2471);
    }
    float _2473 = _2463;
    float _2475 = fma(_2459, 0.5, 0.5);
    float _2477 = fma(_2461, -0.5, 0.5);
    float _2479 = _2473;
    if (_2395)
    {
        float3 _6911 = float3(_2355, _2343, float(as_type<int>(_2473)));
        float3 _6915 = select(_6911, float3(0.0), isnan(_6911));
        float _2481 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6915.xy, uint(rint(_6915.z)), _2421, level(0.0));
        _2479 = _2481;
    }
    float _2483 = _2479;
    float3 _6925 = float3(_2475, _2477, _2261);
    float _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6925, float3(0.0), isnan(_6925)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6925, float3(0.0), isnan(_6925)), level(0.0)).x;
    float3 _6934 = float3(_2475, _2477, _2261);
    float4 _2488 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).xyzw;
    float _2490 = _2488.x;
    float _2492 = _2488.y;
    float _2494 = _2488.z;
    float _2496 = _2488.w;
    float2 _6950 = float2(_2445, _2441);
    float3 _2500 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6950, float2(0.0), isnan(_6950)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6950, float2(0.0), isnan(_6950)), level(0.0)).xyz;
    float _2502 = _2500.x;
    float _2504 = _2500.y;
    float _2506 = _2500.z;
    float _2508 = _2439;
    if (!_2017)
    {
        float3 _6971 = float3(_2439, _2231, float(as_type<int>(_2457)));
        float3 _6973 = select(_6971, float3(0.0), isnan(_6971));
        float _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6973.xy, uint(rint(_6973.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6973.xy, uint(rint(_6973.z)), level(0.0)).x;
        _2508 = _2510;
    }
    float _2512 = _2508;
    float _2514 = abs(_1850);
    float _2516 = log2(_2514);
    out.m_101.x = _1758;
    out.m_101.y = _1754;
    out.m_101.z = _1762;
    bool _2518 = _1850 <= 8000.0;
    bool _2520 = isnan(_1850);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(8000.0);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2532 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2534 = fma(_2367, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2536 = exp2(_2530);
    float _2538 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2534);
    float _2540 = fma(_2363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2538);
    float _2542 = fma(_2536, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2544 = precise::clamp(_2542, 0.0, 1.0);
    float _2546 = fma(_2544, -2.0, 3.0);
    float _2548 = _2544 * _2544;
    float _2550 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2552 = _2548 * _2546;
    float _2554 = _2540 + _2401;
    float _2556 = exp2(_2550);
    float _2558 = _2554 * 0.5;
    float _2560 = -_2552;
    float _2562 = _2560 + 1.0;
    out.gl_Position.x = _2417;
    out.gl_Position.y = _2431;
    out.gl_Position.z = _2540;
    out.gl_Position.w = _2401;
    float _2564 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2552);
    float _2566 = _2562;
    float _2568 = _2417;
    if (!_2395)
    {
        _2566 = 1.0;
    }
    float _2570 = _2566;
    out.m_103.z = _2558;
    out.m_103.w = _2401;
    float _2572 = _2528 * _2564;
    float _2574 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2576 = -_2556;
    float _2578 = _2576 + 1.0;
    float _2580 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2582 = _2578;
    float _2584 = _2570;
    if (_2017)
    {
        _2582 = 1.0;
    }
    float _2586 = _2582;
    float _2588 = -_2259;
    float _2590 = _2588 + 1.0;
    float _2592 = _2590 * _2574;
    float _2594 = precise::clamp(_2592, 0.0, 1.0);
    float _2596 = _2586;
    if (_2395)
    {
        bool _2598 = _2483 >= _2421;
        bool _2600 = isnan(_2483);
        bool _2602 = _2598 || _2600;
        bool _2604 = isnan(_2421);
        bool _2606 = _2602 || _2604;
        float _2608 = float(_2606);
        _2584 = _2608;
    }
    float _2610 = _2584;
    if (!_2017)
    {
        int _2612 = _2073 << 4;
        int _2614 = _2612 + 2048;
        uint _2616 = uint(int(uint(_2614) >> uint(2)));
        uint _2618 = uint(int(uint(int(_2616)) >> uint(2)));
        int _2620 = int(_2616) & 3;
        float _2622 = (*spvDescriptorSet0.vp_c15)._m0[int(_2618)][_2620];
        int _2624 = int(_2616) + 1;
        uint _2626 = uint(int(uint(_2624) >> uint(2)));
        int _2628 = _2624 & 3;
        float _2630 = (*spvDescriptorSet0.vp_c15)._m0[int(_2626)][_2628];
        int _2632 = _2614 + 8;
        uint _2634 = uint(int(uint(_2632) >> uint(2)));
        uint _2636 = uint(int(uint(int(_2634)) >> uint(2)));
        int _2638 = int(_2634) & 3;
        float _2640 = (*spvDescriptorSet0.vp_c15)._m0[int(_2636)][_2638];
        int _2642 = int(_2634) + 1;
        uint _2644 = uint(int(uint(_2642) >> uint(2)));
        int _2646 = _2642 & 3;
        float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
        float _2650 = _1804 * _2630;
        float _2652 = fma(_1094, _2622, _2650);
        float _2654 = fma(_1096, _2640, _2652);
        float _2656 = _2654 + _2648;
        float _2658 = precise::clamp(_2656, 0.0, 1.0);
        float _2660 = -_2658;
        float _2662 = _2660 + _2512;
        float _2664 = fma(_2662, 500.0, 1.5);
        float _2666 = exp2(_2664);
        float _2668 = 0.0 + _2666;
        float _2670 = precise::clamp(_2668, 0.0, 1.0);
        _2596 = _2670;
        _2568 = _2640;
        _2433 = _2648;
    }
    float _2672 = _2596;
    float _2674 = _2568;
    float _2676 = _2433;
    float _2678 = _2610 * _2672;
    float _2680 = _2580 * _2485;
    float _2682 = -_2594;
    float _2684 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2686 = -_2580;
    float _2688 = _2686 + 1.0;
    bool _2690 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2692 = isnan(_2019);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2698 = _2694 || _2696;
    float _2700 = _2496 * _2680;
    float _2702 = -_2678;
    float _2704 = fma(_2702, _2684, 1.0);
    float _2706 = precise::clamp(_2704, 0.0, 1.0);
    float _2708 = _2506 * _2680;
    float _2710 = _2496 * _2688;
    float _2712 = fma(_2502, _2700, _2490);
    float _2714 = fma(_2504, _2700, _2492);
    float _2716 = _2706 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2718 = fma(_2496, _2708, _2494);
    out.m_105.x = _2716;
    float _2720 = _2676;
    float _2722 = _2674;
    float _2724 = _2684;
    float _2726 = _2688;
    float _2728 = _2700;
    float _2730 = _2706;
    if (!_2698)
    {
        _2720 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2732 = _2720;
    float _2734 = _2732;
    float _2736 = _2732;
    if (!_2698)
    {
        _2722 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2738 = _2722;
    out.m_107.x = _2712;
    out.m_107.y = _2714;
    out.m_107.z = _2718;
    out.m_107.w = _2710;
    float _2740 = _2738;
    float _2742 = _2738;
    if (!_2698)
    {
        _2724 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2744 = _2724;
    float _2746 = _2744;
    float _2748 = _2744;
    if (!_2698)
    {
        _2726 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2750 = _2726;
    float _2752 = _2750;
    float _2754 = _2750;
    if (!_2698)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2756 = _2728;
    float _2758 = _2756;
    float _2760 = _2756;
    if (!_2698)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2762 = _2730;
    bool _2764 = !_2698;
    float _2766 = _2762;
    float _2768 = _2762;
    if (!_2764)
    {
        bool _2770 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2772 = isnan(_2019);
        bool _2774 = _2770 || _2772;
        bool _2776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2778 = _2774 || _2776;
        if (!_2778)
        {
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2782 = _2019 + _2780;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2786 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2784;
            float _2788 = 1.0 / _2786;
            float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2796 = _2794 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2810 = _2782 * _2788;
            float _2812 = precise::clamp(_2810, 0.0, 1.0);
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = fma(_2812, _2792, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2820 = fma(_2812, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2822 = fma(_2812, _2796, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2824 = fma(_2812, _2800, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2826 = fma(_2812, _2804, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2828 = fma(_2812, _2808, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2742 = _2820;
            _2760 = _2826;
            _2736 = _2818;
            _2754 = _2824;
            _2748 = _2822;
            _2768 = _2828;
            _2830 = true;
        }
        else
        {
            bool _2832 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2834 = isnan(_2019);
            bool _2836 = _2832 || _2834;
            bool _2838 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2840 = _2836 || _2838;
            if (!_2840)
            {
                _2734 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2842 = _2734;
            _2736 = _2842;
            if (!_2840)
            {
                _2740 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2844 = _2740;
            _2742 = _2844;
            if (!_2840)
            {
                _2746 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2846 = _2746;
            _2748 = _2846;
            if (!_2840)
            {
                _2752 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2848 = _2752;
            _2754 = _2848;
            if (!_2840)
            {
                _2758 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2850 = _2758;
            _2760 = _2850;
            if (!_2840)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2852 = _2766;
            bool _2854 = !_2840;
            _2768 = _2852;
            if (!_2854)
            {
                bool _2856 = _2019 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2858 = isnan(_2019);
                bool _2860 = _2856 || _2858;
                bool _2862 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2864 = _2860 || _2862;
                if (!_2864)
                {
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2868 = _2019 + _2866;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2872 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2870;
                    float _2874 = 1.0 / _2872;
                    float _2876 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2878 = _2876 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2886 = _2884 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2890 = _2888 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2896 = _2868 * _2874;
                    float _2898 = precise::clamp(_2896, 0.0, 1.0);
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = fma(_2898, _2878, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2906 = fma(_2898, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2908 = fma(_2898, _2882, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2910 = fma(_2898, _2886, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2912 = fma(_2898, _2890, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2914 = fma(_2898, _2894, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2742 = _2906;
                    _2760 = _2912;
                    _2736 = _2904;
                    _2754 = _2910;
                    _2748 = _2908;
                    _2768 = _2914;
                    _2830 = true;
                }
                else
                {
                    _2742 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2760 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2736 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2754 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2748 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2830 = false;
    float _2916 = _2742;
    float _2918 = _2760;
    float _2920 = _2736;
    float _2922 = _2754;
    float _2924 = _2748;
    float _2926 = _2768;
    float _2928 = fma(_1564, -0.5, 0.5);
    float _2930 = precise::clamp(_2928, 0.0, 1.0);
    float _2932 = -_2916;
    float _2934 = _2932 + _2918;
    float _2936 = -_2920;
    float _2938 = _2936 + _2922;
    float _2940 = -_2924;
    float _2942 = _2940 + _2926;
    bool _2944 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2946 = fma(_2930, _2934, _2916);
    float _2948 = fma(_2930, _2938, _2920);
    float _2950 = fma(_2930, _2942, _2924);
    float _2952 = _2946 * 0.586610972881317138671875;
    out.m_109.x = 0.0;
    float _2954 = fma(_2948, 0.298911988735198974609375, _2952);
    float _2956 = fma(_2950, 0.114477999508380889892578125, _2954);
    float _2958 = -_2956;
    float _2960 = _2948 + _2958;
    float _2962 = -_2956;
    float _2964 = _2946 + _2962;
    float _2966 = -_2956;
    float _2968 = _2950 + _2966;
    float _2970 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2972 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    float _2976 = fma(_2968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2956);
    out.m_61.x = _2970;
    out.m_111.x = _2972;
    out.m_111.y = _2974;
    out.m_111.z = _2976;
    if (!_2944)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2978 = -_1746;
    float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2982 = -_1748;
    float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2986 = -_1750;
    float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2990 = _2980 * _2980;
    float _2992 = fma(_2984, _2984, _2990);
    float _2994 = fma(_2988, _2988, _2992);
    float _2996 = sqrt(_2994);
    float _2998 = rsqrt(_2994);
    float _3000 = -_2996;
    float _3002 = _3000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3004 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3006 = precise::clamp(_3004, 0.0, 1.0);
    float _3008 = _2984 * _2998;
    float _3010 = _2980 * _2998;
    float _3012 = abs(_3006);
    float _3014 = log2(_3012);
    float _3016 = _2988 * _2998;
    float _3018 = _3008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3020 = _1564 * _3010;
    float _3022 = -_3010;
    float _3024 = -_3018;
    float _3026 = fma(_3022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3024);
    float _3028 = fma(_1560, _3008, _3020);
    float _3030 = -_3016;
    float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3026);
    float _3034 = fma(_1576, _3016, _3028);
    float _3036 = precise::clamp(_3034, 0.0, 1.0);
    float _3038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3040 = _3032 + _3038;
    float _3042 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3044 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3046 = precise::clamp(_3044, 0.0, 1.0);
    float _3048 = exp2(_3042);
    float _3050 = _3048 * _3046;
    float _3052 = _3036 * _3050;
    float _3054 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3056 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3058 = _3052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _3054;
    out.m_109.y = _3056;
    out.m_109.z = _3058;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

