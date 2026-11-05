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
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_99 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_81 [[attribute(5)]];
    float4 m_75 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_83 [[attribute(9)]];
    float4 m_77 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3486 = false;
    bool _512 = false;
    bool _338 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = in.m_58.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = _121;
    float _140 = _130;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _136;
    if (!_134)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_134)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3796 = as_type<float>(_148);
        out.gl_Position.z = _3796;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _152 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_121);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _138;
    if (_168)
    {
        out.m_63.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _150 = as_type<int>(_172);
    }
    int _174 = _150;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3851 = as_type<float>(_174);
        out.gl_Position.z = _3851;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_65.x;
    float _178 = in.m_65.y;
    float _180 = in.m_65.z;
    float _182 = 1.0 / _162;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _130 * _182;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_184;
    float _208 = _186;
    float _210 = _200;
    float _228;
    if (!_206)
    {
        float _212 = in.m_67.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        _228 = _186;
    }
    _230 = false;
    float _232 = _228;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _232 + _234;
    bool _238 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _240 = isnan(_232);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    bool _254 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_232);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_248;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = 1.0 / _252;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _278 = _264 * _268;
    float _280 = -_264;
    float _282 = _280 + 1.0;
    float _284 = _236 * _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = fma(_272, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = fma(_288, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = fma(_294, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = _290 * _278;
    float _302 = _298 * _278;
    float _304 = _296 * _278;
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _300);
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _310 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _304);
    float _312 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].x, _306);
    float _314 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].y, _308);
    float _316 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].z, _310);
    bool _318 = !_276;
    float _336;
    if (!_318)
    {
        float _320 = in.m_67.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        _336 = _186;
    }
    _338 = false;
    float _340 = _336;
    float _342 = in.m_69.x;
    float _344 = in.m_69.y;
    float _346 = in.m_69.z;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _350 = _340 + _348;
    bool _352 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = isnan(_340);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _372 = 1.0 / _366;
    bool _374 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _376 = isnan(_340);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _388 = 1.0 / _370;
    float _390 = _314 * _344;
    float _392 = _316 * _346;
    bool _394 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _396 = isnan(_340);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -_362;
    float _408 = _406 + 1.0;
    float _410 = _350 * _372;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _340 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _404 * _408;
    float _422 = -_404;
    float _424 = _422 + 1.0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _430;
    float _434 = fma(_418, _410, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _436 = _384 * _424;
    float _438 = fma(_428, _410, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _440 = fma(_432, _410, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _442 = _414 * _388;
    float _444 = -_384;
    float _446 = _444 + 1.0;
    float _448 = _438 * _436;
    float _450 = _440 * _436;
    float _452 = _434 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _448);
    float _468 = fma(_456, _442, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _470 = fma(_460, _442, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _472 = fma(_464, _442, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _474 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _450);
    float _476 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _452);
    float _478 = fma(_468, _420, _466);
    float _480 = _312 * _342;
    float _482 = fma(_470, _420, _474);
    float _484 = fma(_472, _420, _476);
    float _486 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].x, _478);
    float _488 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].y, _482);
    float _490 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].z, _484);
    bool _492 = !_386;
    float _510;
    if (!_492)
    {
        float _494 = in.m_67.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        _510 = _186;
    }
    _512 = false;
    float _514 = _510;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_514);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_514);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = 1.0 / _522;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _558;
    float _562 = -_538;
    float _564 = _562 + 1.0;
    bool _566 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_514);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _580 = 1.0 / _526;
    float _582 = 1.0 / _542;
    float _584 = _560 * _556;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _590 = _554 * _564;
    float _592 = -_554;
    float _594 = _592 + 1.0;
    float _596 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _598;
    float _602 = _576 * _594;
    float _604 = _588 * _580;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _514 + _606;
    bool _610 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = isnan(_514);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _596 * _602;
    float _624 = -_576;
    float _626 = _624 + 1.0;
    float _628 = fma(_604, _608, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = _514 + _630;
    float _634 = _600 * _582;
    float _636 = -_620;
    float _638 = _636 + 1.0;
    float _640 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _622);
    float _642 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_634, _632, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _646 = _538 * _638;
    float _648 = fma(_628, _590, _640);
    float _650 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = fma(_644, _646, _648);
    float _656 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[118].x, _654);
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _652;
    out.m_71.y = _662;
    out.m_71.z = _658;
    out.m_71.w = _664;
    bool _666 = !_578;
    if (!_666)
    {
        float _668 = in.m_67.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _208 = _682;
    }
    float _684 = _208;
    float _686 = in.m_56.x;
    float _688 = in.m_56.y;
    float _690 = in.m_56.z;
    float _692 = _688 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _694 = _688 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[4].x, _692);
    float _698 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[6].x, _694);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[4].z, _696);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _704 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _706 = _702 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _708 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _710 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _712 = floor(_708);
    float _714 = floor(_710);
    float _716 = -_712;
    float _718 = _708 + _716;
    float _720 = -_714;
    float _722 = _710 + _720;
    float2 _4768 = float2(_718, _722);
    float _724 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).x;
    float _726 = in.m_67.x;
    float _728 = in.m_67.y;
    float _730 = _688 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _732 = in.m_67.z;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _738 = _736 != 0;
    float _740 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _742 = log2(_740);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _754 = _728 * 2.0;
    float _756 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _758 = _726 * 2.0;
    float _760 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = floor(_754);
    float _764 = _732 * 2.0;
    float _766 = fma(_756, -2.0, _734);
    float _768 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[5].x, _730);
    float _770 = -_744;
    float _772 = fma(_760, 2.0, _770);
    float _774 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _776 = floor(_758);
    float _778 = _728 + _732;
    float _780 = _686;
    int _782 = 2;
    float _784 = _726;
    if (!_738)
    {
        _780 = _728;
    }
    float _786 = _780;
    float _788 = _774 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _786;
    if (_738)
    {
        _790 = _726;
    }
    float _792 = _790;
    float _794 = _778 + (-1.0);
    float _796 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _766);
    float _798 = floor(_764);
    float _800 = _728 + _726;
    bool _802 = _762 > 0.0;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _806 = _762 >= 0.0;
    bool _808 = isnan(_762);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _800 + (-1.0);
    float _818 = _792 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _820 = _776 > 0.0;
    float _822 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _826 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _828 = int(_826);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _832 = _816;
    float _834 = _794;
    if (!_738)
    {
        _832 = _732;
    }
    float _836 = _832;
    float _838 = -_804;
    float _840 = fma(_818, 2.0, _838);
    float _842 = _836;
    if (_738)
    {
        _842 = _728;
    }
    float _844 = _842;
    float _846 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    bool _848 = _798 > 0.0;
    float _850 = -_130;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _772);
    bool _854 = _798 >= 0.0;
    bool _856 = isnan(_798);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    bool _866 = _776 >= 0.0;
    bool _868 = isnan(_776);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    float _876 = _742 * _130;
    int _878 = _862 ? 0 : 1;
    float _880 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    if (!_738)
    {
        _834 = _732;
    }
    float _882 = _834;
    float _884 = float(_828);
    float _886 = exp2(_876);
    float _888 = _882;
    if (_738)
    {
        _888 = _728;
    }
    float _890 = _888;
    int _892 = ~_878;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _900 = _896;
    if (!_848)
    {
        int _902 = ~_878;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = 1.0 / _884;
    int _910 = _874 ? 0 : 1;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _914 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = fma(_898, -2.0, _752);
    float _926 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    int _928 = ~_910;
    int _930 = _928 + 1;
    int _932 = _930 + 1;
    float _934 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _936 = int(_934);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _944 = _942 != 0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _948 = 1.0 + _946;
    int _950 = _932;
    if (!_820)
    {
        int _952 = ~_910;
        int _954 = _952 + 1;
        _950 = _954;
    }
    int _956 = _950;
    float _958 = -_886;
    float _960 = _958 + 1.0;
    bool _962 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _964 = isnan(1.0);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _970 = _966 || _968;
    float _972 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _974 = _814 ? 0 : 1;
    float _976 = _908 * _130;
    float _978 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _926);
    bool _980 = !_944;
    int _982 = _980 ? 0 : 1;
    float _984 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _986 = !_940;
    int _988 = _986 ? 0 : 1;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1002 = _1000 != 0;
    float _1004 = 1.0 / _948;
    int _1006 = ~_974;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].x, _984);
    int _1014 = _1010;
    if (!_802)
    {
        int _1016 = ~_974;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].z, _990);
    float _1024 = in.m_73.x;
    float _1026 = in.m_73.y;
    float _1028 = in.m_73.z;
    bool _1030 = !_994;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1012);
    bool _1036 = !_998;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1022);
    int _1042 = abs(_1032);
    float _1044 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1046 = abs(_1038);
    float _1048 = -_130;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _840);
    float _1052 = float(_936);
    float _1054 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1056 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1044);
    float _1058 = _922 ? _960 : 0.0;
    float _1060 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _864);
    float _1062 = float(_1042);
    float _1064 = _1052 * _130;
    float _1066 = float(_906);
    float _1068 = 1.0 / _1054;
    float _1070 = float(_956);
    float _1072 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1056);
    float _1074 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _924);
    if (_970)
    {
        float _1076 = _1058 * _1004;
        _140 = _1076;
    }
    float _1078 = _140;
    float _1080 = _1062 * _1066;
    bool _1082 = !_1002;
    int _1084 = _1082 ? 0 : 1;
    float _1086 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1088 = float(_1046);
    float _1090 = _1080 * (-2.0);
    int _1092 = abs(_1084);
    float _1094 = _1086 + _1054;
    float _1096 = _1088 * _1070;
    float _1098 = _726 + (-0.5);
    float _1100 = fma(_1090, _1024, _1024);
    float _1102 = fma(_824, _1090, _824);
    float _1104 = _1096 * (-2.0);
    float _1106 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1100);
    float _1108 = float(_1020);
    float _1110 = _1094 * _1068;
    float _1112 = _1110 * 0.5;
    float _1114 = float(_1092);
    float _1116 = fma(_822, _1104, _822);
    float _1118 = fma(_1102, _1078, _1106);
    float _1120 = fma(_1104, _1026, _1026);
    float _1122 = _728 + (-0.5);
    float _1124 = _1114 * _1108;
    float _1126 = _726 + _732;
    float _1128 = _1118 * 0.15915493667125701904296875;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1132 = _1126 + (-1.0);
    float _1134 = _1124 * (-2.0);
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1138 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1136);
    float _1140 = fma(_1116, _1078, _1130);
    float _1142 = in.m_75.x;
    float _1144 = in.m_75.y;
    float _1146 = in.m_75.z;
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1150 = fma(_1134, _1028, _1028);
    float _1152 = _732 + (-0.5);
    float _1154 = 1.0 / _1138;
    float _1156 = fma(_1148, _1134, _1148);
    float _1158 = _1140 * 0.15915493667125701904296875;
    float _1160 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1150);
    float _1162 = _788 + _972;
    float _1164 = fma(_1156, _1078, _1160);
    float _1166 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1168 = _1128 * 6.283185482025146484375;
    float _1170 = cos(_1168);
    float _1172 = _1164 * 0.15915493667125701904296875;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1176 = _1154 * _1174;
    float _1178 = _1158 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1142);
    bool _1184 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1144);
    bool _1188 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1190 = _1182 * _1166;
    float _1192 = _1158 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1146);
    float _1198 = _1196 * _746;
    float _1200 = _1172 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = _1170 * _1180;
    float _1206 = _1162;
    if (!_1184)
    {
        _782 = 1;
    }
    int _1208 = _782;
    float _1210 = _1128 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = _1170 * _1194;
    float _1216 = _1172 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1170 * _1202;
    float _1222 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1224 = _1186 * _750;
    float _1226 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1222);
    float _1228 = _1212 * _1180;
    float _1230 = _1212 * _1194;
    bool _1232 = !_1184;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1226);
    float _1238 = _1194 * _1202;
    float _1240 = _1212 * _1202;
    int _1242 = _1208;
    if (!_1188)
    {
        _1242 = _1234;
    }
    int _1244 = _1242;
    float _1246 = _1220 * _1224;
    float _1248 = fma(_1218, _1214, _1228);
    float _1250 = fma(_1218, _1228, _1214);
    float _1252 = -_1204;
    float _1254 = fma(_1218, _1230, _1252);
    float _1256 = -_1230;
    float _1258 = fma(_1218, _1204, _1256);
    float _1260 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1262 = _1236 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1264 = fma(_1248, _1190, _1246);
    float _1266 = _1180 * _1202;
    float _1268 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1260);
    float _1270 = -_1224;
    float _1272 = _1218 * _1270;
    float _1274 = _1240 * _1224;
    float _1276 = fma(_1258, _1198, _1264);
    float _1278 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1268);
    float _1280 = fma(_1238, _1190, _1272);
    float _1282 = fma(_1254, _1190, _1274);
    float _1284 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1288 = fma(_1266, _1198, _1280);
    float _1290 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1292 = fma(_1250, _1198, _1282);
    float _1294 = trunc(_1262);
    int _1296 = int(_1294);
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1284);
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1290);
    int _1302 = _1244 << 6;
    float _1304 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1306 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1300);
    int _1310 = _1302 + 48;
    uint _1313 = uint(int(uint(_1310) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = trunc(_1286);
    int _1331 = int(_1329);
    float _1333 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1337 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1304);
    float _1339 = _706 + _1333;
    float _1341 = _704 + _1335;
    int _1343 = _1302 + 56;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
    int _1349 = int(_1345) & 3;
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[int(_1347)][_1349];
    int _1353 = int(_1345) + 1;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    int _1357 = _1353 & 3;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[int(_1355)][_1357];
    int _1361 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1363 = _1296 + _1361;
    int _1365 = _1363 + 1;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1369 = _1339 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1373 = _1341 + _1371;
    float _1375 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1337);
    bool _1377 = _1365 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1379 = _1369 * _1369;
    int _1381 = _1302 + 64;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1401 = _1331 + _1399;
    int _1403 = _1401 + 1;
    float _1405 = fma(_1373, _1373, _1379);
    float _1407 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1409 = _1365 | _1403;
    int _1411 = _1302 + 72;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
    int _1417 = int(_1413) & 3;
    float _1419 = (*spvDescriptorSet0.vp_c15)._m0[int(_1415)][_1417];
    int _1421 = int(_1413) + 1;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    int _1425 = _1421 & 3;
    float _1427 = (*spvDescriptorSet0.vp_c15)._m0[int(_1423)][_1425];
    bool _1429 = _1409 < 0;
    bool _1431 = _1429 || _1377;
    float _1433 = sqrt(_1405);
    bool _1435 = _1403 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1437 = _1435 || _1431;
    int _1439 = _1302 + 96;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    uint _1443 = uint(int(uint(int(_1441)) >> uint(2)));
    int _1445 = int(_1441) & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    int _1449 = int(_1441) + 1;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    int _1453 = _1449 & 3;
    float _1455 = (*spvDescriptorSet0.vp_c15)._m0[int(_1451)][_1453];
    int _1457 = _1302 + 104;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    int _1475 = as_type<int>(_1304);
    int _1477 = as_type<int>(_1292);
    float _1479 = _1407;
    float _1481 = _1341;
    float _1483 = _1339;
    if (!_1437)
    {
        int _1485 = _1403 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1487 = _1485 + _1365;
        _1475 = _1487;
    }
    int _1489 = _1475;
    bool _1491 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _788 + _1407;
    int _1495 = 0;
    float _1497 = as_type<float>(_1489);
    if (!_1437)
    {
        int _1499 = _1489 << 2;
        _1495 = _1499;
    }
    int _1501 = _1495;
    int _1503 = _1501;
    if (!_1437)
    {
        uint _1505 = uint(int(uint(_1489) >> uint(2)));
        _1477 = int(_1505);
    }
    int _1507 = _1477;
    float _1509 = as_type<float>(_1507);
    if (!_1437)
    {
        int _1511 = 12 & _1501;
        _1503 = _1511;
    }
    int _1513 = _1503;
    if (!_1437)
    {
        int _1515 = _1507 << 4;
        int _1517 = _1515 + _1513;
        _1479 = as_type<float>(_1517);
    }
    float _1519 = _1479;
    if (!_1491)
    {
        _1509 = _1341;
    }
    float _1521 = _1509;
    float _1523 = _1521;
    if (!_1491)
    {
        _1481 = _1493;
    }
    float _1525 = _1481;
    bool _1527 = !_1491;
    float _1529 = _1525;
    float _1531 = _1455;
    float _1533 = _1419;
    if (!_1527)
    {
        float _1535 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1539 = _1433 + _1537;
        float _1541 = rsqrt(_1405);
        float _1543 = _1539 * _1535;
        float _1545 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1547 = _1543 * 0.15915493667125701904296875;
        float _1549 = _1547 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        float _1557 = _1551 + (-1.0);
        float _1559 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1561 = fma(_1555, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1563 = fma(_1493, _1551, _1559);
        float _1565 = _1541 * _1561;
        float _1567 = fma(_1373, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1569 = fma(_1369, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1529 = _1563;
        _1523 = _1567;
        _1483 = _1569;
    }
    float _1571 = _1529;
    float _1573 = _1523;
    float _1575 = _1483;
    float _1577 = -_788;
    float _1579 = _1577 + _1571;
    int _1581 = _1302 + 80;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    uint _1585 = uint(int(uint(int(_1583)) >> uint(2)));
    int _1587 = int(_1583) & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    int _1591 = int(_1583) + 1;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    int _1595 = _1591 & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    float _1599 = -_704;
    float _1601 = _1599 + _1573;
    float _1603 = -_706;
    float _1605 = _1603 + _1575;
    float _1607 = _1579 * _1579;
    float _1609 = _1162 * _1455;
    float _1611 = _1162 * _1397;
    float _1613 = _1573;
    float _1615 = _1571;
    float _1617 = _1575;
    float _1619 = _1579;
    if (!_1437)
    {
        float _1621 = floor(_1262);
        _1531 = _1621;
    }
    float _1623 = _1531;
    float _1625 = fma(_1601, _1601, _1607);
    int _1627 = _1302 + 88;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    float _1645 = fma(_704, _1447, _1609);
    float _1647 = fma(_1605, _1605, _1625);
    bool _1649 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1651 = isnan(0.5);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1657 = _1653 || _1655;
    float _1659 = fma(_706, _1465, _1645);
    float _1661 = _1162 * _1327;
    float _1663 = sqrt(_1647);
    float _1665 = _1519;
    if (!_1437)
    {
        int _1667 = as_type<int>(_1519) + 400;
        uint _1669 = uint(int(uint(_1667) >> uint(2)));
        uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
        int _1673 = int(_1669) & 3;
        float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
        _1665 = _1675;
    }
    float _1677 = _1665;
    float _1679 = _1659 + _1473;
    float _1681 = fma(_704, _1389, _1611);
    float _1683 = fma(_704, _1319, _1661);
    float _1685 = fma(_706, _1419, _1681);
    float _1687 = _1645;
    float _1689 = _1681;
    float _1691 = _1683;
    if (!_1437)
    {
        float _1693 = floor(_1286);
        _1687 = _1693;
    }
    float _1695 = _1687;
    float _1697 = fma(_706, _1351, _1683);
    float _1699 = _1685 + _1427;
    float _1701 = _1697 + _1359;
    bool _1703 = _1663 > 0.0;
    float _1705 = 1.0 / _1679;
    bool _1707 = !_1703;
    if (!_1707)
    {
        float _1709 = _202 * _202;
        float _1711 = fma(_200, _200, _1709);
        float _1713 = fma(_204, _204, _1711);
        float _1715 = rsqrt(_1647);
        float _1717 = sqrt(_1713);
        float _1719 = _1601 * _1715;
        float _1721 = _1579 * _1715;
        float _1723 = _1605 * _1715;
        bool _1725 = _1717 > 0.0;
        bool _1727 = !_1725;
        _1689 = _1715;
        _1691 = _1713;
        if (!_1727)
        {
            float _1729 = rsqrt(_1713);
            float _1731 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1733 = _202 * _1729;
            float _1735 = _200 * _1729;
            float _1737 = _204 * _1729;
            float _1739 = _1721 * _1733;
            float _1741 = fma(_1719, _1735, _1739);
            float _1743 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1745 = fma(_1723, _1737, _1741);
            float _1747 = _1745 * _1743;
            float _1749 = fma(_200, _1747, _1573);
            float _1751 = fma(_202, _1747, _1571);
            float _1753 = fma(_204, _1747, _1575);
            _1613 = _1749;
            _1615 = _1751;
            _1617 = _1753;
            _1689 = _1747;
            _1533 = _1741;
        }
    }
    float _1755 = _1613;
    float _1757 = _1615;
    float _1759 = _1617;
    float _1761 = _1689;
    float _1763 = _1691;
    float _1765 = _1533;
    float _1767 = _1763;
    float _1769 = _1761;
    float _1771 = _1765;
    float _1773 = _1757;
    if (_1657)
    {
        _1767 = _1755;
    }
    float _1775 = _1767;
    float _1777 = _1775;
    if (_1657)
    {
        _1769 = _1757;
    }
    float _1779 = _1769;
    float _1781 = _1779;
    if (_1657)
    {
        _210 = _1759;
    }
    float _1783 = _210;
    float _1785 = _1783;
    if (!_1657)
    {
        float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1789 = _788 + _1787;
        float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1793 = _704 + _1791;
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1797 = -_788;
        float _1799 = _1797 + _1757;
        float _1801 = _1789 * _1789;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1805 = _706 + _1803;
        float _1807 = -_706;
        float _1809 = _1807 + _1759;
        float _1811 = fma(_1793, _1793, _1801);
        float _1813 = fma(_1805, _1805, _1811);
        float _1815 = sqrt(_1813);
        float _1817 = precise::min(_1815, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1819 = _1817 * _1795;
        float _1821 = -_704;
        float _1823 = _1821 + _1755;
        float _1825 = fma(_1799, _1819, _788);
        float _1827 = fma(_1823, _1819, _704);
        float _1829 = fma(_1809, _1819, _706);
        _1781 = _1825;
        _1777 = _1827;
        _1785 = _1829;
        _1771 = _1809;
    }
    float _1831 = _1781;
    float _1833 = _1777;
    float _1835 = _1785;
    float _1837 = _1771;
    float _1839 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1841 = _1701 * _1705;
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1845 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1839);
    float _1849 = _1699 * _1705;
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1843);
    float _1853 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1845);
    bool _1855 = _1841 >= 0.0;
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1847);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1851);
    float _1861 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1853);
    bool _1863 = _1841 <= 1.0;
    bool _1865 = _1863 && _1855;
    float _1867 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1869 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1871 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1873 = _1849 >= 0.0;
    bool _1875 = _1873 && _1865;
    float _1877 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1867);
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1881 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1883 = _1849 <= 1.0;
    bool _1885 = _1883 && _1875;
    float _1887 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1877);
    float _1889 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1879);
    float _1891 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1893 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1895 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1897 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1889);
    float _1899 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = -_1893;
    float _1903 = fma(_1901, _1891, 1.0);
    float _1905 = _1162 * _1597;
    float _1907 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1897);
    float _1909 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1911 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1913 = fma(_704, _1589, _1905);
    float _1915 = log2(_1903);
    float _1917 = _1905;
    if (_1885)
    {
        float _1919 = float(_1244);
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1909);
    float _1925 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1911);
    float _1927 = fma(_706, _1635, _1913);
    float _1929 = _1925;
    if (!_1437)
    {
        float _1931 = -_1695;
        float _1933 = _1286 + _1931;
        _1619 = _1933;
    }
    float _1935 = _1619;
    float _1937 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1923);
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1941 = 1.0 / _1907;
    float _1943 = _1927 + _1643;
    float _1945 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    if (!_1437)
    {
        float _1947 = -_1623;
        float _1949 = _1262 + _1947;
        _1929 = _1949;
    }
    float _1951 = _1929;
    float _1953 = _1943 * _1705;
    float _1955 = _1837;
    if (!_1437)
    {
        float _1957 = rint(_1677);
        float _1959 = precise::max(_1957, 0.0);
        uint _1961 = uint(_1959);
        uint _1963 = clamp(_1961, 0u, 65535u);
        _1955 = as_type<float>(_1963);
    }
    float _1965 = _1955;
    float _1967 = _1915 * 0.693147182464599609375;
    float _1969 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1971 = _1921;
    if (_1885)
    {
        float _1973 = rint(_1921);
        float _1975 = precise::max(_1973, 0.0);
        uint _1977 = uint(_1975);
        uint _1979 = clamp(_1977, 0u, 65535u);
        _1971 = as_type<float>(_1979);
    }
    float _1981 = _1971;
    float _1983 = _1939 * _1941;
    float _1985 = _1945 * _1941;
    float _1987 = fma(_1983, 0.5, 0.5);
    float _1989 = fma(_1985, -0.5, 0.5);
    float _1991 = _1935;
    if (!_1437)
    {
        float3 _6805 = float3(_1951, _1935, float(as_type<int>(_1965)));
        float3 _6809 = select(_6805, float3(0.0), isnan(_6805));
        float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6809.xy, uint(rint(_6809.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6809.xy, uint(rint(_6809.z)), level(0.0)).x;
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1849;
    if (_1885)
    {
        float3 _6824 = float3(_1841, _1849, float(as_type<int>(_1981)));
        float3 _6826 = select(_6824, float3(0.0), isnan(_6824));
        float _1999 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6826.xy, uint(rint(_6826.z)), _1953, level(0.0));
        _1997 = _1999;
    }
    float _2001 = _1997;
    float3 _6836 = float3(_1987, _1989, _1969);
    float _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6836, float3(0.0), isnan(_6836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6836, float3(0.0), isnan(_6836)), level(0.0)).x;
    float3 _6845 = float3(_1987, _1989, _1969);
    float4 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6845, float3(0.0), isnan(_6845)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6845, float3(0.0), isnan(_6845)), level(0.0)).xyzw;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _2006.w;
    float _2016 = float(uint(_936));
    float _2018 = trunc(_976);
    int _2020 = int(_2018);
    float _2022 = 1.0 / _2016;
    float _2024 = float(uint(_2020));
    int _2026 = as_type<int>(_2022) + (-2);
    float _2028 = as_type<float>(_2026) * _2024;
    float _2030 = trunc(_2028);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    int _2036 = ~_936;
    int _2038 = _2036 + 1;
    bool _2040 = !_738;
    float _2042 = _2040 ? 7.345489978790283203125 : 1.0;
    bool _2044 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2046 = isnan(0.5);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2052 = _2048 || _2050;
    int _2054 = _2038 * int(_2034);
    int _2056 = _2054 + _2020;
    float _2058 = _2042 * _726;
    float _2060 = float(uint(_2056));
    float _2062 = as_type<float>(_2026) * _2060;
    int _2064 = ~_936;
    int _2066 = _2064 + 1;
    float _2068 = _2062;
    if (_2052)
    {
        _784 = 1.0;
    }
    float _2070 = _784;
    float _2072 = trunc(_2062);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    float _2078 = _2070;
    if (_1437)
    {
        _2068 = 1.0;
    }
    float _2080 = _2068;
    int _2082 = int(_2034) + int(_2076);
    float _2084 = floor(_2058);
    int _2086 = _2066 * _2082;
    int _2088 = _2086 + _2020;
    bool _2090 = uint(_2088) >= uint(_936);
    bool _2092 = !_2090;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = -_2084;
    float _2098 = _2058 + _2096;
    int _2100 = ~_2082;
    int _2102 = _2100 + _2094;
    int _2104 = _2102 + 1;
    float _2106 = _2080;
    if (!_2052)
    {
        float _2108 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2116 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2114;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2112 * 0.15915493667125701904296875;
        float _2124 = _2110 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        float _2128 = 1.0 / _2120;
        float _2130 = _2122 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = _2126 * _2128;
        float _2136 = _2122 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        float _2140 = _2132 * _2134;
        float _2142 = 1.0 / _2116;
        float _2144 = 1.0 / _2140;
        float _2146 = _2138 * _2144;
        float _2148 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2150 = fma(_1176, _2146, _2148);
        float _2152 = _2150 * _2142;
        float _2154 = precise::clamp(_2152, 0.0, 1.0);
        _1773 = _2122;
        _2078 = _2154;
    }
    float _2156 = _1773;
    float _2158 = _2078;
    float _2160 = _2156;
    if (!_1437)
    {
        int _2162 = _1489 << 4;
        int _2164 = _2162 + 2048;
        uint _2166 = uint(int(uint(_2164) >> uint(2)));
        uint _2168 = uint(int(uint(int(_2166)) >> uint(2)));
        int _2170 = int(_2166) & 3;
        float _2172 = (*spvDescriptorSet0.vp_c15)._m0[int(_2168)][_2170];
        int _2174 = int(_2166) + 1;
        uint _2176 = uint(int(uint(_2174) >> uint(2)));
        int _2178 = _2174 & 3;
        float _2180 = (*spvDescriptorSet0.vp_c15)._m0[int(_2176)][_2178];
        int _2182 = _2164 + 8;
        uint _2184 = uint(int(uint(_2182) >> uint(2)));
        uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
        int _2188 = int(_2184) & 3;
        float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
        int _2192 = int(_2184) + 1;
        uint _2194 = uint(int(uint(_2192) >> uint(2)));
        int _2196 = _2192 & 3;
        float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
        float _2200 = _1162 * _2180;
        float _2202 = fma(_704, _2172, _2200);
        float _2204 = fma(_706, _2190, _2202);
        float _2206 = _2204 + _2198;
        float _2208 = precise::clamp(_2206, 0.0, 1.0);
        float _2210 = -_2208;
        float _2212 = _2210 + _1995;
        float _2214 = fma(_2212, 500.0, 1.5);
        float _2216 = exp2(_2214);
        float _2218 = 0.0 + _2216;
        float _2220 = precise::clamp(_2218, 0.0, 1.0);
        _1206 = _2200;
        _1497 = as_type<float>(_2164);
        _2106 = _2220;
    }
    float _2222 = _1206;
    float _2224 = _1497;
    float _2226 = _2106;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2230 = _1831 + _2228;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2234 = _1833 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2238 = _1835 + _2236;
    float _2240 = _2230 * _2230;
    float _2242 = fma(_2234, _2234, _2240);
    float _2244 = fma(_2238, _2238, _2242);
    float _2246 = rsqrt(_2244);
    float _2248 = sqrt(_2244);
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2252 = _2234 * _2250;
    float _2254 = _2238 * _2250;
    float _2256 = _2252 * _2252;
    float _2258 = _2254 * _2254;
    float _2260 = _2256 + _2258;
    float _2262 = sqrt(_2260);
    bool _2264 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2268 = _2262 + _2266;
    float _2270 = _2222;
    float _2272 = _2260;
    float _2274 = _2268;
    float _2276 = _2252;
    float _2278 = _2254;
    float _2280 = _2256;
    float _2282 = _2258;
    int _2284 = as_type<int>(_2250);
    if (_2264)
    {
        float _2286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2270 = _2286;
    }
    float _2288 = _2270;
    if (_2264)
    {
        float _2290 = rsqrt(_2260);
        _2272 = _2290;
    }
    float _2292 = _2272;
    if (_2264)
    {
        float _2294 = _2268 * _2288;
        _2274 = _2294;
    }
    float _2296 = _2274;
    if (_2264)
    {
        float _2298 = _2296 * 0.15915493667125701904296875;
        _2160 = _2298;
    }
    float _2300 = _2160;
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2304 = _2224;
    float _2306 = _2300;
    if (_2264)
    {
        float _2308 = _2300 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        _2304 = _2310;
    }
    float _2312 = _2304;
    float _2314 = precise::max(0.0, _2302);
    float _2316 = _2296;
    float _2318 = _2314;
    if (_2264)
    {
        float _2320 = _2300 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        _2316 = _2322;
    }
    float _2324 = _2316;
    float _2326 = -_2250;
    float _2328 = -_2314;
    float _2330 = fma(_2230, _2326, _2328);
    float _2332 = _2330;
    if (_2264)
    {
        float _2334 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2318 = _2334;
    }
    float _2336 = _2318;
    float _2338 = _2312;
    float _2340 = _2336;
    if (_2264)
    {
        float _2342 = fma(_2312, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2338 = _2342;
    }
    float _2344 = _2338;
    float _2346 = _2344;
    if (_2264)
    {
        float _2348 = _2292 * _2344;
        _2346 = _2348;
    }
    float _2350 = _2346;
    if (_2264)
    {
        float _2352 = _2324 + (-1.0);
        _2340 = _2352;
    }
    float _2354 = _2340;
    float _2356 = _2354;
    if (_2264)
    {
        float _2358 = _2252 * _2350;
        _2276 = _2358;
    }
    float _2360 = _2276;
    if (_2264)
    {
        float _2362 = _2254 * _2350;
        _2278 = _2362;
    }
    float _2364 = _2278;
    if (_2264)
    {
        float _2366 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2366;
    }
    float _2368 = _2356;
    if (_2264)
    {
        float _2370 = _2360 * _2360;
        _2280 = _2370;
    }
    float _2372 = _2280;
    if (_2264)
    {
        float _2374 = _2364 * _2364;
        _2282 = _2374;
    }
    float _2376 = _2282;
    if (_2264)
    {
        float _2378 = fma(_2330, _2324, _2368);
        _2332 = _2378;
    }
    float _2380 = _2332;
    float _2382 = fma(_2380, _2380, _2372);
    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2386 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2384);
    float _2388 = precise::clamp(_2386, 0.0, 1.0);
    float _2390 = _2382 + _2376;
    float _2392 = -_2388;
    float _2394 = _2392 + 1.0;
    float _2396 = rsqrt(_2390);
    float _2398 = _2396 * _2360;
    float _2400 = _2396 * _2380;
    float _2402 = _2396 * _2364;
    float _2404 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2406 = abs(_2394);
    float _2408 = log2(_2406);
    float _2410 = -_2404;
    float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2410);
    float _2414 = -_2402;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2412);
    float _2418 = fma(_2416, -0.5, 0.5);
    float _2420 = fma(_2416, 0.5, 0.5);
    float _2422 = float(_2020);
    float _2424 = fma(_2420, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2426 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2428 = sqrt(_2418);
    float _2430 = fma(_2420, _2424, -0.212114393711090087890625);
    bool _2432 = _2422 >= _1052;
    bool _2434 = isnan(_2422);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan(_1052);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = _2400 + 1.0;
    float _2446 = fma(_2420, _2430, 1.570728778839111328125);
    float _2448 = exp2(_2426);
    float _2450 = _2428 * 0.636619746685028076171875;
    float _2452 = trunc(_2442);
    int _2454 = int(_2452);
    float _2456 = -_2400;
    float _2458 = fma(_2448, _2444, _2456);
    float _2460 = -_2446;
    float _2462 = fma(_2450, _2460, 1.0);
    float _2464 = fma(_2458, 0.5, 0.5);
    float2 _7507 = float2(_2462, _2464);
    float3 _2468 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7507, float2(0.0), isnan(_7507)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7507, float2(0.0), isnan(_7507)), level(0.0)).xyz;
    float _2470 = _2468.x;
    float _2472 = _2468.y;
    float _2474 = _2468.z;
    int _2476 = _936 * _2104;
    int _2478 = _2476 + _2020;
    bool _2480 = _936 == 0;
    float _2482 = _1052 * _2098;
    float _2484 = in.m_77.x;
    int _2486 = ~_2454;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2494 = !_2480;
    int _2496 = _2494 ? _2478 : (-1);
    float _2498 = _1064 * _182;
    int _2500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2502 = _2500 != 0;
    float _2504 = trunc(_2482);
    int _2506 = int(_2504);
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2510 = _2508 != 0;
    int _2512 = _2490 * _2496;
    int _2514 = _936 + (-1);
    float _2516 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2518 = !_2502;
    int _2520 = _2518 ? 0 : 1;
    float _2522 = -_724;
    float _2524 = _2522 + 1.0;
    int _2526 = abs(_982);
    float _2528 = trunc(_2498);
    int _2530 = int(_2528);
    int _2532 = _2454 * _2514;
    int _2534 = _2532 + _2512;
    int _2536 = abs(_2520);
    float _2538 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2516);
    out.m_79.x = _1833;
    out.m_79.y = _1831;
    out.m_79.z = _1835;
    int _2540 = abs(_988);
    float _2542 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2538);
    int _2544 = _2534 * _2526;
    float _2546 = as_type<float>(_2536);
    float _2548 = as_type<float>(_2540);
    if (_2510)
    {
        float _2550 = in.m_67.x;
        _2546 = _2550;
    }
    float _2552 = _2546;
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2556 = _2554 != 0;
    int _2558 = _2506 * _2536;
    int _2560 = _2558 + _2020;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2564 = _2562 != 0;
    float _2566 = exp2(_2492);
    int _2568 = _2530 * _2540;
    int _2570 = _2568 + _2544;
    bool _2572 = !_2556;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = in.m_77.y;
    bool _2578 = !_2564;
    int _2580 = _2578 ? 0 : 1;
    int _2582 = abs(_2574);
    float _2584 = in.m_67.w;
    int _2586 = abs(_2580);
    int _2588 = _2560 * _2582;
    int _2590 = _2588 + _2570;
    int _2592 = _2506;
    bool _2594 = _2564;
    float _2596 = _2484;
    if (!_2510)
    {
        _2548 = _2484;
    }
    float _2598 = _2548;
    bool _2600 = _728 > 0.5;
    int _2602 = _2506 * _2586;
    int _2604 = _2602 + _2590;
    float _2606 = _2598;
    if (_2510)
    {
        float _2608 = -_2484;
        float _2610 = _2608 + 1.0;
        _2592 = as_type<int>(_2610);
    }
    int _2612 = _2592;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2620 = _2618 != 0;
    if (_2510)
    {
        bool _2622 = _2552 > 0.5;
        _2594 = _2622;
    }
    bool _2624 = _2594;
    float _2626 = 1.0 / _2616;
    float _2628 = float(uint(_2604));
    if (_2510)
    {
        float _2630 = _2624 ? as_type<float>(_2612) : _2484;
        _2606 = _2630;
    }
    float _2632 = _2606;
    int _2634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2636 = _2634 != 0;
    float _2638 = as_type<float>(_2026) * _2628;
    float _2640 = -_2576;
    float _2642 = _2640 + 1.0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2646 = _2644 != 0;
    float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2652 = _2650 != 0;
    float _2654 = _2576;
    bool _2656 = _2646;
    if (_2620)
    {
        float _2658 = -_2484;
        float _2660 = _2658 + 1.0;
        _2284 = as_type<int>(_2660);
    }
    int _2662 = _2284;
    int _2664 = _2600 ? as_type<int>(_2642) : as_type<int>(_2576);
    float _2666 = _2646 ? as_type<float>(_2664) : _2576;
    float _2668 = trunc(_2638);
    float _2670 = precise::max(_2668, 0.0);
    uint _2672 = uint(_2670);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2674;
    bool _2678 = _2584 > 0.5;
    bool _2680 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2682 = isnan(_684);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2694 = _2676 * _2626;
    if (_2636)
    {
        float _2696 = _2678 ? _2642 : _2576;
        _2654 = _2696;
    }
    float _2698 = _2654;
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2702 = _684 + _2700;
    int _2704 = ~_936;
    int _2706 = _2704 + 1;
    float _2708 = -_796;
    float _2710 = fma(_978, _2692, _2708);
    bool _2712 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2714 = isnan(_684);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2720 = _2716 || _2718;
    float _2722 = float(_2720);
    float _2724 = -_2690;
    float _2726 = _2724 + 1.0;
    float _2728 = fma(_2694, _2702, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2730 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2732 = _2706 * int(_2672);
    int _2734 = _2732 + _2604;
    float _2736 = _2722 * _2726;
    float _2738 = _2722;
    float _2740 = as_type<float>(_2734);
    if (_2620)
    {
        bool _2742 = _732 > 0.5;
        _2656 = _2742;
    }
    bool _2744 = _2656;
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2748 = in.m_81.x;
    float _2750 = in.m_81.y;
    float _2752 = in.m_81.z;
    float _2754 = float(uint(_2734));
    float _2756 = _2728 * _2736;
    float _2758 = float(uint(_2560));
    float _2760 = fma(_2730, _2698, -0.5);
    bool _2762 = _1144 != 0.0;
    bool _2764 = isnan(_1144);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan(0.0);
    bool _2770 = _2766 || _2768;
    float _2772 = as_type<float>(_2026) * _2754;
    if (_2620)
    {
        float _2774 = _2744 ? as_type<float>(_2662) : _2484;
        _2596 = _2774;
    }
    float _2776 = _2596;
    float _2778 = as_type<float>(_2026) * _2758;
    bool _2780 = _1142 == 0.0;
    bool _2782 = !_2770;
    bool _2784 = _2780 && _2782;
    float _2786 = -_2722;
    float _2788 = _2786 + 1.0;
    float _2790 = -_1074;
    float _2792 = fma(_1060, _2760, _2790);
    int _2794 = ~_936;
    int _2796 = _2794 + 1;
    float _2798 = trunc(_2772);
    float _2800 = precise::max(_2798, 0.0);
    uint _2802 = uint(_2800);
    bool _2804 = _1146 == 0.0;
    bool _2806 = _2804 && _2784;
    float _2808 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2810 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2756);
    float _2812 = in.m_83.x;
    float _2814 = in.m_83.y;
    float _2816 = in.m_83.z;
    float _2818 = in.m_83.w;
    float _2820 = fma(_2808, _2776, -0.5);
    int _2822 = ~_936;
    int _2824 = _2822 + 1;
    float _2826 = trunc(_2778);
    float _2828 = precise::max(_2826, 0.0);
    uint _2830 = uint(_2828);
    float _2832 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2834 = fma(_880, _2820, _1050);
    float _2836 = _2792 + 0.5;
    float _2838 = fma(_2690, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2810);
    float _2840 = _2748;
    if (_2806)
    {
        _2306 = _2748;
    }
    float _2842 = _2306;
    int _2844 = int(_2672) + int(_2802);
    float _2846 = _2838 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2848 = _2842;
    if (_2806)
    {
        _2738 = _2842;
    }
    float _2850 = _2738;
    float _2852 = _2850;
    if (!_2806)
    {
        _2848 = _2748;
    }
    float _2854 = _2848;
    if (_2806)
    {
        _2840 = _2752;
    }
    float _2856 = _2840;
    float _2858 = _2856;
    if (!_2806)
    {
        float _2860 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2752);
        _2858 = _2860;
    }
    float _2862 = _2858;
    int _2864 = _2796 * int(_2830);
    int _2866 = _2864 + _2560;
    if (!_2806)
    {
        float _2868 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2854);
        _2852 = _2868;
    }
    float _2870 = _2852;
    float _2872 = fma(_1040, _2832, _852);
    if (_2806)
    {
        _2740 = _2750;
    }
    float _2874 = _2740;
    float _2876 = abs(_1176);
    float _2878 = log2(_2876);
    float _2880 = float(uint(_2866));
    int _2882 = _2824 * _2844;
    int _2884 = _2882 + _2604;
    float _2886 = _2874;
    if (!_2806)
    {
        float _2888 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2750);
        _2886 = _2888;
    }
    float _2890 = _2886;
    float _2892 = _2816 * _2854;
    float _2894 = _2814 * _2752;
    float _2896 = as_type<float>(_2026) * _2880;
    bool _2898 = uint(_2884) >= uint(_936);
    float _2900 = -_2892;
    float _2902 = fma(_2812, _2752, _2900);
    float _2904 = _2812 * _2750;
    float _2906 = -_2894;
    float _2908 = fma(_2816, _2750, _2906);
    bool _2910 = !_2898;
    int _2912 = _2910 ? 0 : (-1);
    float _2914 = trunc(_2896);
    float _2916 = precise::max(_2914, 0.0);
    uint _2918 = uint(_2916);
    float _2920 = -_2904;
    float _2922 = fma(_2814, _2854, _2920);
    float _2924 = _2834 + 0.5;
    int _2926 = ~_2844;
    int _2928 = _2926 + _2912;
    int _2930 = _2928 + 1;
    float _2932 = _2902 * _2818;
    float _2934 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2936 = _2908 * _2818;
    int _2938 = ~_936;
    int _2940 = _2938 + 1;
    float _2942 = _2922 * _2818;
    float _2944 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2946 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2948 = _936 * _2930;
    int _2950 = _2948 + _2604;
    float _2952 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2954 = exp2(_2934);
    float _2956 = _2710 + 0.5;
    float _2958 = _2872 + 0.5;
    int _2960 = int(_2830) + int(_2918);
    float _2962 = -_1218;
    float _2964 = fma(_2962, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2946);
    float _2966 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_85.x = _2958;
    out.m_85.y = _2956;
    out.m_85.z = _2924;
    out.m_85.w = _2836;
    bool _2968 = _1176 <= 8000.0;
    bool _2970 = isnan(_1176);
    bool _2972 = _2968 || _2970;
    bool _2974 = isnan(8000.0);
    bool _2976 = _2972 || _2974;
    float _2978 = float(_2976);
    int _2980 = _2940 * _2960;
    int _2982 = _2980 + _2560;
    float _2984 = -_1218;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2944);
    float _2988 = -_1218;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2952);
    bool _2992 = !_2480;
    int _2994 = _2992 ? _2950 : (-1);
    float _2996 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2998 = uint(_2982) >= uint(_936);
    float _3000 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2990);
    float _3002 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3004 = precise::clamp(_3002, 0.0, 1.0);
    float _3006 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2964);
    float _3008 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2996);
    float _3010 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2966);
    float _3012 = _3000 * _2814;
    int _3014 = _2994 >> 31;
    float _3016 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3018 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3020 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3022 = _3014 & 3;
    float _3024 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3016);
    float _3026 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2986);
    float _3028 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3020);
    int _3030 = _2994 + _3022;
    float _3032 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3018);
    float _3034 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3036 = _3026 * _2814;
    int _3038 = _3030 >> 2;
    float _3040 = _3006 * _2814;
    float _3042 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3034);
    int _3044 = _2994 & 3;
    float _3046 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3024);
    int _3048 = _3038 << 4;
    int _3050 = _3048 + 368;
    float _3052 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3032);
    bool _3054 = uint(_3044) >= 2u;
    float _3056 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3028);
    uint _3058 = uint(int(uint(_3050) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[int(_3068)][_3070];
    bool _3074 = !_2998;
    int _3076 = _3074 ? 0 : (-1);
    float _3078 = _3026 * _2890;
    bool _3080 = uint(_3044) > 1u;
    float _3082 = _3006 * _2890;
    float _3084 = _3000 * _2890;
    int _3086 = _3054 ? 0 : 1;
    float _3088 = _2932 * _3006;
    int _3090 = _3050 + 8;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    uint _3094 = uint(int(uint(int(_3092)) >> uint(2)));
    int _3096 = int(_3092) & 3;
    float _3098 = (*spvDescriptorSet0.vp_c9)._m0[int(_3094)][_3096];
    int _3100 = int(_3092) + 1;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    int _3104 = _3100 & 3;
    float _3106 = (*spvDescriptorSet0.vp_c9)._m0[int(_3102)][_3104];
    bool _3108 = _3044 != 3;
    out.m_87.w = _2846;
    int _3110 = _2994 & 3;
    bool _3112 = _3110 != 0;
    float _3114 = fma(_3046, _2870, _3078);
    int _3116 = ~_2960;
    int _3118 = _3116 + _3076;
    int _3120 = _3118 + 1;
    float _3122 = fma(_3052, _2870, _3082);
    int _3124 = _3112 ? 0 : 1;
    float _3126 = _2932 * _3000;
    float _3128 = fma(_3052, _2812, _3040);
    float _3130 = _2932 * _3026;
    int _3132 = ~_3124;
    int _3134 = _3132 + 1;
    int _3136 = _3134 + 1;
    float _3138 = fma(_3056, _2870, _3084);
    int _3140 = _3136;
    float _3142 = _2978;
    if (!_3080)
    {
        int _3144 = ~_3124;
        int _3146 = _3144 + 1;
        _3140 = _3146;
    }
    int _3148 = _3140;
    float _3150 = fma(_3046, _2812, _3036);
    int _3152 = ~_3086;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    float _3158 = fma(_2936, _3046, _3130);
    bool _3160 = !_3112;
    int _3162 = _3160 ? 0 : 1;
    float _3164 = fma(_3056, _2812, _3012);
    bool _3166 = _3044 != 3;
    float _3168 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3008);
    int _3170 = _3156;
    if (_3108)
    {
        int _3172 = ~_3086;
        int _3174 = _3172 + 1;
        _3170 = _3174;
    }
    int _3176 = _3170;
    float _3178 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3042);
    int _3180 = abs(_3148);
    float _3182 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3010);
    int _3184 = abs(_3162);
    float _3186 = fma(_3178, _2862, _3114);
    bool _3188 = !_3166;
    int _3190 = _3188 ? 0 : (-1);
    int _3192 = abs(_3176);
    int _3194 = ~_3180;
    int _3196 = _3194 + 1;
    int _3198 = _3196 + 1;
    int _3200 = abs(_3190);
    int _3202 = ~_3184;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    int _3208 = _3198 * as_type<int>(_3072);
    bool _3210 = !_2652;
    int _3212 = _3210 ? 0 : 1;
    float _3214 = fma(_2936, _3052, _3088);
    int _3216 = ~_3192;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3206 * as_type<int>(_3064);
    int _3224 = _3222 + _3208;
    int _3226 = abs(_3212);
    int _3228 = _936 * _3120;
    int _3230 = _3228 + _2560;
    int _3232 = ~_3200;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * as_type<int>(_3098);
    int _3240 = _3238 + _3224;
    int _3242 = ~_3226;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = fma(_3168, _2816, _3128);
    bool _3250 = !_2480;
    int _3252 = _3250 ? _3230 : (-1);
    int _3254 = _3236 * as_type<int>(_3106);
    int _3256 = _3254 + _3240;
    float _3258 = fma(_3178, _2816, _3150);
    float _3260 = fma(_2942, _3178, _3158);
    int _3262 = _3246 * _3256;
    float _3264 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2542);
    float _3266 = fma(_2936, _3056, _3126);
    float _3268 = fma(_3182, _2816, _3164);
    int _3270 = _3252 * _3226;
    int _3272 = _3270 + _3262;
    float _3274 = fma(_2942, _3168, _3214);
    float _3276 = fma(_3168, _2862, _3122);
    float _3278 = fma(_3004, -2.0, 3.0);
    float _3280 = _3004 * _3004;
    float _3282 = float(_3272);
    float _3284 = _3264 + _1907;
    float _3286 = fma(_2942, _3182, _3266);
    float _3288 = _3280 * _3278;
    out.m_89.x = _3282;
    float _3290 = -_3288;
    float _3292 = _3290 + 1.0;
    float _3294 = _3284 * 0.5;
    float _3296 = fma(_3182, _2862, _3138);
    out.m_91.x = _3258;
    out.m_91.y = _3248;
    out.m_91.z = _3268;
    float _3298 = fma(_3292, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3288);
    float _3300 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3302 = -_2566;
    float _3304 = _3302 + 1.0;
    out.m_93.x = _3260;
    out.m_93.y = _3274;
    out.m_93.z = _3286;
    float _3306 = _2978 * _3298;
    if (!_1885)
    {
        _3142 = 1.0;
    }
    float _3308 = _3142;
    float _3310 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3312 = _3308;
    float _3314 = _3310;
    if (_1885)
    {
        bool _3316 = _2001 >= _1953;
        bool _3318 = isnan(_2001);
        bool _3320 = _3316 || _3318;
        bool _3322 = isnan(_1953);
        bool _3324 = _3320 || _3322;
        float _3326 = float(_3324);
        _3312 = _3326;
    }
    float _3328 = _3312;
    float _3330 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1939;
    out.gl_Position.y = _1945;
    out.gl_Position.z = _3264;
    out.gl_Position.w = _1907;
    float _3332 = _3310 * _2003;
    float _3334 = -_3310;
    float _3336 = _3334 + 1.0;
    float _3338 = _2524 * _3330;
    float _3340 = precise::clamp(_3338, 0.0, 1.0);
    out.m_95.z = _3294;
    out.m_95.w = _1907;
    bool _3342 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3344 = isnan(_2248);
    bool _3346 = _3342 || _3344;
    bool _3348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3350 = _3346 || _3348;
    float _3352 = _2014 * _3336;
    float _3354 = -_3340;
    float _3356 = fma(_3354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3358 = _2014 * _3332;
    float _3360 = _2474 * _3332;
    out.m_97.x = _3186;
    out.m_97.y = _3276;
    out.m_97.z = _3296;
    float _3362 = _3328 * _2226;
    float _3364 = fma(_2470, _3358, _2008);
    float _3366 = fma(_2472, _3358, _2010);
    float _3368 = fma(_2014, _3360, _2012);
    float _3370 = -_3362;
    float _3372 = fma(_3370, _3356, 1.0);
    float _3374 = precise::clamp(_3372, 0.0, 1.0);
    float _3376 = _3330;
    float _3378 = _3362;
    float _3380 = _3336;
    float _3382 = _3358;
    if (!_3350)
    {
        _3314 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3384 = _3314;
    out.m_99.x = _3364;
    out.m_99.y = _3366;
    out.m_99.z = _3368;
    out.m_99.w = _3352;
    float _3386 = _3374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3388 = _3386;
    float _3390 = _3384;
    float _3392 = _3384;
    if (!_3350)
    {
        _3376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3394 = _3376;
    float _3396 = _3394;
    float _3398 = _3394;
    if (!_3350)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3400 = _3378;
    out.m_101.x = _3386;
    float _3402 = _3400;
    float _3404 = _3400;
    if (!_3350)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3406 = _3380;
    float _3408 = _3406;
    float _3410 = _3406;
    if (!_3350)
    {
        _3382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3412 = _3382;
    float _3414 = _3412;
    float _3416 = _3412;
    if (!_3350)
    {
        _3388 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3418 = _3388;
    bool _3420 = !_3350;
    float _3422 = _3418;
    float _3424 = _3418;
    if (!_3420)
    {
        bool _3426 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3428 = isnan(_2248);
        bool _3430 = _3426 || _3428;
        bool _3432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3434 = _3430 || _3432;
        if (!_3434)
        {
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3438 = _2248 + _3436;
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3442 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3440;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3448 = 1.0 / _3442;
            float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3454 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3464 = _3462 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3466 = _3438 * _3448;
            float _3468 = precise::clamp(_3466, 0.0, 1.0);
            float _3470 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3472 = _3470 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3474 = fma(_3468, _3446, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3476 = fma(_3468, _3472, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3478 = fma(_3468, _3452, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3480 = fma(_3468, _3456, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3482 = fma(_3468, _3460, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3484 = fma(_3468, _3464, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3398 = _3478;
            _3416 = _3482;
            _3392 = _3474;
            _3410 = _3480;
            _3404 = _3476;
            _3424 = _3484;
            _3486 = true;
        }
        else
        {
            bool _3488 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3490 = isnan(_2248);
            bool _3492 = _3488 || _3490;
            bool _3494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3496 = _3492 || _3494;
            if (!_3496)
            {
                _3390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3498 = _3390;
            _3392 = _3498;
            if (!_3496)
            {
                _3396 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3500 = _3396;
            _3398 = _3500;
            if (!_3496)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3502 = _3402;
            _3404 = _3502;
            if (!_3496)
            {
                _3408 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3504 = _3408;
            _3410 = _3504;
            if (!_3496)
            {
                _3414 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3506 = _3414;
            _3416 = _3506;
            if (!_3496)
            {
                _3422 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3508 = _3422;
            bool _3510 = !_3496;
            _3424 = _3508;
            if (!_3510)
            {
                bool _3512 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3514 = isnan(_2248);
                bool _3516 = _3512 || _3514;
                bool _3518 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3520 = _3516 || _3518;
                if (!_3520)
                {
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3524 = _2248 + _3522;
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3528 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3526;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3534 = 1.0 / _3528;
                    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3544 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3546 = _3544 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3552 = _3524 * _3534;
                    float _3554 = precise::clamp(_3552, 0.0, 1.0);
                    float _3556 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3560 = fma(_3554, _3532, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3562 = fma(_3554, _3558, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3564 = fma(_3554, _3538, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3566 = fma(_3554, _3542, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3568 = fma(_3554, _3546, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3570 = fma(_3554, _3550, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3398 = _3564;
                    _3416 = _3568;
                    _3392 = _3560;
                    _3410 = _3566;
                    _3404 = _3562;
                    _3424 = _3570;
                    _3486 = true;
                }
                else
                {
                    _3398 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3416 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3410 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3424 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3486 = false;
    float _3572 = _3398;
    float _3574 = _3416;
    float _3576 = _3392;
    float _3578 = _3410;
    float _3580 = _3404;
    float _3582 = _3424;
    float _3584 = fma(_3276, -0.5, 0.5);
    float _3586 = precise::clamp(_3584, 0.0, 1.0);
    float _3588 = -_3572;
    float _3590 = _3588 + _3574;
    float _3592 = _3300 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3594 = -_3576;
    float _3596 = _3594 + _3578;
    float _3598 = fma(_3586, _3590, _3572);
    out.m_103.x = 0.0;
    float _3600 = -_3580;
    float _3602 = _3600 + _3582;
    float _3604 = fma(_3586, _3596, _3576);
    float _3606 = _3598 * 0.586610972881317138671875;
    out.m_63.x = _3592;
    bool _3608 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3610 = fma(_3586, _3602, _3580);
    float _3612 = fma(_3604, 0.298911988735198974609375, _3606);
    bool _3614 = _2158 > 0.0;
    bool _3616 = isnan(_2158);
    bool _3618 = _3614 || _3616;
    bool _3620 = isnan(0.0);
    bool _3622 = _3618 || _3620;
    float _3624 = fma(_3610, 0.114477999508380889892578125, _3612);
    float _3626 = -_3624;
    float _3628 = _3604 + _3626;
    float _3630 = -_3624;
    float _3632 = _3598 + _3630;
    float _3634 = -_3624;
    float _3636 = _3610 + _3634;
    float _3638 = fma(_3628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    float _3640 = fma(_3632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    float _3642 = fma(_3636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    bool _3644 = !_3608;
    if (!_3644)
    {
        float _3646 = -_1831;
        float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3650 = -_1833;
        float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3654 = -_1835;
        float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3658 = _3648 * _3648;
        float _3660 = fma(_3652, _3652, _3658);
        float _3662 = fma(_3656, _3656, _3660);
        float _3664 = sqrt(_3662);
        float _3666 = rsqrt(_3662);
        float _3668 = -_3664;
        float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3672 = _3670 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3674 = precise::clamp(_3672, 0.0, 1.0);
        float _3676 = _3652 * _3666;
        float _3678 = _3648 * _3666;
        float _3680 = abs(_3674);
        float _3682 = log2(_3680);
        float _3684 = _3656 * _3666;
        float _3686 = _3676 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3688 = _3276 * _3678;
        float _3690 = -_3678;
        float _3692 = -_3686;
        float _3694 = fma(_3690, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3692);
        float _3696 = fma(_3186, _3676, _3688);
        float _3698 = -_3684;
        float _3700 = fma(_3698, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3694);
        float _3702 = fma(_3296, _3684, _3696);
        float _3704 = precise::clamp(_3702, 0.0, 1.0);
        float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3708 = _3700 + _3706;
        float _3710 = _3682 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3712 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3714 = precise::clamp(_3712, 0.0, 1.0);
        float _3716 = exp2(_3710);
        float _3718 = _3716 * _3714;
        float _3720 = _3704 * _3718;
        float _3722 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3724 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3726 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3722;
        out.m_103.y = _3724;
        out.m_103.z = _3726;
    }
    out.m_105.x = _3638;
    out.m_105.y = _3640;
    out.m_105.z = _3642;
    if (_3622)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3728 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3728;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3486 = false;
    bool _512 = false;
    bool _338 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = in.m_58.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = _121;
    float _140 = _130;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _136;
    if (!_134)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_134)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3796 = as_type<float>(_148);
        out.gl_Position.z = _3796;
    }
    if (!_134)
    {
        return out;
    }
    bool _152 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_121);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _138;
    if (_168)
    {
        out.m_63.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _150 = as_type<int>(_172);
    }
    int _174 = _150;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3851 = as_type<float>(_174);
        out.gl_Position.z = _3851;
    }
    if (_168)
    {
        return out;
    }
    float _176 = in.m_65.x;
    float _178 = in.m_65.y;
    float _180 = in.m_65.z;
    float _182 = 1.0 / _162;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _130 * _182;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_184;
    float _208 = _186;
    float _210 = _200;
    float _228;
    if (!_206)
    {
        float _212 = in.m_67.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        _228 = _186;
    }
    _230 = false;
    float _232 = _228;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _232 + _234;
    bool _238 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _240 = isnan(_232);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    bool _254 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_232);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_248;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = 1.0 / _252;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _278 = _264 * _268;
    float _280 = -_264;
    float _282 = _280 + 1.0;
    float _284 = _236 * _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = fma(_272, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = fma(_288, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = fma(_294, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = _290 * _278;
    float _302 = _298 * _278;
    float _304 = _296 * _278;
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _300);
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _310 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _304);
    float _312 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].x, _306);
    float _314 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].y, _308);
    float _316 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].z, _310);
    bool _318 = !_276;
    float _336;
    if (!_318)
    {
        float _320 = in.m_67.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        _336 = _186;
    }
    _338 = false;
    float _340 = _336;
    float _342 = in.m_69.x;
    float _344 = in.m_69.y;
    float _346 = in.m_69.z;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _350 = _340 + _348;
    bool _352 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = isnan(_340);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _372 = 1.0 / _366;
    bool _374 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _376 = isnan(_340);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _388 = 1.0 / _370;
    float _390 = _314 * _344;
    float _392 = _316 * _346;
    bool _394 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _396 = isnan(_340);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -_362;
    float _408 = _406 + 1.0;
    float _410 = _350 * _372;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _340 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _404 * _408;
    float _422 = -_404;
    float _424 = _422 + 1.0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _430;
    float _434 = fma(_418, _410, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _436 = _384 * _424;
    float _438 = fma(_428, _410, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _440 = fma(_432, _410, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _442 = _414 * _388;
    float _444 = -_384;
    float _446 = _444 + 1.0;
    float _448 = _438 * _436;
    float _450 = _440 * _436;
    float _452 = _434 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _448);
    float _468 = fma(_456, _442, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _470 = fma(_460, _442, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _472 = fma(_464, _442, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _474 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _450);
    float _476 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _452);
    float _478 = fma(_468, _420, _466);
    float _480 = _312 * _342;
    float _482 = fma(_470, _420, _474);
    float _484 = fma(_472, _420, _476);
    float _486 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].x, _478);
    float _488 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].y, _482);
    float _490 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].z, _484);
    bool _492 = !_386;
    float _510;
    if (!_492)
    {
        float _494 = in.m_67.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        _510 = _186;
    }
    _512 = false;
    float _514 = _510;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_514);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_514);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = 1.0 / _522;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _558;
    float _562 = -_538;
    float _564 = _562 + 1.0;
    bool _566 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_514);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _580 = 1.0 / _526;
    float _582 = 1.0 / _542;
    float _584 = _560 * _556;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _590 = _554 * _564;
    float _592 = -_554;
    float _594 = _592 + 1.0;
    float _596 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _598;
    float _602 = _576 * _594;
    float _604 = _588 * _580;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _514 + _606;
    bool _610 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = isnan(_514);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _596 * _602;
    float _624 = -_576;
    float _626 = _624 + 1.0;
    float _628 = fma(_604, _608, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = _514 + _630;
    float _634 = _600 * _582;
    float _636 = -_620;
    float _638 = _636 + 1.0;
    float _640 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _622);
    float _642 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_634, _632, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _646 = _538 * _638;
    float _648 = fma(_628, _590, _640);
    float _650 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = fma(_644, _646, _648);
    float _656 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[118].x, _654);
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _652;
    out.m_71.y = _662;
    out.m_71.z = _658;
    out.m_71.w = _664;
    bool _666 = !_578;
    if (!_666)
    {
        float _668 = in.m_67.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _208 = _682;
    }
    float _684 = _208;
    float _686 = in.m_56.x;
    float _688 = in.m_56.y;
    float _690 = in.m_56.z;
    float _692 = _688 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _694 = _688 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[4].x, _692);
    float _698 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[6].x, _694);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[4].z, _696);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _704 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _706 = _702 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _708 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _710 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _712 = floor(_708);
    float _714 = floor(_710);
    float _716 = -_712;
    float _718 = _708 + _716;
    float _720 = -_714;
    float _722 = _710 + _720;
    float2 _4768 = float2(_718, _722);
    float _724 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).x;
    float _726 = in.m_67.x;
    float _728 = in.m_67.y;
    float _730 = _688 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _732 = in.m_67.z;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _738 = _736 != 0;
    float _740 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _742 = log2(_740);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _754 = _728 * 2.0;
    float _756 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _758 = _726 * 2.0;
    float _760 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = floor(_754);
    float _764 = _732 * 2.0;
    float _766 = fma(_756, -2.0, _734);
    float _768 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[5].x, _730);
    float _770 = -_744;
    float _772 = fma(_760, 2.0, _770);
    float _774 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _776 = floor(_758);
    float _778 = _728 + _732;
    float _780 = _686;
    int _782 = 2;
    float _784 = _726;
    if (!_738)
    {
        _780 = _728;
    }
    float _786 = _780;
    float _788 = _774 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _786;
    if (_738)
    {
        _790 = _726;
    }
    float _792 = _790;
    float _794 = _778 + (-1.0);
    float _796 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _766);
    float _798 = floor(_764);
    float _800 = _728 + _726;
    bool _802 = _762 > 0.0;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _806 = _762 >= 0.0;
    bool _808 = isnan(_762);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _800 + (-1.0);
    float _818 = _792 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _820 = _776 > 0.0;
    float _822 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _826 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _828 = int(_826);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _832 = _816;
    float _834 = _794;
    if (!_738)
    {
        _832 = _732;
    }
    float _836 = _832;
    float _838 = -_804;
    float _840 = fma(_818, 2.0, _838);
    float _842 = _836;
    if (_738)
    {
        _842 = _728;
    }
    float _844 = _842;
    float _846 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    bool _848 = _798 > 0.0;
    float _850 = -_130;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _772);
    bool _854 = _798 >= 0.0;
    bool _856 = isnan(_798);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    bool _866 = _776 >= 0.0;
    bool _868 = isnan(_776);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    float _876 = _742 * _130;
    int _878 = _862 ? 0 : 1;
    float _880 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    if (!_738)
    {
        _834 = _732;
    }
    float _882 = _834;
    float _884 = float(_828);
    float _886 = exp2(_876);
    float _888 = _882;
    if (_738)
    {
        _888 = _728;
    }
    float _890 = _888;
    int _892 = ~_878;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _900 = _896;
    if (!_848)
    {
        int _902 = ~_878;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = 1.0 / _884;
    int _910 = _874 ? 0 : 1;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _914 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = fma(_898, -2.0, _752);
    float _926 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    int _928 = ~_910;
    int _930 = _928 + 1;
    int _932 = _930 + 1;
    float _934 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _936 = int(_934);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _944 = _942 != 0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _948 = 1.0 + _946;
    int _950 = _932;
    if (!_820)
    {
        int _952 = ~_910;
        int _954 = _952 + 1;
        _950 = _954;
    }
    int _956 = _950;
    float _958 = -_886;
    float _960 = _958 + 1.0;
    bool _962 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _964 = isnan(1.0);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _970 = _966 || _968;
    float _972 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _974 = _814 ? 0 : 1;
    float _976 = _908 * _130;
    float _978 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _926);
    bool _980 = !_944;
    int _982 = _980 ? 0 : 1;
    float _984 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _986 = !_940;
    int _988 = _986 ? 0 : 1;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1002 = _1000 != 0;
    float _1004 = 1.0 / _948;
    int _1006 = ~_974;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].x, _984);
    int _1014 = _1010;
    if (!_802)
    {
        int _1016 = ~_974;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].z, _990);
    float _1024 = in.m_73.x;
    float _1026 = in.m_73.y;
    float _1028 = in.m_73.z;
    bool _1030 = !_994;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1012);
    bool _1036 = !_998;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1022);
    int _1042 = abs(_1032);
    float _1044 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1046 = abs(_1038);
    float _1048 = -_130;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _840);
    float _1052 = float(_936);
    float _1054 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1056 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1044);
    float _1058 = _922 ? _960 : 0.0;
    float _1060 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _864);
    float _1062 = float(_1042);
    float _1064 = _1052 * _130;
    float _1066 = float(_906);
    float _1068 = 1.0 / _1054;
    float _1070 = float(_956);
    float _1072 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1056);
    float _1074 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _924);
    if (_970)
    {
        float _1076 = _1058 * _1004;
        _140 = _1076;
    }
    float _1078 = _140;
    float _1080 = _1062 * _1066;
    bool _1082 = !_1002;
    int _1084 = _1082 ? 0 : 1;
    float _1086 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1088 = float(_1046);
    float _1090 = _1080 * (-2.0);
    int _1092 = abs(_1084);
    float _1094 = _1086 + _1054;
    float _1096 = _1088 * _1070;
    float _1098 = _726 + (-0.5);
    float _1100 = fma(_1090, _1024, _1024);
    float _1102 = fma(_824, _1090, _824);
    float _1104 = _1096 * (-2.0);
    float _1106 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1100);
    float _1108 = float(_1020);
    float _1110 = _1094 * _1068;
    float _1112 = _1110 * 0.5;
    float _1114 = float(_1092);
    float _1116 = fma(_822, _1104, _822);
    float _1118 = fma(_1102, _1078, _1106);
    float _1120 = fma(_1104, _1026, _1026);
    float _1122 = _728 + (-0.5);
    float _1124 = _1114 * _1108;
    float _1126 = _726 + _732;
    float _1128 = _1118 * 0.15915493667125701904296875;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1132 = _1126 + (-1.0);
    float _1134 = _1124 * (-2.0);
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1138 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1136);
    float _1140 = fma(_1116, _1078, _1130);
    float _1142 = in.m_75.x;
    float _1144 = in.m_75.y;
    float _1146 = in.m_75.z;
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1150 = fma(_1134, _1028, _1028);
    float _1152 = _732 + (-0.5);
    float _1154 = 1.0 / _1138;
    float _1156 = fma(_1148, _1134, _1148);
    float _1158 = _1140 * 0.15915493667125701904296875;
    float _1160 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1150);
    float _1162 = _788 + _972;
    float _1164 = fma(_1156, _1078, _1160);
    float _1166 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1168 = _1128 * 6.283185482025146484375;
    float _1170 = cos(_1168);
    float _1172 = _1164 * 0.15915493667125701904296875;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1176 = _1154 * _1174;
    float _1178 = _1158 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1142);
    bool _1184 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1144);
    bool _1188 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1190 = _1182 * _1166;
    float _1192 = _1158 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1146);
    float _1198 = _1196 * _746;
    float _1200 = _1172 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = _1170 * _1180;
    float _1206 = _1162;
    if (!_1184)
    {
        _782 = 1;
    }
    int _1208 = _782;
    float _1210 = _1128 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = _1170 * _1194;
    float _1216 = _1172 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1170 * _1202;
    float _1222 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1224 = _1186 * _750;
    float _1226 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1222);
    float _1228 = _1212 * _1180;
    float _1230 = _1212 * _1194;
    bool _1232 = !_1184;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1226);
    float _1238 = _1194 * _1202;
    float _1240 = _1212 * _1202;
    int _1242 = _1208;
    if (!_1188)
    {
        _1242 = _1234;
    }
    int _1244 = _1242;
    float _1246 = _1220 * _1224;
    float _1248 = fma(_1218, _1214, _1228);
    float _1250 = fma(_1218, _1228, _1214);
    float _1252 = -_1204;
    float _1254 = fma(_1218, _1230, _1252);
    float _1256 = -_1230;
    float _1258 = fma(_1218, _1204, _1256);
    float _1260 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1262 = _1236 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1264 = fma(_1248, _1190, _1246);
    float _1266 = _1180 * _1202;
    float _1268 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1260);
    float _1270 = -_1224;
    float _1272 = _1218 * _1270;
    float _1274 = _1240 * _1224;
    float _1276 = fma(_1258, _1198, _1264);
    float _1278 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1268);
    float _1280 = fma(_1238, _1190, _1272);
    float _1282 = fma(_1254, _1190, _1274);
    float _1284 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1288 = fma(_1266, _1198, _1280);
    float _1290 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1292 = fma(_1250, _1198, _1282);
    float _1294 = trunc(_1262);
    int _1296 = int(_1294);
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1284);
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1290);
    int _1302 = _1244 << 6;
    float _1304 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1306 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1300);
    int _1310 = _1302 + 48;
    uint _1313 = uint(int(uint(_1310) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = trunc(_1286);
    int _1331 = int(_1329);
    float _1333 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1337 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1304);
    float _1339 = _706 + _1333;
    float _1341 = _704 + _1335;
    int _1343 = _1302 + 56;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
    int _1349 = int(_1345) & 3;
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[int(_1347)][_1349];
    int _1353 = int(_1345) + 1;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    int _1357 = _1353 & 3;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[int(_1355)][_1357];
    int _1361 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1363 = _1296 + _1361;
    int _1365 = _1363 + 1;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1369 = _1339 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1373 = _1341 + _1371;
    float _1375 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1337);
    bool _1377 = _1365 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1379 = _1369 * _1369;
    int _1381 = _1302 + 64;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1401 = _1331 + _1399;
    int _1403 = _1401 + 1;
    float _1405 = fma(_1373, _1373, _1379);
    float _1407 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1409 = _1365 | _1403;
    int _1411 = _1302 + 72;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
    int _1417 = int(_1413) & 3;
    float _1419 = (*spvDescriptorSet0.vp_c15)._m0[int(_1415)][_1417];
    int _1421 = int(_1413) + 1;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    int _1425 = _1421 & 3;
    float _1427 = (*spvDescriptorSet0.vp_c15)._m0[int(_1423)][_1425];
    bool _1429 = _1409 < 0;
    bool _1431 = _1429 || _1377;
    float _1433 = sqrt(_1405);
    bool _1435 = _1403 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1437 = _1435 || _1431;
    int _1439 = _1302 + 96;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    uint _1443 = uint(int(uint(int(_1441)) >> uint(2)));
    int _1445 = int(_1441) & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    int _1449 = int(_1441) + 1;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    int _1453 = _1449 & 3;
    float _1455 = (*spvDescriptorSet0.vp_c15)._m0[int(_1451)][_1453];
    int _1457 = _1302 + 104;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    int _1475 = as_type<int>(_1304);
    int _1477 = as_type<int>(_1292);
    float _1479 = _1407;
    float _1481 = _1341;
    float _1483 = _1339;
    if (!_1437)
    {
        int _1485 = _1403 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1487 = _1485 + _1365;
        _1475 = _1487;
    }
    int _1489 = _1475;
    bool _1491 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _788 + _1407;
    int _1495 = 0;
    float _1497 = as_type<float>(_1489);
    if (!_1437)
    {
        int _1499 = _1489 << 2;
        _1495 = _1499;
    }
    int _1501 = _1495;
    int _1503 = _1501;
    if (!_1437)
    {
        uint _1505 = uint(int(uint(_1489) >> uint(2)));
        _1477 = int(_1505);
    }
    int _1507 = _1477;
    float _1509 = as_type<float>(_1507);
    if (!_1437)
    {
        int _1511 = 12 & _1501;
        _1503 = _1511;
    }
    int _1513 = _1503;
    if (!_1437)
    {
        int _1515 = _1507 << 4;
        int _1517 = _1515 + _1513;
        _1479 = as_type<float>(_1517);
    }
    float _1519 = _1479;
    if (!_1491)
    {
        _1509 = _1341;
    }
    float _1521 = _1509;
    float _1523 = _1521;
    if (!_1491)
    {
        _1481 = _1493;
    }
    float _1525 = _1481;
    bool _1527 = !_1491;
    float _1529 = _1525;
    float _1531 = _1455;
    float _1533 = _1419;
    if (!_1527)
    {
        float _1535 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1539 = _1433 + _1537;
        float _1541 = rsqrt(_1405);
        float _1543 = _1539 * _1535;
        float _1545 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1547 = _1543 * 0.15915493667125701904296875;
        float _1549 = _1547 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        float _1557 = _1551 + (-1.0);
        float _1559 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1561 = fma(_1555, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1563 = fma(_1493, _1551, _1559);
        float _1565 = _1541 * _1561;
        float _1567 = fma(_1373, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1569 = fma(_1369, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1529 = _1563;
        _1523 = _1567;
        _1483 = _1569;
    }
    float _1571 = _1529;
    float _1573 = _1523;
    float _1575 = _1483;
    float _1577 = -_788;
    float _1579 = _1577 + _1571;
    int _1581 = _1302 + 80;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    uint _1585 = uint(int(uint(int(_1583)) >> uint(2)));
    int _1587 = int(_1583) & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    int _1591 = int(_1583) + 1;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    int _1595 = _1591 & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    float _1599 = -_704;
    float _1601 = _1599 + _1573;
    float _1603 = -_706;
    float _1605 = _1603 + _1575;
    float _1607 = _1579 * _1579;
    float _1609 = _1162 * _1455;
    float _1611 = _1162 * _1397;
    float _1613 = _1573;
    float _1615 = _1571;
    float _1617 = _1575;
    float _1619 = _1579;
    if (!_1437)
    {
        float _1621 = floor(_1262);
        _1531 = _1621;
    }
    float _1623 = _1531;
    float _1625 = fma(_1601, _1601, _1607);
    int _1627 = _1302 + 88;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    float _1645 = fma(_704, _1447, _1609);
    float _1647 = fma(_1605, _1605, _1625);
    bool _1649 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1651 = isnan(0.5);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1657 = _1653 || _1655;
    float _1659 = fma(_706, _1465, _1645);
    float _1661 = _1162 * _1327;
    float _1663 = sqrt(_1647);
    float _1665 = _1519;
    if (!_1437)
    {
        int _1667 = as_type<int>(_1519) + 400;
        uint _1669 = uint(int(uint(_1667) >> uint(2)));
        uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
        int _1673 = int(_1669) & 3;
        float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
        _1665 = _1675;
    }
    float _1677 = _1665;
    float _1679 = _1659 + _1473;
    float _1681 = fma(_704, _1389, _1611);
    float _1683 = fma(_704, _1319, _1661);
    float _1685 = fma(_706, _1419, _1681);
    float _1687 = _1645;
    float _1689 = _1681;
    float _1691 = _1683;
    if (!_1437)
    {
        float _1693 = floor(_1286);
        _1687 = _1693;
    }
    float _1695 = _1687;
    float _1697 = fma(_706, _1351, _1683);
    float _1699 = _1685 + _1427;
    float _1701 = _1697 + _1359;
    bool _1703 = _1663 > 0.0;
    float _1705 = 1.0 / _1679;
    bool _1707 = !_1703;
    if (!_1707)
    {
        float _1709 = _202 * _202;
        float _1711 = fma(_200, _200, _1709);
        float _1713 = fma(_204, _204, _1711);
        float _1715 = rsqrt(_1647);
        float _1717 = sqrt(_1713);
        float _1719 = _1601 * _1715;
        float _1721 = _1579 * _1715;
        float _1723 = _1605 * _1715;
        bool _1725 = _1717 > 0.0;
        bool _1727 = !_1725;
        _1689 = _1715;
        _1691 = _1713;
        if (!_1727)
        {
            float _1729 = rsqrt(_1713);
            float _1731 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1733 = _202 * _1729;
            float _1735 = _200 * _1729;
            float _1737 = _204 * _1729;
            float _1739 = _1721 * _1733;
            float _1741 = fma(_1719, _1735, _1739);
            float _1743 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1745 = fma(_1723, _1737, _1741);
            float _1747 = _1745 * _1743;
            float _1749 = fma(_200, _1747, _1573);
            float _1751 = fma(_202, _1747, _1571);
            float _1753 = fma(_204, _1747, _1575);
            _1613 = _1749;
            _1615 = _1751;
            _1617 = _1753;
            _1689 = _1747;
            _1533 = _1741;
        }
    }
    float _1755 = _1613;
    float _1757 = _1615;
    float _1759 = _1617;
    float _1761 = _1689;
    float _1763 = _1691;
    float _1765 = _1533;
    float _1767 = _1763;
    float _1769 = _1761;
    float _1771 = _1765;
    float _1773 = _1757;
    if (_1657)
    {
        _1767 = _1755;
    }
    float _1775 = _1767;
    float _1777 = _1775;
    if (_1657)
    {
        _1769 = _1757;
    }
    float _1779 = _1769;
    float _1781 = _1779;
    if (_1657)
    {
        _210 = _1759;
    }
    float _1783 = _210;
    float _1785 = _1783;
    if (!_1657)
    {
        float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1789 = _788 + _1787;
        float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1793 = _704 + _1791;
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1797 = -_788;
        float _1799 = _1797 + _1757;
        float _1801 = _1789 * _1789;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1805 = _706 + _1803;
        float _1807 = -_706;
        float _1809 = _1807 + _1759;
        float _1811 = fma(_1793, _1793, _1801);
        float _1813 = fma(_1805, _1805, _1811);
        float _1815 = sqrt(_1813);
        float _1817 = precise::min(_1815, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1819 = _1817 * _1795;
        float _1821 = -_704;
        float _1823 = _1821 + _1755;
        float _1825 = fma(_1799, _1819, _788);
        float _1827 = fma(_1823, _1819, _704);
        float _1829 = fma(_1809, _1819, _706);
        _1781 = _1825;
        _1777 = _1827;
        _1785 = _1829;
        _1771 = _1809;
    }
    float _1831 = _1781;
    float _1833 = _1777;
    float _1835 = _1785;
    float _1837 = _1771;
    float _1839 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1841 = _1701 * _1705;
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1845 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1839);
    float _1849 = _1699 * _1705;
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1843);
    float _1853 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1845);
    bool _1855 = _1841 >= 0.0;
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1847);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1851);
    float _1861 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1853);
    bool _1863 = _1841 <= 1.0;
    bool _1865 = _1863 && _1855;
    float _1867 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1869 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1871 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1873 = _1849 >= 0.0;
    bool _1875 = _1873 && _1865;
    float _1877 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1867);
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1881 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1883 = _1849 <= 1.0;
    bool _1885 = _1883 && _1875;
    float _1887 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1877);
    float _1889 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1879);
    float _1891 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1893 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1895 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1897 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1889);
    float _1899 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = -_1893;
    float _1903 = fma(_1901, _1891, 1.0);
    float _1905 = _1162 * _1597;
    float _1907 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1897);
    float _1909 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1911 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1913 = fma(_704, _1589, _1905);
    float _1915 = log2(_1903);
    float _1917 = _1905;
    if (_1885)
    {
        float _1919 = float(_1244);
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1909);
    float _1925 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1911);
    float _1927 = fma(_706, _1635, _1913);
    float _1929 = _1925;
    if (!_1437)
    {
        float _1931 = -_1695;
        float _1933 = _1286 + _1931;
        _1619 = _1933;
    }
    float _1935 = _1619;
    float _1937 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1923);
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1941 = 1.0 / _1907;
    float _1943 = _1927 + _1643;
    float _1945 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    if (!_1437)
    {
        float _1947 = -_1623;
        float _1949 = _1262 + _1947;
        _1929 = _1949;
    }
    float _1951 = _1929;
    float _1953 = _1943 * _1705;
    float _1955 = _1837;
    if (!_1437)
    {
        float _1957 = rint(_1677);
        float _1959 = precise::max(_1957, 0.0);
        uint _1961 = uint(_1959);
        uint _1963 = clamp(_1961, 0u, 65535u);
        _1955 = as_type<float>(_1963);
    }
    float _1965 = _1955;
    float _1967 = _1915 * 0.693147182464599609375;
    float _1969 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1971 = _1921;
    if (_1885)
    {
        float _1973 = rint(_1921);
        float _1975 = precise::max(_1973, 0.0);
        uint _1977 = uint(_1975);
        uint _1979 = clamp(_1977, 0u, 65535u);
        _1971 = as_type<float>(_1979);
    }
    float _1981 = _1971;
    float _1983 = _1939 * _1941;
    float _1985 = _1945 * _1941;
    float _1987 = fma(_1983, 0.5, 0.5);
    float _1989 = fma(_1985, -0.5, 0.5);
    float _1991 = _1935;
    if (!_1437)
    {
        float3 _6805 = float3(_1951, _1935, float(as_type<int>(_1965)));
        float3 _6809 = select(_6805, float3(0.0), isnan(_6805));
        float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6809.xy, uint(rint(_6809.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6809.xy, uint(rint(_6809.z)), level(0.0)).x;
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1849;
    if (_1885)
    {
        float3 _6824 = float3(_1841, _1849, float(as_type<int>(_1981)));
        float3 _6826 = select(_6824, float3(0.0), isnan(_6824));
        float _1999 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6826.xy, uint(rint(_6826.z)), _1953, level(0.0));
        _1997 = _1999;
    }
    float _2001 = _1997;
    float3 _6836 = float3(_1987, _1989, _1969);
    float _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6836, float3(0.0), isnan(_6836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6836, float3(0.0), isnan(_6836)), level(0.0)).x;
    float3 _6845 = float3(_1987, _1989, _1969);
    float4 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6845, float3(0.0), isnan(_6845)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6845, float3(0.0), isnan(_6845)), level(0.0)).xyzw;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _2006.w;
    float _2016 = float(uint(_936));
    float _2018 = trunc(_976);
    int _2020 = int(_2018);
    float _2022 = 1.0 / _2016;
    float _2024 = float(uint(_2020));
    int _2026 = as_type<int>(_2022) + (-2);
    float _2028 = as_type<float>(_2026) * _2024;
    float _2030 = trunc(_2028);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    int _2036 = ~_936;
    int _2038 = _2036 + 1;
    bool _2040 = !_738;
    float _2042 = _2040 ? 7.345489978790283203125 : 1.0;
    bool _2044 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2046 = isnan(0.5);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2052 = _2048 || _2050;
    int _2054 = _2038 * int(_2034);
    int _2056 = _2054 + _2020;
    float _2058 = _2042 * _726;
    float _2060 = float(uint(_2056));
    float _2062 = as_type<float>(_2026) * _2060;
    int _2064 = ~_936;
    int _2066 = _2064 + 1;
    float _2068 = _2062;
    if (_2052)
    {
        _784 = 1.0;
    }
    float _2070 = _784;
    float _2072 = trunc(_2062);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    float _2078 = _2070;
    if (_1437)
    {
        _2068 = 1.0;
    }
    float _2080 = _2068;
    int _2082 = int(_2034) + int(_2076);
    float _2084 = floor(_2058);
    int _2086 = _2066 * _2082;
    int _2088 = _2086 + _2020;
    bool _2090 = uint(_2088) >= uint(_936);
    bool _2092 = !_2090;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = -_2084;
    float _2098 = _2058 + _2096;
    int _2100 = ~_2082;
    int _2102 = _2100 + _2094;
    int _2104 = _2102 + 1;
    float _2106 = _2080;
    if (!_2052)
    {
        float _2108 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2116 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2114;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2112 * 0.15915493667125701904296875;
        float _2124 = _2110 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        float _2128 = 1.0 / _2120;
        float _2130 = _2122 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = _2126 * _2128;
        float _2136 = _2122 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        float _2140 = _2132 * _2134;
        float _2142 = 1.0 / _2116;
        float _2144 = 1.0 / _2140;
        float _2146 = _2138 * _2144;
        float _2148 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2150 = fma(_1176, _2146, _2148);
        float _2152 = _2150 * _2142;
        float _2154 = precise::clamp(_2152, 0.0, 1.0);
        _1773 = _2122;
        _2078 = _2154;
    }
    float _2156 = _1773;
    float _2158 = _2078;
    float _2160 = _2156;
    if (!_1437)
    {
        int _2162 = _1489 << 4;
        int _2164 = _2162 + 2048;
        uint _2166 = uint(int(uint(_2164) >> uint(2)));
        uint _2168 = uint(int(uint(int(_2166)) >> uint(2)));
        int _2170 = int(_2166) & 3;
        float _2172 = (*spvDescriptorSet0.vp_c15)._m0[int(_2168)][_2170];
        int _2174 = int(_2166) + 1;
        uint _2176 = uint(int(uint(_2174) >> uint(2)));
        int _2178 = _2174 & 3;
        float _2180 = (*spvDescriptorSet0.vp_c15)._m0[int(_2176)][_2178];
        int _2182 = _2164 + 8;
        uint _2184 = uint(int(uint(_2182) >> uint(2)));
        uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
        int _2188 = int(_2184) & 3;
        float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
        int _2192 = int(_2184) + 1;
        uint _2194 = uint(int(uint(_2192) >> uint(2)));
        int _2196 = _2192 & 3;
        float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
        float _2200 = _1162 * _2180;
        float _2202 = fma(_704, _2172, _2200);
        float _2204 = fma(_706, _2190, _2202);
        float _2206 = _2204 + _2198;
        float _2208 = precise::clamp(_2206, 0.0, 1.0);
        float _2210 = -_2208;
        float _2212 = _2210 + _1995;
        float _2214 = fma(_2212, 500.0, 1.5);
        float _2216 = exp2(_2214);
        float _2218 = 0.0 + _2216;
        float _2220 = precise::clamp(_2218, 0.0, 1.0);
        _1206 = _2200;
        _1497 = as_type<float>(_2164);
        _2106 = _2220;
    }
    float _2222 = _1206;
    float _2224 = _1497;
    float _2226 = _2106;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2230 = _1831 + _2228;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2234 = _1833 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2238 = _1835 + _2236;
    float _2240 = _2230 * _2230;
    float _2242 = fma(_2234, _2234, _2240);
    float _2244 = fma(_2238, _2238, _2242);
    float _2246 = rsqrt(_2244);
    float _2248 = sqrt(_2244);
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2252 = _2234 * _2250;
    float _2254 = _2238 * _2250;
    float _2256 = _2252 * _2252;
    float _2258 = _2254 * _2254;
    float _2260 = _2256 + _2258;
    float _2262 = sqrt(_2260);
    bool _2264 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2268 = _2262 + _2266;
    float _2270 = _2222;
    float _2272 = _2260;
    float _2274 = _2268;
    float _2276 = _2252;
    float _2278 = _2254;
    float _2280 = _2256;
    float _2282 = _2258;
    int _2284 = as_type<int>(_2250);
    if (_2264)
    {
        float _2286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2270 = _2286;
    }
    float _2288 = _2270;
    if (_2264)
    {
        float _2290 = rsqrt(_2260);
        _2272 = _2290;
    }
    float _2292 = _2272;
    if (_2264)
    {
        float _2294 = _2268 * _2288;
        _2274 = _2294;
    }
    float _2296 = _2274;
    if (_2264)
    {
        float _2298 = _2296 * 0.15915493667125701904296875;
        _2160 = _2298;
    }
    float _2300 = _2160;
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2304 = _2224;
    float _2306 = _2300;
    if (_2264)
    {
        float _2308 = _2300 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        _2304 = _2310;
    }
    float _2312 = _2304;
    float _2314 = precise::max(0.0, _2302);
    float _2316 = _2296;
    float _2318 = _2314;
    if (_2264)
    {
        float _2320 = _2300 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        _2316 = _2322;
    }
    float _2324 = _2316;
    float _2326 = -_2250;
    float _2328 = -_2314;
    float _2330 = fma(_2230, _2326, _2328);
    float _2332 = _2330;
    if (_2264)
    {
        float _2334 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2318 = _2334;
    }
    float _2336 = _2318;
    float _2338 = _2312;
    float _2340 = _2336;
    if (_2264)
    {
        float _2342 = fma(_2312, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2338 = _2342;
    }
    float _2344 = _2338;
    float _2346 = _2344;
    if (_2264)
    {
        float _2348 = _2292 * _2344;
        _2346 = _2348;
    }
    float _2350 = _2346;
    if (_2264)
    {
        float _2352 = _2324 + (-1.0);
        _2340 = _2352;
    }
    float _2354 = _2340;
    float _2356 = _2354;
    if (_2264)
    {
        float _2358 = _2252 * _2350;
        _2276 = _2358;
    }
    float _2360 = _2276;
    if (_2264)
    {
        float _2362 = _2254 * _2350;
        _2278 = _2362;
    }
    float _2364 = _2278;
    if (_2264)
    {
        float _2366 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2366;
    }
    float _2368 = _2356;
    if (_2264)
    {
        float _2370 = _2360 * _2360;
        _2280 = _2370;
    }
    float _2372 = _2280;
    if (_2264)
    {
        float _2374 = _2364 * _2364;
        _2282 = _2374;
    }
    float _2376 = _2282;
    if (_2264)
    {
        float _2378 = fma(_2330, _2324, _2368);
        _2332 = _2378;
    }
    float _2380 = _2332;
    float _2382 = fma(_2380, _2380, _2372);
    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2386 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2384);
    float _2388 = precise::clamp(_2386, 0.0, 1.0);
    float _2390 = _2382 + _2376;
    float _2392 = -_2388;
    float _2394 = _2392 + 1.0;
    float _2396 = rsqrt(_2390);
    float _2398 = _2396 * _2360;
    float _2400 = _2396 * _2380;
    float _2402 = _2396 * _2364;
    float _2404 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2406 = abs(_2394);
    float _2408 = log2(_2406);
    float _2410 = -_2404;
    float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2410);
    float _2414 = -_2402;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2412);
    float _2418 = fma(_2416, -0.5, 0.5);
    float _2420 = fma(_2416, 0.5, 0.5);
    float _2422 = float(_2020);
    float _2424 = fma(_2420, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2426 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2428 = sqrt(_2418);
    float _2430 = fma(_2420, _2424, -0.212114393711090087890625);
    bool _2432 = _2422 >= _1052;
    bool _2434 = isnan(_2422);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan(_1052);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = _2400 + 1.0;
    float _2446 = fma(_2420, _2430, 1.570728778839111328125);
    float _2448 = exp2(_2426);
    float _2450 = _2428 * 0.636619746685028076171875;
    float _2452 = trunc(_2442);
    int _2454 = int(_2452);
    float _2456 = -_2400;
    float _2458 = fma(_2448, _2444, _2456);
    float _2460 = -_2446;
    float _2462 = fma(_2450, _2460, 1.0);
    float _2464 = fma(_2458, 0.5, 0.5);
    float2 _7507 = float2(_2462, _2464);
    float3 _2468 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7507, float2(0.0), isnan(_7507)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7507, float2(0.0), isnan(_7507)), level(0.0)).xyz;
    float _2470 = _2468.x;
    float _2472 = _2468.y;
    float _2474 = _2468.z;
    int _2476 = _936 * _2104;
    int _2478 = _2476 + _2020;
    bool _2480 = _936 == 0;
    float _2482 = _1052 * _2098;
    float _2484 = in.m_77.x;
    int _2486 = ~_2454;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2494 = !_2480;
    int _2496 = _2494 ? _2478 : (-1);
    float _2498 = _1064 * _182;
    int _2500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2502 = _2500 != 0;
    float _2504 = trunc(_2482);
    int _2506 = int(_2504);
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2510 = _2508 != 0;
    int _2512 = _2490 * _2496;
    int _2514 = _936 + (-1);
    float _2516 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2518 = !_2502;
    int _2520 = _2518 ? 0 : 1;
    float _2522 = -_724;
    float _2524 = _2522 + 1.0;
    int _2526 = abs(_982);
    float _2528 = trunc(_2498);
    int _2530 = int(_2528);
    int _2532 = _2454 * _2514;
    int _2534 = _2532 + _2512;
    int _2536 = abs(_2520);
    float _2538 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2516);
    out.m_79.x = _1833;
    out.m_79.y = _1831;
    out.m_79.z = _1835;
    int _2540 = abs(_988);
    float _2542 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2538);
    int _2544 = _2534 * _2526;
    float _2546 = as_type<float>(_2536);
    float _2548 = as_type<float>(_2540);
    if (_2510)
    {
        float _2550 = in.m_67.x;
        _2546 = _2550;
    }
    float _2552 = _2546;
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2556 = _2554 != 0;
    int _2558 = _2506 * _2536;
    int _2560 = _2558 + _2020;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2564 = _2562 != 0;
    float _2566 = exp2(_2492);
    int _2568 = _2530 * _2540;
    int _2570 = _2568 + _2544;
    bool _2572 = !_2556;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = in.m_77.y;
    bool _2578 = !_2564;
    int _2580 = _2578 ? 0 : 1;
    int _2582 = abs(_2574);
    float _2584 = in.m_67.w;
    int _2586 = abs(_2580);
    int _2588 = _2560 * _2582;
    int _2590 = _2588 + _2570;
    int _2592 = _2506;
    bool _2594 = _2564;
    float _2596 = _2484;
    if (!_2510)
    {
        _2548 = _2484;
    }
    float _2598 = _2548;
    bool _2600 = _728 > 0.5;
    int _2602 = _2506 * _2586;
    int _2604 = _2602 + _2590;
    float _2606 = _2598;
    if (_2510)
    {
        float _2608 = -_2484;
        float _2610 = _2608 + 1.0;
        _2592 = as_type<int>(_2610);
    }
    int _2612 = _2592;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2620 = _2618 != 0;
    if (_2510)
    {
        bool _2622 = _2552 > 0.5;
        _2594 = _2622;
    }
    bool _2624 = _2594;
    float _2626 = 1.0 / _2616;
    float _2628 = float(uint(_2604));
    if (_2510)
    {
        float _2630 = _2624 ? as_type<float>(_2612) : _2484;
        _2606 = _2630;
    }
    float _2632 = _2606;
    int _2634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2636 = _2634 != 0;
    float _2638 = as_type<float>(_2026) * _2628;
    float _2640 = -_2576;
    float _2642 = _2640 + 1.0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2646 = _2644 != 0;
    float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2652 = _2650 != 0;
    float _2654 = _2576;
    bool _2656 = _2646;
    if (_2620)
    {
        float _2658 = -_2484;
        float _2660 = _2658 + 1.0;
        _2284 = as_type<int>(_2660);
    }
    int _2662 = _2284;
    int _2664 = _2600 ? as_type<int>(_2642) : as_type<int>(_2576);
    float _2666 = _2646 ? as_type<float>(_2664) : _2576;
    float _2668 = trunc(_2638);
    float _2670 = precise::max(_2668, 0.0);
    uint _2672 = uint(_2670);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2674;
    bool _2678 = _2584 > 0.5;
    bool _2680 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2682 = isnan(_684);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2694 = _2676 * _2626;
    if (_2636)
    {
        float _2696 = _2678 ? _2642 : _2576;
        _2654 = _2696;
    }
    float _2698 = _2654;
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2702 = _684 + _2700;
    int _2704 = ~_936;
    int _2706 = _2704 + 1;
    float _2708 = -_796;
    float _2710 = fma(_978, _2692, _2708);
    bool _2712 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2714 = isnan(_684);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2720 = _2716 || _2718;
    float _2722 = float(_2720);
    float _2724 = -_2690;
    float _2726 = _2724 + 1.0;
    float _2728 = fma(_2694, _2702, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2730 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2732 = _2706 * int(_2672);
    int _2734 = _2732 + _2604;
    float _2736 = _2722 * _2726;
    float _2738 = _2722;
    float _2740 = as_type<float>(_2734);
    if (_2620)
    {
        bool _2742 = _732 > 0.5;
        _2656 = _2742;
    }
    bool _2744 = _2656;
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2748 = in.m_81.x;
    float _2750 = in.m_81.y;
    float _2752 = in.m_81.z;
    float _2754 = float(uint(_2734));
    float _2756 = _2728 * _2736;
    float _2758 = float(uint(_2560));
    float _2760 = fma(_2730, _2698, -0.5);
    bool _2762 = _1144 != 0.0;
    bool _2764 = isnan(_1144);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan(0.0);
    bool _2770 = _2766 || _2768;
    float _2772 = as_type<float>(_2026) * _2754;
    if (_2620)
    {
        float _2774 = _2744 ? as_type<float>(_2662) : _2484;
        _2596 = _2774;
    }
    float _2776 = _2596;
    float _2778 = as_type<float>(_2026) * _2758;
    bool _2780 = _1142 == 0.0;
    bool _2782 = !_2770;
    bool _2784 = _2780 && _2782;
    float _2786 = -_2722;
    float _2788 = _2786 + 1.0;
    float _2790 = -_1074;
    float _2792 = fma(_1060, _2760, _2790);
    int _2794 = ~_936;
    int _2796 = _2794 + 1;
    float _2798 = trunc(_2772);
    float _2800 = precise::max(_2798, 0.0);
    uint _2802 = uint(_2800);
    bool _2804 = _1146 == 0.0;
    bool _2806 = _2804 && _2784;
    float _2808 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2810 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2756);
    float _2812 = in.m_83.x;
    float _2814 = in.m_83.y;
    float _2816 = in.m_83.z;
    float _2818 = in.m_83.w;
    float _2820 = fma(_2808, _2776, -0.5);
    int _2822 = ~_936;
    int _2824 = _2822 + 1;
    float _2826 = trunc(_2778);
    float _2828 = precise::max(_2826, 0.0);
    uint _2830 = uint(_2828);
    float _2832 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2834 = fma(_880, _2820, _1050);
    float _2836 = _2792 + 0.5;
    float _2838 = fma(_2690, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2810);
    float _2840 = _2748;
    if (_2806)
    {
        _2306 = _2748;
    }
    float _2842 = _2306;
    int _2844 = int(_2672) + int(_2802);
    float _2846 = _2838 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2848 = _2842;
    if (_2806)
    {
        _2738 = _2842;
    }
    float _2850 = _2738;
    float _2852 = _2850;
    if (!_2806)
    {
        _2848 = _2748;
    }
    float _2854 = _2848;
    if (_2806)
    {
        _2840 = _2752;
    }
    float _2856 = _2840;
    float _2858 = _2856;
    if (!_2806)
    {
        float _2860 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2752);
        _2858 = _2860;
    }
    float _2862 = _2858;
    int _2864 = _2796 * int(_2830);
    int _2866 = _2864 + _2560;
    if (!_2806)
    {
        float _2868 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2854);
        _2852 = _2868;
    }
    float _2870 = _2852;
    float _2872 = fma(_1040, _2832, _852);
    if (_2806)
    {
        _2740 = _2750;
    }
    float _2874 = _2740;
    float _2876 = abs(_1176);
    float _2878 = log2(_2876);
    float _2880 = float(uint(_2866));
    int _2882 = _2824 * _2844;
    int _2884 = _2882 + _2604;
    float _2886 = _2874;
    if (!_2806)
    {
        float _2888 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2750);
        _2886 = _2888;
    }
    float _2890 = _2886;
    float _2892 = _2816 * _2854;
    float _2894 = _2814 * _2752;
    float _2896 = as_type<float>(_2026) * _2880;
    bool _2898 = uint(_2884) >= uint(_936);
    float _2900 = -_2892;
    float _2902 = fma(_2812, _2752, _2900);
    float _2904 = _2812 * _2750;
    float _2906 = -_2894;
    float _2908 = fma(_2816, _2750, _2906);
    bool _2910 = !_2898;
    int _2912 = _2910 ? 0 : (-1);
    float _2914 = trunc(_2896);
    float _2916 = precise::max(_2914, 0.0);
    uint _2918 = uint(_2916);
    float _2920 = -_2904;
    float _2922 = fma(_2814, _2854, _2920);
    float _2924 = _2834 + 0.5;
    int _2926 = ~_2844;
    int _2928 = _2926 + _2912;
    int _2930 = _2928 + 1;
    float _2932 = _2902 * _2818;
    float _2934 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2936 = _2908 * _2818;
    int _2938 = ~_936;
    int _2940 = _2938 + 1;
    float _2942 = _2922 * _2818;
    float _2944 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2946 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2948 = _936 * _2930;
    int _2950 = _2948 + _2604;
    float _2952 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2954 = exp2(_2934);
    float _2956 = _2710 + 0.5;
    float _2958 = _2872 + 0.5;
    int _2960 = int(_2830) + int(_2918);
    float _2962 = -_1218;
    float _2964 = fma(_2962, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2946);
    float _2966 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_85.x = _2958;
    out.m_85.y = _2956;
    out.m_85.z = _2924;
    out.m_85.w = _2836;
    bool _2968 = _1176 <= 8000.0;
    bool _2970 = isnan(_1176);
    bool _2972 = _2968 || _2970;
    bool _2974 = isnan(8000.0);
    bool _2976 = _2972 || _2974;
    float _2978 = float(_2976);
    int _2980 = _2940 * _2960;
    int _2982 = _2980 + _2560;
    float _2984 = -_1218;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2944);
    float _2988 = -_1218;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2952);
    bool _2992 = !_2480;
    int _2994 = _2992 ? _2950 : (-1);
    float _2996 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2998 = uint(_2982) >= uint(_936);
    float _3000 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2990);
    float _3002 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3004 = precise::clamp(_3002, 0.0, 1.0);
    float _3006 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2964);
    float _3008 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2996);
    float _3010 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2966);
    float _3012 = _3000 * _2814;
    int _3014 = _2994 >> 31;
    float _3016 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3018 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3020 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3022 = _3014 & 3;
    float _3024 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3016);
    float _3026 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2986);
    float _3028 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3020);
    int _3030 = _2994 + _3022;
    float _3032 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3018);
    float _3034 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3036 = _3026 * _2814;
    int _3038 = _3030 >> 2;
    float _3040 = _3006 * _2814;
    float _3042 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3034);
    int _3044 = _2994 & 3;
    float _3046 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3024);
    int _3048 = _3038 << 4;
    int _3050 = _3048 + 368;
    float _3052 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3032);
    bool _3054 = uint(_3044) >= 2u;
    float _3056 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3028);
    uint _3058 = uint(int(uint(_3050) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[int(_3068)][_3070];
    bool _3074 = !_2998;
    int _3076 = _3074 ? 0 : (-1);
    float _3078 = _3026 * _2890;
    bool _3080 = uint(_3044) > 1u;
    float _3082 = _3006 * _2890;
    float _3084 = _3000 * _2890;
    int _3086 = _3054 ? 0 : 1;
    float _3088 = _2932 * _3006;
    int _3090 = _3050 + 8;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    uint _3094 = uint(int(uint(int(_3092)) >> uint(2)));
    int _3096 = int(_3092) & 3;
    float _3098 = (*spvDescriptorSet0.vp_c9)._m0[int(_3094)][_3096];
    int _3100 = int(_3092) + 1;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    int _3104 = _3100 & 3;
    float _3106 = (*spvDescriptorSet0.vp_c9)._m0[int(_3102)][_3104];
    bool _3108 = _3044 != 3;
    out.m_87.w = _2846;
    int _3110 = _2994 & 3;
    bool _3112 = _3110 != 0;
    float _3114 = fma(_3046, _2870, _3078);
    int _3116 = ~_2960;
    int _3118 = _3116 + _3076;
    int _3120 = _3118 + 1;
    float _3122 = fma(_3052, _2870, _3082);
    int _3124 = _3112 ? 0 : 1;
    float _3126 = _2932 * _3000;
    float _3128 = fma(_3052, _2812, _3040);
    float _3130 = _2932 * _3026;
    int _3132 = ~_3124;
    int _3134 = _3132 + 1;
    int _3136 = _3134 + 1;
    float _3138 = fma(_3056, _2870, _3084);
    int _3140 = _3136;
    float _3142 = _2978;
    if (!_3080)
    {
        int _3144 = ~_3124;
        int _3146 = _3144 + 1;
        _3140 = _3146;
    }
    int _3148 = _3140;
    float _3150 = fma(_3046, _2812, _3036);
    int _3152 = ~_3086;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    float _3158 = fma(_2936, _3046, _3130);
    bool _3160 = !_3112;
    int _3162 = _3160 ? 0 : 1;
    float _3164 = fma(_3056, _2812, _3012);
    bool _3166 = _3044 != 3;
    float _3168 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3008);
    int _3170 = _3156;
    if (_3108)
    {
        int _3172 = ~_3086;
        int _3174 = _3172 + 1;
        _3170 = _3174;
    }
    int _3176 = _3170;
    float _3178 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3042);
    int _3180 = abs(_3148);
    float _3182 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3010);
    int _3184 = abs(_3162);
    float _3186 = fma(_3178, _2862, _3114);
    bool _3188 = !_3166;
    int _3190 = _3188 ? 0 : (-1);
    int _3192 = abs(_3176);
    int _3194 = ~_3180;
    int _3196 = _3194 + 1;
    int _3198 = _3196 + 1;
    int _3200 = abs(_3190);
    int _3202 = ~_3184;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    int _3208 = _3198 * as_type<int>(_3072);
    bool _3210 = !_2652;
    int _3212 = _3210 ? 0 : 1;
    float _3214 = fma(_2936, _3052, _3088);
    int _3216 = ~_3192;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3206 * as_type<int>(_3064);
    int _3224 = _3222 + _3208;
    int _3226 = abs(_3212);
    int _3228 = _936 * _3120;
    int _3230 = _3228 + _2560;
    int _3232 = ~_3200;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * as_type<int>(_3098);
    int _3240 = _3238 + _3224;
    int _3242 = ~_3226;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = fma(_3168, _2816, _3128);
    bool _3250 = !_2480;
    int _3252 = _3250 ? _3230 : (-1);
    int _3254 = _3236 * as_type<int>(_3106);
    int _3256 = _3254 + _3240;
    float _3258 = fma(_3178, _2816, _3150);
    float _3260 = fma(_2942, _3178, _3158);
    int _3262 = _3246 * _3256;
    float _3264 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2542);
    float _3266 = fma(_2936, _3056, _3126);
    float _3268 = fma(_3182, _2816, _3164);
    int _3270 = _3252 * _3226;
    int _3272 = _3270 + _3262;
    float _3274 = fma(_2942, _3168, _3214);
    float _3276 = fma(_3168, _2862, _3122);
    float _3278 = fma(_3004, -2.0, 3.0);
    float _3280 = _3004 * _3004;
    float _3282 = float(_3272);
    float _3284 = _3264 + _1907;
    float _3286 = fma(_2942, _3182, _3266);
    float _3288 = _3280 * _3278;
    out.m_89.x = _3282;
    float _3290 = -_3288;
    float _3292 = _3290 + 1.0;
    float _3294 = _3284 * 0.5;
    float _3296 = fma(_3182, _2862, _3138);
    out.m_91.x = _3258;
    out.m_91.y = _3248;
    out.m_91.z = _3268;
    float _3298 = fma(_3292, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3288);
    float _3300 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3302 = -_2566;
    float _3304 = _3302 + 1.0;
    out.m_93.x = _3260;
    out.m_93.y = _3274;
    out.m_93.z = _3286;
    float _3306 = _2978 * _3298;
    if (!_1885)
    {
        _3142 = 1.0;
    }
    float _3308 = _3142;
    float _3310 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3312 = _3308;
    float _3314 = _3310;
    if (_1885)
    {
        bool _3316 = _2001 >= _1953;
        bool _3318 = isnan(_2001);
        bool _3320 = _3316 || _3318;
        bool _3322 = isnan(_1953);
        bool _3324 = _3320 || _3322;
        float _3326 = float(_3324);
        _3312 = _3326;
    }
    float _3328 = _3312;
    float _3330 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1939;
    out.gl_Position.y = _1945;
    out.gl_Position.z = _3264;
    out.gl_Position.w = _1907;
    float _3332 = _3310 * _2003;
    float _3334 = -_3310;
    float _3336 = _3334 + 1.0;
    float _3338 = _2524 * _3330;
    float _3340 = precise::clamp(_3338, 0.0, 1.0);
    out.m_95.z = _3294;
    out.m_95.w = _1907;
    bool _3342 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3344 = isnan(_2248);
    bool _3346 = _3342 || _3344;
    bool _3348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3350 = _3346 || _3348;
    float _3352 = _2014 * _3336;
    float _3354 = -_3340;
    float _3356 = fma(_3354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3358 = _2014 * _3332;
    float _3360 = _2474 * _3332;
    out.m_97.x = _3186;
    out.m_97.y = _3276;
    out.m_97.z = _3296;
    float _3362 = _3328 * _2226;
    float _3364 = fma(_2470, _3358, _2008);
    float _3366 = fma(_2472, _3358, _2010);
    float _3368 = fma(_2014, _3360, _2012);
    float _3370 = -_3362;
    float _3372 = fma(_3370, _3356, 1.0);
    float _3374 = precise::clamp(_3372, 0.0, 1.0);
    float _3376 = _3330;
    float _3378 = _3362;
    float _3380 = _3336;
    float _3382 = _3358;
    if (!_3350)
    {
        _3314 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3384 = _3314;
    out.m_99.x = _3364;
    out.m_99.y = _3366;
    out.m_99.z = _3368;
    out.m_99.w = _3352;
    float _3386 = _3374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3388 = _3386;
    float _3390 = _3384;
    float _3392 = _3384;
    if (!_3350)
    {
        _3376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3394 = _3376;
    float _3396 = _3394;
    float _3398 = _3394;
    if (!_3350)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3400 = _3378;
    out.m_101.x = _3386;
    float _3402 = _3400;
    float _3404 = _3400;
    if (!_3350)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3406 = _3380;
    float _3408 = _3406;
    float _3410 = _3406;
    if (!_3350)
    {
        _3382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3412 = _3382;
    float _3414 = _3412;
    float _3416 = _3412;
    if (!_3350)
    {
        _3388 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3418 = _3388;
    bool _3420 = !_3350;
    float _3422 = _3418;
    float _3424 = _3418;
    if (!_3420)
    {
        bool _3426 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3428 = isnan(_2248);
        bool _3430 = _3426 || _3428;
        bool _3432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3434 = _3430 || _3432;
        if (!_3434)
        {
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3438 = _2248 + _3436;
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3442 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3440;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3448 = 1.0 / _3442;
            float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3454 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3464 = _3462 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3466 = _3438 * _3448;
            float _3468 = precise::clamp(_3466, 0.0, 1.0);
            float _3470 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3472 = _3470 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3474 = fma(_3468, _3446, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3476 = fma(_3468, _3472, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3478 = fma(_3468, _3452, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3480 = fma(_3468, _3456, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3482 = fma(_3468, _3460, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3484 = fma(_3468, _3464, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3398 = _3478;
            _3416 = _3482;
            _3392 = _3474;
            _3410 = _3480;
            _3404 = _3476;
            _3424 = _3484;
            _3486 = true;
        }
        else
        {
            bool _3488 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3490 = isnan(_2248);
            bool _3492 = _3488 || _3490;
            bool _3494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3496 = _3492 || _3494;
            if (!_3496)
            {
                _3390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3498 = _3390;
            _3392 = _3498;
            if (!_3496)
            {
                _3396 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3500 = _3396;
            _3398 = _3500;
            if (!_3496)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3502 = _3402;
            _3404 = _3502;
            if (!_3496)
            {
                _3408 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3504 = _3408;
            _3410 = _3504;
            if (!_3496)
            {
                _3414 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3506 = _3414;
            _3416 = _3506;
            if (!_3496)
            {
                _3422 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3508 = _3422;
            bool _3510 = !_3496;
            _3424 = _3508;
            if (!_3510)
            {
                bool _3512 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3514 = isnan(_2248);
                bool _3516 = _3512 || _3514;
                bool _3518 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3520 = _3516 || _3518;
                if (!_3520)
                {
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3524 = _2248 + _3522;
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3528 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3526;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3534 = 1.0 / _3528;
                    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3544 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3546 = _3544 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3552 = _3524 * _3534;
                    float _3554 = precise::clamp(_3552, 0.0, 1.0);
                    float _3556 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3560 = fma(_3554, _3532, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3562 = fma(_3554, _3558, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3564 = fma(_3554, _3538, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3566 = fma(_3554, _3542, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3568 = fma(_3554, _3546, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3570 = fma(_3554, _3550, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3398 = _3564;
                    _3416 = _3568;
                    _3392 = _3560;
                    _3410 = _3566;
                    _3404 = _3562;
                    _3424 = _3570;
                    _3486 = true;
                }
                else
                {
                    _3398 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3416 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3410 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3424 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3486 = false;
    float _3572 = _3398;
    float _3574 = _3416;
    float _3576 = _3392;
    float _3578 = _3410;
    float _3580 = _3404;
    float _3582 = _3424;
    float _3584 = fma(_3276, -0.5, 0.5);
    float _3586 = precise::clamp(_3584, 0.0, 1.0);
    float _3588 = -_3572;
    float _3590 = _3588 + _3574;
    float _3592 = _3300 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3594 = -_3576;
    float _3596 = _3594 + _3578;
    float _3598 = fma(_3586, _3590, _3572);
    out.m_103.x = 0.0;
    float _3600 = -_3580;
    float _3602 = _3600 + _3582;
    float _3604 = fma(_3586, _3596, _3576);
    float _3606 = _3598 * 0.586610972881317138671875;
    out.m_63.x = _3592;
    bool _3608 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3610 = fma(_3586, _3602, _3580);
    float _3612 = fma(_3604, 0.298911988735198974609375, _3606);
    bool _3614 = _2158 > 0.0;
    bool _3616 = isnan(_2158);
    bool _3618 = _3614 || _3616;
    bool _3620 = isnan(0.0);
    bool _3622 = _3618 || _3620;
    float _3624 = fma(_3610, 0.114477999508380889892578125, _3612);
    float _3626 = -_3624;
    float _3628 = _3604 + _3626;
    float _3630 = -_3624;
    float _3632 = _3598 + _3630;
    float _3634 = -_3624;
    float _3636 = _3610 + _3634;
    float _3638 = fma(_3628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    float _3640 = fma(_3632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    float _3642 = fma(_3636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    bool _3644 = !_3608;
    if (!_3644)
    {
        float _3646 = -_1831;
        float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3650 = -_1833;
        float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3654 = -_1835;
        float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3658 = _3648 * _3648;
        float _3660 = fma(_3652, _3652, _3658);
        float _3662 = fma(_3656, _3656, _3660);
        float _3664 = sqrt(_3662);
        float _3666 = rsqrt(_3662);
        float _3668 = -_3664;
        float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3672 = _3670 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3674 = precise::clamp(_3672, 0.0, 1.0);
        float _3676 = _3652 * _3666;
        float _3678 = _3648 * _3666;
        float _3680 = abs(_3674);
        float _3682 = log2(_3680);
        float _3684 = _3656 * _3666;
        float _3686 = _3676 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3688 = _3276 * _3678;
        float _3690 = -_3678;
        float _3692 = -_3686;
        float _3694 = fma(_3690, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3692);
        float _3696 = fma(_3186, _3676, _3688);
        float _3698 = -_3684;
        float _3700 = fma(_3698, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3694);
        float _3702 = fma(_3296, _3684, _3696);
        float _3704 = precise::clamp(_3702, 0.0, 1.0);
        float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3708 = _3700 + _3706;
        float _3710 = _3682 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3712 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3714 = precise::clamp(_3712, 0.0, 1.0);
        float _3716 = exp2(_3710);
        float _3718 = _3716 * _3714;
        float _3720 = _3704 * _3718;
        float _3722 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3724 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3726 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3722;
        out.m_103.y = _3724;
        out.m_103.z = _3726;
    }
    out.m_105.x = _3638;
    out.m_105.y = _3640;
    out.m_105.z = _3642;
    if (_3622)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3728 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3728;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3486 = false;
    bool _512 = false;
    bool _338 = false;
    bool _230 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = in.m_58.w;
    float _123 = trunc(_119);
    int _126 = int(_123);
    float _128 = -_121;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _130;
    bool _134 = _126 >= 1;
    float _136 = 0.0;
    float _138 = _121;
    float _140 = _130;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _136;
    if (!_134)
    {
        out.m_63.x = 0.0;
    }
    int _144 = 0;
    if (!_134)
    {
        float _146 = _142 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3796 = as_type<float>(_148);
        out.gl_Position.z = _3796;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _152 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_121);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = float(_126);
    bool _164 = _130 >= _162;
    bool _166 = !_160;
    bool _168 = _164 || _166;
    if (_168)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _138;
    if (_168)
    {
        out.m_63.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _150 = as_type<int>(_172);
    }
    int _174 = _150;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3851 = as_type<float>(_174);
        out.gl_Position.z = _3851;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_65.x;
    float _178 = in.m_65.y;
    float _180 = in.m_65.z;
    float _182 = 1.0 / _162;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _130 * _182;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _190 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _192 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _190);
    float _198 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _194);
    float _202 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _196);
    float _204 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _198);
    bool _206 = !_184;
    float _208 = _186;
    float _210 = _200;
    float _228;
    if (!_206)
    {
        float _212 = in.m_67.x;
        float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _216 = _212 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _218 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _220 = _218 * _214;
        float _222 = floor(_220);
        float _224 = -_222;
        float _226 = _220 + _224;
        _228 = _226;
        _230 = true;
    }
    else
    {
        _228 = _186;
    }
    _230 = false;
    float _232 = _228;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _232 + _234;
    bool _238 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _240 = isnan(_232);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    bool _254 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_232);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_248;
    float _268 = _266 + 1.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _270;
    float _274 = 1.0 / _252;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _278 = _264 * _268;
    float _280 = -_264;
    float _282 = _280 + 1.0;
    float _284 = _236 * _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = fma(_272, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _292;
    float _296 = fma(_288, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = fma(_294, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = _290 * _278;
    float _302 = _298 * _278;
    float _304 = _296 * _278;
    float _306 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _300);
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _310 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _304);
    float _312 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].x, _306);
    float _314 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].y, _308);
    float _316 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[144].z, _310);
    bool _318 = !_276;
    float _336;
    if (!_318)
    {
        float _320 = in.m_67.x;
        float _322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _324 = _320 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _328 = _326 * _322;
        float _330 = floor(_328);
        float _332 = -_330;
        float _334 = _328 + _332;
        _336 = _334;
        _338 = true;
    }
    else
    {
        _336 = _186;
    }
    _338 = false;
    float _340 = _336;
    float _342 = in.m_69.x;
    float _344 = in.m_69.y;
    float _346 = in.m_69.z;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _350 = _340 + _348;
    bool _352 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = isnan(_340);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _372 = 1.0 / _366;
    bool _374 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _376 = isnan(_340);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    bool _386 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _388 = 1.0 / _370;
    float _390 = _314 * _344;
    float _392 = _316 * _346;
    bool _394 = _340 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _396 = isnan(_340);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -_362;
    float _408 = _406 + 1.0;
    float _410 = _350 * _372;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _340 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _416;
    float _420 = _404 * _408;
    float _422 = -_404;
    float _424 = _422 + 1.0;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _430;
    float _434 = fma(_418, _410, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _436 = _384 * _424;
    float _438 = fma(_428, _410, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _440 = fma(_432, _410, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _442 = _414 * _388;
    float _444 = -_384;
    float _446 = _444 + 1.0;
    float _448 = _438 * _436;
    float _450 = _440 * _436;
    float _452 = _434 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].x, _448);
    float _468 = fma(_456, _442, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _470 = fma(_460, _442, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _472 = fma(_464, _442, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _474 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].y, _450);
    float _476 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[107].z, _452);
    float _478 = fma(_468, _420, _466);
    float _480 = _312 * _342;
    float _482 = fma(_470, _420, _474);
    float _484 = fma(_472, _420, _476);
    float _486 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].x, _478);
    float _488 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].y, _482);
    float _490 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[109].z, _484);
    bool _492 = !_386;
    float _510;
    if (!_492)
    {
        float _494 = in.m_67.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _510 = _508;
        _512 = true;
    }
    else
    {
        _510 = _186;
    }
    _512 = false;
    float _514 = _510;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _514 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_514);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _546 = isnan(_514);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = 1.0 / _522;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _558;
    float _562 = -_538;
    float _564 = _562 + 1.0;
    bool _566 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_514);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _580 = 1.0 / _526;
    float _582 = 1.0 / _542;
    float _584 = _560 * _556;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _590 = _554 * _564;
    float _592 = -_554;
    float _594 = _592 + 1.0;
    float _596 = fma(_584, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _598;
    float _602 = _576 * _594;
    float _604 = _588 * _580;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _514 + _606;
    bool _610 = _514 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = isnan(_514);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = _596 * _602;
    float _624 = -_576;
    float _626 = _624 + 1.0;
    float _628 = fma(_604, _608, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = _514 + _630;
    float _634 = _600 * _582;
    float _636 = -_620;
    float _638 = _636 + 1.0;
    float _640 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[115].x, _622);
    float _642 = _486 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_634, _632, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _646 = _538 * _638;
    float _648 = fma(_628, _590, _640);
    float _650 = _490 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = fma(_644, _646, _648);
    float _656 = _488 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[118].x, _654);
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _652;
    out.m_71.y = _662;
    out.m_71.z = _658;
    out.m_71.w = _664;
    bool _666 = !_578;
    if (!_666)
    {
        float _668 = in.m_67.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _208 = _682;
    }
    float _684 = _208;
    float _686 = in.m_56.x;
    float _688 = in.m_56.y;
    float _690 = in.m_56.z;
    float _692 = _688 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _694 = _688 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _696 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[4].x, _692);
    float _698 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[6].x, _694);
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[4].z, _696);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[6].z, _698);
    float _704 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _706 = _702 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _708 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _710 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _712 = floor(_708);
    float _714 = floor(_710);
    float _716 = -_712;
    float _718 = _708 + _716;
    float _720 = -_714;
    float _722 = _710 + _720;
    float2 _4768 = float2(_718, _722);
    float _724 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).x;
    float _726 = in.m_67.x;
    float _728 = in.m_67.y;
    float _730 = _688 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _732 = in.m_67.z;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _738 = _736 != 0;
    float _740 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _742 = log2(_740);
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _746 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _754 = _728 * 2.0;
    float _756 = _728 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _758 = _726 * 2.0;
    float _760 = _726 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _762 = floor(_754);
    float _764 = _732 * 2.0;
    float _766 = fma(_756, -2.0, _734);
    float _768 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[5].x, _730);
    float _770 = -_744;
    float _772 = fma(_760, 2.0, _770);
    float _774 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[5].z, _768);
    float _776 = floor(_758);
    float _778 = _728 + _732;
    float _780 = _686;
    int _782 = 2;
    float _784 = _726;
    if (!_738)
    {
        _780 = _728;
    }
    float _786 = _780;
    float _788 = _774 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = _786;
    if (_738)
    {
        _790 = _726;
    }
    float _792 = _790;
    float _794 = _778 + (-1.0);
    float _796 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _766);
    float _798 = floor(_764);
    float _800 = _728 + _726;
    bool _802 = _762 > 0.0;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _806 = _762 >= 0.0;
    bool _808 = isnan(_762);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _800 + (-1.0);
    float _818 = _792 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _820 = _776 > 0.0;
    float _822 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _826 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _828 = int(_826);
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _832 = _816;
    float _834 = _794;
    if (!_738)
    {
        _832 = _732;
    }
    float _836 = _832;
    float _838 = -_804;
    float _840 = fma(_818, 2.0, _838);
    float _842 = _836;
    if (_738)
    {
        _842 = _728;
    }
    float _844 = _842;
    float _846 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].z, _830);
    bool _848 = _798 > 0.0;
    float _850 = -_130;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[76].x, _772);
    bool _854 = _798 >= 0.0;
    bool _856 = isnan(_798);
    bool _858 = _854 || _856;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    float _864 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    bool _866 = _776 >= 0.0;
    bool _868 = isnan(_776);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    float _876 = _742 * _130;
    int _878 = _862 ? 0 : 1;
    float _880 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    if (!_738)
    {
        _834 = _732;
    }
    float _882 = _834;
    float _884 = float(_828);
    float _886 = exp2(_876);
    float _888 = _882;
    if (_738)
    {
        _888 = _728;
    }
    float _890 = _888;
    int _892 = ~_878;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = _890 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _900 = _896;
    if (!_848)
    {
        int _902 = ~_878;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = 1.0 / _884;
    int _910 = _874 ? 0 : 1;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _914 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = fma(_898, -2.0, _752);
    float _926 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    int _928 = ~_910;
    int _930 = _928 + 1;
    int _932 = _930 + 1;
    float _934 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _936 = int(_934);
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _940 = _938 != 0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _944 = _942 != 0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _948 = 1.0 + _946;
    int _950 = _932;
    if (!_820)
    {
        int _952 = ~_910;
        int _954 = _952 + 1;
        _950 = _954;
    }
    int _956 = _950;
    float _958 = -_886;
    float _960 = _958 + 1.0;
    bool _962 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _964 = isnan(1.0);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _970 = _966 || _968;
    float _972 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    int _974 = _814 ? 0 : 1;
    float _976 = _908 * _130;
    float _978 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _926);
    bool _980 = !_944;
    int _982 = _980 ? 0 : 1;
    float _984 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _986 = !_940;
    int _988 = _986 ? 0 : 1;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1002 = _1000 != 0;
    float _1004 = 1.0 / _948;
    int _1006 = ~_974;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[11].x, _984);
    int _1014 = _1010;
    if (!_802)
    {
        int _1016 = ~_974;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[78].z, _990);
    float _1024 = in.m_73.x;
    float _1026 = in.m_73.y;
    float _1028 = in.m_73.z;
    bool _1030 = !_994;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1012);
    bool _1036 = !_998;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1022);
    int _1042 = abs(_1032);
    float _1044 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1046 = abs(_1038);
    float _1048 = -_130;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _840);
    float _1052 = float(_936);
    float _1054 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1056 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1044);
    float _1058 = _922 ? _960 : 0.0;
    float _1060 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _864);
    float _1062 = float(_1042);
    float _1064 = _1052 * _130;
    float _1066 = float(_906);
    float _1068 = 1.0 / _1054;
    float _1070 = float(_956);
    float _1072 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1056);
    float _1074 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _924);
    if (_970)
    {
        float _1076 = _1058 * _1004;
        _140 = _1076;
    }
    float _1078 = _140;
    float _1080 = _1062 * _1066;
    bool _1082 = !_1002;
    int _1084 = _1082 ? 0 : 1;
    float _1086 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1088 = float(_1046);
    float _1090 = _1080 * (-2.0);
    int _1092 = abs(_1084);
    float _1094 = _1086 + _1054;
    float _1096 = _1088 * _1070;
    float _1098 = _726 + (-0.5);
    float _1100 = fma(_1090, _1024, _1024);
    float _1102 = fma(_824, _1090, _824);
    float _1104 = _1096 * (-2.0);
    float _1106 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1100);
    float _1108 = float(_1020);
    float _1110 = _1094 * _1068;
    float _1112 = _1110 * 0.5;
    float _1114 = float(_1092);
    float _1116 = fma(_822, _1104, _822);
    float _1118 = fma(_1102, _1078, _1106);
    float _1120 = fma(_1104, _1026, _1026);
    float _1122 = _728 + (-0.5);
    float _1124 = _1114 * _1108;
    float _1126 = _726 + _732;
    float _1128 = _1118 * 0.15915493667125701904296875;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1132 = _1126 + (-1.0);
    float _1134 = _1124 * (-2.0);
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1138 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1136);
    float _1140 = fma(_1116, _1078, _1130);
    float _1142 = in.m_75.x;
    float _1144 = in.m_75.y;
    float _1146 = in.m_75.z;
    float _1148 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1150 = fma(_1134, _1028, _1028);
    float _1152 = _732 + (-0.5);
    float _1154 = 1.0 / _1138;
    float _1156 = fma(_1148, _1134, _1148);
    float _1158 = _1140 * 0.15915493667125701904296875;
    float _1160 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1150);
    float _1162 = _788 + _972;
    float _1164 = fma(_1156, _1078, _1160);
    float _1166 = _480 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1168 = _1128 * 6.283185482025146484375;
    float _1170 = cos(_1168);
    float _1172 = _1164 * 0.15915493667125701904296875;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1176 = _1154 * _1174;
    float _1178 = _1158 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1142);
    bool _1184 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1144);
    bool _1188 = _1176 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1190 = _1182 * _1166;
    float _1192 = _1158 * 6.283185482025146484375;
    float _1194 = cos(_1192);
    float _1196 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1146);
    float _1198 = _1196 * _746;
    float _1200 = _1172 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = _1170 * _1180;
    float _1206 = _1162;
    if (!_1184)
    {
        _782 = 1;
    }
    int _1208 = _782;
    float _1210 = _1128 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = _1170 * _1194;
    float _1216 = _1172 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1170 * _1202;
    float _1222 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1224 = _1186 * _750;
    float _1226 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1222);
    float _1228 = _1212 * _1180;
    float _1230 = _1212 * _1194;
    bool _1232 = !_1184;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1226);
    float _1238 = _1194 * _1202;
    float _1240 = _1212 * _1202;
    int _1242 = _1208;
    if (!_1188)
    {
        _1242 = _1234;
    }
    int _1244 = _1242;
    float _1246 = _1220 * _1224;
    float _1248 = fma(_1218, _1214, _1228);
    float _1250 = fma(_1218, _1228, _1214);
    float _1252 = -_1204;
    float _1254 = fma(_1218, _1230, _1252);
    float _1256 = -_1230;
    float _1258 = fma(_1218, _1204, _1256);
    float _1260 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1262 = _1236 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1264 = fma(_1248, _1190, _1246);
    float _1266 = _1180 * _1202;
    float _1268 = fma(_704, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1260);
    float _1270 = -_1224;
    float _1272 = _1218 * _1270;
    float _1274 = _1240 * _1224;
    float _1276 = fma(_1258, _1198, _1264);
    float _1278 = fma(_706, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1268);
    float _1280 = fma(_1238, _1190, _1272);
    float _1282 = fma(_1254, _1190, _1274);
    float _1284 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1286 = _1278 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1288 = fma(_1266, _1198, _1280);
    float _1290 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1292 = fma(_1250, _1198, _1282);
    float _1294 = trunc(_1262);
    int _1296 = int(_1294);
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1284);
    float _1300 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1290);
    int _1302 = _1244 << 6;
    float _1304 = _1276 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1306 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1308 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1300);
    int _1310 = _1302 + 48;
    uint _1313 = uint(int(uint(_1310) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    float _1329 = trunc(_1286);
    int _1331 = int(_1329);
    float _1333 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1335 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1337 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1304);
    float _1339 = _706 + _1333;
    float _1341 = _704 + _1335;
    int _1343 = _1302 + 56;
    uint _1345 = uint(int(uint(_1343) >> uint(2)));
    uint _1347 = uint(int(uint(int(_1345)) >> uint(2)));
    int _1349 = int(_1345) & 3;
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[int(_1347)][_1349];
    int _1353 = int(_1345) + 1;
    uint _1355 = uint(int(uint(_1353) >> uint(2)));
    int _1357 = _1353 & 3;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[int(_1355)][_1357];
    int _1361 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1363 = _1296 + _1361;
    int _1365 = _1363 + 1;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1369 = _1339 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1373 = _1341 + _1371;
    float _1375 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1337);
    bool _1377 = _1365 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1379 = _1369 * _1369;
    int _1381 = _1302 + 64;
    uint _1383 = uint(int(uint(_1381) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
    int _1391 = int(_1383) + 1;
    uint _1393 = uint(int(uint(_1391) >> uint(2)));
    int _1395 = _1391 & 3;
    float _1397 = (*spvDescriptorSet0.vp_c15)._m0[int(_1393)][_1395];
    int _1399 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1401 = _1331 + _1399;
    int _1403 = _1401 + 1;
    float _1405 = fma(_1373, _1373, _1379);
    float _1407 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1409 = _1365 | _1403;
    int _1411 = _1302 + 72;
    uint _1413 = uint(int(uint(_1411) >> uint(2)));
    uint _1415 = uint(int(uint(int(_1413)) >> uint(2)));
    int _1417 = int(_1413) & 3;
    float _1419 = (*spvDescriptorSet0.vp_c15)._m0[int(_1415)][_1417];
    int _1421 = int(_1413) + 1;
    uint _1423 = uint(int(uint(_1421) >> uint(2)));
    int _1425 = _1421 & 3;
    float _1427 = (*spvDescriptorSet0.vp_c15)._m0[int(_1423)][_1425];
    bool _1429 = _1409 < 0;
    bool _1431 = _1429 || _1377;
    float _1433 = sqrt(_1405);
    bool _1435 = _1403 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1437 = _1435 || _1431;
    int _1439 = _1302 + 96;
    uint _1441 = uint(int(uint(_1439) >> uint(2)));
    uint _1443 = uint(int(uint(int(_1441)) >> uint(2)));
    int _1445 = int(_1441) & 3;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[int(_1443)][_1445];
    int _1449 = int(_1441) + 1;
    uint _1451 = uint(int(uint(_1449) >> uint(2)));
    int _1453 = _1449 & 3;
    float _1455 = (*spvDescriptorSet0.vp_c15)._m0[int(_1451)][_1453];
    int _1457 = _1302 + 104;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    int _1475 = as_type<int>(_1304);
    int _1477 = as_type<int>(_1292);
    float _1479 = _1407;
    float _1481 = _1341;
    float _1483 = _1339;
    if (!_1437)
    {
        int _1485 = _1403 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1487 = _1485 + _1365;
        _1475 = _1487;
    }
    int _1489 = _1475;
    bool _1491 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _788 + _1407;
    int _1495 = 0;
    float _1497 = as_type<float>(_1489);
    if (!_1437)
    {
        int _1499 = _1489 << 2;
        _1495 = _1499;
    }
    int _1501 = _1495;
    int _1503 = _1501;
    if (!_1437)
    {
        uint _1505 = uint(int(uint(_1489) >> uint(2)));
        _1477 = int(_1505);
    }
    int _1507 = _1477;
    float _1509 = as_type<float>(_1507);
    if (!_1437)
    {
        int _1511 = 12 & _1501;
        _1503 = _1511;
    }
    int _1513 = _1503;
    if (!_1437)
    {
        int _1515 = _1507 << 4;
        int _1517 = _1515 + _1513;
        _1479 = as_type<float>(_1517);
    }
    float _1519 = _1479;
    if (!_1491)
    {
        _1509 = _1341;
    }
    float _1521 = _1509;
    float _1523 = _1521;
    if (!_1491)
    {
        _1481 = _1493;
    }
    float _1525 = _1481;
    bool _1527 = !_1491;
    float _1529 = _1525;
    float _1531 = _1455;
    float _1533 = _1419;
    if (!_1527)
    {
        float _1535 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1539 = _1433 + _1537;
        float _1541 = rsqrt(_1405);
        float _1543 = _1539 * _1535;
        float _1545 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1547 = _1543 * 0.15915493667125701904296875;
        float _1549 = _1547 * 6.283185482025146484375;
        float _1551 = cos(_1549);
        float _1553 = _1547 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        float _1557 = _1551 + (-1.0);
        float _1559 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1561 = fma(_1555, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1563 = fma(_1493, _1551, _1559);
        float _1565 = _1541 * _1561;
        float _1567 = fma(_1373, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1569 = fma(_1369, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1529 = _1563;
        _1523 = _1567;
        _1483 = _1569;
    }
    float _1571 = _1529;
    float _1573 = _1523;
    float _1575 = _1483;
    float _1577 = -_788;
    float _1579 = _1577 + _1571;
    int _1581 = _1302 + 80;
    uint _1583 = uint(int(uint(_1581) >> uint(2)));
    uint _1585 = uint(int(uint(int(_1583)) >> uint(2)));
    int _1587 = int(_1583) & 3;
    float _1589 = (*spvDescriptorSet0.vp_c15)._m0[int(_1585)][_1587];
    int _1591 = int(_1583) + 1;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    int _1595 = _1591 & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    float _1599 = -_704;
    float _1601 = _1599 + _1573;
    float _1603 = -_706;
    float _1605 = _1603 + _1575;
    float _1607 = _1579 * _1579;
    float _1609 = _1162 * _1455;
    float _1611 = _1162 * _1397;
    float _1613 = _1573;
    float _1615 = _1571;
    float _1617 = _1575;
    float _1619 = _1579;
    if (!_1437)
    {
        float _1621 = floor(_1262);
        _1531 = _1621;
    }
    float _1623 = _1531;
    float _1625 = fma(_1601, _1601, _1607);
    int _1627 = _1302 + 88;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c15)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    float _1645 = fma(_704, _1447, _1609);
    float _1647 = fma(_1605, _1605, _1625);
    bool _1649 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1651 = isnan(0.5);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1657 = _1653 || _1655;
    float _1659 = fma(_706, _1465, _1645);
    float _1661 = _1162 * _1327;
    float _1663 = sqrt(_1647);
    float _1665 = _1519;
    if (!_1437)
    {
        int _1667 = as_type<int>(_1519) + 400;
        uint _1669 = uint(int(uint(_1667) >> uint(2)));
        uint _1671 = uint(int(uint(int(_1669)) >> uint(2)));
        int _1673 = int(_1669) & 3;
        float _1675 = (*spvDescriptorSet0.vp_c15)._m0[int(_1671)][_1673];
        _1665 = _1675;
    }
    float _1677 = _1665;
    float _1679 = _1659 + _1473;
    float _1681 = fma(_704, _1389, _1611);
    float _1683 = fma(_704, _1319, _1661);
    float _1685 = fma(_706, _1419, _1681);
    float _1687 = _1645;
    float _1689 = _1681;
    float _1691 = _1683;
    if (!_1437)
    {
        float _1693 = floor(_1286);
        _1687 = _1693;
    }
    float _1695 = _1687;
    float _1697 = fma(_706, _1351, _1683);
    float _1699 = _1685 + _1427;
    float _1701 = _1697 + _1359;
    bool _1703 = _1663 > 0.0;
    float _1705 = 1.0 / _1679;
    bool _1707 = !_1703;
    if (!_1707)
    {
        float _1709 = _202 * _202;
        float _1711 = fma(_200, _200, _1709);
        float _1713 = fma(_204, _204, _1711);
        float _1715 = rsqrt(_1647);
        float _1717 = sqrt(_1713);
        float _1719 = _1601 * _1715;
        float _1721 = _1579 * _1715;
        float _1723 = _1605 * _1715;
        bool _1725 = _1717 > 0.0;
        bool _1727 = !_1725;
        _1689 = _1715;
        _1691 = _1713;
        if (!_1727)
        {
            float _1729 = rsqrt(_1713);
            float _1731 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1733 = _202 * _1729;
            float _1735 = _200 * _1729;
            float _1737 = _204 * _1729;
            float _1739 = _1721 * _1733;
            float _1741 = fma(_1719, _1735, _1739);
            float _1743 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1745 = fma(_1723, _1737, _1741);
            float _1747 = _1745 * _1743;
            float _1749 = fma(_200, _1747, _1573);
            float _1751 = fma(_202, _1747, _1571);
            float _1753 = fma(_204, _1747, _1575);
            _1613 = _1749;
            _1615 = _1751;
            _1617 = _1753;
            _1689 = _1747;
            _1533 = _1741;
        }
    }
    float _1755 = _1613;
    float _1757 = _1615;
    float _1759 = _1617;
    float _1761 = _1689;
    float _1763 = _1691;
    float _1765 = _1533;
    float _1767 = _1763;
    float _1769 = _1761;
    float _1771 = _1765;
    float _1773 = _1757;
    if (_1657)
    {
        _1767 = _1755;
    }
    float _1775 = _1767;
    float _1777 = _1775;
    if (_1657)
    {
        _1769 = _1757;
    }
    float _1779 = _1769;
    float _1781 = _1779;
    if (_1657)
    {
        _210 = _1759;
    }
    float _1783 = _210;
    float _1785 = _1783;
    if (!_1657)
    {
        float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1789 = _788 + _1787;
        float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1793 = _704 + _1791;
        float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1797 = -_788;
        float _1799 = _1797 + _1757;
        float _1801 = _1789 * _1789;
        float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1805 = _706 + _1803;
        float _1807 = -_706;
        float _1809 = _1807 + _1759;
        float _1811 = fma(_1793, _1793, _1801);
        float _1813 = fma(_1805, _1805, _1811);
        float _1815 = sqrt(_1813);
        float _1817 = precise::min(_1815, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1819 = _1817 * _1795;
        float _1821 = -_704;
        float _1823 = _1821 + _1755;
        float _1825 = fma(_1799, _1819, _788);
        float _1827 = fma(_1823, _1819, _704);
        float _1829 = fma(_1809, _1819, _706);
        _1781 = _1825;
        _1777 = _1827;
        _1785 = _1829;
        _1771 = _1809;
    }
    float _1831 = _1781;
    float _1833 = _1777;
    float _1835 = _1785;
    float _1837 = _1771;
    float _1839 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1841 = _1701 * _1705;
    float _1843 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1845 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1847 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1839);
    float _1849 = _1699 * _1705;
    float _1851 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1843);
    float _1853 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1845);
    bool _1855 = _1841 >= 0.0;
    float _1857 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1847);
    float _1859 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1851);
    float _1861 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1853);
    bool _1863 = _1841 <= 1.0;
    bool _1865 = _1863 && _1855;
    float _1867 = _1831 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1869 = _1857 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1871 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1873 = _1849 >= 0.0;
    bool _1875 = _1873 && _1865;
    float _1877 = fma(_1833, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1867);
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1881 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1883 = _1849 <= 1.0;
    bool _1885 = _1883 && _1875;
    float _1887 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1877);
    float _1889 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1879);
    float _1891 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1893 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1895 = _1887 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1897 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1889);
    float _1899 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1901 = -_1893;
    float _1903 = fma(_1901, _1891, 1.0);
    float _1905 = _1162 * _1597;
    float _1907 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1897);
    float _1909 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1911 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1899);
    float _1913 = fma(_704, _1589, _1905);
    float _1915 = log2(_1903);
    float _1917 = _1905;
    if (_1885)
    {
        float _1919 = float(_1244);
        _1917 = _1919;
    }
    float _1921 = _1917;
    float _1923 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1909);
    float _1925 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1911);
    float _1927 = fma(_706, _1635, _1913);
    float _1929 = _1925;
    if (!_1437)
    {
        float _1931 = -_1695;
        float _1933 = _1286 + _1931;
        _1619 = _1933;
    }
    float _1935 = _1619;
    float _1937 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1923);
    float _1939 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1925);
    float _1941 = 1.0 / _1907;
    float _1943 = _1927 + _1643;
    float _1945 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1937);
    if (!_1437)
    {
        float _1947 = -_1623;
        float _1949 = _1262 + _1947;
        _1929 = _1949;
    }
    float _1951 = _1929;
    float _1953 = _1943 * _1705;
    float _1955 = _1837;
    if (!_1437)
    {
        float _1957 = rint(_1677);
        float _1959 = precise::max(_1957, 0.0);
        uint _1961 = uint(_1959);
        uint _1963 = clamp(_1961, 0u, 65535u);
        _1955 = as_type<float>(_1963);
    }
    float _1965 = _1955;
    float _1967 = _1915 * 0.693147182464599609375;
    float _1969 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1971 = _1921;
    if (_1885)
    {
        float _1973 = rint(_1921);
        float _1975 = precise::max(_1973, 0.0);
        uint _1977 = uint(_1975);
        uint _1979 = clamp(_1977, 0u, 65535u);
        _1971 = as_type<float>(_1979);
    }
    float _1981 = _1971;
    float _1983 = _1939 * _1941;
    float _1985 = _1945 * _1941;
    float _1987 = fma(_1983, 0.5, 0.5);
    float _1989 = fma(_1985, -0.5, 0.5);
    float _1991 = _1935;
    if (!_1437)
    {
        float3 _6805 = float3(_1951, _1935, float(as_type<int>(_1965)));
        float3 _6809 = select(_6805, float3(0.0), isnan(_6805));
        float _1993 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6809.xy, uint(rint(_6809.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6809.xy, uint(rint(_6809.z)), level(0.0)).x;
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1849;
    if (_1885)
    {
        float3 _6824 = float3(_1841, _1849, float(as_type<int>(_1981)));
        float3 _6826 = select(_6824, float3(0.0), isnan(_6824));
        float _1999 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6826.xy, uint(rint(_6826.z)), _1953, level(0.0));
        _1997 = _1999;
    }
    float _2001 = _1997;
    float3 _6836 = float3(_1987, _1989, _1969);
    float _2003 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6836, float3(0.0), isnan(_6836)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6836, float3(0.0), isnan(_6836)), level(0.0)).x;
    float3 _6845 = float3(_1987, _1989, _1969);
    float4 _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6845, float3(0.0), isnan(_6845)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6845, float3(0.0), isnan(_6845)), level(0.0)).xyzw;
    float _2008 = _2006.x;
    float _2010 = _2006.y;
    float _2012 = _2006.z;
    float _2014 = _2006.w;
    float _2016 = float(uint(_936));
    float _2018 = trunc(_976);
    int _2020 = int(_2018);
    float _2022 = 1.0 / _2016;
    float _2024 = float(uint(_2020));
    int _2026 = as_type<int>(_2022) + (-2);
    float _2028 = as_type<float>(_2026) * _2024;
    float _2030 = trunc(_2028);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    int _2036 = ~_936;
    int _2038 = _2036 + 1;
    bool _2040 = !_738;
    float _2042 = _2040 ? 7.345489978790283203125 : 1.0;
    bool _2044 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2046 = isnan(0.5);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2052 = _2048 || _2050;
    int _2054 = _2038 * int(_2034);
    int _2056 = _2054 + _2020;
    float _2058 = _2042 * _726;
    float _2060 = float(uint(_2056));
    float _2062 = as_type<float>(_2026) * _2060;
    int _2064 = ~_936;
    int _2066 = _2064 + 1;
    float _2068 = _2062;
    if (_2052)
    {
        _784 = 1.0;
    }
    float _2070 = _784;
    float _2072 = trunc(_2062);
    float _2074 = precise::max(_2072, 0.0);
    uint _2076 = uint(_2074);
    float _2078 = _2070;
    if (_1437)
    {
        _2068 = 1.0;
    }
    float _2080 = _2068;
    int _2082 = int(_2034) + int(_2076);
    float _2084 = floor(_2058);
    int _2086 = _2066 * _2082;
    int _2088 = _2086 + _2020;
    bool _2090 = uint(_2088) >= uint(_936);
    bool _2092 = !_2090;
    int _2094 = _2092 ? 0 : (-1);
    float _2096 = -_2084;
    float _2098 = _2058 + _2096;
    int _2100 = ~_2082;
    int _2102 = _2100 + _2094;
    int _2104 = _2102 + 1;
    float _2106 = _2080;
    if (!_2052)
    {
        float _2108 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2110 = _2108 * 0.15915493667125701904296875;
        float _2112 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2116 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2114;
        float _2118 = _2110 * 6.283185482025146484375;
        float _2120 = cos(_2118);
        float _2122 = _2112 * 0.15915493667125701904296875;
        float _2124 = _2110 * 6.283185482025146484375;
        float _2126 = sin(_2124);
        float _2128 = 1.0 / _2120;
        float _2130 = _2122 * 6.283185482025146484375;
        float _2132 = cos(_2130);
        float _2134 = _2126 * _2128;
        float _2136 = _2122 * 6.283185482025146484375;
        float _2138 = sin(_2136);
        float _2140 = _2132 * _2134;
        float _2142 = 1.0 / _2116;
        float _2144 = 1.0 / _2140;
        float _2146 = _2138 * _2144;
        float _2148 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2150 = fma(_1176, _2146, _2148);
        float _2152 = _2150 * _2142;
        float _2154 = precise::clamp(_2152, 0.0, 1.0);
        _1773 = _2122;
        _2078 = _2154;
    }
    float _2156 = _1773;
    float _2158 = _2078;
    float _2160 = _2156;
    if (!_1437)
    {
        int _2162 = _1489 << 4;
        int _2164 = _2162 + 2048;
        uint _2166 = uint(int(uint(_2164) >> uint(2)));
        uint _2168 = uint(int(uint(int(_2166)) >> uint(2)));
        int _2170 = int(_2166) & 3;
        float _2172 = (*spvDescriptorSet0.vp_c15)._m0[int(_2168)][_2170];
        int _2174 = int(_2166) + 1;
        uint _2176 = uint(int(uint(_2174) >> uint(2)));
        int _2178 = _2174 & 3;
        float _2180 = (*spvDescriptorSet0.vp_c15)._m0[int(_2176)][_2178];
        int _2182 = _2164 + 8;
        uint _2184 = uint(int(uint(_2182) >> uint(2)));
        uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
        int _2188 = int(_2184) & 3;
        float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
        int _2192 = int(_2184) + 1;
        uint _2194 = uint(int(uint(_2192) >> uint(2)));
        int _2196 = _2192 & 3;
        float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
        float _2200 = _1162 * _2180;
        float _2202 = fma(_704, _2172, _2200);
        float _2204 = fma(_706, _2190, _2202);
        float _2206 = _2204 + _2198;
        float _2208 = precise::clamp(_2206, 0.0, 1.0);
        float _2210 = -_2208;
        float _2212 = _2210 + _1995;
        float _2214 = fma(_2212, 500.0, 1.5);
        float _2216 = exp2(_2214);
        float _2218 = 0.0 + _2216;
        float _2220 = precise::clamp(_2218, 0.0, 1.0);
        _1206 = _2200;
        _1497 = as_type<float>(_2164);
        _2106 = _2220;
    }
    float _2222 = _1206;
    float _2224 = _1497;
    float _2226 = _2106;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2230 = _1831 + _2228;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2234 = _1833 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2238 = _1835 + _2236;
    float _2240 = _2230 * _2230;
    float _2242 = fma(_2234, _2234, _2240);
    float _2244 = fma(_2238, _2238, _2242);
    float _2246 = rsqrt(_2244);
    float _2248 = sqrt(_2244);
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2252 = _2234 * _2250;
    float _2254 = _2238 * _2250;
    float _2256 = _2252 * _2252;
    float _2258 = _2254 * _2254;
    float _2260 = _2256 + _2258;
    float _2262 = sqrt(_2260);
    bool _2264 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2268 = _2262 + _2266;
    float _2270 = _2222;
    float _2272 = _2260;
    float _2274 = _2268;
    float _2276 = _2252;
    float _2278 = _2254;
    float _2280 = _2256;
    float _2282 = _2258;
    int _2284 = as_type<int>(_2250);
    if (_2264)
    {
        float _2286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2270 = _2286;
    }
    float _2288 = _2270;
    if (_2264)
    {
        float _2290 = rsqrt(_2260);
        _2272 = _2290;
    }
    float _2292 = _2272;
    if (_2264)
    {
        float _2294 = _2268 * _2288;
        _2274 = _2294;
    }
    float _2296 = _2274;
    if (_2264)
    {
        float _2298 = _2296 * 0.15915493667125701904296875;
        _2160 = _2298;
    }
    float _2300 = _2160;
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2304 = _2224;
    float _2306 = _2300;
    if (_2264)
    {
        float _2308 = _2300 * 6.283185482025146484375;
        float _2310 = sin(_2308);
        _2304 = _2310;
    }
    float _2312 = _2304;
    float _2314 = precise::max(0.0, _2302);
    float _2316 = _2296;
    float _2318 = _2314;
    if (_2264)
    {
        float _2320 = _2300 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        _2316 = _2322;
    }
    float _2324 = _2316;
    float _2326 = -_2250;
    float _2328 = -_2314;
    float _2330 = fma(_2230, _2326, _2328);
    float _2332 = _2330;
    if (_2264)
    {
        float _2334 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2318 = _2334;
    }
    float _2336 = _2318;
    float _2338 = _2312;
    float _2340 = _2336;
    if (_2264)
    {
        float _2342 = fma(_2312, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2338 = _2342;
    }
    float _2344 = _2338;
    float _2346 = _2344;
    if (_2264)
    {
        float _2348 = _2292 * _2344;
        _2346 = _2348;
    }
    float _2350 = _2346;
    if (_2264)
    {
        float _2352 = _2324 + (-1.0);
        _2340 = _2352;
    }
    float _2354 = _2340;
    float _2356 = _2354;
    if (_2264)
    {
        float _2358 = _2252 * _2350;
        _2276 = _2358;
    }
    float _2360 = _2276;
    if (_2264)
    {
        float _2362 = _2254 * _2350;
        _2278 = _2362;
    }
    float _2364 = _2278;
    if (_2264)
    {
        float _2366 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2366;
    }
    float _2368 = _2356;
    if (_2264)
    {
        float _2370 = _2360 * _2360;
        _2280 = _2370;
    }
    float _2372 = _2280;
    if (_2264)
    {
        float _2374 = _2364 * _2364;
        _2282 = _2374;
    }
    float _2376 = _2282;
    if (_2264)
    {
        float _2378 = fma(_2330, _2324, _2368);
        _2332 = _2378;
    }
    float _2380 = _2332;
    float _2382 = fma(_2380, _2380, _2372);
    float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2386 = fma(_2248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2384);
    float _2388 = precise::clamp(_2386, 0.0, 1.0);
    float _2390 = _2382 + _2376;
    float _2392 = -_2388;
    float _2394 = _2392 + 1.0;
    float _2396 = rsqrt(_2390);
    float _2398 = _2396 * _2360;
    float _2400 = _2396 * _2380;
    float _2402 = _2396 * _2364;
    float _2404 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2406 = abs(_2394);
    float _2408 = log2(_2406);
    float _2410 = -_2404;
    float _2412 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2410);
    float _2414 = -_2402;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2412);
    float _2418 = fma(_2416, -0.5, 0.5);
    float _2420 = fma(_2416, 0.5, 0.5);
    float _2422 = float(_2020);
    float _2424 = fma(_2420, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2426 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2428 = sqrt(_2418);
    float _2430 = fma(_2420, _2424, -0.212114393711090087890625);
    bool _2432 = _2422 >= _1052;
    bool _2434 = isnan(_2422);
    bool _2436 = _2432 || _2434;
    bool _2438 = isnan(_1052);
    bool _2440 = _2436 || _2438;
    float _2442 = float(_2440);
    float _2444 = _2400 + 1.0;
    float _2446 = fma(_2420, _2430, 1.570728778839111328125);
    float _2448 = exp2(_2426);
    float _2450 = _2428 * 0.636619746685028076171875;
    float _2452 = trunc(_2442);
    int _2454 = int(_2452);
    float _2456 = -_2400;
    float _2458 = fma(_2448, _2444, _2456);
    float _2460 = -_2446;
    float _2462 = fma(_2450, _2460, 1.0);
    float _2464 = fma(_2458, 0.5, 0.5);
    float2 _7507 = float2(_2462, _2464);
    float3 _2468 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7507, float2(0.0), isnan(_7507)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7507, float2(0.0), isnan(_7507)), level(0.0)).xyz;
    float _2470 = _2468.x;
    float _2472 = _2468.y;
    float _2474 = _2468.z;
    int _2476 = _936 * _2104;
    int _2478 = _2476 + _2020;
    bool _2480 = _936 == 0;
    float _2482 = _1052 * _2098;
    float _2484 = in.m_77.x;
    int _2486 = ~_2454;
    int _2488 = _2486 + 1;
    int _2490 = _2488 + 1;
    float _2492 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2494 = !_2480;
    int _2496 = _2494 ? _2478 : (-1);
    float _2498 = _1064 * _182;
    int _2500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2502 = _2500 != 0;
    float _2504 = trunc(_2482);
    int _2506 = int(_2504);
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2510 = _2508 != 0;
    int _2512 = _2490 * _2496;
    int _2514 = _936 + (-1);
    float _2516 = _1869 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2518 = !_2502;
    int _2520 = _2518 ? 0 : 1;
    float _2522 = -_724;
    float _2524 = _2522 + 1.0;
    int _2526 = abs(_982);
    float _2528 = trunc(_2498);
    int _2530 = int(_2528);
    int _2532 = _2454 * _2514;
    int _2534 = _2532 + _2512;
    int _2536 = abs(_2520);
    float _2538 = fma(_1871, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2516);
    out.m_79.x = _1833;
    out.m_79.y = _1831;
    out.m_79.z = _1835;
    int _2540 = abs(_988);
    float _2542 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2538);
    int _2544 = _2534 * _2526;
    float _2546 = as_type<float>(_2536);
    float _2548 = as_type<float>(_2540);
    if (_2510)
    {
        float _2550 = in.m_67.x;
        _2546 = _2550;
    }
    float _2552 = _2546;
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2556 = _2554 != 0;
    int _2558 = _2506 * _2536;
    int _2560 = _2558 + _2020;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2564 = _2562 != 0;
    float _2566 = exp2(_2492);
    int _2568 = _2530 * _2540;
    int _2570 = _2568 + _2544;
    bool _2572 = !_2556;
    int _2574 = _2572 ? 0 : 1;
    float _2576 = in.m_77.y;
    bool _2578 = !_2564;
    int _2580 = _2578 ? 0 : 1;
    int _2582 = abs(_2574);
    float _2584 = in.m_67.w;
    int _2586 = abs(_2580);
    int _2588 = _2560 * _2582;
    int _2590 = _2588 + _2570;
    int _2592 = _2506;
    bool _2594 = _2564;
    float _2596 = _2484;
    if (!_2510)
    {
        _2548 = _2484;
    }
    float _2598 = _2548;
    bool _2600 = _728 > 0.5;
    int _2602 = _2506 * _2586;
    int _2604 = _2602 + _2590;
    float _2606 = _2598;
    if (_2510)
    {
        float _2608 = -_2484;
        float _2610 = _2608 + 1.0;
        _2592 = as_type<int>(_2610);
    }
    int _2612 = _2592;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2616 = _2614 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2620 = _2618 != 0;
    if (_2510)
    {
        bool _2622 = _2552 > 0.5;
        _2594 = _2622;
    }
    bool _2624 = _2594;
    float _2626 = 1.0 / _2616;
    float _2628 = float(uint(_2604));
    if (_2510)
    {
        float _2630 = _2624 ? as_type<float>(_2612) : _2484;
        _2606 = _2630;
    }
    float _2632 = _2606;
    int _2634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2636 = _2634 != 0;
    float _2638 = as_type<float>(_2026) * _2628;
    float _2640 = -_2576;
    float _2642 = _2640 + 1.0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2646 = _2644 != 0;
    float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2652 = _2650 != 0;
    float _2654 = _2576;
    bool _2656 = _2646;
    if (_2620)
    {
        float _2658 = -_2484;
        float _2660 = _2658 + 1.0;
        _2284 = as_type<int>(_2660);
    }
    int _2662 = _2284;
    int _2664 = _2600 ? as_type<int>(_2642) : as_type<int>(_2576);
    float _2666 = _2646 ? as_type<float>(_2664) : _2576;
    float _2668 = trunc(_2638);
    float _2670 = precise::max(_2668, 0.0);
    uint _2672 = uint(_2670);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2676 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2674;
    bool _2678 = _2584 > 0.5;
    bool _2680 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2682 = isnan(_684);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = fma(_2666, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2694 = _2676 * _2626;
    if (_2636)
    {
        float _2696 = _2678 ? _2642 : _2576;
        _2654 = _2696;
    }
    float _2698 = _2654;
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2702 = _684 + _2700;
    int _2704 = ~_936;
    int _2706 = _2704 + 1;
    float _2708 = -_796;
    float _2710 = fma(_978, _2692, _2708);
    bool _2712 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2714 = isnan(_684);
    bool _2716 = _2712 || _2714;
    bool _2718 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2720 = _2716 || _2718;
    float _2722 = float(_2720);
    float _2724 = -_2690;
    float _2726 = _2724 + 1.0;
    float _2728 = fma(_2694, _2702, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2730 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2732 = _2706 * int(_2672);
    int _2734 = _2732 + _2604;
    float _2736 = _2722 * _2726;
    float _2738 = _2722;
    float _2740 = as_type<float>(_2734);
    if (_2620)
    {
        bool _2742 = _732 > 0.5;
        _2656 = _2742;
    }
    bool _2744 = _2656;
    float _2746 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2748 = in.m_81.x;
    float _2750 = in.m_81.y;
    float _2752 = in.m_81.z;
    float _2754 = float(uint(_2734));
    float _2756 = _2728 * _2736;
    float _2758 = float(uint(_2560));
    float _2760 = fma(_2730, _2698, -0.5);
    bool _2762 = _1144 != 0.0;
    bool _2764 = isnan(_1144);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan(0.0);
    bool _2770 = _2766 || _2768;
    float _2772 = as_type<float>(_2026) * _2754;
    if (_2620)
    {
        float _2774 = _2744 ? as_type<float>(_2662) : _2484;
        _2596 = _2774;
    }
    float _2776 = _2596;
    float _2778 = as_type<float>(_2026) * _2758;
    bool _2780 = _1142 == 0.0;
    bool _2782 = !_2770;
    bool _2784 = _2780 && _2782;
    float _2786 = -_2722;
    float _2788 = _2786 + 1.0;
    float _2790 = -_1074;
    float _2792 = fma(_1060, _2760, _2790);
    int _2794 = ~_936;
    int _2796 = _2794 + 1;
    float _2798 = trunc(_2772);
    float _2800 = precise::max(_2798, 0.0);
    uint _2802 = uint(_2800);
    bool _2804 = _1146 == 0.0;
    bool _2806 = _2804 && _2784;
    float _2808 = _2746 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2810 = fma(_2788, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2756);
    float _2812 = in.m_83.x;
    float _2814 = in.m_83.y;
    float _2816 = in.m_83.z;
    float _2818 = in.m_83.w;
    float _2820 = fma(_2808, _2776, -0.5);
    int _2822 = ~_936;
    int _2824 = _2822 + 1;
    float _2826 = trunc(_2778);
    float _2828 = precise::max(_2826, 0.0);
    uint _2830 = uint(_2828);
    float _2832 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2834 = fma(_880, _2820, _1050);
    float _2836 = _2792 + 0.5;
    float _2838 = fma(_2690, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2810);
    float _2840 = _2748;
    if (_2806)
    {
        _2306 = _2748;
    }
    float _2842 = _2306;
    int _2844 = int(_2672) + int(_2802);
    float _2846 = _2838 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2848 = _2842;
    if (_2806)
    {
        _2738 = _2842;
    }
    float _2850 = _2738;
    float _2852 = _2850;
    if (!_2806)
    {
        _2848 = _2748;
    }
    float _2854 = _2848;
    if (_2806)
    {
        _2840 = _2752;
    }
    float _2856 = _2840;
    float _2858 = _2856;
    if (!_2806)
    {
        float _2860 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2752);
        _2858 = _2860;
    }
    float _2862 = _2858;
    int _2864 = _2796 * int(_2830);
    int _2866 = _2864 + _2560;
    if (!_2806)
    {
        float _2868 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2854);
        _2852 = _2868;
    }
    float _2870 = _2852;
    float _2872 = fma(_1040, _2832, _852);
    if (_2806)
    {
        _2740 = _2750;
    }
    float _2874 = _2740;
    float _2876 = abs(_1176);
    float _2878 = log2(_2876);
    float _2880 = float(uint(_2866));
    int _2882 = _2824 * _2844;
    int _2884 = _2882 + _2604;
    float _2886 = _2874;
    if (!_2806)
    {
        float _2888 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2750);
        _2886 = _2888;
    }
    float _2890 = _2886;
    float _2892 = _2816 * _2854;
    float _2894 = _2814 * _2752;
    float _2896 = as_type<float>(_2026) * _2880;
    bool _2898 = uint(_2884) >= uint(_936);
    float _2900 = -_2892;
    float _2902 = fma(_2812, _2752, _2900);
    float _2904 = _2812 * _2750;
    float _2906 = -_2894;
    float _2908 = fma(_2816, _2750, _2906);
    bool _2910 = !_2898;
    int _2912 = _2910 ? 0 : (-1);
    float _2914 = trunc(_2896);
    float _2916 = precise::max(_2914, 0.0);
    uint _2918 = uint(_2916);
    float _2920 = -_2904;
    float _2922 = fma(_2814, _2854, _2920);
    float _2924 = _2834 + 0.5;
    int _2926 = ~_2844;
    int _2928 = _2926 + _2912;
    int _2930 = _2928 + 1;
    float _2932 = _2902 * _2818;
    float _2934 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2936 = _2908 * _2818;
    int _2938 = ~_936;
    int _2940 = _2938 + 1;
    float _2942 = _2922 * _2818;
    float _2944 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2946 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2948 = _936 * _2930;
    int _2950 = _2948 + _2604;
    float _2952 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2954 = exp2(_2934);
    float _2956 = _2710 + 0.5;
    float _2958 = _2872 + 0.5;
    int _2960 = int(_2830) + int(_2918);
    float _2962 = -_1218;
    float _2964 = fma(_2962, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2946);
    float _2966 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_85.x = _2958;
    out.m_85.y = _2956;
    out.m_85.z = _2924;
    out.m_85.w = _2836;
    bool _2968 = _1176 <= 8000.0;
    bool _2970 = isnan(_1176);
    bool _2972 = _2968 || _2970;
    bool _2974 = isnan(8000.0);
    bool _2976 = _2972 || _2974;
    float _2978 = float(_2976);
    int _2980 = _2940 * _2960;
    int _2982 = _2980 + _2560;
    float _2984 = -_1218;
    float _2986 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2944);
    float _2988 = -_1218;
    float _2990 = fma(_2988, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2952);
    bool _2992 = !_2480;
    int _2994 = _2992 ? _2950 : (-1);
    float _2996 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2998 = uint(_2982) >= uint(_936);
    float _3000 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2990);
    float _3002 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3004 = precise::clamp(_3002, 0.0, 1.0);
    float _3006 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2964);
    float _3008 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2996);
    float _3010 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2966);
    float _3012 = _3000 * _2814;
    int _3014 = _2994 >> 31;
    float _3016 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3018 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3020 = _1248 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3022 = _3014 & 3;
    float _3024 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3016);
    float _3026 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2986);
    float _3028 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3020);
    int _3030 = _2994 + _3022;
    float _3032 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3018);
    float _3034 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3036 = _3026 * _2814;
    int _3038 = _3030 >> 2;
    float _3040 = _3006 * _2814;
    float _3042 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3034);
    int _3044 = _2994 & 3;
    float _3046 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3024);
    int _3048 = _3038 << 4;
    int _3050 = _3048 + 368;
    float _3052 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3032);
    bool _3054 = uint(_3044) >= 2u;
    float _3056 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3028);
    uint _3058 = uint(int(uint(_3050) >> uint(2)));
    uint _3060 = uint(int(uint(int(_3058)) >> uint(2)));
    int _3062 = int(_3058) & 3;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[int(_3060)][_3062];
    int _3066 = int(_3058) + 1;
    uint _3068 = uint(int(uint(_3066) >> uint(2)));
    int _3070 = _3066 & 3;
    float _3072 = (*spvDescriptorSet0.vp_c9)._m0[int(_3068)][_3070];
    bool _3074 = !_2998;
    int _3076 = _3074 ? 0 : (-1);
    float _3078 = _3026 * _2890;
    bool _3080 = uint(_3044) > 1u;
    float _3082 = _3006 * _2890;
    float _3084 = _3000 * _2890;
    int _3086 = _3054 ? 0 : 1;
    float _3088 = _2932 * _3006;
    int _3090 = _3050 + 8;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    uint _3094 = uint(int(uint(int(_3092)) >> uint(2)));
    int _3096 = int(_3092) & 3;
    float _3098 = (*spvDescriptorSet0.vp_c9)._m0[int(_3094)][_3096];
    int _3100 = int(_3092) + 1;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    int _3104 = _3100 & 3;
    float _3106 = (*spvDescriptorSet0.vp_c9)._m0[int(_3102)][_3104];
    bool _3108 = _3044 != 3;
    out.m_87.w = _2846;
    int _3110 = _2994 & 3;
    bool _3112 = _3110 != 0;
    float _3114 = fma(_3046, _2870, _3078);
    int _3116 = ~_2960;
    int _3118 = _3116 + _3076;
    int _3120 = _3118 + 1;
    float _3122 = fma(_3052, _2870, _3082);
    int _3124 = _3112 ? 0 : 1;
    float _3126 = _2932 * _3000;
    float _3128 = fma(_3052, _2812, _3040);
    float _3130 = _2932 * _3026;
    int _3132 = ~_3124;
    int _3134 = _3132 + 1;
    int _3136 = _3134 + 1;
    float _3138 = fma(_3056, _2870, _3084);
    int _3140 = _3136;
    float _3142 = _2978;
    if (!_3080)
    {
        int _3144 = ~_3124;
        int _3146 = _3144 + 1;
        _3140 = _3146;
    }
    int _3148 = _3140;
    float _3150 = fma(_3046, _2812, _3036);
    int _3152 = ~_3086;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    float _3158 = fma(_2936, _3046, _3130);
    bool _3160 = !_3112;
    int _3162 = _3160 ? 0 : 1;
    float _3164 = fma(_3056, _2812, _3012);
    bool _3166 = _3044 != 3;
    float _3168 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3008);
    int _3170 = _3156;
    if (_3108)
    {
        int _3172 = ~_3086;
        int _3174 = _3172 + 1;
        _3170 = _3174;
    }
    int _3176 = _3170;
    float _3178 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3042);
    int _3180 = abs(_3148);
    float _3182 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3010);
    int _3184 = abs(_3162);
    float _3186 = fma(_3178, _2862, _3114);
    bool _3188 = !_3166;
    int _3190 = _3188 ? 0 : (-1);
    int _3192 = abs(_3176);
    int _3194 = ~_3180;
    int _3196 = _3194 + 1;
    int _3198 = _3196 + 1;
    int _3200 = abs(_3190);
    int _3202 = ~_3184;
    int _3204 = _3202 + 1;
    int _3206 = _3204 + 1;
    int _3208 = _3198 * as_type<int>(_3072);
    bool _3210 = !_2652;
    int _3212 = _3210 ? 0 : 1;
    float _3214 = fma(_2936, _3052, _3088);
    int _3216 = ~_3192;
    int _3218 = _3216 + 1;
    int _3220 = _3218 + 1;
    int _3222 = _3206 * as_type<int>(_3064);
    int _3224 = _3222 + _3208;
    int _3226 = abs(_3212);
    int _3228 = _936 * _3120;
    int _3230 = _3228 + _2560;
    int _3232 = ~_3200;
    int _3234 = _3232 + 1;
    int _3236 = _3234 + 1;
    int _3238 = _3220 * as_type<int>(_3098);
    int _3240 = _3238 + _3224;
    int _3242 = ~_3226;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = fma(_3168, _2816, _3128);
    bool _3250 = !_2480;
    int _3252 = _3250 ? _3230 : (-1);
    int _3254 = _3236 * as_type<int>(_3106);
    int _3256 = _3254 + _3240;
    float _3258 = fma(_3178, _2816, _3150);
    float _3260 = fma(_2942, _3178, _3158);
    int _3262 = _3246 * _3256;
    float _3264 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2542);
    float _3266 = fma(_2936, _3056, _3126);
    float _3268 = fma(_3182, _2816, _3164);
    int _3270 = _3252 * _3226;
    int _3272 = _3270 + _3262;
    float _3274 = fma(_2942, _3168, _3214);
    float _3276 = fma(_3168, _2862, _3122);
    float _3278 = fma(_3004, -2.0, 3.0);
    float _3280 = _3004 * _3004;
    float _3282 = float(_3272);
    float _3284 = _3264 + _1907;
    float _3286 = fma(_2942, _3182, _3266);
    float _3288 = _3280 * _3278;
    out.m_89.x = _3282;
    float _3290 = -_3288;
    float _3292 = _3290 + 1.0;
    float _3294 = _3284 * 0.5;
    float _3296 = fma(_3182, _2862, _3138);
    out.m_91.x = _3258;
    out.m_91.y = _3248;
    out.m_91.z = _3268;
    float _3298 = fma(_3292, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3288);
    float _3300 = _2158 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3302 = -_2566;
    float _3304 = _3302 + 1.0;
    out.m_93.x = _3260;
    out.m_93.y = _3274;
    out.m_93.z = _3286;
    float _3306 = _2978 * _3298;
    if (!_1885)
    {
        _3142 = 1.0;
    }
    float _3308 = _3142;
    float _3310 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3312 = _3308;
    float _3314 = _3310;
    if (_1885)
    {
        bool _3316 = _2001 >= _1953;
        bool _3318 = isnan(_2001);
        bool _3320 = _3316 || _3318;
        bool _3322 = isnan(_1953);
        bool _3324 = _3320 || _3322;
        float _3326 = float(_3324);
        _3312 = _3326;
    }
    float _3328 = _3312;
    float _3330 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1939;
    out.gl_Position.y = _1945;
    out.gl_Position.z = _3264;
    out.gl_Position.w = _1907;
    float _3332 = _3310 * _2003;
    float _3334 = -_3310;
    float _3336 = _3334 + 1.0;
    float _3338 = _2524 * _3330;
    float _3340 = precise::clamp(_3338, 0.0, 1.0);
    out.m_95.z = _3294;
    out.m_95.w = _1907;
    bool _3342 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3344 = isnan(_2248);
    bool _3346 = _3342 || _3344;
    bool _3348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3350 = _3346 || _3348;
    float _3352 = _2014 * _3336;
    float _3354 = -_3340;
    float _3356 = fma(_3354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3358 = _2014 * _3332;
    float _3360 = _2474 * _3332;
    out.m_97.x = _3186;
    out.m_97.y = _3276;
    out.m_97.z = _3296;
    float _3362 = _3328 * _2226;
    float _3364 = fma(_2470, _3358, _2008);
    float _3366 = fma(_2472, _3358, _2010);
    float _3368 = fma(_2014, _3360, _2012);
    float _3370 = -_3362;
    float _3372 = fma(_3370, _3356, 1.0);
    float _3374 = precise::clamp(_3372, 0.0, 1.0);
    float _3376 = _3330;
    float _3378 = _3362;
    float _3380 = _3336;
    float _3382 = _3358;
    if (!_3350)
    {
        _3314 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3384 = _3314;
    out.m_99.x = _3364;
    out.m_99.y = _3366;
    out.m_99.z = _3368;
    out.m_99.w = _3352;
    float _3386 = _3374 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3388 = _3386;
    float _3390 = _3384;
    float _3392 = _3384;
    if (!_3350)
    {
        _3376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3394 = _3376;
    float _3396 = _3394;
    float _3398 = _3394;
    if (!_3350)
    {
        _3378 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3400 = _3378;
    out.m_101.x = _3386;
    float _3402 = _3400;
    float _3404 = _3400;
    if (!_3350)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3406 = _3380;
    float _3408 = _3406;
    float _3410 = _3406;
    if (!_3350)
    {
        _3382 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3412 = _3382;
    float _3414 = _3412;
    float _3416 = _3412;
    if (!_3350)
    {
        _3388 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3418 = _3388;
    bool _3420 = !_3350;
    float _3422 = _3418;
    float _3424 = _3418;
    if (!_3420)
    {
        bool _3426 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3428 = isnan(_2248);
        bool _3430 = _3426 || _3428;
        bool _3432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3434 = _3430 || _3432;
        if (!_3434)
        {
            float _3436 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3438 = _2248 + _3436;
            float _3440 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3442 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3440;
            float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3448 = 1.0 / _3442;
            float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3454 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3456 = _3454 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3464 = _3462 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3466 = _3438 * _3448;
            float _3468 = precise::clamp(_3466, 0.0, 1.0);
            float _3470 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3472 = _3470 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3474 = fma(_3468, _3446, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3476 = fma(_3468, _3472, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3478 = fma(_3468, _3452, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3480 = fma(_3468, _3456, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3482 = fma(_3468, _3460, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3484 = fma(_3468, _3464, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3398 = _3478;
            _3416 = _3482;
            _3392 = _3474;
            _3410 = _3480;
            _3404 = _3476;
            _3424 = _3484;
            _3486 = true;
        }
        else
        {
            bool _3488 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3490 = isnan(_2248);
            bool _3492 = _3488 || _3490;
            bool _3494 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3496 = _3492 || _3494;
            if (!_3496)
            {
                _3390 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3498 = _3390;
            _3392 = _3498;
            if (!_3496)
            {
                _3396 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3500 = _3396;
            _3398 = _3500;
            if (!_3496)
            {
                _3402 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3502 = _3402;
            _3404 = _3502;
            if (!_3496)
            {
                _3408 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3504 = _3408;
            _3410 = _3504;
            if (!_3496)
            {
                _3414 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3506 = _3414;
            _3416 = _3506;
            if (!_3496)
            {
                _3422 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3508 = _3422;
            bool _3510 = !_3496;
            _3424 = _3508;
            if (!_3510)
            {
                bool _3512 = _2248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3514 = isnan(_2248);
                bool _3516 = _3512 || _3514;
                bool _3518 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3520 = _3516 || _3518;
                if (!_3520)
                {
                    float _3522 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3524 = _2248 + _3522;
                    float _3526 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3528 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3526;
                    float _3530 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3532 = _3530 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3534 = 1.0 / _3528;
                    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3538 = _3536 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3542 = _3540 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3544 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3546 = _3544 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3548 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3550 = _3548 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3552 = _3524 * _3534;
                    float _3554 = precise::clamp(_3552, 0.0, 1.0);
                    float _3556 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3558 = _3556 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3560 = fma(_3554, _3532, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3562 = fma(_3554, _3558, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3564 = fma(_3554, _3538, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3566 = fma(_3554, _3542, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3568 = fma(_3554, _3546, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3570 = fma(_3554, _3550, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3398 = _3564;
                    _3416 = _3568;
                    _3392 = _3560;
                    _3410 = _3566;
                    _3404 = _3562;
                    _3424 = _3570;
                    _3486 = true;
                }
                else
                {
                    _3398 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3416 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3392 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3410 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3404 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3424 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3486 = false;
    float _3572 = _3398;
    float _3574 = _3416;
    float _3576 = _3392;
    float _3578 = _3410;
    float _3580 = _3404;
    float _3582 = _3424;
    float _3584 = fma(_3276, -0.5, 0.5);
    float _3586 = precise::clamp(_3584, 0.0, 1.0);
    float _3588 = -_3572;
    float _3590 = _3588 + _3574;
    float _3592 = _3300 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3594 = -_3576;
    float _3596 = _3594 + _3578;
    float _3598 = fma(_3586, _3590, _3572);
    out.m_103.x = 0.0;
    float _3600 = -_3580;
    float _3602 = _3600 + _3582;
    float _3604 = fma(_3586, _3596, _3576);
    float _3606 = _3598 * 0.586610972881317138671875;
    out.m_63.x = _3592;
    bool _3608 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3610 = fma(_3586, _3602, _3580);
    float _3612 = fma(_3604, 0.298911988735198974609375, _3606);
    bool _3614 = _2158 > 0.0;
    bool _3616 = isnan(_2158);
    bool _3618 = _3614 || _3616;
    bool _3620 = isnan(0.0);
    bool _3622 = _3618 || _3620;
    float _3624 = fma(_3610, 0.114477999508380889892578125, _3612);
    float _3626 = -_3624;
    float _3628 = _3604 + _3626;
    float _3630 = -_3624;
    float _3632 = _3598 + _3630;
    float _3634 = -_3624;
    float _3636 = _3610 + _3634;
    float _3638 = fma(_3628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    float _3640 = fma(_3632, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    float _3642 = fma(_3636, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3624);
    bool _3644 = !_3608;
    if (!_3644)
    {
        float _3646 = -_1831;
        float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3650 = -_1833;
        float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3654 = -_1835;
        float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3658 = _3648 * _3648;
        float _3660 = fma(_3652, _3652, _3658);
        float _3662 = fma(_3656, _3656, _3660);
        float _3664 = sqrt(_3662);
        float _3666 = rsqrt(_3662);
        float _3668 = -_3664;
        float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3672 = _3670 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3674 = precise::clamp(_3672, 0.0, 1.0);
        float _3676 = _3652 * _3666;
        float _3678 = _3648 * _3666;
        float _3680 = abs(_3674);
        float _3682 = log2(_3680);
        float _3684 = _3656 * _3666;
        float _3686 = _3676 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3688 = _3276 * _3678;
        float _3690 = -_3678;
        float _3692 = -_3686;
        float _3694 = fma(_3690, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3692);
        float _3696 = fma(_3186, _3676, _3688);
        float _3698 = -_3684;
        float _3700 = fma(_3698, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3694);
        float _3702 = fma(_3296, _3684, _3696);
        float _3704 = precise::clamp(_3702, 0.0, 1.0);
        float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3708 = _3700 + _3706;
        float _3710 = _3682 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3712 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3714 = precise::clamp(_3712, 0.0, 1.0);
        float _3716 = exp2(_3710);
        float _3718 = _3716 * _3714;
        float _3720 = _3704 * _3718;
        float _3722 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3724 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3726 = _3720 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3722;
        out.m_103.y = _3724;
        out.m_103.z = _3726;
    }
    out.m_105.x = _3638;
    out.m_105.y = _3640;
    out.m_105.z = _3642;
    if (_3622)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3728 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3728;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

