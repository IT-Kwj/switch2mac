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
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_87 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_89 [[user(locn5)]];
    float4 m_97 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_83 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_85 [[attribute(11)]];
    float4 m_77 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2546 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_128)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_138);
        out.gl_Position.z = _2830;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_124);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _140 = as_type<int>(_176);
    }
    int _178 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2900 = as_type<float>(_178);
        out.gl_Position.z = _2900;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_63.x;
    float _182 = in.m_63.y;
    float _184 = in.m_63.z;
    float _186 = in.m_65.x;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = 0.0;
    float _228 = _218;
    float _230 = _216;
    float _232 = _214;
    if (_222)
    {
        float _234 = rsqrt(_210);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _220 > 0.0;
    float _244 = _220;
    float _246 = _240;
    if (!_222)
    {
        _228 = 0.0;
    }
    float _248 = _228;
    float _250 = _248;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = 0.0;
    float _256 = _252;
    if (_224)
    {
        float _258 = rsqrt(_212);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _264 = _262;
    float _266 = 0.0;
    float _268 = _264;
    if (!_224)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = 0.0;
    float _274 = _270;
    if (!_224)
    {
        _272 = 0.0;
    }
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_214);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _236;
    if (_222)
    {
        float _288 = _236 * _186;
        _246 = _288;
    }
    float _290 = _246;
    if (_222)
    {
        float _292 = _236 * _180;
        _250 = _292;
    }
    float _294 = _250;
    if (_222)
    {
        float _296 = _236 * _192;
        _256 = _296;
    }
    float _298 = _256;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_242)
    {
        _286 = 0.0;
        _230 = 0.0;
    }
    float _302 = _286;
    float _304 = _230;
    float _306 = _304;
    float _308 = _302;
    if (_224)
    {
        float _310 = _260 * _188;
        _268 = _310;
    }
    float _312 = _268;
    if (!_242)
    {
        _232 = 0.0;
    }
    float _314 = _232;
    float _316 = _314;
    if (_224)
    {
        float _318 = _260 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_224)
    {
        float _322 = _260 * _194;
        _280 = _322;
    }
    float _324 = _280;
    if (_242)
    {
        float _326 = _284 * _190;
        _316 = _326;
    }
    float _328 = _316;
    if (_242)
    {
        float _330 = _284 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_242)
    {
        float _334 = _284 * _196;
        _308 = _334;
    }
    float _336 = _308;
    bool _338 = !_300;
    float _356;
    if (!_338)
    {
        float _340 = in.m_69.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_124);
        float _362 = 1.0 / _360;
        float _364 = _156 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_56.x;
    float _370 = in.m_56.y;
    float _372 = in.m_56.z;
    float _374 = in.m_65.w;
    float _376 = in.m_67.w;
    float _378 = _188 * _370;
    float _380 = _194 * _370;
    float _382 = fma(_186, _368, _378);
    float _384 = fma(_192, _368, _380);
    float _386 = fma(_190, _372, _382);
    float _388 = fma(_196, _372, _384);
    float _390 = _386 + _374;
    float _392 = _388 + _376;
    float _394 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _398 = floor(_394);
    float _400 = floor(_396);
    float _402 = -_398;
    float _404 = _394 + _402;
    float _406 = -_400;
    float _408 = _396 + _406;
    float2 _3232 = float2(_404, _408);
    float _410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3232, float2(0.0), isnan(_3232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3232, float2(0.0), isnan(_3232)), level(0.0)).x;
    float _412 = in.m_69.z;
    float _414 = _182 * _370;
    float _416 = in.m_69.y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = in.m_69.x;
    float _432 = 1.0 / _420;
    float _434 = fma(_180, _368, _414);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _442 = _366 + _440;
    float _444 = fma(_184, _372, _434);
    float _446 = in.m_63.w;
    float _448 = 1.0 / _424;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _460 = _458 != 0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _464 = _366 + _462;
    float _466 = _412 * 2.0;
    float _468 = 1.0 / _428;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _472 = _366 + _470;
    float _474 = _464 * _432;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _366 + _476;
    float _480 = _416 * 2.0;
    float _482 = _472 * _448;
    float _484 = _416 + _412;
    float _486 = 1.0 / _438;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    bool _492 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _494 = isnan(_366);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = _484 + (-1.0);
    bool _506 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _508 = isnan(_366);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = _444 + _446;
    float _520 = _478 * _468;
    float _522 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _524 = _430 + _412;
    float _526 = _430 + _416;
    float _528 = _430 * 2.0;
    float _530 = floor(_466);
    float _532 = _524 + (-1.0);
    float _534 = _526 + (-1.0);
    float _536 = fma(_490, _520, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = -_502;
    float _540 = _538 + 1.0;
    float _542 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _546 = _442 * _486;
    float _548 = floor(_528);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _550;
    float _554 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _556 = log2(_554);
    bool _558 = _530 >= 0.0;
    bool _560 = isnan(_530);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _568;
    bool _572 = _530 > 0.0;
    float _574 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _576 = _566 ? 0 : 1;
    float _578 = fma(_570, _474, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _580 = floor(_480);
    bool _582 = _548 >= 0.0;
    bool _584 = isnan(_548);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    bool _592 = _548 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _594;
    int _598 = _590 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = _556 * _156;
    float _610 = fma(_596, _520, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _612 = fma(_602, _474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _614 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _616 = isnan(_366);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = exp2(_608);
    float _628 = fma(_606, _482, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _630 = _580 > 0.0;
    bool _632 = _580 >= 0.0;
    bool _634 = isnan(_580);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _650;
    int _654 = _640 ? 0 : 1;
    float _656 = fma(_644, _482, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _658 = fma(_648, _482, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _660 = fma(_652, _520, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _662 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _664 = isnan(_366);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -_624;
    float _676 = _674 + 1.0;
    float _678 = -_626;
    float _680 = _678 + 1.0;
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    float _696 = -_672;
    float _698 = _696 + 1.0;
    float _700 = _690 ? _680 : 0.0;
    float _702 = _502 * _676;
    float _704 = _624 * _698;
    bool _706 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _708 = isnan(_366);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _722 = 1.0 / _694;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _732 = _716 * _540;
    float _734 = -_716;
    float _736 = _734 + 1.0;
    float _738 = fma(_726, _546, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _740 = fma(_720, _546, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _742 = fma(_730, _546, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _744 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _746 = isnan(1.0);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _752 = _748 || _750;
    float _754 = _516 * _736;
    float _756 = -_516;
    float _758 = _756 + 1.0;
    float _760 = _574 * _754;
    float _762 = _612 * _754;
    float _764 = _578 * _754;
    float _766 = _518 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].y, _760);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].x, _762);
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].z, _764);
    int _774 = ~_654;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = fma(_656, _732, _768);
    float _782 = fma(_628, _732, _770);
    int _784 = _778;
    if (!_630)
    {
        int _786 = ~_654;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_658, _732, _772);
    bool _794 = !_452;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_660, _702, _782);
    float _800 = fma(_536, _702, _780);
    bool _802 = !_456;
    int _804 = _802 ? 0 : 1;
    float _806 = in.m_71.x;
    float _808 = in.m_71.y;
    float _810 = in.m_71.z;
    float _812 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _766);
    int _814 = ~_598;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    int _820 = _818;
    if (_752)
    {
        float _822 = _700 * _722;
        _160 = _822;
    }
    float _824 = _160;
    if (!_592)
    {
        int _826 = ~_598;
        int _828 = _826 + 1;
        _820 = _828;
    }
    int _830 = _820;
    float _832 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    bool _834 = !_460;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_738, _704, _798);
    int _840 = abs(_796);
    float _842 = _518 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _844 = abs(_804);
    float _846 = _832 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _848 = ~_576;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _842);
    int _856 = _852;
    if (!_572)
    {
        int _858 = ~_576;
        int _860 = _858 + 1;
        _856 = _860;
    }
    int _862 = _856;
    float _864 = 1.0 / _846;
    int _866 = abs(_836);
    float _868 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _854);
    float _870 = fma(_740, _704, _800);
    float _872 = _868 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _874 = float(_840);
    float _876 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].x, _838);
    float _878 = float(_844);
    float _880 = fma(_610, _702, _792);
    float _882 = float(_830);
    float _884 = _872 + _846;
    float _886 = float(_862);
    float _888 = fma(_742, _704, _880);
    float _890 = _878 * _882;
    float _892 = float(_790);
    float _894 = _874 * _886;
    float _896 = float(_866);
    float _898 = _890 * (-2.0);
    float _900 = _416 + (-0.5);
    float _902 = _884 * _864;
    float _904 = _902 * 0.5;
    float _906 = fma(_898, _808, _808);
    float _908 = _896 * _892;
    float _910 = fma(_522, _898, _522);
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _912);
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _906);
    float _918 = _894 * (-2.0);
    float _920 = in.m_73.x;
    float _922 = in.m_73.y;
    float _924 = in.m_73.z;
    float _926 = _908 * (-2.0);
    float _928 = fma(_910, _824, _916);
    float _930 = fma(_918, _806, _806);
    float _932 = 1.0 / _914;
    float _934 = in.m_75.x;
    float _936 = in.m_75.y;
    float _938 = in.m_75.z;
    float _940 = _928 * 0.15915493667125701904296875;
    float _942 = _430 + (-0.5);
    float _944 = fma(_544, _918, _544);
    float _946 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].z, _888);
    float _948 = fma(_926, _810, _810);
    float _950 = _412 + (-0.5);
    float _952 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].y, _870);
    float _954 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].x, _930);
    float _956 = fma(_542, _926, _542);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _948);
    float _960 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _962 = fma(_944, _824, _954);
    float _964 = _940 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(_956, _824, _958);
    float _970 = _962 * 0.15915493667125701904296875;
    float _972 = _518 + _960;
    float _974 = _968 * 0.15915493667125701904296875;
    float _976 = _952 * _922;
    float _978 = _946 * _924;
    float _980 = _940 * 6.283185482025146484375;
    float _982 = cos(_980);
    float _984 = _972 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _986 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _990 = _932 * _988;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _936);
    float _994 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].x, _984);
    float _996 = _972 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _998 = _876 * _920;
    float _1000 = _970 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    bool _1004 = _990 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1006 = _992 * _986;
    bool _1008 = _990 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1010 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[126].z, _994);
    bool _1012 = !_1004;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _934);
    float _1018 = _970 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _938);
    float _1026 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1028 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1030 = _1016 * _1022;
    int _1032 = 2;
    if (!_1004)
    {
        _1032 = 1;
    }
    int _1034 = _1032;
    float _1036 = _1024 * _1026;
    float _1038 = _974 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    int _1042 = _1034;
    if (!_1008)
    {
        _1042 = _1014;
    }
    int _1044 = _1042;
    float _1046 = _1002 * _982;
    float _1048 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].x, _996);
    float _1050 = _1002 * _966;
    int _1052 = _1044 << 6;
    float _1054 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1048);
    float _1056 = _974 * 6.283185482025146484375;
    float _1058 = sin(_1056);
    float _1060 = _1020 * _966;
    float _1062 = _1020 * _982;
    float _1064 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1066 = _1002 * _1040;
    float _1068 = _1020 * _1040;
    float _1070 = _982 * _1040;
    float _1072 = trunc(_1028);
    int _1074 = int(_1072);
    float _1076 = _966 * _1040;
    float _1078 = _1068 * _1006;
    int _1080 = _1052 + 48;
    uint _1083 = uint(int(uint(_1080) >> uint(2)));
    uint _1085 = uint(int(uint(int(_1083)) >> uint(2)));
    int _1087 = int(_1083) & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    int _1091 = int(_1083) + 1;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    int _1095 = _1091 & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    float _1099 = fma(_1058, _1046, _1060);
    float _1101 = fma(_1058, _1060, _1046);
    float _1103 = -_1050;
    float _1105 = fma(_1058, _1062, _1103);
    float _1107 = -_1062;
    float _1109 = fma(_1058, _1050, _1107);
    float _1111 = _1066 * _1006;
    float _1113 = -_1006;
    float _1115 = _1058 * _1113;
    int _1117 = _1052 + 96;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    uint _1121 = uint(int(uint(int(_1119)) >> uint(2)));
    int _1123 = int(_1119) & 3;
    float _1125 = (*spvDescriptorSet0.vp_c15)._m0[int(_1121)][_1123];
    int _1127 = int(_1119) + 1;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    int _1131 = _1127 & 3;
    float _1133 = (*spvDescriptorSet0.vp_c15)._m0[int(_1129)][_1131];
    float _1135 = trunc(_1064);
    int _1137 = int(_1135);
    float _1139 = fma(_1099, _1030, _1111);
    float _1141 = fma(_1070, _1030, _1115);
    float _1143 = fma(_1105, _1030, _1078);
    int _1145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1147 = _1074 + _1145;
    int _1149 = _1147 + 1;
    float _1151 = fma(_1109, _1036, _1139);
    float _1153 = fma(_1076, _1036, _1141);
    int _1155 = _1052 + 104;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    uint _1159 = uint(int(uint(int(_1157)) >> uint(2)));
    int _1161 = int(_1157) & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = int(_1157) + 1;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    int _1169 = _1165 & 3;
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[int(_1167)][_1169];
    float _1173 = fma(_1101, _1036, _1143);
    float _1175 = _1151 * _324;
    float _1177 = _1151 * _312;
    bool _1179 = _1149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1181 = fma(_1153, _298, _1175);
    float _1183 = fma(_1153, _290, _1177);
    int _1185 = _1052 + 64;
    uint _1187 = uint(int(uint(_1185) >> uint(2)));
    uint _1189 = uint(int(uint(int(_1187)) >> uint(2)));
    int _1191 = int(_1187) & 3;
    float _1193 = (*spvDescriptorSet0.vp_c15)._m0[int(_1189)][_1191];
    int _1195 = int(_1187) + 1;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    int _1199 = _1195 & 3;
    float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
    int _1203 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1205 = _1137 + _1203;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1173, _336, _1181);
    float _1211 = fma(_1173, _328, _1183);
    int _1213 = _1149 | _1207;
    float _1215 = _392 + _1209;
    float _1217 = _390 + _1211;
    int _1219 = _1052 + 56;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    uint _1223 = uint(int(uint(int(_1221)) >> uint(2)));
    int _1225 = int(_1221) & 3;
    float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
    int _1229 = int(_1221) + 1;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    int _1233 = _1229 & 3;
    float _1235 = (*spvDescriptorSet0.vp_c15)._m0[int(_1231)][_1233];
    bool _1237 = _1213 < 0;
    bool _1239 = _1237 || _1179;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1243 = _1215 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1247 = _1217 + _1245;
    bool _1249 = _1207 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1251 = _1249 || _1239;
    float _1253 = _1243 * _1243;
    int _1255 = _1052 + 72;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = fma(_1247, _1247, _1253);
    float _1275 = _1151 * _320;
    float _1277 = sqrt(_1273);
    int _1279 = _1052 + 80;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    uint _1283 = uint(int(uint(int(_1281)) >> uint(2)));
    int _1285 = int(_1281) & 3;
    float _1287 = (*spvDescriptorSet0.vp_c15)._m0[int(_1283)][_1285];
    int _1289 = int(_1281) + 1;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    int _1293 = _1289 & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    float _1297 = _972 * _1097;
    int _1299 = _1149;
    int _1301 = as_type<int>(_1151);
    float _1303 = _1273;
    if (!_1251)
    {
        int _1305 = _1207 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1307 = _1305 + _1149;
        _1299 = _1307;
    }
    int _1309 = _1299;
    float _1311 = fma(_390, _1089, _1297);
    if (!_1251)
    {
        int _1313 = _1309 << 2;
        _1301 = _1313;
    }
    int _1315 = _1301;
    float _1317 = _972 * _1133;
    float _1319 = fma(_1153, _294, _1275);
    float _1321 = _1275;
    float _1323 = _1319;
    if (!_1251)
    {
        float _1325 = floor(_1028);
        _1321 = _1325;
    }
    float _1327 = _1321;
    float _1329 = fma(_390, _1125, _1317);
    float _1331 = fma(_1173, _332, _1319);
    bool _1333 = _1277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = fma(_392, _1163, _1329);
    float _1337 = _518 + _1331;
    float _1339 = _1335 + _1171;
    int _1341 = as_type<int>(_1335);
    float _1343 = _1171;
    if (!_1251)
    {
        int _1345 = 12 & _1315;
        _1341 = _1345;
    }
    int _1347 = _1341;
    float _1349 = _972 * _1201;
    int _1351 = as_type<int>(_1201);
    float _1353 = as_type<float>(_1347);
    float _1355 = _1193;
    if (!_1251)
    {
        uint _1357 = uint(int(uint(_1309) >> uint(2)));
        _1351 = int(_1357);
    }
    int _1359 = _1351;
    float _1361 = 1.0 / _1339;
    int _1363 = _1359;
    if (!_1333)
    {
        _1343 = _1337;
    }
    float _1365 = _1343;
    float _1367 = fma(_390, _1193, _1349);
    float _1369 = _1365;
    if (!_1251)
    {
        int _1371 = _1359 << 4;
        int _1373 = _1371 + _1347;
        _1363 = _1373;
    }
    int _1375 = _1363;
    if (!_1333)
    {
        _1353 = _1217;
    }
    float _1377 = _1353;
    float _1379 = fma(_392, _1227, _1311);
    float _1381 = _1377;
    float _1383 = _1295;
    if (!_1333)
    {
        _1355 = _1215;
    }
    float _1385 = _1355;
    float _1387 = _1379 + _1235;
    float _1389 = fma(_392, _1263, _1367);
    float _1391 = _1389 + _1271;
    bool _1393 = !_1333;
    float _1395 = _1385;
    if (!_1393)
    {
        float _1397 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1401 = _1277 + _1399;
        float _1403 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = rsqrt(_1273);
        float _1407 = _1401 * _1397;
        float _1409 = _1407 * 0.15915493667125701904296875;
        float _1411 = _1409 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        float _1415 = _1409 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1413 + (-1.0);
        float _1421 = fma(_1417, _1403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1425 = _1405 * _1421;
        float _1427 = fma(_1337, _1413, _1423);
        float _1429 = fma(_1247, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1431 = fma(_1243, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1369 = _1427;
        _1381 = _1429;
        _1303 = _1405;
        _1395 = _1431;
        _1323 = _1417;
    }
    float _1433 = _1369;
    float _1435 = _1381;
    float _1437 = _1303;
    float _1439 = _1395;
    float _1441 = _1323;
    int _1443 = _1052 + 88;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    uint _1447 = uint(int(uint(int(_1445)) >> uint(2)));
    int _1449 = int(_1445) & 3;
    float _1451 = (*spvDescriptorSet0.vp_c15)._m0[int(_1447)][_1449];
    int _1453 = int(_1445) + 1;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    int _1457 = _1453 & 3;
    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[int(_1455)][_1457];
    float _1461 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1465 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1387 * _1361;
    float _1469 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1471 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1463);
    float _1473 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = _1437;
    if (!_1251)
    {
        int _1477 = _1375 + 400;
        uint _1479 = uint(int(uint(_1477) >> uint(2)));
        uint _1481 = uint(int(uint(int(_1479)) >> uint(2)));
        int _1483 = int(_1479) & 3;
        float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
        _1475 = _1485;
    }
    float _1487 = _1475;
    float _1489 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1491 = _1391 * _1361;
    float _1493 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1471);
    float _1495 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1497 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1501 = _1467 >= 0.0;
    float _1503 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1505 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1507 = _1495 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1511 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1513 = _1467 <= 1.0;
    bool _1515 = _1513 && _1501;
    float _1517 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1519 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1505);
    float _1521 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1509);
    bool _1523 = _1491 >= 0.0;
    bool _1525 = _1523 && _1515;
    float _1527 = -_1517;
    float _1529 = fma(_1527, _1511, 1.0);
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1521);
    bool _1535 = _1491 <= 1.0;
    bool _1537 = _1535 && _1525;
    float _1539 = _1441;
    float _1541 = _1529;
    if (!_1251)
    {
        float _1543 = floor(_1064);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1533);
    float _1551 = _972 * _1295;
    float _1553 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1555 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1547);
    float _1557 = fma(_390, _1287, _1551);
    float _1559 = 1.0 / _1549;
    float _1561 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1553);
    float _1563 = _1557;
    if (_1537)
    {
        float _1565 = float(_1044);
        _1383 = _1565;
    }
    float _1567 = _1383;
    float _1569 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1555);
    float _1571 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1561);
    float _1573 = log2(_1529);
    float _1575 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1569);
    float _1577 = fma(_392, _1451, _1557);
    float _1579 = _1577 + _1459;
    float _1581 = _1459;
    float _1583 = _1575;
    if (!_1251)
    {
        float _1585 = -_1327;
        float _1587 = _1028 + _1585;
        _1581 = _1587;
    }
    float _1589 = _1581;
    float _1591 = _1551;
    if (_1537)
    {
        float _1593 = rint(_1567);
        float _1595 = precise::max(_1593, 0.0);
        uint _1597 = uint(_1595);
        uint _1599 = clamp(_1597, 0u, 65535u);
        _1591 = as_type<float>(_1599);
    }
    float _1601 = _1591;
    if (!_1251)
    {
        float _1603 = -_1545;
        float _1605 = _1064 + _1603;
        _1541 = _1605;
    }
    float _1607 = _1541;
    float _1609 = _1579 * _1361;
    float _1611 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1613 = _1575 * _1559;
    float _1615 = _1611 * _1559;
    float _1617 = _1579;
    float _1619 = _1487;
    if (!_1251)
    {
        float _1621 = rint(_1487);
        float _1623 = precise::max(_1621, 0.0);
        uint _1625 = uint(_1623);
        uint _1627 = clamp(_1625, 0u, 65535u);
        _1617 = as_type<float>(_1627);
    }
    float _1629 = _1617;
    float _1631 = _1573 * 0.693147182464599609375;
    float _1633 = fma(_1613, 0.5, 0.5);
    float _1635 = fma(_1615, -0.5, 0.5);
    float _1637 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1639 = _1327;
    if (_1537)
    {
        float3 _5204 = float3(_1467, _1491, float(as_type<int>(_1601)));
        float3 _5208 = select(_5204, float3(0.0), isnan(_5204));
        float _1641 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5208.xy, uint(rint(_5208.z)), _1609, level(0.0));
        _1639 = _1641;
    }
    float _1643 = _1639;
    float3 _5218 = float3(_1633, _1635, _1637);
    float _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5218, float3(0.0), isnan(_5218)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5218, float3(0.0), isnan(_5218)), level(0.0)).x;
    float3 _5227 = float3(_1633, _1635, _1637);
    float4 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).xyzw;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = _1648.w;
    float _1658 = _1561;
    if (!_1251)
    {
        float3 _5250 = float3(_1589, _1607, float(as_type<int>(_1629)));
        float3 _5252 = select(_5250, float3(0.0), isnan(_5250));
        float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5252.xy, uint(rint(_5252.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5252.xy, uint(rint(_5252.z)), level(0.0)).x;
        _1658 = _1660;
    }
    float _1662 = _1658;
    if (_1251)
    {
        _1563 = 1.0;
    }
    float _1664 = _1563;
    float _1666 = _1664;
    if (!_1251)
    {
        int _1668 = _1309 << 4;
        int _1670 = _1668 + 2048;
        uint _1672 = uint(int(uint(_1670) >> uint(2)));
        uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
        int _1676 = int(_1672) & 3;
        float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
        int _1680 = int(_1672) + 1;
        uint _1682 = uint(int(uint(_1680) >> uint(2)));
        int _1684 = _1680 & 3;
        float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
        int _1688 = _1670 + 8;
        uint _1690 = uint(int(uint(_1688) >> uint(2)));
        uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
        int _1694 = int(_1690) & 3;
        float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
        int _1698 = int(_1690) + 1;
        uint _1700 = uint(int(uint(_1698) >> uint(2)));
        int _1702 = _1698 & 3;
        float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
        float _1706 = _972 * _1686;
        float _1708 = fma(_390, _1678, _1706);
        float _1710 = fma(_392, _1696, _1708);
        float _1712 = _1710 + _1704;
        float _1714 = precise::clamp(_1712, 0.0, 1.0);
        float _1716 = -_1714;
        float _1718 = _1716 + _1662;
        float _1720 = fma(_1718, 500.0, 1.5);
        float _1722 = exp2(_1720);
        float _1724 = 0.0 + _1722;
        float _1726 = precise::clamp(_1724, 0.0, 1.0);
        _1666 = _1726;
    }
    float _1728 = _1666;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1732 = _1433 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1736 = _1435 + _1734;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1740 = _1439 + _1738;
    float _1742 = _1732 * _1732;
    float _1744 = fma(_1736, _1736, _1742);
    float _1746 = fma(_1740, _1740, _1744);
    float _1748 = rsqrt(_1746);
    float _1750 = sqrt(_1746);
    float _1752 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1754 = _1736 * _1752;
    float _1756 = _1740 * _1752;
    float _1758 = _1754 * _1754;
    float _1760 = _1756 * _1756;
    float _1762 = _1758 + _1760;
    float _1764 = sqrt(_1762);
    bool _1766 = _1764 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1770 = _1764 + _1768;
    float _1772 = _392;
    float _1774 = _1762;
    float _1776 = _1770;
    float _1778 = _1754;
    float _1780 = _1756;
    float _1782 = _1758;
    float _1784 = _1760;
    if (_1766)
    {
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1786;
    }
    float _1788 = _1772;
    if (_1766)
    {
        float _1790 = rsqrt(_1762);
        _1774 = _1790;
    }
    float _1792 = _1774;
    if (_1766)
    {
        float _1794 = _1770 * _1788;
        _1776 = _1794;
    }
    float _1796 = _1776;
    if (_1766)
    {
        float _1798 = _1796 * 0.15915493667125701904296875;
        _1619 = _1798;
    }
    float _1800 = _1619;
    float _1802 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1804 = _390;
    float _1806 = _1802;
    if (_1766)
    {
        float _1808 = _1800 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1804 = _1810;
    }
    float _1812 = _1804;
    float _1814 = precise::max(0.0, _1802);
    float _1816 = _1796;
    float _1818 = _1814;
    if (_1766)
    {
        float _1820 = _1800 * 6.283185482025146484375;
        float _1822 = cos(_1820);
        _1816 = _1822;
    }
    float _1824 = _1816;
    float _1826 = -_1752;
    float _1828 = -_1814;
    float _1830 = fma(_1732, _1826, _1828);
    float _1832 = _1830;
    if (_1766)
    {
        float _1834 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1818 = _1834;
    }
    float _1836 = _1818;
    float _1838 = _1812;
    if (_1766)
    {
        float _1840 = fma(_1812, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1838 = _1840;
    }
    float _1842 = _1838;
    float _1844 = _1842;
    if (_1766)
    {
        float _1846 = _1792 * _1842;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1766)
    {
        float _1850 = _1824 + (-1.0);
        _1806 = _1850;
    }
    float _1852 = _1806;
    float _1854 = _1852;
    if (_1766)
    {
        float _1856 = _1754 * _1848;
        _1778 = _1856;
    }
    float _1858 = _1778;
    if (_1766)
    {
        float _1860 = _1756 * _1848;
        _1780 = _1860;
    }
    float _1862 = _1780;
    if (_1766)
    {
        float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1854 = _1864;
    }
    float _1866 = _1854;
    if (_1766)
    {
        float _1868 = _1858 * _1858;
        _1782 = _1868;
    }
    float _1870 = _1782;
    if (_1766)
    {
        float _1872 = _1862 * _1862;
        _1784 = _1872;
    }
    float _1874 = _1784;
    if (_1766)
    {
        float _1876 = fma(_1830, _1824, _1866);
        _1832 = _1876;
    }
    float _1878 = _1832;
    float _1880 = fma(_1878, _1878, _1870);
    float _1882 = _1880 + _1874;
    float _1884 = rsqrt(_1882);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = -_1890;
    float _1894 = _1892 + 1.0;
    float _1896 = abs(_1894);
    float _1898 = log2(_1896);
    float _1900 = _1884 * _1858;
    float _1902 = _1884 * _1878;
    float _1904 = _1884 * _1862;
    float _1906 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1908 = -_1906;
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1908);
    float _1912 = -_1904;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1910);
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1918 = fma(_1914, -0.5, 0.5);
    float _1920 = exp2(_1916);
    float _1922 = fma(_1914, 0.5, 0.5);
    float _1924 = _1902 + 1.0;
    float _1926 = fma(_1922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1928 = sqrt(_1918);
    float _1930 = fma(_1922, _1926, -0.212114393711090087890625);
    float _1932 = fma(_1922, _1930, 1.570728778839111328125);
    float _1934 = -_1902;
    float _1936 = fma(_1920, _1924, _1934);
    float _1938 = fma(_1936, 0.5, 0.5);
    float _1940 = _1928 * 0.636619746685028076171875;
    float _1942 = -_1932;
    float _1944 = fma(_1940, _1942, 1.0);
    float2 _5692 = float2(_1944, _1938);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5692, float2(0.0), isnan(_5692)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5692, float2(0.0), isnan(_5692)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = in.m_69.w;
    float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1960 = _416 > 0.5;
    float _1962 = in.m_77.y;
    int _1964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1966 = _1964 != 0;
    float _1968 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1972 = _1970 != 0;
    float _1974 = in.m_77.x;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1978 = _1976 != 0;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1988 = -_410;
    float _1990 = _1988 + 1.0;
    float _1992 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1986);
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2002 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2004 = _1956 > 0.5;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2008 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2000;
    float _2010 = -_1962;
    float _2012 = _2010 + 1.0;
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2016 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1992);
    out.m_81.x = _1435;
    out.m_81.y = _1433;
    out.m_81.z = _1439;
    int _2018 = 0;
    bool _2020 = _2004;
    float _2022 = _1962;
    bool _2024 = _1972;
    float _2026 = _1974;
    float _2028 = _2002;
    float _2030 = _2006;
    if (_1978)
    {
        float _2032 = -_1974;
        float _2034 = _2032 + 1.0;
        _2018 = as_type<int>(_2034);
    }
    int _2036 = _2018;
    int _2038 = _2004 ? as_type<int>(_2012) : as_type<int>(_1962);
    int _2040 = 0;
    float _2042 = as_type<float>(_2036);
    if (_1984)
    {
        float _2044 = -_1974;
        float _2046 = _2044 + 1.0;
        _2040 = as_type<int>(_2046);
    }
    int _2048 = _2040;
    float _2050 = as_type<float>(_2048);
    if (_1978)
    {
        bool _2052 = _430 > 0.5;
        _2020 = _2052;
    }
    bool _2054 = _2020;
    float _2056 = _1972 ? as_type<float>(_2038) : _1962;
    float _2058 = exp2(_1968);
    if (_1966)
    {
        float _2060 = _1960 ? _2012 : _1962;
        _2022 = _2060;
    }
    float _2062 = _2022;
    float _2064 = in.m_83.x;
    float _2066 = in.m_83.y;
    float _2068 = in.m_83.z;
    bool _2070 = _936 != 0.0;
    bool _2072 = isnan(_936);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    float _2080 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2082 = _934 == 0.0;
    bool _2084 = !_2078;
    bool _2086 = _2082 && _2084;
    if (_1984)
    {
        bool _2088 = _412 > 0.5;
        _2024 = _2088;
    }
    bool _2090 = _2024;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2094 = _938 == 0.0;
    bool _2096 = _2094 && _2086;
    float _2098 = in.m_85.x;
    float _2100 = in.m_85.y;
    float _2102 = in.m_85.z;
    float _2104 = in.m_85.w;
    float _2106 = 0.0;
    if (!_1978)
    {
        _2106 = _1974;
    }
    float _2108 = _2106;
    float _2110 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _2108;
    float _2114 = _2110;
    if (_1978)
    {
        float _2116 = _2054 ? as_type<float>(_2036) : _1974;
        _2112 = _2116;
    }
    float _2118 = _2112;
    float _2120 = -_2058;
    float _2122 = _2120 + 1.0;
    if (_1984)
    {
        float _2124 = _2090 ? as_type<float>(_2048) : _1974;
        _2026 = _2124;
    }
    float _2126 = _2026;
    out.m_87.x = _2110;
    out.m_87.y = _2002;
    out.m_87.z = _2008;
    out.m_87.w = _2006;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2096)
    {
        _2050 = _2066;
    }
    float _2130 = _2050;
    float _2132 = 0.0;
    float _2134 = _2130;
    if (_2096)
    {
        _2132 = _2068;
    }
    float _2136 = _2132;
    float _2138 = _2136;
    if (_2096)
    {
        _2028 = _2064;
    }
    float _2140 = _2028;
    float _2142 = _2140;
    if (_2096)
    {
        _2030 = _2130;
    }
    float _2144 = _2030;
    float _2146 = _2144;
    if (_2096)
    {
        _2042 = _2140;
    }
    float _2148 = _2042;
    float _2150 = _2148;
    if (!_2096)
    {
        _2142 = _2064;
    }
    float _2152 = _2142;
    float _2154 = _2128 * _1958;
    if (_2096)
    {
        _2114 = _2136;
    }
    float _2156 = _2114;
    float _2158 = _2156;
    if (!_2096)
    {
        _2134 = _2066;
    }
    float _2160 = _2134;
    if (!_2096)
    {
        float _2162 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2152);
        _2150 = _2162;
    }
    float _2164 = _2150;
    if (!_2096)
    {
        _2138 = _2068;
    }
    float _2166 = _2138;
    float _2168 = abs(_990);
    float _2170 = log2(_2168);
    float _2172 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2174 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2176 = _2102 * _2152;
    float _2178 = _2080 * _1998;
    float _2180 = _2172 * _1980;
    float _2182 = _2174 * _2014;
    float _2184 = -_2176;
    float _2186 = fma(_2098, _2166, _2184);
    if (!_2096)
    {
        float _2188 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2160);
        _2146 = _2188;
    }
    float _2190 = _2146;
    float _2192 = _2100 * _2166;
    float _2194 = _2098 * _2160;
    out.m_89.x = _2154;
    out.m_89.y = _2180;
    out.m_89.z = _2182;
    out.m_89.w = _2178;
    if (!_2096)
    {
        float _2196 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2166);
        _2158 = _2196;
    }
    float _2198 = _2158;
    float _2200 = -_2192;
    float _2202 = fma(_2102, _2160, _2200);
    float _2204 = -_2194;
    float _2206 = fma(_2100, _2152, _2204);
    float _2208 = -_2100;
    float _2210 = _1058 * _2208;
    float _2212 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2214 = _2186 * _2104;
    float _2216 = _2202 * _2104;
    float _2218 = _2206 * _2104;
    float _2220 = -_2190;
    float _2222 = _1058 * _2220;
    float _2224 = fma(_1070, _2098, _2210);
    float _2226 = -_2214;
    float _2228 = _1058 * _2226;
    float _2230 = _1068 * _2190;
    float _2232 = fma(_1070, _2164, _2222);
    float _2234 = exp2(_2212);
    float _2236 = _1066 * _2100;
    float _2238 = _1068 * _2100;
    float _2240 = _1066 * _2190;
    float _2242 = _1066 * _2214;
    float _2244 = fma(_1099, _2098, _2236);
    float _2246 = fma(_1105, _2098, _2238);
    float _2248 = _1068 * _2214;
    float _2250 = fma(_1099, _2164, _2240);
    float _2252 = fma(_1070, _2216, _2228);
    float _2254 = fma(_1099, _2216, _2242);
    float _2256 = fma(_1105, _2216, _2248);
    float _2258 = fma(_1109, _2102, _2244);
    float _2260 = fma(_1076, _2198, _2232);
    float _2262 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2264 = precise::clamp(_2262, 0.0, 1.0);
    float _2266 = fma(_1076, _2102, _2224);
    float _2268 = fma(_1105, _2164, _2230);
    float _2270 = fma(_1076, _2218, _2252);
    float _2272 = fma(_1109, _2198, _2250);
    float _2274 = fma(_1109, _2218, _2254);
    float _2276 = fma(_1101, _2102, _2246);
    float _2278 = fma(_1101, _2218, _2256);
    float _2280 = fma(_2264, -2.0, 3.0);
    float _2282 = _2264 * _2264;
    float _2284 = _2258 * _312;
    float _2286 = _2258 * _320;
    float _2288 = fma(_1101, _2198, _2268);
    float _2290 = _2272 * _320;
    float _2292 = _2258 * _324;
    float _2294 = _2272 * _312;
    float _2296 = _2274 * _312;
    float _2298 = _2274 * _320;
    float _2300 = _2282 * _2280;
    float _2302 = fma(_2266, _290, _2284);
    float _2304 = fma(_2266, _294, _2286);
    float _2306 = _2272 * _324;
    float _2308 = _2274 * _324;
    float _2310 = fma(_2266, _298, _2292);
    float _2312 = fma(_2260, _290, _2294);
    float _2314 = fma(_2270, _290, _2296);
    float _2316 = fma(_2270, _294, _2298);
    float _2318 = fma(_2276, _328, _2302);
    float _2320 = fma(_2260, _294, _2290);
    float _2322 = fma(_2276, _332, _2304);
    float _2324 = fma(_2270, _298, _2308);
    float _2326 = fma(_2276, _336, _2310);
    float _2328 = fma(_2260, _298, _2306);
    float _2330 = fma(_2278, _328, _2314);
    float _2332 = fma(_2288, _328, _2312);
    float _2334 = fma(_2288, _332, _2320);
    float _2336 = -_2300;
    float _2338 = _2336 + 1.0;
    float _2340 = fma(_2278, _332, _2316);
    float _2342 = fma(_2288, _336, _2328);
    float _2344 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    bool _2346 = _990 <= 8000.0;
    bool _2348 = isnan(_990);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan(8000.0);
    bool _2354 = _2350 || _2352;
    float _2356 = float(_2354);
    float _2358 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2300);
    out.m_91.x = _2318;
    out.m_91.y = _2322;
    out.m_91.z = _2326;
    float _2360 = _2344 + _1549;
    float _2362 = fma(_2278, _336, _2324);
    float _2364 = _2356 * _2358;
    float _2366 = _2356;
    if (!_1537)
    {
        _2366 = 1.0;
    }
    float _2368 = _2366;
    out.m_93.x = _2332;
    out.m_93.y = _2334;
    out.m_93.z = _2342;
    float _2370 = _2368;
    if (_1537)
    {
        bool _2372 = _1643 >= _1609;
        bool _2374 = isnan(_1643);
        bool _2376 = _2372 || _2374;
        bool _2378 = isnan(_1609);
        bool _2380 = _2376 || _2378;
        float _2382 = float(_2380);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _2330;
    out.m_95.y = _2340;
    out.m_95.z = _2362;
    bool _2388 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_1750);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = _2386 * _1645;
    float _2400 = _2360 * 0.5;
    float _2402 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2404 = _2384 * _1728;
    float _2406 = _1656 * _2398;
    float _2408 = -_2386;
    float _2410 = _2408 + 1.0;
    float _2412 = _1990 * _2402;
    float _2414 = precise::clamp(_2412, 0.0, 1.0);
    out.gl_Position.x = _1575;
    out.gl_Position.y = _1611;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1549;
    float _2416 = _1656 * _2410;
    float _2418 = -_2414;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_97.z = _2400;
    out.m_97.w = _1549;
    float _2422 = _2414;
    float _2424 = _2404;
    float _2426 = _2410;
    float _2428 = _2398;
    if (!_2396)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2430 = _2422;
    float _2432 = -_2404;
    float _2434 = fma(_2432, _2420, 1.0);
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2436;
    float _2440 = _2430;
    float _2442 = _2430;
    if (!_2396)
    {
        _1583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2444 = _1583;
    float _2446 = _2444;
    float _2448 = _2444;
    if (!_2396)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2450 = _2424;
    float _2452 = _2436 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2454 = _2450;
    float _2456 = _2450;
    if (!_2396)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2458 = _2426;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2396)
    {
        _2438 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2464 = _2438;
    out.m_99.x = _2452;
    float _2466 = _1954 * _2398;
    float _2468 = fma(_1950, _2406, _1650);
    float _2470 = fma(_1952, _2406, _1652);
    float _2472 = _2464;
    float _2474 = _2464;
    if (!_2396)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2428;
    float _2478 = fma(_1656, _2466, _1654);
    out.m_101.x = _2468;
    out.m_101.y = _2470;
    out.m_101.z = _2478;
    out.m_101.w = _2416;
    bool _2480 = !_2396;
    float _2482 = _2476;
    float _2484 = _2476;
    if (!_2480)
    {
        bool _2486 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2488 = isnan(_1750);
        bool _2490 = _2486 || _2488;
        bool _2492 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2494 = _2490 || _2492;
        if (!_2494)
        {
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2498 = _1750 + _2496;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2502 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2500;
            float _2504 = 1.0 / _2502;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2526 = _2498 * _2504;
            float _2528 = precise::clamp(_2526, 0.0, 1.0);
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2534 = fma(_2528, _2508, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2536 = fma(_2528, _2532, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2538 = fma(_2528, _2512, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2540 = fma(_2528, _2516, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2542 = fma(_2528, _2520, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2544 = fma(_2528, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2448 = _2536;
            _2484 = _2542;
            _2442 = _2534;
            _2462 = _2540;
            _2456 = _2538;
            _2474 = _2544;
            _2546 = true;
        }
        else
        {
            bool _2548 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2550 = isnan(_1750);
            bool _2552 = _2548 || _2550;
            bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2556 = _2552 || _2554;
            if (!_2556)
            {
                _2440 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2558 = _2440;
            _2442 = _2558;
            if (!_2556)
            {
                _2446 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2560 = _2446;
            _2448 = _2560;
            if (!_2556)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2562 = _2454;
            _2456 = _2562;
            if (!_2556)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2564 = _2460;
            _2462 = _2564;
            if (!_2556)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2566 = _2482;
            _2484 = _2566;
            if (!_2556)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2568 = _2472;
            bool _2570 = !_2556;
            _2474 = _2568;
            if (!_2570)
            {
                bool _2572 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2574 = isnan(_1750);
                bool _2576 = _2572 || _2574;
                bool _2578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2580 = _2576 || _2578;
                if (!_2580)
                {
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2584 = _1750 + _2582;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2588 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2586;
                    float _2590 = 1.0 / _2588;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2612 = _2584 * _2590;
                    float _2614 = precise::clamp(_2612, 0.0, 1.0);
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2620 = fma(_2614, _2594, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2622 = fma(_2614, _2618, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2624 = fma(_2614, _2598, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2626 = fma(_2614, _2602, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2628 = fma(_2614, _2606, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2630 = fma(_2614, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2448 = _2622;
                    _2484 = _2628;
                    _2442 = _2620;
                    _2462 = _2626;
                    _2456 = _2624;
                    _2474 = _2630;
                    _2546 = true;
                }
                else
                {
                    _2448 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2442 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2546 = false;
    float _2632 = _2448;
    float _2634 = _2484;
    float _2636 = _2442;
    float _2638 = _2462;
    float _2640 = _2456;
    float _2642 = _2474;
    float _2644 = fma(_2334, -0.5, 0.5);
    float _2646 = precise::clamp(_2644, 0.0, 1.0);
    float _2648 = -_2632;
    float _2650 = _2648 + _2634;
    float _2652 = -_2636;
    float _2654 = _2652 + _2638;
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    bool _2660 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2662 = fma(_2646, _2650, _2632);
    float _2664 = fma(_2646, _2654, _2636);
    float _2666 = fma(_2646, _2658, _2640);
    float _2668 = _2662 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2670 = fma(_2664, 0.298911988735198974609375, _2668);
    float _2672 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2674 = fma(_2666, 0.114477999508380889892578125, _2670);
    out.m_99.w = _2672;
    float _2676 = -_2674;
    float _2678 = _2662 + _2676;
    float _2680 = -_2674;
    float _2682 = _2664 + _2680;
    float _2684 = -_2674;
    float _2686 = _2666 + _2684;
    out.m_103.x = 0.0;
    float _2688 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    out.m_105.x = _2690;
    out.m_105.y = _2688;
    out.m_105.z = _2692;
    if (!_2660)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2694 = -_1433;
    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2698 = -_1435;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2702 = -_1439;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2706 = _2696 * _2696;
    float _2708 = fma(_2700, _2700, _2706);
    float _2710 = fma(_2704, _2704, _2708);
    float _2712 = sqrt(_2710);
    float _2714 = rsqrt(_2710);
    float _2716 = -_2712;
    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2720 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2722 = precise::clamp(_2720, 0.0, 1.0);
    float _2724 = _2700 * _2714;
    float _2726 = _2696 * _2714;
    float _2728 = abs(_2722);
    float _2730 = log2(_2728);
    float _2732 = _2704 * _2714;
    float _2734 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2736 = _2334 * _2726;
    float _2738 = -_2726;
    float _2740 = -_2734;
    float _2742 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2740);
    float _2744 = fma(_2332, _2724, _2736);
    float _2746 = -_2732;
    float _2748 = fma(_2746, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2742);
    float _2750 = fma(_2342, _2732, _2744);
    float _2752 = precise::clamp(_2750, 0.0, 1.0);
    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2756 = _2748 + _2754;
    float _2758 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = exp2(_2758);
    float _2766 = _2764 * _2762;
    float _2768 = _2752 * _2766;
    float _2770 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2772 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2774 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2770;
    out.m_103.y = _2772;
    out.m_103.z = _2774;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2546 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_128)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_138);
        out.gl_Position.z = _2830;
    }
    if (!_128)
    {
        return out;
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_124);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _140 = as_type<int>(_176);
    }
    int _178 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2900 = as_type<float>(_178);
        out.gl_Position.z = _2900;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_63.x;
    float _182 = in.m_63.y;
    float _184 = in.m_63.z;
    float _186 = in.m_65.x;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = 0.0;
    float _228 = _218;
    float _230 = _216;
    float _232 = _214;
    if (_222)
    {
        float _234 = rsqrt(_210);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _220 > 0.0;
    float _244 = _220;
    float _246 = _240;
    if (!_222)
    {
        _228 = 0.0;
    }
    float _248 = _228;
    float _250 = _248;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = 0.0;
    float _256 = _252;
    if (_224)
    {
        float _258 = rsqrt(_212);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _264 = _262;
    float _266 = 0.0;
    float _268 = _264;
    if (!_224)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = 0.0;
    float _274 = _270;
    if (!_224)
    {
        _272 = 0.0;
    }
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_214);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _236;
    if (_222)
    {
        float _288 = _236 * _186;
        _246 = _288;
    }
    float _290 = _246;
    if (_222)
    {
        float _292 = _236 * _180;
        _250 = _292;
    }
    float _294 = _250;
    if (_222)
    {
        float _296 = _236 * _192;
        _256 = _296;
    }
    float _298 = _256;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_242)
    {
        _286 = 0.0;
        _230 = 0.0;
    }
    float _302 = _286;
    float _304 = _230;
    float _306 = _304;
    float _308 = _302;
    if (_224)
    {
        float _310 = _260 * _188;
        _268 = _310;
    }
    float _312 = _268;
    if (!_242)
    {
        _232 = 0.0;
    }
    float _314 = _232;
    float _316 = _314;
    if (_224)
    {
        float _318 = _260 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_224)
    {
        float _322 = _260 * _194;
        _280 = _322;
    }
    float _324 = _280;
    if (_242)
    {
        float _326 = _284 * _190;
        _316 = _326;
    }
    float _328 = _316;
    if (_242)
    {
        float _330 = _284 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_242)
    {
        float _334 = _284 * _196;
        _308 = _334;
    }
    float _336 = _308;
    bool _338 = !_300;
    float _356;
    if (!_338)
    {
        float _340 = in.m_69.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_124);
        float _362 = 1.0 / _360;
        float _364 = _156 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_56.x;
    float _370 = in.m_56.y;
    float _372 = in.m_56.z;
    float _374 = in.m_65.w;
    float _376 = in.m_67.w;
    float _378 = _188 * _370;
    float _380 = _194 * _370;
    float _382 = fma(_186, _368, _378);
    float _384 = fma(_192, _368, _380);
    float _386 = fma(_190, _372, _382);
    float _388 = fma(_196, _372, _384);
    float _390 = _386 + _374;
    float _392 = _388 + _376;
    float _394 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _398 = floor(_394);
    float _400 = floor(_396);
    float _402 = -_398;
    float _404 = _394 + _402;
    float _406 = -_400;
    float _408 = _396 + _406;
    float2 _3232 = float2(_404, _408);
    float _410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3232, float2(0.0), isnan(_3232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3232, float2(0.0), isnan(_3232)), level(0.0)).x;
    float _412 = in.m_69.z;
    float _414 = _182 * _370;
    float _416 = in.m_69.y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = in.m_69.x;
    float _432 = 1.0 / _420;
    float _434 = fma(_180, _368, _414);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _442 = _366 + _440;
    float _444 = fma(_184, _372, _434);
    float _446 = in.m_63.w;
    float _448 = 1.0 / _424;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _460 = _458 != 0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _464 = _366 + _462;
    float _466 = _412 * 2.0;
    float _468 = 1.0 / _428;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _472 = _366 + _470;
    float _474 = _464 * _432;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _366 + _476;
    float _480 = _416 * 2.0;
    float _482 = _472 * _448;
    float _484 = _416 + _412;
    float _486 = 1.0 / _438;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    bool _492 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _494 = isnan(_366);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = _484 + (-1.0);
    bool _506 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _508 = isnan(_366);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = _444 + _446;
    float _520 = _478 * _468;
    float _522 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _524 = _430 + _412;
    float _526 = _430 + _416;
    float _528 = _430 * 2.0;
    float _530 = floor(_466);
    float _532 = _524 + (-1.0);
    float _534 = _526 + (-1.0);
    float _536 = fma(_490, _520, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = -_502;
    float _540 = _538 + 1.0;
    float _542 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _546 = _442 * _486;
    float _548 = floor(_528);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _550;
    float _554 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _556 = log2(_554);
    bool _558 = _530 >= 0.0;
    bool _560 = isnan(_530);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _568;
    bool _572 = _530 > 0.0;
    float _574 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _576 = _566 ? 0 : 1;
    float _578 = fma(_570, _474, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _580 = floor(_480);
    bool _582 = _548 >= 0.0;
    bool _584 = isnan(_548);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    bool _592 = _548 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _594;
    int _598 = _590 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = _556 * _156;
    float _610 = fma(_596, _520, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _612 = fma(_602, _474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _614 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _616 = isnan(_366);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = exp2(_608);
    float _628 = fma(_606, _482, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _630 = _580 > 0.0;
    bool _632 = _580 >= 0.0;
    bool _634 = isnan(_580);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _650;
    int _654 = _640 ? 0 : 1;
    float _656 = fma(_644, _482, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _658 = fma(_648, _482, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _660 = fma(_652, _520, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _662 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _664 = isnan(_366);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -_624;
    float _676 = _674 + 1.0;
    float _678 = -_626;
    float _680 = _678 + 1.0;
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    float _696 = -_672;
    float _698 = _696 + 1.0;
    float _700 = _690 ? _680 : 0.0;
    float _702 = _502 * _676;
    float _704 = _624 * _698;
    bool _706 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _708 = isnan(_366);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _722 = 1.0 / _694;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _732 = _716 * _540;
    float _734 = -_716;
    float _736 = _734 + 1.0;
    float _738 = fma(_726, _546, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _740 = fma(_720, _546, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _742 = fma(_730, _546, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _744 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _746 = isnan(1.0);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _752 = _748 || _750;
    float _754 = _516 * _736;
    float _756 = -_516;
    float _758 = _756 + 1.0;
    float _760 = _574 * _754;
    float _762 = _612 * _754;
    float _764 = _578 * _754;
    float _766 = _518 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].y, _760);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].x, _762);
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].z, _764);
    int _774 = ~_654;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = fma(_656, _732, _768);
    float _782 = fma(_628, _732, _770);
    int _784 = _778;
    if (!_630)
    {
        int _786 = ~_654;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_658, _732, _772);
    bool _794 = !_452;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_660, _702, _782);
    float _800 = fma(_536, _702, _780);
    bool _802 = !_456;
    int _804 = _802 ? 0 : 1;
    float _806 = in.m_71.x;
    float _808 = in.m_71.y;
    float _810 = in.m_71.z;
    float _812 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _766);
    int _814 = ~_598;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    int _820 = _818;
    if (_752)
    {
        float _822 = _700 * _722;
        _160 = _822;
    }
    float _824 = _160;
    if (!_592)
    {
        int _826 = ~_598;
        int _828 = _826 + 1;
        _820 = _828;
    }
    int _830 = _820;
    float _832 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    bool _834 = !_460;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_738, _704, _798);
    int _840 = abs(_796);
    float _842 = _518 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _844 = abs(_804);
    float _846 = _832 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _848 = ~_576;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _842);
    int _856 = _852;
    if (!_572)
    {
        int _858 = ~_576;
        int _860 = _858 + 1;
        _856 = _860;
    }
    int _862 = _856;
    float _864 = 1.0 / _846;
    int _866 = abs(_836);
    float _868 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _854);
    float _870 = fma(_740, _704, _800);
    float _872 = _868 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _874 = float(_840);
    float _876 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].x, _838);
    float _878 = float(_844);
    float _880 = fma(_610, _702, _792);
    float _882 = float(_830);
    float _884 = _872 + _846;
    float _886 = float(_862);
    float _888 = fma(_742, _704, _880);
    float _890 = _878 * _882;
    float _892 = float(_790);
    float _894 = _874 * _886;
    float _896 = float(_866);
    float _898 = _890 * (-2.0);
    float _900 = _416 + (-0.5);
    float _902 = _884 * _864;
    float _904 = _902 * 0.5;
    float _906 = fma(_898, _808, _808);
    float _908 = _896 * _892;
    float _910 = fma(_522, _898, _522);
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _912);
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _906);
    float _918 = _894 * (-2.0);
    float _920 = in.m_73.x;
    float _922 = in.m_73.y;
    float _924 = in.m_73.z;
    float _926 = _908 * (-2.0);
    float _928 = fma(_910, _824, _916);
    float _930 = fma(_918, _806, _806);
    float _932 = 1.0 / _914;
    float _934 = in.m_75.x;
    float _936 = in.m_75.y;
    float _938 = in.m_75.z;
    float _940 = _928 * 0.15915493667125701904296875;
    float _942 = _430 + (-0.5);
    float _944 = fma(_544, _918, _544);
    float _946 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].z, _888);
    float _948 = fma(_926, _810, _810);
    float _950 = _412 + (-0.5);
    float _952 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].y, _870);
    float _954 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].x, _930);
    float _956 = fma(_542, _926, _542);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _948);
    float _960 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _962 = fma(_944, _824, _954);
    float _964 = _940 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(_956, _824, _958);
    float _970 = _962 * 0.15915493667125701904296875;
    float _972 = _518 + _960;
    float _974 = _968 * 0.15915493667125701904296875;
    float _976 = _952 * _922;
    float _978 = _946 * _924;
    float _980 = _940 * 6.283185482025146484375;
    float _982 = cos(_980);
    float _984 = _972 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _986 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _990 = _932 * _988;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _936);
    float _994 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].x, _984);
    float _996 = _972 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _998 = _876 * _920;
    float _1000 = _970 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    bool _1004 = _990 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1006 = _992 * _986;
    bool _1008 = _990 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1010 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[126].z, _994);
    bool _1012 = !_1004;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _934);
    float _1018 = _970 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _938);
    float _1026 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1028 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1030 = _1016 * _1022;
    int _1032 = 2;
    if (!_1004)
    {
        _1032 = 1;
    }
    int _1034 = _1032;
    float _1036 = _1024 * _1026;
    float _1038 = _974 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    int _1042 = _1034;
    if (!_1008)
    {
        _1042 = _1014;
    }
    int _1044 = _1042;
    float _1046 = _1002 * _982;
    float _1048 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].x, _996);
    float _1050 = _1002 * _966;
    int _1052 = _1044 << 6;
    float _1054 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1048);
    float _1056 = _974 * 6.283185482025146484375;
    float _1058 = sin(_1056);
    float _1060 = _1020 * _966;
    float _1062 = _1020 * _982;
    float _1064 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1066 = _1002 * _1040;
    float _1068 = _1020 * _1040;
    float _1070 = _982 * _1040;
    float _1072 = trunc(_1028);
    int _1074 = int(_1072);
    float _1076 = _966 * _1040;
    float _1078 = _1068 * _1006;
    int _1080 = _1052 + 48;
    uint _1083 = uint(int(uint(_1080) >> uint(2)));
    uint _1085 = uint(int(uint(int(_1083)) >> uint(2)));
    int _1087 = int(_1083) & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    int _1091 = int(_1083) + 1;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    int _1095 = _1091 & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    float _1099 = fma(_1058, _1046, _1060);
    float _1101 = fma(_1058, _1060, _1046);
    float _1103 = -_1050;
    float _1105 = fma(_1058, _1062, _1103);
    float _1107 = -_1062;
    float _1109 = fma(_1058, _1050, _1107);
    float _1111 = _1066 * _1006;
    float _1113 = -_1006;
    float _1115 = _1058 * _1113;
    int _1117 = _1052 + 96;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    uint _1121 = uint(int(uint(int(_1119)) >> uint(2)));
    int _1123 = int(_1119) & 3;
    float _1125 = (*spvDescriptorSet0.vp_c15)._m0[int(_1121)][_1123];
    int _1127 = int(_1119) + 1;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    int _1131 = _1127 & 3;
    float _1133 = (*spvDescriptorSet0.vp_c15)._m0[int(_1129)][_1131];
    float _1135 = trunc(_1064);
    int _1137 = int(_1135);
    float _1139 = fma(_1099, _1030, _1111);
    float _1141 = fma(_1070, _1030, _1115);
    float _1143 = fma(_1105, _1030, _1078);
    int _1145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1147 = _1074 + _1145;
    int _1149 = _1147 + 1;
    float _1151 = fma(_1109, _1036, _1139);
    float _1153 = fma(_1076, _1036, _1141);
    int _1155 = _1052 + 104;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    uint _1159 = uint(int(uint(int(_1157)) >> uint(2)));
    int _1161 = int(_1157) & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = int(_1157) + 1;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    int _1169 = _1165 & 3;
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[int(_1167)][_1169];
    float _1173 = fma(_1101, _1036, _1143);
    float _1175 = _1151 * _324;
    float _1177 = _1151 * _312;
    bool _1179 = _1149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1181 = fma(_1153, _298, _1175);
    float _1183 = fma(_1153, _290, _1177);
    int _1185 = _1052 + 64;
    uint _1187 = uint(int(uint(_1185) >> uint(2)));
    uint _1189 = uint(int(uint(int(_1187)) >> uint(2)));
    int _1191 = int(_1187) & 3;
    float _1193 = (*spvDescriptorSet0.vp_c15)._m0[int(_1189)][_1191];
    int _1195 = int(_1187) + 1;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    int _1199 = _1195 & 3;
    float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
    int _1203 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1205 = _1137 + _1203;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1173, _336, _1181);
    float _1211 = fma(_1173, _328, _1183);
    int _1213 = _1149 | _1207;
    float _1215 = _392 + _1209;
    float _1217 = _390 + _1211;
    int _1219 = _1052 + 56;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    uint _1223 = uint(int(uint(int(_1221)) >> uint(2)));
    int _1225 = int(_1221) & 3;
    float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
    int _1229 = int(_1221) + 1;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    int _1233 = _1229 & 3;
    float _1235 = (*spvDescriptorSet0.vp_c15)._m0[int(_1231)][_1233];
    bool _1237 = _1213 < 0;
    bool _1239 = _1237 || _1179;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1243 = _1215 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1247 = _1217 + _1245;
    bool _1249 = _1207 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1251 = _1249 || _1239;
    float _1253 = _1243 * _1243;
    int _1255 = _1052 + 72;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = fma(_1247, _1247, _1253);
    float _1275 = _1151 * _320;
    float _1277 = sqrt(_1273);
    int _1279 = _1052 + 80;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    uint _1283 = uint(int(uint(int(_1281)) >> uint(2)));
    int _1285 = int(_1281) & 3;
    float _1287 = (*spvDescriptorSet0.vp_c15)._m0[int(_1283)][_1285];
    int _1289 = int(_1281) + 1;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    int _1293 = _1289 & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    float _1297 = _972 * _1097;
    int _1299 = _1149;
    int _1301 = as_type<int>(_1151);
    float _1303 = _1273;
    if (!_1251)
    {
        int _1305 = _1207 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1307 = _1305 + _1149;
        _1299 = _1307;
    }
    int _1309 = _1299;
    float _1311 = fma(_390, _1089, _1297);
    if (!_1251)
    {
        int _1313 = _1309 << 2;
        _1301 = _1313;
    }
    int _1315 = _1301;
    float _1317 = _972 * _1133;
    float _1319 = fma(_1153, _294, _1275);
    float _1321 = _1275;
    float _1323 = _1319;
    if (!_1251)
    {
        float _1325 = floor(_1028);
        _1321 = _1325;
    }
    float _1327 = _1321;
    float _1329 = fma(_390, _1125, _1317);
    float _1331 = fma(_1173, _332, _1319);
    bool _1333 = _1277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = fma(_392, _1163, _1329);
    float _1337 = _518 + _1331;
    float _1339 = _1335 + _1171;
    int _1341 = as_type<int>(_1335);
    float _1343 = _1171;
    if (!_1251)
    {
        int _1345 = 12 & _1315;
        _1341 = _1345;
    }
    int _1347 = _1341;
    float _1349 = _972 * _1201;
    int _1351 = as_type<int>(_1201);
    float _1353 = as_type<float>(_1347);
    float _1355 = _1193;
    if (!_1251)
    {
        uint _1357 = uint(int(uint(_1309) >> uint(2)));
        _1351 = int(_1357);
    }
    int _1359 = _1351;
    float _1361 = 1.0 / _1339;
    int _1363 = _1359;
    if (!_1333)
    {
        _1343 = _1337;
    }
    float _1365 = _1343;
    float _1367 = fma(_390, _1193, _1349);
    float _1369 = _1365;
    if (!_1251)
    {
        int _1371 = _1359 << 4;
        int _1373 = _1371 + _1347;
        _1363 = _1373;
    }
    int _1375 = _1363;
    if (!_1333)
    {
        _1353 = _1217;
    }
    float _1377 = _1353;
    float _1379 = fma(_392, _1227, _1311);
    float _1381 = _1377;
    float _1383 = _1295;
    if (!_1333)
    {
        _1355 = _1215;
    }
    float _1385 = _1355;
    float _1387 = _1379 + _1235;
    float _1389 = fma(_392, _1263, _1367);
    float _1391 = _1389 + _1271;
    bool _1393 = !_1333;
    float _1395 = _1385;
    if (!_1393)
    {
        float _1397 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1401 = _1277 + _1399;
        float _1403 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = rsqrt(_1273);
        float _1407 = _1401 * _1397;
        float _1409 = _1407 * 0.15915493667125701904296875;
        float _1411 = _1409 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        float _1415 = _1409 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1413 + (-1.0);
        float _1421 = fma(_1417, _1403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1425 = _1405 * _1421;
        float _1427 = fma(_1337, _1413, _1423);
        float _1429 = fma(_1247, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1431 = fma(_1243, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1369 = _1427;
        _1381 = _1429;
        _1303 = _1405;
        _1395 = _1431;
        _1323 = _1417;
    }
    float _1433 = _1369;
    float _1435 = _1381;
    float _1437 = _1303;
    float _1439 = _1395;
    float _1441 = _1323;
    int _1443 = _1052 + 88;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    uint _1447 = uint(int(uint(int(_1445)) >> uint(2)));
    int _1449 = int(_1445) & 3;
    float _1451 = (*spvDescriptorSet0.vp_c15)._m0[int(_1447)][_1449];
    int _1453 = int(_1445) + 1;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    int _1457 = _1453 & 3;
    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[int(_1455)][_1457];
    float _1461 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1465 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1387 * _1361;
    float _1469 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1471 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1463);
    float _1473 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = _1437;
    if (!_1251)
    {
        int _1477 = _1375 + 400;
        uint _1479 = uint(int(uint(_1477) >> uint(2)));
        uint _1481 = uint(int(uint(int(_1479)) >> uint(2)));
        int _1483 = int(_1479) & 3;
        float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
        _1475 = _1485;
    }
    float _1487 = _1475;
    float _1489 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1491 = _1391 * _1361;
    float _1493 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1471);
    float _1495 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1497 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1501 = _1467 >= 0.0;
    float _1503 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1505 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1507 = _1495 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1511 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1513 = _1467 <= 1.0;
    bool _1515 = _1513 && _1501;
    float _1517 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1519 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1505);
    float _1521 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1509);
    bool _1523 = _1491 >= 0.0;
    bool _1525 = _1523 && _1515;
    float _1527 = -_1517;
    float _1529 = fma(_1527, _1511, 1.0);
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1521);
    bool _1535 = _1491 <= 1.0;
    bool _1537 = _1535 && _1525;
    float _1539 = _1441;
    float _1541 = _1529;
    if (!_1251)
    {
        float _1543 = floor(_1064);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1533);
    float _1551 = _972 * _1295;
    float _1553 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1555 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1547);
    float _1557 = fma(_390, _1287, _1551);
    float _1559 = 1.0 / _1549;
    float _1561 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1553);
    float _1563 = _1557;
    if (_1537)
    {
        float _1565 = float(_1044);
        _1383 = _1565;
    }
    float _1567 = _1383;
    float _1569 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1555);
    float _1571 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1561);
    float _1573 = log2(_1529);
    float _1575 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1569);
    float _1577 = fma(_392, _1451, _1557);
    float _1579 = _1577 + _1459;
    float _1581 = _1459;
    float _1583 = _1575;
    if (!_1251)
    {
        float _1585 = -_1327;
        float _1587 = _1028 + _1585;
        _1581 = _1587;
    }
    float _1589 = _1581;
    float _1591 = _1551;
    if (_1537)
    {
        float _1593 = rint(_1567);
        float _1595 = precise::max(_1593, 0.0);
        uint _1597 = uint(_1595);
        uint _1599 = clamp(_1597, 0u, 65535u);
        _1591 = as_type<float>(_1599);
    }
    float _1601 = _1591;
    if (!_1251)
    {
        float _1603 = -_1545;
        float _1605 = _1064 + _1603;
        _1541 = _1605;
    }
    float _1607 = _1541;
    float _1609 = _1579 * _1361;
    float _1611 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1613 = _1575 * _1559;
    float _1615 = _1611 * _1559;
    float _1617 = _1579;
    float _1619 = _1487;
    if (!_1251)
    {
        float _1621 = rint(_1487);
        float _1623 = precise::max(_1621, 0.0);
        uint _1625 = uint(_1623);
        uint _1627 = clamp(_1625, 0u, 65535u);
        _1617 = as_type<float>(_1627);
    }
    float _1629 = _1617;
    float _1631 = _1573 * 0.693147182464599609375;
    float _1633 = fma(_1613, 0.5, 0.5);
    float _1635 = fma(_1615, -0.5, 0.5);
    float _1637 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1639 = _1327;
    if (_1537)
    {
        float3 _5204 = float3(_1467, _1491, float(as_type<int>(_1601)));
        float3 _5208 = select(_5204, float3(0.0), isnan(_5204));
        float _1641 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5208.xy, uint(rint(_5208.z)), _1609, level(0.0));
        _1639 = _1641;
    }
    float _1643 = _1639;
    float3 _5218 = float3(_1633, _1635, _1637);
    float _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5218, float3(0.0), isnan(_5218)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5218, float3(0.0), isnan(_5218)), level(0.0)).x;
    float3 _5227 = float3(_1633, _1635, _1637);
    float4 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).xyzw;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = _1648.w;
    float _1658 = _1561;
    if (!_1251)
    {
        float3 _5250 = float3(_1589, _1607, float(as_type<int>(_1629)));
        float3 _5252 = select(_5250, float3(0.0), isnan(_5250));
        float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5252.xy, uint(rint(_5252.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5252.xy, uint(rint(_5252.z)), level(0.0)).x;
        _1658 = _1660;
    }
    float _1662 = _1658;
    if (_1251)
    {
        _1563 = 1.0;
    }
    float _1664 = _1563;
    float _1666 = _1664;
    if (!_1251)
    {
        int _1668 = _1309 << 4;
        int _1670 = _1668 + 2048;
        uint _1672 = uint(int(uint(_1670) >> uint(2)));
        uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
        int _1676 = int(_1672) & 3;
        float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
        int _1680 = int(_1672) + 1;
        uint _1682 = uint(int(uint(_1680) >> uint(2)));
        int _1684 = _1680 & 3;
        float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
        int _1688 = _1670 + 8;
        uint _1690 = uint(int(uint(_1688) >> uint(2)));
        uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
        int _1694 = int(_1690) & 3;
        float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
        int _1698 = int(_1690) + 1;
        uint _1700 = uint(int(uint(_1698) >> uint(2)));
        int _1702 = _1698 & 3;
        float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
        float _1706 = _972 * _1686;
        float _1708 = fma(_390, _1678, _1706);
        float _1710 = fma(_392, _1696, _1708);
        float _1712 = _1710 + _1704;
        float _1714 = precise::clamp(_1712, 0.0, 1.0);
        float _1716 = -_1714;
        float _1718 = _1716 + _1662;
        float _1720 = fma(_1718, 500.0, 1.5);
        float _1722 = exp2(_1720);
        float _1724 = 0.0 + _1722;
        float _1726 = precise::clamp(_1724, 0.0, 1.0);
        _1666 = _1726;
    }
    float _1728 = _1666;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1732 = _1433 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1736 = _1435 + _1734;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1740 = _1439 + _1738;
    float _1742 = _1732 * _1732;
    float _1744 = fma(_1736, _1736, _1742);
    float _1746 = fma(_1740, _1740, _1744);
    float _1748 = rsqrt(_1746);
    float _1750 = sqrt(_1746);
    float _1752 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1754 = _1736 * _1752;
    float _1756 = _1740 * _1752;
    float _1758 = _1754 * _1754;
    float _1760 = _1756 * _1756;
    float _1762 = _1758 + _1760;
    float _1764 = sqrt(_1762);
    bool _1766 = _1764 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1770 = _1764 + _1768;
    float _1772 = _392;
    float _1774 = _1762;
    float _1776 = _1770;
    float _1778 = _1754;
    float _1780 = _1756;
    float _1782 = _1758;
    float _1784 = _1760;
    if (_1766)
    {
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1786;
    }
    float _1788 = _1772;
    if (_1766)
    {
        float _1790 = rsqrt(_1762);
        _1774 = _1790;
    }
    float _1792 = _1774;
    if (_1766)
    {
        float _1794 = _1770 * _1788;
        _1776 = _1794;
    }
    float _1796 = _1776;
    if (_1766)
    {
        float _1798 = _1796 * 0.15915493667125701904296875;
        _1619 = _1798;
    }
    float _1800 = _1619;
    float _1802 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1804 = _390;
    float _1806 = _1802;
    if (_1766)
    {
        float _1808 = _1800 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1804 = _1810;
    }
    float _1812 = _1804;
    float _1814 = precise::max(0.0, _1802);
    float _1816 = _1796;
    float _1818 = _1814;
    if (_1766)
    {
        float _1820 = _1800 * 6.283185482025146484375;
        float _1822 = cos(_1820);
        _1816 = _1822;
    }
    float _1824 = _1816;
    float _1826 = -_1752;
    float _1828 = -_1814;
    float _1830 = fma(_1732, _1826, _1828);
    float _1832 = _1830;
    if (_1766)
    {
        float _1834 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1818 = _1834;
    }
    float _1836 = _1818;
    float _1838 = _1812;
    if (_1766)
    {
        float _1840 = fma(_1812, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1838 = _1840;
    }
    float _1842 = _1838;
    float _1844 = _1842;
    if (_1766)
    {
        float _1846 = _1792 * _1842;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1766)
    {
        float _1850 = _1824 + (-1.0);
        _1806 = _1850;
    }
    float _1852 = _1806;
    float _1854 = _1852;
    if (_1766)
    {
        float _1856 = _1754 * _1848;
        _1778 = _1856;
    }
    float _1858 = _1778;
    if (_1766)
    {
        float _1860 = _1756 * _1848;
        _1780 = _1860;
    }
    float _1862 = _1780;
    if (_1766)
    {
        float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1854 = _1864;
    }
    float _1866 = _1854;
    if (_1766)
    {
        float _1868 = _1858 * _1858;
        _1782 = _1868;
    }
    float _1870 = _1782;
    if (_1766)
    {
        float _1872 = _1862 * _1862;
        _1784 = _1872;
    }
    float _1874 = _1784;
    if (_1766)
    {
        float _1876 = fma(_1830, _1824, _1866);
        _1832 = _1876;
    }
    float _1878 = _1832;
    float _1880 = fma(_1878, _1878, _1870);
    float _1882 = _1880 + _1874;
    float _1884 = rsqrt(_1882);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = -_1890;
    float _1894 = _1892 + 1.0;
    float _1896 = abs(_1894);
    float _1898 = log2(_1896);
    float _1900 = _1884 * _1858;
    float _1902 = _1884 * _1878;
    float _1904 = _1884 * _1862;
    float _1906 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1908 = -_1906;
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1908);
    float _1912 = -_1904;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1910);
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1918 = fma(_1914, -0.5, 0.5);
    float _1920 = exp2(_1916);
    float _1922 = fma(_1914, 0.5, 0.5);
    float _1924 = _1902 + 1.0;
    float _1926 = fma(_1922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1928 = sqrt(_1918);
    float _1930 = fma(_1922, _1926, -0.212114393711090087890625);
    float _1932 = fma(_1922, _1930, 1.570728778839111328125);
    float _1934 = -_1902;
    float _1936 = fma(_1920, _1924, _1934);
    float _1938 = fma(_1936, 0.5, 0.5);
    float _1940 = _1928 * 0.636619746685028076171875;
    float _1942 = -_1932;
    float _1944 = fma(_1940, _1942, 1.0);
    float2 _5692 = float2(_1944, _1938);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5692, float2(0.0), isnan(_5692)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5692, float2(0.0), isnan(_5692)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = in.m_69.w;
    float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1960 = _416 > 0.5;
    float _1962 = in.m_77.y;
    int _1964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1966 = _1964 != 0;
    float _1968 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1972 = _1970 != 0;
    float _1974 = in.m_77.x;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1978 = _1976 != 0;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1988 = -_410;
    float _1990 = _1988 + 1.0;
    float _1992 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1986);
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2002 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2004 = _1956 > 0.5;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2008 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2000;
    float _2010 = -_1962;
    float _2012 = _2010 + 1.0;
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2016 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1992);
    out.m_81.x = _1435;
    out.m_81.y = _1433;
    out.m_81.z = _1439;
    int _2018 = 0;
    bool _2020 = _2004;
    float _2022 = _1962;
    bool _2024 = _1972;
    float _2026 = _1974;
    float _2028 = _2002;
    float _2030 = _2006;
    if (_1978)
    {
        float _2032 = -_1974;
        float _2034 = _2032 + 1.0;
        _2018 = as_type<int>(_2034);
    }
    int _2036 = _2018;
    int _2038 = _2004 ? as_type<int>(_2012) : as_type<int>(_1962);
    int _2040 = 0;
    float _2042 = as_type<float>(_2036);
    if (_1984)
    {
        float _2044 = -_1974;
        float _2046 = _2044 + 1.0;
        _2040 = as_type<int>(_2046);
    }
    int _2048 = _2040;
    float _2050 = as_type<float>(_2048);
    if (_1978)
    {
        bool _2052 = _430 > 0.5;
        _2020 = _2052;
    }
    bool _2054 = _2020;
    float _2056 = _1972 ? as_type<float>(_2038) : _1962;
    float _2058 = exp2(_1968);
    if (_1966)
    {
        float _2060 = _1960 ? _2012 : _1962;
        _2022 = _2060;
    }
    float _2062 = _2022;
    float _2064 = in.m_83.x;
    float _2066 = in.m_83.y;
    float _2068 = in.m_83.z;
    bool _2070 = _936 != 0.0;
    bool _2072 = isnan(_936);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    float _2080 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2082 = _934 == 0.0;
    bool _2084 = !_2078;
    bool _2086 = _2082 && _2084;
    if (_1984)
    {
        bool _2088 = _412 > 0.5;
        _2024 = _2088;
    }
    bool _2090 = _2024;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2094 = _938 == 0.0;
    bool _2096 = _2094 && _2086;
    float _2098 = in.m_85.x;
    float _2100 = in.m_85.y;
    float _2102 = in.m_85.z;
    float _2104 = in.m_85.w;
    float _2106 = 0.0;
    if (!_1978)
    {
        _2106 = _1974;
    }
    float _2108 = _2106;
    float _2110 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _2108;
    float _2114 = _2110;
    if (_1978)
    {
        float _2116 = _2054 ? as_type<float>(_2036) : _1974;
        _2112 = _2116;
    }
    float _2118 = _2112;
    float _2120 = -_2058;
    float _2122 = _2120 + 1.0;
    if (_1984)
    {
        float _2124 = _2090 ? as_type<float>(_2048) : _1974;
        _2026 = _2124;
    }
    float _2126 = _2026;
    out.m_87.x = _2110;
    out.m_87.y = _2002;
    out.m_87.z = _2008;
    out.m_87.w = _2006;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2096)
    {
        _2050 = _2066;
    }
    float _2130 = _2050;
    float _2132 = 0.0;
    float _2134 = _2130;
    if (_2096)
    {
        _2132 = _2068;
    }
    float _2136 = _2132;
    float _2138 = _2136;
    if (_2096)
    {
        _2028 = _2064;
    }
    float _2140 = _2028;
    float _2142 = _2140;
    if (_2096)
    {
        _2030 = _2130;
    }
    float _2144 = _2030;
    float _2146 = _2144;
    if (_2096)
    {
        _2042 = _2140;
    }
    float _2148 = _2042;
    float _2150 = _2148;
    if (!_2096)
    {
        _2142 = _2064;
    }
    float _2152 = _2142;
    float _2154 = _2128 * _1958;
    if (_2096)
    {
        _2114 = _2136;
    }
    float _2156 = _2114;
    float _2158 = _2156;
    if (!_2096)
    {
        _2134 = _2066;
    }
    float _2160 = _2134;
    if (!_2096)
    {
        float _2162 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2152);
        _2150 = _2162;
    }
    float _2164 = _2150;
    if (!_2096)
    {
        _2138 = _2068;
    }
    float _2166 = _2138;
    float _2168 = abs(_990);
    float _2170 = log2(_2168);
    float _2172 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2174 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2176 = _2102 * _2152;
    float _2178 = _2080 * _1998;
    float _2180 = _2172 * _1980;
    float _2182 = _2174 * _2014;
    float _2184 = -_2176;
    float _2186 = fma(_2098, _2166, _2184);
    if (!_2096)
    {
        float _2188 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2160);
        _2146 = _2188;
    }
    float _2190 = _2146;
    float _2192 = _2100 * _2166;
    float _2194 = _2098 * _2160;
    out.m_89.x = _2154;
    out.m_89.y = _2180;
    out.m_89.z = _2182;
    out.m_89.w = _2178;
    if (!_2096)
    {
        float _2196 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2166);
        _2158 = _2196;
    }
    float _2198 = _2158;
    float _2200 = -_2192;
    float _2202 = fma(_2102, _2160, _2200);
    float _2204 = -_2194;
    float _2206 = fma(_2100, _2152, _2204);
    float _2208 = -_2100;
    float _2210 = _1058 * _2208;
    float _2212 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2214 = _2186 * _2104;
    float _2216 = _2202 * _2104;
    float _2218 = _2206 * _2104;
    float _2220 = -_2190;
    float _2222 = _1058 * _2220;
    float _2224 = fma(_1070, _2098, _2210);
    float _2226 = -_2214;
    float _2228 = _1058 * _2226;
    float _2230 = _1068 * _2190;
    float _2232 = fma(_1070, _2164, _2222);
    float _2234 = exp2(_2212);
    float _2236 = _1066 * _2100;
    float _2238 = _1068 * _2100;
    float _2240 = _1066 * _2190;
    float _2242 = _1066 * _2214;
    float _2244 = fma(_1099, _2098, _2236);
    float _2246 = fma(_1105, _2098, _2238);
    float _2248 = _1068 * _2214;
    float _2250 = fma(_1099, _2164, _2240);
    float _2252 = fma(_1070, _2216, _2228);
    float _2254 = fma(_1099, _2216, _2242);
    float _2256 = fma(_1105, _2216, _2248);
    float _2258 = fma(_1109, _2102, _2244);
    float _2260 = fma(_1076, _2198, _2232);
    float _2262 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2264 = precise::clamp(_2262, 0.0, 1.0);
    float _2266 = fma(_1076, _2102, _2224);
    float _2268 = fma(_1105, _2164, _2230);
    float _2270 = fma(_1076, _2218, _2252);
    float _2272 = fma(_1109, _2198, _2250);
    float _2274 = fma(_1109, _2218, _2254);
    float _2276 = fma(_1101, _2102, _2246);
    float _2278 = fma(_1101, _2218, _2256);
    float _2280 = fma(_2264, -2.0, 3.0);
    float _2282 = _2264 * _2264;
    float _2284 = _2258 * _312;
    float _2286 = _2258 * _320;
    float _2288 = fma(_1101, _2198, _2268);
    float _2290 = _2272 * _320;
    float _2292 = _2258 * _324;
    float _2294 = _2272 * _312;
    float _2296 = _2274 * _312;
    float _2298 = _2274 * _320;
    float _2300 = _2282 * _2280;
    float _2302 = fma(_2266, _290, _2284);
    float _2304 = fma(_2266, _294, _2286);
    float _2306 = _2272 * _324;
    float _2308 = _2274 * _324;
    float _2310 = fma(_2266, _298, _2292);
    float _2312 = fma(_2260, _290, _2294);
    float _2314 = fma(_2270, _290, _2296);
    float _2316 = fma(_2270, _294, _2298);
    float _2318 = fma(_2276, _328, _2302);
    float _2320 = fma(_2260, _294, _2290);
    float _2322 = fma(_2276, _332, _2304);
    float _2324 = fma(_2270, _298, _2308);
    float _2326 = fma(_2276, _336, _2310);
    float _2328 = fma(_2260, _298, _2306);
    float _2330 = fma(_2278, _328, _2314);
    float _2332 = fma(_2288, _328, _2312);
    float _2334 = fma(_2288, _332, _2320);
    float _2336 = -_2300;
    float _2338 = _2336 + 1.0;
    float _2340 = fma(_2278, _332, _2316);
    float _2342 = fma(_2288, _336, _2328);
    float _2344 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    bool _2346 = _990 <= 8000.0;
    bool _2348 = isnan(_990);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan(8000.0);
    bool _2354 = _2350 || _2352;
    float _2356 = float(_2354);
    float _2358 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2300);
    out.m_91.x = _2318;
    out.m_91.y = _2322;
    out.m_91.z = _2326;
    float _2360 = _2344 + _1549;
    float _2362 = fma(_2278, _336, _2324);
    float _2364 = _2356 * _2358;
    float _2366 = _2356;
    if (!_1537)
    {
        _2366 = 1.0;
    }
    float _2368 = _2366;
    out.m_93.x = _2332;
    out.m_93.y = _2334;
    out.m_93.z = _2342;
    float _2370 = _2368;
    if (_1537)
    {
        bool _2372 = _1643 >= _1609;
        bool _2374 = isnan(_1643);
        bool _2376 = _2372 || _2374;
        bool _2378 = isnan(_1609);
        bool _2380 = _2376 || _2378;
        float _2382 = float(_2380);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _2330;
    out.m_95.y = _2340;
    out.m_95.z = _2362;
    bool _2388 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_1750);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = _2386 * _1645;
    float _2400 = _2360 * 0.5;
    float _2402 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2404 = _2384 * _1728;
    float _2406 = _1656 * _2398;
    float _2408 = -_2386;
    float _2410 = _2408 + 1.0;
    float _2412 = _1990 * _2402;
    float _2414 = precise::clamp(_2412, 0.0, 1.0);
    out.gl_Position.x = _1575;
    out.gl_Position.y = _1611;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1549;
    float _2416 = _1656 * _2410;
    float _2418 = -_2414;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_97.z = _2400;
    out.m_97.w = _1549;
    float _2422 = _2414;
    float _2424 = _2404;
    float _2426 = _2410;
    float _2428 = _2398;
    if (!_2396)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2430 = _2422;
    float _2432 = -_2404;
    float _2434 = fma(_2432, _2420, 1.0);
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2436;
    float _2440 = _2430;
    float _2442 = _2430;
    if (!_2396)
    {
        _1583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2444 = _1583;
    float _2446 = _2444;
    float _2448 = _2444;
    if (!_2396)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2450 = _2424;
    float _2452 = _2436 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2454 = _2450;
    float _2456 = _2450;
    if (!_2396)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2458 = _2426;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2396)
    {
        _2438 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2464 = _2438;
    out.m_99.x = _2452;
    float _2466 = _1954 * _2398;
    float _2468 = fma(_1950, _2406, _1650);
    float _2470 = fma(_1952, _2406, _1652);
    float _2472 = _2464;
    float _2474 = _2464;
    if (!_2396)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2428;
    float _2478 = fma(_1656, _2466, _1654);
    out.m_101.x = _2468;
    out.m_101.y = _2470;
    out.m_101.z = _2478;
    out.m_101.w = _2416;
    bool _2480 = !_2396;
    float _2482 = _2476;
    float _2484 = _2476;
    if (!_2480)
    {
        bool _2486 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2488 = isnan(_1750);
        bool _2490 = _2486 || _2488;
        bool _2492 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2494 = _2490 || _2492;
        if (!_2494)
        {
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2498 = _1750 + _2496;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2502 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2500;
            float _2504 = 1.0 / _2502;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2526 = _2498 * _2504;
            float _2528 = precise::clamp(_2526, 0.0, 1.0);
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2534 = fma(_2528, _2508, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2536 = fma(_2528, _2532, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2538 = fma(_2528, _2512, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2540 = fma(_2528, _2516, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2542 = fma(_2528, _2520, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2544 = fma(_2528, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2448 = _2536;
            _2484 = _2542;
            _2442 = _2534;
            _2462 = _2540;
            _2456 = _2538;
            _2474 = _2544;
            _2546 = true;
        }
        else
        {
            bool _2548 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2550 = isnan(_1750);
            bool _2552 = _2548 || _2550;
            bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2556 = _2552 || _2554;
            if (!_2556)
            {
                _2440 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2558 = _2440;
            _2442 = _2558;
            if (!_2556)
            {
                _2446 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2560 = _2446;
            _2448 = _2560;
            if (!_2556)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2562 = _2454;
            _2456 = _2562;
            if (!_2556)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2564 = _2460;
            _2462 = _2564;
            if (!_2556)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2566 = _2482;
            _2484 = _2566;
            if (!_2556)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2568 = _2472;
            bool _2570 = !_2556;
            _2474 = _2568;
            if (!_2570)
            {
                bool _2572 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2574 = isnan(_1750);
                bool _2576 = _2572 || _2574;
                bool _2578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2580 = _2576 || _2578;
                if (!_2580)
                {
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2584 = _1750 + _2582;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2588 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2586;
                    float _2590 = 1.0 / _2588;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2612 = _2584 * _2590;
                    float _2614 = precise::clamp(_2612, 0.0, 1.0);
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2620 = fma(_2614, _2594, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2622 = fma(_2614, _2618, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2624 = fma(_2614, _2598, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2626 = fma(_2614, _2602, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2628 = fma(_2614, _2606, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2630 = fma(_2614, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2448 = _2622;
                    _2484 = _2628;
                    _2442 = _2620;
                    _2462 = _2626;
                    _2456 = _2624;
                    _2474 = _2630;
                    _2546 = true;
                }
                else
                {
                    _2448 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2442 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2546 = false;
    float _2632 = _2448;
    float _2634 = _2484;
    float _2636 = _2442;
    float _2638 = _2462;
    float _2640 = _2456;
    float _2642 = _2474;
    float _2644 = fma(_2334, -0.5, 0.5);
    float _2646 = precise::clamp(_2644, 0.0, 1.0);
    float _2648 = -_2632;
    float _2650 = _2648 + _2634;
    float _2652 = -_2636;
    float _2654 = _2652 + _2638;
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    bool _2660 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2662 = fma(_2646, _2650, _2632);
    float _2664 = fma(_2646, _2654, _2636);
    float _2666 = fma(_2646, _2658, _2640);
    float _2668 = _2662 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2670 = fma(_2664, 0.298911988735198974609375, _2668);
    float _2672 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2674 = fma(_2666, 0.114477999508380889892578125, _2670);
    out.m_99.w = _2672;
    float _2676 = -_2674;
    float _2678 = _2662 + _2676;
    float _2680 = -_2674;
    float _2682 = _2664 + _2680;
    float _2684 = -_2674;
    float _2686 = _2666 + _2684;
    out.m_103.x = 0.0;
    float _2688 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    out.m_105.x = _2690;
    out.m_105.y = _2688;
    out.m_105.z = _2692;
    if (!_2660)
    {
        return out;
    }
    float _2694 = -_1433;
    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2698 = -_1435;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2702 = -_1439;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2706 = _2696 * _2696;
    float _2708 = fma(_2700, _2700, _2706);
    float _2710 = fma(_2704, _2704, _2708);
    float _2712 = sqrt(_2710);
    float _2714 = rsqrt(_2710);
    float _2716 = -_2712;
    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2720 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2722 = precise::clamp(_2720, 0.0, 1.0);
    float _2724 = _2700 * _2714;
    float _2726 = _2696 * _2714;
    float _2728 = abs(_2722);
    float _2730 = log2(_2728);
    float _2732 = _2704 * _2714;
    float _2734 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2736 = _2334 * _2726;
    float _2738 = -_2726;
    float _2740 = -_2734;
    float _2742 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2740);
    float _2744 = fma(_2332, _2724, _2736);
    float _2746 = -_2732;
    float _2748 = fma(_2746, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2742);
    float _2750 = fma(_2342, _2732, _2744);
    float _2752 = precise::clamp(_2750, 0.0, 1.0);
    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2756 = _2748 + _2754;
    float _2758 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = exp2(_2758);
    float _2766 = _2764 * _2762;
    float _2768 = _2752 * _2766;
    float _2770 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2772 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2774 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2770;
    out.m_103.y = _2772;
    out.m_103.z = _2774;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2546 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_56.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (!_128)
    {
        out.m_59.x = 0.0;
    }
    int _134 = 0;
    if (!_128)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_138);
        out.gl_Position.z = _2830;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_61.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_124);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_59.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _140 = as_type<int>(_176);
    }
    int _178 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2900 = as_type<float>(_178);
        out.gl_Position.z = _2900;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_63.x;
    float _182 = in.m_63.y;
    float _184 = in.m_63.z;
    float _186 = in.m_65.x;
    float _188 = in.m_65.y;
    float _190 = in.m_65.z;
    float _192 = in.m_67.x;
    float _194 = in.m_67.y;
    float _196 = in.m_67.z;
    float _198 = _180 * _180;
    float _200 = _182 * _182;
    float _202 = _184 * _184;
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = sqrt(_210);
    float _218 = sqrt(_212);
    float _220 = sqrt(_214);
    bool _222 = _216 > 0.0;
    bool _224 = _218 > 0.0;
    float _226 = 0.0;
    float _228 = _218;
    float _230 = _216;
    float _232 = _214;
    if (_222)
    {
        float _234 = rsqrt(_210);
        _226 = _234;
    }
    float _236 = _226;
    float _238 = 0.0;
    if (!_222)
    {
        _238 = 0.0;
    }
    float _240 = _238;
    bool _242 = _220 > 0.0;
    float _244 = _220;
    float _246 = _240;
    if (!_222)
    {
        _228 = 0.0;
    }
    float _248 = _228;
    float _250 = _248;
    if (!_222)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = 0.0;
    float _256 = _252;
    if (_224)
    {
        float _258 = rsqrt(_212);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (!_224)
    {
        _262 = 0.0;
    }
    float _264 = _262;
    float _266 = 0.0;
    float _268 = _264;
    if (!_224)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = 0.0;
    float _274 = _270;
    if (!_224)
    {
        _272 = 0.0;
    }
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _276;
    if (_242)
    {
        float _282 = rsqrt(_214);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _236;
    if (_222)
    {
        float _288 = _236 * _186;
        _246 = _288;
    }
    float _290 = _246;
    if (_222)
    {
        float _292 = _236 * _180;
        _250 = _292;
    }
    float _294 = _250;
    if (_222)
    {
        float _296 = _236 * _192;
        _256 = _296;
    }
    float _298 = _256;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_242)
    {
        _286 = 0.0;
        _230 = 0.0;
    }
    float _302 = _286;
    float _304 = _230;
    float _306 = _304;
    float _308 = _302;
    if (_224)
    {
        float _310 = _260 * _188;
        _268 = _310;
    }
    float _312 = _268;
    if (!_242)
    {
        _232 = 0.0;
    }
    float _314 = _232;
    float _316 = _314;
    if (_224)
    {
        float _318 = _260 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_224)
    {
        float _322 = _260 * _194;
        _280 = _322;
    }
    float _324 = _280;
    if (_242)
    {
        float _326 = _284 * _190;
        _316 = _326;
    }
    float _328 = _316;
    if (_242)
    {
        float _330 = _284 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_242)
    {
        float _334 = _284 * _196;
        _308 = _334;
    }
    float _336 = _308;
    bool _338 = !_300;
    float _356;
    if (!_338)
    {
        float _340 = in.m_69.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_124);
        float _362 = 1.0 / _360;
        float _364 = _156 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_56.x;
    float _370 = in.m_56.y;
    float _372 = in.m_56.z;
    float _374 = in.m_65.w;
    float _376 = in.m_67.w;
    float _378 = _188 * _370;
    float _380 = _194 * _370;
    float _382 = fma(_186, _368, _378);
    float _384 = fma(_192, _368, _380);
    float _386 = fma(_190, _372, _382);
    float _388 = fma(_196, _372, _384);
    float _390 = _386 + _374;
    float _392 = _388 + _376;
    float _394 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _396 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _398 = floor(_394);
    float _400 = floor(_396);
    float _402 = -_398;
    float _404 = _394 + _402;
    float _406 = -_400;
    float _408 = _396 + _406;
    float2 _3232 = float2(_404, _408);
    float _410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3232, float2(0.0), isnan(_3232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3232, float2(0.0), isnan(_3232)), level(0.0)).x;
    float _412 = in.m_69.z;
    float _414 = _182 * _370;
    float _416 = in.m_69.y;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _426;
    float _430 = in.m_69.x;
    float _432 = 1.0 / _420;
    float _434 = fma(_180, _368, _414);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _442 = _366 + _440;
    float _444 = fma(_184, _372, _434);
    float _446 = in.m_63.w;
    float _448 = 1.0 / _424;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _460 = _458 != 0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _464 = _366 + _462;
    float _466 = _412 * 2.0;
    float _468 = 1.0 / _428;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _472 = _366 + _470;
    float _474 = _464 * _432;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _366 + _476;
    float _480 = _416 * 2.0;
    float _482 = _472 * _448;
    float _484 = _416 + _412;
    float _486 = 1.0 / _438;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    bool _492 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _494 = isnan(_366);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = _484 + (-1.0);
    bool _506 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _508 = isnan(_366);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = _444 + _446;
    float _520 = _478 * _468;
    float _522 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _524 = _430 + _412;
    float _526 = _430 + _416;
    float _528 = _430 * 2.0;
    float _530 = floor(_466);
    float _532 = _524 + (-1.0);
    float _534 = _526 + (-1.0);
    float _536 = fma(_490, _520, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = -_502;
    float _540 = _538 + 1.0;
    float _542 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _546 = _442 * _486;
    float _548 = floor(_528);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _550;
    float _554 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _556 = log2(_554);
    bool _558 = _530 >= 0.0;
    bool _560 = isnan(_530);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _568;
    bool _572 = _530 > 0.0;
    float _574 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _576 = _566 ? 0 : 1;
    float _578 = fma(_570, _474, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _580 = floor(_480);
    bool _582 = _548 >= 0.0;
    bool _584 = isnan(_548);
    bool _586 = _582 || _584;
    bool _588 = isnan(0.0);
    bool _590 = _586 || _588;
    bool _592 = _548 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _594;
    int _598 = _590 ? 0 : 1;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = _556 * _156;
    float _610 = fma(_596, _520, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _612 = fma(_602, _474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _614 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _616 = isnan(_366);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = exp2(_608);
    float _628 = fma(_606, _482, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _630 = _580 > 0.0;
    bool _632 = _580 >= 0.0;
    bool _634 = isnan(_580);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _650;
    int _654 = _640 ? 0 : 1;
    float _656 = fma(_644, _482, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _658 = fma(_648, _482, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _660 = fma(_652, _520, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _662 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _664 = isnan(_366);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -_624;
    float _676 = _674 + 1.0;
    float _678 = -_626;
    float _680 = _678 + 1.0;
    bool _682 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _694 = 1.0 + _692;
    float _696 = -_672;
    float _698 = _696 + 1.0;
    float _700 = _690 ? _680 : 0.0;
    float _702 = _502 * _676;
    float _704 = _624 * _698;
    bool _706 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _708 = isnan(_366);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _722 = 1.0 / _694;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _732 = _716 * _540;
    float _734 = -_716;
    float _736 = _734 + 1.0;
    float _738 = fma(_726, _546, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _740 = fma(_720, _546, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _742 = fma(_730, _546, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _744 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _746 = isnan(1.0);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _752 = _748 || _750;
    float _754 = _516 * _736;
    float _756 = -_516;
    float _758 = _756 + 1.0;
    float _760 = _574 * _754;
    float _762 = _612 * _754;
    float _764 = _578 * _754;
    float _766 = _518 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].y, _760);
    float _770 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].x, _762);
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[143].z, _764);
    int _774 = ~_654;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = fma(_656, _732, _768);
    float _782 = fma(_628, _732, _770);
    int _784 = _778;
    if (!_630)
    {
        int _786 = ~_654;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_658, _732, _772);
    bool _794 = !_452;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_660, _702, _782);
    float _800 = fma(_536, _702, _780);
    bool _802 = !_456;
    int _804 = _802 ? 0 : 1;
    float _806 = in.m_71.x;
    float _808 = in.m_71.y;
    float _810 = in.m_71.z;
    float _812 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _766);
    int _814 = ~_598;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    int _820 = _818;
    if (_752)
    {
        float _822 = _700 * _722;
        _160 = _822;
    }
    float _824 = _160;
    if (!_592)
    {
        int _826 = ~_598;
        int _828 = _826 + 1;
        _820 = _828;
    }
    int _830 = _820;
    float _832 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _812);
    bool _834 = !_460;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_738, _704, _798);
    int _840 = abs(_796);
    float _842 = _518 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _844 = abs(_804);
    float _846 = _832 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _848 = ~_576;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _842);
    int _856 = _852;
    if (!_572)
    {
        int _858 = ~_576;
        int _860 = _858 + 1;
        _856 = _860;
    }
    int _862 = _856;
    float _864 = 1.0 / _846;
    int _866 = abs(_836);
    float _868 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _854);
    float _870 = fma(_740, _704, _800);
    float _872 = _868 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _874 = float(_840);
    float _876 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].x, _838);
    float _878 = float(_844);
    float _880 = fma(_610, _702, _792);
    float _882 = float(_830);
    float _884 = _872 + _846;
    float _886 = float(_862);
    float _888 = fma(_742, _704, _880);
    float _890 = _878 * _882;
    float _892 = float(_790);
    float _894 = _874 * _886;
    float _896 = float(_866);
    float _898 = _890 * (-2.0);
    float _900 = _416 + (-0.5);
    float _902 = _884 * _864;
    float _904 = _902 * 0.5;
    float _906 = fma(_898, _808, _808);
    float _908 = _896 * _892;
    float _910 = fma(_522, _898, _522);
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _914 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[30].w, _912);
    float _916 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[196].y, _906);
    float _918 = _894 * (-2.0);
    float _920 = in.m_73.x;
    float _922 = in.m_73.y;
    float _924 = in.m_73.z;
    float _926 = _908 * (-2.0);
    float _928 = fma(_910, _824, _916);
    float _930 = fma(_918, _806, _806);
    float _932 = 1.0 / _914;
    float _934 = in.m_75.x;
    float _936 = in.m_75.y;
    float _938 = in.m_75.z;
    float _940 = _928 * 0.15915493667125701904296875;
    float _942 = _430 + (-0.5);
    float _944 = fma(_544, _918, _544);
    float _946 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].z, _888);
    float _948 = fma(_926, _810, _810);
    float _950 = _412 + (-0.5);
    float _952 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[147].y, _870);
    float _954 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].x, _930);
    float _956 = fma(_542, _926, _542);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _948);
    float _960 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _962 = fma(_944, _824, _954);
    float _964 = _940 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = fma(_956, _824, _958);
    float _970 = _962 * 0.15915493667125701904296875;
    float _972 = _518 + _960;
    float _974 = _968 * 0.15915493667125701904296875;
    float _976 = _952 * _922;
    float _978 = _946 * _924;
    float _980 = _940 * 6.283185482025146484375;
    float _982 = cos(_980);
    float _984 = _972 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _986 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _990 = _932 * _988;
    float _992 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _936);
    float _994 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].x, _984);
    float _996 = _972 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _998 = _876 * _920;
    float _1000 = _970 * 6.283185482025146484375;
    float _1002 = cos(_1000);
    bool _1004 = _990 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1006 = _992 * _986;
    bool _1008 = _990 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1010 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[126].z, _994);
    bool _1012 = !_1004;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _934);
    float _1018 = _970 * 6.283185482025146484375;
    float _1020 = sin(_1018);
    float _1022 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _938);
    float _1026 = _978 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1028 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1030 = _1016 * _1022;
    int _1032 = 2;
    if (!_1004)
    {
        _1032 = 1;
    }
    int _1034 = _1032;
    float _1036 = _1024 * _1026;
    float _1038 = _974 * 6.283185482025146484375;
    float _1040 = cos(_1038);
    int _1042 = _1034;
    if (!_1008)
    {
        _1042 = _1014;
    }
    int _1044 = _1042;
    float _1046 = _1002 * _982;
    float _1048 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].x, _996);
    float _1050 = _1002 * _966;
    int _1052 = _1044 << 6;
    float _1054 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1048);
    float _1056 = _974 * 6.283185482025146484375;
    float _1058 = sin(_1056);
    float _1060 = _1020 * _966;
    float _1062 = _1020 * _982;
    float _1064 = _1054 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1066 = _1002 * _1040;
    float _1068 = _1020 * _1040;
    float _1070 = _982 * _1040;
    float _1072 = trunc(_1028);
    int _1074 = int(_1072);
    float _1076 = _966 * _1040;
    float _1078 = _1068 * _1006;
    int _1080 = _1052 + 48;
    uint _1083 = uint(int(uint(_1080) >> uint(2)));
    uint _1085 = uint(int(uint(int(_1083)) >> uint(2)));
    int _1087 = int(_1083) & 3;
    float _1089 = (*spvDescriptorSet0.vp_c15)._m0[int(_1085)][_1087];
    int _1091 = int(_1083) + 1;
    uint _1093 = uint(int(uint(_1091) >> uint(2)));
    int _1095 = _1091 & 3;
    float _1097 = (*spvDescriptorSet0.vp_c15)._m0[int(_1093)][_1095];
    float _1099 = fma(_1058, _1046, _1060);
    float _1101 = fma(_1058, _1060, _1046);
    float _1103 = -_1050;
    float _1105 = fma(_1058, _1062, _1103);
    float _1107 = -_1062;
    float _1109 = fma(_1058, _1050, _1107);
    float _1111 = _1066 * _1006;
    float _1113 = -_1006;
    float _1115 = _1058 * _1113;
    int _1117 = _1052 + 96;
    uint _1119 = uint(int(uint(_1117) >> uint(2)));
    uint _1121 = uint(int(uint(int(_1119)) >> uint(2)));
    int _1123 = int(_1119) & 3;
    float _1125 = (*spvDescriptorSet0.vp_c15)._m0[int(_1121)][_1123];
    int _1127 = int(_1119) + 1;
    uint _1129 = uint(int(uint(_1127) >> uint(2)));
    int _1131 = _1127 & 3;
    float _1133 = (*spvDescriptorSet0.vp_c15)._m0[int(_1129)][_1131];
    float _1135 = trunc(_1064);
    int _1137 = int(_1135);
    float _1139 = fma(_1099, _1030, _1111);
    float _1141 = fma(_1070, _1030, _1115);
    float _1143 = fma(_1105, _1030, _1078);
    int _1145 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1147 = _1074 + _1145;
    int _1149 = _1147 + 1;
    float _1151 = fma(_1109, _1036, _1139);
    float _1153 = fma(_1076, _1036, _1141);
    int _1155 = _1052 + 104;
    uint _1157 = uint(int(uint(_1155) >> uint(2)));
    uint _1159 = uint(int(uint(int(_1157)) >> uint(2)));
    int _1161 = int(_1157) & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = int(_1157) + 1;
    uint _1167 = uint(int(uint(_1165) >> uint(2)));
    int _1169 = _1165 & 3;
    float _1171 = (*spvDescriptorSet0.vp_c15)._m0[int(_1167)][_1169];
    float _1173 = fma(_1101, _1036, _1143);
    float _1175 = _1151 * _324;
    float _1177 = _1151 * _312;
    bool _1179 = _1149 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1181 = fma(_1153, _298, _1175);
    float _1183 = fma(_1153, _290, _1177);
    int _1185 = _1052 + 64;
    uint _1187 = uint(int(uint(_1185) >> uint(2)));
    uint _1189 = uint(int(uint(int(_1187)) >> uint(2)));
    int _1191 = int(_1187) & 3;
    float _1193 = (*spvDescriptorSet0.vp_c15)._m0[int(_1189)][_1191];
    int _1195 = int(_1187) + 1;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    int _1199 = _1195 & 3;
    float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
    int _1203 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1205 = _1137 + _1203;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1173, _336, _1181);
    float _1211 = fma(_1173, _328, _1183);
    int _1213 = _1149 | _1207;
    float _1215 = _392 + _1209;
    float _1217 = _390 + _1211;
    int _1219 = _1052 + 56;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    uint _1223 = uint(int(uint(int(_1221)) >> uint(2)));
    int _1225 = int(_1221) & 3;
    float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
    int _1229 = int(_1221) + 1;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    int _1233 = _1229 & 3;
    float _1235 = (*spvDescriptorSet0.vp_c15)._m0[int(_1231)][_1233];
    bool _1237 = _1213 < 0;
    bool _1239 = _1237 || _1179;
    float _1241 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1243 = _1215 + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1247 = _1217 + _1245;
    bool _1249 = _1207 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1251 = _1249 || _1239;
    float _1253 = _1243 * _1243;
    int _1255 = _1052 + 72;
    uint _1257 = uint(int(uint(_1255) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = fma(_1247, _1247, _1253);
    float _1275 = _1151 * _320;
    float _1277 = sqrt(_1273);
    int _1279 = _1052 + 80;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    uint _1283 = uint(int(uint(int(_1281)) >> uint(2)));
    int _1285 = int(_1281) & 3;
    float _1287 = (*spvDescriptorSet0.vp_c15)._m0[int(_1283)][_1285];
    int _1289 = int(_1281) + 1;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    int _1293 = _1289 & 3;
    float _1295 = (*spvDescriptorSet0.vp_c15)._m0[int(_1291)][_1293];
    float _1297 = _972 * _1097;
    int _1299 = _1149;
    int _1301 = as_type<int>(_1151);
    float _1303 = _1273;
    if (!_1251)
    {
        int _1305 = _1207 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1307 = _1305 + _1149;
        _1299 = _1307;
    }
    int _1309 = _1299;
    float _1311 = fma(_390, _1089, _1297);
    if (!_1251)
    {
        int _1313 = _1309 << 2;
        _1301 = _1313;
    }
    int _1315 = _1301;
    float _1317 = _972 * _1133;
    float _1319 = fma(_1153, _294, _1275);
    float _1321 = _1275;
    float _1323 = _1319;
    if (!_1251)
    {
        float _1325 = floor(_1028);
        _1321 = _1325;
    }
    float _1327 = _1321;
    float _1329 = fma(_390, _1125, _1317);
    float _1331 = fma(_1173, _332, _1319);
    bool _1333 = _1277 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = fma(_392, _1163, _1329);
    float _1337 = _518 + _1331;
    float _1339 = _1335 + _1171;
    int _1341 = as_type<int>(_1335);
    float _1343 = _1171;
    if (!_1251)
    {
        int _1345 = 12 & _1315;
        _1341 = _1345;
    }
    int _1347 = _1341;
    float _1349 = _972 * _1201;
    int _1351 = as_type<int>(_1201);
    float _1353 = as_type<float>(_1347);
    float _1355 = _1193;
    if (!_1251)
    {
        uint _1357 = uint(int(uint(_1309) >> uint(2)));
        _1351 = int(_1357);
    }
    int _1359 = _1351;
    float _1361 = 1.0 / _1339;
    int _1363 = _1359;
    if (!_1333)
    {
        _1343 = _1337;
    }
    float _1365 = _1343;
    float _1367 = fma(_390, _1193, _1349);
    float _1369 = _1365;
    if (!_1251)
    {
        int _1371 = _1359 << 4;
        int _1373 = _1371 + _1347;
        _1363 = _1373;
    }
    int _1375 = _1363;
    if (!_1333)
    {
        _1353 = _1217;
    }
    float _1377 = _1353;
    float _1379 = fma(_392, _1227, _1311);
    float _1381 = _1377;
    float _1383 = _1295;
    if (!_1333)
    {
        _1355 = _1215;
    }
    float _1385 = _1355;
    float _1387 = _1379 + _1235;
    float _1389 = fma(_392, _1263, _1367);
    float _1391 = _1389 + _1271;
    bool _1393 = !_1333;
    float _1395 = _1385;
    if (!_1393)
    {
        float _1397 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1401 = _1277 + _1399;
        float _1403 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = rsqrt(_1273);
        float _1407 = _1401 * _1397;
        float _1409 = _1407 * 0.15915493667125701904296875;
        float _1411 = _1409 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        float _1415 = _1409 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1413 + (-1.0);
        float _1421 = fma(_1417, _1403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1423 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1425 = _1405 * _1421;
        float _1427 = fma(_1337, _1413, _1423);
        float _1429 = fma(_1247, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1431 = fma(_1243, _1425, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1369 = _1427;
        _1381 = _1429;
        _1303 = _1405;
        _1395 = _1431;
        _1323 = _1417;
    }
    float _1433 = _1369;
    float _1435 = _1381;
    float _1437 = _1303;
    float _1439 = _1395;
    float _1441 = _1323;
    int _1443 = _1052 + 88;
    uint _1445 = uint(int(uint(_1443) >> uint(2)));
    uint _1447 = uint(int(uint(int(_1445)) >> uint(2)));
    int _1449 = int(_1445) & 3;
    float _1451 = (*spvDescriptorSet0.vp_c15)._m0[int(_1447)][_1449];
    int _1453 = int(_1445) + 1;
    uint _1455 = uint(int(uint(_1453) >> uint(2)));
    int _1457 = _1453 & 3;
    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[int(_1455)][_1457];
    float _1461 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1465 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = _1387 * _1361;
    float _1469 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1471 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1463);
    float _1473 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = _1437;
    if (!_1251)
    {
        int _1477 = _1375 + 400;
        uint _1479 = uint(int(uint(_1477) >> uint(2)));
        uint _1481 = uint(int(uint(int(_1479)) >> uint(2)));
        int _1483 = int(_1479) & 3;
        float _1485 = (*spvDescriptorSet0.vp_c15)._m0[int(_1481)][_1483];
        _1475 = _1485;
    }
    float _1487 = _1475;
    float _1489 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1469);
    float _1491 = _1391 * _1361;
    float _1493 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1471);
    float _1495 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1497 = _1433 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1499 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1501 = _1467 >= 0.0;
    float _1503 = _1493 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1505 = fma(_1435, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1497);
    float _1507 = _1495 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1511 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1513 = _1467 <= 1.0;
    bool _1515 = _1513 && _1501;
    float _1517 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1519 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1505);
    float _1521 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1509);
    bool _1523 = _1491 >= 0.0;
    bool _1525 = _1523 && _1515;
    float _1527 = -_1517;
    float _1529 = fma(_1527, _1511, 1.0);
    float _1531 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1533 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1521);
    bool _1535 = _1491 <= 1.0;
    bool _1537 = _1535 && _1525;
    float _1539 = _1441;
    float _1541 = _1529;
    if (!_1251)
    {
        float _1543 = floor(_1064);
        _1539 = _1543;
    }
    float _1545 = _1539;
    float _1547 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1549 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1533);
    float _1551 = _972 * _1295;
    float _1553 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1555 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1547);
    float _1557 = fma(_390, _1287, _1551);
    float _1559 = 1.0 / _1549;
    float _1561 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1553);
    float _1563 = _1557;
    if (_1537)
    {
        float _1565 = float(_1044);
        _1383 = _1565;
    }
    float _1567 = _1383;
    float _1569 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1555);
    float _1571 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1561);
    float _1573 = log2(_1529);
    float _1575 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1569);
    float _1577 = fma(_392, _1451, _1557);
    float _1579 = _1577 + _1459;
    float _1581 = _1459;
    float _1583 = _1575;
    if (!_1251)
    {
        float _1585 = -_1327;
        float _1587 = _1028 + _1585;
        _1581 = _1587;
    }
    float _1589 = _1581;
    float _1591 = _1551;
    if (_1537)
    {
        float _1593 = rint(_1567);
        float _1595 = precise::max(_1593, 0.0);
        uint _1597 = uint(_1595);
        uint _1599 = clamp(_1597, 0u, 65535u);
        _1591 = as_type<float>(_1599);
    }
    float _1601 = _1591;
    if (!_1251)
    {
        float _1603 = -_1545;
        float _1605 = _1064 + _1603;
        _1541 = _1605;
    }
    float _1607 = _1541;
    float _1609 = _1579 * _1361;
    float _1611 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
    float _1613 = _1575 * _1559;
    float _1615 = _1611 * _1559;
    float _1617 = _1579;
    float _1619 = _1487;
    if (!_1251)
    {
        float _1621 = rint(_1487);
        float _1623 = precise::max(_1621, 0.0);
        uint _1625 = uint(_1623);
        uint _1627 = clamp(_1625, 0u, 65535u);
        _1617 = as_type<float>(_1627);
    }
    float _1629 = _1617;
    float _1631 = _1573 * 0.693147182464599609375;
    float _1633 = fma(_1613, 0.5, 0.5);
    float _1635 = fma(_1615, -0.5, 0.5);
    float _1637 = _1631 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1639 = _1327;
    if (_1537)
    {
        float3 _5204 = float3(_1467, _1491, float(as_type<int>(_1601)));
        float3 _5208 = select(_5204, float3(0.0), isnan(_5204));
        float _1641 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5208.xy, uint(rint(_5208.z)), _1609, level(0.0));
        _1639 = _1641;
    }
    float _1643 = _1639;
    float3 _5218 = float3(_1633, _1635, _1637);
    float _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5218, float3(0.0), isnan(_5218)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5218, float3(0.0), isnan(_5218)), level(0.0)).x;
    float3 _5227 = float3(_1633, _1635, _1637);
    float4 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5227, float3(0.0), isnan(_5227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5227, float3(0.0), isnan(_5227)), level(0.0)).xyzw;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = _1648.w;
    float _1658 = _1561;
    if (!_1251)
    {
        float3 _5250 = float3(_1589, _1607, float(as_type<int>(_1629)));
        float3 _5252 = select(_5250, float3(0.0), isnan(_5250));
        float _1660 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5252.xy, uint(rint(_5252.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5252.xy, uint(rint(_5252.z)), level(0.0)).x;
        _1658 = _1660;
    }
    float _1662 = _1658;
    if (_1251)
    {
        _1563 = 1.0;
    }
    float _1664 = _1563;
    float _1666 = _1664;
    if (!_1251)
    {
        int _1668 = _1309 << 4;
        int _1670 = _1668 + 2048;
        uint _1672 = uint(int(uint(_1670) >> uint(2)));
        uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
        int _1676 = int(_1672) & 3;
        float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
        int _1680 = int(_1672) + 1;
        uint _1682 = uint(int(uint(_1680) >> uint(2)));
        int _1684 = _1680 & 3;
        float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
        int _1688 = _1670 + 8;
        uint _1690 = uint(int(uint(_1688) >> uint(2)));
        uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
        int _1694 = int(_1690) & 3;
        float _1696 = (*spvDescriptorSet0.vp_c15)._m0[int(_1692)][_1694];
        int _1698 = int(_1690) + 1;
        uint _1700 = uint(int(uint(_1698) >> uint(2)));
        int _1702 = _1698 & 3;
        float _1704 = (*spvDescriptorSet0.vp_c15)._m0[int(_1700)][_1702];
        float _1706 = _972 * _1686;
        float _1708 = fma(_390, _1678, _1706);
        float _1710 = fma(_392, _1696, _1708);
        float _1712 = _1710 + _1704;
        float _1714 = precise::clamp(_1712, 0.0, 1.0);
        float _1716 = -_1714;
        float _1718 = _1716 + _1662;
        float _1720 = fma(_1718, 500.0, 1.5);
        float _1722 = exp2(_1720);
        float _1724 = 0.0 + _1722;
        float _1726 = precise::clamp(_1724, 0.0, 1.0);
        _1666 = _1726;
    }
    float _1728 = _1666;
    float _1730 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1732 = _1433 + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1736 = _1435 + _1734;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1740 = _1439 + _1738;
    float _1742 = _1732 * _1732;
    float _1744 = fma(_1736, _1736, _1742);
    float _1746 = fma(_1740, _1740, _1744);
    float _1748 = rsqrt(_1746);
    float _1750 = sqrt(_1746);
    float _1752 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1754 = _1736 * _1752;
    float _1756 = _1740 * _1752;
    float _1758 = _1754 * _1754;
    float _1760 = _1756 * _1756;
    float _1762 = _1758 + _1760;
    float _1764 = sqrt(_1762);
    bool _1766 = _1764 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1770 = _1764 + _1768;
    float _1772 = _392;
    float _1774 = _1762;
    float _1776 = _1770;
    float _1778 = _1754;
    float _1780 = _1756;
    float _1782 = _1758;
    float _1784 = _1760;
    if (_1766)
    {
        float _1786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1786;
    }
    float _1788 = _1772;
    if (_1766)
    {
        float _1790 = rsqrt(_1762);
        _1774 = _1790;
    }
    float _1792 = _1774;
    if (_1766)
    {
        float _1794 = _1770 * _1788;
        _1776 = _1794;
    }
    float _1796 = _1776;
    if (_1766)
    {
        float _1798 = _1796 * 0.15915493667125701904296875;
        _1619 = _1798;
    }
    float _1800 = _1619;
    float _1802 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1804 = _390;
    float _1806 = _1802;
    if (_1766)
    {
        float _1808 = _1800 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1804 = _1810;
    }
    float _1812 = _1804;
    float _1814 = precise::max(0.0, _1802);
    float _1816 = _1796;
    float _1818 = _1814;
    if (_1766)
    {
        float _1820 = _1800 * 6.283185482025146484375;
        float _1822 = cos(_1820);
        _1816 = _1822;
    }
    float _1824 = _1816;
    float _1826 = -_1752;
    float _1828 = -_1814;
    float _1830 = fma(_1732, _1826, _1828);
    float _1832 = _1830;
    if (_1766)
    {
        float _1834 = _1830 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1818 = _1834;
    }
    float _1836 = _1818;
    float _1838 = _1812;
    if (_1766)
    {
        float _1840 = fma(_1812, _1836, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1838 = _1840;
    }
    float _1842 = _1838;
    float _1844 = _1842;
    if (_1766)
    {
        float _1846 = _1792 * _1842;
        _1844 = _1846;
    }
    float _1848 = _1844;
    if (_1766)
    {
        float _1850 = _1824 + (-1.0);
        _1806 = _1850;
    }
    float _1852 = _1806;
    float _1854 = _1852;
    if (_1766)
    {
        float _1856 = _1754 * _1848;
        _1778 = _1856;
    }
    float _1858 = _1778;
    if (_1766)
    {
        float _1860 = _1756 * _1848;
        _1780 = _1860;
    }
    float _1862 = _1780;
    if (_1766)
    {
        float _1864 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1854 = _1864;
    }
    float _1866 = _1854;
    if (_1766)
    {
        float _1868 = _1858 * _1858;
        _1782 = _1868;
    }
    float _1870 = _1782;
    if (_1766)
    {
        float _1872 = _1862 * _1862;
        _1784 = _1872;
    }
    float _1874 = _1784;
    if (_1766)
    {
        float _1876 = fma(_1830, _1824, _1866);
        _1832 = _1876;
    }
    float _1878 = _1832;
    float _1880 = fma(_1878, _1878, _1870);
    float _1882 = _1880 + _1874;
    float _1884 = rsqrt(_1882);
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = -_1890;
    float _1894 = _1892 + 1.0;
    float _1896 = abs(_1894);
    float _1898 = log2(_1896);
    float _1900 = _1884 * _1858;
    float _1902 = _1884 * _1878;
    float _1904 = _1884 * _1862;
    float _1906 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1908 = -_1906;
    float _1910 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1908);
    float _1912 = -_1904;
    float _1914 = fma(_1912, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1910);
    float _1916 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1918 = fma(_1914, -0.5, 0.5);
    float _1920 = exp2(_1916);
    float _1922 = fma(_1914, 0.5, 0.5);
    float _1924 = _1902 + 1.0;
    float _1926 = fma(_1922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1928 = sqrt(_1918);
    float _1930 = fma(_1922, _1926, -0.212114393711090087890625);
    float _1932 = fma(_1922, _1930, 1.570728778839111328125);
    float _1934 = -_1902;
    float _1936 = fma(_1920, _1924, _1934);
    float _1938 = fma(_1936, 0.5, 0.5);
    float _1940 = _1928 * 0.636619746685028076171875;
    float _1942 = -_1932;
    float _1944 = fma(_1940, _1942, 1.0);
    float2 _5692 = float2(_1944, _1938);
    float3 _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5692, float2(0.0), isnan(_5692)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5692, float2(0.0), isnan(_5692)), level(0.0)).xyz;
    float _1950 = _1948.x;
    float _1952 = _1948.y;
    float _1954 = _1948.z;
    float _1956 = in.m_69.w;
    float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1960 = _416 > 0.5;
    float _1962 = in.m_77.y;
    int _1964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1966 = _1964 != 0;
    float _1968 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1972 = _1970 != 0;
    float _1974 = in.m_77.x;
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1978 = _1976 != 0;
    float _1980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1984 = _1982 != 0;
    float _1986 = _1499 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1988 = -_410;
    float _1990 = _1988 + 1.0;
    float _1992 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1986);
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2002 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2004 = _1956 > 0.5;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2008 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2000;
    float _2010 = -_1962;
    float _2012 = _2010 + 1.0;
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2016 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1992);
    out.m_81.x = _1435;
    out.m_81.y = _1433;
    out.m_81.z = _1439;
    int _2018 = 0;
    bool _2020 = _2004;
    float _2022 = _1962;
    bool _2024 = _1972;
    float _2026 = _1974;
    float _2028 = _2002;
    float _2030 = _2006;
    if (_1978)
    {
        float _2032 = -_1974;
        float _2034 = _2032 + 1.0;
        _2018 = as_type<int>(_2034);
    }
    int _2036 = _2018;
    int _2038 = _2004 ? as_type<int>(_2012) : as_type<int>(_1962);
    int _2040 = 0;
    float _2042 = as_type<float>(_2036);
    if (_1984)
    {
        float _2044 = -_1974;
        float _2046 = _2044 + 1.0;
        _2040 = as_type<int>(_2046);
    }
    int _2048 = _2040;
    float _2050 = as_type<float>(_2048);
    if (_1978)
    {
        bool _2052 = _430 > 0.5;
        _2020 = _2052;
    }
    bool _2054 = _2020;
    float _2056 = _1972 ? as_type<float>(_2038) : _1962;
    float _2058 = exp2(_1968);
    if (_1966)
    {
        float _2060 = _1960 ? _2012 : _1962;
        _2022 = _2060;
    }
    float _2062 = _2022;
    float _2064 = in.m_83.x;
    float _2066 = in.m_83.y;
    float _2068 = in.m_83.z;
    bool _2070 = _936 != 0.0;
    bool _2072 = isnan(_936);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    float _2080 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2082 = _934 == 0.0;
    bool _2084 = !_2078;
    bool _2086 = _2082 && _2084;
    if (_1984)
    {
        bool _2088 = _412 > 0.5;
        _2024 = _2088;
    }
    bool _2090 = _2024;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2094 = _938 == 0.0;
    bool _2096 = _2094 && _2086;
    float _2098 = in.m_85.x;
    float _2100 = in.m_85.y;
    float _2102 = in.m_85.z;
    float _2104 = in.m_85.w;
    float _2106 = 0.0;
    if (!_1978)
    {
        _2106 = _1974;
    }
    float _2108 = _2106;
    float _2110 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2112 = _2108;
    float _2114 = _2110;
    if (_1978)
    {
        float _2116 = _2054 ? as_type<float>(_2036) : _1974;
        _2112 = _2116;
    }
    float _2118 = _2112;
    float _2120 = -_2058;
    float _2122 = _2120 + 1.0;
    if (_1984)
    {
        float _2124 = _2090 ? as_type<float>(_2048) : _1974;
        _2026 = _2124;
    }
    float _2126 = _2026;
    out.m_87.x = _2110;
    out.m_87.y = _2002;
    out.m_87.z = _2008;
    out.m_87.w = _2006;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2096)
    {
        _2050 = _2066;
    }
    float _2130 = _2050;
    float _2132 = 0.0;
    float _2134 = _2130;
    if (_2096)
    {
        _2132 = _2068;
    }
    float _2136 = _2132;
    float _2138 = _2136;
    if (_2096)
    {
        _2028 = _2064;
    }
    float _2140 = _2028;
    float _2142 = _2140;
    if (_2096)
    {
        _2030 = _2130;
    }
    float _2144 = _2030;
    float _2146 = _2144;
    if (_2096)
    {
        _2042 = _2140;
    }
    float _2148 = _2042;
    float _2150 = _2148;
    if (!_2096)
    {
        _2142 = _2064;
    }
    float _2152 = _2142;
    float _2154 = _2128 * _1958;
    if (_2096)
    {
        _2114 = _2136;
    }
    float _2156 = _2114;
    float _2158 = _2156;
    if (!_2096)
    {
        _2134 = _2066;
    }
    float _2160 = _2134;
    if (!_2096)
    {
        float _2162 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2152);
        _2150 = _2162;
    }
    float _2164 = _2150;
    if (!_2096)
    {
        _2138 = _2068;
    }
    float _2166 = _2138;
    float _2168 = abs(_990);
    float _2170 = log2(_2168);
    float _2172 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2174 = _2126 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2176 = _2102 * _2152;
    float _2178 = _2080 * _1998;
    float _2180 = _2172 * _1980;
    float _2182 = _2174 * _2014;
    float _2184 = -_2176;
    float _2186 = fma(_2098, _2166, _2184);
    if (!_2096)
    {
        float _2188 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2160);
        _2146 = _2188;
    }
    float _2190 = _2146;
    float _2192 = _2100 * _2166;
    float _2194 = _2098 * _2160;
    out.m_89.x = _2154;
    out.m_89.y = _2180;
    out.m_89.z = _2182;
    out.m_89.w = _2178;
    if (!_2096)
    {
        float _2196 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2166);
        _2158 = _2196;
    }
    float _2198 = _2158;
    float _2200 = -_2192;
    float _2202 = fma(_2102, _2160, _2200);
    float _2204 = -_2194;
    float _2206 = fma(_2100, _2152, _2204);
    float _2208 = -_2100;
    float _2210 = _1058 * _2208;
    float _2212 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2214 = _2186 * _2104;
    float _2216 = _2202 * _2104;
    float _2218 = _2206 * _2104;
    float _2220 = -_2190;
    float _2222 = _1058 * _2220;
    float _2224 = fma(_1070, _2098, _2210);
    float _2226 = -_2214;
    float _2228 = _1058 * _2226;
    float _2230 = _1068 * _2190;
    float _2232 = fma(_1070, _2164, _2222);
    float _2234 = exp2(_2212);
    float _2236 = _1066 * _2100;
    float _2238 = _1068 * _2100;
    float _2240 = _1066 * _2190;
    float _2242 = _1066 * _2214;
    float _2244 = fma(_1099, _2098, _2236);
    float _2246 = fma(_1105, _2098, _2238);
    float _2248 = _1068 * _2214;
    float _2250 = fma(_1099, _2164, _2240);
    float _2252 = fma(_1070, _2216, _2228);
    float _2254 = fma(_1099, _2216, _2242);
    float _2256 = fma(_1105, _2216, _2248);
    float _2258 = fma(_1109, _2102, _2244);
    float _2260 = fma(_1076, _2198, _2232);
    float _2262 = fma(_2234, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2264 = precise::clamp(_2262, 0.0, 1.0);
    float _2266 = fma(_1076, _2102, _2224);
    float _2268 = fma(_1105, _2164, _2230);
    float _2270 = fma(_1076, _2218, _2252);
    float _2272 = fma(_1109, _2198, _2250);
    float _2274 = fma(_1109, _2218, _2254);
    float _2276 = fma(_1101, _2102, _2246);
    float _2278 = fma(_1101, _2218, _2256);
    float _2280 = fma(_2264, -2.0, 3.0);
    float _2282 = _2264 * _2264;
    float _2284 = _2258 * _312;
    float _2286 = _2258 * _320;
    float _2288 = fma(_1101, _2198, _2268);
    float _2290 = _2272 * _320;
    float _2292 = _2258 * _324;
    float _2294 = _2272 * _312;
    float _2296 = _2274 * _312;
    float _2298 = _2274 * _320;
    float _2300 = _2282 * _2280;
    float _2302 = fma(_2266, _290, _2284);
    float _2304 = fma(_2266, _294, _2286);
    float _2306 = _2272 * _324;
    float _2308 = _2274 * _324;
    float _2310 = fma(_2266, _298, _2292);
    float _2312 = fma(_2260, _290, _2294);
    float _2314 = fma(_2270, _290, _2296);
    float _2316 = fma(_2270, _294, _2298);
    float _2318 = fma(_2276, _328, _2302);
    float _2320 = fma(_2260, _294, _2290);
    float _2322 = fma(_2276, _332, _2304);
    float _2324 = fma(_2270, _298, _2308);
    float _2326 = fma(_2276, _336, _2310);
    float _2328 = fma(_2260, _298, _2306);
    float _2330 = fma(_2278, _328, _2314);
    float _2332 = fma(_2288, _328, _2312);
    float _2334 = fma(_2288, _332, _2320);
    float _2336 = -_2300;
    float _2338 = _2336 + 1.0;
    float _2340 = fma(_2278, _332, _2316);
    float _2342 = fma(_2288, _336, _2328);
    float _2344 = fma(_1531, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2016);
    bool _2346 = _990 <= 8000.0;
    bool _2348 = isnan(_990);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan(8000.0);
    bool _2354 = _2350 || _2352;
    float _2356 = float(_2354);
    float _2358 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2300);
    out.m_91.x = _2318;
    out.m_91.y = _2322;
    out.m_91.z = _2326;
    float _2360 = _2344 + _1549;
    float _2362 = fma(_2278, _336, _2324);
    float _2364 = _2356 * _2358;
    float _2366 = _2356;
    if (!_1537)
    {
        _2366 = 1.0;
    }
    float _2368 = _2366;
    out.m_93.x = _2332;
    out.m_93.y = _2334;
    out.m_93.z = _2342;
    float _2370 = _2368;
    if (_1537)
    {
        bool _2372 = _1643 >= _1609;
        bool _2374 = isnan(_1643);
        bool _2376 = _2372 || _2374;
        bool _2378 = isnan(_1609);
        bool _2380 = _2376 || _2378;
        float _2382 = float(_2380);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _2330;
    out.m_95.y = _2340;
    out.m_95.z = _2362;
    bool _2388 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2390 = isnan(_1750);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2396 = _2392 || _2394;
    float _2398 = _2386 * _1645;
    float _2400 = _2360 * 0.5;
    float _2402 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2404 = _2384 * _1728;
    float _2406 = _1656 * _2398;
    float _2408 = -_2386;
    float _2410 = _2408 + 1.0;
    float _2412 = _1990 * _2402;
    float _2414 = precise::clamp(_2412, 0.0, 1.0);
    out.gl_Position.x = _1575;
    out.gl_Position.y = _1611;
    out.gl_Position.z = _2344;
    out.gl_Position.w = _1549;
    float _2416 = _1656 * _2410;
    float _2418 = -_2414;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_97.z = _2400;
    out.m_97.w = _1549;
    float _2422 = _2414;
    float _2424 = _2404;
    float _2426 = _2410;
    float _2428 = _2398;
    if (!_2396)
    {
        _2422 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2430 = _2422;
    float _2432 = -_2404;
    float _2434 = fma(_2432, _2420, 1.0);
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2436;
    float _2440 = _2430;
    float _2442 = _2430;
    if (!_2396)
    {
        _1583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2444 = _1583;
    float _2446 = _2444;
    float _2448 = _2444;
    if (!_2396)
    {
        _2424 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2450 = _2424;
    float _2452 = _2436 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2454 = _2450;
    float _2456 = _2450;
    if (!_2396)
    {
        _2426 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2458 = _2426;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2396)
    {
        _2438 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2464 = _2438;
    out.m_99.x = _2452;
    float _2466 = _1954 * _2398;
    float _2468 = fma(_1950, _2406, _1650);
    float _2470 = fma(_1952, _2406, _1652);
    float _2472 = _2464;
    float _2474 = _2464;
    if (!_2396)
    {
        _2428 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2428;
    float _2478 = fma(_1656, _2466, _1654);
    out.m_101.x = _2468;
    out.m_101.y = _2470;
    out.m_101.z = _2478;
    out.m_101.w = _2416;
    bool _2480 = !_2396;
    float _2482 = _2476;
    float _2484 = _2476;
    if (!_2480)
    {
        bool _2486 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2488 = isnan(_1750);
        bool _2490 = _2486 || _2488;
        bool _2492 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2494 = _2490 || _2492;
        if (!_2494)
        {
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2498 = _1750 + _2496;
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2502 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2500;
            float _2504 = 1.0 / _2502;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2526 = _2498 * _2504;
            float _2528 = precise::clamp(_2526, 0.0, 1.0);
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2534 = fma(_2528, _2508, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2536 = fma(_2528, _2532, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2538 = fma(_2528, _2512, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2540 = fma(_2528, _2516, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2542 = fma(_2528, _2520, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2544 = fma(_2528, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2448 = _2536;
            _2484 = _2542;
            _2442 = _2534;
            _2462 = _2540;
            _2456 = _2538;
            _2474 = _2544;
            _2546 = true;
        }
        else
        {
            bool _2548 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2550 = isnan(_1750);
            bool _2552 = _2548 || _2550;
            bool _2554 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2556 = _2552 || _2554;
            if (!_2556)
            {
                _2440 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2558 = _2440;
            _2442 = _2558;
            if (!_2556)
            {
                _2446 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2560 = _2446;
            _2448 = _2560;
            if (!_2556)
            {
                _2454 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2562 = _2454;
            _2456 = _2562;
            if (!_2556)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2564 = _2460;
            _2462 = _2564;
            if (!_2556)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2566 = _2482;
            _2484 = _2566;
            if (!_2556)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2568 = _2472;
            bool _2570 = !_2556;
            _2474 = _2568;
            if (!_2570)
            {
                bool _2572 = _1750 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2574 = isnan(_1750);
                bool _2576 = _2572 || _2574;
                bool _2578 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2580 = _2576 || _2578;
                if (!_2580)
                {
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2584 = _1750 + _2582;
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2588 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2586;
                    float _2590 = 1.0 / _2588;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2612 = _2584 * _2590;
                    float _2614 = precise::clamp(_2612, 0.0, 1.0);
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2620 = fma(_2614, _2594, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2622 = fma(_2614, _2618, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2624 = fma(_2614, _2598, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2626 = fma(_2614, _2602, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2628 = fma(_2614, _2606, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2630 = fma(_2614, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2448 = _2622;
                    _2484 = _2628;
                    _2442 = _2620;
                    _2462 = _2626;
                    _2456 = _2624;
                    _2474 = _2630;
                    _2546 = true;
                }
                else
                {
                    _2448 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2442 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2456 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2546 = false;
    float _2632 = _2448;
    float _2634 = _2484;
    float _2636 = _2442;
    float _2638 = _2462;
    float _2640 = _2456;
    float _2642 = _2474;
    float _2644 = fma(_2334, -0.5, 0.5);
    float _2646 = precise::clamp(_2644, 0.0, 1.0);
    float _2648 = -_2632;
    float _2650 = _2648 + _2634;
    float _2652 = -_2636;
    float _2654 = _2652 + _2638;
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    bool _2660 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2662 = fma(_2646, _2650, _2632);
    float _2664 = fma(_2646, _2654, _2636);
    float _2666 = fma(_2646, _2658, _2640);
    float _2668 = _2662 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2670 = fma(_2664, 0.298911988735198974609375, _2668);
    float _2672 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2674 = fma(_2666, 0.114477999508380889892578125, _2670);
    out.m_99.w = _2672;
    float _2676 = -_2674;
    float _2678 = _2662 + _2676;
    float _2680 = -_2674;
    float _2682 = _2664 + _2680;
    float _2684 = -_2674;
    float _2686 = _2666 + _2684;
    out.m_103.x = 0.0;
    float _2688 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2674);
    out.m_105.x = _2690;
    out.m_105.y = _2688;
    out.m_105.z = _2692;
    if (!_2660)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2694 = -_1433;
    float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2698 = -_1435;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2702 = -_1439;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2706 = _2696 * _2696;
    float _2708 = fma(_2700, _2700, _2706);
    float _2710 = fma(_2704, _2704, _2708);
    float _2712 = sqrt(_2710);
    float _2714 = rsqrt(_2710);
    float _2716 = -_2712;
    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2720 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2722 = precise::clamp(_2720, 0.0, 1.0);
    float _2724 = _2700 * _2714;
    float _2726 = _2696 * _2714;
    float _2728 = abs(_2722);
    float _2730 = log2(_2728);
    float _2732 = _2704 * _2714;
    float _2734 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2736 = _2334 * _2726;
    float _2738 = -_2726;
    float _2740 = -_2734;
    float _2742 = fma(_2738, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2740);
    float _2744 = fma(_2332, _2724, _2736);
    float _2746 = -_2732;
    float _2748 = fma(_2746, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2742);
    float _2750 = fma(_2342, _2732, _2744);
    float _2752 = precise::clamp(_2750, 0.0, 1.0);
    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2756 = _2748 + _2754;
    float _2758 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2760 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = exp2(_2758);
    float _2766 = _2764 * _2762;
    float _2768 = _2752 * _2766;
    float _2770 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2772 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2774 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _2770;
    out.m_103.y = _2772;
    out.m_103.z = _2774;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

