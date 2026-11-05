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
    float4 m_79 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2416 = false;
    bool _1256 = false;
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2701 = as_type<float>(_134);
        out.gl_Position.z = _2701;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    if (_148)
    {
        float _156 = float(_118);
        _154 = _156;
    }
    float _158 = _154;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_61.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2769 = as_type<float>(_170);
        out.gl_Position.z = _2769;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_65.w;
    float _174 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_63.x;
    float _188 = in.m_63.y;
    float _190 = in.m_63.z;
    float _192 = in.m_58.x;
    float _194 = in.m_58.y;
    float _196 = in.m_58.z;
    float _198 = 0.0;
    float _200 = _174;
    if (!_184)
    {
        float _202 = _174 * _174;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_184)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_184;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _174 * _220;
        float _230 = exp2(_228);
        float _232 = _226 * 0.693147182464599609375;
        float _234 = 1.0 / _232;
        float _236 = 1.0 / _224;
        float _238 = _230 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _234, _174);
        float _244 = _242 * _236;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_184;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _174 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = fma(_272, _186, _276);
    float _284 = fma(_272, _188, _278);
    float _286 = fma(_272, _190, _280);
    float _288 = fma(_282, _172, _192);
    float _290 = fma(_284, _172, _194);
    float _292 = fma(_286, _172, _196);
    bool _294 = !_274;
    float _312;
    if (!_294)
    {
        float _296 = in.m_67.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_118);
        float _318 = 1.0 / _316;
        float _320 = _152 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_67.w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = _322 + _326;
    float _330 = in.m_67.y;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = in.m_69.x;
    float _342 = in.m_69.y;
    float _344 = in.m_69.z;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _346;
    float _350 = 1.0 / _334;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _354 = _352 != 0;
    float _356 = in.m_67.x;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _360 = _358 != 0;
    float _362 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _364 = in.m_71.x;
    float _366 = 1.0 / _348;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _362);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _384 = _324 > 0.5;
    float _386 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = 1.0 / _370;
    float _390 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _374);
    float _392 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    bool _394 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_322);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _390 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _408 = 1.0 / _338;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = _322 + _410;
    float _414 = _356 + _340;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _416;
    float _420 = _412 * _350;
    float _422 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _414);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _428 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _430;
    float _434 = _344 + _330;
    float _436 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = _322 + _438;
    float _442 = 1.0 / _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _448 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _434);
    float _450 = _440 * _366;
    float _452 = fma(_378, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _428);
    float _456 = 1.0 / _446;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _322 + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _468 = _322 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _470;
    float _474 = _460 * _388;
    float _476 = fma(_464, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _480 = _322 + _478;
    float _482 = fma(_472, _450, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _492;
    float _496 = _480 * _408;
    float _498 = fma(_486, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _500 = _468 * _456;
    bool _502 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _504 = isnan(_322);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = fma(_494, _450, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = _328 * _442;
    bool _526 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _528 = isnan(_322);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -_512;
    float _540 = _538 + 1.0;
    float _542 = fma(_522, _450, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _544 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _546 = isnan(_322);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = fma(_490, _496, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_518, _496, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_382, _496, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = -_554;
    float _566 = _564 + 1.0;
    float _568 = _554 * _540;
    bool _570 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_322);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -_536;
    float _584 = _582 + 1.0;
    float _586 = _536 * _566;
    bool _588 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _590 = isnan(_322);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _604 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _606 = isnan(_322);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _580 * _584;
    float _618 = -_580;
    float _620 = _618 + 1.0;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _630;
    float _634 = -_614;
    float _636 = _634 + 1.0;
    float _638 = -_598;
    float _640 = _638 + 1.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _642;
    float _646 = fma(_418, _524, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _648 = _422 * 7.5;
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _562 + _650;
    float _654 = fma(_602, _474, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _656 = fma(_624, _474, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _658 = fma(_628, _474, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _660 = _614 * _620;
    float _662 = _598 * _636;
    float _664 = fma(_632, _524, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _666 = _404 * _640;
    float _668 = fma(_644, _524, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _670 = in.m_73.x;
    float _672 = in.m_73.y;
    float _674 = in.m_73.z;
    float _676 = _648 * 0.15915493667125701904296875;
    float _678 = _436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _682 = _406 + _680;
    float _684 = _652 * _652;
    float _686 = _498 * _666;
    float _688 = _476 * _666;
    float _690 = _452 * _666;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _678 + _692;
    float _696 = fma(_682, _682, _684);
    float _698 = _676 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = -_404;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _710 = fma(_694, _694, _696);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _716 = fma(_426, _500, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _718 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].x, _686);
    float _720 = fma(_708, _500, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _722 = fma(_714, _500, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _724 = rsqrt(_710);
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].y, _688);
    float _728 = fma(_556, _662, _718);
    float _730 = _448 * 15.0;
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].z, _690);
    float _734 = fma(_558, _662, _726);
    float _736 = _672 * _672;
    float _738 = _700 * 0.07999999821186065673828125;
    float _740 = _730 * 0.15915493667125701904296875;
    float _742 = fma(_560, _662, _732);
    float _744 = fma(_670, _670, _736);
    float _746 = fma(_738, _364, _342);
    float _748 = _740 * 6.283185482025146484375;
    float _750 = sin(_748);
    float _752 = fma(_482, _660, _742);
    float _754 = fma(_674, _674, _744);
    float _756 = fma(_542, _660, _728);
    float _758 = _652 * _724;
    float _760 = _682 * _724;
    float _762 = fma(_514, _660, _734);
    float _764 = _694 * _724;
    float _766 = -_758;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _652);
    float _770 = rsqrt(_754);
    float _772 = -_760;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _776 = in.m_65.x;
    float _778 = in.m_65.y;
    float _780 = in.m_65.z;
    float _782 = _768 * _768;
    float _784 = fma(_654, _616, _756);
    float _786 = -_764;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _790 = fma(_656, _616, _762);
    float _792 = fma(_774, _774, _782);
    float _794 = fma(_658, _616, _752);
    float _796 = fma(_664, _586, _784);
    float _798 = fma(_646, _586, _790);
    float _800 = fma(_788, _788, _792);
    float _802 = _750 * 0.02999999932944774627685546875;
    float _804 = fma(_668, _586, _794);
    float _806 = fma(_720, _568, _796);
    float _808 = fma(_716, _568, _798);
    float _810 = in.m_75.y;
    float _812 = _770 * _802;
    float _814 = fma(_722, _568, _804);
    float _816 = sqrt(_800);
    float _818 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].x, _806);
    float _820 = fma(_670, _812, _340);
    float _822 = fma(_672, _812, _746);
    float _824 = fma(_674, _812, _344);
    float _826 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].z, _814);
    float _828 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].y, _808);
    float _830 = _818 * _776;
    float _832 = in.m_77.x;
    float _834 = in.m_77.y;
    float _836 = in.m_77.z;
    float _838 = in.m_77.w;
    float _840 = _826 * _780;
    float _842 = _828 * _778;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _846 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _850 = _668;
    float _852 = _670;
    float _854 = _674;
    float _856 = _672;
    float _858 = _820;
    float _860 = _824;
    float _862 = _688;
    float _864 = _700;
    if (_354)
    {
        float _866 = in.m_67.z;
        _850 = _866;
    }
    float _868 = _850;
    float _870 = _724 * _816;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _824);
    float _874 = in.m_75.x;
    float _876 = _870 * _844;
    float _878 = _870 * _848;
    float _880 = _870 * _846;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _884 = -_810;
    float _886 = _884 + 1.0;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _890 = _882 * _878;
    float _892 = _888 * _876;
    float _894 = _810;
    float _896 = _892;
    if (_360)
    {
        float _898 = _384 ? _886 : _810;
        _894 = _898;
    }
    float _900 = _894;
    float _902 = _872 * _880;
    float _904 = _834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _906 = _834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _908 = _890 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _910 = _890 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _912 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _914 = _670 * _836;
    float _916 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[9].x, _904);
    float _918 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[10].x, _906);
    float _920 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[8].x, _908);
    float _922 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[10].x, _910);
    float _924 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[8].x, _912);
    float _926 = -_914;
    float _928 = fma(_674, _832, _926);
    float _930 = _672 * _832;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _936 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _938 = -_930;
    float _940 = fma(_670, _834, _938);
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = _406 + _934;
    float _946 = _678 + _936;
    bool _948 = _868 > 0.5;
    bool _950 = _948 && _354;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _944 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _946 + _958;
    float _962 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _956 * _956;
    float _968 = _960 * _960;
    float _970 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _674 * _834;
    float _974 = _928 * _838;
    float _976 = _966 + _968;
    bool _978 = _822 != 0.0;
    bool _980 = isnan(_822);
    bool _982 = _978 || _980;
    bool _984 = isnan(0.0);
    bool _986 = _982 || _984;
    float _988 = -_972;
    float _990 = fma(_672, _836, _988);
    float _992 = _834;
    float _994 = _874;
    if (!_354)
    {
        _992 = _874;
    }
    float _996 = _992;
    float _998 = sqrt(_976);
    out.m_79.x = _962;
    out.m_79.y = _964;
    out.m_79.z = _970;
    float _1000 = _996;
    if (_950)
    {
        float _1002 = -_874;
        float _1004 = _1002 + 1.0;
        _994 = _1004;
    }
    float _1006 = _994;
    bool _1008 = _820 == 0.0;
    bool _1010 = !_986;
    bool _1012 = _1008 && _1010;
    float _1014 = _990 * _838;
    float _1016 = _940 * _838;
    float _1018 = _1016;
    if (_354)
    {
        _1000 = _1006;
    }
    float _1020 = _1000;
    bool _1022 = _824 == 0.0;
    bool _1024 = _1022 && _1012;
    float _1026 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _924);
    float _1028 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _1030 = _974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1032 = _974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1034 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].z, _918);
    float _1036 = _974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = _890 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1040 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1030);
    float _1044 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1032);
    float _1046 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1048 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1038);
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1052 = _1038;
    if (_1024)
    {
        _896 = _672;
    }
    float _1054 = _896;
    float _1056 = _1054;
    if (!_1024)
    {
        float _1058 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _670);
        _852 = _1058;
    }
    float _1060 = _852;
    float _1062 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1048);
    float _1064 = _1062;
    if (!_1024)
    {
        float _1066 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _672);
        _1056 = _1066;
    }
    float _1068 = _1056;
    if (!_1024)
    {
        float _1070 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[17].y, _674);
        _854 = _1070;
    }
    float _1072 = _854;
    float _1074 = _562 + _1062;
    if (!_1040)
    {
        _1052 = _968;
    }
    float _1076 = _1052;
    float _1078 = _1076;
    if (!_1040)
    {
        _856 = _966;
    }
    float _1080 = _856;
    float _1082 = _1080;
    if (!_1040)
    {
        _1064 = _944;
    }
    float _1084 = _1064;
    float _1086 = _1084;
    if (!_1040)
    {
        _858 = _946;
    }
    float _1088 = _858;
    float _1090 = _1088;
    if (!_1040)
    {
        _860 = _1074;
    }
    float _1092 = _860;
    bool _1094 = !_1040;
    float _1096 = _1092;
    if (!_1094)
    {
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1102 = _998 + _1100;
        float _1104 = _1074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = rsqrt(_976);
        float _1108 = _1102 * _1098;
        float _1110 = _1108 * 0.15915493667125701904296875;
        float _1112 = _1110 * 6.283185482025146484375;
        float _1114 = sin(_1112);
        float _1116 = _1110 * 6.283185482025146484375;
        float _1118 = cos(_1116);
        float _1120 = fma(_1114, _1104, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = _1106 * _1120;
        float _1124 = _1118 + (-1.0);
        float _1126 = fma(_956, _1122, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1128 = fma(_960, _1122, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1130 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1134 = _1126 + _1132;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1138 = _1128 + _1136;
        float _1140 = fma(_1074, _1118, _1130);
        float _1142 = _1134 * _1134;
        float _1144 = _1138 * _1138;
        _1096 = _1140;
        _1082 = _1142;
        _1078 = _1144;
        _1086 = _1126;
        _1090 = _1128;
    }
    float _1146 = _1096;
    float _1148 = _1082;
    float _1150 = _1078;
    float _1152 = _1086;
    float _1154 = _1090;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1158 = _1146 + _1156;
    float _1160 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1162 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1164 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1168 = fma(_1158, _1158, _1148);
    float _1170 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1160);
    float _1172 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1162);
    float _1174 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1164);
    float _1176 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1178 = _1168 + _1150;
    float _1180 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1184 = _1176 * _1050;
    float _1186 = sqrt(_1178);
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1192 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1194 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1172);
    float _1196 = _1180 * _1166;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1202 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1204 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1042);
    float _1206 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1044);
    float _1208 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1046);
    float _1210 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1174);
    out.m_81.x = _1198;
    out.m_81.y = _1200;
    out.m_81.z = _1202;
    bool _1212 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1214 = isnan(_1186);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1220 = _1216 || _1218;
    out.m_83.x = _1026;
    out.m_83.y = _1028;
    out.m_83.z = _1034;
    out.m_85.x = _1204;
    out.m_85.y = _1206;
    out.m_85.z = _1208;
    out.m_87.z = _1196;
    out.m_87.w = _1184;
    out.m_89.x = _1192;
    out.m_89.y = _1194;
    out.m_89.z = _1210;
    if (!_1220)
    {
        _1018 = 1.0;
    }
    float _1222 = _1018;
    bool _1224 = !_1220;
    float _1226 = _1222;
    if (!_1224)
    {
        bool _1228 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1230 = isnan(_1186);
        bool _1232 = _1228 || _1230;
        bool _1234 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1236 = _1232 || _1234;
        if (!_1236)
        {
            float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1240 = _1186 + _1238;
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1244 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1242;
            float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1248 = _1246 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1250 = 1.0 / _1244;
            float _1252 = _1240 * _1250;
            float _1254 = fma(_1252, _1248, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1226 = _1254;
            _1256 = true;
        }
        else
        {
            bool _1258 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1260 = isnan(_1186);
            bool _1262 = _1258 || _1260;
            bool _1264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1266 = _1262 || _1264;
            if (!_1266)
            {
                float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1270 = _1186 + _1268;
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1280 = 1.0 / _1274;
                float _1282 = _1270 * _1280;
                float _1284 = fma(_1282, _1278, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1226 = _1284;
                _1256 = true;
            }
            else
            {
                _1226 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1256 = false;
    float _1286 = _1226;
    float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1290 = _1146 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1294 = _1152 + _1292;
    float _1296 = -_760;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
    float _1300 = -_764;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _1304 = fma(_1290, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1308 = _1154 + _1306;
    float _1310 = fma(_1294, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1312 = -_758;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1316 = fma(_1308, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1318 = -_760;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1310);
    float _1322 = -_758;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1328 = _1314 + _1326;
    float _1330 = -_764;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1336 = _1320 + _1334;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1340 = _1328 * _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1338);
    float _1348 = fma(_1336, _1336, _1340);
    float _1350 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1346);
    float _1352 = fma(_1344, _1344, _1348);
    float _1354 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1356 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1358 = rsqrt(_1352);
    float _1360 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1362 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1360);
    float _1364 = 1.0 / _1356;
    float _1366 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1362);
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1370 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1372 = _1368 + _1356;
    float _1374 = floor(_1354);
    float _1376 = _1336 * _1370;
    float _1378 = _1344 * _1370;
    float _1380 = _1376 * _1376;
    float _1382 = _1378 * _1378;
    float _1384 = _1372 * _1364;
    float _1386 = _1384 * 0.5;
    float _1388 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1390 = sqrt(_1352);
    float _1392 = _1380 + _1382;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1396 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1394);
    float _1398 = _1324 + _1388;
    float _1400 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1402 = sqrt(_1392);
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1406 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1400);
    float _1408 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1404);
    float _1410 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1406);
    float _1412 = 1.0 / _1396;
    float _1414 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1408);
    float _1416 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1418 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1420 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1422 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1424 = trunc(_1416);
    int _1426 = int(_1424);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1412 * _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1434 = _1402 + _1432;
    float _1436 = trunc(_1418);
    int _1438 = int(_1436);
    bool _1440 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1442 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1444 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1446 = _1364;
    int _1448 = 2;
    float _1450 = _1370;
    float _1452 = _1434;
    float _1454 = _1376;
    float _1456 = _1380;
    int _1458 = as_type<int>(_1374);
    if (_1420)
    {
        float _1460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1446 = _1460;
    }
    float _1462 = _1446;
    int _1464 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1466 = _1426 + _1464;
    int _1468 = _1466 + 1;
    float _1470 = precise::max(0.0, _1444);
    int _1472 = _1468;
    if (!_1440)
    {
        _1448 = 1;
    }
    int _1474 = _1448;
    float _1476 = floor(_1422);
    int _1478 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1480 = _1438 + _1478;
    int _1482 = _1480 + 1;
    float _1484 = -_1370;
    float _1486 = -_1470;
    float _1488 = fma(_1328, _1484, _1486);
    int _1490 = _1474;
    float _1492 = _1488;
    if (_1420)
    {
        float _1494 = _1488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1450 = _1494;
    }
    float _1496 = _1450;
    float _1498 = _1462;
    if (_1420)
    {
        float _1500 = _1434 * _1462;
        _1452 = _1500;
    }
    float _1502 = _1452;
    if (_1420)
    {
        float _1504 = rsqrt(_1392);
        _862 = _1504;
    }
    float _1506 = _862;
    float _1508 = _1506;
    if (_1420)
    {
        float _1510 = _1502 * 0.15915493667125701904296875;
        _1498 = _1510;
    }
    float _1512 = _1498;
    bool _1514 = !_1440;
    int _1516 = _1514 ? 0 : 1;
    if (!_1442)
    {
        _1490 = _1516;
    }
    int _1518 = _1490;
    float _1520 = _1414;
    if (_1420)
    {
        float _1522 = _1512 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = -_1476;
    float _1530 = _1422 + _1528;
    bool _1532 = _1468 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1534 = _1518 << 6;
    int _1536 = _1468 | _1482;
    int _1538 = _1534 + 48;
    uint _1541 = uint(int(uint(_1538) >> uint(2)));
    uint _1543 = uint(int(uint(int(_1541)) >> uint(2)));
    int _1545 = int(_1541) & 3;
    float _1547 = (*spvDescriptorSet0.vp_c15)._m0[int(_1543)][_1545];
    int _1549 = int(_1541) + 1;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    int _1553 = _1549 & 3;
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
    float _1557 = _968;
    if (_1420)
    {
        float _1559 = _1512 * 6.283185482025146484375;
        float _1561 = cos(_1559);
        _1557 = _1561;
    }
    float _1563 = _1557;
    bool _1565 = _1536 < 0;
    bool _1567 = _1565 || _1532;
    bool _1569 = _1482 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1571 = _1569 || _1567;
    int _1573 = _1534 + 64;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    uint _1577 = uint(int(uint(int(_1575)) >> uint(2)));
    int _1579 = int(_1575) & 3;
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
    int _1583 = int(_1575) + 1;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    int _1587 = _1583 & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    float _1591 = 0.0;
    if (_1420)
    {
        float _1593 = fma(_1526, _1496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1591 = _1593;
    }
    float _1595 = _1591;
    float _1597 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1420)
    {
        float _1599 = _1506 * _1595;
        _1508 = _1599;
    }
    float _1601 = _1508;
    float _1603 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1597);
    int _1605 = _1534 + 96;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    float _1623 = _1563;
    if (_1420)
    {
        float _1625 = _1563 + (-1.0);
        _864 = _1625;
    }
    float _1627 = _864;
    float _1629 = _1627;
    if (_1420)
    {
        float _1631 = _1376 * _1601;
        _1454 = _1631;
    }
    float _1633 = _1454;
    float _1635 = _1595;
    if (!_1571)
    {
        float _1637 = floor(_1418);
        _1635 = _1637;
    }
    float _1639 = _1635;
    if (!_1571)
    {
        int _1641 = _1482 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1643 = _1641 + _1468;
        _1472 = _1643;
    }
    int _1645 = _1472;
    if (_1420)
    {
        float _1647 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1647;
    }
    float _1649 = _1629;
    if (_1420)
    {
        float _1651 = _1633 * _1633;
        _1456 = _1651;
    }
    float _1653 = _1456;
    int _1655 = _1534 + 104;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = as_type<int>(_1653);
    if (_1420)
    {
        float _1675 = fma(_1488, _1563, _1649);
        _1492 = _1675;
    }
    float _1677 = _1492;
    float _1679 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1603);
    float _1681 = _1679;
    if (!_1420)
    {
        _1623 = _1378;
    }
    float _1683 = _1623;
    float _1685 = _1683;
    if (_1420)
    {
        float _1687 = _1378 * _1601;
        _1685 = _1687;
    }
    float _1689 = _1685;
    float _1691 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1420)
    {
        _1681 = _1382;
    }
    float _1693 = _1681;
    int _1695 = _1534 + 80;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    uint _1699 = uint(int(uint(int(_1697)) >> uint(2)));
    int _1701 = int(_1697) & 3;
    float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
    int _1705 = int(_1697) + 1;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    int _1709 = _1705 & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    float _1713 = -_1374;
    float _1715 = _1354 + _1713;
    float _1717 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1719 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1721 = _1693;
    int _1723 = as_type<int>(_1719);
    if (!_1571)
    {
        int _1725 = _1645 << 2;
        _1458 = _1725;
    }
    int _1727 = _1458;
    if (_1420)
    {
        float _1729 = _1689 * _1689;
        _1721 = _1729;
    }
    float _1731 = _1721;
    float _1733 = fma(_1677, _1677, _1653);
    float _1735 = -_1719;
    float _1737 = fma(_1735, _1717, 1.0);
    int _1739 = _1534 + 56;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    uint _1743 = uint(int(uint(int(_1741)) >> uint(2)));
    int _1745 = int(_1741) & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    int _1749 = int(_1741) + 1;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    int _1753 = _1749 & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    if (!_1571)
    {
        int _1757 = 12 & _1727;
        _1723 = _1757;
    }
    int _1759 = _1723;
    float _1761 = _1733 + _1731;
    float _1763 = log2(_1737);
    if (!_1571)
    {
        uint _1765 = uint(int(uint(_1645) >> uint(2)));
        _1673 = int(_1765);
    }
    int _1767 = _1673;
    int _1769 = _1534 + 72;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
    int _1775 = int(_1771) & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    int _1779 = int(_1771) + 1;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    int _1783 = _1779 & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    float _1787 = _1398 * _1555;
    float _1789 = _1555;
    int _1791 = _1767;
    if (!_1571)
    {
        float _1793 = -_1639;
        float _1795 = _1418 + _1793;
        _1789 = _1795;
    }
    float _1797 = _1789;
    if (!_1571)
    {
        int _1799 = _1767 << 4;
        int _1801 = _1799 + _1759;
        _1791 = _1801;
    }
    int _1803 = _1791;
    float _1805 = fma(_1298, _1547, _1787);
    float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1809 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1807);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = rsqrt(_1761);
    int _1815 = _1534 + 88;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1398 * _1589;
    float _1835 = _1398 * _1621;
    float _1837 = fma(_1298, _1613, _1835);
    float _1839 = -_1811;
    float _1841 = _1839 + 1.0;
    float _1843 = _1813 * _1633;
    float _1845 = fma(_1302, _1663, _1837);
    float _1847 = _1813 * _1677;
    float _1849 = _1813 * _1689;
    float _1851 = abs(_1841);
    float _1853 = log2(_1851);
    float _1855 = _1845 + _1671;
    float _1857 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float2 _5609 = float2(_1530, _1715);
    float _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5609, float2(0.0), isnan(_5609)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5609, float2(0.0), isnan(_5609)), level(0.0)).x;
    float _1861 = _1813;
    float _1863 = _1837;
    if (!_1571)
    {
        int _1865 = _1803 + 400;
        uint _1867 = uint(int(uint(_1865) >> uint(2)));
        uint _1869 = uint(int(uint(int(_1867)) >> uint(2)));
        int _1871 = int(_1867) & 3;
        float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
        _1861 = _1873;
    }
    float _1875 = _1861;
    float _1877 = _1398 * _1711;
    float _1879 = fma(_1298, _1581, _1833);
    float _1881 = -_1857;
    float _1883 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1881);
    float _1885 = 1.0 / _1855;
    float _1887 = fma(_1298, _1703, _1877);
    float _1889 = -_1849;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1883);
    float _1893 = fma(_1302, _1747, _1805);
    float _1895 = fma(_1891, -0.5, 0.5);
    if (!_1571)
    {
        float _1897 = floor(_1416);
        _1863 = _1897;
    }
    float _1899 = _1863;
    float _1901 = _1893 + _1755;
    float _1903 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1905 = fma(_1891, 0.5, 0.5);
    float _1907 = fma(_1302, _1777, _1879);
    float _1909 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1911 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1903);
    float _1913 = sqrt(_1895);
    float _1915 = _1907 + _1785;
    float _1917 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1919 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1909);
    float _1921 = _1901 * _1885;
    float _1923 = _1915 * _1885;
    float _1925 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1927 = fma(_1302, _1823, _1887);
    float _1929 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1911);
    bool _1931 = _1921 >= 0.0;
    float _1933 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1925);
    float _1935 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1939 = _1921 <= 1.0;
    bool _1941 = _1939 && _1931;
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1945 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1947 = exp2(_1935);
    bool _1949 = _1923 >= 0.0;
    bool _1951 = _1949 && _1941;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1955 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1957 = _1927 + _1831;
    bool _1959 = _1923 <= 1.0;
    bool _1961 = _1959 && _1951;
    float _1963 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1953);
    float _1965 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1967 = _1847 + 1.0;
    float _1969 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1971 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1963);
    float _1973 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1965);
    float _1975 = fma(_1905, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1977 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1969);
    float _1979 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1971);
    float _1981 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1973);
    float _1983 = -_1847;
    float _1985 = fma(_1947, _1967, _1983);
    float _1987 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1977);
    float _1989 = 1.0 / _1979;
    float _1991 = _1971;
    float _1993 = _1977;
    float _1995 = _1979;
    if (_1961)
    {
        float _1997 = float(_1518);
        _1991 = _1997;
    }
    float _1999 = _1991;
    float _2001 = fma(_1905, _1975, -0.212114393711090087890625);
    float _2003 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1981);
    float _2005 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1987);
    if (!_1571)
    {
        float _2007 = -_1899;
        float _2009 = _1416 + _2007;
        _1993 = _2009;
    }
    float _2011 = _1993;
    float _2013 = _1763 * 0.693147182464599609375;
    float _2015 = fma(_1905, _2001, 1.570728778839111328125);
    float _2017 = _1999;
    float _2019 = _2011;
    if (_1961)
    {
        float _2021 = rint(_1999);
        float _2023 = precise::max(_2021, 0.0);
        uint _2025 = uint(_2023);
        uint _2027 = clamp(_2025, 0u, 65535u);
        _2017 = as_type<float>(_2027);
    }
    float _2029 = _2017;
    float _2031 = _1913 * 0.636619746685028076171875;
    float _2033 = _1957 * _1885;
    float _2035 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2037 = fma(_1985, 0.5, 0.5);
    float _2039 = -_2015;
    float _2041 = fma(_2031, _2039, 1.0);
    float _2043 = _2003 * _1989;
    float _2045 = _2005 * _1989;
    float _2047 = _2013;
    if (!_1571)
    {
        float _2049 = rint(_1875);
        float _2051 = precise::max(_2049, 0.0);
        uint _2053 = uint(_2051);
        uint _2055 = clamp(_2053, 0u, 65535u);
        _2047 = as_type<float>(_2055);
    }
    float _2057 = _2047;
    float _2059 = fma(_2043, 0.5, 0.5);
    float _2061 = fma(_2045, -0.5, 0.5);
    float _2063 = _2029;
    if (_1961)
    {
        float3 _5960 = float3(_1921, _1923, float(as_type<int>(_2029)));
        float3 _5964 = select(_5960, float3(0.0), isnan(_5960));
        float _2065 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5964.xy, uint(rint(_5964.z)), _2033, level(0.0));
        _2063 = _2065;
    }
    float _2067 = _2063;
    float3 _5974 = float3(_2059, _2061, _2035);
    float _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5974, float3(0.0), isnan(_5974)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5974, float3(0.0), isnan(_5974)), level(0.0)).x;
    float3 _5983 = float3(_2059, _2061, _2035);
    float4 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5983, float3(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5983, float3(0.0), isnan(_5983)), level(0.0)).xyzw;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = _2072.w;
    float2 _5999 = float2(_2041, _2037);
    float3 _2084 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5999, float2(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5999, float2(0.0), isnan(_5999)), level(0.0)).xyz;
    float _2086 = _2084.x;
    float _2088 = _2084.y;
    float _2090 = _2084.z;
    float _2092 = _2057;
    if (!_1571)
    {
        float3 _6020 = float3(_2011, _1797, float(as_type<int>(_2057)));
        float3 _6022 = select(_6020, float3(0.0), isnan(_6020));
        float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6022.xy, uint(rint(_6022.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6022.xy, uint(rint(_6022.z)), level(0.0)).x;
        _2092 = _2094;
    }
    float _2096 = _2092;
    float _2098 = abs(_1430);
    float _2100 = log2(_2098);
    float _2102 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2104 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2102);
    float _2106 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2104);
    float _2108 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2110 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2106);
    float _2112 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = _2110 + _1979;
    float _2116 = exp2(_2108);
    bool _2118 = _1430 <= 8000.0;
    bool _2120 = isnan(_1430);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(8000.0);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _2114 * 0.5;
    float _2132 = _2110;
    if (!_1961)
    {
        _2019 = 1.0;
    }
    float _2134 = _2019;
    float _2136 = exp2(_2112);
    out.m_91.z = _2130;
    out.m_91.w = _1979;
    float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = fma(_2140, -2.0, 3.0);
    float _2144 = _2140 * _2140;
    float _2146 = _2144 * _2142;
    float _2148 = -_2146;
    float _2150 = _2148 + 1.0;
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2005;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1979;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2146);
    float _2154 = -_2116;
    float _2156 = _2154 + 1.0;
    float _2158 = _2128 * _2152;
    float _2160 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2164 = _2003;
    float _2166 = _2134;
    float _2168 = _2156;
    float _2170 = _2162;
    if (_1571)
    {
        _2164 = 1.0;
    }
    float _2172 = _2164;
    float _2174 = -_1859;
    float _2176 = _2174 + 1.0;
    float _2178 = _2176 * _2160;
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    float _2182 = _2172;
    if (_1961)
    {
        bool _2184 = _2067 >= _2033;
        bool _2186 = isnan(_2067);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan(_2033);
        bool _2192 = _2188 || _2190;
        float _2194 = float(_2192);
        _2166 = _2194;
    }
    float _2196 = _2166;
    if (!_1571)
    {
        int _2198 = _1645 << 4;
        int _2200 = _2198 + 2048;
        uint _2202 = uint(int(uint(_2200) >> uint(2)));
        uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
        int _2206 = int(_2202) & 3;
        float _2208 = (*spvDescriptorSet0.vp_c15)._m0[int(_2204)][_2206];
        int _2210 = int(_2202) + 1;
        uint _2212 = uint(int(uint(_2210) >> uint(2)));
        int _2214 = _2210 & 3;
        float _2216 = (*spvDescriptorSet0.vp_c15)._m0[int(_2212)][_2214];
        int _2218 = _2200 + 8;
        uint _2220 = uint(int(uint(_2218) >> uint(2)));
        uint _2222 = uint(int(uint(int(_2220)) >> uint(2)));
        int _2224 = int(_2220) & 3;
        float _2226 = (*spvDescriptorSet0.vp_c15)._m0[int(_2222)][_2224];
        int _2228 = int(_2220) + 1;
        uint _2230 = uint(int(uint(_2228) >> uint(2)));
        int _2232 = _2228 & 3;
        float _2234 = (*spvDescriptorSet0.vp_c15)._m0[int(_2230)][_2232];
        float _2236 = _1398 * _2216;
        float _2238 = fma(_1298, _2208, _2236);
        float _2240 = fma(_1302, _2226, _2238);
        float _2242 = _2240 + _2234;
        float _2244 = precise::clamp(_2242, 0.0, 1.0);
        float _2246 = -_2244;
        float _2248 = _2246 + _2096;
        float _2250 = fma(_2248, 500.0, 1.5);
        float _2252 = exp2(_2250);
        float _2254 = 0.0 + _2252;
        float _2256 = precise::clamp(_2254, 0.0, 1.0);
        _2182 = _2256;
        _1995 = _2216;
        _2168 = _2226;
        _2132 = _2208;
    }
    float _2258 = _2182;
    float _2260 = _1995;
    float _2262 = _2168;
    float _2264 = _2132;
    float _2266 = _2196 * _2258;
    float _2268 = _2162 * _2069;
    float _2270 = -_2180;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2274 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2276 = isnan(_1390);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2282 = _2278 || _2280;
    float _2284 = _2080 * _2268;
    float _2286 = -_2266;
    float _2288 = fma(_2286, _2272, 1.0);
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = _2090 * _2268;
    float _2294 = -_2162;
    float _2296 = _2294 + 1.0;
    float _2298 = fma(_2086, _2284, _2074);
    float _2300 = fma(_2088, _2284, _2076);
    float _2302 = _2290 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2304 = _2080 * _2296;
    float _2306 = fma(_2080, _2292, _2078);
    out.m_93.x = _2302;
    float _2308 = _2262;
    float _2310 = _2260;
    float _2312 = _2264;
    float _2314 = _2296;
    float _2316 = _2290;
    if (!_2282)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2318 = _2308;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2282)
    {
        _2310 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2324 = _2310;
    out.m_95.x = _2298;
    out.m_95.y = _2300;
    out.m_95.z = _2306;
    out.m_95.w = _2304;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2282)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2330 = _2312;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2282)
    {
        _2170 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2336 = _2170;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2282)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2342 = _2314;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2282)
    {
        _2316 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2348 = _2316;
    bool _2350 = !_2282;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2350)
    {
        bool _2356 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2358 = isnan(_1390);
        bool _2360 = _2356 || _2358;
        bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2364 = _2360 || _2362;
        if (!_2364)
        {
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2368 = _1390 + _2366;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2370;
            float _2374 = 1.0 / _2372;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2396 = _2368 * _2374;
            float _2398 = precise::clamp(_2396, 0.0, 1.0);
            float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2406;
            _2346 = _2412;
            _2322 = _2404;
            _2340 = _2410;
            _2334 = _2408;
            _2354 = _2414;
            _2416 = true;
        }
        else
        {
            bool _2418 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2420 = isnan(_1390);
            bool _2422 = _2418 || _2420;
            bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2426 = _2422 || _2424;
            if (!_2426)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2428 = _2320;
            _2322 = _2428;
            if (!_2426)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2430 = _2326;
            _2328 = _2430;
            if (!_2426)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2432 = _2332;
            _2334 = _2432;
            if (!_2426)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2434 = _2338;
            _2340 = _2434;
            if (!_2426)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2436 = _2344;
            _2346 = _2436;
            if (!_2426)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2438 = _2352;
            bool _2440 = !_2426;
            _2354 = _2438;
            if (!_2440)
            {
                bool _2442 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2444 = isnan(_1390);
                bool _2446 = _2442 || _2444;
                bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2450 = _2446 || _2448;
                if (!_2450)
                {
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2454 = _1390 + _2452;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2456;
                    float _2460 = 1.0 / _2458;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2482 = _2454 * _2460;
                    float _2484 = precise::clamp(_2482, 0.0, 1.0);
                    float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2492;
                    _2346 = _2498;
                    _2322 = _2490;
                    _2340 = _2496;
                    _2334 = _2494;
                    _2354 = _2500;
                    _2416 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2416 = false;
    float _2502 = _2328;
    float _2504 = _2346;
    float _2506 = _2322;
    float _2508 = _2340;
    float _2510 = _2334;
    float _2512 = _2354;
    float _2514 = fma(_1194, -0.5, 0.5);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    float _2522 = -_2506;
    float _2524 = _2522 + _2508;
    float _2526 = -_2510;
    float _2528 = _2526 + _2512;
    bool _2530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2532 = fma(_2516, _2520, _2502);
    float _2534 = fma(_2516, _2524, _2506);
    float _2536 = fma(_2516, _2528, _2510);
    float _2538 = _2532 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2540 = fma(_2534, 0.298911988735198974609375, _2538);
    float _2542 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2544 = fma(_2536, 0.114477999508380889892578125, _2540);
    out.m_93.w = _2542;
    float _2546 = -_2544;
    float _2548 = _2534 + _2546;
    float _2550 = -_2544;
    float _2552 = _2532 + _2550;
    float _2554 = -_2544;
    float _2556 = _2536 + _2554;
    out.m_97.x = 0.0;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    out.m_99.x = _2558;
    out.m_99.y = _2560;
    out.m_99.z = _2562;
    if (!_2530)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2564 = -_1314;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2568 = -_1320;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2572 = -_1332;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2576 = _2566 * _2566;
    float _2578 = fma(_2570, _2570, _2576);
    float _2580 = fma(_2574, _2574, _2578);
    float _2582 = sqrt(_2580);
    float _2584 = rsqrt(_2580);
    float _2586 = -_2582;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = _2570 * _2584;
    float _2596 = _2566 * _2584;
    float _2598 = abs(_2592);
    float _2600 = log2(_2598);
    float _2602 = _2574 * _2584;
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2606 = _1194 * _2596;
    float _2608 = -_2596;
    float _2610 = -_2604;
    float _2612 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2610);
    float _2614 = fma(_1192, _2594, _2606);
    float _2616 = -_2602;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2612);
    float _2620 = fma(_1210, _2602, _2614);
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2626 = _2618 + _2624;
    float _2628 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2630 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = exp2(_2628);
    float _2636 = _2634 * _2632;
    float _2638 = _2622 * _2636;
    float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2642 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2644 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2640;
    out.m_97.y = _2642;
    out.m_97.z = _2644;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2416 = false;
    bool _1256 = false;
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2701 = as_type<float>(_134);
        out.gl_Position.z = _2701;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    if (_148)
    {
        float _156 = float(_118);
        _154 = _156;
    }
    float _158 = _154;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_61.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2769 = as_type<float>(_170);
        out.gl_Position.z = _2769;
    }
    if (_164)
    {
        return out;
    }
    float _172 = in.m_65.w;
    float _174 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_63.x;
    float _188 = in.m_63.y;
    float _190 = in.m_63.z;
    float _192 = in.m_58.x;
    float _194 = in.m_58.y;
    float _196 = in.m_58.z;
    float _198 = 0.0;
    float _200 = _174;
    if (!_184)
    {
        float _202 = _174 * _174;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_184)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_184;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _174 * _220;
        float _230 = exp2(_228);
        float _232 = _226 * 0.693147182464599609375;
        float _234 = 1.0 / _232;
        float _236 = 1.0 / _224;
        float _238 = _230 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _234, _174);
        float _244 = _242 * _236;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_184;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _174 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = fma(_272, _186, _276);
    float _284 = fma(_272, _188, _278);
    float _286 = fma(_272, _190, _280);
    float _288 = fma(_282, _172, _192);
    float _290 = fma(_284, _172, _194);
    float _292 = fma(_286, _172, _196);
    bool _294 = !_274;
    float _312;
    if (!_294)
    {
        float _296 = in.m_67.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_118);
        float _318 = 1.0 / _316;
        float _320 = _152 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_67.w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = _322 + _326;
    float _330 = in.m_67.y;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = in.m_69.x;
    float _342 = in.m_69.y;
    float _344 = in.m_69.z;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _346;
    float _350 = 1.0 / _334;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _354 = _352 != 0;
    float _356 = in.m_67.x;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _360 = _358 != 0;
    float _362 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _364 = in.m_71.x;
    float _366 = 1.0 / _348;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _362);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _384 = _324 > 0.5;
    float _386 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = 1.0 / _370;
    float _390 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _374);
    float _392 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    bool _394 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_322);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _390 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _408 = 1.0 / _338;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = _322 + _410;
    float _414 = _356 + _340;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _416;
    float _420 = _412 * _350;
    float _422 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _414);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _428 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _430;
    float _434 = _344 + _330;
    float _436 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = _322 + _438;
    float _442 = 1.0 / _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _448 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _434);
    float _450 = _440 * _366;
    float _452 = fma(_378, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _428);
    float _456 = 1.0 / _446;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _322 + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _468 = _322 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _470;
    float _474 = _460 * _388;
    float _476 = fma(_464, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _480 = _322 + _478;
    float _482 = fma(_472, _450, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _492;
    float _496 = _480 * _408;
    float _498 = fma(_486, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _500 = _468 * _456;
    bool _502 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _504 = isnan(_322);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = fma(_494, _450, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = _328 * _442;
    bool _526 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _528 = isnan(_322);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -_512;
    float _540 = _538 + 1.0;
    float _542 = fma(_522, _450, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _544 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _546 = isnan(_322);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = fma(_490, _496, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_518, _496, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_382, _496, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = -_554;
    float _566 = _564 + 1.0;
    float _568 = _554 * _540;
    bool _570 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_322);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -_536;
    float _584 = _582 + 1.0;
    float _586 = _536 * _566;
    bool _588 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _590 = isnan(_322);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _604 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _606 = isnan(_322);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _580 * _584;
    float _618 = -_580;
    float _620 = _618 + 1.0;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _630;
    float _634 = -_614;
    float _636 = _634 + 1.0;
    float _638 = -_598;
    float _640 = _638 + 1.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _642;
    float _646 = fma(_418, _524, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _648 = _422 * 7.5;
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _562 + _650;
    float _654 = fma(_602, _474, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _656 = fma(_624, _474, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _658 = fma(_628, _474, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _660 = _614 * _620;
    float _662 = _598 * _636;
    float _664 = fma(_632, _524, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _666 = _404 * _640;
    float _668 = fma(_644, _524, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _670 = in.m_73.x;
    float _672 = in.m_73.y;
    float _674 = in.m_73.z;
    float _676 = _648 * 0.15915493667125701904296875;
    float _678 = _436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _682 = _406 + _680;
    float _684 = _652 * _652;
    float _686 = _498 * _666;
    float _688 = _476 * _666;
    float _690 = _452 * _666;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _678 + _692;
    float _696 = fma(_682, _682, _684);
    float _698 = _676 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = -_404;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _710 = fma(_694, _694, _696);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _716 = fma(_426, _500, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _718 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].x, _686);
    float _720 = fma(_708, _500, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _722 = fma(_714, _500, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _724 = rsqrt(_710);
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].y, _688);
    float _728 = fma(_556, _662, _718);
    float _730 = _448 * 15.0;
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].z, _690);
    float _734 = fma(_558, _662, _726);
    float _736 = _672 * _672;
    float _738 = _700 * 0.07999999821186065673828125;
    float _740 = _730 * 0.15915493667125701904296875;
    float _742 = fma(_560, _662, _732);
    float _744 = fma(_670, _670, _736);
    float _746 = fma(_738, _364, _342);
    float _748 = _740 * 6.283185482025146484375;
    float _750 = sin(_748);
    float _752 = fma(_482, _660, _742);
    float _754 = fma(_674, _674, _744);
    float _756 = fma(_542, _660, _728);
    float _758 = _652 * _724;
    float _760 = _682 * _724;
    float _762 = fma(_514, _660, _734);
    float _764 = _694 * _724;
    float _766 = -_758;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _652);
    float _770 = rsqrt(_754);
    float _772 = -_760;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _776 = in.m_65.x;
    float _778 = in.m_65.y;
    float _780 = in.m_65.z;
    float _782 = _768 * _768;
    float _784 = fma(_654, _616, _756);
    float _786 = -_764;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _790 = fma(_656, _616, _762);
    float _792 = fma(_774, _774, _782);
    float _794 = fma(_658, _616, _752);
    float _796 = fma(_664, _586, _784);
    float _798 = fma(_646, _586, _790);
    float _800 = fma(_788, _788, _792);
    float _802 = _750 * 0.02999999932944774627685546875;
    float _804 = fma(_668, _586, _794);
    float _806 = fma(_720, _568, _796);
    float _808 = fma(_716, _568, _798);
    float _810 = in.m_75.y;
    float _812 = _770 * _802;
    float _814 = fma(_722, _568, _804);
    float _816 = sqrt(_800);
    float _818 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].x, _806);
    float _820 = fma(_670, _812, _340);
    float _822 = fma(_672, _812, _746);
    float _824 = fma(_674, _812, _344);
    float _826 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].z, _814);
    float _828 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].y, _808);
    float _830 = _818 * _776;
    float _832 = in.m_77.x;
    float _834 = in.m_77.y;
    float _836 = in.m_77.z;
    float _838 = in.m_77.w;
    float _840 = _826 * _780;
    float _842 = _828 * _778;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _846 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _850 = _668;
    float _852 = _670;
    float _854 = _674;
    float _856 = _672;
    float _858 = _820;
    float _860 = _824;
    float _862 = _688;
    float _864 = _700;
    if (_354)
    {
        float _866 = in.m_67.z;
        _850 = _866;
    }
    float _868 = _850;
    float _870 = _724 * _816;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _824);
    float _874 = in.m_75.x;
    float _876 = _870 * _844;
    float _878 = _870 * _848;
    float _880 = _870 * _846;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _884 = -_810;
    float _886 = _884 + 1.0;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _890 = _882 * _878;
    float _892 = _888 * _876;
    float _894 = _810;
    float _896 = _892;
    if (_360)
    {
        float _898 = _384 ? _886 : _810;
        _894 = _898;
    }
    float _900 = _894;
    float _902 = _872 * _880;
    float _904 = _834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _906 = _834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _908 = _890 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _910 = _890 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _912 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _914 = _670 * _836;
    float _916 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[9].x, _904);
    float _918 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[10].x, _906);
    float _920 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[8].x, _908);
    float _922 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[10].x, _910);
    float _924 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[8].x, _912);
    float _926 = -_914;
    float _928 = fma(_674, _832, _926);
    float _930 = _672 * _832;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _936 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _938 = -_930;
    float _940 = fma(_670, _834, _938);
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = _406 + _934;
    float _946 = _678 + _936;
    bool _948 = _868 > 0.5;
    bool _950 = _948 && _354;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _944 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _946 + _958;
    float _962 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _956 * _956;
    float _968 = _960 * _960;
    float _970 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _674 * _834;
    float _974 = _928 * _838;
    float _976 = _966 + _968;
    bool _978 = _822 != 0.0;
    bool _980 = isnan(_822);
    bool _982 = _978 || _980;
    bool _984 = isnan(0.0);
    bool _986 = _982 || _984;
    float _988 = -_972;
    float _990 = fma(_672, _836, _988);
    float _992 = _834;
    float _994 = _874;
    if (!_354)
    {
        _992 = _874;
    }
    float _996 = _992;
    float _998 = sqrt(_976);
    out.m_79.x = _962;
    out.m_79.y = _964;
    out.m_79.z = _970;
    float _1000 = _996;
    if (_950)
    {
        float _1002 = -_874;
        float _1004 = _1002 + 1.0;
        _994 = _1004;
    }
    float _1006 = _994;
    bool _1008 = _820 == 0.0;
    bool _1010 = !_986;
    bool _1012 = _1008 && _1010;
    float _1014 = _990 * _838;
    float _1016 = _940 * _838;
    float _1018 = _1016;
    if (_354)
    {
        _1000 = _1006;
    }
    float _1020 = _1000;
    bool _1022 = _824 == 0.0;
    bool _1024 = _1022 && _1012;
    float _1026 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _924);
    float _1028 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _1030 = _974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1032 = _974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1034 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].z, _918);
    float _1036 = _974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = _890 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1040 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1030);
    float _1044 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1032);
    float _1046 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1048 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1038);
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1052 = _1038;
    if (_1024)
    {
        _896 = _672;
    }
    float _1054 = _896;
    float _1056 = _1054;
    if (!_1024)
    {
        float _1058 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _670);
        _852 = _1058;
    }
    float _1060 = _852;
    float _1062 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1048);
    float _1064 = _1062;
    if (!_1024)
    {
        float _1066 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _672);
        _1056 = _1066;
    }
    float _1068 = _1056;
    if (!_1024)
    {
        float _1070 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[17].y, _674);
        _854 = _1070;
    }
    float _1072 = _854;
    float _1074 = _562 + _1062;
    if (!_1040)
    {
        _1052 = _968;
    }
    float _1076 = _1052;
    float _1078 = _1076;
    if (!_1040)
    {
        _856 = _966;
    }
    float _1080 = _856;
    float _1082 = _1080;
    if (!_1040)
    {
        _1064 = _944;
    }
    float _1084 = _1064;
    float _1086 = _1084;
    if (!_1040)
    {
        _858 = _946;
    }
    float _1088 = _858;
    float _1090 = _1088;
    if (!_1040)
    {
        _860 = _1074;
    }
    float _1092 = _860;
    bool _1094 = !_1040;
    float _1096 = _1092;
    if (!_1094)
    {
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1102 = _998 + _1100;
        float _1104 = _1074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = rsqrt(_976);
        float _1108 = _1102 * _1098;
        float _1110 = _1108 * 0.15915493667125701904296875;
        float _1112 = _1110 * 6.283185482025146484375;
        float _1114 = sin(_1112);
        float _1116 = _1110 * 6.283185482025146484375;
        float _1118 = cos(_1116);
        float _1120 = fma(_1114, _1104, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = _1106 * _1120;
        float _1124 = _1118 + (-1.0);
        float _1126 = fma(_956, _1122, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1128 = fma(_960, _1122, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1130 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1134 = _1126 + _1132;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1138 = _1128 + _1136;
        float _1140 = fma(_1074, _1118, _1130);
        float _1142 = _1134 * _1134;
        float _1144 = _1138 * _1138;
        _1096 = _1140;
        _1082 = _1142;
        _1078 = _1144;
        _1086 = _1126;
        _1090 = _1128;
    }
    float _1146 = _1096;
    float _1148 = _1082;
    float _1150 = _1078;
    float _1152 = _1086;
    float _1154 = _1090;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1158 = _1146 + _1156;
    float _1160 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1162 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1164 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1168 = fma(_1158, _1158, _1148);
    float _1170 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1160);
    float _1172 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1162);
    float _1174 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1164);
    float _1176 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1178 = _1168 + _1150;
    float _1180 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1184 = _1176 * _1050;
    float _1186 = sqrt(_1178);
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1192 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1194 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1172);
    float _1196 = _1180 * _1166;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1202 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1204 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1042);
    float _1206 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1044);
    float _1208 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1046);
    float _1210 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1174);
    out.m_81.x = _1198;
    out.m_81.y = _1200;
    out.m_81.z = _1202;
    bool _1212 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1214 = isnan(_1186);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1220 = _1216 || _1218;
    out.m_83.x = _1026;
    out.m_83.y = _1028;
    out.m_83.z = _1034;
    out.m_85.x = _1204;
    out.m_85.y = _1206;
    out.m_85.z = _1208;
    out.m_87.z = _1196;
    out.m_87.w = _1184;
    out.m_89.x = _1192;
    out.m_89.y = _1194;
    out.m_89.z = _1210;
    if (!_1220)
    {
        _1018 = 1.0;
    }
    float _1222 = _1018;
    bool _1224 = !_1220;
    float _1226 = _1222;
    if (!_1224)
    {
        bool _1228 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1230 = isnan(_1186);
        bool _1232 = _1228 || _1230;
        bool _1234 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1236 = _1232 || _1234;
        if (!_1236)
        {
            float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1240 = _1186 + _1238;
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1244 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1242;
            float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1248 = _1246 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1250 = 1.0 / _1244;
            float _1252 = _1240 * _1250;
            float _1254 = fma(_1252, _1248, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1226 = _1254;
            _1256 = true;
        }
        else
        {
            bool _1258 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1260 = isnan(_1186);
            bool _1262 = _1258 || _1260;
            bool _1264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1266 = _1262 || _1264;
            if (!_1266)
            {
                float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1270 = _1186 + _1268;
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1280 = 1.0 / _1274;
                float _1282 = _1270 * _1280;
                float _1284 = fma(_1282, _1278, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1226 = _1284;
                _1256 = true;
            }
            else
            {
                _1226 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1256 = false;
    float _1286 = _1226;
    float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1290 = _1146 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1294 = _1152 + _1292;
    float _1296 = -_760;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
    float _1300 = -_764;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _1304 = fma(_1290, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1308 = _1154 + _1306;
    float _1310 = fma(_1294, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1312 = -_758;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1316 = fma(_1308, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1318 = -_760;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1310);
    float _1322 = -_758;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1328 = _1314 + _1326;
    float _1330 = -_764;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1336 = _1320 + _1334;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1340 = _1328 * _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1338);
    float _1348 = fma(_1336, _1336, _1340);
    float _1350 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1346);
    float _1352 = fma(_1344, _1344, _1348);
    float _1354 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1356 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1358 = rsqrt(_1352);
    float _1360 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1362 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1360);
    float _1364 = 1.0 / _1356;
    float _1366 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1362);
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1370 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1372 = _1368 + _1356;
    float _1374 = floor(_1354);
    float _1376 = _1336 * _1370;
    float _1378 = _1344 * _1370;
    float _1380 = _1376 * _1376;
    float _1382 = _1378 * _1378;
    float _1384 = _1372 * _1364;
    float _1386 = _1384 * 0.5;
    float _1388 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1390 = sqrt(_1352);
    float _1392 = _1380 + _1382;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1396 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1394);
    float _1398 = _1324 + _1388;
    float _1400 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1402 = sqrt(_1392);
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1406 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1400);
    float _1408 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1404);
    float _1410 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1406);
    float _1412 = 1.0 / _1396;
    float _1414 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1408);
    float _1416 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1418 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1420 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1422 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1424 = trunc(_1416);
    int _1426 = int(_1424);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1412 * _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1434 = _1402 + _1432;
    float _1436 = trunc(_1418);
    int _1438 = int(_1436);
    bool _1440 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1442 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1444 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1446 = _1364;
    int _1448 = 2;
    float _1450 = _1370;
    float _1452 = _1434;
    float _1454 = _1376;
    float _1456 = _1380;
    int _1458 = as_type<int>(_1374);
    if (_1420)
    {
        float _1460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1446 = _1460;
    }
    float _1462 = _1446;
    int _1464 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1466 = _1426 + _1464;
    int _1468 = _1466 + 1;
    float _1470 = precise::max(0.0, _1444);
    int _1472 = _1468;
    if (!_1440)
    {
        _1448 = 1;
    }
    int _1474 = _1448;
    float _1476 = floor(_1422);
    int _1478 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1480 = _1438 + _1478;
    int _1482 = _1480 + 1;
    float _1484 = -_1370;
    float _1486 = -_1470;
    float _1488 = fma(_1328, _1484, _1486);
    int _1490 = _1474;
    float _1492 = _1488;
    if (_1420)
    {
        float _1494 = _1488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1450 = _1494;
    }
    float _1496 = _1450;
    float _1498 = _1462;
    if (_1420)
    {
        float _1500 = _1434 * _1462;
        _1452 = _1500;
    }
    float _1502 = _1452;
    if (_1420)
    {
        float _1504 = rsqrt(_1392);
        _862 = _1504;
    }
    float _1506 = _862;
    float _1508 = _1506;
    if (_1420)
    {
        float _1510 = _1502 * 0.15915493667125701904296875;
        _1498 = _1510;
    }
    float _1512 = _1498;
    bool _1514 = !_1440;
    int _1516 = _1514 ? 0 : 1;
    if (!_1442)
    {
        _1490 = _1516;
    }
    int _1518 = _1490;
    float _1520 = _1414;
    if (_1420)
    {
        float _1522 = _1512 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = -_1476;
    float _1530 = _1422 + _1528;
    bool _1532 = _1468 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1534 = _1518 << 6;
    int _1536 = _1468 | _1482;
    int _1538 = _1534 + 48;
    uint _1541 = uint(int(uint(_1538) >> uint(2)));
    uint _1543 = uint(int(uint(int(_1541)) >> uint(2)));
    int _1545 = int(_1541) & 3;
    float _1547 = (*spvDescriptorSet0.vp_c15)._m0[int(_1543)][_1545];
    int _1549 = int(_1541) + 1;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    int _1553 = _1549 & 3;
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
    float _1557 = _968;
    if (_1420)
    {
        float _1559 = _1512 * 6.283185482025146484375;
        float _1561 = cos(_1559);
        _1557 = _1561;
    }
    float _1563 = _1557;
    bool _1565 = _1536 < 0;
    bool _1567 = _1565 || _1532;
    bool _1569 = _1482 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1571 = _1569 || _1567;
    int _1573 = _1534 + 64;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    uint _1577 = uint(int(uint(int(_1575)) >> uint(2)));
    int _1579 = int(_1575) & 3;
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
    int _1583 = int(_1575) + 1;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    int _1587 = _1583 & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    float _1591 = 0.0;
    if (_1420)
    {
        float _1593 = fma(_1526, _1496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1591 = _1593;
    }
    float _1595 = _1591;
    float _1597 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1420)
    {
        float _1599 = _1506 * _1595;
        _1508 = _1599;
    }
    float _1601 = _1508;
    float _1603 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1597);
    int _1605 = _1534 + 96;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    float _1623 = _1563;
    if (_1420)
    {
        float _1625 = _1563 + (-1.0);
        _864 = _1625;
    }
    float _1627 = _864;
    float _1629 = _1627;
    if (_1420)
    {
        float _1631 = _1376 * _1601;
        _1454 = _1631;
    }
    float _1633 = _1454;
    float _1635 = _1595;
    if (!_1571)
    {
        float _1637 = floor(_1418);
        _1635 = _1637;
    }
    float _1639 = _1635;
    if (!_1571)
    {
        int _1641 = _1482 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1643 = _1641 + _1468;
        _1472 = _1643;
    }
    int _1645 = _1472;
    if (_1420)
    {
        float _1647 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1647;
    }
    float _1649 = _1629;
    if (_1420)
    {
        float _1651 = _1633 * _1633;
        _1456 = _1651;
    }
    float _1653 = _1456;
    int _1655 = _1534 + 104;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = as_type<int>(_1653);
    if (_1420)
    {
        float _1675 = fma(_1488, _1563, _1649);
        _1492 = _1675;
    }
    float _1677 = _1492;
    float _1679 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1603);
    float _1681 = _1679;
    if (!_1420)
    {
        _1623 = _1378;
    }
    float _1683 = _1623;
    float _1685 = _1683;
    if (_1420)
    {
        float _1687 = _1378 * _1601;
        _1685 = _1687;
    }
    float _1689 = _1685;
    float _1691 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1420)
    {
        _1681 = _1382;
    }
    float _1693 = _1681;
    int _1695 = _1534 + 80;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    uint _1699 = uint(int(uint(int(_1697)) >> uint(2)));
    int _1701 = int(_1697) & 3;
    float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
    int _1705 = int(_1697) + 1;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    int _1709 = _1705 & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    float _1713 = -_1374;
    float _1715 = _1354 + _1713;
    float _1717 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1719 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1721 = _1693;
    int _1723 = as_type<int>(_1719);
    if (!_1571)
    {
        int _1725 = _1645 << 2;
        _1458 = _1725;
    }
    int _1727 = _1458;
    if (_1420)
    {
        float _1729 = _1689 * _1689;
        _1721 = _1729;
    }
    float _1731 = _1721;
    float _1733 = fma(_1677, _1677, _1653);
    float _1735 = -_1719;
    float _1737 = fma(_1735, _1717, 1.0);
    int _1739 = _1534 + 56;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    uint _1743 = uint(int(uint(int(_1741)) >> uint(2)));
    int _1745 = int(_1741) & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    int _1749 = int(_1741) + 1;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    int _1753 = _1749 & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    if (!_1571)
    {
        int _1757 = 12 & _1727;
        _1723 = _1757;
    }
    int _1759 = _1723;
    float _1761 = _1733 + _1731;
    float _1763 = log2(_1737);
    if (!_1571)
    {
        uint _1765 = uint(int(uint(_1645) >> uint(2)));
        _1673 = int(_1765);
    }
    int _1767 = _1673;
    int _1769 = _1534 + 72;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
    int _1775 = int(_1771) & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    int _1779 = int(_1771) + 1;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    int _1783 = _1779 & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    float _1787 = _1398 * _1555;
    float _1789 = _1555;
    int _1791 = _1767;
    if (!_1571)
    {
        float _1793 = -_1639;
        float _1795 = _1418 + _1793;
        _1789 = _1795;
    }
    float _1797 = _1789;
    if (!_1571)
    {
        int _1799 = _1767 << 4;
        int _1801 = _1799 + _1759;
        _1791 = _1801;
    }
    int _1803 = _1791;
    float _1805 = fma(_1298, _1547, _1787);
    float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1809 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1807);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = rsqrt(_1761);
    int _1815 = _1534 + 88;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1398 * _1589;
    float _1835 = _1398 * _1621;
    float _1837 = fma(_1298, _1613, _1835);
    float _1839 = -_1811;
    float _1841 = _1839 + 1.0;
    float _1843 = _1813 * _1633;
    float _1845 = fma(_1302, _1663, _1837);
    float _1847 = _1813 * _1677;
    float _1849 = _1813 * _1689;
    float _1851 = abs(_1841);
    float _1853 = log2(_1851);
    float _1855 = _1845 + _1671;
    float _1857 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float2 _5609 = float2(_1530, _1715);
    float _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5609, float2(0.0), isnan(_5609)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5609, float2(0.0), isnan(_5609)), level(0.0)).x;
    float _1861 = _1813;
    float _1863 = _1837;
    if (!_1571)
    {
        int _1865 = _1803 + 400;
        uint _1867 = uint(int(uint(_1865) >> uint(2)));
        uint _1869 = uint(int(uint(int(_1867)) >> uint(2)));
        int _1871 = int(_1867) & 3;
        float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
        _1861 = _1873;
    }
    float _1875 = _1861;
    float _1877 = _1398 * _1711;
    float _1879 = fma(_1298, _1581, _1833);
    float _1881 = -_1857;
    float _1883 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1881);
    float _1885 = 1.0 / _1855;
    float _1887 = fma(_1298, _1703, _1877);
    float _1889 = -_1849;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1883);
    float _1893 = fma(_1302, _1747, _1805);
    float _1895 = fma(_1891, -0.5, 0.5);
    if (!_1571)
    {
        float _1897 = floor(_1416);
        _1863 = _1897;
    }
    float _1899 = _1863;
    float _1901 = _1893 + _1755;
    float _1903 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1905 = fma(_1891, 0.5, 0.5);
    float _1907 = fma(_1302, _1777, _1879);
    float _1909 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1911 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1903);
    float _1913 = sqrt(_1895);
    float _1915 = _1907 + _1785;
    float _1917 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1919 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1909);
    float _1921 = _1901 * _1885;
    float _1923 = _1915 * _1885;
    float _1925 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1927 = fma(_1302, _1823, _1887);
    float _1929 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1911);
    bool _1931 = _1921 >= 0.0;
    float _1933 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1925);
    float _1935 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1939 = _1921 <= 1.0;
    bool _1941 = _1939 && _1931;
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1945 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1947 = exp2(_1935);
    bool _1949 = _1923 >= 0.0;
    bool _1951 = _1949 && _1941;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1955 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1957 = _1927 + _1831;
    bool _1959 = _1923 <= 1.0;
    bool _1961 = _1959 && _1951;
    float _1963 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1953);
    float _1965 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1967 = _1847 + 1.0;
    float _1969 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1971 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1963);
    float _1973 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1965);
    float _1975 = fma(_1905, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1977 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1969);
    float _1979 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1971);
    float _1981 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1973);
    float _1983 = -_1847;
    float _1985 = fma(_1947, _1967, _1983);
    float _1987 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1977);
    float _1989 = 1.0 / _1979;
    float _1991 = _1971;
    float _1993 = _1977;
    float _1995 = _1979;
    if (_1961)
    {
        float _1997 = float(_1518);
        _1991 = _1997;
    }
    float _1999 = _1991;
    float _2001 = fma(_1905, _1975, -0.212114393711090087890625);
    float _2003 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1981);
    float _2005 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1987);
    if (!_1571)
    {
        float _2007 = -_1899;
        float _2009 = _1416 + _2007;
        _1993 = _2009;
    }
    float _2011 = _1993;
    float _2013 = _1763 * 0.693147182464599609375;
    float _2015 = fma(_1905, _2001, 1.570728778839111328125);
    float _2017 = _1999;
    float _2019 = _2011;
    if (_1961)
    {
        float _2021 = rint(_1999);
        float _2023 = precise::max(_2021, 0.0);
        uint _2025 = uint(_2023);
        uint _2027 = clamp(_2025, 0u, 65535u);
        _2017 = as_type<float>(_2027);
    }
    float _2029 = _2017;
    float _2031 = _1913 * 0.636619746685028076171875;
    float _2033 = _1957 * _1885;
    float _2035 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2037 = fma(_1985, 0.5, 0.5);
    float _2039 = -_2015;
    float _2041 = fma(_2031, _2039, 1.0);
    float _2043 = _2003 * _1989;
    float _2045 = _2005 * _1989;
    float _2047 = _2013;
    if (!_1571)
    {
        float _2049 = rint(_1875);
        float _2051 = precise::max(_2049, 0.0);
        uint _2053 = uint(_2051);
        uint _2055 = clamp(_2053, 0u, 65535u);
        _2047 = as_type<float>(_2055);
    }
    float _2057 = _2047;
    float _2059 = fma(_2043, 0.5, 0.5);
    float _2061 = fma(_2045, -0.5, 0.5);
    float _2063 = _2029;
    if (_1961)
    {
        float3 _5960 = float3(_1921, _1923, float(as_type<int>(_2029)));
        float3 _5964 = select(_5960, float3(0.0), isnan(_5960));
        float _2065 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5964.xy, uint(rint(_5964.z)), _2033, level(0.0));
        _2063 = _2065;
    }
    float _2067 = _2063;
    float3 _5974 = float3(_2059, _2061, _2035);
    float _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5974, float3(0.0), isnan(_5974)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5974, float3(0.0), isnan(_5974)), level(0.0)).x;
    float3 _5983 = float3(_2059, _2061, _2035);
    float4 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5983, float3(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5983, float3(0.0), isnan(_5983)), level(0.0)).xyzw;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = _2072.w;
    float2 _5999 = float2(_2041, _2037);
    float3 _2084 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5999, float2(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5999, float2(0.0), isnan(_5999)), level(0.0)).xyz;
    float _2086 = _2084.x;
    float _2088 = _2084.y;
    float _2090 = _2084.z;
    float _2092 = _2057;
    if (!_1571)
    {
        float3 _6020 = float3(_2011, _1797, float(as_type<int>(_2057)));
        float3 _6022 = select(_6020, float3(0.0), isnan(_6020));
        float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6022.xy, uint(rint(_6022.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6022.xy, uint(rint(_6022.z)), level(0.0)).x;
        _2092 = _2094;
    }
    float _2096 = _2092;
    float _2098 = abs(_1430);
    float _2100 = log2(_2098);
    float _2102 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2104 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2102);
    float _2106 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2104);
    float _2108 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2110 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2106);
    float _2112 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = _2110 + _1979;
    float _2116 = exp2(_2108);
    bool _2118 = _1430 <= 8000.0;
    bool _2120 = isnan(_1430);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(8000.0);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _2114 * 0.5;
    float _2132 = _2110;
    if (!_1961)
    {
        _2019 = 1.0;
    }
    float _2134 = _2019;
    float _2136 = exp2(_2112);
    out.m_91.z = _2130;
    out.m_91.w = _1979;
    float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = fma(_2140, -2.0, 3.0);
    float _2144 = _2140 * _2140;
    float _2146 = _2144 * _2142;
    float _2148 = -_2146;
    float _2150 = _2148 + 1.0;
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2005;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1979;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2146);
    float _2154 = -_2116;
    float _2156 = _2154 + 1.0;
    float _2158 = _2128 * _2152;
    float _2160 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2164 = _2003;
    float _2166 = _2134;
    float _2168 = _2156;
    float _2170 = _2162;
    if (_1571)
    {
        _2164 = 1.0;
    }
    float _2172 = _2164;
    float _2174 = -_1859;
    float _2176 = _2174 + 1.0;
    float _2178 = _2176 * _2160;
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    float _2182 = _2172;
    if (_1961)
    {
        bool _2184 = _2067 >= _2033;
        bool _2186 = isnan(_2067);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan(_2033);
        bool _2192 = _2188 || _2190;
        float _2194 = float(_2192);
        _2166 = _2194;
    }
    float _2196 = _2166;
    if (!_1571)
    {
        int _2198 = _1645 << 4;
        int _2200 = _2198 + 2048;
        uint _2202 = uint(int(uint(_2200) >> uint(2)));
        uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
        int _2206 = int(_2202) & 3;
        float _2208 = (*spvDescriptorSet0.vp_c15)._m0[int(_2204)][_2206];
        int _2210 = int(_2202) + 1;
        uint _2212 = uint(int(uint(_2210) >> uint(2)));
        int _2214 = _2210 & 3;
        float _2216 = (*spvDescriptorSet0.vp_c15)._m0[int(_2212)][_2214];
        int _2218 = _2200 + 8;
        uint _2220 = uint(int(uint(_2218) >> uint(2)));
        uint _2222 = uint(int(uint(int(_2220)) >> uint(2)));
        int _2224 = int(_2220) & 3;
        float _2226 = (*spvDescriptorSet0.vp_c15)._m0[int(_2222)][_2224];
        int _2228 = int(_2220) + 1;
        uint _2230 = uint(int(uint(_2228) >> uint(2)));
        int _2232 = _2228 & 3;
        float _2234 = (*spvDescriptorSet0.vp_c15)._m0[int(_2230)][_2232];
        float _2236 = _1398 * _2216;
        float _2238 = fma(_1298, _2208, _2236);
        float _2240 = fma(_1302, _2226, _2238);
        float _2242 = _2240 + _2234;
        float _2244 = precise::clamp(_2242, 0.0, 1.0);
        float _2246 = -_2244;
        float _2248 = _2246 + _2096;
        float _2250 = fma(_2248, 500.0, 1.5);
        float _2252 = exp2(_2250);
        float _2254 = 0.0 + _2252;
        float _2256 = precise::clamp(_2254, 0.0, 1.0);
        _2182 = _2256;
        _1995 = _2216;
        _2168 = _2226;
        _2132 = _2208;
    }
    float _2258 = _2182;
    float _2260 = _1995;
    float _2262 = _2168;
    float _2264 = _2132;
    float _2266 = _2196 * _2258;
    float _2268 = _2162 * _2069;
    float _2270 = -_2180;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2274 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2276 = isnan(_1390);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2282 = _2278 || _2280;
    float _2284 = _2080 * _2268;
    float _2286 = -_2266;
    float _2288 = fma(_2286, _2272, 1.0);
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = _2090 * _2268;
    float _2294 = -_2162;
    float _2296 = _2294 + 1.0;
    float _2298 = fma(_2086, _2284, _2074);
    float _2300 = fma(_2088, _2284, _2076);
    float _2302 = _2290 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2304 = _2080 * _2296;
    float _2306 = fma(_2080, _2292, _2078);
    out.m_93.x = _2302;
    float _2308 = _2262;
    float _2310 = _2260;
    float _2312 = _2264;
    float _2314 = _2296;
    float _2316 = _2290;
    if (!_2282)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2318 = _2308;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2282)
    {
        _2310 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2324 = _2310;
    out.m_95.x = _2298;
    out.m_95.y = _2300;
    out.m_95.z = _2306;
    out.m_95.w = _2304;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2282)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2330 = _2312;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2282)
    {
        _2170 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2336 = _2170;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2282)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2342 = _2314;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2282)
    {
        _2316 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2348 = _2316;
    bool _2350 = !_2282;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2350)
    {
        bool _2356 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2358 = isnan(_1390);
        bool _2360 = _2356 || _2358;
        bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2364 = _2360 || _2362;
        if (!_2364)
        {
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2368 = _1390 + _2366;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2370;
            float _2374 = 1.0 / _2372;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2396 = _2368 * _2374;
            float _2398 = precise::clamp(_2396, 0.0, 1.0);
            float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2406;
            _2346 = _2412;
            _2322 = _2404;
            _2340 = _2410;
            _2334 = _2408;
            _2354 = _2414;
            _2416 = true;
        }
        else
        {
            bool _2418 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2420 = isnan(_1390);
            bool _2422 = _2418 || _2420;
            bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2426 = _2422 || _2424;
            if (!_2426)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2428 = _2320;
            _2322 = _2428;
            if (!_2426)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2430 = _2326;
            _2328 = _2430;
            if (!_2426)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2432 = _2332;
            _2334 = _2432;
            if (!_2426)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2434 = _2338;
            _2340 = _2434;
            if (!_2426)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2436 = _2344;
            _2346 = _2436;
            if (!_2426)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2438 = _2352;
            bool _2440 = !_2426;
            _2354 = _2438;
            if (!_2440)
            {
                bool _2442 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2444 = isnan(_1390);
                bool _2446 = _2442 || _2444;
                bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2450 = _2446 || _2448;
                if (!_2450)
                {
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2454 = _1390 + _2452;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2456;
                    float _2460 = 1.0 / _2458;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2482 = _2454 * _2460;
                    float _2484 = precise::clamp(_2482, 0.0, 1.0);
                    float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2492;
                    _2346 = _2498;
                    _2322 = _2490;
                    _2340 = _2496;
                    _2334 = _2494;
                    _2354 = _2500;
                    _2416 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2416 = false;
    float _2502 = _2328;
    float _2504 = _2346;
    float _2506 = _2322;
    float _2508 = _2340;
    float _2510 = _2334;
    float _2512 = _2354;
    float _2514 = fma(_1194, -0.5, 0.5);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    float _2522 = -_2506;
    float _2524 = _2522 + _2508;
    float _2526 = -_2510;
    float _2528 = _2526 + _2512;
    bool _2530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2532 = fma(_2516, _2520, _2502);
    float _2534 = fma(_2516, _2524, _2506);
    float _2536 = fma(_2516, _2528, _2510);
    float _2538 = _2532 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2540 = fma(_2534, 0.298911988735198974609375, _2538);
    float _2542 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2544 = fma(_2536, 0.114477999508380889892578125, _2540);
    out.m_93.w = _2542;
    float _2546 = -_2544;
    float _2548 = _2534 + _2546;
    float _2550 = -_2544;
    float _2552 = _2532 + _2550;
    float _2554 = -_2544;
    float _2556 = _2536 + _2554;
    out.m_97.x = 0.0;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    out.m_99.x = _2558;
    out.m_99.y = _2560;
    out.m_99.z = _2562;
    if (!_2530)
    {
        return out;
    }
    float _2564 = -_1314;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2568 = -_1320;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2572 = -_1332;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2576 = _2566 * _2566;
    float _2578 = fma(_2570, _2570, _2576);
    float _2580 = fma(_2574, _2574, _2578);
    float _2582 = sqrt(_2580);
    float _2584 = rsqrt(_2580);
    float _2586 = -_2582;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = _2570 * _2584;
    float _2596 = _2566 * _2584;
    float _2598 = abs(_2592);
    float _2600 = log2(_2598);
    float _2602 = _2574 * _2584;
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2606 = _1194 * _2596;
    float _2608 = -_2596;
    float _2610 = -_2604;
    float _2612 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2610);
    float _2614 = fma(_1192, _2594, _2606);
    float _2616 = -_2602;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2612);
    float _2620 = fma(_1210, _2602, _2614);
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2626 = _2618 + _2624;
    float _2628 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2630 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = exp2(_2628);
    float _2636 = _2634 * _2632;
    float _2638 = _2622 * _2636;
    float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2642 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2644 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2640;
    out.m_97.y = _2642;
    out.m_97.z = _2644;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2416 = false;
    bool _1256 = false;
    bool _314 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_58.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_61.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2701 = as_type<float>(_134);
        out.gl_Position.z = _2701;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_63.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    if (_148)
    {
        float _156 = float(_118);
        _154 = _156;
    }
    float _158 = _154;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_61.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _136 = as_type<int>(_168);
    }
    int _170 = _136;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2769 = as_type<float>(_170);
        out.gl_Position.z = _2769;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_65.w;
    float _174 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _176 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _178 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _180 = _176 || _178;
    bool _182 = isnan(1.0);
    bool _184 = _180 || _182;
    float _186 = in.m_63.x;
    float _188 = in.m_63.y;
    float _190 = in.m_63.z;
    float _192 = in.m_58.x;
    float _194 = in.m_58.y;
    float _196 = in.m_58.z;
    float _198 = 0.0;
    float _200 = _174;
    if (!_184)
    {
        float _202 = _174 * _174;
        float _204 = _202 * 0.5;
        _198 = _204;
    }
    float _206 = _198;
    float _208 = _206;
    if (!_184)
    {
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _210;
    }
    float _212 = _208;
    bool _214 = !_184;
    float _216 = _212;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _174 * _220;
        float _230 = exp2(_228);
        float _232 = _226 * 0.693147182464599609375;
        float _234 = 1.0 / _232;
        float _236 = 1.0 / _224;
        float _238 = _230 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _234, _174);
        float _244 = _242 * _236;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_184;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _174 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _200 = _270;
    }
    float _272 = _200;
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _278 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _282 = fma(_272, _186, _276);
    float _284 = fma(_272, _188, _278);
    float _286 = fma(_272, _190, _280);
    float _288 = fma(_282, _172, _192);
    float _290 = fma(_284, _172, _194);
    float _292 = fma(_286, _172, _196);
    bool _294 = !_274;
    float _312;
    if (!_294)
    {
        float _296 = in.m_67.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_118);
        float _318 = 1.0 / _316;
        float _320 = _152 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    float _324 = in.m_67.w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = _322 + _326;
    float _330 = in.m_67.y;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = in.m_69.x;
    float _342 = in.m_69.y;
    float _344 = in.m_69.z;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _346;
    float _350 = 1.0 / _334;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _354 = _352 != 0;
    float _356 = in.m_67.x;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _360 = _358 != 0;
    float _362 = _290 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _364 = in.m_71.x;
    float _366 = 1.0 / _348;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _372 = _290 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _374 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].x, _362);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _384 = _324 > 0.5;
    float _386 = _290 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = 1.0 / _370;
    float _390 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].z, _374);
    float _392 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    bool _394 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_322);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _390 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _408 = 1.0 / _338;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = _322 + _410;
    float _414 = _356 + _340;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _416;
    float _420 = _412 * _350;
    float _422 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _414);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _428 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].x, _372);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _430;
    float _434 = _344 + _330;
    float _436 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].z, _392);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = _322 + _438;
    float _442 = 1.0 / _432;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _448 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _434);
    float _450 = _440 * _366;
    float _452 = fma(_378, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].z, _428);
    float _456 = 1.0 / _446;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _322 + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _468 = _322 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _470;
    float _474 = _460 * _388;
    float _476 = fma(_464, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _480 = _322 + _478;
    float _482 = fma(_472, _450, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _492;
    float _496 = _480 * _408;
    float _498 = fma(_486, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _500 = _468 * _456;
    bool _502 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _504 = isnan(_322);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = fma(_494, _450, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = _328 * _442;
    bool _526 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _528 = isnan(_322);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = -_512;
    float _540 = _538 + 1.0;
    float _542 = fma(_522, _450, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _544 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _546 = isnan(_322);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = fma(_490, _496, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _558 = fma(_518, _496, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _560 = fma(_382, _496, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = _454 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = -_554;
    float _566 = _564 + 1.0;
    float _568 = _554 * _540;
    bool _570 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _572 = isnan(_322);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -_536;
    float _584 = _582 + 1.0;
    float _586 = _536 * _566;
    bool _588 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _590 = isnan(_322);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _604 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _606 = isnan(_322);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _580 * _584;
    float _618 = -_580;
    float _620 = _618 + 1.0;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _630;
    float _634 = -_614;
    float _636 = _634 + 1.0;
    float _638 = -_598;
    float _640 = _638 + 1.0;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _642;
    float _646 = fma(_418, _524, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _648 = _422 * 7.5;
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _562 + _650;
    float _654 = fma(_602, _474, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _656 = fma(_624, _474, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _658 = fma(_628, _474, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _660 = _614 * _620;
    float _662 = _598 * _636;
    float _664 = fma(_632, _524, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _666 = _404 * _640;
    float _668 = fma(_644, _524, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _670 = in.m_73.x;
    float _672 = in.m_73.y;
    float _674 = in.m_73.z;
    float _676 = _648 * 0.15915493667125701904296875;
    float _678 = _436 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _682 = _406 + _680;
    float _684 = _652 * _652;
    float _686 = _498 * _666;
    float _688 = _476 * _666;
    float _690 = _452 * _666;
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _694 = _678 + _692;
    float _696 = fma(_682, _682, _684);
    float _698 = _676 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = -_404;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _710 = fma(_694, _694, _696);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _716 = fma(_426, _500, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _718 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].x, _686);
    float _720 = fma(_708, _500, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _722 = fma(_714, _500, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _724 = rsqrt(_710);
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].y, _688);
    float _728 = fma(_556, _662, _718);
    float _730 = _448 * 15.0;
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[143].z, _690);
    float _734 = fma(_558, _662, _726);
    float _736 = _672 * _672;
    float _738 = _700 * 0.07999999821186065673828125;
    float _740 = _730 * 0.15915493667125701904296875;
    float _742 = fma(_560, _662, _732);
    float _744 = fma(_670, _670, _736);
    float _746 = fma(_738, _364, _342);
    float _748 = _740 * 6.283185482025146484375;
    float _750 = sin(_748);
    float _752 = fma(_482, _660, _742);
    float _754 = fma(_674, _674, _744);
    float _756 = fma(_542, _660, _728);
    float _758 = _652 * _724;
    float _760 = _682 * _724;
    float _762 = fma(_514, _660, _734);
    float _764 = _694 * _724;
    float _766 = -_758;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _652);
    float _770 = rsqrt(_754);
    float _772 = -_760;
    float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _776 = in.m_65.x;
    float _778 = in.m_65.y;
    float _780 = in.m_65.z;
    float _782 = _768 * _768;
    float _784 = fma(_654, _616, _756);
    float _786 = -_764;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _694);
    float _790 = fma(_656, _616, _762);
    float _792 = fma(_774, _774, _782);
    float _794 = fma(_658, _616, _752);
    float _796 = fma(_664, _586, _784);
    float _798 = fma(_646, _586, _790);
    float _800 = fma(_788, _788, _792);
    float _802 = _750 * 0.02999999932944774627685546875;
    float _804 = fma(_668, _586, _794);
    float _806 = fma(_720, _568, _796);
    float _808 = fma(_716, _568, _798);
    float _810 = in.m_75.y;
    float _812 = _770 * _802;
    float _814 = fma(_722, _568, _804);
    float _816 = sqrt(_800);
    float _818 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].x, _806);
    float _820 = fma(_670, _812, _340);
    float _822 = fma(_672, _812, _746);
    float _824 = fma(_674, _812, _344);
    float _826 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].z, _814);
    float _828 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[149].y, _808);
    float _830 = _818 * _776;
    float _832 = in.m_77.x;
    float _834 = in.m_77.y;
    float _836 = in.m_77.z;
    float _838 = in.m_77.w;
    float _840 = _826 * _780;
    float _842 = _828 * _778;
    float _844 = _830 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _846 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _850 = _668;
    float _852 = _670;
    float _854 = _674;
    float _856 = _672;
    float _858 = _820;
    float _860 = _824;
    float _862 = _688;
    float _864 = _700;
    if (_354)
    {
        float _866 = in.m_67.z;
        _850 = _866;
    }
    float _868 = _850;
    float _870 = _724 * _816;
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _824);
    float _874 = in.m_75.x;
    float _876 = _870 * _844;
    float _878 = _870 * _848;
    float _880 = _870 * _846;
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _822);
    float _884 = -_810;
    float _886 = _884 + 1.0;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _820);
    float _890 = _882 * _878;
    float _892 = _888 * _876;
    float _894 = _810;
    float _896 = _892;
    if (_360)
    {
        float _898 = _384 ? _886 : _810;
        _894 = _898;
    }
    float _900 = _894;
    float _902 = _872 * _880;
    float _904 = _834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _906 = _834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _908 = _890 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _910 = _890 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _912 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _914 = _670 * _836;
    float _916 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[9].x, _904);
    float _918 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[10].x, _906);
    float _920 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[8].x, _908);
    float _922 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[10].x, _910);
    float _924 = fma(_832, (*spvDescriptorSet0.vp_c10)._m0[8].x, _912);
    float _926 = -_914;
    float _928 = fma(_674, _832, _926);
    float _930 = _672 * _832;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _934 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _936 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _938 = -_930;
    float _940 = fma(_670, _834, _938);
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = _406 + _934;
    float _946 = _678 + _936;
    bool _948 = _868 > 0.5;
    bool _950 = _948 && _354;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _944 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _946 + _958;
    float _962 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _956 * _956;
    float _968 = _960 * _960;
    float _970 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _674 * _834;
    float _974 = _928 * _838;
    float _976 = _966 + _968;
    bool _978 = _822 != 0.0;
    bool _980 = isnan(_822);
    bool _982 = _978 || _980;
    bool _984 = isnan(0.0);
    bool _986 = _982 || _984;
    float _988 = -_972;
    float _990 = fma(_672, _836, _988);
    float _992 = _834;
    float _994 = _874;
    if (!_354)
    {
        _992 = _874;
    }
    float _996 = _992;
    float _998 = sqrt(_976);
    out.m_79.x = _962;
    out.m_79.y = _964;
    out.m_79.z = _970;
    float _1000 = _996;
    if (_950)
    {
        float _1002 = -_874;
        float _1004 = _1002 + 1.0;
        _994 = _1004;
    }
    float _1006 = _994;
    bool _1008 = _820 == 0.0;
    bool _1010 = !_986;
    bool _1012 = _1008 && _1010;
    float _1014 = _990 * _838;
    float _1016 = _940 * _838;
    float _1018 = _1016;
    if (_354)
    {
        _1000 = _1006;
    }
    float _1020 = _1000;
    bool _1022 = _824 == 0.0;
    bool _1024 = _1022 && _1012;
    float _1026 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _924);
    float _1028 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _1030 = _974 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1032 = _974 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1034 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[10].z, _918);
    float _1036 = _974 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = _890 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1040 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1030);
    float _1044 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1032);
    float _1046 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1048 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1038);
    float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1052 = _1038;
    if (_1024)
    {
        _896 = _672;
    }
    float _1054 = _896;
    float _1056 = _1054;
    if (!_1024)
    {
        float _1058 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _670);
        _852 = _1058;
    }
    float _1060 = _852;
    float _1062 = fma(_902, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1048);
    float _1064 = _1062;
    if (!_1024)
    {
        float _1066 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[17].y, _672);
        _1056 = _1066;
    }
    float _1068 = _1056;
    if (!_1024)
    {
        float _1070 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[17].y, _674);
        _854 = _1070;
    }
    float _1072 = _854;
    float _1074 = _562 + _1062;
    if (!_1040)
    {
        _1052 = _968;
    }
    float _1076 = _1052;
    float _1078 = _1076;
    if (!_1040)
    {
        _856 = _966;
    }
    float _1080 = _856;
    float _1082 = _1080;
    if (!_1040)
    {
        _1064 = _944;
    }
    float _1084 = _1064;
    float _1086 = _1084;
    if (!_1040)
    {
        _858 = _946;
    }
    float _1088 = _858;
    float _1090 = _1088;
    if (!_1040)
    {
        _860 = _1074;
    }
    float _1092 = _860;
    bool _1094 = !_1040;
    float _1096 = _1092;
    if (!_1094)
    {
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1102 = _998 + _1100;
        float _1104 = _1074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1106 = rsqrt(_976);
        float _1108 = _1102 * _1098;
        float _1110 = _1108 * 0.15915493667125701904296875;
        float _1112 = _1110 * 6.283185482025146484375;
        float _1114 = sin(_1112);
        float _1116 = _1110 * 6.283185482025146484375;
        float _1118 = cos(_1116);
        float _1120 = fma(_1114, _1104, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = _1106 * _1120;
        float _1124 = _1118 + (-1.0);
        float _1126 = fma(_956, _1122, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1128 = fma(_960, _1122, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1130 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1134 = _1126 + _1132;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1138 = _1128 + _1136;
        float _1140 = fma(_1074, _1118, _1130);
        float _1142 = _1134 * _1134;
        float _1144 = _1138 * _1138;
        _1096 = _1140;
        _1082 = _1142;
        _1078 = _1144;
        _1086 = _1126;
        _1090 = _1128;
    }
    float _1146 = _1096;
    float _1148 = _1082;
    float _1150 = _1078;
    float _1152 = _1086;
    float _1154 = _1090;
    float _1156 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1158 = _1146 + _1156;
    float _1160 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1162 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1164 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1168 = fma(_1158, _1158, _1148);
    float _1170 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1160);
    float _1172 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1162);
    float _1174 = fma(_1060, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1164);
    float _1176 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1178 = _1168 + _1150;
    float _1180 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1184 = _1176 * _1050;
    float _1186 = sqrt(_1178);
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1192 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1194 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1172);
    float _1196 = _1180 * _1166;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1202 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1204 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1042);
    float _1206 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1044);
    float _1208 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1046);
    float _1210 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1174);
    out.m_81.x = _1198;
    out.m_81.y = _1200;
    out.m_81.z = _1202;
    bool _1212 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1214 = isnan(_1186);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1220 = _1216 || _1218;
    out.m_83.x = _1026;
    out.m_83.y = _1028;
    out.m_83.z = _1034;
    out.m_85.x = _1204;
    out.m_85.y = _1206;
    out.m_85.z = _1208;
    out.m_87.z = _1196;
    out.m_87.w = _1184;
    out.m_89.x = _1192;
    out.m_89.y = _1194;
    out.m_89.z = _1210;
    if (!_1220)
    {
        _1018 = 1.0;
    }
    float _1222 = _1018;
    bool _1224 = !_1220;
    float _1226 = _1222;
    if (!_1224)
    {
        bool _1228 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1230 = isnan(_1186);
        bool _1232 = _1228 || _1230;
        bool _1234 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1236 = _1232 || _1234;
        if (!_1236)
        {
            float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1240 = _1186 + _1238;
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1244 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1242;
            float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1248 = _1246 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1250 = 1.0 / _1244;
            float _1252 = _1240 * _1250;
            float _1254 = fma(_1252, _1248, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1226 = _1254;
            _1256 = true;
        }
        else
        {
            bool _1258 = _1186 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1260 = isnan(_1186);
            bool _1262 = _1258 || _1260;
            bool _1264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1266 = _1262 || _1264;
            if (!_1266)
            {
                float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1270 = _1186 + _1268;
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1280 = 1.0 / _1274;
                float _1282 = _1270 * _1280;
                float _1284 = fma(_1282, _1278, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1226 = _1284;
                _1256 = true;
            }
            else
            {
                _1226 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1256 = false;
    float _1286 = _1226;
    float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1290 = _1146 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1294 = _1152 + _1292;
    float _1296 = -_760;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
    float _1300 = -_764;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _1304 = fma(_1290, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1306 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1308 = _1154 + _1306;
    float _1310 = fma(_1294, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1312 = -_758;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1316 = fma(_1308, _1286, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1318 = -_760;
    float _1320 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1310);
    float _1322 = -_758;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1328 = _1314 + _1326;
    float _1330 = -_764;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1336 = _1320 + _1334;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1340 = _1328 * _1328;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1338);
    float _1348 = fma(_1336, _1336, _1340);
    float _1350 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1346);
    float _1352 = fma(_1344, _1344, _1348);
    float _1354 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1356 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1358 = rsqrt(_1352);
    float _1360 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1362 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1360);
    float _1364 = 1.0 / _1356;
    float _1366 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1362);
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1370 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1372 = _1368 + _1356;
    float _1374 = floor(_1354);
    float _1376 = _1336 * _1370;
    float _1378 = _1344 * _1370;
    float _1380 = _1376 * _1376;
    float _1382 = _1378 * _1378;
    float _1384 = _1372 * _1364;
    float _1386 = _1384 * 0.5;
    float _1388 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1390 = sqrt(_1352);
    float _1392 = _1380 + _1382;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1396 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1394);
    float _1398 = _1324 + _1388;
    float _1400 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1402 = sqrt(_1392);
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1406 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1400);
    float _1408 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1404);
    float _1410 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1406);
    float _1412 = 1.0 / _1396;
    float _1414 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1408);
    float _1416 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1418 = _1414 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1420 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1422 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1424 = trunc(_1416);
    int _1426 = int(_1424);
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1412 * _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1434 = _1402 + _1432;
    float _1436 = trunc(_1418);
    int _1438 = int(_1436);
    bool _1440 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1442 = _1430 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1444 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1446 = _1364;
    int _1448 = 2;
    float _1450 = _1370;
    float _1452 = _1434;
    float _1454 = _1376;
    float _1456 = _1380;
    int _1458 = as_type<int>(_1374);
    if (_1420)
    {
        float _1460 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1446 = _1460;
    }
    float _1462 = _1446;
    int _1464 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1466 = _1426 + _1464;
    int _1468 = _1466 + 1;
    float _1470 = precise::max(0.0, _1444);
    int _1472 = _1468;
    if (!_1440)
    {
        _1448 = 1;
    }
    int _1474 = _1448;
    float _1476 = floor(_1422);
    int _1478 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1480 = _1438 + _1478;
    int _1482 = _1480 + 1;
    float _1484 = -_1370;
    float _1486 = -_1470;
    float _1488 = fma(_1328, _1484, _1486);
    int _1490 = _1474;
    float _1492 = _1488;
    if (_1420)
    {
        float _1494 = _1488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1450 = _1494;
    }
    float _1496 = _1450;
    float _1498 = _1462;
    if (_1420)
    {
        float _1500 = _1434 * _1462;
        _1452 = _1500;
    }
    float _1502 = _1452;
    if (_1420)
    {
        float _1504 = rsqrt(_1392);
        _862 = _1504;
    }
    float _1506 = _862;
    float _1508 = _1506;
    if (_1420)
    {
        float _1510 = _1502 * 0.15915493667125701904296875;
        _1498 = _1510;
    }
    float _1512 = _1498;
    bool _1514 = !_1440;
    int _1516 = _1514 ? 0 : 1;
    if (!_1442)
    {
        _1490 = _1516;
    }
    int _1518 = _1490;
    float _1520 = _1414;
    if (_1420)
    {
        float _1522 = _1512 * 6.283185482025146484375;
        float _1524 = sin(_1522);
        _1520 = _1524;
    }
    float _1526 = _1520;
    float _1528 = -_1476;
    float _1530 = _1422 + _1528;
    bool _1532 = _1468 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1534 = _1518 << 6;
    int _1536 = _1468 | _1482;
    int _1538 = _1534 + 48;
    uint _1541 = uint(int(uint(_1538) >> uint(2)));
    uint _1543 = uint(int(uint(int(_1541)) >> uint(2)));
    int _1545 = int(_1541) & 3;
    float _1547 = (*spvDescriptorSet0.vp_c15)._m0[int(_1543)][_1545];
    int _1549 = int(_1541) + 1;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    int _1553 = _1549 & 3;
    float _1555 = (*spvDescriptorSet0.vp_c15)._m0[int(_1551)][_1553];
    float _1557 = _968;
    if (_1420)
    {
        float _1559 = _1512 * 6.283185482025146484375;
        float _1561 = cos(_1559);
        _1557 = _1561;
    }
    float _1563 = _1557;
    bool _1565 = _1536 < 0;
    bool _1567 = _1565 || _1532;
    bool _1569 = _1482 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1571 = _1569 || _1567;
    int _1573 = _1534 + 64;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    uint _1577 = uint(int(uint(int(_1575)) >> uint(2)));
    int _1579 = int(_1575) & 3;
    float _1581 = (*spvDescriptorSet0.vp_c15)._m0[int(_1577)][_1579];
    int _1583 = int(_1575) + 1;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    int _1587 = _1583 & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    float _1591 = 0.0;
    if (_1420)
    {
        float _1593 = fma(_1526, _1496, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1591 = _1593;
    }
    float _1595 = _1591;
    float _1597 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1420)
    {
        float _1599 = _1506 * _1595;
        _1508 = _1599;
    }
    float _1601 = _1508;
    float _1603 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1597);
    int _1605 = _1534 + 96;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    float _1623 = _1563;
    if (_1420)
    {
        float _1625 = _1563 + (-1.0);
        _864 = _1625;
    }
    float _1627 = _864;
    float _1629 = _1627;
    if (_1420)
    {
        float _1631 = _1376 * _1601;
        _1454 = _1631;
    }
    float _1633 = _1454;
    float _1635 = _1595;
    if (!_1571)
    {
        float _1637 = floor(_1418);
        _1635 = _1637;
    }
    float _1639 = _1635;
    if (!_1571)
    {
        int _1641 = _1482 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1643 = _1641 + _1468;
        _1472 = _1643;
    }
    int _1645 = _1472;
    if (_1420)
    {
        float _1647 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1647;
    }
    float _1649 = _1629;
    if (_1420)
    {
        float _1651 = _1633 * _1633;
        _1456 = _1651;
    }
    float _1653 = _1456;
    int _1655 = _1534 + 104;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    uint _1659 = uint(int(uint(int(_1657)) >> uint(2)));
    int _1661 = int(_1657) & 3;
    float _1663 = (*spvDescriptorSet0.vp_c15)._m0[int(_1659)][_1661];
    int _1665 = int(_1657) + 1;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    int _1669 = _1665 & 3;
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[int(_1667)][_1669];
    int _1673 = as_type<int>(_1653);
    if (_1420)
    {
        float _1675 = fma(_1488, _1563, _1649);
        _1492 = _1675;
    }
    float _1677 = _1492;
    float _1679 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1603);
    float _1681 = _1679;
    if (!_1420)
    {
        _1623 = _1378;
    }
    float _1683 = _1623;
    float _1685 = _1683;
    if (_1420)
    {
        float _1687 = _1378 * _1601;
        _1685 = _1687;
    }
    float _1689 = _1685;
    float _1691 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1420)
    {
        _1681 = _1382;
    }
    float _1693 = _1681;
    int _1695 = _1534 + 80;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    uint _1699 = uint(int(uint(int(_1697)) >> uint(2)));
    int _1701 = int(_1697) & 3;
    float _1703 = (*spvDescriptorSet0.vp_c15)._m0[int(_1699)][_1701];
    int _1705 = int(_1697) + 1;
    uint _1707 = uint(int(uint(_1705) >> uint(2)));
    int _1709 = _1705 & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    float _1713 = -_1374;
    float _1715 = _1354 + _1713;
    float _1717 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1719 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1721 = _1693;
    int _1723 = as_type<int>(_1719);
    if (!_1571)
    {
        int _1725 = _1645 << 2;
        _1458 = _1725;
    }
    int _1727 = _1458;
    if (_1420)
    {
        float _1729 = _1689 * _1689;
        _1721 = _1729;
    }
    float _1731 = _1721;
    float _1733 = fma(_1677, _1677, _1653);
    float _1735 = -_1719;
    float _1737 = fma(_1735, _1717, 1.0);
    int _1739 = _1534 + 56;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    uint _1743 = uint(int(uint(int(_1741)) >> uint(2)));
    int _1745 = int(_1741) & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    int _1749 = int(_1741) + 1;
    uint _1751 = uint(int(uint(_1749) >> uint(2)));
    int _1753 = _1749 & 3;
    float _1755 = (*spvDescriptorSet0.vp_c15)._m0[int(_1751)][_1753];
    if (!_1571)
    {
        int _1757 = 12 & _1727;
        _1723 = _1757;
    }
    int _1759 = _1723;
    float _1761 = _1733 + _1731;
    float _1763 = log2(_1737);
    if (!_1571)
    {
        uint _1765 = uint(int(uint(_1645) >> uint(2)));
        _1673 = int(_1765);
    }
    int _1767 = _1673;
    int _1769 = _1534 + 72;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    uint _1773 = uint(int(uint(int(_1771)) >> uint(2)));
    int _1775 = int(_1771) & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    int _1779 = int(_1771) + 1;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    int _1783 = _1779 & 3;
    float _1785 = (*spvDescriptorSet0.vp_c15)._m0[int(_1781)][_1783];
    float _1787 = _1398 * _1555;
    float _1789 = _1555;
    int _1791 = _1767;
    if (!_1571)
    {
        float _1793 = -_1639;
        float _1795 = _1418 + _1793;
        _1789 = _1795;
    }
    float _1797 = _1789;
    if (!_1571)
    {
        int _1799 = _1767 << 4;
        int _1801 = _1799 + _1759;
        _1791 = _1801;
    }
    int _1803 = _1791;
    float _1805 = fma(_1298, _1547, _1787);
    float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1809 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1807);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = rsqrt(_1761);
    int _1815 = _1534 + 88;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c15)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c15)._m0[int(_1827)][_1829];
    float _1833 = _1398 * _1589;
    float _1835 = _1398 * _1621;
    float _1837 = fma(_1298, _1613, _1835);
    float _1839 = -_1811;
    float _1841 = _1839 + 1.0;
    float _1843 = _1813 * _1633;
    float _1845 = fma(_1302, _1663, _1837);
    float _1847 = _1813 * _1677;
    float _1849 = _1813 * _1689;
    float _1851 = abs(_1841);
    float _1853 = log2(_1851);
    float _1855 = _1845 + _1671;
    float _1857 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float2 _5609 = float2(_1530, _1715);
    float _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5609, float2(0.0), isnan(_5609)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5609, float2(0.0), isnan(_5609)), level(0.0)).x;
    float _1861 = _1813;
    float _1863 = _1837;
    if (!_1571)
    {
        int _1865 = _1803 + 400;
        uint _1867 = uint(int(uint(_1865) >> uint(2)));
        uint _1869 = uint(int(uint(int(_1867)) >> uint(2)));
        int _1871 = int(_1867) & 3;
        float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
        _1861 = _1873;
    }
    float _1875 = _1861;
    float _1877 = _1398 * _1711;
    float _1879 = fma(_1298, _1581, _1833);
    float _1881 = -_1857;
    float _1883 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1881);
    float _1885 = 1.0 / _1855;
    float _1887 = fma(_1298, _1703, _1877);
    float _1889 = -_1849;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1883);
    float _1893 = fma(_1302, _1747, _1805);
    float _1895 = fma(_1891, -0.5, 0.5);
    if (!_1571)
    {
        float _1897 = floor(_1416);
        _1863 = _1897;
    }
    float _1899 = _1863;
    float _1901 = _1893 + _1755;
    float _1903 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1905 = fma(_1891, 0.5, 0.5);
    float _1907 = fma(_1302, _1777, _1879);
    float _1909 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1911 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1903);
    float _1913 = sqrt(_1895);
    float _1915 = _1907 + _1785;
    float _1917 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1919 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1909);
    float _1921 = _1901 * _1885;
    float _1923 = _1915 * _1885;
    float _1925 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1917);
    float _1927 = fma(_1302, _1823, _1887);
    float _1929 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1911);
    bool _1931 = _1921 >= 0.0;
    float _1933 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1925);
    float _1935 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1939 = _1921 <= 1.0;
    bool _1941 = _1939 && _1931;
    float _1943 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1945 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1947 = exp2(_1935);
    bool _1949 = _1923 >= 0.0;
    bool _1951 = _1949 && _1941;
    float _1953 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1955 = _1945 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1957 = _1927 + _1831;
    bool _1959 = _1923 <= 1.0;
    bool _1961 = _1959 && _1951;
    float _1963 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1953);
    float _1965 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1967 = _1847 + 1.0;
    float _1969 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1971 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1963);
    float _1973 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1965);
    float _1975 = fma(_1905, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1977 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1969);
    float _1979 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1971);
    float _1981 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1973);
    float _1983 = -_1847;
    float _1985 = fma(_1947, _1967, _1983);
    float _1987 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1977);
    float _1989 = 1.0 / _1979;
    float _1991 = _1971;
    float _1993 = _1977;
    float _1995 = _1979;
    if (_1961)
    {
        float _1997 = float(_1518);
        _1991 = _1997;
    }
    float _1999 = _1991;
    float _2001 = fma(_1905, _1975, -0.212114393711090087890625);
    float _2003 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1981);
    float _2005 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1987);
    if (!_1571)
    {
        float _2007 = -_1899;
        float _2009 = _1416 + _2007;
        _1993 = _2009;
    }
    float _2011 = _1993;
    float _2013 = _1763 * 0.693147182464599609375;
    float _2015 = fma(_1905, _2001, 1.570728778839111328125);
    float _2017 = _1999;
    float _2019 = _2011;
    if (_1961)
    {
        float _2021 = rint(_1999);
        float _2023 = precise::max(_2021, 0.0);
        uint _2025 = uint(_2023);
        uint _2027 = clamp(_2025, 0u, 65535u);
        _2017 = as_type<float>(_2027);
    }
    float _2029 = _2017;
    float _2031 = _1913 * 0.636619746685028076171875;
    float _2033 = _1957 * _1885;
    float _2035 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2037 = fma(_1985, 0.5, 0.5);
    float _2039 = -_2015;
    float _2041 = fma(_2031, _2039, 1.0);
    float _2043 = _2003 * _1989;
    float _2045 = _2005 * _1989;
    float _2047 = _2013;
    if (!_1571)
    {
        float _2049 = rint(_1875);
        float _2051 = precise::max(_2049, 0.0);
        uint _2053 = uint(_2051);
        uint _2055 = clamp(_2053, 0u, 65535u);
        _2047 = as_type<float>(_2055);
    }
    float _2057 = _2047;
    float _2059 = fma(_2043, 0.5, 0.5);
    float _2061 = fma(_2045, -0.5, 0.5);
    float _2063 = _2029;
    if (_1961)
    {
        float3 _5960 = float3(_1921, _1923, float(as_type<int>(_2029)));
        float3 _5964 = select(_5960, float3(0.0), isnan(_5960));
        float _2065 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5964.xy, uint(rint(_5964.z)), _2033, level(0.0));
        _2063 = _2065;
    }
    float _2067 = _2063;
    float3 _5974 = float3(_2059, _2061, _2035);
    float _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5974, float3(0.0), isnan(_5974)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5974, float3(0.0), isnan(_5974)), level(0.0)).x;
    float3 _5983 = float3(_2059, _2061, _2035);
    float4 _2072 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5983, float3(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5983, float3(0.0), isnan(_5983)), level(0.0)).xyzw;
    float _2074 = _2072.x;
    float _2076 = _2072.y;
    float _2078 = _2072.z;
    float _2080 = _2072.w;
    float2 _5999 = float2(_2041, _2037);
    float3 _2084 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5999, float2(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5999, float2(0.0), isnan(_5999)), level(0.0)).xyz;
    float _2086 = _2084.x;
    float _2088 = _2084.y;
    float _2090 = _2084.z;
    float _2092 = _2057;
    if (!_1571)
    {
        float3 _6020 = float3(_2011, _1797, float(as_type<int>(_2057)));
        float3 _6022 = select(_6020, float3(0.0), isnan(_6020));
        float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6022.xy, uint(rint(_6022.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6022.xy, uint(rint(_6022.z)), level(0.0)).x;
        _2092 = _2094;
    }
    float _2096 = _2092;
    float _2098 = abs(_1430);
    float _2100 = log2(_2098);
    float _2102 = _1943 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2104 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2102);
    float _2106 = fma(_1691, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2104);
    float _2108 = _1853 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2110 = fma(_1955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2106);
    float _2112 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2114 = _2110 + _1979;
    float _2116 = exp2(_2108);
    bool _2118 = _1430 <= 8000.0;
    bool _2120 = isnan(_1430);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(8000.0);
    bool _2126 = _2122 || _2124;
    float _2128 = float(_2126);
    float _2130 = _2114 * 0.5;
    float _2132 = _2110;
    if (!_1961)
    {
        _2019 = 1.0;
    }
    float _2134 = _2019;
    float _2136 = exp2(_2112);
    out.m_91.z = _2130;
    out.m_91.w = _1979;
    float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2140 = precise::clamp(_2138, 0.0, 1.0);
    float _2142 = fma(_2140, -2.0, 3.0);
    float _2144 = _2140 * _2140;
    float _2146 = _2144 * _2142;
    float _2148 = -_2146;
    float _2150 = _2148 + 1.0;
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2005;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1979;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2146);
    float _2154 = -_2116;
    float _2156 = _2154 + 1.0;
    float _2158 = _2128 * _2152;
    float _2160 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2164 = _2003;
    float _2166 = _2134;
    float _2168 = _2156;
    float _2170 = _2162;
    if (_1571)
    {
        _2164 = 1.0;
    }
    float _2172 = _2164;
    float _2174 = -_1859;
    float _2176 = _2174 + 1.0;
    float _2178 = _2176 * _2160;
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    float _2182 = _2172;
    if (_1961)
    {
        bool _2184 = _2067 >= _2033;
        bool _2186 = isnan(_2067);
        bool _2188 = _2184 || _2186;
        bool _2190 = isnan(_2033);
        bool _2192 = _2188 || _2190;
        float _2194 = float(_2192);
        _2166 = _2194;
    }
    float _2196 = _2166;
    if (!_1571)
    {
        int _2198 = _1645 << 4;
        int _2200 = _2198 + 2048;
        uint _2202 = uint(int(uint(_2200) >> uint(2)));
        uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
        int _2206 = int(_2202) & 3;
        float _2208 = (*spvDescriptorSet0.vp_c15)._m0[int(_2204)][_2206];
        int _2210 = int(_2202) + 1;
        uint _2212 = uint(int(uint(_2210) >> uint(2)));
        int _2214 = _2210 & 3;
        float _2216 = (*spvDescriptorSet0.vp_c15)._m0[int(_2212)][_2214];
        int _2218 = _2200 + 8;
        uint _2220 = uint(int(uint(_2218) >> uint(2)));
        uint _2222 = uint(int(uint(int(_2220)) >> uint(2)));
        int _2224 = int(_2220) & 3;
        float _2226 = (*spvDescriptorSet0.vp_c15)._m0[int(_2222)][_2224];
        int _2228 = int(_2220) + 1;
        uint _2230 = uint(int(uint(_2228) >> uint(2)));
        int _2232 = _2228 & 3;
        float _2234 = (*spvDescriptorSet0.vp_c15)._m0[int(_2230)][_2232];
        float _2236 = _1398 * _2216;
        float _2238 = fma(_1298, _2208, _2236);
        float _2240 = fma(_1302, _2226, _2238);
        float _2242 = _2240 + _2234;
        float _2244 = precise::clamp(_2242, 0.0, 1.0);
        float _2246 = -_2244;
        float _2248 = _2246 + _2096;
        float _2250 = fma(_2248, 500.0, 1.5);
        float _2252 = exp2(_2250);
        float _2254 = 0.0 + _2252;
        float _2256 = precise::clamp(_2254, 0.0, 1.0);
        _2182 = _2256;
        _1995 = _2216;
        _2168 = _2226;
        _2132 = _2208;
    }
    float _2258 = _2182;
    float _2260 = _1995;
    float _2262 = _2168;
    float _2264 = _2132;
    float _2266 = _2196 * _2258;
    float _2268 = _2162 * _2069;
    float _2270 = -_2180;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2274 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2276 = isnan(_1390);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2282 = _2278 || _2280;
    float _2284 = _2080 * _2268;
    float _2286 = -_2266;
    float _2288 = fma(_2286, _2272, 1.0);
    float _2290 = precise::clamp(_2288, 0.0, 1.0);
    float _2292 = _2090 * _2268;
    float _2294 = -_2162;
    float _2296 = _2294 + 1.0;
    float _2298 = fma(_2086, _2284, _2074);
    float _2300 = fma(_2088, _2284, _2076);
    float _2302 = _2290 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2304 = _2080 * _2296;
    float _2306 = fma(_2080, _2292, _2078);
    out.m_93.x = _2302;
    float _2308 = _2262;
    float _2310 = _2260;
    float _2312 = _2264;
    float _2314 = _2296;
    float _2316 = _2290;
    if (!_2282)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2318 = _2308;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2282)
    {
        _2310 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2324 = _2310;
    out.m_95.x = _2298;
    out.m_95.y = _2300;
    out.m_95.z = _2306;
    out.m_95.w = _2304;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2282)
    {
        _2312 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2330 = _2312;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2282)
    {
        _2170 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2336 = _2170;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2282)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2342 = _2314;
    float _2344 = _2342;
    float _2346 = _2342;
    if (!_2282)
    {
        _2316 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2348 = _2316;
    bool _2350 = !_2282;
    float _2352 = _2348;
    float _2354 = _2348;
    if (!_2350)
    {
        bool _2356 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2358 = isnan(_1390);
        bool _2360 = _2356 || _2358;
        bool _2362 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2364 = _2360 || _2362;
        if (!_2364)
        {
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2368 = _1390 + _2366;
            float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2372 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2370;
            float _2374 = 1.0 / _2372;
            float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2394 = _2392 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2396 = _2368 * _2374;
            float _2398 = precise::clamp(_2396, 0.0, 1.0);
            float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2404 = fma(_2398, _2378, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2406 = fma(_2398, _2402, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2408 = fma(_2398, _2382, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2410 = fma(_2398, _2386, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2412 = fma(_2398, _2390, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2414 = fma(_2398, _2394, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2406;
            _2346 = _2412;
            _2322 = _2404;
            _2340 = _2410;
            _2334 = _2408;
            _2354 = _2414;
            _2416 = true;
        }
        else
        {
            bool _2418 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2420 = isnan(_1390);
            bool _2422 = _2418 || _2420;
            bool _2424 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2426 = _2422 || _2424;
            if (!_2426)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2428 = _2320;
            _2322 = _2428;
            if (!_2426)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2430 = _2326;
            _2328 = _2430;
            if (!_2426)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2432 = _2332;
            _2334 = _2432;
            if (!_2426)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2434 = _2338;
            _2340 = _2434;
            if (!_2426)
            {
                _2344 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2436 = _2344;
            _2346 = _2436;
            if (!_2426)
            {
                _2352 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2438 = _2352;
            bool _2440 = !_2426;
            _2354 = _2438;
            if (!_2440)
            {
                bool _2442 = _1390 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2444 = isnan(_1390);
                bool _2446 = _2442 || _2444;
                bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2450 = _2446 || _2448;
                if (!_2450)
                {
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2454 = _1390 + _2452;
                    float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2456;
                    float _2460 = 1.0 / _2458;
                    float _2462 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2464 = _2462 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2482 = _2454 * _2460;
                    float _2484 = precise::clamp(_2482, 0.0, 1.0);
                    float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2490 = fma(_2484, _2464, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2492;
                    _2346 = _2498;
                    _2322 = _2490;
                    _2340 = _2496;
                    _2334 = _2494;
                    _2354 = _2500;
                    _2416 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2346 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2354 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2416 = false;
    float _2502 = _2328;
    float _2504 = _2346;
    float _2506 = _2322;
    float _2508 = _2340;
    float _2510 = _2334;
    float _2512 = _2354;
    float _2514 = fma(_1194, -0.5, 0.5);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -_2502;
    float _2520 = _2518 + _2504;
    float _2522 = -_2506;
    float _2524 = _2522 + _2508;
    float _2526 = -_2510;
    float _2528 = _2526 + _2512;
    bool _2530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2532 = fma(_2516, _2520, _2502);
    float _2534 = fma(_2516, _2524, _2506);
    float _2536 = fma(_2516, _2528, _2510);
    float _2538 = _2532 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2540 = fma(_2534, 0.298911988735198974609375, _2538);
    float _2542 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2544 = fma(_2536, 0.114477999508380889892578125, _2540);
    out.m_93.w = _2542;
    float _2546 = -_2544;
    float _2548 = _2534 + _2546;
    float _2550 = -_2544;
    float _2552 = _2532 + _2550;
    float _2554 = -_2544;
    float _2556 = _2536 + _2554;
    out.m_97.x = 0.0;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    out.m_99.x = _2558;
    out.m_99.y = _2560;
    out.m_99.z = _2562;
    if (!_2530)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2564 = -_1314;
    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2568 = -_1320;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2572 = -_1332;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2576 = _2566 * _2566;
    float _2578 = fma(_2570, _2570, _2576);
    float _2580 = fma(_2574, _2574, _2578);
    float _2582 = sqrt(_2580);
    float _2584 = rsqrt(_2580);
    float _2586 = -_2582;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = _2570 * _2584;
    float _2596 = _2566 * _2584;
    float _2598 = abs(_2592);
    float _2600 = log2(_2598);
    float _2602 = _2574 * _2584;
    float _2604 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2606 = _1194 * _2596;
    float _2608 = -_2596;
    float _2610 = -_2604;
    float _2612 = fma(_2608, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2610);
    float _2614 = fma(_1192, _2594, _2606);
    float _2616 = -_2602;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2612);
    float _2620 = fma(_1210, _2602, _2614);
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2626 = _2618 + _2624;
    float _2628 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2630 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = exp2(_2628);
    float _2636 = _2634 * _2632;
    float _2638 = _2622 * _2636;
    float _2640 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2642 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2644 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2640;
    out.m_97.y = _2642;
    out.m_97.z = _2644;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

