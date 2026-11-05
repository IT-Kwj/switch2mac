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
    float4 m_93 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
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
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3678 = false;
    bool _618 = false;
    bool _390 = false;
    bool _228 = false;
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
        float _3988 = as_type<float>(_148);
        out.gl_Position.z = _3988;
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
        float _4043 = as_type<float>(_174);
        out.gl_Position.z = _4043;
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
    float _226;
    if (!_206)
    {
        float _210 = in.m_67.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        _226 = _186;
    }
    _228 = false;
    float _230 = _226;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    bool _236 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_230);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _230 + _248;
    bool _252 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_230);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_230);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_246;
    float _286 = _284 + 1.0;
    float _288 = 1.0 / _270;
    float _290 = _282 * _286;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _302 = 1.0 / _266;
    float _304 = _262 * _294;
    float _306 = -_262;
    float _308 = _306 + 1.0;
    float _310 = _250 * _288;
    float _312 = _234 * _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = fma(_298, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = fma(_316, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = fma(_320, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _328 = _322 * _304;
    float _330 = _324 * _304;
    float _332 = _326 * _304;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _328);
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _350 = fma(_336, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _352 = fma(_340, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _354 = fma(_344, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].z, _332);
    float _358 = fma(_350, _290, _346);
    float _360 = fma(_352, _290, _348);
    float _362 = fma(_354, _290, _356);
    float _364 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].x, _358);
    float _366 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].y, _360);
    float _368 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].z, _362);
    bool _370 = !_300;
    float _388;
    if (!_370)
    {
        float _372 = in.m_67.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        _388 = _186;
    }
    _390 = false;
    float _392 = _388;
    float _394 = in.m_69.x;
    float _396 = in.m_69.y;
    float _398 = in.m_69.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _402 = _392 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _416 = 1.0 / _406;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _420 = 1.0 / _414;
    float _422 = _368 * _398;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _426 = _392 + _424;
    float _428 = 1.0 / _410;
    float _430 = _402 * _416;
    bool _432 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _434 = isnan(_392);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _446 = _392 + _444;
    float _448 = _366 * _396;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _450;
    float _454 = _364 * _394;
    float _456 = -_442;
    float _458 = _456 + 1.0;
    float _460 = _426 * _420;
    bool _462 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _464 = isnan(_392);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    bool _474 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _476 = isnan(_392);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _472 * _458;
    bool _488 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_392);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = _446 * _428;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _502;
    float _506 = -_484;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _518 = -_472;
    float _520 = _518 + 1.0;
    float _522 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _524 = _498 * _508;
    float _526 = fma(_452, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _528 = fma(_512, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _530 = _484 * _520;
    float _532 = _522 * _524;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = _526 * _524;
    float _540 = _528 * _524;
    float _542 = -_498;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _550 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].x, _538);
    float _552 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].y, _532);
    float _554 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].z, _540);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _556;
    float _560 = fma(_516, _460, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _562 = fma(_548, _460, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _564 = fma(_536, _460, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _570;
    float _574 = fma(_560, _530, _550);
    float _576 = fma(_558, _430, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _578 = fma(_568, _430, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _580 = fma(_572, _430, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _582 = fma(_562, _530, _552);
    float _584 = fma(_564, _530, _554);
    float _586 = fma(_576, _486, _574);
    float _588 = fma(_578, _486, _582);
    float _590 = fma(_580, _486, _584);
    float _592 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].x, _586);
    float _594 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].y, _588);
    float _596 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].z, _590);
    bool _598 = !_418;
    float _616;
    if (!_598)
    {
        float _600 = in.m_67.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        _616 = _186;
    }
    _618 = false;
    float _620 = _616;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _620 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _640 = isnan(_620);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = 1.0 / _628;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _656 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _658 = isnan(_620);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _670 = 1.0 / _636;
    float _672 = _632 * _650;
    bool _674 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _676 = isnan(_620);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _654;
    float _688 = -_648;
    float _690 = _688 + 1.0;
    float _692 = fma(_672, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _698 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _700 = isnan(_620);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_684;
    float _712 = _710 + 1.0;
    float _714 = _684 * _690;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _720 = 1.0 / _696;
    float _722 = -_708;
    float _724 = _722 + 1.0;
    float _726 = _666 * _712;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _728;
    float _732 = _718 * _670;
    float _734 = _648 * _724;
    float _736 = _692 * _726;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _740 = _620 + _738;
    float _742 = -_666;
    float _744 = _742 + 1.0;
    bool _746 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _748 = isnan(_620);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _730 * _686;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _620 + _764;
    float _768 = fma(_732, _740, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _770 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[115].x, _736);
    float _772 = -_756;
    float _774 = _772 + 1.0;
    float _776 = _762 * _720;
    float _778 = fma(_758, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _782 = _620 + _780;
    float _784 = fma(_768, _714, _770);
    float _786 = _708 * _774;
    float _788 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _790 = fma(_776, _782, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _792 = fma(_778, _734, _784);
    float _794 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = fma(_790, _786, _792);
    float _800 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[119].x, _798);
    float _806 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _806;
    out.m_71.y = _796;
    out.m_71.z = _802;
    out.m_71.w = _808;
    bool _810 = !_668;
    if (!_810)
    {
        float _812 = in.m_67.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _208 = _826;
    }
    float _828 = _208;
    float _830 = in.m_56.x;
    float _832 = in.m_56.y;
    float _834 = in.m_56.z;
    float _836 = _832 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _838 = _832 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _840 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[6].x, _838);
    float _844 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].z, _840);
    float _846 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _848 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _856 = floor(_852);
    float _858 = floor(_854);
    float _860 = -_856;
    float _862 = _852 + _860;
    float _864 = -_858;
    float _866 = _854 + _864;
    float2 _5200 = float2(_862, _866);
    float _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5200, float2(0.0), isnan(_5200)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5200, float2(0.0), isnan(_5200)), level(0.0)).x;
    float _870 = in.m_67.x;
    float _872 = in.m_67.y;
    float _874 = _832 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = in.m_67.z;
    float _878 = in.m_67.w;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _882 = _880 != 0;
    float _884 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _888 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _890 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _892 = _870 * 2.0;
    float _894 = _870 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _896 = _872 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _898 = _876 * 2.0;
    float _900 = floor(_892);
    float _902 = -_886;
    float _904 = fma(_894, 2.0, _902);
    float _906 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _910 = _874;
    float _912 = _834;
    int _914 = 2;
    if (!_882)
    {
        float _916 = in.m_67.z;
        _910 = _916;
    }
    float _918 = _910;
    float _920 = _872 * 2.0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _928 = _926 != 0;
    float _930 = fma(_896, -2.0, _908);
    float _932 = floor(_898);
    float _934 = _872 + _870;
    float _936 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].z, _906);
    bool _938 = !_928;
    int _940 = _938 ? 0 : 1;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _944 = !_924;
    int _946 = _944 ? 0 : 1;
    float _948 = _934 + (-1.0);
    float _950 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _952 = _900 > 0.0;
    float _954 = floor(_920);
    bool _956 = _900 >= 0.0;
    bool _958 = isnan(_900);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _968 = _948;
    if (!_882)
    {
        _968 = _872;
    }
    float _970 = _968;
    float _972 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _984 = _982 != 0;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _988 = _932 >= 0.0;
    bool _990 = isnan(_932);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1000 = int(_998);
    float _1002 = _970;
    bool _1004 = _984;
    if (_882)
    {
        _1002 = _870;
    }
    float _1006 = _1002;
    float _1008 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _930);
    int _1010 = _996 ? 0 : 1;
    float _1012 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1014 = _932 > 0.0;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1018 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1020 = log2(_1018);
    int _1022 = _964 ? 0 : 1;
    float _1024 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1012);
    bool _1026 = !_976;
    int _1028 = _1026 ? 0 : 1;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1032 = _954 > 0.0;
    float _1034 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1024);
    bool _1036 = _954 >= 0.0;
    bool _1038 = isnan(_954);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(0.0);
    bool _1044 = _1040 || _1042;
    float _1046 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1048 = _918;
    float _1050 = _1008;
    if (!_882)
    {
        _912 = _918;
    }
    float _1052 = _912;
    float _1054 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1030);
    float _1056 = _1052;
    if (_882)
    {
        _1056 = _872;
    }
    float _1058 = _1056;
    float _1060 = -_942;
    float _1062 = fma(_1046, 2.0, _1060);
    int _1064 = ~_1010;
    int _1066 = _1064 + 1;
    int _1068 = _1066 + 1;
    float _1070 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1072 = int(_1070);
    int _1074 = _1068;
    if (!_1014)
    {
        int _1076 = ~_1010;
        int _1078 = _1076 + 1;
        _1074 = _1078;
    }
    int _1080 = _1074;
    float _1082 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1084 = abs(_1028);
    float _1086 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1016);
    float _1088 = float(_1000);
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1092 = float(_1084);
    float _1094 = -_130;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1062);
    float _1098 = float(_1080);
    float _1100 = 1.0 / _1088;
    float _1102 = _1092 * _1098;
    float _1104 = _1020 * _130;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = exp2(_1104);
    float _1112 = fma(_1090, -2.0, _1106);
    if (_882)
    {
        _1048 = _872;
    }
    float _1114 = _1048;
    float _1116 = in.m_73.x;
    float _1118 = in.m_73.y;
    float _1120 = in.m_73.z;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1124 = 1.0 + _1122;
    int _1126 = _1044 ? 0 : 1;
    float _1128 = _1102 * (-2.0);
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    float _1132 = 1.0 / _1124;
    float _1134 = -_130;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[76].x, _904);
    float _1138 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _972);
    int _1140 = ~_1126;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1100 * _130;
    int _1148 = _1144;
    if (!_1032)
    {
        int _1150 = ~_1126;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1138);
    float _1158 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    bool _1160 = !_980;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = -_1110;
    float _1166 = _1164 + 1.0;
    float _1168 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1170 = ~_1022;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1158);
    int _1178 = _1174;
    if (!_952)
    {
        int _1180 = ~_1022;
        int _1182 = _1180 + 1;
        _1178 = _1182;
    }
    int _1184 = _1178;
    float _1186 = 1.0 / _1168;
    int _1188 = abs(_1162);
    float _1190 = _1082 + _1168;
    bool _1192 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1194 = isnan(1.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1200 = _1196 || _1198;
    float _1202 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1086);
    float _1204 = float(_1184);
    float _1206 = fma(_1128, _1116, _1116);
    float _1208 = float(_1188);
    float _1210 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1054);
    bool _1212 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1130);
    float _1224 = float(_1072);
    float _1226 = _1208 * _1204;
    float _1228 = _1220 ? _1166 : 0.0;
    float _1230 = _870 + (-0.5);
    bool _1232 = !_984;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1224 * _130;
    float _1238 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1112);
    float _1240 = _1190 * _1186;
    float _1242 = _1240 * 0.5;
    if (_1200)
    {
        float _1244 = _1228 * _1132;
        _140 = _1244;
    }
    float _1246 = _140;
    float _1248 = fma(_966, _1128, _966);
    float _1250 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    int _1252 = abs(_1234);
    float _1254 = _872 + _876;
    float _1256 = fma(_1248, _1246, _1250);
    float _1258 = float(_1154);
    float _1260 = _1254 + (-1.0);
    float _1262 = float(_1252);
    float _1264 = _1226 * (-2.0);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1270 = _870 + _876;
    float _1272 = _1262 * _1258;
    float _1274 = _872 + (-0.5);
    float _1276 = fma(_1264, _1118, _1118);
    float _1278 = fma(_1268, _1264, _1268);
    float _1280 = _1270 + (-1.0);
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1276);
    float _1284 = _1272 * (-2.0);
    float _1286 = _1266 * 6.283185482025146484375;
    float _1288 = sin(_1286);
    float _1290 = fma(_1278, _1246, _1282);
    float _1292 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1296 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1294);
    float _1298 = fma(_1284, _1120, _1120);
    float _1300 = _876 + (-0.5);
    float _1302 = _1290 * 0.15915493667125701904296875;
    float _1304 = fma(_1292, _1284, _1292);
    float _1306 = in.m_75.x;
    float _1308 = in.m_75.y;
    float _1310 = in.m_75.z;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1298);
    float _1314 = 1.0 / _1296;
    float _1316 = fma(_1304, _1246, _1312);
    float _1318 = _1316 * 0.15915493667125701904296875;
    float _1320 = _1302 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    float _1324 = _1302 * 6.283185482025146484375;
    float _1326 = cos(_1324);
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1330 = _1314 * _1328;
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1310);
    float _1336 = _1318 * 6.283185482025146484375;
    float _1338 = cos(_1336);
    bool _1340 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1342 = _1288 * _1322;
    float _1344 = _1334 * _884;
    float _1346 = _1266 * 6.283185482025146484375;
    float _1348 = cos(_1346);
    if (!_1332)
    {
        _914 = 1;
    }
    int _1350 = _914;
    float _1352 = _1318 * 6.283185482025146484375;
    float _1354 = sin(_1352);
    float _1356 = _1288 * _1326;
    float _1358 = _1288 * _1338;
    float _1360 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1362 = _1322 * _1338;
    float _1364 = _950 + _1360;
    float _1366 = _1348 * _1326;
    float _1368 = _1348 * _1322;
    bool _1370 = !_1332;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1308);
    float _1376 = _1348 * _1338;
    float _1378 = _1326 * _1338;
    int _1380 = _1350;
    if (!_1340)
    {
        _1380 = _1372;
    }
    int _1382 = _1380;
    float _1384 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1386 = fma(_1354, _1366, _1342);
    float _1388 = fma(_1354, _1342, _1366);
    float _1390 = -_1368;
    float _1392 = fma(_1354, _1356, _1390);
    float _1394 = -_1356;
    float _1396 = fma(_1354, _1368, _1394);
    float _1398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1400 = _888 * _1374;
    float _1402 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1384);
    float _1404 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1406 = _890 * _1398;
    float _1408 = _1376 * _1400;
    float _1410 = -_1400;
    float _1412 = _1354 * _1410;
    float _1414 = _1358 * _1400;
    float _1416 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1404);
    float _1418 = fma(_1386, _1406, _1408);
    float _1420 = fma(_1378, _1406, _1412);
    float _1422 = fma(_1392, _1406, _1414);
    float _1424 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1402);
    float _1426 = fma(_1396, _1344, _1418);
    float _1428 = fma(_1362, _1344, _1420);
    float _1430 = fma(_1388, _1344, _1422);
    float _1432 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1416);
    float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1438 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1440 = _1382 << 6;
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1434);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1436);
    float _1446 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1448 = trunc(_1438);
    int _1450 = int(_1448);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1442);
    float _1454 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    int _1456 = _1440 + 48;
    uint _1459 = uint(int(uint(_1456) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    float _1475 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1477 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1479 = trunc(_1446);
    int _1481 = int(_1479);
    float _1483 = _850 + _1475;
    float _1485 = _848 + _1477;
    int _1487 = _1440 + 56;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1507 = _1483 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1511 = _1485 + _1509;
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1515 = _1450 + _1513;
    int _1517 = _1515 + 1;
    float _1519 = _1507 * _1507;
    int _1521 = _1440 + 64;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    bool _1539 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1541 = fma(_1511, _1511, _1519);
    int _1543 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1545 = _1481 + _1543;
    int _1547 = _1545 + 1;
    float _1549 = sqrt(_1541);
    int _1551 = _1440 + 72;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    uint _1555 = uint(int(uint(int(_1553)) >> uint(2)));
    int _1557 = int(_1553) & 3;
    float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
    int _1561 = int(_1553) + 1;
    uint _1563 = uint(int(uint(_1561) >> uint(2)));
    int _1565 = _1561 & 3;
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
    int _1569 = _1517 | _1547;
    bool _1571 = _1569 < 0;
    bool _1573 = _1571 || _1539;
    float _1575 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1577 = _1440 + 96;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    bool _1595 = _1547 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1597 = _1595 || _1573;
    float _1599 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1575);
    bool _1601 = _1549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1599);
    int _1605 = _1440 + 104;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    float _1623 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1625 = as_type<int>(_1599);
    int _1627 = _1547;
    int _1629 = as_type<int>(_1623);
    float _1631 = _1426;
    float _1633 = _1485;
    float _1635 = as_type<float>(_1440);
    if (!_1597)
    {
        int _1637 = _1547 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1639 = _1637 + _1517;
        _1625 = _1639;
    }
    int _1641 = _1625;
    float _1643 = _950 + _1623;
    float _1645 = _1643;
    if (!_1597)
    {
        int _1647 = _1641 << 2;
        _1627 = _1647;
    }
    int _1649 = _1627;
    int _1651 = _1649;
    if (!_1597)
    {
        uint _1653 = uint(int(uint(_1641) >> uint(2)));
        _1629 = int(_1653);
    }
    int _1655 = _1629;
    float _1657 = as_type<float>(_1655);
    if (!_1597)
    {
        int _1659 = 12 & _1649;
        _1651 = _1659;
    }
    int _1661 = _1651;
    if (!_1601)
    {
        _1631 = _1483;
    }
    float _1663 = _1631;
    bool _1665 = !_1601;
    float _1667 = _1663;
    float _1669 = _1559;
    if (!_1665)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1675 = _1549 + _1673;
        float _1677 = rsqrt(_1541);
        float _1679 = _1675 * _1671;
        float _1681 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1683 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1687 + (-1.0);
        float _1695 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1697 = fma(_1691, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1699 = fma(_1643, _1687, _1695);
        float _1701 = _1677 * _1697;
        float _1703 = fma(_1511, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1705 = fma(_1507, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1645 = _1699;
        _1633 = _1703;
        _1667 = _1705;
    }
    float _1707 = _1645;
    float _1709 = _1633;
    float _1711 = _1667;
    float _1713 = _1711;
    if (!_1597)
    {
        int _1715 = _1655 << 4;
        int _1717 = _1715 + _1661;
        _1657 = as_type<float>(_1717);
    }
    float _1719 = _1657;
    float _1721 = -_950;
    float _1723 = _1721 + _1707;
    int _1725 = _1440 + 80;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    float _1743 = -_848;
    float _1745 = _1743 + _1709;
    float _1747 = -_850;
    float _1749 = _1747 + _1711;
    float _1751 = _1723 * _1723;
    float _1753 = _1364 * _1593;
    float _1755 = _1364 * _1537;
    float _1757 = fma(_1745, _1745, _1751);
    int _1759 = _1440 + 88;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    uint _1763 = uint(int(uint(int(_1761)) >> uint(2)));
    int _1765 = int(_1761) & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    int _1769 = int(_1761) + 1;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    int _1773 = _1769 & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    float _1777 = fma(_848, _1585, _1753);
    float _1779 = _1751;
    if (!_1597)
    {
        float _1781 = floor(_1438);
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1749, _1749, _1757);
    float _1787 = fma(_850, _1613, _1777);
    float _1789 = _1364 * _1473;
    float _1791 = fma(_848, _1529, _1755);
    float _1793 = _1719;
    float _1795 = _1791;
    float _1797 = _1785;
    float _1799 = _1783;
    if (!_1597)
    {
        int _1801 = as_type<int>(_1719) + 400;
        uint _1803 = uint(int(uint(_1801) >> uint(2)));
        uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
        int _1807 = int(_1803) & 3;
        float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
        _1793 = _1809;
    }
    float _1811 = _1793;
    float _1813 = _1787 + _1621;
    float _1815 = sqrt(_1785);
    float _1817 = fma(_848, _1465, _1789);
    float _1819 = fma(_850, _1559, _1791);
    float _1821 = fma(_850, _1495, _1817);
    float _1823 = _1819 + _1567;
    float _1825 = _1777;
    float _1827 = _1817;
    if (!_1597)
    {
        float _1829 = floor(_1446);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = _1821 + _1503;
    bool _1835 = _1815 > 0.0;
    float _1837 = 1.0 / _1813;
    if (!_1835)
    {
        _1827 = _1709;
    }
    float _1839 = _1827;
    float _1841 = _1839;
    if (!_1835)
    {
        _1795 = _1707;
    }
    float _1843 = _1795;
    bool _1845 = !_1835;
    float _1847 = _1843;
    float _1849 = _1843;
    float _1851 = _1811;
    if (!_1845)
    {
        float _1853 = _202 * _202;
        float _1855 = rsqrt(_1785);
        float _1857 = fma(_200, _200, _1853);
        float _1859 = fma(_204, _204, _1857);
        float _1861 = sqrt(_1859);
        float _1863 = _1745 * _1855;
        float _1865 = _1723 * _1855;
        float _1867 = _1749 * _1855;
        bool _1869 = _1861 > 0.0;
        float _1871 = _1861;
        _1797 = _1855;
        if (!_1869)
        {
            _1871 = _1709;
        }
        float _1873 = _1871;
        _1841 = _1873;
        if (!_1869)
        {
            _1847 = _1707;
        }
        float _1875 = _1847;
        bool _1877 = !_1869;
        _1849 = _1875;
        if (!_1877)
        {
            float _1879 = rsqrt(_1859);
            float _1881 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1883 = _202 * _1879;
            float _1885 = _200 * _1879;
            float _1887 = _204 * _1879;
            float _1889 = _1865 * _1883;
            float _1891 = fma(_1863, _1885, _1889);
            float _1893 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1895 = fma(_1867, _1887, _1891);
            float _1897 = _1895 * _1893;
            float _1899 = fma(_200, _1897, _1709);
            float _1901 = fma(_202, _1897, _1707);
            float _1903 = fma(_204, _1897, _1711);
            _1849 = _1901;
            _1841 = _1899;
            _1713 = _1903;
            _1669 = _1889;
        }
    }
    float _1905 = _1849;
    float _1907 = _1841;
    float _1909 = _1713;
    float _1911 = _1669;
    float _1913 = _1797;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = _1833 * _1837;
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1915);
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1917);
    float _1927 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1919);
    float _1929 = _1823 * _1837;
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1923);
    bool _1933 = _1921 >= 0.0;
    float _1935 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1925);
    float _1937 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1939 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1943 = _1921 <= 1.0;
    bool _1945 = _1943 && _1933;
    float _1947 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1937);
    float _1949 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1953 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1955 = _1929 >= 0.0;
    bool _1957 = _1955 && _1945;
    float _1959 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1947);
    float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1967 = _1929 <= 1.0;
    bool _1969 = _1967 && _1957;
    float _1971 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1973 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1961);
    float _1975 = -_1965;
    float _1977 = fma(_1975, _1963, 1.0);
    float _1979 = _1364 * _1741;
    float _1981 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    float _1985 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1987 = _1911;
    float _1989 = _1913;
    if (!_1597)
    {
        float _1991 = rint(_1811);
        float _1993 = precise::max(_1991, 0.0);
        uint _1995 = uint(_1993);
        uint _1997 = clamp(_1995, 0u, 65535u);
        _1987 = as_type<float>(_1997);
    }
    float _1999 = _1987;
    float _2001 = fma(_848, _1733, _1979);
    float _2003 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1981);
    float _2005 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1985);
    float _2007 = _2003;
    float _2009 = _1999;
    if (!_1597)
    {
        float _2011 = -_1831;
        float _2013 = _1446 + _2011;
        _1989 = _2013;
    }
    float _2015 = _1989;
    float _2017 = fma(_850, _1767, _2001);
    float _2019 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2021 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2023 = log2(_1977);
    if (_1969)
    {
        float _2025 = float(_1382);
        _1851 = _2025;
    }
    float _2027 = _1851;
    float _2029 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2019);
    float _2031 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2021);
    float _2033 = _2017 + _1775;
    if (!_1597)
    {
        float _2035 = -_1783;
        float _2037 = _1438 + _2035;
        _2007 = _2037;
    }
    float _2039 = _2007;
    float _2041 = 1.0 / _1983;
    float _2043 = _2033 * _1837;
    float _2045 = _1985;
    if (_1969)
    {
        float _2047 = rint(_2027);
        float _2049 = precise::max(_2047, 0.0);
        uint _2051 = uint(_2049);
        uint _2053 = clamp(_2051, 0u, 65535u);
        _2045 = as_type<float>(_2053);
    }
    float _2055 = _2045;
    float _2057 = _2023 * 0.693147182464599609375;
    float _2059 = _2031 * _2041;
    float _2061 = _2029 * _2041;
    float _2063 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2065 = fma(_2059, 0.5, 0.5);
    float _2067 = fma(_2061, -0.5, 0.5);
    float _2069 = _2033;
    float _2071 = _2061;
    float _2073 = _2063;
    if (!_1597)
    {
        float3 _7147 = float3(_2039, _2015, float(as_type<int>(_1999)));
        float3 _7151 = select(_7147, float3(0.0), isnan(_7147));
        float _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7151.xy, uint(rint(_7151.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7151.xy, uint(rint(_7151.z)), level(0.0)).x;
        _2069 = _2075;
    }
    float _2077 = _2069;
    float _2079 = _1929;
    if (_1969)
    {
        float3 _7166 = float3(_1921, _1929, float(as_type<int>(_2055)));
        float3 _7168 = select(_7166, float3(0.0), isnan(_7166));
        float _2081 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7168.xy, uint(rint(_7168.z)), _2043, level(0.0));
        _2079 = _2081;
    }
    float _2083 = _2079;
    float3 _7178 = float3(_2065, _2067, _2063);
    float _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7178, float3(0.0), isnan(_7178)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7178, float3(0.0), isnan(_7178)), level(0.0)).x;
    float3 _7187 = float3(_2065, _2067, _2063);
    float4 _2088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7187, float3(0.0), isnan(_7187)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7187, float3(0.0), isnan(_7187)), level(0.0)).xyzw;
    float _2090 = _2088.x;
    float _2092 = _2088.y;
    float _2094 = _2088.z;
    float _2096 = _2088.w;
    float _2098 = in.m_77.x;
    bool _2100 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2108 = _2104 || _2106;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2112 = _2110 != 0;
    if (_1597)
    {
        _2009 = 1.0;
    }
    float _2114 = _2009;
    float _2116 = _2114;
    if (_2108)
    {
        _1799 = 1.0;
    }
    float _2118 = _1799;
    float _2120 = _2118;
    if (!_2112)
    {
        _2071 = _2098;
    }
    float _2122 = _2071;
    float _2124 = _2122;
    if (!_2108)
    {
        float _2126 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2128 = _2126 * 0.15915493667125701904296875;
        float _2130 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2134 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2132;
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = cos(_2136);
        float _2140 = _2130 * 0.15915493667125701904296875;
        float _2142 = _2128 * 6.283185482025146484375;
        float _2144 = sin(_2142);
        float _2146 = 1.0 / _2138;
        float _2148 = _2140 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = _2144 * _2146;
        float _2154 = _2140 * 6.283185482025146484375;
        float _2156 = sin(_2154);
        float _2158 = _2150 * _2152;
        float _2160 = 1.0 / _2134;
        float _2162 = 1.0 / _2158;
        float _2164 = _2156 * _2162;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = fma(_1330, _2164, _2166);
        float _2170 = _2168 * _2160;
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        _2073 = _2128;
        _2120 = _2172;
    }
    float _2174 = _2073;
    float _2176 = _2120;
    float _2178 = _2174;
    if (!_1597)
    {
        int _2180 = _1641 << 4;
        int _2182 = _2180 + 2048;
        uint _2184 = uint(int(uint(_2182) >> uint(2)));
        uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
        int _2188 = int(_2184) & 3;
        float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
        int _2192 = int(_2184) + 1;
        uint _2194 = uint(int(uint(_2192) >> uint(2)));
        int _2196 = _2192 & 3;
        float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
        int _2200 = _2182 + 8;
        uint _2202 = uint(int(uint(_2200) >> uint(2)));
        uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
        int _2206 = int(_2202) & 3;
        float _2208 = (*spvDescriptorSet0.vp_c15)._m0[int(_2204)][_2206];
        int _2210 = int(_2202) + 1;
        uint _2212 = uint(int(uint(_2210) >> uint(2)));
        int _2214 = _2210 & 3;
        float _2216 = (*spvDescriptorSet0.vp_c15)._m0[int(_2212)][_2214];
        float _2218 = _1364 * _2198;
        float _2220 = fma(_848, _2190, _2218);
        float _2222 = fma(_850, _2208, _2220);
        float _2224 = _2222 + _2216;
        float _2226 = precise::clamp(_2224, 0.0, 1.0);
        float _2228 = -_2226;
        float _2230 = _2228 + _2077;
        float _2232 = fma(_2230, 500.0, 1.5);
        float _2234 = exp2(_2232);
        float _2236 = 0.0 + _2234;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        _2116 = _2238;
    }
    float _2240 = _2116;
    float _2242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2244 = _1905 + _2242;
    float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2248 = _1907 + _2246;
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2252 = _1909 + _2250;
    float _2254 = trunc(_1146);
    int _2256 = int(_2254);
    float _2258 = _2244 * _2244;
    float _2260 = fma(_2248, _2248, _2258);
    float _2262 = fma(_2252, _2252, _2260);
    float _2264 = rsqrt(_2262);
    float _2266 = sqrt(_2262);
    float _2268 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2270 = _2248 * _2268;
    float _2272 = _2252 * _2268;
    float _2274 = _2270 * _2270;
    float _2276 = _2272 * _2272;
    float _2278 = _2274 + _2276;
    float _2280 = sqrt(_2278);
    bool _2282 = _2280 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2286 = _2280 + _2284;
    float _2288 = _2252;
    float _2290 = _2278;
    float _2292 = _2286;
    float _2294 = _2268;
    float _2296 = _2270;
    float _2298 = _2274;
    float _2300 = _2276;
    if (_2282)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2288 = _2302;
    }
    float _2304 = _2288;
    if (_2282)
    {
        float _2306 = rsqrt(_2278);
        _2290 = _2306;
    }
    float _2308 = _2290;
    if (_2282)
    {
        float _2310 = _2286 * _2304;
        _2292 = _2310;
    }
    float _2312 = _2292;
    if (_2282)
    {
        float _2314 = _2312 * 0.15915493667125701904296875;
        _2178 = _2314;
    }
    float _2316 = _2178;
    float _2318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2320 = _2077;
    float _2322 = _2318;
    if (_2282)
    {
        float _2324 = _2316 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        _2320 = _2326;
    }
    float _2328 = _2320;
    float _2330 = precise::max(0.0, _2318);
    float _2332 = _2312;
    if (_2282)
    {
        float _2334 = _2316 * 6.283185482025146484375;
        float _2336 = cos(_2334);
        _2332 = _2336;
    }
    float _2338 = _2332;
    float _2340 = -_2268;
    float _2342 = -_2330;
    float _2344 = fma(_2244, _2340, _2342);
    float _2346 = _2344;
    if (_2282)
    {
        float _2348 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2348;
    }
    float _2350 = _2294;
    float _2352 = _2350;
    float _2354 = _2328;
    if (_2282)
    {
        float _2356 = fma(_2328, _2350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2352 = _2356;
    }
    float _2358 = _2352;
    int _2360 = ~_1072;
    int _2362 = _2360 + 1;
    if (_2282)
    {
        float _2364 = _2308 * _2358;
        _1635 = _2364;
    }
    float _2366 = _1635;
    float _2368 = float(uint(_1072));
    int _2370 = as_type<int>(_2366);
    if (_2282)
    {
        float _2372 = _2338 + (-1.0);
        _2322 = _2372;
    }
    float _2374 = _2322;
    float _2376 = _2374;
    if (_2282)
    {
        float _2378 = _2270 * _2366;
        _2296 = _2378;
    }
    float _2380 = _2296;
    if (_2282)
    {
        float _2382 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2382;
    }
    float _2384 = _2354;
    if (!_2282)
    {
        _2376 = _2272;
    }
    float _2386 = _2376;
    float _2388 = _2386;
    if (_2282)
    {
        float _2390 = _2272 * _2366;
        _2388 = _2390;
    }
    float _2392 = _2388;
    if (_2282)
    {
        float _2394 = _2380 * _2380;
        _2298 = _2394;
    }
    float _2396 = _2298;
    if (_2282)
    {
        float _2398 = fma(_2344, _2338, _2384);
        _2346 = _2398;
    }
    float _2400 = _2346;
    float _2402 = 1.0 / _2368;
    if (_2282)
    {
        float _2404 = _2392 * _2392;
        _2300 = _2404;
    }
    float _2406 = _2300;
    float _2408 = fma(_2400, _2400, _2396);
    float _2410 = _2408 + _2406;
    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2414 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2412);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = float(uint(_2256));
    float _2420 = rsqrt(_2410);
    float _2422 = -_2416;
    float _2424 = _2422 + 1.0;
    int _2426 = as_type<int>(_2402) + (-2);
    float _2428 = abs(_2424);
    float _2430 = log2(_2428);
    float _2432 = as_type<float>(_2426) * _2418;
    float _2434 = _2420 * _2380;
    float _2436 = _2420 * _2400;
    float _2438 = _2420 * _2392;
    float _2440 = trunc(_2432);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    float _2446 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2448 = _2392;
    if (_2112)
    {
        float _2450 = in.m_67.x;
        _2448 = _2450;
    }
    float _2452 = _2448;
    float _2454 = -_2446;
    float _2456 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2454);
    float _2458 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2460 = -_2438;
    float _2462 = fma(_2460, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2456);
    float _2464 = exp2(_2458);
    float _2466 = fma(_2462, -0.5, 0.5);
    float _2468 = fma(_2462, 0.5, 0.5);
    int _2470 = _2362 * int(_2444);
    int _2472 = _2470 + _2256;
    float _2474 = fma(_2468, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2476 = sqrt(_2466);
    float _2478 = float(uint(_2472));
    float _2480 = _2436 + 1.0;
    float _2482 = fma(_2468, _2474, -0.212114393711090087890625);
    float _2484 = as_type<float>(_2426) * _2478;
    float _2486 = -_2436;
    float _2488 = fma(_2464, _2480, _2486);
    float _2490 = fma(_2468, _2482, 1.570728778839111328125);
    float _2492 = in.m_77.y;
    float _2494 = fma(_2488, 0.5, 0.5);
    float _2496 = trunc(_2484);
    float _2498 = precise::max(_2496, 0.0);
    uint _2500 = uint(_2498);
    float _2502 = _2476 * 0.636619746685028076171875;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2508 = -_2490;
    float _2510 = fma(_2502, _2508, 1.0);
    float2 _7815 = float2(_2510, _2494);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7815, float2(0.0), isnan(_7815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7815, float2(0.0), isnan(_7815)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    if (_2112)
    {
        float _2522 = -_2098;
        float _2524 = _2522 + 1.0;
        _2370 = as_type<int>(_2524);
    }
    int _2526 = _2370;
    if (_2112)
    {
        bool _2528 = _2452 > 0.5;
        _1004 = _2528;
    }
    bool _2530 = _1004;
    float _2532 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2534 = _878 > 0.5;
    float _2536 = 1.0 / _2506;
    if (_2112)
    {
        float _2538 = _2530 ? as_type<float>(_2526) : _2098;
        _2124 = _2538;
    }
    float _2540 = _2124;
    float _2542 = _890 * _2098;
    int _2544 = int(_2444) + int(_2500);
    float _2546 = _888 * _2492;
    int _2548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2550 = _2548 != 0;
    float _2552 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2554 = -_2546;
    float _2556 = _2554 + 1.0;
    int _2558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2560 = _2558 != 0;
    float _2562 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2552);
    int _2564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2566 = _2564 != 0;
    float _2568 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2570 = ~_1072;
    int _2572 = _2570 + 1;
    float _2574 = -_868;
    float _2576 = _2574 + 1.0;
    bool _2578 = !_882;
    float _2580 = _2578 ? 7.345489978790283203125 : 1.0;
    out.m_79.x = _1907;
    out.m_79.y = _1905;
    out.m_79.z = _1909;
    int _2582 = _2572 * _2544;
    int _2584 = _2582 + _2256;
    bool _2586 = _876 > 0.5;
    float _2588 = _2580 * _870;
    float _2590 = _2546;
    float _2592 = _2542;
    if (_2550)
    {
        float _2594 = _2534 ? _2556 : _2546;
        _2590 = _2594;
    }
    float _2596 = _2590;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2602 = float(_2256);
    float _2604 = floor(_2588);
    bool _2606 = uint(_2584) >= uint(_1072);
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2610 = _2608 != 0;
    bool _2612 = _2602 >= _1224;
    bool _2614 = isnan(_2602);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(_1224);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = 1.0 / _2600;
    bool _2626 = !_2606;
    int _2628 = _2626 ? 0 : (-1);
    bool _2630 = !_2610;
    int _2632 = _2630 ? 0 : 1;
    bool _2634 = !_2560;
    int _2636 = _2634 ? 0 : 1;
    bool _2638 = _872 > 0.5;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2640;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2646 = _2644 != 0;
    float _2648 = -_2604;
    float _2650 = _2588 + _2648;
    int _2652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2654 = _2652 != 0;
    float _2656 = _2642 * _2536;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2660 = _2658 != 0;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2666 = -_2492;
    float _2668 = _2666 + 1.0;
    float _2670 = trunc(_2622);
    int _2672 = int(_2670);
    int _2674 = ~_2544;
    int _2676 = _2674 + _2628;
    int _2678 = _2676 + 1;
    float _2680 = _1236 * _182;
    float _2682 = _1224 * _2650;
    int _2684 = _2638 ? as_type<int>(_2668) : as_type<int>(_2492);
    int _2686 = _1072 * _2678;
    int _2688 = _2686 + _2256;
    bool _2690 = _1072 == 0;
    float _2692 = _2664 * _2624;
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2694;
    float _2698 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    bool _2702 = !_2690;
    int _2704 = _2702 ? _2688 : (-1);
    float _2706 = trunc(_2682);
    int _2708 = int(_2706);
    float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2712 = _828 + _2710;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2718 = ~_2672;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    float _2724 = fma(_2656, _2712, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2726 = _1072 + (-1);
    float _2728 = trunc(_2680);
    int _2730 = int(_2728);
    int _2732 = abs(_940);
    int _2734 = _2722 * _2704;
    int _2736 = abs(_2632);
    float _2738 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _2742 = abs(_946);
    int _2744 = _2672 * _2726;
    int _2746 = _2744 + _2734;
    float _2748 = 1.0 / _2716;
    int _2750 = _2708 * _2736;
    int _2752 = _2750 + _2256;
    bool _2754 = !_2566;
    int _2756 = _2754 ? 0 : 1;
    int _2758 = _2746 * _2732;
    int _2760 = abs(_2636);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2764 = _828 + _2762;
    int _2766 = abs(_2756);
    float _2768 = 1.0 / _2740;
    int _2770 = _2730 * _2742;
    int _2772 = _2770 + _2758;
    bool _2774 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2776 = isnan(_828);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2782 = _2778 || _2780;
    float _2784 = float(_2782);
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2788 = _828 + _2786;
    bool _2790 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2792 = isnan(_828);
    bool _2794 = _2790 || _2792;
    bool _2796 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2798 = _2794 || _2796;
    float _2800 = float(_2798);
    int _2802 = _2752 * _2760;
    int _2804 = _2802 + _2772;
    float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2808 = _828 + _2806;
    float _2810 = fma(_2692, _2788, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2812 = _2696 * _2748;
    int _2814 = _2708 * _2766;
    int _2816 = _2814 + _2804;
    bool _2818 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2820 = isnan(_828);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = -_2784;
    float _2832 = _2830 + 1.0;
    float _2834 = fma(_2812, _2764, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2836 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2838 = isnan(_828);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2844 = _2840 || _2842;
    float _2846 = float(_2844);
    float _2848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2850 = float(uint(_2816));
    float _2852 = _2700 * _2768;
    float _2854 = _2654 ? as_type<float>(_2684) : _2492;
    float _2856 = -_2828;
    float _2858 = _2856 + 1.0;
    bool _2860 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2862 = isnan(_828);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2868 = _2864 || _2866;
    float _2870 = float(_2868);
    float _2872 = as_type<float>(_2426) * _2850;
    float _2874 = -_2800;
    float _2876 = _2874 + 1.0;
    float _2878 = _2828 * _2832;
    bool _2880 = _1308 != 0.0;
    bool _2882 = isnan(_1308);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = _2870 * _2858;
    float _2892 = -_2870;
    float _2894 = _2892 + 1.0;
    float _2896 = in.m_81.x;
    float _2898 = in.m_81.y;
    float _2900 = in.m_81.z;
    float _2902 = trunc(_2872);
    float _2904 = precise::max(_2902, 0.0);
    uint _2906 = uint(_2904);
    bool _2908 = _1306 == 0.0;
    bool _2910 = !_2888;
    bool _2912 = _2908 && _2910;
    float _2914 = _2800 * _2894;
    int _2916 = ~_1072;
    int _2918 = _2916 + 1;
    float _2920 = _2846 * _2876;
    bool _2922 = _1310 == 0.0;
    bool _2924 = _2922 && _2912;
    float _2926 = fma(_2852, _2808, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _2928 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2930 = _2724 * _2920;
    float _2932 = -_2846;
    float _2934 = _2932 + 1.0;
    float _2936 = _2848 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2938 = -_1008;
    float _2940 = fma(_1202, _2928, _2938);
    float _2942 = -_2542;
    float _2944 = _2942 + 1.0;
    float _2946 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2930);
    float _2948 = fma(_2936, _2596, -0.5);
    int _2950 = _2918 * int(_2906);
    int _2952 = _2950 + _2816;
    float _2954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2956 = fma(_2810, _2914, _2946);
    float _2958 = -_1238;
    float _2960 = fma(_1222, _2948, _2958);
    int _2962 = ~_1072;
    int _2964 = _2962 + 1;
    float _2966 = float(uint(_2952));
    float _2968 = fma(_2834, _2890, _2956);
    float _2970 = in.m_83.x;
    float _2972 = in.m_83.y;
    float _2974 = in.m_83.z;
    float _2976 = in.m_83.w;
    float _2978 = as_type<float>(_2918);
    float _2980 = _2622;
    float _2982 = _2966;
    if (_2924)
    {
        _2978 = _2896;
    }
    float _2984 = _2978;
    float _2986 = abs(_1330);
    float _2988 = log2(_2986);
    float _2990 = as_type<float>(_2426) * _2966;
    float _2992 = _2984;
    if (_2924)
    {
        _2980 = _2898;
    }
    float _2994 = _2980;
    float _2996 = fma(_2926, _2878, _2968);
    float _2998 = _2994;
    if (_2924)
    {
        _1050 = _2984;
    }
    float _3000 = _1050;
    float _3002 = _3000;
    if (!_2924)
    {
        _2992 = _2896;
    }
    float _3004 = _2992;
    float _3006 = fma(_2784, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2996);
    float _3008 = trunc(_2990);
    float _3010 = precise::max(_3008, 0.0);
    uint _3012 = uint(_3010);
    float _3014 = float(uint(_2752));
    float _3016 = _3014;
    if (_2924)
    {
        _2982 = _2994;
    }
    float _3018 = _2982;
    float _3020 = _3018;
    if (!_2924)
    {
        float _3022 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3004);
        _3002 = _3022;
    }
    float _3024 = _3002;
    if (!_2924)
    {
        _2998 = _2898;
    }
    float _3026 = _2998;
    float _3028 = as_type<float>(_2426) * _3014;
    if (_2924)
    {
        _3016 = _2900;
    }
    float _3030 = _3016;
    float _3032 = _3030;
    if (!_2924)
    {
        float _3034 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2900);
        _3032 = _3034;
    }
    float _3036 = _3032;
    if (_2646)
    {
        float _3038 = _2586 ? _2944 : _2542;
        _2592 = _3038;
    }
    float _3040 = _2592;
    float _3042 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2924)
    {
        float _3044 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3026);
        _3020 = _3044;
    }
    float _3046 = _3020;
    float _3048 = trunc(_3028);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    float _3054 = fma(_2540, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3056 = fma(_3042, _3040, -0.5);
    float _3058 = _2970 * _3026;
    int _3060 = int(_2906) + int(_3012);
    float _3062 = fma(_1176, _3054, _1136);
    int _3064 = ~_1072;
    int _3066 = _3064 + 1;
    float _3068 = -_3058;
    float _3070 = fma(_2972, _3004, _3068);
    float _3072 = fma(_1210, _3056, _1096);
    int _3074 = _2964 * _3060;
    int _3076 = _3074 + _2816;
    float _3078 = _2988 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3080 = _2974 * _3004;
    float _3082 = _2960 + 0.5;
    float _3084 = _3062 + 0.5;
    bool _3086 = uint(_3076) >= uint(_1072);
    float _3088 = -_3080;
    float _3090 = fma(_2970, _2900, _3088);
    int _3092 = _3066 * int(_3052);
    int _3094 = _3092 + _2752;
    float _3096 = _2972 * _2900;
    bool _3098 = !_3086;
    int _3100 = _3098 ? 0 : (-1);
    float _3102 = exp2(_3078);
    float _3104 = _3072 + 0.5;
    float _3106 = float(uint(_3094));
    float _3108 = _2940 + 0.5;
    int _3110 = ~_3060;
    int _3112 = _3110 + _3100;
    int _3114 = _3112 + 1;
    float _3116 = _3006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3118 = -_3096;
    float _3120 = fma(_2974, _3026, _3118);
    float _3122 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3124 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3126 = _1072 * _3114;
    int _3128 = _3126 + _2816;
    float _3130 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3132 = _3090 * _2976;
    float _3134 = _3120 * _2976;
    out.m_85.x = _3084;
    out.m_85.y = _3108;
    out.m_85.z = _3104;
    out.m_85.w = _3082;
    bool _3136 = !_2690;
    int _3138 = _3136 ? _3128 : (-1);
    float _3140 = -_1354;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3122);
    float _3144 = -_1354;
    float _3146 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3124);
    out.m_87.w = _3116;
    float _3148 = as_type<float>(_2426) * _3106;
    float _3150 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3152 = _3070 * _2976;
    int _3154 = ~_1072;
    int _3156 = _3154 + 1;
    float _3158 = exp2(_2568);
    float _3160 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3150);
    float _3162 = -_1354;
    float _3164 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3130);
    int _3166 = _3138 >> 31;
    float _3168 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3170 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3172 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3174 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3176 = precise::clamp(_3174, 0.0, 1.0);
    float _3178 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3168);
    int _3180 = _3166 & 3;
    float _3182 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3172);
    float _3184 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3170);
    float _3186 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3142);
    int _3188 = _3138 + _3180;
    float _3190 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3146);
    float _3192 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3164);
    float _3194 = trunc(_3148);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    int _3200 = _3188 >> 2;
    float _3202 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3204 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3206 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3178);
    int _3208 = _3200 << 4;
    int _3210 = _3208 + 368;
    float _3212 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3202);
    float _3214 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3204);
    float _3216 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3184);
    uint _3218 = uint(int(uint(_3210) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    float _3234 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3182);
    int _3236 = _3138 & 3;
    bool _3238 = _3236 != 0;
    float _3240 = _3186 * _2972;
    int _3242 = _3138 & 3;
    float _3244 = _3190 * _2972;
    float _3246 = _3192 * _2972;
    int _3248 = int(_3052) + int(_3198);
    int _3250 = _3210 + 8;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    uint _3254 = uint(int(uint(int(_3252)) >> uint(2)));
    int _3256 = int(_3252) & 3;
    float _3258 = (*spvDescriptorSet0.vp_c9)._m0[int(_3254)][_3256];
    int _3260 = int(_3252) + 1;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    int _3264 = _3260 & 3;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[int(_3262)][_3264];
    bool _3268 = uint(_3242) > 1u;
    float _3270 = _3186 * _3046;
    float _3272 = _3132 * _3186;
    int _3274 = _3156 * _3248;
    int _3276 = _3274 + _2752;
    float _3278 = _3190 * _3046;
    float _3280 = _3132 * _3190;
    int _3282 = _3238 ? 0 : 1;
    float _3284 = fma(_3206, _3024, _3270);
    bool _3286 = uint(_3276) >= uint(_1072);
    float _3288 = _3192 * _3046;
    int _3290 = ~_3282;
    int _3292 = _3290 + 1;
    int _3294 = _3292 + 1;
    float _3296 = fma(_3216, _2970, _3244);
    bool _3298 = !_3286;
    int _3300 = _3298 ? 0 : (-1);
    float _3302 = fma(_3234, _2970, _3246);
    bool _3304 = _3242 != 3;
    float _3306 = _3132 * _3192;
    int _3308 = _3294;
    if (!_3268)
    {
        int _3310 = ~_3282;
        int _3312 = _3310 + 1;
        _3308 = _3312;
    }
    int _3314 = _3308;
    float _3316 = fma(_3216, _3024, _3278);
    bool _3318 = uint(_3242) >= 2u;
    float _3320 = fma(_3206, _2970, _3240);
    int _3322 = ~_3248;
    int _3324 = _3322 + _3300;
    int _3326 = _3324 + 1;
    float _3328 = fma(_3234, _3024, _3288);
    int _3330 = _3318 ? 0 : 1;
    float _3332 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3212);
    int _3334 = abs(_3314);
    float _3336 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3214);
    bool _3338 = !_3238;
    int _3340 = _3338 ? 0 : 1;
    float _3342 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3160);
    int _3344 = ~_3330;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    float _3350 = fma(_3134, _3206, _3272);
    bool _3352 = _3242 != 3;
    int _3354 = _1072 * _3326;
    int _3356 = _3354 + _2752;
    int _3358 = _3348;
    float _3360 = _3336;
    if (_3304)
    {
        int _3362 = ~_3330;
        int _3364 = _3362 + 1;
        _3358 = _3364;
    }
    int _3366 = _3358;
    float _3368 = fma(_3134, _3234, _3306);
    int _3370 = abs(_3340);
    int _3372 = abs(_3366);
    bool _3374 = !_3352;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = ~_3334;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    bool _3384 = !_2660;
    int _3386 = _3384 ? 0 : 1;
    int _3388 = abs(_3376);
    int _3390 = _3382 * as_type<int>(_3232);
    int _3392 = ~_3370;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    int _3398 = abs(_3386);
    int _3400 = _3396 * as_type<int>(_3224);
    int _3402 = _3400 + _3390;
    int _3404 = ~_3372;
    int _3406 = _3404 + 1;
    int _3408 = _3406 + 1;
    float _3410 = fma(_3332, _2974, _3320);
    int _3412 = ~_3388;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    int _3418 = _3408 * as_type<int>(_3258);
    int _3420 = _3418 + _3402;
    int _3422 = ~_3398;
    int _3424 = _3422 + 1;
    int _3426 = _3424 + 1;
    float _3428 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2562);
    float _3430 = fma(_3134, _3216, _3280);
    int _3432 = _3416 * as_type<int>(_3266);
    int _3434 = _3432 + _3420;
    float _3436 = _3428 + _1983;
    bool _3438 = _1330 <= 8000.0;
    bool _3440 = isnan(_1330);
    bool _3442 = _3438 || _3440;
    bool _3444 = isnan(8000.0);
    bool _3446 = _3442 || _3444;
    float _3448 = float(_3446);
    int _3450 = _3426 * _3434;
    bool _3452 = !_2690;
    int _3454 = _3452 ? _3356 : (-1);
    float _3456 = fma(_3336, _2974, _3296);
    float _3458 = fma(_3342, _2974, _3302);
    int _3460 = _3454 * _3398;
    int _3462 = _3460 + _3450;
    float _3464 = fma(_3152, _3332, _3350);
    float _3466 = fma(_3152, _3342, _3368);
    float _3468 = _3436 * 0.5;
    float _3470 = fma(_3336, _3036, _3316);
    float _3472 = fma(_3342, _3036, _3328);
    float _3474 = fma(_3176, -2.0, 3.0);
    float _3476 = _3176 * _3176;
    float _3478 = fma(_3152, _3336, _3430);
    float _3480 = float(_3462);
    float _3482 = fma(_3332, _3036, _3284);
    float _3484 = _3476 * _3474;
    out.m_89.x = _3464;
    out.m_89.y = _3478;
    out.m_89.z = _3466;
    out.m_91.x = _3410;
    out.m_91.y = _3456;
    out.m_91.z = _3458;
    out.gl_Position.x = _2031;
    out.gl_Position.y = _2029;
    out.gl_Position.z = _3428;
    out.gl_Position.w = _1983;
    float _3486 = -_3484;
    float _3488 = _3486 + 1.0;
    float _3490 = _3478;
    if (!_1969)
    {
        _3490 = 1.0;
    }
    float _3492 = _3490;
    out.m_93.z = _3468;
    out.m_93.w = _1983;
    float _3494 = _3492;
    if (_1969)
    {
        bool _3496 = _2083 >= _2043;
        bool _3498 = isnan(_2083);
        bool _3500 = _3496 || _3498;
        bool _3502 = isnan(_2043);
        bool _3504 = _3500 || _3502;
        float _3506 = float(_3504);
        _3494 = _3506;
    }
    float _3508 = _3494;
    float _3510 = fma(_3488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3484);
    float _3512 = -_3158;
    float _3514 = _3512 + 1.0;
    out.m_95.x = _3480;
    bool _3516 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3518 = isnan(_2266);
    bool _3520 = _3516 || _3518;
    bool _3522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3524 = _3520 || _3522;
    float _3526 = _3448 * _3510;
    float _3528 = _3514 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_97.x = _3482;
    out.m_97.y = _3470;
    out.m_97.z = _3472;
    float _3530 = _3508 * _2240;
    float _3532 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3534 = _3528 * _2085;
    float _3536 = -_3528;
    float _3538 = _3536 + 1.0;
    float _3540 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3542 = _2576 * _3532;
    float _3544 = precise::clamp(_3542, 0.0, 1.0);
    float _3546 = _2096 * _3534;
    float _3548 = _2520 * _3534;
    float _3550 = _2096 * _3538;
    float _3552 = -_3544;
    float _3554 = fma(_3552, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3556 = fma(_2516, _3546, _2090);
    float _3558 = fma(_2518, _3546, _2092);
    float _3560 = fma(_2096, _3548, _2094);
    float _3562 = -_3530;
    float _3564 = fma(_3562, _3554, 1.0);
    float _3566 = precise::clamp(_3564, 0.0, 1.0);
    float _3568 = _3538;
    float _3570 = _3530;
    float _3572 = _3544;
    float _3574 = _3566;
    if (!_3524)
    {
        _3568 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3576 = _3568;
    float _3578 = _3576;
    float _3580 = _3576;
    if (!_3524)
    {
        _3360 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3582 = _3360;
    out.m_99.x = _3556;
    out.m_99.y = _3558;
    out.m_99.z = _3560;
    out.m_99.w = _3550;
    float _3584 = _3566 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3586 = _3584;
    float _3588 = _3582;
    float _3590 = _3582;
    if (!_3524)
    {
        _3570 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3592 = _3570;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3524)
    {
        _3572 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3598 = _3572;
    out.m_101.x = _3584;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3524)
    {
        _3574 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3604 = _3574;
    float _3606 = _3604;
    float _3608 = _3604;
    if (!_3524)
    {
        _3586 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3610 = _3586;
    bool _3612 = !_3524;
    float _3614 = _3610;
    float _3616 = _3610;
    if (!_3612)
    {
        bool _3618 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3620 = isnan(_2266);
        bool _3622 = _3618 || _3620;
        bool _3624 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3626 = _3622 || _3624;
        if (!_3626)
        {
            float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3630 = _2266 + _3628;
            float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3634 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3632;
            float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3640 = 1.0 / _3634;
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3644 = _3642 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3658 = _3630 * _3640;
            float _3660 = precise::clamp(_3658, 0.0, 1.0);
            float _3662 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3664 = _3662 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3666 = fma(_3660, _3638, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3668 = fma(_3660, _3664, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3670 = fma(_3660, _3644, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3672 = fma(_3660, _3648, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3674 = fma(_3660, _3652, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3676 = fma(_3660, _3656, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3590 = _3666;
            _3608 = _3674;
            _3580 = _3670;
            _3602 = _3672;
            _3596 = _3668;
            _3616 = _3676;
            _3678 = true;
        }
        else
        {
            bool _3680 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3682 = isnan(_2266);
            bool _3684 = _3680 || _3682;
            bool _3686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3688 = _3684 || _3686;
            if (!_3688)
            {
                _3578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3690 = _3578;
            _3580 = _3690;
            if (!_3688)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3692 = _3588;
            _3590 = _3692;
            if (!_3688)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3694 = _3594;
            _3596 = _3694;
            if (!_3688)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3696 = _3600;
            _3602 = _3696;
            if (!_3688)
            {
                _3606 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3698 = _3606;
            _3608 = _3698;
            if (!_3688)
            {
                _3614 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3700 = _3614;
            bool _3702 = !_3688;
            _3616 = _3700;
            if (!_3702)
            {
                bool _3704 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3706 = isnan(_2266);
                bool _3708 = _3704 || _3706;
                bool _3710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3712 = _3708 || _3710;
                if (!_3712)
                {
                    float _3714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3716 = _2266 + _3714;
                    float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3720 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3718;
                    float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3726 = 1.0 / _3720;
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3730 = _3728 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3742 = _3740 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3744 = _3716 * _3726;
                    float _3746 = precise::clamp(_3744, 0.0, 1.0);
                    float _3748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3750 = _3748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3752 = fma(_3746, _3724, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3754 = fma(_3746, _3750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3756 = fma(_3746, _3730, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3758 = fma(_3746, _3734, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3760 = fma(_3746, _3738, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3762 = fma(_3746, _3742, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3590 = _3752;
                    _3608 = _3760;
                    _3580 = _3756;
                    _3602 = _3758;
                    _3596 = _3754;
                    _3616 = _3762;
                    _3678 = true;
                }
                else
                {
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3608 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3616 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3678 = false;
    float _3764 = _3590;
    float _3766 = _3608;
    float _3768 = _3580;
    float _3770 = _3602;
    float _3772 = _3596;
    float _3774 = _3616;
    float _3776 = fma(_3470, -0.5, 0.5);
    float _3778 = precise::clamp(_3776, 0.0, 1.0);
    float _3780 = -_3764;
    float _3782 = _3780 + _3766;
    float _3784 = _3540 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3786 = -_3768;
    float _3788 = _3786 + _3770;
    out.m_103.x = 0.0;
    float _3790 = fma(_3778, _3782, _3764);
    float _3792 = fma(_3778, _3788, _3768);
    out.m_63.x = _3784;
    float _3794 = -_3772;
    float _3796 = _3794 + _3774;
    float _3798 = _3790 * 0.586610972881317138671875;
    bool _3800 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3802 = fma(_3778, _3796, _3772);
    float _3804 = fma(_3792, 0.298911988735198974609375, _3798);
    bool _3806 = _2176 > 0.0;
    bool _3808 = isnan(_2176);
    bool _3810 = _3806 || _3808;
    bool _3812 = isnan(0.0);
    bool _3814 = _3810 || _3812;
    float _3816 = fma(_3802, 0.114477999508380889892578125, _3804);
    float _3818 = -_3816;
    float _3820 = _3790 + _3818;
    float _3822 = -_3816;
    float _3824 = _3792 + _3822;
    float _3826 = -_3816;
    float _3828 = _3802 + _3826;
    float _3830 = fma(_3820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    float _3832 = fma(_3824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    float _3834 = fma(_3828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    bool _3836 = !_3800;
    if (!_3836)
    {
        float _3838 = -_1905;
        float _3840 = _3838 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3842 = -_1907;
        float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3846 = -_1909;
        float _3848 = _3846 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3850 = _3840 * _3840;
        float _3852 = fma(_3844, _3844, _3850);
        float _3854 = fma(_3848, _3848, _3852);
        float _3856 = sqrt(_3854);
        float _3858 = rsqrt(_3854);
        float _3860 = -_3856;
        float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3864 = _3862 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3866 = precise::clamp(_3864, 0.0, 1.0);
        float _3868 = _3844 * _3858;
        float _3870 = _3840 * _3858;
        float _3872 = abs(_3866);
        float _3874 = log2(_3872);
        float _3876 = _3848 * _3858;
        float _3878 = _3868 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3880 = _3470 * _3870;
        float _3882 = -_3870;
        float _3884 = -_3878;
        float _3886 = fma(_3882, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3884);
        float _3888 = fma(_3482, _3868, _3880);
        float _3890 = -_3876;
        float _3892 = fma(_3890, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3886);
        float _3894 = fma(_3472, _3876, _3888);
        float _3896 = precise::clamp(_3894, 0.0, 1.0);
        float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3900 = _3892 + _3898;
        float _3902 = _3874 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3904 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3906 = precise::clamp(_3904, 0.0, 1.0);
        float _3908 = exp2(_3902);
        float _3910 = _3908 * _3906;
        float _3912 = _3896 * _3910;
        float _3914 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3916 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3918 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3914;
        out.m_103.y = _3916;
        out.m_103.z = _3918;
    }
    out.m_105.x = _3832;
    out.m_105.y = _3830;
    out.m_105.z = _3834;
    if (_3814)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3920 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3920;
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
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3678 = false;
    bool _618 = false;
    bool _390 = false;
    bool _228 = false;
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
        float _3988 = as_type<float>(_148);
        out.gl_Position.z = _3988;
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
        float _4043 = as_type<float>(_174);
        out.gl_Position.z = _4043;
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
    float _226;
    if (!_206)
    {
        float _210 = in.m_67.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        _226 = _186;
    }
    _228 = false;
    float _230 = _226;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    bool _236 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_230);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _230 + _248;
    bool _252 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_230);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_230);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_246;
    float _286 = _284 + 1.0;
    float _288 = 1.0 / _270;
    float _290 = _282 * _286;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _302 = 1.0 / _266;
    float _304 = _262 * _294;
    float _306 = -_262;
    float _308 = _306 + 1.0;
    float _310 = _250 * _288;
    float _312 = _234 * _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = fma(_298, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = fma(_316, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = fma(_320, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _328 = _322 * _304;
    float _330 = _324 * _304;
    float _332 = _326 * _304;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _328);
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _350 = fma(_336, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _352 = fma(_340, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _354 = fma(_344, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].z, _332);
    float _358 = fma(_350, _290, _346);
    float _360 = fma(_352, _290, _348);
    float _362 = fma(_354, _290, _356);
    float _364 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].x, _358);
    float _366 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].y, _360);
    float _368 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].z, _362);
    bool _370 = !_300;
    float _388;
    if (!_370)
    {
        float _372 = in.m_67.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        _388 = _186;
    }
    _390 = false;
    float _392 = _388;
    float _394 = in.m_69.x;
    float _396 = in.m_69.y;
    float _398 = in.m_69.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _402 = _392 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _416 = 1.0 / _406;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _420 = 1.0 / _414;
    float _422 = _368 * _398;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _426 = _392 + _424;
    float _428 = 1.0 / _410;
    float _430 = _402 * _416;
    bool _432 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _434 = isnan(_392);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _446 = _392 + _444;
    float _448 = _366 * _396;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _450;
    float _454 = _364 * _394;
    float _456 = -_442;
    float _458 = _456 + 1.0;
    float _460 = _426 * _420;
    bool _462 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _464 = isnan(_392);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    bool _474 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _476 = isnan(_392);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _472 * _458;
    bool _488 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_392);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = _446 * _428;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _502;
    float _506 = -_484;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _518 = -_472;
    float _520 = _518 + 1.0;
    float _522 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _524 = _498 * _508;
    float _526 = fma(_452, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _528 = fma(_512, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _530 = _484 * _520;
    float _532 = _522 * _524;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = _526 * _524;
    float _540 = _528 * _524;
    float _542 = -_498;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _550 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].x, _538);
    float _552 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].y, _532);
    float _554 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].z, _540);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _556;
    float _560 = fma(_516, _460, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _562 = fma(_548, _460, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _564 = fma(_536, _460, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _570;
    float _574 = fma(_560, _530, _550);
    float _576 = fma(_558, _430, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _578 = fma(_568, _430, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _580 = fma(_572, _430, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _582 = fma(_562, _530, _552);
    float _584 = fma(_564, _530, _554);
    float _586 = fma(_576, _486, _574);
    float _588 = fma(_578, _486, _582);
    float _590 = fma(_580, _486, _584);
    float _592 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].x, _586);
    float _594 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].y, _588);
    float _596 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].z, _590);
    bool _598 = !_418;
    float _616;
    if (!_598)
    {
        float _600 = in.m_67.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        _616 = _186;
    }
    _618 = false;
    float _620 = _616;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _620 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _640 = isnan(_620);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = 1.0 / _628;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _656 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _658 = isnan(_620);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _670 = 1.0 / _636;
    float _672 = _632 * _650;
    bool _674 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _676 = isnan(_620);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _654;
    float _688 = -_648;
    float _690 = _688 + 1.0;
    float _692 = fma(_672, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _698 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _700 = isnan(_620);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_684;
    float _712 = _710 + 1.0;
    float _714 = _684 * _690;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _720 = 1.0 / _696;
    float _722 = -_708;
    float _724 = _722 + 1.0;
    float _726 = _666 * _712;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _728;
    float _732 = _718 * _670;
    float _734 = _648 * _724;
    float _736 = _692 * _726;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _740 = _620 + _738;
    float _742 = -_666;
    float _744 = _742 + 1.0;
    bool _746 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _748 = isnan(_620);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _730 * _686;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _620 + _764;
    float _768 = fma(_732, _740, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _770 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[115].x, _736);
    float _772 = -_756;
    float _774 = _772 + 1.0;
    float _776 = _762 * _720;
    float _778 = fma(_758, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _782 = _620 + _780;
    float _784 = fma(_768, _714, _770);
    float _786 = _708 * _774;
    float _788 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _790 = fma(_776, _782, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _792 = fma(_778, _734, _784);
    float _794 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = fma(_790, _786, _792);
    float _800 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[119].x, _798);
    float _806 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _806;
    out.m_71.y = _796;
    out.m_71.z = _802;
    out.m_71.w = _808;
    bool _810 = !_668;
    if (!_810)
    {
        float _812 = in.m_67.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _208 = _826;
    }
    float _828 = _208;
    float _830 = in.m_56.x;
    float _832 = in.m_56.y;
    float _834 = in.m_56.z;
    float _836 = _832 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _838 = _832 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _840 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[6].x, _838);
    float _844 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].z, _840);
    float _846 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _848 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _856 = floor(_852);
    float _858 = floor(_854);
    float _860 = -_856;
    float _862 = _852 + _860;
    float _864 = -_858;
    float _866 = _854 + _864;
    float2 _5200 = float2(_862, _866);
    float _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5200, float2(0.0), isnan(_5200)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5200, float2(0.0), isnan(_5200)), level(0.0)).x;
    float _870 = in.m_67.x;
    float _872 = in.m_67.y;
    float _874 = _832 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = in.m_67.z;
    float _878 = in.m_67.w;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _882 = _880 != 0;
    float _884 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _888 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _890 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _892 = _870 * 2.0;
    float _894 = _870 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _896 = _872 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _898 = _876 * 2.0;
    float _900 = floor(_892);
    float _902 = -_886;
    float _904 = fma(_894, 2.0, _902);
    float _906 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _910 = _874;
    float _912 = _834;
    int _914 = 2;
    if (!_882)
    {
        float _916 = in.m_67.z;
        _910 = _916;
    }
    float _918 = _910;
    float _920 = _872 * 2.0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _928 = _926 != 0;
    float _930 = fma(_896, -2.0, _908);
    float _932 = floor(_898);
    float _934 = _872 + _870;
    float _936 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].z, _906);
    bool _938 = !_928;
    int _940 = _938 ? 0 : 1;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _944 = !_924;
    int _946 = _944 ? 0 : 1;
    float _948 = _934 + (-1.0);
    float _950 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _952 = _900 > 0.0;
    float _954 = floor(_920);
    bool _956 = _900 >= 0.0;
    bool _958 = isnan(_900);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _968 = _948;
    if (!_882)
    {
        _968 = _872;
    }
    float _970 = _968;
    float _972 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _984 = _982 != 0;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _988 = _932 >= 0.0;
    bool _990 = isnan(_932);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1000 = int(_998);
    float _1002 = _970;
    bool _1004 = _984;
    if (_882)
    {
        _1002 = _870;
    }
    float _1006 = _1002;
    float _1008 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _930);
    int _1010 = _996 ? 0 : 1;
    float _1012 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1014 = _932 > 0.0;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1018 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1020 = log2(_1018);
    int _1022 = _964 ? 0 : 1;
    float _1024 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1012);
    bool _1026 = !_976;
    int _1028 = _1026 ? 0 : 1;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1032 = _954 > 0.0;
    float _1034 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1024);
    bool _1036 = _954 >= 0.0;
    bool _1038 = isnan(_954);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(0.0);
    bool _1044 = _1040 || _1042;
    float _1046 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1048 = _918;
    float _1050 = _1008;
    if (!_882)
    {
        _912 = _918;
    }
    float _1052 = _912;
    float _1054 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1030);
    float _1056 = _1052;
    if (_882)
    {
        _1056 = _872;
    }
    float _1058 = _1056;
    float _1060 = -_942;
    float _1062 = fma(_1046, 2.0, _1060);
    int _1064 = ~_1010;
    int _1066 = _1064 + 1;
    int _1068 = _1066 + 1;
    float _1070 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1072 = int(_1070);
    int _1074 = _1068;
    if (!_1014)
    {
        int _1076 = ~_1010;
        int _1078 = _1076 + 1;
        _1074 = _1078;
    }
    int _1080 = _1074;
    float _1082 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1084 = abs(_1028);
    float _1086 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1016);
    float _1088 = float(_1000);
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1092 = float(_1084);
    float _1094 = -_130;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1062);
    float _1098 = float(_1080);
    float _1100 = 1.0 / _1088;
    float _1102 = _1092 * _1098;
    float _1104 = _1020 * _130;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = exp2(_1104);
    float _1112 = fma(_1090, -2.0, _1106);
    if (_882)
    {
        _1048 = _872;
    }
    float _1114 = _1048;
    float _1116 = in.m_73.x;
    float _1118 = in.m_73.y;
    float _1120 = in.m_73.z;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1124 = 1.0 + _1122;
    int _1126 = _1044 ? 0 : 1;
    float _1128 = _1102 * (-2.0);
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    float _1132 = 1.0 / _1124;
    float _1134 = -_130;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[76].x, _904);
    float _1138 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _972);
    int _1140 = ~_1126;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1100 * _130;
    int _1148 = _1144;
    if (!_1032)
    {
        int _1150 = ~_1126;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1138);
    float _1158 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    bool _1160 = !_980;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = -_1110;
    float _1166 = _1164 + 1.0;
    float _1168 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1170 = ~_1022;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1158);
    int _1178 = _1174;
    if (!_952)
    {
        int _1180 = ~_1022;
        int _1182 = _1180 + 1;
        _1178 = _1182;
    }
    int _1184 = _1178;
    float _1186 = 1.0 / _1168;
    int _1188 = abs(_1162);
    float _1190 = _1082 + _1168;
    bool _1192 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1194 = isnan(1.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1200 = _1196 || _1198;
    float _1202 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1086);
    float _1204 = float(_1184);
    float _1206 = fma(_1128, _1116, _1116);
    float _1208 = float(_1188);
    float _1210 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1054);
    bool _1212 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1130);
    float _1224 = float(_1072);
    float _1226 = _1208 * _1204;
    float _1228 = _1220 ? _1166 : 0.0;
    float _1230 = _870 + (-0.5);
    bool _1232 = !_984;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1224 * _130;
    float _1238 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1112);
    float _1240 = _1190 * _1186;
    float _1242 = _1240 * 0.5;
    if (_1200)
    {
        float _1244 = _1228 * _1132;
        _140 = _1244;
    }
    float _1246 = _140;
    float _1248 = fma(_966, _1128, _966);
    float _1250 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    int _1252 = abs(_1234);
    float _1254 = _872 + _876;
    float _1256 = fma(_1248, _1246, _1250);
    float _1258 = float(_1154);
    float _1260 = _1254 + (-1.0);
    float _1262 = float(_1252);
    float _1264 = _1226 * (-2.0);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1270 = _870 + _876;
    float _1272 = _1262 * _1258;
    float _1274 = _872 + (-0.5);
    float _1276 = fma(_1264, _1118, _1118);
    float _1278 = fma(_1268, _1264, _1268);
    float _1280 = _1270 + (-1.0);
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1276);
    float _1284 = _1272 * (-2.0);
    float _1286 = _1266 * 6.283185482025146484375;
    float _1288 = sin(_1286);
    float _1290 = fma(_1278, _1246, _1282);
    float _1292 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1296 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1294);
    float _1298 = fma(_1284, _1120, _1120);
    float _1300 = _876 + (-0.5);
    float _1302 = _1290 * 0.15915493667125701904296875;
    float _1304 = fma(_1292, _1284, _1292);
    float _1306 = in.m_75.x;
    float _1308 = in.m_75.y;
    float _1310 = in.m_75.z;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1298);
    float _1314 = 1.0 / _1296;
    float _1316 = fma(_1304, _1246, _1312);
    float _1318 = _1316 * 0.15915493667125701904296875;
    float _1320 = _1302 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    float _1324 = _1302 * 6.283185482025146484375;
    float _1326 = cos(_1324);
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1330 = _1314 * _1328;
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1310);
    float _1336 = _1318 * 6.283185482025146484375;
    float _1338 = cos(_1336);
    bool _1340 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1342 = _1288 * _1322;
    float _1344 = _1334 * _884;
    float _1346 = _1266 * 6.283185482025146484375;
    float _1348 = cos(_1346);
    if (!_1332)
    {
        _914 = 1;
    }
    int _1350 = _914;
    float _1352 = _1318 * 6.283185482025146484375;
    float _1354 = sin(_1352);
    float _1356 = _1288 * _1326;
    float _1358 = _1288 * _1338;
    float _1360 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1362 = _1322 * _1338;
    float _1364 = _950 + _1360;
    float _1366 = _1348 * _1326;
    float _1368 = _1348 * _1322;
    bool _1370 = !_1332;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1308);
    float _1376 = _1348 * _1338;
    float _1378 = _1326 * _1338;
    int _1380 = _1350;
    if (!_1340)
    {
        _1380 = _1372;
    }
    int _1382 = _1380;
    float _1384 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1386 = fma(_1354, _1366, _1342);
    float _1388 = fma(_1354, _1342, _1366);
    float _1390 = -_1368;
    float _1392 = fma(_1354, _1356, _1390);
    float _1394 = -_1356;
    float _1396 = fma(_1354, _1368, _1394);
    float _1398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1400 = _888 * _1374;
    float _1402 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1384);
    float _1404 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1406 = _890 * _1398;
    float _1408 = _1376 * _1400;
    float _1410 = -_1400;
    float _1412 = _1354 * _1410;
    float _1414 = _1358 * _1400;
    float _1416 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1404);
    float _1418 = fma(_1386, _1406, _1408);
    float _1420 = fma(_1378, _1406, _1412);
    float _1422 = fma(_1392, _1406, _1414);
    float _1424 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1402);
    float _1426 = fma(_1396, _1344, _1418);
    float _1428 = fma(_1362, _1344, _1420);
    float _1430 = fma(_1388, _1344, _1422);
    float _1432 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1416);
    float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1438 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1440 = _1382 << 6;
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1434);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1436);
    float _1446 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1448 = trunc(_1438);
    int _1450 = int(_1448);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1442);
    float _1454 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    int _1456 = _1440 + 48;
    uint _1459 = uint(int(uint(_1456) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    float _1475 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1477 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1479 = trunc(_1446);
    int _1481 = int(_1479);
    float _1483 = _850 + _1475;
    float _1485 = _848 + _1477;
    int _1487 = _1440 + 56;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1507 = _1483 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1511 = _1485 + _1509;
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1515 = _1450 + _1513;
    int _1517 = _1515 + 1;
    float _1519 = _1507 * _1507;
    int _1521 = _1440 + 64;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    bool _1539 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1541 = fma(_1511, _1511, _1519);
    int _1543 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1545 = _1481 + _1543;
    int _1547 = _1545 + 1;
    float _1549 = sqrt(_1541);
    int _1551 = _1440 + 72;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    uint _1555 = uint(int(uint(int(_1553)) >> uint(2)));
    int _1557 = int(_1553) & 3;
    float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
    int _1561 = int(_1553) + 1;
    uint _1563 = uint(int(uint(_1561) >> uint(2)));
    int _1565 = _1561 & 3;
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
    int _1569 = _1517 | _1547;
    bool _1571 = _1569 < 0;
    bool _1573 = _1571 || _1539;
    float _1575 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1577 = _1440 + 96;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    bool _1595 = _1547 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1597 = _1595 || _1573;
    float _1599 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1575);
    bool _1601 = _1549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1599);
    int _1605 = _1440 + 104;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    float _1623 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1625 = as_type<int>(_1599);
    int _1627 = _1547;
    int _1629 = as_type<int>(_1623);
    float _1631 = _1426;
    float _1633 = _1485;
    float _1635 = as_type<float>(_1440);
    if (!_1597)
    {
        int _1637 = _1547 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1639 = _1637 + _1517;
        _1625 = _1639;
    }
    int _1641 = _1625;
    float _1643 = _950 + _1623;
    float _1645 = _1643;
    if (!_1597)
    {
        int _1647 = _1641 << 2;
        _1627 = _1647;
    }
    int _1649 = _1627;
    int _1651 = _1649;
    if (!_1597)
    {
        uint _1653 = uint(int(uint(_1641) >> uint(2)));
        _1629 = int(_1653);
    }
    int _1655 = _1629;
    float _1657 = as_type<float>(_1655);
    if (!_1597)
    {
        int _1659 = 12 & _1649;
        _1651 = _1659;
    }
    int _1661 = _1651;
    if (!_1601)
    {
        _1631 = _1483;
    }
    float _1663 = _1631;
    bool _1665 = !_1601;
    float _1667 = _1663;
    float _1669 = _1559;
    if (!_1665)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1675 = _1549 + _1673;
        float _1677 = rsqrt(_1541);
        float _1679 = _1675 * _1671;
        float _1681 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1683 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1687 + (-1.0);
        float _1695 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1697 = fma(_1691, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1699 = fma(_1643, _1687, _1695);
        float _1701 = _1677 * _1697;
        float _1703 = fma(_1511, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1705 = fma(_1507, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1645 = _1699;
        _1633 = _1703;
        _1667 = _1705;
    }
    float _1707 = _1645;
    float _1709 = _1633;
    float _1711 = _1667;
    float _1713 = _1711;
    if (!_1597)
    {
        int _1715 = _1655 << 4;
        int _1717 = _1715 + _1661;
        _1657 = as_type<float>(_1717);
    }
    float _1719 = _1657;
    float _1721 = -_950;
    float _1723 = _1721 + _1707;
    int _1725 = _1440 + 80;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    float _1743 = -_848;
    float _1745 = _1743 + _1709;
    float _1747 = -_850;
    float _1749 = _1747 + _1711;
    float _1751 = _1723 * _1723;
    float _1753 = _1364 * _1593;
    float _1755 = _1364 * _1537;
    float _1757 = fma(_1745, _1745, _1751);
    int _1759 = _1440 + 88;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    uint _1763 = uint(int(uint(int(_1761)) >> uint(2)));
    int _1765 = int(_1761) & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    int _1769 = int(_1761) + 1;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    int _1773 = _1769 & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    float _1777 = fma(_848, _1585, _1753);
    float _1779 = _1751;
    if (!_1597)
    {
        float _1781 = floor(_1438);
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1749, _1749, _1757);
    float _1787 = fma(_850, _1613, _1777);
    float _1789 = _1364 * _1473;
    float _1791 = fma(_848, _1529, _1755);
    float _1793 = _1719;
    float _1795 = _1791;
    float _1797 = _1785;
    float _1799 = _1783;
    if (!_1597)
    {
        int _1801 = as_type<int>(_1719) + 400;
        uint _1803 = uint(int(uint(_1801) >> uint(2)));
        uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
        int _1807 = int(_1803) & 3;
        float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
        _1793 = _1809;
    }
    float _1811 = _1793;
    float _1813 = _1787 + _1621;
    float _1815 = sqrt(_1785);
    float _1817 = fma(_848, _1465, _1789);
    float _1819 = fma(_850, _1559, _1791);
    float _1821 = fma(_850, _1495, _1817);
    float _1823 = _1819 + _1567;
    float _1825 = _1777;
    float _1827 = _1817;
    if (!_1597)
    {
        float _1829 = floor(_1446);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = _1821 + _1503;
    bool _1835 = _1815 > 0.0;
    float _1837 = 1.0 / _1813;
    if (!_1835)
    {
        _1827 = _1709;
    }
    float _1839 = _1827;
    float _1841 = _1839;
    if (!_1835)
    {
        _1795 = _1707;
    }
    float _1843 = _1795;
    bool _1845 = !_1835;
    float _1847 = _1843;
    float _1849 = _1843;
    float _1851 = _1811;
    if (!_1845)
    {
        float _1853 = _202 * _202;
        float _1855 = rsqrt(_1785);
        float _1857 = fma(_200, _200, _1853);
        float _1859 = fma(_204, _204, _1857);
        float _1861 = sqrt(_1859);
        float _1863 = _1745 * _1855;
        float _1865 = _1723 * _1855;
        float _1867 = _1749 * _1855;
        bool _1869 = _1861 > 0.0;
        float _1871 = _1861;
        _1797 = _1855;
        if (!_1869)
        {
            _1871 = _1709;
        }
        float _1873 = _1871;
        _1841 = _1873;
        if (!_1869)
        {
            _1847 = _1707;
        }
        float _1875 = _1847;
        bool _1877 = !_1869;
        _1849 = _1875;
        if (!_1877)
        {
            float _1879 = rsqrt(_1859);
            float _1881 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1883 = _202 * _1879;
            float _1885 = _200 * _1879;
            float _1887 = _204 * _1879;
            float _1889 = _1865 * _1883;
            float _1891 = fma(_1863, _1885, _1889);
            float _1893 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1895 = fma(_1867, _1887, _1891);
            float _1897 = _1895 * _1893;
            float _1899 = fma(_200, _1897, _1709);
            float _1901 = fma(_202, _1897, _1707);
            float _1903 = fma(_204, _1897, _1711);
            _1849 = _1901;
            _1841 = _1899;
            _1713 = _1903;
            _1669 = _1889;
        }
    }
    float _1905 = _1849;
    float _1907 = _1841;
    float _1909 = _1713;
    float _1911 = _1669;
    float _1913 = _1797;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = _1833 * _1837;
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1915);
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1917);
    float _1927 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1919);
    float _1929 = _1823 * _1837;
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1923);
    bool _1933 = _1921 >= 0.0;
    float _1935 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1925);
    float _1937 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1939 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1943 = _1921 <= 1.0;
    bool _1945 = _1943 && _1933;
    float _1947 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1937);
    float _1949 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1953 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1955 = _1929 >= 0.0;
    bool _1957 = _1955 && _1945;
    float _1959 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1947);
    float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1967 = _1929 <= 1.0;
    bool _1969 = _1967 && _1957;
    float _1971 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1973 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1961);
    float _1975 = -_1965;
    float _1977 = fma(_1975, _1963, 1.0);
    float _1979 = _1364 * _1741;
    float _1981 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    float _1985 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1987 = _1911;
    float _1989 = _1913;
    if (!_1597)
    {
        float _1991 = rint(_1811);
        float _1993 = precise::max(_1991, 0.0);
        uint _1995 = uint(_1993);
        uint _1997 = clamp(_1995, 0u, 65535u);
        _1987 = as_type<float>(_1997);
    }
    float _1999 = _1987;
    float _2001 = fma(_848, _1733, _1979);
    float _2003 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1981);
    float _2005 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1985);
    float _2007 = _2003;
    float _2009 = _1999;
    if (!_1597)
    {
        float _2011 = -_1831;
        float _2013 = _1446 + _2011;
        _1989 = _2013;
    }
    float _2015 = _1989;
    float _2017 = fma(_850, _1767, _2001);
    float _2019 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2021 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2023 = log2(_1977);
    if (_1969)
    {
        float _2025 = float(_1382);
        _1851 = _2025;
    }
    float _2027 = _1851;
    float _2029 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2019);
    float _2031 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2021);
    float _2033 = _2017 + _1775;
    if (!_1597)
    {
        float _2035 = -_1783;
        float _2037 = _1438 + _2035;
        _2007 = _2037;
    }
    float _2039 = _2007;
    float _2041 = 1.0 / _1983;
    float _2043 = _2033 * _1837;
    float _2045 = _1985;
    if (_1969)
    {
        float _2047 = rint(_2027);
        float _2049 = precise::max(_2047, 0.0);
        uint _2051 = uint(_2049);
        uint _2053 = clamp(_2051, 0u, 65535u);
        _2045 = as_type<float>(_2053);
    }
    float _2055 = _2045;
    float _2057 = _2023 * 0.693147182464599609375;
    float _2059 = _2031 * _2041;
    float _2061 = _2029 * _2041;
    float _2063 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2065 = fma(_2059, 0.5, 0.5);
    float _2067 = fma(_2061, -0.5, 0.5);
    float _2069 = _2033;
    float _2071 = _2061;
    float _2073 = _2063;
    if (!_1597)
    {
        float3 _7147 = float3(_2039, _2015, float(as_type<int>(_1999)));
        float3 _7151 = select(_7147, float3(0.0), isnan(_7147));
        float _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7151.xy, uint(rint(_7151.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7151.xy, uint(rint(_7151.z)), level(0.0)).x;
        _2069 = _2075;
    }
    float _2077 = _2069;
    float _2079 = _1929;
    if (_1969)
    {
        float3 _7166 = float3(_1921, _1929, float(as_type<int>(_2055)));
        float3 _7168 = select(_7166, float3(0.0), isnan(_7166));
        float _2081 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7168.xy, uint(rint(_7168.z)), _2043, level(0.0));
        _2079 = _2081;
    }
    float _2083 = _2079;
    float3 _7178 = float3(_2065, _2067, _2063);
    float _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7178, float3(0.0), isnan(_7178)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7178, float3(0.0), isnan(_7178)), level(0.0)).x;
    float3 _7187 = float3(_2065, _2067, _2063);
    float4 _2088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7187, float3(0.0), isnan(_7187)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7187, float3(0.0), isnan(_7187)), level(0.0)).xyzw;
    float _2090 = _2088.x;
    float _2092 = _2088.y;
    float _2094 = _2088.z;
    float _2096 = _2088.w;
    float _2098 = in.m_77.x;
    bool _2100 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2108 = _2104 || _2106;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2112 = _2110 != 0;
    if (_1597)
    {
        _2009 = 1.0;
    }
    float _2114 = _2009;
    float _2116 = _2114;
    if (_2108)
    {
        _1799 = 1.0;
    }
    float _2118 = _1799;
    float _2120 = _2118;
    if (!_2112)
    {
        _2071 = _2098;
    }
    float _2122 = _2071;
    float _2124 = _2122;
    if (!_2108)
    {
        float _2126 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2128 = _2126 * 0.15915493667125701904296875;
        float _2130 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2134 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2132;
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = cos(_2136);
        float _2140 = _2130 * 0.15915493667125701904296875;
        float _2142 = _2128 * 6.283185482025146484375;
        float _2144 = sin(_2142);
        float _2146 = 1.0 / _2138;
        float _2148 = _2140 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = _2144 * _2146;
        float _2154 = _2140 * 6.283185482025146484375;
        float _2156 = sin(_2154);
        float _2158 = _2150 * _2152;
        float _2160 = 1.0 / _2134;
        float _2162 = 1.0 / _2158;
        float _2164 = _2156 * _2162;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = fma(_1330, _2164, _2166);
        float _2170 = _2168 * _2160;
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        _2073 = _2128;
        _2120 = _2172;
    }
    float _2174 = _2073;
    float _2176 = _2120;
    float _2178 = _2174;
    if (!_1597)
    {
        int _2180 = _1641 << 4;
        int _2182 = _2180 + 2048;
        uint _2184 = uint(int(uint(_2182) >> uint(2)));
        uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
        int _2188 = int(_2184) & 3;
        float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
        int _2192 = int(_2184) + 1;
        uint _2194 = uint(int(uint(_2192) >> uint(2)));
        int _2196 = _2192 & 3;
        float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
        int _2200 = _2182 + 8;
        uint _2202 = uint(int(uint(_2200) >> uint(2)));
        uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
        int _2206 = int(_2202) & 3;
        float _2208 = (*spvDescriptorSet0.vp_c15)._m0[int(_2204)][_2206];
        int _2210 = int(_2202) + 1;
        uint _2212 = uint(int(uint(_2210) >> uint(2)));
        int _2214 = _2210 & 3;
        float _2216 = (*spvDescriptorSet0.vp_c15)._m0[int(_2212)][_2214];
        float _2218 = _1364 * _2198;
        float _2220 = fma(_848, _2190, _2218);
        float _2222 = fma(_850, _2208, _2220);
        float _2224 = _2222 + _2216;
        float _2226 = precise::clamp(_2224, 0.0, 1.0);
        float _2228 = -_2226;
        float _2230 = _2228 + _2077;
        float _2232 = fma(_2230, 500.0, 1.5);
        float _2234 = exp2(_2232);
        float _2236 = 0.0 + _2234;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        _2116 = _2238;
    }
    float _2240 = _2116;
    float _2242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2244 = _1905 + _2242;
    float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2248 = _1907 + _2246;
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2252 = _1909 + _2250;
    float _2254 = trunc(_1146);
    int _2256 = int(_2254);
    float _2258 = _2244 * _2244;
    float _2260 = fma(_2248, _2248, _2258);
    float _2262 = fma(_2252, _2252, _2260);
    float _2264 = rsqrt(_2262);
    float _2266 = sqrt(_2262);
    float _2268 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2270 = _2248 * _2268;
    float _2272 = _2252 * _2268;
    float _2274 = _2270 * _2270;
    float _2276 = _2272 * _2272;
    float _2278 = _2274 + _2276;
    float _2280 = sqrt(_2278);
    bool _2282 = _2280 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2286 = _2280 + _2284;
    float _2288 = _2252;
    float _2290 = _2278;
    float _2292 = _2286;
    float _2294 = _2268;
    float _2296 = _2270;
    float _2298 = _2274;
    float _2300 = _2276;
    if (_2282)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2288 = _2302;
    }
    float _2304 = _2288;
    if (_2282)
    {
        float _2306 = rsqrt(_2278);
        _2290 = _2306;
    }
    float _2308 = _2290;
    if (_2282)
    {
        float _2310 = _2286 * _2304;
        _2292 = _2310;
    }
    float _2312 = _2292;
    if (_2282)
    {
        float _2314 = _2312 * 0.15915493667125701904296875;
        _2178 = _2314;
    }
    float _2316 = _2178;
    float _2318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2320 = _2077;
    float _2322 = _2318;
    if (_2282)
    {
        float _2324 = _2316 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        _2320 = _2326;
    }
    float _2328 = _2320;
    float _2330 = precise::max(0.0, _2318);
    float _2332 = _2312;
    if (_2282)
    {
        float _2334 = _2316 * 6.283185482025146484375;
        float _2336 = cos(_2334);
        _2332 = _2336;
    }
    float _2338 = _2332;
    float _2340 = -_2268;
    float _2342 = -_2330;
    float _2344 = fma(_2244, _2340, _2342);
    float _2346 = _2344;
    if (_2282)
    {
        float _2348 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2348;
    }
    float _2350 = _2294;
    float _2352 = _2350;
    float _2354 = _2328;
    if (_2282)
    {
        float _2356 = fma(_2328, _2350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2352 = _2356;
    }
    float _2358 = _2352;
    int _2360 = ~_1072;
    int _2362 = _2360 + 1;
    if (_2282)
    {
        float _2364 = _2308 * _2358;
        _1635 = _2364;
    }
    float _2366 = _1635;
    float _2368 = float(uint(_1072));
    int _2370 = as_type<int>(_2366);
    if (_2282)
    {
        float _2372 = _2338 + (-1.0);
        _2322 = _2372;
    }
    float _2374 = _2322;
    float _2376 = _2374;
    if (_2282)
    {
        float _2378 = _2270 * _2366;
        _2296 = _2378;
    }
    float _2380 = _2296;
    if (_2282)
    {
        float _2382 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2382;
    }
    float _2384 = _2354;
    if (!_2282)
    {
        _2376 = _2272;
    }
    float _2386 = _2376;
    float _2388 = _2386;
    if (_2282)
    {
        float _2390 = _2272 * _2366;
        _2388 = _2390;
    }
    float _2392 = _2388;
    if (_2282)
    {
        float _2394 = _2380 * _2380;
        _2298 = _2394;
    }
    float _2396 = _2298;
    if (_2282)
    {
        float _2398 = fma(_2344, _2338, _2384);
        _2346 = _2398;
    }
    float _2400 = _2346;
    float _2402 = 1.0 / _2368;
    if (_2282)
    {
        float _2404 = _2392 * _2392;
        _2300 = _2404;
    }
    float _2406 = _2300;
    float _2408 = fma(_2400, _2400, _2396);
    float _2410 = _2408 + _2406;
    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2414 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2412);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = float(uint(_2256));
    float _2420 = rsqrt(_2410);
    float _2422 = -_2416;
    float _2424 = _2422 + 1.0;
    int _2426 = as_type<int>(_2402) + (-2);
    float _2428 = abs(_2424);
    float _2430 = log2(_2428);
    float _2432 = as_type<float>(_2426) * _2418;
    float _2434 = _2420 * _2380;
    float _2436 = _2420 * _2400;
    float _2438 = _2420 * _2392;
    float _2440 = trunc(_2432);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    float _2446 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2448 = _2392;
    if (_2112)
    {
        float _2450 = in.m_67.x;
        _2448 = _2450;
    }
    float _2452 = _2448;
    float _2454 = -_2446;
    float _2456 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2454);
    float _2458 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2460 = -_2438;
    float _2462 = fma(_2460, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2456);
    float _2464 = exp2(_2458);
    float _2466 = fma(_2462, -0.5, 0.5);
    float _2468 = fma(_2462, 0.5, 0.5);
    int _2470 = _2362 * int(_2444);
    int _2472 = _2470 + _2256;
    float _2474 = fma(_2468, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2476 = sqrt(_2466);
    float _2478 = float(uint(_2472));
    float _2480 = _2436 + 1.0;
    float _2482 = fma(_2468, _2474, -0.212114393711090087890625);
    float _2484 = as_type<float>(_2426) * _2478;
    float _2486 = -_2436;
    float _2488 = fma(_2464, _2480, _2486);
    float _2490 = fma(_2468, _2482, 1.570728778839111328125);
    float _2492 = in.m_77.y;
    float _2494 = fma(_2488, 0.5, 0.5);
    float _2496 = trunc(_2484);
    float _2498 = precise::max(_2496, 0.0);
    uint _2500 = uint(_2498);
    float _2502 = _2476 * 0.636619746685028076171875;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2508 = -_2490;
    float _2510 = fma(_2502, _2508, 1.0);
    float2 _7815 = float2(_2510, _2494);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7815, float2(0.0), isnan(_7815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7815, float2(0.0), isnan(_7815)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    if (_2112)
    {
        float _2522 = -_2098;
        float _2524 = _2522 + 1.0;
        _2370 = as_type<int>(_2524);
    }
    int _2526 = _2370;
    if (_2112)
    {
        bool _2528 = _2452 > 0.5;
        _1004 = _2528;
    }
    bool _2530 = _1004;
    float _2532 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2534 = _878 > 0.5;
    float _2536 = 1.0 / _2506;
    if (_2112)
    {
        float _2538 = _2530 ? as_type<float>(_2526) : _2098;
        _2124 = _2538;
    }
    float _2540 = _2124;
    float _2542 = _890 * _2098;
    int _2544 = int(_2444) + int(_2500);
    float _2546 = _888 * _2492;
    int _2548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2550 = _2548 != 0;
    float _2552 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2554 = -_2546;
    float _2556 = _2554 + 1.0;
    int _2558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2560 = _2558 != 0;
    float _2562 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2552);
    int _2564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2566 = _2564 != 0;
    float _2568 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2570 = ~_1072;
    int _2572 = _2570 + 1;
    float _2574 = -_868;
    float _2576 = _2574 + 1.0;
    bool _2578 = !_882;
    float _2580 = _2578 ? 7.345489978790283203125 : 1.0;
    out.m_79.x = _1907;
    out.m_79.y = _1905;
    out.m_79.z = _1909;
    int _2582 = _2572 * _2544;
    int _2584 = _2582 + _2256;
    bool _2586 = _876 > 0.5;
    float _2588 = _2580 * _870;
    float _2590 = _2546;
    float _2592 = _2542;
    if (_2550)
    {
        float _2594 = _2534 ? _2556 : _2546;
        _2590 = _2594;
    }
    float _2596 = _2590;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2602 = float(_2256);
    float _2604 = floor(_2588);
    bool _2606 = uint(_2584) >= uint(_1072);
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2610 = _2608 != 0;
    bool _2612 = _2602 >= _1224;
    bool _2614 = isnan(_2602);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(_1224);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = 1.0 / _2600;
    bool _2626 = !_2606;
    int _2628 = _2626 ? 0 : (-1);
    bool _2630 = !_2610;
    int _2632 = _2630 ? 0 : 1;
    bool _2634 = !_2560;
    int _2636 = _2634 ? 0 : 1;
    bool _2638 = _872 > 0.5;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2640;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2646 = _2644 != 0;
    float _2648 = -_2604;
    float _2650 = _2588 + _2648;
    int _2652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2654 = _2652 != 0;
    float _2656 = _2642 * _2536;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2660 = _2658 != 0;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2666 = -_2492;
    float _2668 = _2666 + 1.0;
    float _2670 = trunc(_2622);
    int _2672 = int(_2670);
    int _2674 = ~_2544;
    int _2676 = _2674 + _2628;
    int _2678 = _2676 + 1;
    float _2680 = _1236 * _182;
    float _2682 = _1224 * _2650;
    int _2684 = _2638 ? as_type<int>(_2668) : as_type<int>(_2492);
    int _2686 = _1072 * _2678;
    int _2688 = _2686 + _2256;
    bool _2690 = _1072 == 0;
    float _2692 = _2664 * _2624;
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2694;
    float _2698 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    bool _2702 = !_2690;
    int _2704 = _2702 ? _2688 : (-1);
    float _2706 = trunc(_2682);
    int _2708 = int(_2706);
    float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2712 = _828 + _2710;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2718 = ~_2672;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    float _2724 = fma(_2656, _2712, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2726 = _1072 + (-1);
    float _2728 = trunc(_2680);
    int _2730 = int(_2728);
    int _2732 = abs(_940);
    int _2734 = _2722 * _2704;
    int _2736 = abs(_2632);
    float _2738 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _2742 = abs(_946);
    int _2744 = _2672 * _2726;
    int _2746 = _2744 + _2734;
    float _2748 = 1.0 / _2716;
    int _2750 = _2708 * _2736;
    int _2752 = _2750 + _2256;
    bool _2754 = !_2566;
    int _2756 = _2754 ? 0 : 1;
    int _2758 = _2746 * _2732;
    int _2760 = abs(_2636);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2764 = _828 + _2762;
    int _2766 = abs(_2756);
    float _2768 = 1.0 / _2740;
    int _2770 = _2730 * _2742;
    int _2772 = _2770 + _2758;
    bool _2774 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2776 = isnan(_828);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2782 = _2778 || _2780;
    float _2784 = float(_2782);
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2788 = _828 + _2786;
    bool _2790 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2792 = isnan(_828);
    bool _2794 = _2790 || _2792;
    bool _2796 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2798 = _2794 || _2796;
    float _2800 = float(_2798);
    int _2802 = _2752 * _2760;
    int _2804 = _2802 + _2772;
    float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2808 = _828 + _2806;
    float _2810 = fma(_2692, _2788, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2812 = _2696 * _2748;
    int _2814 = _2708 * _2766;
    int _2816 = _2814 + _2804;
    bool _2818 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2820 = isnan(_828);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = -_2784;
    float _2832 = _2830 + 1.0;
    float _2834 = fma(_2812, _2764, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2836 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2838 = isnan(_828);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2844 = _2840 || _2842;
    float _2846 = float(_2844);
    float _2848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2850 = float(uint(_2816));
    float _2852 = _2700 * _2768;
    float _2854 = _2654 ? as_type<float>(_2684) : _2492;
    float _2856 = -_2828;
    float _2858 = _2856 + 1.0;
    bool _2860 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2862 = isnan(_828);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2868 = _2864 || _2866;
    float _2870 = float(_2868);
    float _2872 = as_type<float>(_2426) * _2850;
    float _2874 = -_2800;
    float _2876 = _2874 + 1.0;
    float _2878 = _2828 * _2832;
    bool _2880 = _1308 != 0.0;
    bool _2882 = isnan(_1308);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = _2870 * _2858;
    float _2892 = -_2870;
    float _2894 = _2892 + 1.0;
    float _2896 = in.m_81.x;
    float _2898 = in.m_81.y;
    float _2900 = in.m_81.z;
    float _2902 = trunc(_2872);
    float _2904 = precise::max(_2902, 0.0);
    uint _2906 = uint(_2904);
    bool _2908 = _1306 == 0.0;
    bool _2910 = !_2888;
    bool _2912 = _2908 && _2910;
    float _2914 = _2800 * _2894;
    int _2916 = ~_1072;
    int _2918 = _2916 + 1;
    float _2920 = _2846 * _2876;
    bool _2922 = _1310 == 0.0;
    bool _2924 = _2922 && _2912;
    float _2926 = fma(_2852, _2808, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _2928 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2930 = _2724 * _2920;
    float _2932 = -_2846;
    float _2934 = _2932 + 1.0;
    float _2936 = _2848 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2938 = -_1008;
    float _2940 = fma(_1202, _2928, _2938);
    float _2942 = -_2542;
    float _2944 = _2942 + 1.0;
    float _2946 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2930);
    float _2948 = fma(_2936, _2596, -0.5);
    int _2950 = _2918 * int(_2906);
    int _2952 = _2950 + _2816;
    float _2954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2956 = fma(_2810, _2914, _2946);
    float _2958 = -_1238;
    float _2960 = fma(_1222, _2948, _2958);
    int _2962 = ~_1072;
    int _2964 = _2962 + 1;
    float _2966 = float(uint(_2952));
    float _2968 = fma(_2834, _2890, _2956);
    float _2970 = in.m_83.x;
    float _2972 = in.m_83.y;
    float _2974 = in.m_83.z;
    float _2976 = in.m_83.w;
    float _2978 = as_type<float>(_2918);
    float _2980 = _2622;
    float _2982 = _2966;
    if (_2924)
    {
        _2978 = _2896;
    }
    float _2984 = _2978;
    float _2986 = abs(_1330);
    float _2988 = log2(_2986);
    float _2990 = as_type<float>(_2426) * _2966;
    float _2992 = _2984;
    if (_2924)
    {
        _2980 = _2898;
    }
    float _2994 = _2980;
    float _2996 = fma(_2926, _2878, _2968);
    float _2998 = _2994;
    if (_2924)
    {
        _1050 = _2984;
    }
    float _3000 = _1050;
    float _3002 = _3000;
    if (!_2924)
    {
        _2992 = _2896;
    }
    float _3004 = _2992;
    float _3006 = fma(_2784, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2996);
    float _3008 = trunc(_2990);
    float _3010 = precise::max(_3008, 0.0);
    uint _3012 = uint(_3010);
    float _3014 = float(uint(_2752));
    float _3016 = _3014;
    if (_2924)
    {
        _2982 = _2994;
    }
    float _3018 = _2982;
    float _3020 = _3018;
    if (!_2924)
    {
        float _3022 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3004);
        _3002 = _3022;
    }
    float _3024 = _3002;
    if (!_2924)
    {
        _2998 = _2898;
    }
    float _3026 = _2998;
    float _3028 = as_type<float>(_2426) * _3014;
    if (_2924)
    {
        _3016 = _2900;
    }
    float _3030 = _3016;
    float _3032 = _3030;
    if (!_2924)
    {
        float _3034 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2900);
        _3032 = _3034;
    }
    float _3036 = _3032;
    if (_2646)
    {
        float _3038 = _2586 ? _2944 : _2542;
        _2592 = _3038;
    }
    float _3040 = _2592;
    float _3042 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2924)
    {
        float _3044 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3026);
        _3020 = _3044;
    }
    float _3046 = _3020;
    float _3048 = trunc(_3028);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    float _3054 = fma(_2540, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3056 = fma(_3042, _3040, -0.5);
    float _3058 = _2970 * _3026;
    int _3060 = int(_2906) + int(_3012);
    float _3062 = fma(_1176, _3054, _1136);
    int _3064 = ~_1072;
    int _3066 = _3064 + 1;
    float _3068 = -_3058;
    float _3070 = fma(_2972, _3004, _3068);
    float _3072 = fma(_1210, _3056, _1096);
    int _3074 = _2964 * _3060;
    int _3076 = _3074 + _2816;
    float _3078 = _2988 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3080 = _2974 * _3004;
    float _3082 = _2960 + 0.5;
    float _3084 = _3062 + 0.5;
    bool _3086 = uint(_3076) >= uint(_1072);
    float _3088 = -_3080;
    float _3090 = fma(_2970, _2900, _3088);
    int _3092 = _3066 * int(_3052);
    int _3094 = _3092 + _2752;
    float _3096 = _2972 * _2900;
    bool _3098 = !_3086;
    int _3100 = _3098 ? 0 : (-1);
    float _3102 = exp2(_3078);
    float _3104 = _3072 + 0.5;
    float _3106 = float(uint(_3094));
    float _3108 = _2940 + 0.5;
    int _3110 = ~_3060;
    int _3112 = _3110 + _3100;
    int _3114 = _3112 + 1;
    float _3116 = _3006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3118 = -_3096;
    float _3120 = fma(_2974, _3026, _3118);
    float _3122 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3124 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3126 = _1072 * _3114;
    int _3128 = _3126 + _2816;
    float _3130 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3132 = _3090 * _2976;
    float _3134 = _3120 * _2976;
    out.m_85.x = _3084;
    out.m_85.y = _3108;
    out.m_85.z = _3104;
    out.m_85.w = _3082;
    bool _3136 = !_2690;
    int _3138 = _3136 ? _3128 : (-1);
    float _3140 = -_1354;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3122);
    float _3144 = -_1354;
    float _3146 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3124);
    out.m_87.w = _3116;
    float _3148 = as_type<float>(_2426) * _3106;
    float _3150 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3152 = _3070 * _2976;
    int _3154 = ~_1072;
    int _3156 = _3154 + 1;
    float _3158 = exp2(_2568);
    float _3160 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3150);
    float _3162 = -_1354;
    float _3164 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3130);
    int _3166 = _3138 >> 31;
    float _3168 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3170 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3172 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3174 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3176 = precise::clamp(_3174, 0.0, 1.0);
    float _3178 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3168);
    int _3180 = _3166 & 3;
    float _3182 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3172);
    float _3184 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3170);
    float _3186 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3142);
    int _3188 = _3138 + _3180;
    float _3190 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3146);
    float _3192 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3164);
    float _3194 = trunc(_3148);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    int _3200 = _3188 >> 2;
    float _3202 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3204 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3206 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3178);
    int _3208 = _3200 << 4;
    int _3210 = _3208 + 368;
    float _3212 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3202);
    float _3214 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3204);
    float _3216 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3184);
    uint _3218 = uint(int(uint(_3210) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    float _3234 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3182);
    int _3236 = _3138 & 3;
    bool _3238 = _3236 != 0;
    float _3240 = _3186 * _2972;
    int _3242 = _3138 & 3;
    float _3244 = _3190 * _2972;
    float _3246 = _3192 * _2972;
    int _3248 = int(_3052) + int(_3198);
    int _3250 = _3210 + 8;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    uint _3254 = uint(int(uint(int(_3252)) >> uint(2)));
    int _3256 = int(_3252) & 3;
    float _3258 = (*spvDescriptorSet0.vp_c9)._m0[int(_3254)][_3256];
    int _3260 = int(_3252) + 1;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    int _3264 = _3260 & 3;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[int(_3262)][_3264];
    bool _3268 = uint(_3242) > 1u;
    float _3270 = _3186 * _3046;
    float _3272 = _3132 * _3186;
    int _3274 = _3156 * _3248;
    int _3276 = _3274 + _2752;
    float _3278 = _3190 * _3046;
    float _3280 = _3132 * _3190;
    int _3282 = _3238 ? 0 : 1;
    float _3284 = fma(_3206, _3024, _3270);
    bool _3286 = uint(_3276) >= uint(_1072);
    float _3288 = _3192 * _3046;
    int _3290 = ~_3282;
    int _3292 = _3290 + 1;
    int _3294 = _3292 + 1;
    float _3296 = fma(_3216, _2970, _3244);
    bool _3298 = !_3286;
    int _3300 = _3298 ? 0 : (-1);
    float _3302 = fma(_3234, _2970, _3246);
    bool _3304 = _3242 != 3;
    float _3306 = _3132 * _3192;
    int _3308 = _3294;
    if (!_3268)
    {
        int _3310 = ~_3282;
        int _3312 = _3310 + 1;
        _3308 = _3312;
    }
    int _3314 = _3308;
    float _3316 = fma(_3216, _3024, _3278);
    bool _3318 = uint(_3242) >= 2u;
    float _3320 = fma(_3206, _2970, _3240);
    int _3322 = ~_3248;
    int _3324 = _3322 + _3300;
    int _3326 = _3324 + 1;
    float _3328 = fma(_3234, _3024, _3288);
    int _3330 = _3318 ? 0 : 1;
    float _3332 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3212);
    int _3334 = abs(_3314);
    float _3336 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3214);
    bool _3338 = !_3238;
    int _3340 = _3338 ? 0 : 1;
    float _3342 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3160);
    int _3344 = ~_3330;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    float _3350 = fma(_3134, _3206, _3272);
    bool _3352 = _3242 != 3;
    int _3354 = _1072 * _3326;
    int _3356 = _3354 + _2752;
    int _3358 = _3348;
    float _3360 = _3336;
    if (_3304)
    {
        int _3362 = ~_3330;
        int _3364 = _3362 + 1;
        _3358 = _3364;
    }
    int _3366 = _3358;
    float _3368 = fma(_3134, _3234, _3306);
    int _3370 = abs(_3340);
    int _3372 = abs(_3366);
    bool _3374 = !_3352;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = ~_3334;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    bool _3384 = !_2660;
    int _3386 = _3384 ? 0 : 1;
    int _3388 = abs(_3376);
    int _3390 = _3382 * as_type<int>(_3232);
    int _3392 = ~_3370;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    int _3398 = abs(_3386);
    int _3400 = _3396 * as_type<int>(_3224);
    int _3402 = _3400 + _3390;
    int _3404 = ~_3372;
    int _3406 = _3404 + 1;
    int _3408 = _3406 + 1;
    float _3410 = fma(_3332, _2974, _3320);
    int _3412 = ~_3388;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    int _3418 = _3408 * as_type<int>(_3258);
    int _3420 = _3418 + _3402;
    int _3422 = ~_3398;
    int _3424 = _3422 + 1;
    int _3426 = _3424 + 1;
    float _3428 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2562);
    float _3430 = fma(_3134, _3216, _3280);
    int _3432 = _3416 * as_type<int>(_3266);
    int _3434 = _3432 + _3420;
    float _3436 = _3428 + _1983;
    bool _3438 = _1330 <= 8000.0;
    bool _3440 = isnan(_1330);
    bool _3442 = _3438 || _3440;
    bool _3444 = isnan(8000.0);
    bool _3446 = _3442 || _3444;
    float _3448 = float(_3446);
    int _3450 = _3426 * _3434;
    bool _3452 = !_2690;
    int _3454 = _3452 ? _3356 : (-1);
    float _3456 = fma(_3336, _2974, _3296);
    float _3458 = fma(_3342, _2974, _3302);
    int _3460 = _3454 * _3398;
    int _3462 = _3460 + _3450;
    float _3464 = fma(_3152, _3332, _3350);
    float _3466 = fma(_3152, _3342, _3368);
    float _3468 = _3436 * 0.5;
    float _3470 = fma(_3336, _3036, _3316);
    float _3472 = fma(_3342, _3036, _3328);
    float _3474 = fma(_3176, -2.0, 3.0);
    float _3476 = _3176 * _3176;
    float _3478 = fma(_3152, _3336, _3430);
    float _3480 = float(_3462);
    float _3482 = fma(_3332, _3036, _3284);
    float _3484 = _3476 * _3474;
    out.m_89.x = _3464;
    out.m_89.y = _3478;
    out.m_89.z = _3466;
    out.m_91.x = _3410;
    out.m_91.y = _3456;
    out.m_91.z = _3458;
    out.gl_Position.x = _2031;
    out.gl_Position.y = _2029;
    out.gl_Position.z = _3428;
    out.gl_Position.w = _1983;
    float _3486 = -_3484;
    float _3488 = _3486 + 1.0;
    float _3490 = _3478;
    if (!_1969)
    {
        _3490 = 1.0;
    }
    float _3492 = _3490;
    out.m_93.z = _3468;
    out.m_93.w = _1983;
    float _3494 = _3492;
    if (_1969)
    {
        bool _3496 = _2083 >= _2043;
        bool _3498 = isnan(_2083);
        bool _3500 = _3496 || _3498;
        bool _3502 = isnan(_2043);
        bool _3504 = _3500 || _3502;
        float _3506 = float(_3504);
        _3494 = _3506;
    }
    float _3508 = _3494;
    float _3510 = fma(_3488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3484);
    float _3512 = -_3158;
    float _3514 = _3512 + 1.0;
    out.m_95.x = _3480;
    bool _3516 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3518 = isnan(_2266);
    bool _3520 = _3516 || _3518;
    bool _3522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3524 = _3520 || _3522;
    float _3526 = _3448 * _3510;
    float _3528 = _3514 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_97.x = _3482;
    out.m_97.y = _3470;
    out.m_97.z = _3472;
    float _3530 = _3508 * _2240;
    float _3532 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3534 = _3528 * _2085;
    float _3536 = -_3528;
    float _3538 = _3536 + 1.0;
    float _3540 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3542 = _2576 * _3532;
    float _3544 = precise::clamp(_3542, 0.0, 1.0);
    float _3546 = _2096 * _3534;
    float _3548 = _2520 * _3534;
    float _3550 = _2096 * _3538;
    float _3552 = -_3544;
    float _3554 = fma(_3552, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3556 = fma(_2516, _3546, _2090);
    float _3558 = fma(_2518, _3546, _2092);
    float _3560 = fma(_2096, _3548, _2094);
    float _3562 = -_3530;
    float _3564 = fma(_3562, _3554, 1.0);
    float _3566 = precise::clamp(_3564, 0.0, 1.0);
    float _3568 = _3538;
    float _3570 = _3530;
    float _3572 = _3544;
    float _3574 = _3566;
    if (!_3524)
    {
        _3568 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3576 = _3568;
    float _3578 = _3576;
    float _3580 = _3576;
    if (!_3524)
    {
        _3360 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3582 = _3360;
    out.m_99.x = _3556;
    out.m_99.y = _3558;
    out.m_99.z = _3560;
    out.m_99.w = _3550;
    float _3584 = _3566 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3586 = _3584;
    float _3588 = _3582;
    float _3590 = _3582;
    if (!_3524)
    {
        _3570 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3592 = _3570;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3524)
    {
        _3572 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3598 = _3572;
    out.m_101.x = _3584;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3524)
    {
        _3574 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3604 = _3574;
    float _3606 = _3604;
    float _3608 = _3604;
    if (!_3524)
    {
        _3586 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3610 = _3586;
    bool _3612 = !_3524;
    float _3614 = _3610;
    float _3616 = _3610;
    if (!_3612)
    {
        bool _3618 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3620 = isnan(_2266);
        bool _3622 = _3618 || _3620;
        bool _3624 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3626 = _3622 || _3624;
        if (!_3626)
        {
            float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3630 = _2266 + _3628;
            float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3634 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3632;
            float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3640 = 1.0 / _3634;
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3644 = _3642 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3658 = _3630 * _3640;
            float _3660 = precise::clamp(_3658, 0.0, 1.0);
            float _3662 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3664 = _3662 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3666 = fma(_3660, _3638, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3668 = fma(_3660, _3664, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3670 = fma(_3660, _3644, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3672 = fma(_3660, _3648, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3674 = fma(_3660, _3652, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3676 = fma(_3660, _3656, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3590 = _3666;
            _3608 = _3674;
            _3580 = _3670;
            _3602 = _3672;
            _3596 = _3668;
            _3616 = _3676;
            _3678 = true;
        }
        else
        {
            bool _3680 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3682 = isnan(_2266);
            bool _3684 = _3680 || _3682;
            bool _3686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3688 = _3684 || _3686;
            if (!_3688)
            {
                _3578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3690 = _3578;
            _3580 = _3690;
            if (!_3688)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3692 = _3588;
            _3590 = _3692;
            if (!_3688)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3694 = _3594;
            _3596 = _3694;
            if (!_3688)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3696 = _3600;
            _3602 = _3696;
            if (!_3688)
            {
                _3606 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3698 = _3606;
            _3608 = _3698;
            if (!_3688)
            {
                _3614 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3700 = _3614;
            bool _3702 = !_3688;
            _3616 = _3700;
            if (!_3702)
            {
                bool _3704 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3706 = isnan(_2266);
                bool _3708 = _3704 || _3706;
                bool _3710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3712 = _3708 || _3710;
                if (!_3712)
                {
                    float _3714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3716 = _2266 + _3714;
                    float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3720 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3718;
                    float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3726 = 1.0 / _3720;
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3730 = _3728 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3742 = _3740 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3744 = _3716 * _3726;
                    float _3746 = precise::clamp(_3744, 0.0, 1.0);
                    float _3748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3750 = _3748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3752 = fma(_3746, _3724, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3754 = fma(_3746, _3750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3756 = fma(_3746, _3730, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3758 = fma(_3746, _3734, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3760 = fma(_3746, _3738, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3762 = fma(_3746, _3742, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3590 = _3752;
                    _3608 = _3760;
                    _3580 = _3756;
                    _3602 = _3758;
                    _3596 = _3754;
                    _3616 = _3762;
                    _3678 = true;
                }
                else
                {
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3608 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3616 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3678 = false;
    float _3764 = _3590;
    float _3766 = _3608;
    float _3768 = _3580;
    float _3770 = _3602;
    float _3772 = _3596;
    float _3774 = _3616;
    float _3776 = fma(_3470, -0.5, 0.5);
    float _3778 = precise::clamp(_3776, 0.0, 1.0);
    float _3780 = -_3764;
    float _3782 = _3780 + _3766;
    float _3784 = _3540 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3786 = -_3768;
    float _3788 = _3786 + _3770;
    out.m_103.x = 0.0;
    float _3790 = fma(_3778, _3782, _3764);
    float _3792 = fma(_3778, _3788, _3768);
    out.m_63.x = _3784;
    float _3794 = -_3772;
    float _3796 = _3794 + _3774;
    float _3798 = _3790 * 0.586610972881317138671875;
    bool _3800 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3802 = fma(_3778, _3796, _3772);
    float _3804 = fma(_3792, 0.298911988735198974609375, _3798);
    bool _3806 = _2176 > 0.0;
    bool _3808 = isnan(_2176);
    bool _3810 = _3806 || _3808;
    bool _3812 = isnan(0.0);
    bool _3814 = _3810 || _3812;
    float _3816 = fma(_3802, 0.114477999508380889892578125, _3804);
    float _3818 = -_3816;
    float _3820 = _3790 + _3818;
    float _3822 = -_3816;
    float _3824 = _3792 + _3822;
    float _3826 = -_3816;
    float _3828 = _3802 + _3826;
    float _3830 = fma(_3820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    float _3832 = fma(_3824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    float _3834 = fma(_3828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    bool _3836 = !_3800;
    if (!_3836)
    {
        float _3838 = -_1905;
        float _3840 = _3838 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3842 = -_1907;
        float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3846 = -_1909;
        float _3848 = _3846 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3850 = _3840 * _3840;
        float _3852 = fma(_3844, _3844, _3850);
        float _3854 = fma(_3848, _3848, _3852);
        float _3856 = sqrt(_3854);
        float _3858 = rsqrt(_3854);
        float _3860 = -_3856;
        float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3864 = _3862 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3866 = precise::clamp(_3864, 0.0, 1.0);
        float _3868 = _3844 * _3858;
        float _3870 = _3840 * _3858;
        float _3872 = abs(_3866);
        float _3874 = log2(_3872);
        float _3876 = _3848 * _3858;
        float _3878 = _3868 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3880 = _3470 * _3870;
        float _3882 = -_3870;
        float _3884 = -_3878;
        float _3886 = fma(_3882, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3884);
        float _3888 = fma(_3482, _3868, _3880);
        float _3890 = -_3876;
        float _3892 = fma(_3890, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3886);
        float _3894 = fma(_3472, _3876, _3888);
        float _3896 = precise::clamp(_3894, 0.0, 1.0);
        float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3900 = _3892 + _3898;
        float _3902 = _3874 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3904 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3906 = precise::clamp(_3904, 0.0, 1.0);
        float _3908 = exp2(_3902);
        float _3910 = _3908 * _3906;
        float _3912 = _3896 * _3910;
        float _3914 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3916 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3918 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3914;
        out.m_103.y = _3916;
        out.m_103.z = _3918;
    }
    out.m_105.x = _3832;
    out.m_105.y = _3830;
    out.m_105.z = _3834;
    if (_3814)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3920 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3920;
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
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3678 = false;
    bool _618 = false;
    bool _390 = false;
    bool _228 = false;
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
        float _3988 = as_type<float>(_148);
        out.gl_Position.z = _3988;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4043 = as_type<float>(_174);
        out.gl_Position.z = _4043;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _226;
    if (!_206)
    {
        float _210 = in.m_67.x;
        float _212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _216 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _218 = _216 * _212;
        float _220 = floor(_218);
        float _222 = -_220;
        float _224 = _218 + _222;
        _226 = _224;
        _228 = true;
    }
    else
    {
        _226 = _186;
    }
    _228 = false;
    float _230 = _226;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = _230 + _232;
    bool _236 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_230);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _230 + _248;
    bool _252 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _254 = isnan(_230);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _274 = isnan(_230);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_246;
    float _286 = _284 + 1.0;
    float _288 = 1.0 / _270;
    float _290 = _282 * _286;
    float _292 = -_282;
    float _294 = _292 + 1.0;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _302 = 1.0 / _266;
    float _304 = _262 * _294;
    float _306 = -_262;
    float _308 = _306 + 1.0;
    float _310 = _250 * _288;
    float _312 = _234 * _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = fma(_298, _312, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _324 = fma(_316, _312, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = fma(_320, _312, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _328 = _322 * _304;
    float _330 = _324 * _304;
    float _332 = _326 * _304;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _346 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].x, _328);
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].y, _330);
    float _350 = fma(_336, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _352 = fma(_340, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _354 = fma(_344, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[143].z, _332);
    float _358 = fma(_350, _290, _346);
    float _360 = fma(_352, _290, _348);
    float _362 = fma(_354, _290, _356);
    float _364 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].x, _358);
    float _366 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].y, _360);
    float _368 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[145].z, _362);
    bool _370 = !_300;
    float _388;
    if (!_370)
    {
        float _372 = in.m_67.x;
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _376 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        _388 = _186;
    }
    _390 = false;
    float _392 = _388;
    float _394 = in.m_69.x;
    float _396 = in.m_69.y;
    float _398 = in.m_69.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _402 = _392 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _416 = 1.0 / _406;
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _420 = 1.0 / _414;
    float _422 = _368 * _398;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _426 = _392 + _424;
    float _428 = 1.0 / _410;
    float _430 = _402 * _416;
    bool _432 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _434 = isnan(_392);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _446 = _392 + _444;
    float _448 = _366 * _396;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _450;
    float _454 = _364 * _394;
    float _456 = -_442;
    float _458 = _456 + 1.0;
    float _460 = _426 * _420;
    bool _462 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _464 = isnan(_392);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    bool _474 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _476 = isnan(_392);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = _472 * _458;
    bool _488 = _392 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_392);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = _446 * _428;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _502;
    float _506 = -_484;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _518 = -_472;
    float _520 = _518 + 1.0;
    float _522 = fma(_504, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _524 = _498 * _508;
    float _526 = fma(_452, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _528 = fma(_512, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _530 = _484 * _520;
    float _532 = _522 * _524;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = _526 * _524;
    float _540 = _528 * _524;
    float _542 = -_498;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _550 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].x, _538);
    float _552 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].y, _532);
    float _554 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[107].z, _540);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _556;
    float _560 = fma(_516, _460, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _562 = fma(_548, _460, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _564 = fma(_536, _460, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _570;
    float _574 = fma(_560, _530, _550);
    float _576 = fma(_558, _430, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _578 = fma(_568, _430, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _580 = fma(_572, _430, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _582 = fma(_562, _530, _552);
    float _584 = fma(_564, _530, _554);
    float _586 = fma(_576, _486, _574);
    float _588 = fma(_578, _486, _582);
    float _590 = fma(_580, _486, _584);
    float _592 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].x, _586);
    float _594 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].y, _588);
    float _596 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[110].z, _590);
    bool _598 = !_418;
    float _616;
    if (!_598)
    {
        float _600 = in.m_67.x;
        float _602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _604 = _600 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _608 = _606 * _602;
        float _610 = floor(_608);
        float _612 = -_610;
        float _614 = _608 + _612;
        _616 = _614;
        _618 = true;
    }
    else
    {
        _616 = _186;
    }
    _618 = false;
    float _620 = _616;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _620 + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _640 = isnan(_620);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = 1.0 / _628;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _656 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _658 = isnan(_620);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    bool _668 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _670 = 1.0 / _636;
    float _672 = _632 * _650;
    bool _674 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _676 = isnan(_620);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _654;
    float _688 = -_648;
    float _690 = _688 + 1.0;
    float _692 = fma(_672, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _698 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _700 = isnan(_620);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_684;
    float _712 = _710 + 1.0;
    float _714 = _684 * _690;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _720 = 1.0 / _696;
    float _722 = -_708;
    float _724 = _722 + 1.0;
    float _726 = _666 * _712;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _728;
    float _732 = _718 * _670;
    float _734 = _648 * _724;
    float _736 = _692 * _726;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _740 = _620 + _738;
    float _742 = -_666;
    float _744 = _742 + 1.0;
    bool _746 = _620 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _748 = isnan(_620);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _730 * _686;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _766 = _620 + _764;
    float _768 = fma(_732, _740, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _770 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[115].x, _736);
    float _772 = -_756;
    float _774 = _772 + 1.0;
    float _776 = _762 * _720;
    float _778 = fma(_758, _766, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _782 = _620 + _780;
    float _784 = fma(_768, _714, _770);
    float _786 = _708 * _774;
    float _788 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _790 = fma(_776, _782, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _792 = fma(_778, _734, _784);
    float _794 = _596 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = fma(_790, _786, _792);
    float _800 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[119].x, _798);
    float _806 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _808 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _806;
    out.m_71.y = _796;
    out.m_71.z = _802;
    out.m_71.w = _808;
    bool _810 = !_668;
    if (!_810)
    {
        float _812 = in.m_67.x;
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _816 = _812 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _818 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _820 = _818 * _814;
        float _822 = floor(_820);
        float _824 = -_822;
        float _826 = _820 + _824;
        _208 = _826;
    }
    float _828 = _208;
    float _830 = in.m_56.x;
    float _832 = in.m_56.y;
    float _834 = in.m_56.z;
    float _836 = _832 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _838 = _832 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _840 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _842 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[6].x, _838);
    float _844 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[4].z, _840);
    float _846 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _848 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _850 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _854 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _856 = floor(_852);
    float _858 = floor(_854);
    float _860 = -_856;
    float _862 = _852 + _860;
    float _864 = -_858;
    float _866 = _854 + _864;
    float2 _5200 = float2(_862, _866);
    float _868 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5200, float2(0.0), isnan(_5200)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5200, float2(0.0), isnan(_5200)), level(0.0)).x;
    float _870 = in.m_67.x;
    float _872 = in.m_67.y;
    float _874 = _832 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = in.m_67.z;
    float _878 = in.m_67.w;
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _882 = _880 != 0;
    float _884 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _888 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _890 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _892 = _870 * 2.0;
    float _894 = _870 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _896 = _872 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _898 = _876 * 2.0;
    float _900 = floor(_892);
    float _902 = -_886;
    float _904 = fma(_894, 2.0, _902);
    float _906 = fma(_830, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _910 = _874;
    float _912 = _834;
    int _914 = 2;
    if (!_882)
    {
        float _916 = in.m_67.z;
        _910 = _916;
    }
    float _918 = _910;
    float _920 = _872 * 2.0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _928 = _926 != 0;
    float _930 = fma(_896, -2.0, _908);
    float _932 = floor(_898);
    float _934 = _872 + _870;
    float _936 = fma(_834, (*spvDescriptorSet0.vp_c10)._m0[5].z, _906);
    bool _938 = !_928;
    int _940 = _938 ? 0 : 1;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _944 = !_924;
    int _946 = _944 ? 0 : 1;
    float _948 = _934 + (-1.0);
    float _950 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _952 = _900 > 0.0;
    float _954 = floor(_920);
    bool _956 = _900 >= 0.0;
    bool _958 = isnan(_900);
    bool _960 = _956 || _958;
    bool _962 = isnan(0.0);
    bool _964 = _960 || _962;
    float _966 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _968 = _948;
    if (!_882)
    {
        _968 = _872;
    }
    float _970 = _968;
    float _972 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _984 = _982 != 0;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _988 = _932 >= 0.0;
    bool _990 = isnan(_932);
    bool _992 = _988 || _990;
    bool _994 = isnan(0.0);
    bool _996 = _992 || _994;
    float _998 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1000 = int(_998);
    float _1002 = _970;
    bool _1004 = _984;
    if (_882)
    {
        _1002 = _870;
    }
    float _1006 = _1002;
    float _1008 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _930);
    int _1010 = _996 ? 0 : 1;
    float _1012 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1014 = _932 > 0.0;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1018 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1020 = log2(_1018);
    int _1022 = _964 ? 0 : 1;
    float _1024 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1012);
    bool _1026 = !_976;
    int _1028 = _1026 ? 0 : 1;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1032 = _954 > 0.0;
    float _1034 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1024);
    bool _1036 = _954 >= 0.0;
    bool _1038 = isnan(_954);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(0.0);
    bool _1044 = _1040 || _1042;
    float _1046 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1048 = _918;
    float _1050 = _1008;
    if (!_882)
    {
        _912 = _918;
    }
    float _1052 = _912;
    float _1054 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1030);
    float _1056 = _1052;
    if (_882)
    {
        _1056 = _872;
    }
    float _1058 = _1056;
    float _1060 = -_942;
    float _1062 = fma(_1046, 2.0, _1060);
    int _1064 = ~_1010;
    int _1066 = _1064 + 1;
    int _1068 = _1066 + 1;
    float _1070 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1072 = int(_1070);
    int _1074 = _1068;
    if (!_1014)
    {
        int _1076 = ~_1010;
        int _1078 = _1076 + 1;
        _1074 = _1078;
    }
    int _1080 = _1074;
    float _1082 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1084 = abs(_1028);
    float _1086 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1016);
    float _1088 = float(_1000);
    float _1090 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1092 = float(_1084);
    float _1094 = -_130;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1062);
    float _1098 = float(_1080);
    float _1100 = 1.0 / _1088;
    float _1102 = _1092 * _1098;
    float _1104 = _1020 * _130;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1110 = exp2(_1104);
    float _1112 = fma(_1090, -2.0, _1106);
    if (_882)
    {
        _1048 = _872;
    }
    float _1114 = _1048;
    float _1116 = in.m_73.x;
    float _1118 = in.m_73.y;
    float _1120 = in.m_73.z;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1124 = 1.0 + _1122;
    int _1126 = _1044 ? 0 : 1;
    float _1128 = _1102 * (-2.0);
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].w, _986);
    float _1132 = 1.0 / _1124;
    float _1134 = -_130;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[76].x, _904);
    float _1138 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[11].x, _972);
    int _1140 = ~_1126;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1100 * _130;
    int _1148 = _1144;
    if (!_1032)
    {
        int _1150 = ~_1126;
        int _1152 = _1150 + 1;
        _1148 = _1152;
    }
    int _1154 = _1148;
    float _1156 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1138);
    float _1158 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1108);
    bool _1160 = !_980;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = -_1110;
    float _1166 = _1164 + 1.0;
    float _1168 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1170 = ~_1022;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    float _1176 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1158);
    int _1178 = _1174;
    if (!_952)
    {
        int _1180 = ~_1022;
        int _1182 = _1180 + 1;
        _1178 = _1182;
    }
    int _1184 = _1178;
    float _1186 = 1.0 / _1168;
    int _1188 = abs(_1162);
    float _1190 = _1082 + _1168;
    bool _1192 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1194 = isnan(1.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1200 = _1196 || _1198;
    float _1202 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1086);
    float _1204 = float(_1184);
    float _1206 = fma(_1128, _1116, _1116);
    float _1208 = float(_1188);
    float _1210 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1054);
    bool _1212 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1130);
    float _1224 = float(_1072);
    float _1226 = _1208 * _1204;
    float _1228 = _1220 ? _1166 : 0.0;
    float _1230 = _870 + (-0.5);
    bool _1232 = !_984;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1224 * _130;
    float _1238 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1112);
    float _1240 = _1190 * _1186;
    float _1242 = _1240 * 0.5;
    if (_1200)
    {
        float _1244 = _1228 * _1132;
        _140 = _1244;
    }
    float _1246 = _140;
    float _1248 = fma(_966, _1128, _966);
    float _1250 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    int _1252 = abs(_1234);
    float _1254 = _872 + _876;
    float _1256 = fma(_1248, _1246, _1250);
    float _1258 = float(_1154);
    float _1260 = _1254 + (-1.0);
    float _1262 = float(_1252);
    float _1264 = _1226 * (-2.0);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1270 = _870 + _876;
    float _1272 = _1262 * _1258;
    float _1274 = _872 + (-0.5);
    float _1276 = fma(_1264, _1118, _1118);
    float _1278 = fma(_1268, _1264, _1268);
    float _1280 = _1270 + (-1.0);
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1276);
    float _1284 = _1272 * (-2.0);
    float _1286 = _1266 * 6.283185482025146484375;
    float _1288 = sin(_1286);
    float _1290 = fma(_1278, _1246, _1282);
    float _1292 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1296 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1294);
    float _1298 = fma(_1284, _1120, _1120);
    float _1300 = _876 + (-0.5);
    float _1302 = _1290 * 0.15915493667125701904296875;
    float _1304 = fma(_1292, _1284, _1292);
    float _1306 = in.m_75.x;
    float _1308 = in.m_75.y;
    float _1310 = in.m_75.z;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1298);
    float _1314 = 1.0 / _1296;
    float _1316 = fma(_1304, _1246, _1312);
    float _1318 = _1316 * 0.15915493667125701904296875;
    float _1320 = _1302 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    float _1324 = _1302 * 6.283185482025146484375;
    float _1326 = cos(_1324);
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1330 = _1314 * _1328;
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1310);
    float _1336 = _1318 * 6.283185482025146484375;
    float _1338 = cos(_1336);
    bool _1340 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1342 = _1288 * _1322;
    float _1344 = _1334 * _884;
    float _1346 = _1266 * 6.283185482025146484375;
    float _1348 = cos(_1346);
    if (!_1332)
    {
        _914 = 1;
    }
    int _1350 = _914;
    float _1352 = _1318 * 6.283185482025146484375;
    float _1354 = sin(_1352);
    float _1356 = _1288 * _1326;
    float _1358 = _1288 * _1338;
    float _1360 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1362 = _1322 * _1338;
    float _1364 = _950 + _1360;
    float _1366 = _1348 * _1326;
    float _1368 = _1348 * _1322;
    bool _1370 = !_1332;
    int _1372 = _1370 ? 0 : 1;
    float _1374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1308);
    float _1376 = _1348 * _1338;
    float _1378 = _1326 * _1338;
    int _1380 = _1350;
    if (!_1340)
    {
        _1380 = _1372;
    }
    int _1382 = _1380;
    float _1384 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1386 = fma(_1354, _1366, _1342);
    float _1388 = fma(_1354, _1342, _1366);
    float _1390 = -_1368;
    float _1392 = fma(_1354, _1356, _1390);
    float _1394 = -_1356;
    float _1396 = fma(_1354, _1368, _1394);
    float _1398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1400 = _888 * _1374;
    float _1402 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1384);
    float _1404 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1406 = _890 * _1398;
    float _1408 = _1376 * _1400;
    float _1410 = -_1400;
    float _1412 = _1354 * _1410;
    float _1414 = _1358 * _1400;
    float _1416 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1404);
    float _1418 = fma(_1386, _1406, _1408);
    float _1420 = fma(_1378, _1406, _1412);
    float _1422 = fma(_1392, _1406, _1414);
    float _1424 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1402);
    float _1426 = fma(_1396, _1344, _1418);
    float _1428 = fma(_1362, _1344, _1420);
    float _1430 = fma(_1388, _1344, _1422);
    float _1432 = fma(_850, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1416);
    float _1434 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1438 = _1424 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1440 = _1382 << 6;
    float _1442 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1434);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1436);
    float _1446 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1448 = trunc(_1438);
    int _1450 = int(_1448);
    float _1452 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1442);
    float _1454 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    int _1456 = _1440 + 48;
    uint _1459 = uint(int(uint(_1456) >> uint(2)));
    uint _1461 = uint(int(uint(int(_1459)) >> uint(2)));
    int _1463 = int(_1459) & 3;
    float _1465 = (*spvDescriptorSet0.vp_c15)._m0[int(_1461)][_1463];
    int _1467 = int(_1459) + 1;
    uint _1469 = uint(int(uint(_1467) >> uint(2)));
    int _1471 = _1467 & 3;
    float _1473 = (*spvDescriptorSet0.vp_c15)._m0[int(_1469)][_1471];
    float _1475 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1477 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1479 = trunc(_1446);
    int _1481 = int(_1479);
    float _1483 = _850 + _1475;
    float _1485 = _848 + _1477;
    int _1487 = _1440 + 56;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    uint _1491 = uint(int(uint(int(_1489)) >> uint(2)));
    int _1493 = int(_1489) & 3;
    float _1495 = (*spvDescriptorSet0.vp_c15)._m0[int(_1491)][_1493];
    int _1497 = int(_1489) + 1;
    uint _1499 = uint(int(uint(_1497) >> uint(2)));
    int _1501 = _1497 & 3;
    float _1503 = (*spvDescriptorSet0.vp_c15)._m0[int(_1499)][_1501];
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1507 = _1483 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1511 = _1485 + _1509;
    int _1513 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1515 = _1450 + _1513;
    int _1517 = _1515 + 1;
    float _1519 = _1507 * _1507;
    int _1521 = _1440 + 64;
    uint _1523 = uint(int(uint(_1521) >> uint(2)));
    uint _1525 = uint(int(uint(int(_1523)) >> uint(2)));
    int _1527 = int(_1523) & 3;
    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[int(_1525)][_1527];
    int _1531 = int(_1523) + 1;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    int _1535 = _1531 & 3;
    float _1537 = (*spvDescriptorSet0.vp_c15)._m0[int(_1533)][_1535];
    bool _1539 = _1517 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1541 = fma(_1511, _1511, _1519);
    int _1543 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1545 = _1481 + _1543;
    int _1547 = _1545 + 1;
    float _1549 = sqrt(_1541);
    int _1551 = _1440 + 72;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    uint _1555 = uint(int(uint(int(_1553)) >> uint(2)));
    int _1557 = int(_1553) & 3;
    float _1559 = (*spvDescriptorSet0.vp_c15)._m0[int(_1555)][_1557];
    int _1561 = int(_1553) + 1;
    uint _1563 = uint(int(uint(_1561) >> uint(2)));
    int _1565 = _1561 & 3;
    float _1567 = (*spvDescriptorSet0.vp_c15)._m0[int(_1563)][_1565];
    int _1569 = _1517 | _1547;
    bool _1571 = _1569 < 0;
    bool _1573 = _1571 || _1539;
    float _1575 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1577 = _1440 + 96;
    uint _1579 = uint(int(uint(_1577) >> uint(2)));
    uint _1581 = uint(int(uint(int(_1579)) >> uint(2)));
    int _1583 = int(_1579) & 3;
    float _1585 = (*spvDescriptorSet0.vp_c15)._m0[int(_1581)][_1583];
    int _1587 = int(_1579) + 1;
    uint _1589 = uint(int(uint(_1587) >> uint(2)));
    int _1591 = _1587 & 3;
    float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
    bool _1595 = _1547 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1597 = _1595 || _1573;
    float _1599 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1575);
    bool _1601 = _1549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1603 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1599);
    int _1605 = _1440 + 104;
    uint _1607 = uint(int(uint(_1605) >> uint(2)));
    uint _1609 = uint(int(uint(int(_1607)) >> uint(2)));
    int _1611 = int(_1607) & 3;
    float _1613 = (*spvDescriptorSet0.vp_c15)._m0[int(_1609)][_1611];
    int _1615 = int(_1607) + 1;
    uint _1617 = uint(int(uint(_1615) >> uint(2)));
    int _1619 = _1615 & 3;
    float _1621 = (*spvDescriptorSet0.vp_c15)._m0[int(_1617)][_1619];
    float _1623 = _1603 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1625 = as_type<int>(_1599);
    int _1627 = _1547;
    int _1629 = as_type<int>(_1623);
    float _1631 = _1426;
    float _1633 = _1485;
    float _1635 = as_type<float>(_1440);
    if (!_1597)
    {
        int _1637 = _1547 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1639 = _1637 + _1517;
        _1625 = _1639;
    }
    int _1641 = _1625;
    float _1643 = _950 + _1623;
    float _1645 = _1643;
    if (!_1597)
    {
        int _1647 = _1641 << 2;
        _1627 = _1647;
    }
    int _1649 = _1627;
    int _1651 = _1649;
    if (!_1597)
    {
        uint _1653 = uint(int(uint(_1641) >> uint(2)));
        _1629 = int(_1653);
    }
    int _1655 = _1629;
    float _1657 = as_type<float>(_1655);
    if (!_1597)
    {
        int _1659 = 12 & _1649;
        _1651 = _1659;
    }
    int _1661 = _1651;
    if (!_1601)
    {
        _1631 = _1483;
    }
    float _1663 = _1631;
    bool _1665 = !_1601;
    float _1667 = _1663;
    float _1669 = _1559;
    if (!_1665)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1675 = _1549 + _1673;
        float _1677 = rsqrt(_1541);
        float _1679 = _1675 * _1671;
        float _1681 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1683 * 6.283185482025146484375;
        float _1687 = cos(_1685);
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = sin(_1689);
        float _1693 = _1687 + (-1.0);
        float _1695 = _1693 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1697 = fma(_1691, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1699 = fma(_1643, _1687, _1695);
        float _1701 = _1677 * _1697;
        float _1703 = fma(_1511, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1705 = fma(_1507, _1701, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1645 = _1699;
        _1633 = _1703;
        _1667 = _1705;
    }
    float _1707 = _1645;
    float _1709 = _1633;
    float _1711 = _1667;
    float _1713 = _1711;
    if (!_1597)
    {
        int _1715 = _1655 << 4;
        int _1717 = _1715 + _1661;
        _1657 = as_type<float>(_1717);
    }
    float _1719 = _1657;
    float _1721 = -_950;
    float _1723 = _1721 + _1707;
    int _1725 = _1440 + 80;
    uint _1727 = uint(int(uint(_1725) >> uint(2)));
    uint _1729 = uint(int(uint(int(_1727)) >> uint(2)));
    int _1731 = int(_1727) & 3;
    float _1733 = (*spvDescriptorSet0.vp_c15)._m0[int(_1729)][_1731];
    int _1735 = int(_1727) + 1;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    int _1739 = _1735 & 3;
    float _1741 = (*spvDescriptorSet0.vp_c15)._m0[int(_1737)][_1739];
    float _1743 = -_848;
    float _1745 = _1743 + _1709;
    float _1747 = -_850;
    float _1749 = _1747 + _1711;
    float _1751 = _1723 * _1723;
    float _1753 = _1364 * _1593;
    float _1755 = _1364 * _1537;
    float _1757 = fma(_1745, _1745, _1751);
    int _1759 = _1440 + 88;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    uint _1763 = uint(int(uint(int(_1761)) >> uint(2)));
    int _1765 = int(_1761) & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    int _1769 = int(_1761) + 1;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    int _1773 = _1769 & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    float _1777 = fma(_848, _1585, _1753);
    float _1779 = _1751;
    if (!_1597)
    {
        float _1781 = floor(_1438);
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = fma(_1749, _1749, _1757);
    float _1787 = fma(_850, _1613, _1777);
    float _1789 = _1364 * _1473;
    float _1791 = fma(_848, _1529, _1755);
    float _1793 = _1719;
    float _1795 = _1791;
    float _1797 = _1785;
    float _1799 = _1783;
    if (!_1597)
    {
        int _1801 = as_type<int>(_1719) + 400;
        uint _1803 = uint(int(uint(_1801) >> uint(2)));
        uint _1805 = uint(int(uint(int(_1803)) >> uint(2)));
        int _1807 = int(_1803) & 3;
        float _1809 = (*spvDescriptorSet0.vp_c15)._m0[int(_1805)][_1807];
        _1793 = _1809;
    }
    float _1811 = _1793;
    float _1813 = _1787 + _1621;
    float _1815 = sqrt(_1785);
    float _1817 = fma(_848, _1465, _1789);
    float _1819 = fma(_850, _1559, _1791);
    float _1821 = fma(_850, _1495, _1817);
    float _1823 = _1819 + _1567;
    float _1825 = _1777;
    float _1827 = _1817;
    if (!_1597)
    {
        float _1829 = floor(_1446);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = _1821 + _1503;
    bool _1835 = _1815 > 0.0;
    float _1837 = 1.0 / _1813;
    if (!_1835)
    {
        _1827 = _1709;
    }
    float _1839 = _1827;
    float _1841 = _1839;
    if (!_1835)
    {
        _1795 = _1707;
    }
    float _1843 = _1795;
    bool _1845 = !_1835;
    float _1847 = _1843;
    float _1849 = _1843;
    float _1851 = _1811;
    if (!_1845)
    {
        float _1853 = _202 * _202;
        float _1855 = rsqrt(_1785);
        float _1857 = fma(_200, _200, _1853);
        float _1859 = fma(_204, _204, _1857);
        float _1861 = sqrt(_1859);
        float _1863 = _1745 * _1855;
        float _1865 = _1723 * _1855;
        float _1867 = _1749 * _1855;
        bool _1869 = _1861 > 0.0;
        float _1871 = _1861;
        _1797 = _1855;
        if (!_1869)
        {
            _1871 = _1709;
        }
        float _1873 = _1871;
        _1841 = _1873;
        if (!_1869)
        {
            _1847 = _1707;
        }
        float _1875 = _1847;
        bool _1877 = !_1869;
        _1849 = _1875;
        if (!_1877)
        {
            float _1879 = rsqrt(_1859);
            float _1881 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1883 = _202 * _1879;
            float _1885 = _200 * _1879;
            float _1887 = _204 * _1879;
            float _1889 = _1865 * _1883;
            float _1891 = fma(_1863, _1885, _1889);
            float _1893 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1895 = fma(_1867, _1887, _1891);
            float _1897 = _1895 * _1893;
            float _1899 = fma(_200, _1897, _1709);
            float _1901 = fma(_202, _1897, _1707);
            float _1903 = fma(_204, _1897, _1711);
            _1849 = _1901;
            _1841 = _1899;
            _1713 = _1903;
            _1669 = _1889;
        }
    }
    float _1905 = _1849;
    float _1907 = _1841;
    float _1909 = _1713;
    float _1911 = _1669;
    float _1913 = _1797;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = _1833 * _1837;
    float _1923 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1915);
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1917);
    float _1927 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1919);
    float _1929 = _1823 * _1837;
    float _1931 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1923);
    bool _1933 = _1921 >= 0.0;
    float _1935 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1925);
    float _1937 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1939 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1941 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1943 = _1921 <= 1.0;
    bool _1945 = _1943 && _1933;
    float _1947 = fma(_1907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1937);
    float _1949 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1951 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1953 = _1935 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1955 = _1929 >= 0.0;
    bool _1957 = _1955 && _1945;
    float _1959 = fma(_1909, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1947);
    float _1961 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1951);
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1967 = _1929 <= 1.0;
    bool _1969 = _1967 && _1957;
    float _1971 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1973 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1961);
    float _1975 = -_1965;
    float _1977 = fma(_1975, _1963, 1.0);
    float _1979 = _1364 * _1741;
    float _1981 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1973);
    float _1985 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1987 = _1911;
    float _1989 = _1913;
    if (!_1597)
    {
        float _1991 = rint(_1811);
        float _1993 = precise::max(_1991, 0.0);
        uint _1995 = uint(_1993);
        uint _1997 = clamp(_1995, 0u, 65535u);
        _1987 = as_type<float>(_1997);
    }
    float _1999 = _1987;
    float _2001 = fma(_848, _1733, _1979);
    float _2003 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1981);
    float _2005 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1985);
    float _2007 = _2003;
    float _2009 = _1999;
    if (!_1597)
    {
        float _2011 = -_1831;
        float _2013 = _1446 + _2011;
        _1989 = _2013;
    }
    float _2015 = _1989;
    float _2017 = fma(_850, _1767, _2001);
    float _2019 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2003);
    float _2021 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2005);
    float _2023 = log2(_1977);
    if (_1969)
    {
        float _2025 = float(_1382);
        _1851 = _2025;
    }
    float _2027 = _1851;
    float _2029 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2019);
    float _2031 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2021);
    float _2033 = _2017 + _1775;
    if (!_1597)
    {
        float _2035 = -_1783;
        float _2037 = _1438 + _2035;
        _2007 = _2037;
    }
    float _2039 = _2007;
    float _2041 = 1.0 / _1983;
    float _2043 = _2033 * _1837;
    float _2045 = _1985;
    if (_1969)
    {
        float _2047 = rint(_2027);
        float _2049 = precise::max(_2047, 0.0);
        uint _2051 = uint(_2049);
        uint _2053 = clamp(_2051, 0u, 65535u);
        _2045 = as_type<float>(_2053);
    }
    float _2055 = _2045;
    float _2057 = _2023 * 0.693147182464599609375;
    float _2059 = _2031 * _2041;
    float _2061 = _2029 * _2041;
    float _2063 = _2057 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2065 = fma(_2059, 0.5, 0.5);
    float _2067 = fma(_2061, -0.5, 0.5);
    float _2069 = _2033;
    float _2071 = _2061;
    float _2073 = _2063;
    if (!_1597)
    {
        float3 _7147 = float3(_2039, _2015, float(as_type<int>(_1999)));
        float3 _7151 = select(_7147, float3(0.0), isnan(_7147));
        float _2075 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7151.xy, uint(rint(_7151.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7151.xy, uint(rint(_7151.z)), level(0.0)).x;
        _2069 = _2075;
    }
    float _2077 = _2069;
    float _2079 = _1929;
    if (_1969)
    {
        float3 _7166 = float3(_1921, _1929, float(as_type<int>(_2055)));
        float3 _7168 = select(_7166, float3(0.0), isnan(_7166));
        float _2081 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7168.xy, uint(rint(_7168.z)), _2043, level(0.0));
        _2079 = _2081;
    }
    float _2083 = _2079;
    float3 _7178 = float3(_2065, _2067, _2063);
    float _2085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7178, float3(0.0), isnan(_7178)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7178, float3(0.0), isnan(_7178)), level(0.0)).x;
    float3 _7187 = float3(_2065, _2067, _2063);
    float4 _2088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7187, float3(0.0), isnan(_7187)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7187, float3(0.0), isnan(_7187)), level(0.0)).xyzw;
    float _2090 = _2088.x;
    float _2092 = _2088.y;
    float _2094 = _2088.z;
    float _2096 = _2088.w;
    float _2098 = in.m_77.x;
    bool _2100 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2108 = _2104 || _2106;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2112 = _2110 != 0;
    if (_1597)
    {
        _2009 = 1.0;
    }
    float _2114 = _2009;
    float _2116 = _2114;
    if (_2108)
    {
        _1799 = 1.0;
    }
    float _2118 = _1799;
    float _2120 = _2118;
    if (!_2112)
    {
        _2071 = _2098;
    }
    float _2122 = _2071;
    float _2124 = _2122;
    if (!_2108)
    {
        float _2126 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2128 = _2126 * 0.15915493667125701904296875;
        float _2130 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2134 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2132;
        float _2136 = _2128 * 6.283185482025146484375;
        float _2138 = cos(_2136);
        float _2140 = _2130 * 0.15915493667125701904296875;
        float _2142 = _2128 * 6.283185482025146484375;
        float _2144 = sin(_2142);
        float _2146 = 1.0 / _2138;
        float _2148 = _2140 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = _2144 * _2146;
        float _2154 = _2140 * 6.283185482025146484375;
        float _2156 = sin(_2154);
        float _2158 = _2150 * _2152;
        float _2160 = 1.0 / _2134;
        float _2162 = 1.0 / _2158;
        float _2164 = _2156 * _2162;
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = fma(_1330, _2164, _2166);
        float _2170 = _2168 * _2160;
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        _2073 = _2128;
        _2120 = _2172;
    }
    float _2174 = _2073;
    float _2176 = _2120;
    float _2178 = _2174;
    if (!_1597)
    {
        int _2180 = _1641 << 4;
        int _2182 = _2180 + 2048;
        uint _2184 = uint(int(uint(_2182) >> uint(2)));
        uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
        int _2188 = int(_2184) & 3;
        float _2190 = (*spvDescriptorSet0.vp_c15)._m0[int(_2186)][_2188];
        int _2192 = int(_2184) + 1;
        uint _2194 = uint(int(uint(_2192) >> uint(2)));
        int _2196 = _2192 & 3;
        float _2198 = (*spvDescriptorSet0.vp_c15)._m0[int(_2194)][_2196];
        int _2200 = _2182 + 8;
        uint _2202 = uint(int(uint(_2200) >> uint(2)));
        uint _2204 = uint(int(uint(int(_2202)) >> uint(2)));
        int _2206 = int(_2202) & 3;
        float _2208 = (*spvDescriptorSet0.vp_c15)._m0[int(_2204)][_2206];
        int _2210 = int(_2202) + 1;
        uint _2212 = uint(int(uint(_2210) >> uint(2)));
        int _2214 = _2210 & 3;
        float _2216 = (*spvDescriptorSet0.vp_c15)._m0[int(_2212)][_2214];
        float _2218 = _1364 * _2198;
        float _2220 = fma(_848, _2190, _2218);
        float _2222 = fma(_850, _2208, _2220);
        float _2224 = _2222 + _2216;
        float _2226 = precise::clamp(_2224, 0.0, 1.0);
        float _2228 = -_2226;
        float _2230 = _2228 + _2077;
        float _2232 = fma(_2230, 500.0, 1.5);
        float _2234 = exp2(_2232);
        float _2236 = 0.0 + _2234;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        _2116 = _2238;
    }
    float _2240 = _2116;
    float _2242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2244 = _1905 + _2242;
    float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2248 = _1907 + _2246;
    float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2252 = _1909 + _2250;
    float _2254 = trunc(_1146);
    int _2256 = int(_2254);
    float _2258 = _2244 * _2244;
    float _2260 = fma(_2248, _2248, _2258);
    float _2262 = fma(_2252, _2252, _2260);
    float _2264 = rsqrt(_2262);
    float _2266 = sqrt(_2262);
    float _2268 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2270 = _2248 * _2268;
    float _2272 = _2252 * _2268;
    float _2274 = _2270 * _2270;
    float _2276 = _2272 * _2272;
    float _2278 = _2274 + _2276;
    float _2280 = sqrt(_2278);
    bool _2282 = _2280 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2286 = _2280 + _2284;
    float _2288 = _2252;
    float _2290 = _2278;
    float _2292 = _2286;
    float _2294 = _2268;
    float _2296 = _2270;
    float _2298 = _2274;
    float _2300 = _2276;
    if (_2282)
    {
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2288 = _2302;
    }
    float _2304 = _2288;
    if (_2282)
    {
        float _2306 = rsqrt(_2278);
        _2290 = _2306;
    }
    float _2308 = _2290;
    if (_2282)
    {
        float _2310 = _2286 * _2304;
        _2292 = _2310;
    }
    float _2312 = _2292;
    if (_2282)
    {
        float _2314 = _2312 * 0.15915493667125701904296875;
        _2178 = _2314;
    }
    float _2316 = _2178;
    float _2318 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2320 = _2077;
    float _2322 = _2318;
    if (_2282)
    {
        float _2324 = _2316 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        _2320 = _2326;
    }
    float _2328 = _2320;
    float _2330 = precise::max(0.0, _2318);
    float _2332 = _2312;
    if (_2282)
    {
        float _2334 = _2316 * 6.283185482025146484375;
        float _2336 = cos(_2334);
        _2332 = _2336;
    }
    float _2338 = _2332;
    float _2340 = -_2268;
    float _2342 = -_2330;
    float _2344 = fma(_2244, _2340, _2342);
    float _2346 = _2344;
    if (_2282)
    {
        float _2348 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2348;
    }
    float _2350 = _2294;
    float _2352 = _2350;
    float _2354 = _2328;
    if (_2282)
    {
        float _2356 = fma(_2328, _2350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2352 = _2356;
    }
    float _2358 = _2352;
    int _2360 = ~_1072;
    int _2362 = _2360 + 1;
    if (_2282)
    {
        float _2364 = _2308 * _2358;
        _1635 = _2364;
    }
    float _2366 = _1635;
    float _2368 = float(uint(_1072));
    int _2370 = as_type<int>(_2366);
    if (_2282)
    {
        float _2372 = _2338 + (-1.0);
        _2322 = _2372;
    }
    float _2374 = _2322;
    float _2376 = _2374;
    if (_2282)
    {
        float _2378 = _2270 * _2366;
        _2296 = _2378;
    }
    float _2380 = _2296;
    if (_2282)
    {
        float _2382 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2382;
    }
    float _2384 = _2354;
    if (!_2282)
    {
        _2376 = _2272;
    }
    float _2386 = _2376;
    float _2388 = _2386;
    if (_2282)
    {
        float _2390 = _2272 * _2366;
        _2388 = _2390;
    }
    float _2392 = _2388;
    if (_2282)
    {
        float _2394 = _2380 * _2380;
        _2298 = _2394;
    }
    float _2396 = _2298;
    if (_2282)
    {
        float _2398 = fma(_2344, _2338, _2384);
        _2346 = _2398;
    }
    float _2400 = _2346;
    float _2402 = 1.0 / _2368;
    if (_2282)
    {
        float _2404 = _2392 * _2392;
        _2300 = _2404;
    }
    float _2406 = _2300;
    float _2408 = fma(_2400, _2400, _2396);
    float _2410 = _2408 + _2406;
    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2414 = fma(_2266, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2412);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = float(uint(_2256));
    float _2420 = rsqrt(_2410);
    float _2422 = -_2416;
    float _2424 = _2422 + 1.0;
    int _2426 = as_type<int>(_2402) + (-2);
    float _2428 = abs(_2424);
    float _2430 = log2(_2428);
    float _2432 = as_type<float>(_2426) * _2418;
    float _2434 = _2420 * _2380;
    float _2436 = _2420 * _2400;
    float _2438 = _2420 * _2392;
    float _2440 = trunc(_2432);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    float _2446 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2448 = _2392;
    if (_2112)
    {
        float _2450 = in.m_67.x;
        _2448 = _2450;
    }
    float _2452 = _2448;
    float _2454 = -_2446;
    float _2456 = fma(_2436, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2454);
    float _2458 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2460 = -_2438;
    float _2462 = fma(_2460, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2456);
    float _2464 = exp2(_2458);
    float _2466 = fma(_2462, -0.5, 0.5);
    float _2468 = fma(_2462, 0.5, 0.5);
    int _2470 = _2362 * int(_2444);
    int _2472 = _2470 + _2256;
    float _2474 = fma(_2468, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2476 = sqrt(_2466);
    float _2478 = float(uint(_2472));
    float _2480 = _2436 + 1.0;
    float _2482 = fma(_2468, _2474, -0.212114393711090087890625);
    float _2484 = as_type<float>(_2426) * _2478;
    float _2486 = -_2436;
    float _2488 = fma(_2464, _2480, _2486);
    float _2490 = fma(_2468, _2482, 1.570728778839111328125);
    float _2492 = in.m_77.y;
    float _2494 = fma(_2488, 0.5, 0.5);
    float _2496 = trunc(_2484);
    float _2498 = precise::max(_2496, 0.0);
    uint _2500 = uint(_2498);
    float _2502 = _2476 * 0.636619746685028076171875;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2508 = -_2490;
    float _2510 = fma(_2502, _2508, 1.0);
    float2 _7815 = float2(_2510, _2494);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7815, float2(0.0), isnan(_7815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7815, float2(0.0), isnan(_7815)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    if (_2112)
    {
        float _2522 = -_2098;
        float _2524 = _2522 + 1.0;
        _2370 = as_type<int>(_2524);
    }
    int _2526 = _2370;
    if (_2112)
    {
        bool _2528 = _2452 > 0.5;
        _1004 = _2528;
    }
    bool _2530 = _1004;
    float _2532 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2534 = _878 > 0.5;
    float _2536 = 1.0 / _2506;
    if (_2112)
    {
        float _2538 = _2530 ? as_type<float>(_2526) : _2098;
        _2124 = _2538;
    }
    float _2540 = _2124;
    float _2542 = _890 * _2098;
    int _2544 = int(_2444) + int(_2500);
    float _2546 = _888 * _2492;
    int _2548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2550 = _2548 != 0;
    float _2552 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2532);
    float _2554 = -_2546;
    float _2556 = _2554 + 1.0;
    int _2558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2560 = _2558 != 0;
    float _2562 = fma(_1953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2552);
    int _2564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2566 = _2564 != 0;
    float _2568 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2570 = ~_1072;
    int _2572 = _2570 + 1;
    float _2574 = -_868;
    float _2576 = _2574 + 1.0;
    bool _2578 = !_882;
    float _2580 = _2578 ? 7.345489978790283203125 : 1.0;
    out.m_79.x = _1907;
    out.m_79.y = _1905;
    out.m_79.z = _1909;
    int _2582 = _2572 * _2544;
    int _2584 = _2582 + _2256;
    bool _2586 = _876 > 0.5;
    float _2588 = _2580 * _870;
    float _2590 = _2546;
    float _2592 = _2542;
    if (_2550)
    {
        float _2594 = _2534 ? _2556 : _2546;
        _2590 = _2594;
    }
    float _2596 = _2590;
    float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2600 = _2598 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2602 = float(_2256);
    float _2604 = floor(_2588);
    bool _2606 = uint(_2584) >= uint(_1072);
    int _2608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2610 = _2608 != 0;
    bool _2612 = _2602 >= _1224;
    bool _2614 = isnan(_2602);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(_1224);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = 1.0 / _2600;
    bool _2626 = !_2606;
    int _2628 = _2626 ? 0 : (-1);
    bool _2630 = !_2610;
    int _2632 = _2630 ? 0 : 1;
    bool _2634 = !_2560;
    int _2636 = _2634 ? 0 : 1;
    bool _2638 = _872 > 0.5;
    float _2640 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2640;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2646 = _2644 != 0;
    float _2648 = -_2604;
    float _2650 = _2588 + _2648;
    int _2652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2654 = _2652 != 0;
    float _2656 = _2642 * _2536;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2660 = _2658 != 0;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2664 = _2662 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2666 = -_2492;
    float _2668 = _2666 + 1.0;
    float _2670 = trunc(_2622);
    int _2672 = int(_2670);
    int _2674 = ~_2544;
    int _2676 = _2674 + _2628;
    int _2678 = _2676 + 1;
    float _2680 = _1236 * _182;
    float _2682 = _1224 * _2650;
    int _2684 = _2638 ? as_type<int>(_2668) : as_type<int>(_2492);
    int _2686 = _1072 * _2678;
    int _2688 = _2686 + _2256;
    bool _2690 = _1072 == 0;
    float _2692 = _2664 * _2624;
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2694;
    float _2698 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    bool _2702 = !_2690;
    int _2704 = _2702 ? _2688 : (-1);
    float _2706 = trunc(_2682);
    int _2708 = int(_2706);
    float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2712 = _828 + _2710;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2718 = ~_2672;
    int _2720 = _2718 + 1;
    int _2722 = _2720 + 1;
    float _2724 = fma(_2656, _2712, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2726 = _1072 + (-1);
    float _2728 = trunc(_2680);
    int _2730 = int(_2728);
    int _2732 = abs(_940);
    int _2734 = _2722 * _2704;
    int _2736 = abs(_2632);
    float _2738 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    int _2742 = abs(_946);
    int _2744 = _2672 * _2726;
    int _2746 = _2744 + _2734;
    float _2748 = 1.0 / _2716;
    int _2750 = _2708 * _2736;
    int _2752 = _2750 + _2256;
    bool _2754 = !_2566;
    int _2756 = _2754 ? 0 : 1;
    int _2758 = _2746 * _2732;
    int _2760 = abs(_2636);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2764 = _828 + _2762;
    int _2766 = abs(_2756);
    float _2768 = 1.0 / _2740;
    int _2770 = _2730 * _2742;
    int _2772 = _2770 + _2758;
    bool _2774 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2776 = isnan(_828);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2782 = _2778 || _2780;
    float _2784 = float(_2782);
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2788 = _828 + _2786;
    bool _2790 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2792 = isnan(_828);
    bool _2794 = _2790 || _2792;
    bool _2796 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2798 = _2794 || _2796;
    float _2800 = float(_2798);
    int _2802 = _2752 * _2760;
    int _2804 = _2802 + _2772;
    float _2806 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2808 = _828 + _2806;
    float _2810 = fma(_2692, _2788, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2812 = _2696 * _2748;
    int _2814 = _2708 * _2766;
    int _2816 = _2814 + _2804;
    bool _2818 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2820 = isnan(_828);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2826 = _2822 || _2824;
    float _2828 = float(_2826);
    float _2830 = -_2784;
    float _2832 = _2830 + 1.0;
    float _2834 = fma(_2812, _2764, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2836 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2838 = isnan(_828);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2844 = _2840 || _2842;
    float _2846 = float(_2844);
    float _2848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2850 = float(uint(_2816));
    float _2852 = _2700 * _2768;
    float _2854 = _2654 ? as_type<float>(_2684) : _2492;
    float _2856 = -_2828;
    float _2858 = _2856 + 1.0;
    bool _2860 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2862 = isnan(_828);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2868 = _2864 || _2866;
    float _2870 = float(_2868);
    float _2872 = as_type<float>(_2426) * _2850;
    float _2874 = -_2800;
    float _2876 = _2874 + 1.0;
    float _2878 = _2828 * _2832;
    bool _2880 = _1308 != 0.0;
    bool _2882 = isnan(_1308);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.0);
    bool _2888 = _2884 || _2886;
    float _2890 = _2870 * _2858;
    float _2892 = -_2870;
    float _2894 = _2892 + 1.0;
    float _2896 = in.m_81.x;
    float _2898 = in.m_81.y;
    float _2900 = in.m_81.z;
    float _2902 = trunc(_2872);
    float _2904 = precise::max(_2902, 0.0);
    uint _2906 = uint(_2904);
    bool _2908 = _1306 == 0.0;
    bool _2910 = !_2888;
    bool _2912 = _2908 && _2910;
    float _2914 = _2800 * _2894;
    int _2916 = ~_1072;
    int _2918 = _2916 + 1;
    float _2920 = _2846 * _2876;
    bool _2922 = _1310 == 0.0;
    bool _2924 = _2922 && _2912;
    float _2926 = fma(_2852, _2808, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _2928 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2930 = _2724 * _2920;
    float _2932 = -_2846;
    float _2934 = _2932 + 1.0;
    float _2936 = _2848 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2938 = -_1008;
    float _2940 = fma(_1202, _2928, _2938);
    float _2942 = -_2542;
    float _2944 = _2942 + 1.0;
    float _2946 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2930);
    float _2948 = fma(_2936, _2596, -0.5);
    int _2950 = _2918 * int(_2906);
    int _2952 = _2950 + _2816;
    float _2954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2956 = fma(_2810, _2914, _2946);
    float _2958 = -_1238;
    float _2960 = fma(_1222, _2948, _2958);
    int _2962 = ~_1072;
    int _2964 = _2962 + 1;
    float _2966 = float(uint(_2952));
    float _2968 = fma(_2834, _2890, _2956);
    float _2970 = in.m_83.x;
    float _2972 = in.m_83.y;
    float _2974 = in.m_83.z;
    float _2976 = in.m_83.w;
    float _2978 = as_type<float>(_2918);
    float _2980 = _2622;
    float _2982 = _2966;
    if (_2924)
    {
        _2978 = _2896;
    }
    float _2984 = _2978;
    float _2986 = abs(_1330);
    float _2988 = log2(_2986);
    float _2990 = as_type<float>(_2426) * _2966;
    float _2992 = _2984;
    if (_2924)
    {
        _2980 = _2898;
    }
    float _2994 = _2980;
    float _2996 = fma(_2926, _2878, _2968);
    float _2998 = _2994;
    if (_2924)
    {
        _1050 = _2984;
    }
    float _3000 = _1050;
    float _3002 = _3000;
    if (!_2924)
    {
        _2992 = _2896;
    }
    float _3004 = _2992;
    float _3006 = fma(_2784, (*spvDescriptorSet0.vp_c9)._m0[135].x, _2996);
    float _3008 = trunc(_2990);
    float _3010 = precise::max(_3008, 0.0);
    uint _3012 = uint(_3010);
    float _3014 = float(uint(_2752));
    float _3016 = _3014;
    if (_2924)
    {
        _2982 = _2994;
    }
    float _3018 = _2982;
    float _3020 = _3018;
    if (!_2924)
    {
        float _3022 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3004);
        _3002 = _3022;
    }
    float _3024 = _3002;
    if (!_2924)
    {
        _2998 = _2898;
    }
    float _3026 = _2998;
    float _3028 = as_type<float>(_2426) * _3014;
    if (_2924)
    {
        _3016 = _2900;
    }
    float _3030 = _3016;
    float _3032 = _3030;
    if (!_2924)
    {
        float _3034 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2900);
        _3032 = _3034;
    }
    float _3036 = _3032;
    if (_2646)
    {
        float _3038 = _2586 ? _2944 : _2542;
        _2592 = _3038;
    }
    float _3040 = _2592;
    float _3042 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_2924)
    {
        float _3044 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3026);
        _3020 = _3044;
    }
    float _3046 = _3020;
    float _3048 = trunc(_3028);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    float _3054 = fma(_2540, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3056 = fma(_3042, _3040, -0.5);
    float _3058 = _2970 * _3026;
    int _3060 = int(_2906) + int(_3012);
    float _3062 = fma(_1176, _3054, _1136);
    int _3064 = ~_1072;
    int _3066 = _3064 + 1;
    float _3068 = -_3058;
    float _3070 = fma(_2972, _3004, _3068);
    float _3072 = fma(_1210, _3056, _1096);
    int _3074 = _2964 * _3060;
    int _3076 = _3074 + _2816;
    float _3078 = _2988 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3080 = _2974 * _3004;
    float _3082 = _2960 + 0.5;
    float _3084 = _3062 + 0.5;
    bool _3086 = uint(_3076) >= uint(_1072);
    float _3088 = -_3080;
    float _3090 = fma(_2970, _2900, _3088);
    int _3092 = _3066 * int(_3052);
    int _3094 = _3092 + _2752;
    float _3096 = _2972 * _2900;
    bool _3098 = !_3086;
    int _3100 = _3098 ? 0 : (-1);
    float _3102 = exp2(_3078);
    float _3104 = _3072 + 0.5;
    float _3106 = float(uint(_3094));
    float _3108 = _2940 + 0.5;
    int _3110 = ~_3060;
    int _3112 = _3110 + _3100;
    int _3114 = _3112 + 1;
    float _3116 = _3006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3118 = -_3096;
    float _3120 = fma(_2974, _3026, _3118);
    float _3122 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3124 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3126 = _1072 * _3114;
    int _3128 = _3126 + _2816;
    float _3130 = _1376 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3132 = _3090 * _2976;
    float _3134 = _3120 * _2976;
    out.m_85.x = _3084;
    out.m_85.y = _3108;
    out.m_85.z = _3104;
    out.m_85.w = _3082;
    bool _3136 = !_2690;
    int _3138 = _3136 ? _3128 : (-1);
    float _3140 = -_1354;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3122);
    float _3144 = -_1354;
    float _3146 = fma(_3144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3124);
    out.m_87.w = _3116;
    float _3148 = as_type<float>(_2426) * _3106;
    float _3150 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3152 = _3070 * _2976;
    int _3154 = ~_1072;
    int _3156 = _3154 + 1;
    float _3158 = exp2(_2568);
    float _3160 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3150);
    float _3162 = -_1354;
    float _3164 = fma(_3162, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3130);
    int _3166 = _3138 >> 31;
    float _3168 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3170 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3172 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3174 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3176 = precise::clamp(_3174, 0.0, 1.0);
    float _3178 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3168);
    int _3180 = _3166 & 3;
    float _3182 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3172);
    float _3184 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3170);
    float _3186 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3142);
    int _3188 = _3138 + _3180;
    float _3190 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3146);
    float _3192 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3164);
    float _3194 = trunc(_3148);
    float _3196 = precise::max(_3194, 0.0);
    uint _3198 = uint(_3196);
    int _3200 = _3188 >> 2;
    float _3202 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3204 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3206 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3178);
    int _3208 = _3200 << 4;
    int _3210 = _3208 + 368;
    float _3212 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3202);
    float _3214 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3204);
    float _3216 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3184);
    uint _3218 = uint(int(uint(_3210) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[int(_3228)][_3230];
    float _3234 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3182);
    int _3236 = _3138 & 3;
    bool _3238 = _3236 != 0;
    float _3240 = _3186 * _2972;
    int _3242 = _3138 & 3;
    float _3244 = _3190 * _2972;
    float _3246 = _3192 * _2972;
    int _3248 = int(_3052) + int(_3198);
    int _3250 = _3210 + 8;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    uint _3254 = uint(int(uint(int(_3252)) >> uint(2)));
    int _3256 = int(_3252) & 3;
    float _3258 = (*spvDescriptorSet0.vp_c9)._m0[int(_3254)][_3256];
    int _3260 = int(_3252) + 1;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    int _3264 = _3260 & 3;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[int(_3262)][_3264];
    bool _3268 = uint(_3242) > 1u;
    float _3270 = _3186 * _3046;
    float _3272 = _3132 * _3186;
    int _3274 = _3156 * _3248;
    int _3276 = _3274 + _2752;
    float _3278 = _3190 * _3046;
    float _3280 = _3132 * _3190;
    int _3282 = _3238 ? 0 : 1;
    float _3284 = fma(_3206, _3024, _3270);
    bool _3286 = uint(_3276) >= uint(_1072);
    float _3288 = _3192 * _3046;
    int _3290 = ~_3282;
    int _3292 = _3290 + 1;
    int _3294 = _3292 + 1;
    float _3296 = fma(_3216, _2970, _3244);
    bool _3298 = !_3286;
    int _3300 = _3298 ? 0 : (-1);
    float _3302 = fma(_3234, _2970, _3246);
    bool _3304 = _3242 != 3;
    float _3306 = _3132 * _3192;
    int _3308 = _3294;
    if (!_3268)
    {
        int _3310 = ~_3282;
        int _3312 = _3310 + 1;
        _3308 = _3312;
    }
    int _3314 = _3308;
    float _3316 = fma(_3216, _3024, _3278);
    bool _3318 = uint(_3242) >= 2u;
    float _3320 = fma(_3206, _2970, _3240);
    int _3322 = ~_3248;
    int _3324 = _3322 + _3300;
    int _3326 = _3324 + 1;
    float _3328 = fma(_3234, _3024, _3288);
    int _3330 = _3318 ? 0 : 1;
    float _3332 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3212);
    int _3334 = abs(_3314);
    float _3336 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3214);
    bool _3338 = !_3238;
    int _3340 = _3338 ? 0 : 1;
    float _3342 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3160);
    int _3344 = ~_3330;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    float _3350 = fma(_3134, _3206, _3272);
    bool _3352 = _3242 != 3;
    int _3354 = _1072 * _3326;
    int _3356 = _3354 + _2752;
    int _3358 = _3348;
    float _3360 = _3336;
    if (_3304)
    {
        int _3362 = ~_3330;
        int _3364 = _3362 + 1;
        _3358 = _3364;
    }
    int _3366 = _3358;
    float _3368 = fma(_3134, _3234, _3306);
    int _3370 = abs(_3340);
    int _3372 = abs(_3366);
    bool _3374 = !_3352;
    int _3376 = _3374 ? 0 : (-1);
    int _3378 = ~_3334;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    bool _3384 = !_2660;
    int _3386 = _3384 ? 0 : 1;
    int _3388 = abs(_3376);
    int _3390 = _3382 * as_type<int>(_3232);
    int _3392 = ~_3370;
    int _3394 = _3392 + 1;
    int _3396 = _3394 + 1;
    int _3398 = abs(_3386);
    int _3400 = _3396 * as_type<int>(_3224);
    int _3402 = _3400 + _3390;
    int _3404 = ~_3372;
    int _3406 = _3404 + 1;
    int _3408 = _3406 + 1;
    float _3410 = fma(_3332, _2974, _3320);
    int _3412 = ~_3388;
    int _3414 = _3412 + 1;
    int _3416 = _3414 + 1;
    int _3418 = _3408 * as_type<int>(_3258);
    int _3420 = _3418 + _3402;
    int _3422 = ~_3398;
    int _3424 = _3422 + 1;
    int _3426 = _3424 + 1;
    float _3428 = fma(_1971, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2562);
    float _3430 = fma(_3134, _3216, _3280);
    int _3432 = _3416 * as_type<int>(_3266);
    int _3434 = _3432 + _3420;
    float _3436 = _3428 + _1983;
    bool _3438 = _1330 <= 8000.0;
    bool _3440 = isnan(_1330);
    bool _3442 = _3438 || _3440;
    bool _3444 = isnan(8000.0);
    bool _3446 = _3442 || _3444;
    float _3448 = float(_3446);
    int _3450 = _3426 * _3434;
    bool _3452 = !_2690;
    int _3454 = _3452 ? _3356 : (-1);
    float _3456 = fma(_3336, _2974, _3296);
    float _3458 = fma(_3342, _2974, _3302);
    int _3460 = _3454 * _3398;
    int _3462 = _3460 + _3450;
    float _3464 = fma(_3152, _3332, _3350);
    float _3466 = fma(_3152, _3342, _3368);
    float _3468 = _3436 * 0.5;
    float _3470 = fma(_3336, _3036, _3316);
    float _3472 = fma(_3342, _3036, _3328);
    float _3474 = fma(_3176, -2.0, 3.0);
    float _3476 = _3176 * _3176;
    float _3478 = fma(_3152, _3336, _3430);
    float _3480 = float(_3462);
    float _3482 = fma(_3332, _3036, _3284);
    float _3484 = _3476 * _3474;
    out.m_89.x = _3464;
    out.m_89.y = _3478;
    out.m_89.z = _3466;
    out.m_91.x = _3410;
    out.m_91.y = _3456;
    out.m_91.z = _3458;
    out.gl_Position.x = _2031;
    out.gl_Position.y = _2029;
    out.gl_Position.z = _3428;
    out.gl_Position.w = _1983;
    float _3486 = -_3484;
    float _3488 = _3486 + 1.0;
    float _3490 = _3478;
    if (!_1969)
    {
        _3490 = 1.0;
    }
    float _3492 = _3490;
    out.m_93.z = _3468;
    out.m_93.w = _1983;
    float _3494 = _3492;
    if (_1969)
    {
        bool _3496 = _2083 >= _2043;
        bool _3498 = isnan(_2083);
        bool _3500 = _3496 || _3498;
        bool _3502 = isnan(_2043);
        bool _3504 = _3500 || _3502;
        float _3506 = float(_3504);
        _3494 = _3506;
    }
    float _3508 = _3494;
    float _3510 = fma(_3488, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3484);
    float _3512 = -_3158;
    float _3514 = _3512 + 1.0;
    out.m_95.x = _3480;
    bool _3516 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3518 = isnan(_2266);
    bool _3520 = _3516 || _3518;
    bool _3522 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3524 = _3520 || _3522;
    float _3526 = _3448 * _3510;
    float _3528 = _3514 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_97.x = _3482;
    out.m_97.y = _3470;
    out.m_97.z = _3472;
    float _3530 = _3508 * _2240;
    float _3532 = _3526 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3534 = _3528 * _2085;
    float _3536 = -_3528;
    float _3538 = _3536 + 1.0;
    float _3540 = _2176 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3542 = _2576 * _3532;
    float _3544 = precise::clamp(_3542, 0.0, 1.0);
    float _3546 = _2096 * _3534;
    float _3548 = _2520 * _3534;
    float _3550 = _2096 * _3538;
    float _3552 = -_3544;
    float _3554 = fma(_3552, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3556 = fma(_2516, _3546, _2090);
    float _3558 = fma(_2518, _3546, _2092);
    float _3560 = fma(_2096, _3548, _2094);
    float _3562 = -_3530;
    float _3564 = fma(_3562, _3554, 1.0);
    float _3566 = precise::clamp(_3564, 0.0, 1.0);
    float _3568 = _3538;
    float _3570 = _3530;
    float _3572 = _3544;
    float _3574 = _3566;
    if (!_3524)
    {
        _3568 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3576 = _3568;
    float _3578 = _3576;
    float _3580 = _3576;
    if (!_3524)
    {
        _3360 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3582 = _3360;
    out.m_99.x = _3556;
    out.m_99.y = _3558;
    out.m_99.z = _3560;
    out.m_99.w = _3550;
    float _3584 = _3566 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3586 = _3584;
    float _3588 = _3582;
    float _3590 = _3582;
    if (!_3524)
    {
        _3570 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3592 = _3570;
    float _3594 = _3592;
    float _3596 = _3592;
    if (!_3524)
    {
        _3572 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3598 = _3572;
    out.m_101.x = _3584;
    float _3600 = _3598;
    float _3602 = _3598;
    if (!_3524)
    {
        _3574 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3604 = _3574;
    float _3606 = _3604;
    float _3608 = _3604;
    if (!_3524)
    {
        _3586 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3610 = _3586;
    bool _3612 = !_3524;
    float _3614 = _3610;
    float _3616 = _3610;
    if (!_3612)
    {
        bool _3618 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3620 = isnan(_2266);
        bool _3622 = _3618 || _3620;
        bool _3624 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3626 = _3622 || _3624;
        if (!_3626)
        {
            float _3628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3630 = _2266 + _3628;
            float _3632 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3634 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3632;
            float _3636 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3640 = 1.0 / _3634;
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3644 = _3642 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3648 = _3646 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3654 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3656 = _3654 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3658 = _3630 * _3640;
            float _3660 = precise::clamp(_3658, 0.0, 1.0);
            float _3662 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3664 = _3662 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3666 = fma(_3660, _3638, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3668 = fma(_3660, _3664, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3670 = fma(_3660, _3644, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3672 = fma(_3660, _3648, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3674 = fma(_3660, _3652, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3676 = fma(_3660, _3656, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3590 = _3666;
            _3608 = _3674;
            _3580 = _3670;
            _3602 = _3672;
            _3596 = _3668;
            _3616 = _3676;
            _3678 = true;
        }
        else
        {
            bool _3680 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3682 = isnan(_2266);
            bool _3684 = _3680 || _3682;
            bool _3686 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3688 = _3684 || _3686;
            if (!_3688)
            {
                _3578 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3690 = _3578;
            _3580 = _3690;
            if (!_3688)
            {
                _3588 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3692 = _3588;
            _3590 = _3692;
            if (!_3688)
            {
                _3594 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3694 = _3594;
            _3596 = _3694;
            if (!_3688)
            {
                _3600 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3696 = _3600;
            _3602 = _3696;
            if (!_3688)
            {
                _3606 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3698 = _3606;
            _3608 = _3698;
            if (!_3688)
            {
                _3614 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3700 = _3614;
            bool _3702 = !_3688;
            _3616 = _3700;
            if (!_3702)
            {
                bool _3704 = _2266 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3706 = isnan(_2266);
                bool _3708 = _3704 || _3706;
                bool _3710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3712 = _3708 || _3710;
                if (!_3712)
                {
                    float _3714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3716 = _2266 + _3714;
                    float _3718 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3720 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3718;
                    float _3722 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3724 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3726 = 1.0 / _3720;
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3730 = _3728 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3734 = _3732 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3740 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3742 = _3740 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3744 = _3716 * _3726;
                    float _3746 = precise::clamp(_3744, 0.0, 1.0);
                    float _3748 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3750 = _3748 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3752 = fma(_3746, _3724, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3754 = fma(_3746, _3750, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3756 = fma(_3746, _3730, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3758 = fma(_3746, _3734, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3760 = fma(_3746, _3738, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3762 = fma(_3746, _3742, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3590 = _3752;
                    _3608 = _3760;
                    _3580 = _3756;
                    _3602 = _3758;
                    _3596 = _3754;
                    _3616 = _3762;
                    _3678 = true;
                }
                else
                {
                    _3590 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3608 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3580 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3602 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3596 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3616 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3678 = false;
    float _3764 = _3590;
    float _3766 = _3608;
    float _3768 = _3580;
    float _3770 = _3602;
    float _3772 = _3596;
    float _3774 = _3616;
    float _3776 = fma(_3470, -0.5, 0.5);
    float _3778 = precise::clamp(_3776, 0.0, 1.0);
    float _3780 = -_3764;
    float _3782 = _3780 + _3766;
    float _3784 = _3540 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3786 = -_3768;
    float _3788 = _3786 + _3770;
    out.m_103.x = 0.0;
    float _3790 = fma(_3778, _3782, _3764);
    float _3792 = fma(_3778, _3788, _3768);
    out.m_63.x = _3784;
    float _3794 = -_3772;
    float _3796 = _3794 + _3774;
    float _3798 = _3790 * 0.586610972881317138671875;
    bool _3800 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3802 = fma(_3778, _3796, _3772);
    float _3804 = fma(_3792, 0.298911988735198974609375, _3798);
    bool _3806 = _2176 > 0.0;
    bool _3808 = isnan(_2176);
    bool _3810 = _3806 || _3808;
    bool _3812 = isnan(0.0);
    bool _3814 = _3810 || _3812;
    float _3816 = fma(_3802, 0.114477999508380889892578125, _3804);
    float _3818 = -_3816;
    float _3820 = _3790 + _3818;
    float _3822 = -_3816;
    float _3824 = _3792 + _3822;
    float _3826 = -_3816;
    float _3828 = _3802 + _3826;
    float _3830 = fma(_3820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    float _3832 = fma(_3824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    float _3834 = fma(_3828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3816);
    bool _3836 = !_3800;
    if (!_3836)
    {
        float _3838 = -_1905;
        float _3840 = _3838 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3842 = -_1907;
        float _3844 = _3842 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3846 = -_1909;
        float _3848 = _3846 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3850 = _3840 * _3840;
        float _3852 = fma(_3844, _3844, _3850);
        float _3854 = fma(_3848, _3848, _3852);
        float _3856 = sqrt(_3854);
        float _3858 = rsqrt(_3854);
        float _3860 = -_3856;
        float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3864 = _3862 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3866 = precise::clamp(_3864, 0.0, 1.0);
        float _3868 = _3844 * _3858;
        float _3870 = _3840 * _3858;
        float _3872 = abs(_3866);
        float _3874 = log2(_3872);
        float _3876 = _3848 * _3858;
        float _3878 = _3868 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3880 = _3470 * _3870;
        float _3882 = -_3870;
        float _3884 = -_3878;
        float _3886 = fma(_3882, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3884);
        float _3888 = fma(_3482, _3868, _3880);
        float _3890 = -_3876;
        float _3892 = fma(_3890, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3886);
        float _3894 = fma(_3472, _3876, _3888);
        float _3896 = precise::clamp(_3894, 0.0, 1.0);
        float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3900 = _3892 + _3898;
        float _3902 = _3874 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3904 = _3900 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3906 = precise::clamp(_3904, 0.0, 1.0);
        float _3908 = exp2(_3902);
        float _3910 = _3908 * _3906;
        float _3912 = _3896 * _3910;
        float _3914 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3916 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3918 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3914;
        out.m_103.y = _3916;
        out.m_103.z = _3918;
    }
    out.m_105.x = _3832;
    out.m_105.y = _3830;
    out.m_105.z = _3834;
    if (_3814)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3920 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3920;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

