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
    float4 m_85 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_95 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_83 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2760 = false;
    bool _1622 = false;
    bool _496 = false;
    bool _322 = false;
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
        float _3045 = as_type<float>(_140);
        out.gl_Position.z = _3045;
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
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3115 = as_type<float>(_178);
        out.gl_Position.z = _3115;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_65.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_63.x;
    float _196 = in.m_63.y;
    float _198 = in.m_63.z;
    float _200 = in.m_58.x;
    float _202 = in.m_58.y;
    float _204 = in.m_58.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_280, _196, _286);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = fma(_292, _180, _202);
    float _300 = fma(_294, _180, _204);
    bool _302 = !_282;
    float _320;
    if (!_302)
    {
        float _304 = in.m_67.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_124);
        float _326 = 1.0 / _324;
        float _328 = _158 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = _330 + _332;
    bool _336 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_330);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _350 = _330 + _348;
    bool _352 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_330);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_330);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_346;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _370;
    float _390 = _382 * _386;
    float _392 = -_382;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = 1.0 / _366;
    float _404 = _362 * _394;
    float _406 = -_362;
    float _408 = _406 + 1.0;
    float _410 = _350 * _388;
    float _412 = _334 * _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = fma(_398, _412, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = fma(_416, _412, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = fma(_420, _412, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _428 = _422 * _404;
    float _430 = _424 * _404;
    float _432 = _426 * _404;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _448 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _450 = fma(_436, _410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_440, _410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _454 = fma(_444, _410, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _456 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _432);
    float _458 = fma(_450, _390, _446);
    float _460 = fma(_452, _390, _448);
    float _462 = fma(_454, _390, _456);
    float _464 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].x, _458);
    float _466 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].y, _460);
    float _468 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].z, _462);
    bool _470 = !_400;
    int _472 = as_type<int>(_460);
    int _474 = as_type<int>(_450);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494;
    if (!_470)
    {
        float _478 = in.m_67.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _472 = as_type<int>(_488);
        _474 = as_type<int>(_486);
        _496 = true;
    }
    else
    {
        float _498 = float(_124);
        float _500 = 1.0 / _498;
        float _502 = _158 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    int _506 = _472;
    int _508 = _474;
    float _510 = in.m_69.x;
    float _512 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = in.m_67.z;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _518 = _516 != 0;
    float _520 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _524 = _522 != 0;
    float _526 = in.m_67.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _530 = _528 != 0;
    float _532 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _536 = _534 != 0;
    float _538 = in.m_67.w;
    float _540 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _520);
    float _542 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _544 = in.m_69.y;
    float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _548 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_504);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = in.m_67.y;
    int _562 = _508;
    int _564 = _506;
    float _566 = _510;
    if (_518)
    {
        float _568 = -_510;
        float _570 = _568 + 1.0;
        _562 = as_type<int>(_570);
    }
    int _572 = _562;
    if (_524)
    {
        float _574 = -_510;
        float _576 = _574 + 1.0;
        _564 = as_type<int>(_576);
    }
    int _578 = _564;
    if (!_518)
    {
        _476 = _510;
    }
    float _580 = _476;
    float _582 = in.m_71.w;
    bool _584 = _514 > 0.5;
    float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _588 = log2(_586);
    float _590 = 0.0;
    float _592 = _580;
    if (!_524)
    {
        _590 = _510;
    }
    float _594 = _590;
    float _596 = in.m_71.x;
    bool _598 = false;
    float _600 = _594;
    if (_518)
    {
        bool _602 = _526 > 0.5;
        _598 = _602;
    }
    bool _604 = _598;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_524)
    {
        float _608 = _584 ? as_type<float>(_578) : _510;
        _600 = _608;
    }
    float _610 = _600;
    float _612 = in.m_71.y;
    bool _614 = _538 > 0.5;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_518)
    {
        float _618 = _604 ? as_type<float>(_572) : _510;
        _592 = _618;
    }
    float _620 = _592;
    float _622 = in.m_71.z;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _626 = _624 != 0;
    float _628 = -_544;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _634 = _632 != 0;
    float _636 = in.m_65.x;
    float _638 = in.m_65.y;
    float _640 = in.m_65.z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _644 = _642 != 0;
    float _646 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _648 = _614 ? as_type<int>(_630) : as_type<int>(_544);
    float _650 = _588 * _158;
    bool _652 = _560 > 0.5;
    float _654 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _646);
    int _656 = as_type<int>(_646);
    float _658 = _544;
    float _660 = _630;
    if (_530)
    {
        float _662 = -_510;
        float _664 = _662 + 1.0;
        _656 = as_type<int>(_664);
    }
    int _666 = _656;
    out.m_73.w = _582;
    int _668 = _652 ? as_type<int>(_630) : as_type<int>(_544);
    float _670 = exp2(_650);
    if (_530)
    {
        float _672 = _652 ? as_type<float>(_666) : _510;
        _566 = _672;
    }
    float _674 = _566;
    out.m_73.x = _596;
    float _676 = _626 ? as_type<float>(_648) : _544;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _688 = _686 != 0;
    out.m_73.y = _612;
    float _690 = _634 ? as_type<float>(_668) : _544;
    float _692 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _654);
    float _694 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _700 = _468 * _640;
    float _702 = _514 * 2.0;
    float _704 = _466 * _638;
    float _706 = 1.0 / _698;
    float _708 = _464 * _636;
    float _710 = _560 + _514;
    out.m_73.z = _622;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _714 = floor(_702);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _718 = _710 + (-1.0);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _720;
    float _724 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _728 = _526 * 2.0;
    float _730 = _722 * _706;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _734 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _736 = floor(_728);
    float _738 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _742 = _714 >= 0.0;
    bool _744 = isnan(_714);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_75.x = _724;
    out.m_75.y = _726;
    out.m_75.z = _738;
    if (_644)
    {
        float _754 = _584 ? _630 : _544;
        _658 = _754;
    }
    float _756 = _658;
    float _758 = _546 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _760 = _750 ? 0 : 1;
    float _762 = -_670;
    float _764 = _762 + 1.0;
    bool _766 = _714 > 0.0;
    float _768 = fma(_676, _758, -0.5);
    float _770 = in.m_77.x;
    float _772 = in.m_77.y;
    float _774 = in.m_77.z;
    int _776 = ~_760;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    float _782 = 0.0;
    int _784 = _780;
    if (!_536)
    {
        _782 = _560;
    }
    float _786 = _782;
    float _788 = _560 * 2.0;
    float _790 = _526 + _560;
    float _792 = _526 + _514;
    float _794 = _786;
    if (!_536)
    {
        _660 = _514;
    }
    float _796 = _660;
    float _798 = _790 + (-1.0);
    float _800 = floor(_788);
    float _802 = _792 + (-1.0);
    float _804 = _798;
    float _806 = _796;
    if (!_766)
    {
        int _808 = ~_760;
        int _810 = _808 + 1;
        _784 = _810;
    }
    int _812 = _784;
    float _814 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = as_type<float>(_812);
    if (!_536)
    {
        _804 = _514;
    }
    float _818 = _804;
    float _820 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _822 = _818;
    if (_536)
    {
        _794 = _526;
    }
    float _824 = _794;
    float _826 = _526 + (-0.5);
    if (_536)
    {
        _806 = _560;
    }
    float _828 = _806;
    float _830 = _514 + (-0.5);
    if (_536)
    {
        _822 = _560;
    }
    float _832 = _822;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _606);
    bool _836 = _736 > 0.0;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _772);
    bool _842 = _736 >= 0.0;
    bool _844 = isnan(_736);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _774);
    bool _854 = _800 > 0.0;
    float _856 = _838 * _740;
    bool _858 = _800 >= 0.0;
    bool _860 = isnan(_800);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = _852 * _752;
    float _872 = _840 * _868;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _504 + _874;
    bool _878 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _880 = isnan(_504);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -_558;
    float _892 = _890 + 1.0;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _896 = fma(_730, _876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _900 = _888 * _892;
    float _902 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[83].w, _894);
    float _904 = _824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _906 = _828 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _908 = _896 * _900;
    int _910 = _850 ? 0 : 1;
    float _912 = in.m_79.x;
    float _914 = in.m_79.y;
    float _916 = in.m_79.z;
    bool _918 = _772 != 0.0;
    bool _920 = isnan(_772);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = -_888;
    float _930 = _928 + 1.0;
    float _932 = -_616;
    float _934 = fma(_904, 2.0, _932);
    int _936 = _866 ? 0 : 1;
    float _938 = fma(_906, -2.0, _898);
    bool _940 = _770 == 0.0;
    bool _942 = !_926;
    bool _944 = _940 && _942;
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[115].x, _908);
    float _948 = _560 + (-0.5);
    int _950 = ~_910;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    float _956 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[116].x, _946);
    bool _958 = !_680;
    float _960 = _958 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _962 = _954;
    float _964 = _960;
    float _966 = _902;
    if (!_836)
    {
        int _968 = ~_910;
        int _970 = _968 + 1;
        _962 = _970;
    }
    int _972 = _962;
    bool _974 = _774 == 0.0;
    bool _976 = _974 && _944;
    float _978 = in.m_81.x;
    float _980 = in.m_81.y;
    float _982 = in.m_81.z;
    int _984 = ~_936;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    int _990 = _988;
    if (!_854)
    {
        int _992 = ~_936;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1000 = 1.0 + _998;
    int _1002 = abs(as_type<int>(_960));
    float _1004 = float(_812);
    float _1006 = 1.0 / _1000;
    float _1008 = float(_1002);
    bool _1010 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1012 = isnan(1.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1018 = _1014 || _1016;
    bool _1020 = !_684;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = _1008 * _1004;
    if (_976)
    {
        _964 = _912;
    }
    float _1026 = _964;
    float _1028 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _902);
    bool _1030 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _834);
    int _1042 = abs(_1022);
    float _1044 = _1024 * (-2.0);
    float _1046 = _1026;
    if (_976)
    {
        _816 = _1026;
    }
    float _1048 = _816;
    float _1050 = -_158;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[81].x, _934);
    float _1054 = _1048;
    if (!_976)
    {
        _1046 = _912;
    }
    float _1056 = _1046;
    float _1058 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _938);
    float _1060 = _1038 ? _764 : 0.0;
    float _1062 = fma(_814, _1044, _814);
    if (!_976)
    {
        float _1064 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1054 = _1064;
    }
    float _1066 = _1054;
    float _1068 = float(_972);
    if (_1018)
    {
        float _1070 = _1060 * _1006;
        _160 = _1070;
    }
    float _1072 = _160;
    float _1074 = fma(_1044, _978, _978);
    bool _1076 = !_688;
    float _1078 = _1076 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1082 = float(_1042);
    float _1084 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1074);
    float _1086 = _1078;
    if (_976)
    {
        _966 = _914;
    }
    float _1088 = _966;
    int _1090 = abs(as_type<int>(_1078));
    float _1092 = _1082 * _1068;
    float _1094 = _1088;
    float _1096 = as_type<float>(_1090);
    float _1098 = _1092;
    if (_976)
    {
        _1086 = _1088;
    }
    float _1100 = _1086;
    float _1102 = fma(_1062, _1072, _1084);
    float _1104 = _1100;
    if (!_976)
    {
        _1094 = _914;
    }
    float _1106 = _1094;
    float _1108 = _1092 * (-2.0);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = float(_996);
    float _1114 = fma(_1108, _980, _980);
    float _1116 = float(_1090);
    float _1118 = fma(_734, _1108, _734);
    if (_976)
    {
        _1096 = _916;
    }
    float _1120 = _1096;
    float _1122 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1114);
    float _1124 = -_1058;
    float _1126 = fma(_1028, _768, _1124);
    float _1128 = _1116 * _1112;
    float _1130 = _1120;
    if (_976)
    {
        _1098 = _1120;
    }
    float _1132 = _1098;
    float _1134 = fma(_1118, _1072, _1122);
    float _1136 = _1132;
    if (!_976)
    {
        _1130 = _916;
    }
    float _1138 = _1130;
    float _1140 = _1128 * (-2.0);
    float _1142 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1144 = in.m_83.x;
    float _1146 = in.m_83.y;
    float _1148 = in.m_83.z;
    float _1150 = in.m_83.w;
    float _1152 = _1134 * 0.15915493667125701904296875;
    float _1154 = fma(_1140, _982, _982);
    float _1156 = fma(_820, _1140, _820);
    float _1158 = _1110 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = fma(_1142, _610, -0.5);
    float _1164 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1154);
    if (!_976)
    {
        float _1166 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1104 = _1166;
    }
    float _1168 = _1104;
    if (!_976)
    {
        float _1170 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1138);
        _1136 = _1170;
    }
    float _1172 = _1136;
    float _1174 = fma(_1156, _1072, _1164);
    float _1176 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1178 = _1110 * 6.283185482025146484375;
    float _1180 = cos(_1178);
    float _1182 = _1174 * 0.15915493667125701904296875;
    float _1184 = fma(_1040, _1162, _1052);
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1190 = _1152 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1146 * _1138;
    float _1202 = _1148 * _1056;
    float _1204 = _1144 * _1106;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1152 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = -_1202;
    float _1214 = fma(_1144, _1138, _1212);
    float _1216 = -_1200;
    float _1218 = fma(_1148, _1106, _1216);
    float _1220 = -_1204;
    float _1222 = fma(_1146, _1056, _1220);
    out.m_85.x = _1196;
    out.m_85.y = _1198;
    out.m_85.z = _1206;
    out.m_85.w = _1176;
    float _1224 = _1214 * _1150;
    float _1226 = _1218 * _1150;
    float _1228 = _1222 * _1150;
    float _1230 = _1182 * 6.283185482025146484375;
    float _1232 = cos(_1230);
    float _1234 = _1160 * _1192;
    float _1236 = _1180 * _1192;
    float _1238 = _1182 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _1180 * _1210;
    float _1244 = _1180 * _1232;
    float _1246 = _1160 * _1210;
    float _1248 = _1160 * _1232;
    float _1250 = _1210 * _1232;
    float _1252 = _1192 * _1232;
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1256 = _1248 * _872;
    float _1258 = fma(_1240, _1242, _1234);
    float _1260 = fma(_1240, _1234, _1242);
    float _1262 = _1244 * _872;
    float _1264 = -_1236;
    float _1266 = fma(_1240, _1246, _1264);
    float _1268 = -_872;
    float _1270 = _1240 * _1268;
    float _1272 = -_1246;
    float _1274 = fma(_1240, _1236, _1272);
    float _1276 = fma(_1258, _856, _1262);
    float _1278 = fma(_1266, _856, _1256);
    float _1280 = fma(_1250, _856, _1270);
    float _1282 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1284 = fma(_1274, _870, _1276);
    float _1286 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1288 = fma(_1252, _870, _1280);
    float _1290 = fma(_1260, _870, _1278);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1294 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1296 = -_1240;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1282);
    float _1300 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1292);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1294);
    float _1306 = -_1240;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1286);
    float _1310 = -_1240;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1254);
    float _1314 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1302);
    float _1316 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1304);
    float _1318 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1320 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1326 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1328 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1320);
    float _1330 = _1300 + _1322;
    float _1332 = _1318 + _1324;
    float _1334 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1326);
    float _1336 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1340 = _1330 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1298);
    float _1348 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1312);
    float _1350 = _1340 * _1340;
    float _1352 = _1344 * _1344;
    float _1354 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1308);
    float _1356 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1358 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = _1350 + _1352;
    float _1362 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = sqrt(_1360);
    float _1370 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1372 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1374 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1376 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1378 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1356);
    float _1380 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1328);
    float _1382 = _1346 * _1146;
    float _1384 = _1346 * _1168;
    float _1386 = _1224 * _1346;
    float _1388 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1374);
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1392 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1334);
    float _1394 = _1348 * _1146;
    float _1396 = _1354 * _1146;
    float _1398 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    bool _1400 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1372);
    float _1404 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1376);
    float _1406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1408 = _542 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1410 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1412 = _1348 * _1168;
    float _1414 = _1354 * _1168;
    float _1416 = _1224 * _1348;
    float _1418 = _1224 * _1354;
    float _1420 = _1408 + _1410;
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1424 = fma(_1378, _1066, _1384);
    float _1426 = _1410;
    float _1428 = _1350;
    float _1430 = _1352;
    float _1432 = _1330;
    float _1434 = _1332;
    float _1436 = _1404;
    float _1438 = _1386;
    float _1440 = _1372;
    float _1442 = _1318;
    if (!_1400)
    {
        _1426 = _1350;
    }
    float _1444 = _1426;
    float _1446 = fma(_1380, _1066, _1412);
    float _1448 = fma(_1392, _1066, _1414);
    float _1450 = _1444;
    if (!_1400)
    {
        _1428 = _1420;
    }
    float _1452 = _1428;
    bool _1454 = !_1400;
    float _1456 = _1452;
    if (!_1454)
    {
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1462 = _1368 + _1460;
        float _1464 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = rsqrt(_1360);
        float _1468 = _1462 * _1458;
        float _1470 = _1468 * 0.15915493667125701904296875;
        float _1472 = _1470 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = _1470 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = fma(_1474, _1464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1482 = _1466 * _1480;
        float _1484 = _1478 + (-1.0);
        float _1486 = fma(_1340, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1488 = fma(_1344, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1490 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1494 = _1486 + _1492;
        float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1498 = _1488 + _1496;
        float _1500 = fma(_1420, _1478, _1490);
        float _1502 = _1494 * _1494;
        float _1504 = _1498 * _1498;
        _1456 = _1500;
        _1450 = _1502;
        _1430 = _1504;
        _1432 = _1486;
        _1434 = _1488;
    }
    float _1506 = _1456;
    float _1508 = _1450;
    float _1510 = _1430;
    float _1512 = _1432;
    float _1514 = _1434;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1518 = _1506 + _1516;
    float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1522 = fma(_1378, _1144, _1382);
    float _1524 = fma(_1380, _1144, _1394);
    float _1526 = fma(_1518, _1518, _1508);
    float _1528 = fma(_1392, _1144, _1396);
    float _1530 = fma(_1226, _1378, _1386);
    float _1532 = _756 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1534 = _1526 + _1510;
    float _1536 = _690 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1538 = fma(_1226, _1380, _1416);
    float _1540 = fma(_1226, _1392, _1418);
    float _1542 = _674 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1544 = _1536 * _1390;
    float _1546 = _620 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1548 = sqrt(_1534);
    float _1550 = _1532 * _1422;
    float _1552 = fma(_1228, _1398, _1530);
    float _1554 = _1184 + 0.5;
    float _1556 = fma(_1398, _1172, _1424);
    float _1558 = fma(_1398, _1148, _1522);
    float _1560 = fma(_1402, _1148, _1524);
    float _1562 = fma(_1228, _1402, _1538);
    float _1564 = fma(_1404, _1148, _1528);
    float _1566 = _1542 * _1406;
    float _1568 = _1546 * _1520;
    float _1570 = fma(_1402, _1172, _1446);
    float _1572 = _1126 + 0.5;
    float _1574 = fma(_1228, _1404, _1540);
    float _1576 = fma(_1404, _1172, _1448);
    out.m_87.x = _1566;
    out.m_87.y = _1550;
    bool _1578 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1580 = isnan(_1548);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1586 = _1582 || _1584;
    out.m_89.x = _1568;
    out.m_89.y = _1544;
    out.m_89.z = _1554;
    out.m_89.w = _1572;
    out.m_91.x = _1558;
    out.m_91.y = _1560;
    out.m_91.z = _1564;
    out.m_93.x = _1552;
    out.m_93.y = _1562;
    out.m_93.z = _1574;
    if (!_1586)
    {
        _1436 = 1.0;
    }
    float _1588 = _1436;
    out.m_95.x = _1556;
    out.m_95.y = _1570;
    out.m_95.z = _1576;
    bool _1590 = !_1586;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1548);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1548 + _1604;
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
            bool _1624 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1548);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1548 + _1634;
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
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1506 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1660 = _1512 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1664 = _1514 + _1662;
    float _1666 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1668 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1670 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1672 = fma(_1664, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1674 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1666);
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1678 = _1668 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1682 = _1670 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1672 + _1684;
    float _1688 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1674);
    float _1690 = _1678 * _1678;
    float _1692 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1694 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1696 = fma(_1682, _1682, _1690);
    float _1698 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1692);
    float _1700 = 1.0 / _1694;
    float _1702 = fma(_1686, _1686, _1696);
    float _1704 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1698);
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1708 = rsqrt(_1702);
    float _1710 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1712 = _1706 + _1694;
    float _1714 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1716 = _1408 + _1714;
    float _1718 = _1712 * _1700;
    float _1720 = _1718 * 0.5;
    float _1722 = floor(_1710);
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1728 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1726);
    float _1730 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1724);
    float _1732 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1734 = sqrt(_1702);
    float _1736 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1730);
    float _1738 = _1682 * _1732;
    float _1740 = _1686 * _1732;
    float _1742 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1746 = _1738 * _1738;
    float _1748 = _1740 * _1740;
    float _1750 = 1.0 / _1728;
    float _1752 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1742);
    float _1754 = -_1722;
    float _1756 = _1710 + _1754;
    float _1758 = _1746 + _1748;
    float _1760 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1752);
    float _1762 = sqrt(_1758);
    float _1764 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1770 = _1750 * _1768;
    float _1772 = trunc(_1744);
    int _1774 = int(_1772);
    bool _1776 = _1770 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1778 = _1770 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = _1762 + _1780;
    bool _1784 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = trunc(_1764);
    int _1788 = int(_1786);
    float _1790 = precise::max(0.0, _1766);
    float _1792 = -_1732;
    float _1794 = -_1790;
    float _1796 = fma(_1678, _1792, _1794);
    int _1798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1800 = _1774 + _1798;
    int _1802 = _1800 + 1;
    int _1804 = 2;
    float _1806 = _1732;
    float _1808 = _1758;
    float _1810 = _1782;
    float _1812 = _1738;
    float _1814 = _1746;
    float _1816 = _1796;
    float _1818 = _1716;
    if (!_1776)
    {
        _1804 = 1;
    }
    int _1820 = _1804;
    float _1822 = _1700;
    int _1824 = _1820;
    if (_1784)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1826;
    }
    float _1828 = _1822;
    if (_1784)
    {
        float _1830 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1830;
    }
    float _1832 = _1806;
    int _1834 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1836 = _1788 + _1834;
    int _1838 = _1836 + 1;
    float _1840 = _1832;
    if (_1784)
    {
        float _1842 = rsqrt(_1758);
        _1808 = _1842;
    }
    float _1844 = _1808;
    int _1846 = _1802 | _1838;
    float _1848 = _1844;
    if (_1784)
    {
        float _1850 = _1782 * _1828;
        _1810 = _1850;
    }
    float _1852 = _1810;
    if (_1784)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1438 = _1854;
    }
    float _1856 = _1438;
    bool _1858 = !_1776;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = _1554;
    if (_1784)
    {
        float _1864 = _1856 * 6.283185482025146484375;
        float _1866 = sin(_1864);
        _1862 = _1866;
    }
    float _1868 = _1862;
    if (!_1778)
    {
        _1824 = _1860;
    }
    int _1870 = _1824;
    int _1872 = _1870 << 6;
    bool _1874 = _1802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1876 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _1878 = _1872 + 96;
    uint _1881 = uint(int(uint(_1878) >> uint(2)));
    uint _1883 = uint(int(uint(int(_1881)) >> uint(2)));
    int _1885 = int(_1881) & 3;
    float _1887 = (*spvDescriptorSet0.vp_c15)._m0[int(_1883)][_1885];
    int _1889 = int(_1881) + 1;
    uint _1891 = uint(int(uint(_1889) >> uint(2)));
    int _1893 = _1889 & 3;
    float _1895 = (*spvDescriptorSet0.vp_c15)._m0[int(_1891)][_1893];
    float _1897 = _1856;
    if (_1784)
    {
        float _1899 = _1856 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        _1897 = _1901;
    }
    float _1903 = _1897;
    bool _1905 = _1846 < 0;
    bool _1907 = _1905 || _1874;
    float _1909 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1911 = _1838 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1913 = _1911 || _1907;
    if (_1784)
    {
        float _1915 = fma(_1868, _1832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1915;
    }
    float _1917 = _1840;
    int _1919 = _1872 + 64;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    uint _1923 = uint(int(uint(int(_1921)) >> uint(2)));
    int _1925 = int(_1921) & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    int _1929 = int(_1921) + 1;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    int _1933 = _1929 & 3;
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[int(_1931)][_1933];
    float _1937 = floor(_1876);
    float _1939 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1909);
    float _1941 = 0.0;
    if (_1784)
    {
        float _1943 = _1844 * _1917;
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    if (_1784)
    {
        float _1949 = _1738 * _1945;
        _1812 = _1949;
    }
    float _1951 = _1812;
    int _1953 = _1872 + 48;
    uint _1955 = uint(int(uint(_1953) >> uint(2)));
    uint _1957 = uint(int(uint(int(_1955)) >> uint(2)));
    int _1959 = int(_1955) & 3;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[int(_1957)][_1959];
    int _1963 = int(_1955) + 1;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    int _1967 = _1963 & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    float _1971 = _1903;
    if (_1784)
    {
        float _1973 = _1903 + (-1.0);
        _1848 = _1973;
    }
    float _1975 = _1848;
    float _1977 = _1520;
    float _1979 = _1975;
    if (!_1913)
    {
        float _1981 = floor(_1764);
        _1977 = _1981;
    }
    float _1983 = _1977;
    if (_1784)
    {
        float _1985 = _1951 * _1951;
        _1814 = _1985;
    }
    float _1987 = _1814;
    if (_1784)
    {
        float _1989 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1440 = _1989;
    }
    float _1991 = _1440;
    if (!_1784)
    {
        _1979 = _1740;
    }
    float _1993 = _1979;
    float _1995 = _1993;
    if (_1784)
    {
        float _1997 = _1740 * _1945;
        _1995 = _1997;
    }
    float _1999 = _1995;
    int _2001 = _1872 + 80;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[int(_2013)][_2015];
    float _2019 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1784)
    {
        float _2021 = fma(_1796, _1903, _1991);
        _1816 = _2021;
    }
    float _2023 = _1816;
    if (!_1784)
    {
        _1971 = _1748;
    }
    float _2025 = _1971;
    float _2027 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2031 = _2025;
    int _2033 = as_type<int>(_2029);
    if (_1784)
    {
        float _2035 = _1999 * _1999;
        _2031 = _2035;
    }
    float _2037 = _2031;
    float _2039 = fma(_2023, _2023, _1987);
    int _2041 = _1872 + 104;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
    int _2047 = int(_2043) & 3;
    float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
    int _2051 = int(_2043) + 1;
    uint _2053 = uint(int(uint(_2051) >> uint(2)));
    int _2055 = _2051 & 3;
    float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
    float _2059 = -_1937;
    float _2061 = _1876 + _2059;
    float _2063 = -_2029;
    float _2065 = fma(_2063, _2027, 1.0);
    float _2067 = _2039;
    if (!_1913)
    {
        int _2069 = _1838 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2071 = _2069 + _1802;
        _2033 = _2071;
    }
    int _2073 = _2033;
    float _2075 = _2039 + _2037;
    if (!_1913)
    {
        float _2077 = -_1983;
        float _2079 = _1764 + _2077;
        _2067 = _2079;
    }
    float _2081 = _2067;
    int _2083 = _1872 + 72;
    uint _2085 = uint(int(uint(_2083) >> uint(2)));
    uint _2087 = uint(int(uint(int(_2085)) >> uint(2)));
    int _2089 = int(_2085) & 3;
    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[int(_2087)][_2089];
    int _2093 = int(_2085) + 1;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    int _2097 = _2093 & 3;
    float _2099 = (*spvDescriptorSet0.vp_c15)._m0[int(_2095)][_2097];
    float _2101 = rsqrt(_2075);
    int _2103 = _1872 + 56;
    uint _2105 = uint(int(uint(_2103) >> uint(2)));
    uint _2107 = uint(int(uint(int(_2105)) >> uint(2)));
    int _2109 = int(_2105) & 3;
    float _2111 = (*spvDescriptorSet0.vp_c15)._m0[int(_2107)][_2109];
    int _2113 = int(_2105) + 1;
    uint _2115 = uint(int(uint(_2113) >> uint(2)));
    int _2117 = _2113 & 3;
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[int(_2115)][_2117];
    float _2121 = _1716 * _1895;
    float _2123 = log2(_2065);
    float _2125 = fma(_1300, _1887, _2121);
    int _2127 = _1872 + 88;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    uint _2131 = uint(int(uint(int(_2129)) >> uint(2)));
    int _2133 = int(_2129) & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    int _2137 = int(_2129) + 1;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    int _2141 = _2137 & 3;
    float _2143 = (*spvDescriptorSet0.vp_c15)._m0[int(_2139)][_2141];
    float _2145 = _1716 * _1935;
    float _2147 = _2101 * _1951;
    float _2149 = _2101 * _2023;
    float _2151 = _2101 * _1999;
    float _2153 = fma(_1300, _1927, _2145);
    float _2155 = _1716 * _1969;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2159 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2157);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    int _2163 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _2165 = as_type<int>(_2017);
    int _2167 = as_type<int>(_1887);
    float _2169 = _2161;
    if (!_1913)
    {
        int _2171 = _2073 << 2;
        _2163 = _2171;
    }
    int _2173 = _2163;
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = fma(_1300, _1961, _2155);
    int _2179 = _2173;
    if (!_1913)
    {
        int _2181 = 12 & _2173;
        _2179 = _2181;
    }
    int _2183 = _2179;
    float _2185 = _1716 * _2017;
    if (!_1913)
    {
        uint _2187 = uint(int(uint(_2073) >> uint(2)));
        _2165 = int(_2187);
    }
    int _2189 = _2165;
    float _2191 = fma(_1300, _2009, _2185);
    float _2193 = -_2161;
    float _2195 = _2193 + 1.0;
    if (!_1913)
    {
        int _2197 = _2189 << 4;
        int _2199 = _2197 + _2183;
        _2167 = _2199;
    }
    int _2201 = _2167;
    if (!_1913)
    {
        float _2203 = floor(_1744);
        _2169 = _2203;
    }
    float _2205 = _2169;
    float _2207 = fma(_1318, _2049, _2125);
    float2 _6449 = float2(_1756, _2061);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6449, float2(0.0), isnan(_6449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6449, float2(0.0), isnan(_6449)), level(0.0)).x;
    float _2211 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2213 = abs(_2195);
    float _2215 = log2(_2213);
    float _2217 = fma(_1318, _2091, _2153);
    float _2219 = _2207 + _2057;
    float _2221 = _2217 + _2099;
    float _2223 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2225 = 1.0 / _2219;
    float _2227 = fma(_1318, _2111, _2177);
    float _2229 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2231 = _2147;
    if (!_1913)
    {
        int _2233 = _2201 + 400;
        uint _2235 = uint(int(uint(_2233) >> uint(2)));
        uint _2237 = uint(int(uint(int(_2235)) >> uint(2)));
        int _2239 = int(_2235) & 3;
        float _2241 = (*spvDescriptorSet0.vp_c15)._m0[int(_2237)][_2239];
        _2231 = _2241;
    }
    float _2243 = _2231;
    float _2245 = _2227 + _2119;
    float _2247 = -_2229;
    float _2249 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2247);
    float _2251 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2253 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2223);
    float _2255 = fma(_1318, _2135, _2191);
    float _2257 = -_2151;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2249);
    float _2261 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2263 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2251);
    float _2265 = fma(_2259, -0.5, 0.5);
    float _2267 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2261);
    float _2269 = _2245 * _2225;
    float _2271 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2263);
    float _2273 = _2221 * _2225;
    float _2275 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2267);
    float _2277 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2253);
    bool _2279 = _2269 >= 0.0;
    float _2281 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2285 = fma(_2259, 0.5, 0.5);
    bool _2287 = _2269 <= 1.0;
    bool _2289 = _2287 && _2279;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2293 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2295 = sqrt(_2265);
    bool _2297 = _2273 >= 0.0;
    bool _2299 = _2297 && _2289;
    float _2301 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2291);
    float _2303 = fma(_2285, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2305 = _2277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2307 = _2273 <= 1.0;
    bool _2309 = _2307 && _2299;
    float _2311 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2301);
    float _2313 = fma(_2285, _2303, -0.212114393711090087890625);
    float _2315 = exp2(_2293);
    float _2317 = _2255 + _2143;
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2311);
    float _2321 = fma(_2285, _2313, 1.570728778839111328125);
    float _2323 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2325 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2327 = _2149 + 1.0;
    float _2329 = 1.0 / _2319;
    float _2331 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2323);
    float _2333 = _2313;
    if (_2309)
    {
        float _2335 = float(_1870);
        _2333 = _2335;
    }
    float _2337 = _2333;
    float _2339 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2325);
    float _2341 = _2295 * 0.636619746685028076171875;
    float _2343 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2331);
    float _2345 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2339);
    float _2347 = _2337;
    float _2349 = _2343;
    if (_2309)
    {
        float _2351 = rint(_2337);
        float _2353 = precise::max(_2351, 0.0);
        uint _2355 = uint(_2353);
        uint _2357 = clamp(_2355, 0u, 65535u);
        _2347 = as_type<float>(_2357);
    }
    float _2359 = _2347;
    float _2361 = -_2321;
    float _2363 = fma(_2341, _2361, 1.0);
    float _2365 = -_2149;
    float _2367 = fma(_2315, _2327, _2365);
    float _2369 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2343);
    float _2371 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2345);
    float _2373 = _2317 * _2225;
    float _2375 = _2373;
    if (!_1913)
    {
        float _2377 = -_2205;
        float _2379 = _1744 + _2377;
        _2349 = _2379;
    }
    float _2381 = _2349;
    float _2383 = _2369 * _2329;
    float _2385 = _2371 * _2329;
    float _2387 = _2225;
    if (!_1913)
    {
        float _2389 = rint(_2243);
        float _2391 = precise::max(_2389, 0.0);
        uint _2393 = uint(_2391);
        uint _2395 = clamp(_2393, 0u, 65535u);
        _2387 = as_type<float>(_2395);
    }
    float _2397 = _2387;
    float _2399 = fma(_2383, -0.5, 0.5);
    float _2401 = fma(_2385, 0.5, 0.5);
    float _2403 = fma(_2367, 0.5, 0.5);
    float _2405 = _2273;
    if (_2309)
    {
        float3 _6788 = float3(_2269, _2273, float(as_type<int>(_2359)));
        float3 _6792 = select(_6788, float3(0.0), isnan(_6788));
        float _2407 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6792.xy, uint(rint(_6792.z)), _2373, level(0.0));
        _2405 = _2407;
    }
    float _2409 = _2405;
    float3 _6802 = float3(_2401, _2399, _2211);
    float _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6802, float3(0.0), isnan(_6802)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6802, float3(0.0), isnan(_6802)), level(0.0)).x;
    float3 _6811 = float3(_2401, _2399, _2211);
    float4 _2414 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6811, float3(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6811, float3(0.0), isnan(_6811)), level(0.0)).xyzw;
    float _2416 = _2414.x;
    float _2418 = _2414.y;
    float _2420 = _2414.z;
    float _2422 = _2414.w;
    float2 _6827 = float2(_2363, _2403);
    float3 _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6827, float2(0.0), isnan(_6827)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6827, float2(0.0), isnan(_6827)), level(0.0)).xyz;
    float _2428 = _2426.x;
    float _2430 = _2426.y;
    float _2432 = _2426.z;
    float _2434 = _2397;
    if (!_1913)
    {
        float3 _6848 = float3(_2381, _2081, float(as_type<int>(_2397)));
        float3 _6850 = select(_6848, float3(0.0), isnan(_6848));
        float _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6850.xy, uint(rint(_6850.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6850.xy, uint(rint(_6850.z)), level(0.0)).x;
        _2434 = _2436;
    }
    float _2438 = _2434;
    float _2440 = abs(_1770);
    float _2442 = log2(_2440);
    float _2444 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2446 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2444);
    float _2448 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2450 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2446);
    float _2452 = _2319 * 0.5;
    bool _2454 = _1770 <= 8000.0;
    bool _2456 = isnan(_1770);
    bool _2458 = _2454 || _2456;
    bool _2460 = isnan(8000.0);
    bool _2462 = _2458 || _2460;
    float _2464 = float(_2462);
    float _2466 = exp2(_2448);
    float _2468 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2470 = exp2(_2468);
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2474, -2.0, 3.0);
    float _2478 = _2474 * _2474;
    float _2480 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2450);
    float _2482 = fma(_2369, -0.5, _2452);
    float _2484 = _2478 * _2476;
    float _2486 = _2480 + _2319;
    float _2488 = _2371 + _2319;
    out.gl_Position.x = _2371;
    out.gl_Position.y = _2369;
    out.gl_Position.z = _2480;
    out.gl_Position.w = _2319;
    float _2490 = -_2484;
    float _2492 = _2490 + 1.0;
    float _2494 = _2486 * 0.5;
    float _2496 = _2488 * 0.5;
    float _2498 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2484);
    out.m_97.x = _2496;
    out.m_97.y = _2482;
    out.m_97.z = _2494;
    out.m_97.w = _2319;
    float _2500 = _2464 * _2498;
    float _2502 = _2498;
    if (!_2309)
    {
        _2502 = 1.0;
    }
    float _2504 = _2502;
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2508 = -_2466;
    float _2510 = _2508 + 1.0;
    float _2512 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2514 = -_2209;
    float _2516 = _2514 + 1.0;
    float _2518 = _2516 * _2506;
    float _2520 = precise::clamp(_2518, 0.0, 1.0);
    float _2522 = _2504;
    float _2524 = _2409;
    if (_2309)
    {
        bool _2526 = _2409 >= _2373;
        bool _2528 = isnan(_2409);
        bool _2530 = _2526 || _2528;
        bool _2532 = isnan(_2373);
        bool _2534 = _2530 || _2532;
        float _2536 = float(_2534);
        _2522 = _2536;
    }
    float _2538 = _2522;
    if (_1913)
    {
        _2524 = 1.0;
    }
    float _2540 = _2524;
    float _2542 = _2540;
    if (!_1913)
    {
        int _2544 = _2073 << 4;
        int _2546 = _2544 + 2048;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        uint _2550 = uint(int(uint(int(_2548)) >> uint(2)));
        int _2552 = int(_2548) & 3;
        float _2554 = (*spvDescriptorSet0.vp_c15)._m0[int(_2550)][_2552];
        int _2556 = int(_2548) + 1;
        uint _2558 = uint(int(uint(_2556) >> uint(2)));
        int _2560 = _2556 & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        int _2564 = _2546 + 8;
        uint _2566 = uint(int(uint(_2564) >> uint(2)));
        uint _2568 = uint(int(uint(int(_2566)) >> uint(2)));
        int _2570 = int(_2566) & 3;
        float _2572 = (*spvDescriptorSet0.vp_c15)._m0[int(_2568)][_2570];
        int _2574 = int(_2566) + 1;
        uint _2576 = uint(int(uint(_2574) >> uint(2)));
        int _2578 = _2574 & 3;
        float _2580 = (*spvDescriptorSet0.vp_c15)._m0[int(_2576)][_2578];
        float _2582 = _1716 * _2562;
        float _2584 = fma(_1300, _2554, _2582);
        float _2586 = fma(_1318, _2572, _2584);
        float _2588 = _2586 + _2580;
        float _2590 = precise::clamp(_2588, 0.0, 1.0);
        float _2592 = -_2590;
        float _2594 = _2592 + _2438;
        float _2596 = fma(_2594, 500.0, 1.5);
        float _2598 = exp2(_2596);
        float _2600 = 0.0 + _2598;
        float _2602 = precise::clamp(_2600, 0.0, 1.0);
        _2542 = _2602;
        _1818 = 500.0;
        _2375 = _2562;
    }
    float _2604 = _2542;
    float _2606 = _1818;
    float _2608 = _2375;
    float _2610 = _2538 * _2604;
    float _2612 = _2512 * _2411;
    float _2614 = -_2520;
    float _2616 = fma(_2614, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2618 = -_2512;
    float _2620 = _2618 + 1.0;
    bool _2622 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2624 = isnan(_1734);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2630 = _2626 || _2628;
    float _2632 = _2422 * _2612;
    float _2634 = -_2610;
    float _2636 = fma(_2634, _2616, 1.0);
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2432 * _2612;
    float _2642 = _2422 * _2620;
    float _2644 = fma(_2428, _2632, _2416);
    float _2646 = fma(_2430, _2632, _2418);
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2650 = fma(_2422, _2640, _2420);
    out.m_99.x = _2648;
    float _2652 = _2620;
    float _2654 = _2608;
    float _2656 = _2638;
    float _2658 = _2606;
    float _2660 = _2632;
    if (!_2630)
    {
        _2652 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2662 = _2652;
    float _2664 = _2662;
    float _2666 = _2662;
    if (!_2630)
    {
        _2654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2668 = _2654;
    out.m_101.x = _2644;
    out.m_101.y = _2646;
    out.m_101.z = _2650;
    out.m_101.w = _2642;
    float _2670 = _2668;
    float _2672 = _2668;
    if (!_2630)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2656;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2630)
    {
        _1442 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2680 = _1442;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2630)
    {
        _2658 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2686 = _2658;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2630)
    {
        _2660 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2692 = _2660;
    bool _2694 = !_2630;
    float _2696 = _2692;
    float _2698 = _2692;
    if (!_2694)
    {
        bool _2700 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2702 = isnan(_1734);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2712 = _1734 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2714;
            float _2718 = 1.0 / _2716;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2740 = _2712 * _2718;
            float _2742 = precise::clamp(_2740, 0.0, 1.0);
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2748 = fma(_2742, _2722, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2672 = _2750;
            _2690 = _2756;
            _2666 = _2748;
            _2684 = _2754;
            _2678 = _2752;
            _2698 = _2758;
            _2760 = true;
        }
        else
        {
            bool _2762 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2764 = isnan(_1734);
            bool _2766 = _2762 || _2764;
            bool _2768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2770 = _2766 || _2768;
            if (!_2770)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2772 = _2664;
            _2666 = _2772;
            if (!_2770)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2774 = _2670;
            _2672 = _2774;
            if (!_2770)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2776 = _2676;
            _2678 = _2776;
            if (!_2770)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2778 = _2682;
            _2684 = _2778;
            if (!_2770)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2780 = _2688;
            _2690 = _2780;
            if (!_2770)
            {
                _2696 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2782 = _2696;
            bool _2784 = !_2770;
            _2698 = _2782;
            if (!_2784)
            {
                bool _2786 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2788 = isnan(_1734);
                bool _2790 = _2786 || _2788;
                bool _2792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2794 = _2790 || _2792;
                if (!_2794)
                {
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2798 = _1734 + _2796;
                    float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2800;
                    float _2804 = 1.0 / _2802;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2826 = _2798 * _2804;
                    float _2828 = precise::clamp(_2826, 0.0, 1.0);
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2834 = fma(_2828, _2808, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2836 = fma(_2828, _2832, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2838 = fma(_2828, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2840 = fma(_2828, _2816, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2842 = fma(_2828, _2820, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2844 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2672 = _2836;
                    _2690 = _2842;
                    _2666 = _2834;
                    _2684 = _2840;
                    _2678 = _2838;
                    _2698 = _2844;
                    _2760 = true;
                }
                else
                {
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2698 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2760 = false;
    float _2846 = _2672;
    float _2848 = _2690;
    float _2850 = _2666;
    float _2852 = _2684;
    float _2854 = _2678;
    float _2856 = _2698;
    float _2858 = fma(_1570, -0.5, 0.5);
    float _2860 = precise::clamp(_2858, 0.0, 1.0);
    float _2862 = -_2846;
    float _2864 = _2862 + _2848;
    float _2866 = -_2850;
    float _2868 = _2866 + _2852;
    float _2870 = -_2854;
    float _2872 = _2870 + _2856;
    bool _2874 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2876 = fma(_2860, _2864, _2846);
    float _2878 = fma(_2860, _2868, _2850);
    float _2880 = fma(_2860, _2872, _2854);
    float _2882 = _2876 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2884 = fma(_2878, 0.298911988735198974609375, _2882);
    float _2886 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2888 = fma(_2880, 0.114477999508380889892578125, _2884);
    out.m_61.x = _2886;
    float _2890 = -_2888;
    float _2892 = _2878 + _2890;
    float _2894 = -_2888;
    float _2896 = _2876 + _2894;
    float _2898 = -_2888;
    float _2900 = _2880 + _2898;
    float _2902 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    float _2904 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    float _2906 = fma(_2900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    out.m_105.x = _2902;
    out.m_105.y = _2904;
    out.m_105.z = _2906;
    if (!_2874)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2908 = -_1668;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2912 = -_1670;
    float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2916 = -_1672;
    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2920 = _2910 * _2910;
    float _2922 = fma(_2914, _2914, _2920);
    float _2924 = fma(_2918, _2918, _2922);
    float _2926 = sqrt(_2924);
    float _2928 = rsqrt(_2924);
    float _2930 = -_2926;
    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2936 = precise::clamp(_2934, 0.0, 1.0);
    float _2938 = _2914 * _2928;
    float _2940 = _2910 * _2928;
    float _2942 = abs(_2936);
    float _2944 = log2(_2942);
    float _2946 = _2918 * _2928;
    float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2950 = _1570 * _2940;
    float _2952 = -_2940;
    float _2954 = -_2948;
    float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
    float _2958 = fma(_1556, _2938, _2950);
    float _2960 = -_2946;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
    float _2964 = fma(_1576, _2946, _2958);
    float _2966 = precise::clamp(_2964, 0.0, 1.0);
    float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2970 = _2962 + _2968;
    float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2976 = precise::clamp(_2974, 0.0, 1.0);
    float _2978 = exp2(_2972);
    float _2980 = _2978 * _2976;
    float _2982 = _2966 * _2980;
    float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2984;
    out.m_103.y = _2986;
    out.m_103.z = _2988;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2760 = false;
    bool _1622 = false;
    bool _496 = false;
    bool _322 = false;
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
        float _3045 = as_type<float>(_140);
        out.gl_Position.z = _3045;
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
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3115 = as_type<float>(_178);
        out.gl_Position.z = _3115;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_65.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_63.x;
    float _196 = in.m_63.y;
    float _198 = in.m_63.z;
    float _200 = in.m_58.x;
    float _202 = in.m_58.y;
    float _204 = in.m_58.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_280, _196, _286);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = fma(_292, _180, _202);
    float _300 = fma(_294, _180, _204);
    bool _302 = !_282;
    float _320;
    if (!_302)
    {
        float _304 = in.m_67.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_124);
        float _326 = 1.0 / _324;
        float _328 = _158 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = _330 + _332;
    bool _336 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_330);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _350 = _330 + _348;
    bool _352 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_330);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_330);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_346;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _370;
    float _390 = _382 * _386;
    float _392 = -_382;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = 1.0 / _366;
    float _404 = _362 * _394;
    float _406 = -_362;
    float _408 = _406 + 1.0;
    float _410 = _350 * _388;
    float _412 = _334 * _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = fma(_398, _412, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = fma(_416, _412, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = fma(_420, _412, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _428 = _422 * _404;
    float _430 = _424 * _404;
    float _432 = _426 * _404;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _448 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _450 = fma(_436, _410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_440, _410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _454 = fma(_444, _410, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _456 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _432);
    float _458 = fma(_450, _390, _446);
    float _460 = fma(_452, _390, _448);
    float _462 = fma(_454, _390, _456);
    float _464 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].x, _458);
    float _466 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].y, _460);
    float _468 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].z, _462);
    bool _470 = !_400;
    int _472 = as_type<int>(_460);
    int _474 = as_type<int>(_450);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494;
    if (!_470)
    {
        float _478 = in.m_67.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _472 = as_type<int>(_488);
        _474 = as_type<int>(_486);
        _496 = true;
    }
    else
    {
        float _498 = float(_124);
        float _500 = 1.0 / _498;
        float _502 = _158 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    int _506 = _472;
    int _508 = _474;
    float _510 = in.m_69.x;
    float _512 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = in.m_67.z;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _518 = _516 != 0;
    float _520 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _524 = _522 != 0;
    float _526 = in.m_67.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _530 = _528 != 0;
    float _532 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _536 = _534 != 0;
    float _538 = in.m_67.w;
    float _540 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _520);
    float _542 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _544 = in.m_69.y;
    float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _548 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_504);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = in.m_67.y;
    int _562 = _508;
    int _564 = _506;
    float _566 = _510;
    if (_518)
    {
        float _568 = -_510;
        float _570 = _568 + 1.0;
        _562 = as_type<int>(_570);
    }
    int _572 = _562;
    if (_524)
    {
        float _574 = -_510;
        float _576 = _574 + 1.0;
        _564 = as_type<int>(_576);
    }
    int _578 = _564;
    if (!_518)
    {
        _476 = _510;
    }
    float _580 = _476;
    float _582 = in.m_71.w;
    bool _584 = _514 > 0.5;
    float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _588 = log2(_586);
    float _590 = 0.0;
    float _592 = _580;
    if (!_524)
    {
        _590 = _510;
    }
    float _594 = _590;
    float _596 = in.m_71.x;
    bool _598 = false;
    float _600 = _594;
    if (_518)
    {
        bool _602 = _526 > 0.5;
        _598 = _602;
    }
    bool _604 = _598;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_524)
    {
        float _608 = _584 ? as_type<float>(_578) : _510;
        _600 = _608;
    }
    float _610 = _600;
    float _612 = in.m_71.y;
    bool _614 = _538 > 0.5;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_518)
    {
        float _618 = _604 ? as_type<float>(_572) : _510;
        _592 = _618;
    }
    float _620 = _592;
    float _622 = in.m_71.z;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _626 = _624 != 0;
    float _628 = -_544;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _634 = _632 != 0;
    float _636 = in.m_65.x;
    float _638 = in.m_65.y;
    float _640 = in.m_65.z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _644 = _642 != 0;
    float _646 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _648 = _614 ? as_type<int>(_630) : as_type<int>(_544);
    float _650 = _588 * _158;
    bool _652 = _560 > 0.5;
    float _654 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _646);
    int _656 = as_type<int>(_646);
    float _658 = _544;
    float _660 = _630;
    if (_530)
    {
        float _662 = -_510;
        float _664 = _662 + 1.0;
        _656 = as_type<int>(_664);
    }
    int _666 = _656;
    out.m_73.w = _582;
    int _668 = _652 ? as_type<int>(_630) : as_type<int>(_544);
    float _670 = exp2(_650);
    if (_530)
    {
        float _672 = _652 ? as_type<float>(_666) : _510;
        _566 = _672;
    }
    float _674 = _566;
    out.m_73.x = _596;
    float _676 = _626 ? as_type<float>(_648) : _544;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _688 = _686 != 0;
    out.m_73.y = _612;
    float _690 = _634 ? as_type<float>(_668) : _544;
    float _692 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _654);
    float _694 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _700 = _468 * _640;
    float _702 = _514 * 2.0;
    float _704 = _466 * _638;
    float _706 = 1.0 / _698;
    float _708 = _464 * _636;
    float _710 = _560 + _514;
    out.m_73.z = _622;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _714 = floor(_702);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _718 = _710 + (-1.0);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _720;
    float _724 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _728 = _526 * 2.0;
    float _730 = _722 * _706;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _734 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _736 = floor(_728);
    float _738 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _742 = _714 >= 0.0;
    bool _744 = isnan(_714);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_75.x = _724;
    out.m_75.y = _726;
    out.m_75.z = _738;
    if (_644)
    {
        float _754 = _584 ? _630 : _544;
        _658 = _754;
    }
    float _756 = _658;
    float _758 = _546 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _760 = _750 ? 0 : 1;
    float _762 = -_670;
    float _764 = _762 + 1.0;
    bool _766 = _714 > 0.0;
    float _768 = fma(_676, _758, -0.5);
    float _770 = in.m_77.x;
    float _772 = in.m_77.y;
    float _774 = in.m_77.z;
    int _776 = ~_760;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    float _782 = 0.0;
    int _784 = _780;
    if (!_536)
    {
        _782 = _560;
    }
    float _786 = _782;
    float _788 = _560 * 2.0;
    float _790 = _526 + _560;
    float _792 = _526 + _514;
    float _794 = _786;
    if (!_536)
    {
        _660 = _514;
    }
    float _796 = _660;
    float _798 = _790 + (-1.0);
    float _800 = floor(_788);
    float _802 = _792 + (-1.0);
    float _804 = _798;
    float _806 = _796;
    if (!_766)
    {
        int _808 = ~_760;
        int _810 = _808 + 1;
        _784 = _810;
    }
    int _812 = _784;
    float _814 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = as_type<float>(_812);
    if (!_536)
    {
        _804 = _514;
    }
    float _818 = _804;
    float _820 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _822 = _818;
    if (_536)
    {
        _794 = _526;
    }
    float _824 = _794;
    float _826 = _526 + (-0.5);
    if (_536)
    {
        _806 = _560;
    }
    float _828 = _806;
    float _830 = _514 + (-0.5);
    if (_536)
    {
        _822 = _560;
    }
    float _832 = _822;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _606);
    bool _836 = _736 > 0.0;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _772);
    bool _842 = _736 >= 0.0;
    bool _844 = isnan(_736);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _774);
    bool _854 = _800 > 0.0;
    float _856 = _838 * _740;
    bool _858 = _800 >= 0.0;
    bool _860 = isnan(_800);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = _852 * _752;
    float _872 = _840 * _868;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _504 + _874;
    bool _878 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _880 = isnan(_504);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -_558;
    float _892 = _890 + 1.0;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _896 = fma(_730, _876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _900 = _888 * _892;
    float _902 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[83].w, _894);
    float _904 = _824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _906 = _828 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _908 = _896 * _900;
    int _910 = _850 ? 0 : 1;
    float _912 = in.m_79.x;
    float _914 = in.m_79.y;
    float _916 = in.m_79.z;
    bool _918 = _772 != 0.0;
    bool _920 = isnan(_772);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = -_888;
    float _930 = _928 + 1.0;
    float _932 = -_616;
    float _934 = fma(_904, 2.0, _932);
    int _936 = _866 ? 0 : 1;
    float _938 = fma(_906, -2.0, _898);
    bool _940 = _770 == 0.0;
    bool _942 = !_926;
    bool _944 = _940 && _942;
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[115].x, _908);
    float _948 = _560 + (-0.5);
    int _950 = ~_910;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    float _956 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[116].x, _946);
    bool _958 = !_680;
    float _960 = _958 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _962 = _954;
    float _964 = _960;
    float _966 = _902;
    if (!_836)
    {
        int _968 = ~_910;
        int _970 = _968 + 1;
        _962 = _970;
    }
    int _972 = _962;
    bool _974 = _774 == 0.0;
    bool _976 = _974 && _944;
    float _978 = in.m_81.x;
    float _980 = in.m_81.y;
    float _982 = in.m_81.z;
    int _984 = ~_936;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    int _990 = _988;
    if (!_854)
    {
        int _992 = ~_936;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1000 = 1.0 + _998;
    int _1002 = abs(as_type<int>(_960));
    float _1004 = float(_812);
    float _1006 = 1.0 / _1000;
    float _1008 = float(_1002);
    bool _1010 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1012 = isnan(1.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1018 = _1014 || _1016;
    bool _1020 = !_684;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = _1008 * _1004;
    if (_976)
    {
        _964 = _912;
    }
    float _1026 = _964;
    float _1028 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _902);
    bool _1030 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _834);
    int _1042 = abs(_1022);
    float _1044 = _1024 * (-2.0);
    float _1046 = _1026;
    if (_976)
    {
        _816 = _1026;
    }
    float _1048 = _816;
    float _1050 = -_158;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[81].x, _934);
    float _1054 = _1048;
    if (!_976)
    {
        _1046 = _912;
    }
    float _1056 = _1046;
    float _1058 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _938);
    float _1060 = _1038 ? _764 : 0.0;
    float _1062 = fma(_814, _1044, _814);
    if (!_976)
    {
        float _1064 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1054 = _1064;
    }
    float _1066 = _1054;
    float _1068 = float(_972);
    if (_1018)
    {
        float _1070 = _1060 * _1006;
        _160 = _1070;
    }
    float _1072 = _160;
    float _1074 = fma(_1044, _978, _978);
    bool _1076 = !_688;
    float _1078 = _1076 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1082 = float(_1042);
    float _1084 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1074);
    float _1086 = _1078;
    if (_976)
    {
        _966 = _914;
    }
    float _1088 = _966;
    int _1090 = abs(as_type<int>(_1078));
    float _1092 = _1082 * _1068;
    float _1094 = _1088;
    float _1096 = as_type<float>(_1090);
    float _1098 = _1092;
    if (_976)
    {
        _1086 = _1088;
    }
    float _1100 = _1086;
    float _1102 = fma(_1062, _1072, _1084);
    float _1104 = _1100;
    if (!_976)
    {
        _1094 = _914;
    }
    float _1106 = _1094;
    float _1108 = _1092 * (-2.0);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = float(_996);
    float _1114 = fma(_1108, _980, _980);
    float _1116 = float(_1090);
    float _1118 = fma(_734, _1108, _734);
    if (_976)
    {
        _1096 = _916;
    }
    float _1120 = _1096;
    float _1122 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1114);
    float _1124 = -_1058;
    float _1126 = fma(_1028, _768, _1124);
    float _1128 = _1116 * _1112;
    float _1130 = _1120;
    if (_976)
    {
        _1098 = _1120;
    }
    float _1132 = _1098;
    float _1134 = fma(_1118, _1072, _1122);
    float _1136 = _1132;
    if (!_976)
    {
        _1130 = _916;
    }
    float _1138 = _1130;
    float _1140 = _1128 * (-2.0);
    float _1142 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1144 = in.m_83.x;
    float _1146 = in.m_83.y;
    float _1148 = in.m_83.z;
    float _1150 = in.m_83.w;
    float _1152 = _1134 * 0.15915493667125701904296875;
    float _1154 = fma(_1140, _982, _982);
    float _1156 = fma(_820, _1140, _820);
    float _1158 = _1110 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = fma(_1142, _610, -0.5);
    float _1164 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1154);
    if (!_976)
    {
        float _1166 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1104 = _1166;
    }
    float _1168 = _1104;
    if (!_976)
    {
        float _1170 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1138);
        _1136 = _1170;
    }
    float _1172 = _1136;
    float _1174 = fma(_1156, _1072, _1164);
    float _1176 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1178 = _1110 * 6.283185482025146484375;
    float _1180 = cos(_1178);
    float _1182 = _1174 * 0.15915493667125701904296875;
    float _1184 = fma(_1040, _1162, _1052);
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1190 = _1152 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1146 * _1138;
    float _1202 = _1148 * _1056;
    float _1204 = _1144 * _1106;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1152 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = -_1202;
    float _1214 = fma(_1144, _1138, _1212);
    float _1216 = -_1200;
    float _1218 = fma(_1148, _1106, _1216);
    float _1220 = -_1204;
    float _1222 = fma(_1146, _1056, _1220);
    out.m_85.x = _1196;
    out.m_85.y = _1198;
    out.m_85.z = _1206;
    out.m_85.w = _1176;
    float _1224 = _1214 * _1150;
    float _1226 = _1218 * _1150;
    float _1228 = _1222 * _1150;
    float _1230 = _1182 * 6.283185482025146484375;
    float _1232 = cos(_1230);
    float _1234 = _1160 * _1192;
    float _1236 = _1180 * _1192;
    float _1238 = _1182 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _1180 * _1210;
    float _1244 = _1180 * _1232;
    float _1246 = _1160 * _1210;
    float _1248 = _1160 * _1232;
    float _1250 = _1210 * _1232;
    float _1252 = _1192 * _1232;
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1256 = _1248 * _872;
    float _1258 = fma(_1240, _1242, _1234);
    float _1260 = fma(_1240, _1234, _1242);
    float _1262 = _1244 * _872;
    float _1264 = -_1236;
    float _1266 = fma(_1240, _1246, _1264);
    float _1268 = -_872;
    float _1270 = _1240 * _1268;
    float _1272 = -_1246;
    float _1274 = fma(_1240, _1236, _1272);
    float _1276 = fma(_1258, _856, _1262);
    float _1278 = fma(_1266, _856, _1256);
    float _1280 = fma(_1250, _856, _1270);
    float _1282 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1284 = fma(_1274, _870, _1276);
    float _1286 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1288 = fma(_1252, _870, _1280);
    float _1290 = fma(_1260, _870, _1278);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1294 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1296 = -_1240;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1282);
    float _1300 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1292);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1294);
    float _1306 = -_1240;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1286);
    float _1310 = -_1240;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1254);
    float _1314 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1302);
    float _1316 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1304);
    float _1318 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1320 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1326 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1328 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1320);
    float _1330 = _1300 + _1322;
    float _1332 = _1318 + _1324;
    float _1334 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1326);
    float _1336 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1340 = _1330 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1298);
    float _1348 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1312);
    float _1350 = _1340 * _1340;
    float _1352 = _1344 * _1344;
    float _1354 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1308);
    float _1356 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1358 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = _1350 + _1352;
    float _1362 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = sqrt(_1360);
    float _1370 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1372 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1374 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1376 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1378 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1356);
    float _1380 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1328);
    float _1382 = _1346 * _1146;
    float _1384 = _1346 * _1168;
    float _1386 = _1224 * _1346;
    float _1388 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1374);
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1392 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1334);
    float _1394 = _1348 * _1146;
    float _1396 = _1354 * _1146;
    float _1398 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    bool _1400 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1372);
    float _1404 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1376);
    float _1406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1408 = _542 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1410 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1412 = _1348 * _1168;
    float _1414 = _1354 * _1168;
    float _1416 = _1224 * _1348;
    float _1418 = _1224 * _1354;
    float _1420 = _1408 + _1410;
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1424 = fma(_1378, _1066, _1384);
    float _1426 = _1410;
    float _1428 = _1350;
    float _1430 = _1352;
    float _1432 = _1330;
    float _1434 = _1332;
    float _1436 = _1404;
    float _1438 = _1386;
    float _1440 = _1372;
    float _1442 = _1318;
    if (!_1400)
    {
        _1426 = _1350;
    }
    float _1444 = _1426;
    float _1446 = fma(_1380, _1066, _1412);
    float _1448 = fma(_1392, _1066, _1414);
    float _1450 = _1444;
    if (!_1400)
    {
        _1428 = _1420;
    }
    float _1452 = _1428;
    bool _1454 = !_1400;
    float _1456 = _1452;
    if (!_1454)
    {
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1462 = _1368 + _1460;
        float _1464 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = rsqrt(_1360);
        float _1468 = _1462 * _1458;
        float _1470 = _1468 * 0.15915493667125701904296875;
        float _1472 = _1470 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = _1470 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = fma(_1474, _1464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1482 = _1466 * _1480;
        float _1484 = _1478 + (-1.0);
        float _1486 = fma(_1340, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1488 = fma(_1344, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1490 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1494 = _1486 + _1492;
        float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1498 = _1488 + _1496;
        float _1500 = fma(_1420, _1478, _1490);
        float _1502 = _1494 * _1494;
        float _1504 = _1498 * _1498;
        _1456 = _1500;
        _1450 = _1502;
        _1430 = _1504;
        _1432 = _1486;
        _1434 = _1488;
    }
    float _1506 = _1456;
    float _1508 = _1450;
    float _1510 = _1430;
    float _1512 = _1432;
    float _1514 = _1434;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1518 = _1506 + _1516;
    float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1522 = fma(_1378, _1144, _1382);
    float _1524 = fma(_1380, _1144, _1394);
    float _1526 = fma(_1518, _1518, _1508);
    float _1528 = fma(_1392, _1144, _1396);
    float _1530 = fma(_1226, _1378, _1386);
    float _1532 = _756 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1534 = _1526 + _1510;
    float _1536 = _690 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1538 = fma(_1226, _1380, _1416);
    float _1540 = fma(_1226, _1392, _1418);
    float _1542 = _674 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1544 = _1536 * _1390;
    float _1546 = _620 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1548 = sqrt(_1534);
    float _1550 = _1532 * _1422;
    float _1552 = fma(_1228, _1398, _1530);
    float _1554 = _1184 + 0.5;
    float _1556 = fma(_1398, _1172, _1424);
    float _1558 = fma(_1398, _1148, _1522);
    float _1560 = fma(_1402, _1148, _1524);
    float _1562 = fma(_1228, _1402, _1538);
    float _1564 = fma(_1404, _1148, _1528);
    float _1566 = _1542 * _1406;
    float _1568 = _1546 * _1520;
    float _1570 = fma(_1402, _1172, _1446);
    float _1572 = _1126 + 0.5;
    float _1574 = fma(_1228, _1404, _1540);
    float _1576 = fma(_1404, _1172, _1448);
    out.m_87.x = _1566;
    out.m_87.y = _1550;
    bool _1578 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1580 = isnan(_1548);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1586 = _1582 || _1584;
    out.m_89.x = _1568;
    out.m_89.y = _1544;
    out.m_89.z = _1554;
    out.m_89.w = _1572;
    out.m_91.x = _1558;
    out.m_91.y = _1560;
    out.m_91.z = _1564;
    out.m_93.x = _1552;
    out.m_93.y = _1562;
    out.m_93.z = _1574;
    if (!_1586)
    {
        _1436 = 1.0;
    }
    float _1588 = _1436;
    out.m_95.x = _1556;
    out.m_95.y = _1570;
    out.m_95.z = _1576;
    bool _1590 = !_1586;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1548);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1548 + _1604;
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
            bool _1624 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1548);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1548 + _1634;
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
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1506 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1660 = _1512 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1664 = _1514 + _1662;
    float _1666 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1668 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1670 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1672 = fma(_1664, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1674 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1666);
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1678 = _1668 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1682 = _1670 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1672 + _1684;
    float _1688 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1674);
    float _1690 = _1678 * _1678;
    float _1692 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1694 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1696 = fma(_1682, _1682, _1690);
    float _1698 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1692);
    float _1700 = 1.0 / _1694;
    float _1702 = fma(_1686, _1686, _1696);
    float _1704 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1698);
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1708 = rsqrt(_1702);
    float _1710 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1712 = _1706 + _1694;
    float _1714 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1716 = _1408 + _1714;
    float _1718 = _1712 * _1700;
    float _1720 = _1718 * 0.5;
    float _1722 = floor(_1710);
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1728 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1726);
    float _1730 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1724);
    float _1732 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1734 = sqrt(_1702);
    float _1736 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1730);
    float _1738 = _1682 * _1732;
    float _1740 = _1686 * _1732;
    float _1742 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1746 = _1738 * _1738;
    float _1748 = _1740 * _1740;
    float _1750 = 1.0 / _1728;
    float _1752 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1742);
    float _1754 = -_1722;
    float _1756 = _1710 + _1754;
    float _1758 = _1746 + _1748;
    float _1760 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1752);
    float _1762 = sqrt(_1758);
    float _1764 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1770 = _1750 * _1768;
    float _1772 = trunc(_1744);
    int _1774 = int(_1772);
    bool _1776 = _1770 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1778 = _1770 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = _1762 + _1780;
    bool _1784 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = trunc(_1764);
    int _1788 = int(_1786);
    float _1790 = precise::max(0.0, _1766);
    float _1792 = -_1732;
    float _1794 = -_1790;
    float _1796 = fma(_1678, _1792, _1794);
    int _1798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1800 = _1774 + _1798;
    int _1802 = _1800 + 1;
    int _1804 = 2;
    float _1806 = _1732;
    float _1808 = _1758;
    float _1810 = _1782;
    float _1812 = _1738;
    float _1814 = _1746;
    float _1816 = _1796;
    float _1818 = _1716;
    if (!_1776)
    {
        _1804 = 1;
    }
    int _1820 = _1804;
    float _1822 = _1700;
    int _1824 = _1820;
    if (_1784)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1826;
    }
    float _1828 = _1822;
    if (_1784)
    {
        float _1830 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1830;
    }
    float _1832 = _1806;
    int _1834 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1836 = _1788 + _1834;
    int _1838 = _1836 + 1;
    float _1840 = _1832;
    if (_1784)
    {
        float _1842 = rsqrt(_1758);
        _1808 = _1842;
    }
    float _1844 = _1808;
    int _1846 = _1802 | _1838;
    float _1848 = _1844;
    if (_1784)
    {
        float _1850 = _1782 * _1828;
        _1810 = _1850;
    }
    float _1852 = _1810;
    if (_1784)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1438 = _1854;
    }
    float _1856 = _1438;
    bool _1858 = !_1776;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = _1554;
    if (_1784)
    {
        float _1864 = _1856 * 6.283185482025146484375;
        float _1866 = sin(_1864);
        _1862 = _1866;
    }
    float _1868 = _1862;
    if (!_1778)
    {
        _1824 = _1860;
    }
    int _1870 = _1824;
    int _1872 = _1870 << 6;
    bool _1874 = _1802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1876 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _1878 = _1872 + 96;
    uint _1881 = uint(int(uint(_1878) >> uint(2)));
    uint _1883 = uint(int(uint(int(_1881)) >> uint(2)));
    int _1885 = int(_1881) & 3;
    float _1887 = (*spvDescriptorSet0.vp_c15)._m0[int(_1883)][_1885];
    int _1889 = int(_1881) + 1;
    uint _1891 = uint(int(uint(_1889) >> uint(2)));
    int _1893 = _1889 & 3;
    float _1895 = (*spvDescriptorSet0.vp_c15)._m0[int(_1891)][_1893];
    float _1897 = _1856;
    if (_1784)
    {
        float _1899 = _1856 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        _1897 = _1901;
    }
    float _1903 = _1897;
    bool _1905 = _1846 < 0;
    bool _1907 = _1905 || _1874;
    float _1909 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1911 = _1838 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1913 = _1911 || _1907;
    if (_1784)
    {
        float _1915 = fma(_1868, _1832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1915;
    }
    float _1917 = _1840;
    int _1919 = _1872 + 64;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    uint _1923 = uint(int(uint(int(_1921)) >> uint(2)));
    int _1925 = int(_1921) & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    int _1929 = int(_1921) + 1;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    int _1933 = _1929 & 3;
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[int(_1931)][_1933];
    float _1937 = floor(_1876);
    float _1939 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1909);
    float _1941 = 0.0;
    if (_1784)
    {
        float _1943 = _1844 * _1917;
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    if (_1784)
    {
        float _1949 = _1738 * _1945;
        _1812 = _1949;
    }
    float _1951 = _1812;
    int _1953 = _1872 + 48;
    uint _1955 = uint(int(uint(_1953) >> uint(2)));
    uint _1957 = uint(int(uint(int(_1955)) >> uint(2)));
    int _1959 = int(_1955) & 3;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[int(_1957)][_1959];
    int _1963 = int(_1955) + 1;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    int _1967 = _1963 & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    float _1971 = _1903;
    if (_1784)
    {
        float _1973 = _1903 + (-1.0);
        _1848 = _1973;
    }
    float _1975 = _1848;
    float _1977 = _1520;
    float _1979 = _1975;
    if (!_1913)
    {
        float _1981 = floor(_1764);
        _1977 = _1981;
    }
    float _1983 = _1977;
    if (_1784)
    {
        float _1985 = _1951 * _1951;
        _1814 = _1985;
    }
    float _1987 = _1814;
    if (_1784)
    {
        float _1989 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1440 = _1989;
    }
    float _1991 = _1440;
    if (!_1784)
    {
        _1979 = _1740;
    }
    float _1993 = _1979;
    float _1995 = _1993;
    if (_1784)
    {
        float _1997 = _1740 * _1945;
        _1995 = _1997;
    }
    float _1999 = _1995;
    int _2001 = _1872 + 80;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[int(_2013)][_2015];
    float _2019 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1784)
    {
        float _2021 = fma(_1796, _1903, _1991);
        _1816 = _2021;
    }
    float _2023 = _1816;
    if (!_1784)
    {
        _1971 = _1748;
    }
    float _2025 = _1971;
    float _2027 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2031 = _2025;
    int _2033 = as_type<int>(_2029);
    if (_1784)
    {
        float _2035 = _1999 * _1999;
        _2031 = _2035;
    }
    float _2037 = _2031;
    float _2039 = fma(_2023, _2023, _1987);
    int _2041 = _1872 + 104;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
    int _2047 = int(_2043) & 3;
    float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
    int _2051 = int(_2043) + 1;
    uint _2053 = uint(int(uint(_2051) >> uint(2)));
    int _2055 = _2051 & 3;
    float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
    float _2059 = -_1937;
    float _2061 = _1876 + _2059;
    float _2063 = -_2029;
    float _2065 = fma(_2063, _2027, 1.0);
    float _2067 = _2039;
    if (!_1913)
    {
        int _2069 = _1838 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2071 = _2069 + _1802;
        _2033 = _2071;
    }
    int _2073 = _2033;
    float _2075 = _2039 + _2037;
    if (!_1913)
    {
        float _2077 = -_1983;
        float _2079 = _1764 + _2077;
        _2067 = _2079;
    }
    float _2081 = _2067;
    int _2083 = _1872 + 72;
    uint _2085 = uint(int(uint(_2083) >> uint(2)));
    uint _2087 = uint(int(uint(int(_2085)) >> uint(2)));
    int _2089 = int(_2085) & 3;
    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[int(_2087)][_2089];
    int _2093 = int(_2085) + 1;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    int _2097 = _2093 & 3;
    float _2099 = (*spvDescriptorSet0.vp_c15)._m0[int(_2095)][_2097];
    float _2101 = rsqrt(_2075);
    int _2103 = _1872 + 56;
    uint _2105 = uint(int(uint(_2103) >> uint(2)));
    uint _2107 = uint(int(uint(int(_2105)) >> uint(2)));
    int _2109 = int(_2105) & 3;
    float _2111 = (*spvDescriptorSet0.vp_c15)._m0[int(_2107)][_2109];
    int _2113 = int(_2105) + 1;
    uint _2115 = uint(int(uint(_2113) >> uint(2)));
    int _2117 = _2113 & 3;
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[int(_2115)][_2117];
    float _2121 = _1716 * _1895;
    float _2123 = log2(_2065);
    float _2125 = fma(_1300, _1887, _2121);
    int _2127 = _1872 + 88;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    uint _2131 = uint(int(uint(int(_2129)) >> uint(2)));
    int _2133 = int(_2129) & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    int _2137 = int(_2129) + 1;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    int _2141 = _2137 & 3;
    float _2143 = (*spvDescriptorSet0.vp_c15)._m0[int(_2139)][_2141];
    float _2145 = _1716 * _1935;
    float _2147 = _2101 * _1951;
    float _2149 = _2101 * _2023;
    float _2151 = _2101 * _1999;
    float _2153 = fma(_1300, _1927, _2145);
    float _2155 = _1716 * _1969;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2159 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2157);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    int _2163 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _2165 = as_type<int>(_2017);
    int _2167 = as_type<int>(_1887);
    float _2169 = _2161;
    if (!_1913)
    {
        int _2171 = _2073 << 2;
        _2163 = _2171;
    }
    int _2173 = _2163;
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = fma(_1300, _1961, _2155);
    int _2179 = _2173;
    if (!_1913)
    {
        int _2181 = 12 & _2173;
        _2179 = _2181;
    }
    int _2183 = _2179;
    float _2185 = _1716 * _2017;
    if (!_1913)
    {
        uint _2187 = uint(int(uint(_2073) >> uint(2)));
        _2165 = int(_2187);
    }
    int _2189 = _2165;
    float _2191 = fma(_1300, _2009, _2185);
    float _2193 = -_2161;
    float _2195 = _2193 + 1.0;
    if (!_1913)
    {
        int _2197 = _2189 << 4;
        int _2199 = _2197 + _2183;
        _2167 = _2199;
    }
    int _2201 = _2167;
    if (!_1913)
    {
        float _2203 = floor(_1744);
        _2169 = _2203;
    }
    float _2205 = _2169;
    float _2207 = fma(_1318, _2049, _2125);
    float2 _6449 = float2(_1756, _2061);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6449, float2(0.0), isnan(_6449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6449, float2(0.0), isnan(_6449)), level(0.0)).x;
    float _2211 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2213 = abs(_2195);
    float _2215 = log2(_2213);
    float _2217 = fma(_1318, _2091, _2153);
    float _2219 = _2207 + _2057;
    float _2221 = _2217 + _2099;
    float _2223 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2225 = 1.0 / _2219;
    float _2227 = fma(_1318, _2111, _2177);
    float _2229 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2231 = _2147;
    if (!_1913)
    {
        int _2233 = _2201 + 400;
        uint _2235 = uint(int(uint(_2233) >> uint(2)));
        uint _2237 = uint(int(uint(int(_2235)) >> uint(2)));
        int _2239 = int(_2235) & 3;
        float _2241 = (*spvDescriptorSet0.vp_c15)._m0[int(_2237)][_2239];
        _2231 = _2241;
    }
    float _2243 = _2231;
    float _2245 = _2227 + _2119;
    float _2247 = -_2229;
    float _2249 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2247);
    float _2251 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2253 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2223);
    float _2255 = fma(_1318, _2135, _2191);
    float _2257 = -_2151;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2249);
    float _2261 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2263 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2251);
    float _2265 = fma(_2259, -0.5, 0.5);
    float _2267 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2261);
    float _2269 = _2245 * _2225;
    float _2271 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2263);
    float _2273 = _2221 * _2225;
    float _2275 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2267);
    float _2277 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2253);
    bool _2279 = _2269 >= 0.0;
    float _2281 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2285 = fma(_2259, 0.5, 0.5);
    bool _2287 = _2269 <= 1.0;
    bool _2289 = _2287 && _2279;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2293 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2295 = sqrt(_2265);
    bool _2297 = _2273 >= 0.0;
    bool _2299 = _2297 && _2289;
    float _2301 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2291);
    float _2303 = fma(_2285, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2305 = _2277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2307 = _2273 <= 1.0;
    bool _2309 = _2307 && _2299;
    float _2311 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2301);
    float _2313 = fma(_2285, _2303, -0.212114393711090087890625);
    float _2315 = exp2(_2293);
    float _2317 = _2255 + _2143;
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2311);
    float _2321 = fma(_2285, _2313, 1.570728778839111328125);
    float _2323 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2325 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2327 = _2149 + 1.0;
    float _2329 = 1.0 / _2319;
    float _2331 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2323);
    float _2333 = _2313;
    if (_2309)
    {
        float _2335 = float(_1870);
        _2333 = _2335;
    }
    float _2337 = _2333;
    float _2339 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2325);
    float _2341 = _2295 * 0.636619746685028076171875;
    float _2343 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2331);
    float _2345 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2339);
    float _2347 = _2337;
    float _2349 = _2343;
    if (_2309)
    {
        float _2351 = rint(_2337);
        float _2353 = precise::max(_2351, 0.0);
        uint _2355 = uint(_2353);
        uint _2357 = clamp(_2355, 0u, 65535u);
        _2347 = as_type<float>(_2357);
    }
    float _2359 = _2347;
    float _2361 = -_2321;
    float _2363 = fma(_2341, _2361, 1.0);
    float _2365 = -_2149;
    float _2367 = fma(_2315, _2327, _2365);
    float _2369 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2343);
    float _2371 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2345);
    float _2373 = _2317 * _2225;
    float _2375 = _2373;
    if (!_1913)
    {
        float _2377 = -_2205;
        float _2379 = _1744 + _2377;
        _2349 = _2379;
    }
    float _2381 = _2349;
    float _2383 = _2369 * _2329;
    float _2385 = _2371 * _2329;
    float _2387 = _2225;
    if (!_1913)
    {
        float _2389 = rint(_2243);
        float _2391 = precise::max(_2389, 0.0);
        uint _2393 = uint(_2391);
        uint _2395 = clamp(_2393, 0u, 65535u);
        _2387 = as_type<float>(_2395);
    }
    float _2397 = _2387;
    float _2399 = fma(_2383, -0.5, 0.5);
    float _2401 = fma(_2385, 0.5, 0.5);
    float _2403 = fma(_2367, 0.5, 0.5);
    float _2405 = _2273;
    if (_2309)
    {
        float3 _6788 = float3(_2269, _2273, float(as_type<int>(_2359)));
        float3 _6792 = select(_6788, float3(0.0), isnan(_6788));
        float _2407 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6792.xy, uint(rint(_6792.z)), _2373, level(0.0));
        _2405 = _2407;
    }
    float _2409 = _2405;
    float3 _6802 = float3(_2401, _2399, _2211);
    float _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6802, float3(0.0), isnan(_6802)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6802, float3(0.0), isnan(_6802)), level(0.0)).x;
    float3 _6811 = float3(_2401, _2399, _2211);
    float4 _2414 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6811, float3(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6811, float3(0.0), isnan(_6811)), level(0.0)).xyzw;
    float _2416 = _2414.x;
    float _2418 = _2414.y;
    float _2420 = _2414.z;
    float _2422 = _2414.w;
    float2 _6827 = float2(_2363, _2403);
    float3 _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6827, float2(0.0), isnan(_6827)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6827, float2(0.0), isnan(_6827)), level(0.0)).xyz;
    float _2428 = _2426.x;
    float _2430 = _2426.y;
    float _2432 = _2426.z;
    float _2434 = _2397;
    if (!_1913)
    {
        float3 _6848 = float3(_2381, _2081, float(as_type<int>(_2397)));
        float3 _6850 = select(_6848, float3(0.0), isnan(_6848));
        float _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6850.xy, uint(rint(_6850.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6850.xy, uint(rint(_6850.z)), level(0.0)).x;
        _2434 = _2436;
    }
    float _2438 = _2434;
    float _2440 = abs(_1770);
    float _2442 = log2(_2440);
    float _2444 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2446 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2444);
    float _2448 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2450 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2446);
    float _2452 = _2319 * 0.5;
    bool _2454 = _1770 <= 8000.0;
    bool _2456 = isnan(_1770);
    bool _2458 = _2454 || _2456;
    bool _2460 = isnan(8000.0);
    bool _2462 = _2458 || _2460;
    float _2464 = float(_2462);
    float _2466 = exp2(_2448);
    float _2468 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2470 = exp2(_2468);
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2474, -2.0, 3.0);
    float _2478 = _2474 * _2474;
    float _2480 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2450);
    float _2482 = fma(_2369, -0.5, _2452);
    float _2484 = _2478 * _2476;
    float _2486 = _2480 + _2319;
    float _2488 = _2371 + _2319;
    out.gl_Position.x = _2371;
    out.gl_Position.y = _2369;
    out.gl_Position.z = _2480;
    out.gl_Position.w = _2319;
    float _2490 = -_2484;
    float _2492 = _2490 + 1.0;
    float _2494 = _2486 * 0.5;
    float _2496 = _2488 * 0.5;
    float _2498 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2484);
    out.m_97.x = _2496;
    out.m_97.y = _2482;
    out.m_97.z = _2494;
    out.m_97.w = _2319;
    float _2500 = _2464 * _2498;
    float _2502 = _2498;
    if (!_2309)
    {
        _2502 = 1.0;
    }
    float _2504 = _2502;
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2508 = -_2466;
    float _2510 = _2508 + 1.0;
    float _2512 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2514 = -_2209;
    float _2516 = _2514 + 1.0;
    float _2518 = _2516 * _2506;
    float _2520 = precise::clamp(_2518, 0.0, 1.0);
    float _2522 = _2504;
    float _2524 = _2409;
    if (_2309)
    {
        bool _2526 = _2409 >= _2373;
        bool _2528 = isnan(_2409);
        bool _2530 = _2526 || _2528;
        bool _2532 = isnan(_2373);
        bool _2534 = _2530 || _2532;
        float _2536 = float(_2534);
        _2522 = _2536;
    }
    float _2538 = _2522;
    if (_1913)
    {
        _2524 = 1.0;
    }
    float _2540 = _2524;
    float _2542 = _2540;
    if (!_1913)
    {
        int _2544 = _2073 << 4;
        int _2546 = _2544 + 2048;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        uint _2550 = uint(int(uint(int(_2548)) >> uint(2)));
        int _2552 = int(_2548) & 3;
        float _2554 = (*spvDescriptorSet0.vp_c15)._m0[int(_2550)][_2552];
        int _2556 = int(_2548) + 1;
        uint _2558 = uint(int(uint(_2556) >> uint(2)));
        int _2560 = _2556 & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        int _2564 = _2546 + 8;
        uint _2566 = uint(int(uint(_2564) >> uint(2)));
        uint _2568 = uint(int(uint(int(_2566)) >> uint(2)));
        int _2570 = int(_2566) & 3;
        float _2572 = (*spvDescriptorSet0.vp_c15)._m0[int(_2568)][_2570];
        int _2574 = int(_2566) + 1;
        uint _2576 = uint(int(uint(_2574) >> uint(2)));
        int _2578 = _2574 & 3;
        float _2580 = (*spvDescriptorSet0.vp_c15)._m0[int(_2576)][_2578];
        float _2582 = _1716 * _2562;
        float _2584 = fma(_1300, _2554, _2582);
        float _2586 = fma(_1318, _2572, _2584);
        float _2588 = _2586 + _2580;
        float _2590 = precise::clamp(_2588, 0.0, 1.0);
        float _2592 = -_2590;
        float _2594 = _2592 + _2438;
        float _2596 = fma(_2594, 500.0, 1.5);
        float _2598 = exp2(_2596);
        float _2600 = 0.0 + _2598;
        float _2602 = precise::clamp(_2600, 0.0, 1.0);
        _2542 = _2602;
        _1818 = 500.0;
        _2375 = _2562;
    }
    float _2604 = _2542;
    float _2606 = _1818;
    float _2608 = _2375;
    float _2610 = _2538 * _2604;
    float _2612 = _2512 * _2411;
    float _2614 = -_2520;
    float _2616 = fma(_2614, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2618 = -_2512;
    float _2620 = _2618 + 1.0;
    bool _2622 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2624 = isnan(_1734);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2630 = _2626 || _2628;
    float _2632 = _2422 * _2612;
    float _2634 = -_2610;
    float _2636 = fma(_2634, _2616, 1.0);
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2432 * _2612;
    float _2642 = _2422 * _2620;
    float _2644 = fma(_2428, _2632, _2416);
    float _2646 = fma(_2430, _2632, _2418);
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2650 = fma(_2422, _2640, _2420);
    out.m_99.x = _2648;
    float _2652 = _2620;
    float _2654 = _2608;
    float _2656 = _2638;
    float _2658 = _2606;
    float _2660 = _2632;
    if (!_2630)
    {
        _2652 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2662 = _2652;
    float _2664 = _2662;
    float _2666 = _2662;
    if (!_2630)
    {
        _2654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2668 = _2654;
    out.m_101.x = _2644;
    out.m_101.y = _2646;
    out.m_101.z = _2650;
    out.m_101.w = _2642;
    float _2670 = _2668;
    float _2672 = _2668;
    if (!_2630)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2656;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2630)
    {
        _1442 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2680 = _1442;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2630)
    {
        _2658 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2686 = _2658;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2630)
    {
        _2660 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2692 = _2660;
    bool _2694 = !_2630;
    float _2696 = _2692;
    float _2698 = _2692;
    if (!_2694)
    {
        bool _2700 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2702 = isnan(_1734);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2712 = _1734 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2714;
            float _2718 = 1.0 / _2716;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2740 = _2712 * _2718;
            float _2742 = precise::clamp(_2740, 0.0, 1.0);
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2748 = fma(_2742, _2722, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2672 = _2750;
            _2690 = _2756;
            _2666 = _2748;
            _2684 = _2754;
            _2678 = _2752;
            _2698 = _2758;
            _2760 = true;
        }
        else
        {
            bool _2762 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2764 = isnan(_1734);
            bool _2766 = _2762 || _2764;
            bool _2768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2770 = _2766 || _2768;
            if (!_2770)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2772 = _2664;
            _2666 = _2772;
            if (!_2770)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2774 = _2670;
            _2672 = _2774;
            if (!_2770)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2776 = _2676;
            _2678 = _2776;
            if (!_2770)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2778 = _2682;
            _2684 = _2778;
            if (!_2770)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2780 = _2688;
            _2690 = _2780;
            if (!_2770)
            {
                _2696 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2782 = _2696;
            bool _2784 = !_2770;
            _2698 = _2782;
            if (!_2784)
            {
                bool _2786 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2788 = isnan(_1734);
                bool _2790 = _2786 || _2788;
                bool _2792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2794 = _2790 || _2792;
                if (!_2794)
                {
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2798 = _1734 + _2796;
                    float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2800;
                    float _2804 = 1.0 / _2802;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2826 = _2798 * _2804;
                    float _2828 = precise::clamp(_2826, 0.0, 1.0);
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2834 = fma(_2828, _2808, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2836 = fma(_2828, _2832, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2838 = fma(_2828, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2840 = fma(_2828, _2816, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2842 = fma(_2828, _2820, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2844 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2672 = _2836;
                    _2690 = _2842;
                    _2666 = _2834;
                    _2684 = _2840;
                    _2678 = _2838;
                    _2698 = _2844;
                    _2760 = true;
                }
                else
                {
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2698 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2760 = false;
    float _2846 = _2672;
    float _2848 = _2690;
    float _2850 = _2666;
    float _2852 = _2684;
    float _2854 = _2678;
    float _2856 = _2698;
    float _2858 = fma(_1570, -0.5, 0.5);
    float _2860 = precise::clamp(_2858, 0.0, 1.0);
    float _2862 = -_2846;
    float _2864 = _2862 + _2848;
    float _2866 = -_2850;
    float _2868 = _2866 + _2852;
    float _2870 = -_2854;
    float _2872 = _2870 + _2856;
    bool _2874 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2876 = fma(_2860, _2864, _2846);
    float _2878 = fma(_2860, _2868, _2850);
    float _2880 = fma(_2860, _2872, _2854);
    float _2882 = _2876 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2884 = fma(_2878, 0.298911988735198974609375, _2882);
    float _2886 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2888 = fma(_2880, 0.114477999508380889892578125, _2884);
    out.m_61.x = _2886;
    float _2890 = -_2888;
    float _2892 = _2878 + _2890;
    float _2894 = -_2888;
    float _2896 = _2876 + _2894;
    float _2898 = -_2888;
    float _2900 = _2880 + _2898;
    float _2902 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    float _2904 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    float _2906 = fma(_2900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    out.m_105.x = _2902;
    out.m_105.y = _2904;
    out.m_105.z = _2906;
    if (!_2874)
    {
        return out;
    }
    float _2908 = -_1668;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2912 = -_1670;
    float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2916 = -_1672;
    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2920 = _2910 * _2910;
    float _2922 = fma(_2914, _2914, _2920);
    float _2924 = fma(_2918, _2918, _2922);
    float _2926 = sqrt(_2924);
    float _2928 = rsqrt(_2924);
    float _2930 = -_2926;
    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2936 = precise::clamp(_2934, 0.0, 1.0);
    float _2938 = _2914 * _2928;
    float _2940 = _2910 * _2928;
    float _2942 = abs(_2936);
    float _2944 = log2(_2942);
    float _2946 = _2918 * _2928;
    float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2950 = _1570 * _2940;
    float _2952 = -_2940;
    float _2954 = -_2948;
    float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
    float _2958 = fma(_1556, _2938, _2950);
    float _2960 = -_2946;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
    float _2964 = fma(_1576, _2946, _2958);
    float _2966 = precise::clamp(_2964, 0.0, 1.0);
    float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2970 = _2962 + _2968;
    float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2976 = precise::clamp(_2974, 0.0, 1.0);
    float _2978 = exp2(_2972);
    float _2980 = _2978 * _2976;
    float _2982 = _2966 * _2980;
    float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2984;
    out.m_103.y = _2986;
    out.m_103.z = _2988;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2760 = false;
    bool _1622 = false;
    bool _496 = false;
    bool _322 = false;
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
        float _3045 = as_type<float>(_140);
        out.gl_Position.z = _3045;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_63.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = _158;
    if (_154)
    {
        float _162 = float(_124);
        _134 = _162;
    }
    float _164 = _134;
    bool _166 = _158 >= _164;
    bool _168 = !_154;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_61.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3115 = as_type<float>(_178);
        out.gl_Position.z = _3115;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_65.w;
    float _182 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _184 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _186 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = in.m_63.x;
    float _196 = in.m_63.y;
    float _198 = in.m_63.z;
    float _200 = in.m_58.x;
    float _202 = in.m_58.y;
    float _204 = in.m_58.z;
    float _206 = 0.0;
    float _208 = _182;
    if (!_192)
    {
        float _210 = _182 * _182;
        float _212 = _210 * 0.5;
        _206 = _212;
    }
    float _214 = _206;
    float _216 = _214;
    if (!_192)
    {
        float _218 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _218;
    }
    float _220 = _216;
    bool _222 = !_192;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _182 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _182);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_192;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _182 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _208 = _278;
    }
    float _280 = _208;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _284 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _290 = fma(_280, _194, _284);
    float _292 = fma(_280, _196, _286);
    float _294 = fma(_280, _198, _288);
    float _296 = fma(_290, _180, _200);
    float _298 = fma(_292, _180, _202);
    float _300 = fma(_294, _180, _204);
    bool _302 = !_282;
    float _320;
    if (!_302)
    {
        float _304 = in.m_67.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        float _324 = float(_124);
        float _326 = 1.0 / _324;
        float _328 = _158 * _326;
        _320 = _328;
    }
    _322 = false;
    float _330 = _320;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = _330 + _332;
    bool _336 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = isnan(_330);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _350 = _330 + _348;
    bool _352 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _354 = isnan(_330);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = _330 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_330);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_346;
    float _386 = _384 + 1.0;
    float _388 = 1.0 / _370;
    float _390 = _382 * _386;
    float _392 = -_382;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = 1.0 / _366;
    float _404 = _362 * _394;
    float _406 = -_362;
    float _408 = _406 + 1.0;
    float _410 = _350 * _388;
    float _412 = _334 * _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _418;
    float _422 = fma(_398, _412, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = fma(_416, _412, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _426 = fma(_420, _412, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _428 = _422 * _404;
    float _430 = _424 * _404;
    float _432 = _426 * _404;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _448 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _450 = fma(_436, _410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _452 = fma(_440, _410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _454 = fma(_444, _410, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _456 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _432);
    float _458 = fma(_450, _390, _446);
    float _460 = fma(_452, _390, _448);
    float _462 = fma(_454, _390, _456);
    float _464 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].x, _458);
    float _466 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].y, _460);
    float _468 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[145].z, _462);
    bool _470 = !_400;
    int _472 = as_type<int>(_460);
    int _474 = as_type<int>(_450);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494;
    if (!_470)
    {
        float _478 = in.m_67.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _472 = as_type<int>(_488);
        _474 = as_type<int>(_486);
        _496 = true;
    }
    else
    {
        float _498 = float(_124);
        float _500 = 1.0 / _498;
        float _502 = _158 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    int _506 = _472;
    int _508 = _474;
    float _510 = in.m_69.x;
    float _512 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _514 = in.m_67.z;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _518 = _516 != 0;
    float _520 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _524 = _522 != 0;
    float _526 = in.m_67.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _530 = _528 != 0;
    float _532 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _512);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _536 = _534 != 0;
    float _538 = in.m_67.w;
    float _540 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _520);
    float _542 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _532);
    float _544 = in.m_69.y;
    float _546 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _548 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_504);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = in.m_67.y;
    int _562 = _508;
    int _564 = _506;
    float _566 = _510;
    if (_518)
    {
        float _568 = -_510;
        float _570 = _568 + 1.0;
        _562 = as_type<int>(_570);
    }
    int _572 = _562;
    if (_524)
    {
        float _574 = -_510;
        float _576 = _574 + 1.0;
        _564 = as_type<int>(_576);
    }
    int _578 = _564;
    if (!_518)
    {
        _476 = _510;
    }
    float _580 = _476;
    float _582 = in.m_71.w;
    bool _584 = _514 > 0.5;
    float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _588 = log2(_586);
    float _590 = 0.0;
    float _592 = _580;
    if (!_524)
    {
        _590 = _510;
    }
    float _594 = _590;
    float _596 = in.m_71.x;
    bool _598 = false;
    float _600 = _594;
    if (_518)
    {
        bool _602 = _526 > 0.5;
        _598 = _602;
    }
    bool _604 = _598;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_524)
    {
        float _608 = _584 ? as_type<float>(_578) : _510;
        _600 = _608;
    }
    float _610 = _600;
    float _612 = in.m_71.y;
    bool _614 = _538 > 0.5;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_518)
    {
        float _618 = _604 ? as_type<float>(_572) : _510;
        _592 = _618;
    }
    float _620 = _592;
    float _622 = in.m_71.z;
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _626 = _624 != 0;
    float _628 = -_544;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _634 = _632 != 0;
    float _636 = in.m_65.x;
    float _638 = in.m_65.y;
    float _640 = in.m_65.z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _644 = _642 != 0;
    float _646 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _648 = _614 ? as_type<int>(_630) : as_type<int>(_544);
    float _650 = _588 * _158;
    bool _652 = _560 > 0.5;
    float _654 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _646);
    int _656 = as_type<int>(_646);
    float _658 = _544;
    float _660 = _630;
    if (_530)
    {
        float _662 = -_510;
        float _664 = _662 + 1.0;
        _656 = as_type<int>(_664);
    }
    int _666 = _656;
    out.m_73.w = _582;
    int _668 = _652 ? as_type<int>(_630) : as_type<int>(_544);
    float _670 = exp2(_650);
    if (_530)
    {
        float _672 = _652 ? as_type<float>(_666) : _510;
        _566 = _672;
    }
    float _674 = _566;
    out.m_73.x = _596;
    float _676 = _626 ? as_type<float>(_648) : _544;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _684 = _682 != 0;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _688 = _686 != 0;
    out.m_73.y = _612;
    float _690 = _634 ? as_type<float>(_668) : _544;
    float _692 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _654);
    float _694 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _540);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _700 = _468 * _640;
    float _702 = _514 * 2.0;
    float _704 = _466 * _638;
    float _706 = 1.0 / _698;
    float _708 = _464 * _636;
    float _710 = _560 + _514;
    out.m_73.z = _622;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _714 = floor(_702);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _718 = _710 + (-1.0);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _720;
    float _724 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _728 = _526 * 2.0;
    float _730 = _722 * _706;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _734 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _736 = floor(_728);
    float _738 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _742 = _714 >= 0.0;
    bool _744 = isnan(_714);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    out.m_75.x = _724;
    out.m_75.y = _726;
    out.m_75.z = _738;
    if (_644)
    {
        float _754 = _584 ? _630 : _544;
        _658 = _754;
    }
    float _756 = _658;
    float _758 = _546 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _760 = _750 ? 0 : 1;
    float _762 = -_670;
    float _764 = _762 + 1.0;
    bool _766 = _714 > 0.0;
    float _768 = fma(_676, _758, -0.5);
    float _770 = in.m_77.x;
    float _772 = in.m_77.y;
    float _774 = in.m_77.z;
    int _776 = ~_760;
    int _778 = _776 + 1;
    int _780 = _778 + 1;
    float _782 = 0.0;
    int _784 = _780;
    if (!_536)
    {
        _782 = _560;
    }
    float _786 = _782;
    float _788 = _560 * 2.0;
    float _790 = _526 + _560;
    float _792 = _526 + _514;
    float _794 = _786;
    if (!_536)
    {
        _660 = _514;
    }
    float _796 = _660;
    float _798 = _790 + (-1.0);
    float _800 = floor(_788);
    float _802 = _792 + (-1.0);
    float _804 = _798;
    float _806 = _796;
    if (!_766)
    {
        int _808 = ~_760;
        int _810 = _808 + 1;
        _784 = _810;
    }
    int _812 = _784;
    float _814 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _816 = as_type<float>(_812);
    if (!_536)
    {
        _804 = _514;
    }
    float _818 = _804;
    float _820 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _822 = _818;
    if (_536)
    {
        _794 = _526;
    }
    float _824 = _794;
    float _826 = _526 + (-0.5);
    if (_536)
    {
        _806 = _560;
    }
    float _828 = _806;
    float _830 = _514 + (-0.5);
    if (_536)
    {
        _822 = _560;
    }
    float _832 = _822;
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _606);
    bool _836 = _736 > 0.0;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _772);
    bool _842 = _736 >= 0.0;
    bool _844 = isnan(_736);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _774);
    bool _854 = _800 > 0.0;
    float _856 = _838 * _740;
    bool _858 = _800 >= 0.0;
    bool _860 = isnan(_800);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = _852 * _752;
    float _872 = _840 * _868;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _876 = _504 + _874;
    bool _878 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _880 = isnan(_504);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = -_558;
    float _892 = _890 + 1.0;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _896 = fma(_730, _876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _900 = _888 * _892;
    float _902 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[83].w, _894);
    float _904 = _824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _906 = _828 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _908 = _896 * _900;
    int _910 = _850 ? 0 : 1;
    float _912 = in.m_79.x;
    float _914 = in.m_79.y;
    float _916 = in.m_79.z;
    bool _918 = _772 != 0.0;
    bool _920 = isnan(_772);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = -_888;
    float _930 = _928 + 1.0;
    float _932 = -_616;
    float _934 = fma(_904, 2.0, _932);
    int _936 = _866 ? 0 : 1;
    float _938 = fma(_906, -2.0, _898);
    bool _940 = _770 == 0.0;
    bool _942 = !_926;
    bool _944 = _940 && _942;
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[115].x, _908);
    float _948 = _560 + (-0.5);
    int _950 = ~_910;
    int _952 = _950 + 1;
    int _954 = _952 + 1;
    float _956 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[116].x, _946);
    bool _958 = !_680;
    float _960 = _958 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _962 = _954;
    float _964 = _960;
    float _966 = _902;
    if (!_836)
    {
        int _968 = ~_910;
        int _970 = _968 + 1;
        _962 = _970;
    }
    int _972 = _962;
    bool _974 = _774 == 0.0;
    bool _976 = _974 && _944;
    float _978 = in.m_81.x;
    float _980 = in.m_81.y;
    float _982 = in.m_81.z;
    int _984 = ~_936;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    int _990 = _988;
    if (!_854)
    {
        int _992 = ~_936;
        int _994 = _992 + 1;
        _990 = _994;
    }
    int _996 = _990;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1000 = 1.0 + _998;
    int _1002 = abs(as_type<int>(_960));
    float _1004 = float(_812);
    float _1006 = 1.0 / _1000;
    float _1008 = float(_1002);
    bool _1010 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1012 = isnan(1.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1018 = _1014 || _1016;
    bool _1020 = !_684;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = _1008 * _1004;
    if (_976)
    {
        _964 = _912;
    }
    float _1026 = _964;
    float _1028 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].w, _902);
    bool _1030 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(0.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[82].z, _834);
    int _1042 = abs(_1022);
    float _1044 = _1024 * (-2.0);
    float _1046 = _1026;
    if (_976)
    {
        _816 = _1026;
    }
    float _1048 = _816;
    float _1050 = -_158;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[81].x, _934);
    float _1054 = _1048;
    if (!_976)
    {
        _1046 = _912;
    }
    float _1056 = _1046;
    float _1058 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[81].y, _938);
    float _1060 = _1038 ? _764 : 0.0;
    float _1062 = fma(_814, _1044, _814);
    if (!_976)
    {
        float _1064 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1056);
        _1054 = _1064;
    }
    float _1066 = _1054;
    float _1068 = float(_972);
    if (_1018)
    {
        float _1070 = _1060 * _1006;
        _160 = _1070;
    }
    float _1072 = _160;
    float _1074 = fma(_1044, _978, _978);
    bool _1076 = !_688;
    float _1078 = _1076 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1082 = float(_1042);
    float _1084 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1074);
    float _1086 = _1078;
    if (_976)
    {
        _966 = _914;
    }
    float _1088 = _966;
    int _1090 = abs(as_type<int>(_1078));
    float _1092 = _1082 * _1068;
    float _1094 = _1088;
    float _1096 = as_type<float>(_1090);
    float _1098 = _1092;
    if (_976)
    {
        _1086 = _1088;
    }
    float _1100 = _1086;
    float _1102 = fma(_1062, _1072, _1084);
    float _1104 = _1100;
    if (!_976)
    {
        _1094 = _914;
    }
    float _1106 = _1094;
    float _1108 = _1092 * (-2.0);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = float(_996);
    float _1114 = fma(_1108, _980, _980);
    float _1116 = float(_1090);
    float _1118 = fma(_734, _1108, _734);
    if (_976)
    {
        _1096 = _916;
    }
    float _1120 = _1096;
    float _1122 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1114);
    float _1124 = -_1058;
    float _1126 = fma(_1028, _768, _1124);
    float _1128 = _1116 * _1112;
    float _1130 = _1120;
    if (_976)
    {
        _1098 = _1120;
    }
    float _1132 = _1098;
    float _1134 = fma(_1118, _1072, _1122);
    float _1136 = _1132;
    if (!_976)
    {
        _1130 = _916;
    }
    float _1138 = _1130;
    float _1140 = _1128 * (-2.0);
    float _1142 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1144 = in.m_83.x;
    float _1146 = in.m_83.y;
    float _1148 = in.m_83.z;
    float _1150 = in.m_83.w;
    float _1152 = _1134 * 0.15915493667125701904296875;
    float _1154 = fma(_1140, _982, _982);
    float _1156 = fma(_820, _1140, _820);
    float _1158 = _1110 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = fma(_1142, _610, -0.5);
    float _1164 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1154);
    if (!_976)
    {
        float _1166 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1104 = _1166;
    }
    float _1168 = _1104;
    if (!_976)
    {
        float _1170 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1138);
        _1136 = _1170;
    }
    float _1172 = _1136;
    float _1174 = fma(_1156, _1072, _1164);
    float _1176 = _956 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1178 = _1110 * 6.283185482025146484375;
    float _1180 = cos(_1178);
    float _1182 = _1174 * 0.15915493667125701904296875;
    float _1184 = fma(_1040, _1162, _1052);
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1190 = _1152 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1146 * _1138;
    float _1202 = _1148 * _1056;
    float _1204 = _1144 * _1106;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1152 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = -_1202;
    float _1214 = fma(_1144, _1138, _1212);
    float _1216 = -_1200;
    float _1218 = fma(_1148, _1106, _1216);
    float _1220 = -_1204;
    float _1222 = fma(_1146, _1056, _1220);
    out.m_85.x = _1196;
    out.m_85.y = _1198;
    out.m_85.z = _1206;
    out.m_85.w = _1176;
    float _1224 = _1214 * _1150;
    float _1226 = _1218 * _1150;
    float _1228 = _1222 * _1150;
    float _1230 = _1182 * 6.283185482025146484375;
    float _1232 = cos(_1230);
    float _1234 = _1160 * _1192;
    float _1236 = _1180 * _1192;
    float _1238 = _1182 * 6.283185482025146484375;
    float _1240 = sin(_1238);
    float _1242 = _1180 * _1210;
    float _1244 = _1180 * _1232;
    float _1246 = _1160 * _1210;
    float _1248 = _1160 * _1232;
    float _1250 = _1210 * _1232;
    float _1252 = _1192 * _1232;
    float _1254 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1256 = _1248 * _872;
    float _1258 = fma(_1240, _1242, _1234);
    float _1260 = fma(_1240, _1234, _1242);
    float _1262 = _1244 * _872;
    float _1264 = -_1236;
    float _1266 = fma(_1240, _1246, _1264);
    float _1268 = -_872;
    float _1270 = _1240 * _1268;
    float _1272 = -_1246;
    float _1274 = fma(_1240, _1236, _1272);
    float _1276 = fma(_1258, _856, _1262);
    float _1278 = fma(_1266, _856, _1256);
    float _1280 = fma(_1250, _856, _1270);
    float _1282 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1284 = fma(_1274, _870, _1276);
    float _1286 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1288 = fma(_1252, _870, _1280);
    float _1290 = fma(_1260, _870, _1278);
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1294 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1296 = -_1240;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1282);
    float _1300 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1292);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1294);
    float _1306 = -_1240;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1286);
    float _1310 = -_1240;
    float _1312 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1254);
    float _1314 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1302);
    float _1316 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1304);
    float _1318 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1320 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1326 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1328 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1320);
    float _1330 = _1300 + _1322;
    float _1332 = _1318 + _1324;
    float _1334 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1326);
    float _1336 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1340 = _1330 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1298);
    float _1348 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1312);
    float _1350 = _1340 * _1340;
    float _1352 = _1344 * _1344;
    float _1354 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1308);
    float _1356 = fma(_1250, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1358 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = _1350 + _1352;
    float _1362 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1366 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = sqrt(_1360);
    float _1370 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1372 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1374 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1376 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1364);
    float _1378 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1356);
    float _1380 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1328);
    float _1382 = _1346 * _1146;
    float _1384 = _1346 * _1168;
    float _1386 = _1224 * _1346;
    float _1388 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1374);
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1392 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1334);
    float _1394 = _1348 * _1146;
    float _1396 = _1354 * _1146;
    float _1398 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1370);
    bool _1400 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1372);
    float _1404 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1376);
    float _1406 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _1408 = _542 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1410 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1412 = _1348 * _1168;
    float _1414 = _1354 * _1168;
    float _1416 = _1224 * _1348;
    float _1418 = _1224 * _1354;
    float _1420 = _1408 + _1410;
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _1424 = fma(_1378, _1066, _1384);
    float _1426 = _1410;
    float _1428 = _1350;
    float _1430 = _1352;
    float _1432 = _1330;
    float _1434 = _1332;
    float _1436 = _1404;
    float _1438 = _1386;
    float _1440 = _1372;
    float _1442 = _1318;
    if (!_1400)
    {
        _1426 = _1350;
    }
    float _1444 = _1426;
    float _1446 = fma(_1380, _1066, _1412);
    float _1448 = fma(_1392, _1066, _1414);
    float _1450 = _1444;
    if (!_1400)
    {
        _1428 = _1420;
    }
    float _1452 = _1428;
    bool _1454 = !_1400;
    float _1456 = _1452;
    if (!_1454)
    {
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1462 = _1368 + _1460;
        float _1464 = _1420 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = rsqrt(_1360);
        float _1468 = _1462 * _1458;
        float _1470 = _1468 * 0.15915493667125701904296875;
        float _1472 = _1470 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = _1470 * 6.283185482025146484375;
        float _1478 = cos(_1476);
        float _1480 = fma(_1474, _1464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1482 = _1466 * _1480;
        float _1484 = _1478 + (-1.0);
        float _1486 = fma(_1340, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1488 = fma(_1344, _1482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1490 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1494 = _1486 + _1492;
        float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1498 = _1488 + _1496;
        float _1500 = fma(_1420, _1478, _1490);
        float _1502 = _1494 * _1494;
        float _1504 = _1498 * _1498;
        _1456 = _1500;
        _1450 = _1502;
        _1430 = _1504;
        _1432 = _1486;
        _1434 = _1488;
    }
    float _1506 = _1456;
    float _1508 = _1450;
    float _1510 = _1430;
    float _1512 = _1432;
    float _1514 = _1434;
    float _1516 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1518 = _1506 + _1516;
    float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1522 = fma(_1378, _1144, _1382);
    float _1524 = fma(_1380, _1144, _1394);
    float _1526 = fma(_1518, _1518, _1508);
    float _1528 = fma(_1392, _1144, _1396);
    float _1530 = fma(_1226, _1378, _1386);
    float _1532 = _756 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _1534 = _1526 + _1510;
    float _1536 = _690 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1538 = fma(_1226, _1380, _1416);
    float _1540 = fma(_1226, _1392, _1418);
    float _1542 = _674 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1544 = _1536 * _1390;
    float _1546 = _620 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1548 = sqrt(_1534);
    float _1550 = _1532 * _1422;
    float _1552 = fma(_1228, _1398, _1530);
    float _1554 = _1184 + 0.5;
    float _1556 = fma(_1398, _1172, _1424);
    float _1558 = fma(_1398, _1148, _1522);
    float _1560 = fma(_1402, _1148, _1524);
    float _1562 = fma(_1228, _1402, _1538);
    float _1564 = fma(_1404, _1148, _1528);
    float _1566 = _1542 * _1406;
    float _1568 = _1546 * _1520;
    float _1570 = fma(_1402, _1172, _1446);
    float _1572 = _1126 + 0.5;
    float _1574 = fma(_1228, _1404, _1540);
    float _1576 = fma(_1404, _1172, _1448);
    out.m_87.x = _1566;
    out.m_87.y = _1550;
    bool _1578 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1580 = isnan(_1548);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1586 = _1582 || _1584;
    out.m_89.x = _1568;
    out.m_89.y = _1544;
    out.m_89.z = _1554;
    out.m_89.w = _1572;
    out.m_91.x = _1558;
    out.m_91.y = _1560;
    out.m_91.z = _1564;
    out.m_93.x = _1552;
    out.m_93.y = _1562;
    out.m_93.z = _1574;
    if (!_1586)
    {
        _1436 = 1.0;
    }
    float _1588 = _1436;
    out.m_95.x = _1556;
    out.m_95.y = _1570;
    out.m_95.z = _1576;
    bool _1590 = !_1586;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1548);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1548 + _1604;
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
            bool _1624 = _1548 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1548);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1548 + _1634;
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
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1506 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1660 = _1512 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1664 = _1514 + _1662;
    float _1666 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1668 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1670 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1672 = fma(_1664, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1674 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1666);
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1678 = _1668 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1682 = _1670 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1672 + _1684;
    float _1688 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1674);
    float _1690 = _1678 * _1678;
    float _1692 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1694 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1696 = fma(_1682, _1682, _1690);
    float _1698 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1692);
    float _1700 = 1.0 / _1694;
    float _1702 = fma(_1686, _1686, _1696);
    float _1704 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1698);
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1708 = rsqrt(_1702);
    float _1710 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1712 = _1706 + _1694;
    float _1714 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1716 = _1408 + _1714;
    float _1718 = _1712 * _1700;
    float _1720 = _1718 * 0.5;
    float _1722 = floor(_1710);
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1728 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1726);
    float _1730 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1724);
    float _1732 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1734 = sqrt(_1702);
    float _1736 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1730);
    float _1738 = _1682 * _1732;
    float _1740 = _1686 * _1732;
    float _1742 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1744 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1746 = _1738 * _1738;
    float _1748 = _1740 * _1740;
    float _1750 = 1.0 / _1728;
    float _1752 = fma(_1300, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1742);
    float _1754 = -_1722;
    float _1756 = _1710 + _1754;
    float _1758 = _1746 + _1748;
    float _1760 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1752);
    float _1762 = sqrt(_1758);
    float _1764 = _1760 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1766 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1768 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1770 = _1750 * _1768;
    float _1772 = trunc(_1744);
    int _1774 = int(_1772);
    bool _1776 = _1770 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1778 = _1770 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = _1762 + _1780;
    bool _1784 = _1762 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = trunc(_1764);
    int _1788 = int(_1786);
    float _1790 = precise::max(0.0, _1766);
    float _1792 = -_1732;
    float _1794 = -_1790;
    float _1796 = fma(_1678, _1792, _1794);
    int _1798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1800 = _1774 + _1798;
    int _1802 = _1800 + 1;
    int _1804 = 2;
    float _1806 = _1732;
    float _1808 = _1758;
    float _1810 = _1782;
    float _1812 = _1738;
    float _1814 = _1746;
    float _1816 = _1796;
    float _1818 = _1716;
    if (!_1776)
    {
        _1804 = 1;
    }
    int _1820 = _1804;
    float _1822 = _1700;
    int _1824 = _1820;
    if (_1784)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1826;
    }
    float _1828 = _1822;
    if (_1784)
    {
        float _1830 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1806 = _1830;
    }
    float _1832 = _1806;
    int _1834 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1836 = _1788 + _1834;
    int _1838 = _1836 + 1;
    float _1840 = _1832;
    if (_1784)
    {
        float _1842 = rsqrt(_1758);
        _1808 = _1842;
    }
    float _1844 = _1808;
    int _1846 = _1802 | _1838;
    float _1848 = _1844;
    if (_1784)
    {
        float _1850 = _1782 * _1828;
        _1810 = _1850;
    }
    float _1852 = _1810;
    if (_1784)
    {
        float _1854 = _1852 * 0.15915493667125701904296875;
        _1438 = _1854;
    }
    float _1856 = _1438;
    bool _1858 = !_1776;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = _1554;
    if (_1784)
    {
        float _1864 = _1856 * 6.283185482025146484375;
        float _1866 = sin(_1864);
        _1862 = _1866;
    }
    float _1868 = _1862;
    if (!_1778)
    {
        _1824 = _1860;
    }
    int _1870 = _1824;
    int _1872 = _1870 << 6;
    bool _1874 = _1802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1876 = fma(_1318, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _1878 = _1872 + 96;
    uint _1881 = uint(int(uint(_1878) >> uint(2)));
    uint _1883 = uint(int(uint(int(_1881)) >> uint(2)));
    int _1885 = int(_1881) & 3;
    float _1887 = (*spvDescriptorSet0.vp_c15)._m0[int(_1883)][_1885];
    int _1889 = int(_1881) + 1;
    uint _1891 = uint(int(uint(_1889) >> uint(2)));
    int _1893 = _1889 & 3;
    float _1895 = (*spvDescriptorSet0.vp_c15)._m0[int(_1891)][_1893];
    float _1897 = _1856;
    if (_1784)
    {
        float _1899 = _1856 * 6.283185482025146484375;
        float _1901 = cos(_1899);
        _1897 = _1901;
    }
    float _1903 = _1897;
    bool _1905 = _1846 < 0;
    bool _1907 = _1905 || _1874;
    float _1909 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1911 = _1838 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1913 = _1911 || _1907;
    if (_1784)
    {
        float _1915 = fma(_1868, _1832, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1915;
    }
    float _1917 = _1840;
    int _1919 = _1872 + 64;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    uint _1923 = uint(int(uint(int(_1921)) >> uint(2)));
    int _1925 = int(_1921) & 3;
    float _1927 = (*spvDescriptorSet0.vp_c15)._m0[int(_1923)][_1925];
    int _1929 = int(_1921) + 1;
    uint _1931 = uint(int(uint(_1929) >> uint(2)));
    int _1933 = _1929 & 3;
    float _1935 = (*spvDescriptorSet0.vp_c15)._m0[int(_1931)][_1933];
    float _1937 = floor(_1876);
    float _1939 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1909);
    float _1941 = 0.0;
    if (_1784)
    {
        float _1943 = _1844 * _1917;
        _1941 = _1943;
    }
    float _1945 = _1941;
    float _1947 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1939);
    if (_1784)
    {
        float _1949 = _1738 * _1945;
        _1812 = _1949;
    }
    float _1951 = _1812;
    int _1953 = _1872 + 48;
    uint _1955 = uint(int(uint(_1953) >> uint(2)));
    uint _1957 = uint(int(uint(int(_1955)) >> uint(2)));
    int _1959 = int(_1955) & 3;
    float _1961 = (*spvDescriptorSet0.vp_c15)._m0[int(_1957)][_1959];
    int _1963 = int(_1955) + 1;
    uint _1965 = uint(int(uint(_1963) >> uint(2)));
    int _1967 = _1963 & 3;
    float _1969 = (*spvDescriptorSet0.vp_c15)._m0[int(_1965)][_1967];
    float _1971 = _1903;
    if (_1784)
    {
        float _1973 = _1903 + (-1.0);
        _1848 = _1973;
    }
    float _1975 = _1848;
    float _1977 = _1520;
    float _1979 = _1975;
    if (!_1913)
    {
        float _1981 = floor(_1764);
        _1977 = _1981;
    }
    float _1983 = _1977;
    if (_1784)
    {
        float _1985 = _1951 * _1951;
        _1814 = _1985;
    }
    float _1987 = _1814;
    if (_1784)
    {
        float _1989 = _1975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1440 = _1989;
    }
    float _1991 = _1440;
    if (!_1784)
    {
        _1979 = _1740;
    }
    float _1993 = _1979;
    float _1995 = _1993;
    if (_1784)
    {
        float _1997 = _1740 * _1945;
        _1995 = _1997;
    }
    float _1999 = _1995;
    int _2001 = _1872 + 80;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[int(_2013)][_2015];
    float _2019 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1784)
    {
        float _2021 = fma(_1796, _1903, _1991);
        _1816 = _2021;
    }
    float _2023 = _1816;
    if (!_1784)
    {
        _1971 = _1748;
    }
    float _2025 = _1971;
    float _2027 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2031 = _2025;
    int _2033 = as_type<int>(_2029);
    if (_1784)
    {
        float _2035 = _1999 * _1999;
        _2031 = _2035;
    }
    float _2037 = _2031;
    float _2039 = fma(_2023, _2023, _1987);
    int _2041 = _1872 + 104;
    uint _2043 = uint(int(uint(_2041) >> uint(2)));
    uint _2045 = uint(int(uint(int(_2043)) >> uint(2)));
    int _2047 = int(_2043) & 3;
    float _2049 = (*spvDescriptorSet0.vp_c15)._m0[int(_2045)][_2047];
    int _2051 = int(_2043) + 1;
    uint _2053 = uint(int(uint(_2051) >> uint(2)));
    int _2055 = _2051 & 3;
    float _2057 = (*spvDescriptorSet0.vp_c15)._m0[int(_2053)][_2055];
    float _2059 = -_1937;
    float _2061 = _1876 + _2059;
    float _2063 = -_2029;
    float _2065 = fma(_2063, _2027, 1.0);
    float _2067 = _2039;
    if (!_1913)
    {
        int _2069 = _1838 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2071 = _2069 + _1802;
        _2033 = _2071;
    }
    int _2073 = _2033;
    float _2075 = _2039 + _2037;
    if (!_1913)
    {
        float _2077 = -_1983;
        float _2079 = _1764 + _2077;
        _2067 = _2079;
    }
    float _2081 = _2067;
    int _2083 = _1872 + 72;
    uint _2085 = uint(int(uint(_2083) >> uint(2)));
    uint _2087 = uint(int(uint(int(_2085)) >> uint(2)));
    int _2089 = int(_2085) & 3;
    float _2091 = (*spvDescriptorSet0.vp_c15)._m0[int(_2087)][_2089];
    int _2093 = int(_2085) + 1;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    int _2097 = _2093 & 3;
    float _2099 = (*spvDescriptorSet0.vp_c15)._m0[int(_2095)][_2097];
    float _2101 = rsqrt(_2075);
    int _2103 = _1872 + 56;
    uint _2105 = uint(int(uint(_2103) >> uint(2)));
    uint _2107 = uint(int(uint(int(_2105)) >> uint(2)));
    int _2109 = int(_2105) & 3;
    float _2111 = (*spvDescriptorSet0.vp_c15)._m0[int(_2107)][_2109];
    int _2113 = int(_2105) + 1;
    uint _2115 = uint(int(uint(_2113) >> uint(2)));
    int _2117 = _2113 & 3;
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[int(_2115)][_2117];
    float _2121 = _1716 * _1895;
    float _2123 = log2(_2065);
    float _2125 = fma(_1300, _1887, _2121);
    int _2127 = _1872 + 88;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    uint _2131 = uint(int(uint(int(_2129)) >> uint(2)));
    int _2133 = int(_2129) & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    int _2137 = int(_2129) + 1;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    int _2141 = _2137 & 3;
    float _2143 = (*spvDescriptorSet0.vp_c15)._m0[int(_2139)][_2141];
    float _2145 = _1716 * _1935;
    float _2147 = _2101 * _1951;
    float _2149 = _2101 * _2023;
    float _2151 = _2101 * _1999;
    float _2153 = fma(_1300, _1927, _2145);
    float _2155 = _1716 * _1969;
    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2159 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2157);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    int _2163 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[23].w);
    int _2165 = as_type<int>(_2017);
    int _2167 = as_type<int>(_1887);
    float _2169 = _2161;
    if (!_1913)
    {
        int _2171 = _2073 << 2;
        _2163 = _2171;
    }
    int _2173 = _2163;
    float _2175 = _2123 * 0.693147182464599609375;
    float _2177 = fma(_1300, _1961, _2155);
    int _2179 = _2173;
    if (!_1913)
    {
        int _2181 = 12 & _2173;
        _2179 = _2181;
    }
    int _2183 = _2179;
    float _2185 = _1716 * _2017;
    if (!_1913)
    {
        uint _2187 = uint(int(uint(_2073) >> uint(2)));
        _2165 = int(_2187);
    }
    int _2189 = _2165;
    float _2191 = fma(_1300, _2009, _2185);
    float _2193 = -_2161;
    float _2195 = _2193 + 1.0;
    if (!_1913)
    {
        int _2197 = _2189 << 4;
        int _2199 = _2197 + _2183;
        _2167 = _2199;
    }
    int _2201 = _2167;
    if (!_1913)
    {
        float _2203 = floor(_1744);
        _2169 = _2203;
    }
    float _2205 = _2169;
    float _2207 = fma(_1318, _2049, _2125);
    float2 _6449 = float2(_1756, _2061);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6449, float2(0.0), isnan(_6449)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6449, float2(0.0), isnan(_6449)), level(0.0)).x;
    float _2211 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2213 = abs(_2195);
    float _2215 = log2(_2213);
    float _2217 = fma(_1318, _2091, _2153);
    float _2219 = _2207 + _2057;
    float _2221 = _2217 + _2099;
    float _2223 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2225 = 1.0 / _2219;
    float _2227 = fma(_1318, _2111, _2177);
    float _2229 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2231 = _2147;
    if (!_1913)
    {
        int _2233 = _2201 + 400;
        uint _2235 = uint(int(uint(_2233) >> uint(2)));
        uint _2237 = uint(int(uint(int(_2235)) >> uint(2)));
        int _2239 = int(_2235) & 3;
        float _2241 = (*spvDescriptorSet0.vp_c15)._m0[int(_2237)][_2239];
        _2231 = _2241;
    }
    float _2243 = _2231;
    float _2245 = _2227 + _2119;
    float _2247 = -_2229;
    float _2249 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2247);
    float _2251 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2253 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2223);
    float _2255 = fma(_1318, _2135, _2191);
    float _2257 = -_2151;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2249);
    float _2261 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2263 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2251);
    float _2265 = fma(_2259, -0.5, 0.5);
    float _2267 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2261);
    float _2269 = _2245 * _2225;
    float _2271 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2263);
    float _2273 = _2221 * _2225;
    float _2275 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2267);
    float _2277 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2253);
    bool _2279 = _2269 >= 0.0;
    float _2281 = _2271 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2285 = fma(_2259, 0.5, 0.5);
    bool _2287 = _2269 <= 1.0;
    bool _2289 = _2287 && _2279;
    float _2291 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2293 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2295 = sqrt(_2265);
    bool _2297 = _2273 >= 0.0;
    bool _2299 = _2297 && _2289;
    float _2301 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2291);
    float _2303 = fma(_2285, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2305 = _2277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2307 = _2273 <= 1.0;
    bool _2309 = _2307 && _2299;
    float _2311 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2301);
    float _2313 = fma(_2285, _2303, -0.212114393711090087890625);
    float _2315 = exp2(_2293);
    float _2317 = _2255 + _2143;
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2311);
    float _2321 = fma(_2285, _2313, 1.570728778839111328125);
    float _2323 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2325 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2327 = _2149 + 1.0;
    float _2329 = 1.0 / _2319;
    float _2331 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2323);
    float _2333 = _2313;
    if (_2309)
    {
        float _2335 = float(_1870);
        _2333 = _2335;
    }
    float _2337 = _2333;
    float _2339 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2325);
    float _2341 = _2295 * 0.636619746685028076171875;
    float _2343 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2331);
    float _2345 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2339);
    float _2347 = _2337;
    float _2349 = _2343;
    if (_2309)
    {
        float _2351 = rint(_2337);
        float _2353 = precise::max(_2351, 0.0);
        uint _2355 = uint(_2353);
        uint _2357 = clamp(_2355, 0u, 65535u);
        _2347 = as_type<float>(_2357);
    }
    float _2359 = _2347;
    float _2361 = -_2321;
    float _2363 = fma(_2341, _2361, 1.0);
    float _2365 = -_2149;
    float _2367 = fma(_2315, _2327, _2365);
    float _2369 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2343);
    float _2371 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2345);
    float _2373 = _2317 * _2225;
    float _2375 = _2373;
    if (!_1913)
    {
        float _2377 = -_2205;
        float _2379 = _1744 + _2377;
        _2349 = _2379;
    }
    float _2381 = _2349;
    float _2383 = _2369 * _2329;
    float _2385 = _2371 * _2329;
    float _2387 = _2225;
    if (!_1913)
    {
        float _2389 = rint(_2243);
        float _2391 = precise::max(_2389, 0.0);
        uint _2393 = uint(_2391);
        uint _2395 = clamp(_2393, 0u, 65535u);
        _2387 = as_type<float>(_2395);
    }
    float _2397 = _2387;
    float _2399 = fma(_2383, -0.5, 0.5);
    float _2401 = fma(_2385, 0.5, 0.5);
    float _2403 = fma(_2367, 0.5, 0.5);
    float _2405 = _2273;
    if (_2309)
    {
        float3 _6788 = float3(_2269, _2273, float(as_type<int>(_2359)));
        float3 _6792 = select(_6788, float3(0.0), isnan(_6788));
        float _2407 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6792.xy, uint(rint(_6792.z)), _2373, level(0.0));
        _2405 = _2407;
    }
    float _2409 = _2405;
    float3 _6802 = float3(_2401, _2399, _2211);
    float _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6802, float3(0.0), isnan(_6802)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6802, float3(0.0), isnan(_6802)), level(0.0)).x;
    float3 _6811 = float3(_2401, _2399, _2211);
    float4 _2414 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6811, float3(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6811, float3(0.0), isnan(_6811)), level(0.0)).xyzw;
    float _2416 = _2414.x;
    float _2418 = _2414.y;
    float _2420 = _2414.z;
    float _2422 = _2414.w;
    float2 _6827 = float2(_2363, _2403);
    float3 _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6827, float2(0.0), isnan(_6827)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6827, float2(0.0), isnan(_6827)), level(0.0)).xyz;
    float _2428 = _2426.x;
    float _2430 = _2426.y;
    float _2432 = _2426.z;
    float _2434 = _2397;
    if (!_1913)
    {
        float3 _6848 = float3(_2381, _2081, float(as_type<int>(_2397)));
        float3 _6850 = select(_6848, float3(0.0), isnan(_6848));
        float _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6850.xy, uint(rint(_6850.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6850.xy, uint(rint(_6850.z)), level(0.0)).x;
        _2434 = _2436;
    }
    float _2438 = _2434;
    float _2440 = abs(_1770);
    float _2442 = log2(_2440);
    float _2444 = _2281 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2446 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2444);
    float _2448 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2450 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2446);
    float _2452 = _2319 * 0.5;
    bool _2454 = _1770 <= 8000.0;
    bool _2456 = isnan(_1770);
    bool _2458 = _2454 || _2456;
    bool _2460 = isnan(8000.0);
    bool _2462 = _2458 || _2460;
    float _2464 = float(_2462);
    float _2466 = exp2(_2448);
    float _2468 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2470 = exp2(_2468);
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2474 = precise::clamp(_2472, 0.0, 1.0);
    float _2476 = fma(_2474, -2.0, 3.0);
    float _2478 = _2474 * _2474;
    float _2480 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2450);
    float _2482 = fma(_2369, -0.5, _2452);
    float _2484 = _2478 * _2476;
    float _2486 = _2480 + _2319;
    float _2488 = _2371 + _2319;
    out.gl_Position.x = _2371;
    out.gl_Position.y = _2369;
    out.gl_Position.z = _2480;
    out.gl_Position.w = _2319;
    float _2490 = -_2484;
    float _2492 = _2490 + 1.0;
    float _2494 = _2486 * 0.5;
    float _2496 = _2488 * 0.5;
    float _2498 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2484);
    out.m_97.x = _2496;
    out.m_97.y = _2482;
    out.m_97.z = _2494;
    out.m_97.w = _2319;
    float _2500 = _2464 * _2498;
    float _2502 = _2498;
    if (!_2309)
    {
        _2502 = 1.0;
    }
    float _2504 = _2502;
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2508 = -_2466;
    float _2510 = _2508 + 1.0;
    float _2512 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2514 = -_2209;
    float _2516 = _2514 + 1.0;
    float _2518 = _2516 * _2506;
    float _2520 = precise::clamp(_2518, 0.0, 1.0);
    float _2522 = _2504;
    float _2524 = _2409;
    if (_2309)
    {
        bool _2526 = _2409 >= _2373;
        bool _2528 = isnan(_2409);
        bool _2530 = _2526 || _2528;
        bool _2532 = isnan(_2373);
        bool _2534 = _2530 || _2532;
        float _2536 = float(_2534);
        _2522 = _2536;
    }
    float _2538 = _2522;
    if (_1913)
    {
        _2524 = 1.0;
    }
    float _2540 = _2524;
    float _2542 = _2540;
    if (!_1913)
    {
        int _2544 = _2073 << 4;
        int _2546 = _2544 + 2048;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        uint _2550 = uint(int(uint(int(_2548)) >> uint(2)));
        int _2552 = int(_2548) & 3;
        float _2554 = (*spvDescriptorSet0.vp_c15)._m0[int(_2550)][_2552];
        int _2556 = int(_2548) + 1;
        uint _2558 = uint(int(uint(_2556) >> uint(2)));
        int _2560 = _2556 & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        int _2564 = _2546 + 8;
        uint _2566 = uint(int(uint(_2564) >> uint(2)));
        uint _2568 = uint(int(uint(int(_2566)) >> uint(2)));
        int _2570 = int(_2566) & 3;
        float _2572 = (*spvDescriptorSet0.vp_c15)._m0[int(_2568)][_2570];
        int _2574 = int(_2566) + 1;
        uint _2576 = uint(int(uint(_2574) >> uint(2)));
        int _2578 = _2574 & 3;
        float _2580 = (*spvDescriptorSet0.vp_c15)._m0[int(_2576)][_2578];
        float _2582 = _1716 * _2562;
        float _2584 = fma(_1300, _2554, _2582);
        float _2586 = fma(_1318, _2572, _2584);
        float _2588 = _2586 + _2580;
        float _2590 = precise::clamp(_2588, 0.0, 1.0);
        float _2592 = -_2590;
        float _2594 = _2592 + _2438;
        float _2596 = fma(_2594, 500.0, 1.5);
        float _2598 = exp2(_2596);
        float _2600 = 0.0 + _2598;
        float _2602 = precise::clamp(_2600, 0.0, 1.0);
        _2542 = _2602;
        _1818 = 500.0;
        _2375 = _2562;
    }
    float _2604 = _2542;
    float _2606 = _1818;
    float _2608 = _2375;
    float _2610 = _2538 * _2604;
    float _2612 = _2512 * _2411;
    float _2614 = -_2520;
    float _2616 = fma(_2614, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2618 = -_2512;
    float _2620 = _2618 + 1.0;
    bool _2622 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2624 = isnan(_1734);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2630 = _2626 || _2628;
    float _2632 = _2422 * _2612;
    float _2634 = -_2610;
    float _2636 = fma(_2634, _2616, 1.0);
    float _2638 = precise::clamp(_2636, 0.0, 1.0);
    float _2640 = _2432 * _2612;
    float _2642 = _2422 * _2620;
    float _2644 = fma(_2428, _2632, _2416);
    float _2646 = fma(_2430, _2632, _2418);
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2650 = fma(_2422, _2640, _2420);
    out.m_99.x = _2648;
    float _2652 = _2620;
    float _2654 = _2608;
    float _2656 = _2638;
    float _2658 = _2606;
    float _2660 = _2632;
    if (!_2630)
    {
        _2652 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2662 = _2652;
    float _2664 = _2662;
    float _2666 = _2662;
    if (!_2630)
    {
        _2654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2668 = _2654;
    out.m_101.x = _2644;
    out.m_101.y = _2646;
    out.m_101.z = _2650;
    out.m_101.w = _2642;
    float _2670 = _2668;
    float _2672 = _2668;
    if (!_2630)
    {
        _2656 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2656;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2630)
    {
        _1442 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2680 = _1442;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2630)
    {
        _2658 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2686 = _2658;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2630)
    {
        _2660 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2692 = _2660;
    bool _2694 = !_2630;
    float _2696 = _2692;
    float _2698 = _2692;
    if (!_2694)
    {
        bool _2700 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2702 = isnan(_1734);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2712 = _1734 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2716 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2714;
            float _2718 = 1.0 / _2716;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2740 = _2712 * _2718;
            float _2742 = precise::clamp(_2740, 0.0, 1.0);
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2748 = fma(_2742, _2722, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2750 = fma(_2742, _2746, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2752 = fma(_2742, _2726, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2754 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2756 = fma(_2742, _2734, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2758 = fma(_2742, _2738, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2672 = _2750;
            _2690 = _2756;
            _2666 = _2748;
            _2684 = _2754;
            _2678 = _2752;
            _2698 = _2758;
            _2760 = true;
        }
        else
        {
            bool _2762 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2764 = isnan(_1734);
            bool _2766 = _2762 || _2764;
            bool _2768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2770 = _2766 || _2768;
            if (!_2770)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2772 = _2664;
            _2666 = _2772;
            if (!_2770)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2774 = _2670;
            _2672 = _2774;
            if (!_2770)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2776 = _2676;
            _2678 = _2776;
            if (!_2770)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2778 = _2682;
            _2684 = _2778;
            if (!_2770)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2780 = _2688;
            _2690 = _2780;
            if (!_2770)
            {
                _2696 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2782 = _2696;
            bool _2784 = !_2770;
            _2698 = _2782;
            if (!_2784)
            {
                bool _2786 = _1734 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2788 = isnan(_1734);
                bool _2790 = _2786 || _2788;
                bool _2792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2794 = _2790 || _2792;
                if (!_2794)
                {
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2798 = _1734 + _2796;
                    float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2802 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2800;
                    float _2804 = 1.0 / _2802;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2826 = _2798 * _2804;
                    float _2828 = precise::clamp(_2826, 0.0, 1.0);
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2834 = fma(_2828, _2808, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2836 = fma(_2828, _2832, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2838 = fma(_2828, _2812, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2840 = fma(_2828, _2816, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2842 = fma(_2828, _2820, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2844 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2672 = _2836;
                    _2690 = _2842;
                    _2666 = _2834;
                    _2684 = _2840;
                    _2678 = _2838;
                    _2698 = _2844;
                    _2760 = true;
                }
                else
                {
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2698 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2760 = false;
    float _2846 = _2672;
    float _2848 = _2690;
    float _2850 = _2666;
    float _2852 = _2684;
    float _2854 = _2678;
    float _2856 = _2698;
    float _2858 = fma(_1570, -0.5, 0.5);
    float _2860 = precise::clamp(_2858, 0.0, 1.0);
    float _2862 = -_2846;
    float _2864 = _2862 + _2848;
    float _2866 = -_2850;
    float _2868 = _2866 + _2852;
    float _2870 = -_2854;
    float _2872 = _2870 + _2856;
    bool _2874 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2876 = fma(_2860, _2864, _2846);
    float _2878 = fma(_2860, _2868, _2850);
    float _2880 = fma(_2860, _2872, _2854);
    float _2882 = _2876 * 0.586610972881317138671875;
    out.m_103.x = 0.0;
    float _2884 = fma(_2878, 0.298911988735198974609375, _2882);
    float _2886 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2888 = fma(_2880, 0.114477999508380889892578125, _2884);
    out.m_61.x = _2886;
    float _2890 = -_2888;
    float _2892 = _2878 + _2890;
    float _2894 = -_2888;
    float _2896 = _2876 + _2894;
    float _2898 = -_2888;
    float _2900 = _2880 + _2898;
    float _2902 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    float _2904 = fma(_2896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    float _2906 = fma(_2900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2888);
    out.m_105.x = _2902;
    out.m_105.y = _2904;
    out.m_105.z = _2906;
    if (!_2874)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2908 = -_1668;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2912 = -_1670;
    float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2916 = -_1672;
    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2920 = _2910 * _2910;
    float _2922 = fma(_2914, _2914, _2920);
    float _2924 = fma(_2918, _2918, _2922);
    float _2926 = sqrt(_2924);
    float _2928 = rsqrt(_2924);
    float _2930 = -_2926;
    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2936 = precise::clamp(_2934, 0.0, 1.0);
    float _2938 = _2914 * _2928;
    float _2940 = _2910 * _2928;
    float _2942 = abs(_2936);
    float _2944 = log2(_2942);
    float _2946 = _2918 * _2928;
    float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2950 = _1570 * _2940;
    float _2952 = -_2940;
    float _2954 = -_2948;
    float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
    float _2958 = fma(_1556, _2938, _2950);
    float _2960 = -_2946;
    float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
    float _2964 = fma(_1576, _2946, _2958);
    float _2966 = precise::clamp(_2964, 0.0, 1.0);
    float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2970 = _2962 + _2968;
    float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2976 = precise::clamp(_2974, 0.0, 1.0);
    float _2978 = exp2(_2972);
    float _2980 = _2978 * _2976;
    float _2982 = _2966 * _2980;
    float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2984;
    out.m_103.y = _2986;
    out.m_103.z = _2988;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

