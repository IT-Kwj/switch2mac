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
    float4 m_79 [[user(locn0)]];
    float4 m_85 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_97 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_103 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_81 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_73 [[attribute(10)]];
    float4 m_83 [[attribute(11)]];
    float4 m_77 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2792 = false;
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
    float _134 = _132;
    if (!_128)
    {
        out.m_59.x = 0.0;
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
        float _3077 = as_type<float>(_140);
        out.gl_Position.z = _3077;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3147 = as_type<float>(_178);
        out.gl_Position.z = _3147;
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
    float _226 = _218;
    float _228 = _216;
    if (_222)
    {
        float _230 = rsqrt(_210);
        _226 = _230;
    }
    float _232 = _226;
    float _234 = 0.0;
    if (!_222)
    {
        _234 = 0.0;
    }
    float _236 = _234;
    bool _238 = _220 > 0.0;
    float _240 = 0.0;
    float _242 = _236;
    if (!_222)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (!_222)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = 0.0;
    float _254 = _250;
    if (_224)
    {
        float _256 = rsqrt(_212);
        _252 = _256;
    }
    float _258 = _252;
    float _260 = 0.0;
    if (!_224)
    {
        _260 = 0.0;
    }
    float _262 = _260;
    float _264 = 0.0;
    float _266 = _262;
    if (!_224)
    {
        _264 = 0.0;
    }
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    if (!_224)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _220;
    float _278 = _274;
    if (_238)
    {
        float _280 = rsqrt(_214);
        _276 = _280;
    }
    float _282 = _276;
    if (_222)
    {
        float _284 = _232 * _186;
        _242 = _284;
    }
    float _286 = _242;
    if (_222)
    {
        float _288 = _232 * _180;
        _248 = _288;
    }
    float _290 = _248;
    if (_222)
    {
        float _292 = _232 * _192;
        _254 = _292;
    }
    float _294 = _254;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _298 = 0.0;
    if (!_238)
    {
        _228 = 0.0;
        _298 = 0.0;
    }
    float _300 = _228;
    float _302 = _298;
    float _304 = 0.0;
    float _306 = _302;
    float _308 = _300;
    if (!_238)
    {
        _304 = 0.0;
    }
    float _310 = _304;
    float _312 = _310;
    if (_224)
    {
        float _314 = _258 * _188;
        _266 = _314;
    }
    float _316 = _266;
    if (_224)
    {
        float _318 = _258 * _182;
        _272 = _318;
    }
    float _320 = _272;
    if (_224)
    {
        float _322 = _258 * _194;
        _278 = _322;
    }
    float _324 = _278;
    if (_238)
    {
        float _326 = _282 * _190;
        _312 = _326;
    }
    float _328 = _312;
    if (_238)
    {
        float _330 = _282 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_238)
    {
        float _334 = _282 * _196;
        _308 = _334;
    }
    float _336 = _308;
    bool _338 = !_296;
    float _356;
    if (!_338)
    {
        float _340 = in.m_69.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
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
        float _364 = _158 * _362;
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
    float2 _3477 = float2(_404, _408);
    float _410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3477, float2(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3477, float2(0.0), isnan(_3477)), level(0.0)).x;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    float _416 = in.m_69.z;
    float _418 = _182 * _370;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _366 + _420;
    float _424 = in.m_69.y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _442 = in.m_69.x;
    float _444 = 1.0 / _428;
    float _446 = fma(_180, _368, _418);
    float _448 = _414 * _158;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _456 = _366 + _454;
    float _458 = fma(_184, _372, _446);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _462 = _366 + _460;
    float _464 = 1.0 / _432;
    float _466 = in.m_63.w;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _478 = _476 != 0;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _482 = _366 + _480;
    bool _484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _492 = _488 || _490;
    float _494 = 1.0 / _436;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = _482 * _444;
    float _502 = _424 + _416;
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = _416 * 2.0;
    float _516 = _442 * 2.0;
    float _518 = _502 + (-1.0);
    float _520 = 1.0 / _440;
    float _522 = _422 * _464;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _526 = _366 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = exp2(_448);
    float _538 = _456 * _494;
    float _540 = fma(_534, _522, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = fma(_530, _500, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _544;
    float _548 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _550 = 1.0 / _452;
    float _552 = _526 * _520;
    float _554 = _424 * 2.0;
    float _556 = _442 + _424;
    float _558 = fma(_546, _538, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _560 = !_478;
    int _562 = _560 ? 0 : 1;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = _556 + (-1.0);
    float _570 = 1.0 / _498;
    float _572 = -_536;
    float _574 = _572 + 1.0;
    bool _576 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _578 = isnan(_366);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _512 ? _574 : 0.0;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _592 = _462 * _550;
    float _594 = _442 + _416;
    float _596 = floor(_554);
    bool _598 = !_474;
    int _600 = _598 ? 0 : 1;
    float _602 = _594 + (-1.0);
    bool _604 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _606 = isnan(_366);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _390;
    if (_492)
    {
        float _618 = _588 * _570;
        _160 = _618;
    }
    float _620 = _160;
    float _622 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _624 = floor(_514);
    bool _626 = !_470;
    int _628 = _626 ? 0 : 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _646 = floor(_516);
    float _648 = fma(_636, _522, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = fma(_632, _500, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _652 = fma(_644, _522, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _654 = fma(_640, _500, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _656;
    bool _660 = _596 > 0.0;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _662;
    bool _666 = _596 >= 0.0;
    bool _668 = isnan(_596);
    bool _670 = _666 || _668;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    float _676 = fma(_658, _538, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _678 = _624 >= 0.0;
    bool _680 = isnan(_624);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = fma(_664, _538, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _694 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _696 = isnan(_366);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _710 = _646 >= 0.0;
    bool _712 = isnan(_646);
    bool _714 = _710 || _712;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    bool _720 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _722 = isnan(_366);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _742 = _740 != 0;
    float _744 = -_704;
    float _746 = _744 + 1.0;
    bool _748 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _750 = isnan(_366);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_730;
    float _762 = _760 + 1.0;
    bool _764 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _766 = isnan(_366);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = _730 * _746;
    float _778 = fma(_692, _552, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _780 = -_586;
    float _782 = _780 + 1.0;
    int _784 = _718 ? 0 : 1;
    float _786 = -_758;
    float _788 = _786 + 1.0;
    bool _790 = _624 > 0.0;
    float _792 = _774 * _782;
    float _794 = -_774;
    float _796 = _794 + 1.0;
    bool _798 = !_734;
    int _800 = _798 ? 0 : 1;
    float _802 = _586 * _788;
    float _804 = _614 * _796;
    float _806 = -_614;
    float _808 = _806 + 1.0;
    int _810 = abs(_800);
    float _812 = _758 * _762;
    float _814 = _650 * _804;
    float _816 = _542 * _804;
    float _818 = _654 * _804;
    float _820 = _458 + _466;
    float _822 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].x, _814);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _826 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].z, _818);
    int _828 = _686 ? 0 : 1;
    float _830 = fma(_648, _792, _822);
    float _832 = _620 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _834 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _836;
    float _840 = fma(_652, _792, _826);
    int _842 = ~_828;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = fma(_540, _792, _834);
    int _850 = _846;
    if (!_790)
    {
        int _852 = ~_828;
        int _854 = _852 + 1;
        _850 = _854;
    }
    int _856 = _850;
    float _858 = fma(_838, _592, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _860 = !_738;
    int _862 = _860 ? 0 : 1;
    float _864 = fma(_566, _552, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _866 = _674 ? 0 : 1;
    float _868 = _832 * _824;
    bool _870 = _646 > 0.0;
    float _872 = fma(_708, _552, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _874 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _868);
    float _876 = float(_856);
    float _878 = fma(_558, _802, _848);
    bool _880 = !_742;
    int _882 = _880 ? 0 : 1;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _884;
    int _888 = abs(_862);
    float _890 = fma(_676, _802, _830);
    int _892 = ~_866;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = floor(_874);
    int _900 = _896;
    if (!_660)
    {
        int _902 = ~_866;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = _820 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _910 = float(_810);
    float _912 = fma(_886, _592, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _914 = abs(_882);
    float _916 = _874 + 0.25;
    float _918 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _920 = _910 * _876;
    int _922 = ~_784;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = floor(_916);
    float _930 = in.m_71.x;
    float _932 = in.m_71.y;
    float _934 = in.m_71.z;
    float _936 = fma(_688, _802, _840);
    int _938 = _926;
    if (!_870)
    {
        int _940 = ~_784;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _918);
    float _948 = -_898;
    float _950 = _874 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _952;
    float _956 = float(_944);
    float _958 = _874 * 6.283185482025146484375;
    float _960 = float(_888);
    float _962 = fma(_954, _592, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _964 = float(_906);
    float _966 = _820 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _968 = float(_914);
    float _970 = _960 * _956;
    bool _972 = _950 >= 0.5;
    bool _974 = isnan(_950);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.5);
    bool _980 = _976 || _978;
    float _982 = _958 * 0.15915493667125701904296875;
    float _984 = -_928;
    float _986 = _916 + _984;
    float _988 = _968 * _964;
    int _990 = abs(_600);
    float _992 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _966);
    float _994 = _970 * (-2.0);
    float _996 = _982 * 6.283185482025146484375;
    float _998 = sin(_996);
    bool _1000 = _986 > 0.5;
    float _1002 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _992);
    bool _1004 = !_980;
    float _1006 = _1004 ? 0.5 : (-0.5);
    float _1008 = fma(_548, _994, _548);
    float _1010 = fma(_994, _932, _932);
    float _1012 = float(_990);
    float _1014 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = _424 + (-0.5);
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1020 = _1018 * 2.0;
    float _1022 = _946 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1024 = abs(_628);
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1010);
    int _1028 = abs(_562);
    float _1030 = _1022 + _1014;
    float _1032 = 1.0 / _1014;
    float _1034 = _986;
    if (_1000)
    {
        float _1036 = -_986;
        float _1038 = _1036 + 1.0;
        _1034 = _1038;
    }
    float _1040 = _1034;
    float _1042 = _1012 * _1020;
    float _1044 = float(_1024);
    float _1046 = _998 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1048 = fma(_1040, 4.0, -1.0);
    float _1050 = fma(_1044, _1046, _1042);
    float _1052 = float(_1028);
    float _1054 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1056 = _988 * (-2.0);
    float _1058 = fma(_1008, _620, _1026);
    float _1060 = _416 + (-0.5);
    float _1062 = fma(_1052, _1054, _1050);
    float _1064 = fma(_622, _1056, _622);
    float _1066 = in.m_73.x;
    float _1068 = in.m_73.y;
    float _1070 = in.m_73.z;
    float _1072 = _1030 * _1032;
    float _1074 = _1072 * 0.5;
    float _1076 = _1058 * 0.15915493667125701904296875;
    float _1078 = fma(_1062, 3.1415927410125732421875, _930);
    float _1080 = _920 * (-2.0);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1082);
    float _1086 = fma(_1056, _934, _934);
    float _1088 = fma(_778, _812, _890);
    float _1090 = fma(_872, _812, _936);
    float _1092 = 1.0 / _1084;
    float _1094 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1086);
    float _1096 = fma(_858, _776, _1088);
    float _1098 = fma(_590, _1080, _590);
    float _1100 = fma(_962, _776, _1090);
    float _1102 = in.m_75.x;
    float _1104 = in.m_75.y;
    float _1106 = in.m_75.z;
    float _1108 = fma(_864, _812, _878);
    bool _1110 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1112 = isnan(0.5);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1118 = _1114 || _1116;
    float _1120 = _1076 * 6.283185482025146484375;
    float _1122 = sin(_1120);
    float _1124 = fma(_1064, _620, _1094);
    float _1126 = _442 + (-0.5);
    float _1128 = fma(_1078, _1080, _1078);
    float _1130 = fma(_912, _776, _1108);
    float _1132 = _1124 * 0.15915493667125701904296875;
    float _1134 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1128);
    float _1136 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1096);
    float _1138 = _1132 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1144 = _1092 * _1142;
    float _1146 = fma(_1098, _620, _1134);
    float _1148 = _1136 * _1066;
    float _1150 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1100);
    float _1152 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1130);
    float _1154 = _1146 * 0.15915493667125701904296875;
    bool _1156 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1158 = _1150 * _1070;
    float _1160 = _1076 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    bool _1164 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1166 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1170 = _1152 * _1068;
    bool _1172 = !_1156;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = _820 + _1166;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1180 = _1154 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1186 = _1122 * _1140;
    int _1188 = 2;
    float _1190 = _1176;
    if (!_1156)
    {
        _1188 = 1;
    }
    int _1192 = _1188;
    float _1194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1102);
    float _1196 = _1178 * _1184;
    int _1198 = _1192;
    if (!_1164)
    {
        _1198 = _1174;
    }
    int _1200 = _1198;
    float _1202 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1204 = _1154 * 6.283185482025146484375;
    float _1206 = cos(_1204);
    float _1208 = _1162 * _1140;
    float _1210 = _1194 * _1168;
    float _1212 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1106);
    float _1216 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1202);
    float _1218 = _1132 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1182 * _1122;
    float _1224 = _1182 * _1140;
    float _1226 = _1214 * _1212;
    float _1228 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1216);
    float _1230 = _1224 * _1196;
    float _1232 = _1206 * _1122;
    float _1234 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1236 = _1206 * _1162;
    float _1238 = _1182 * _1162;
    int _1240 = _1200 << 6;
    float _1242 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1234);
    float _1244 = _1206 * _1140;
    float _1246 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1248 = fma(_1220, _1236, _1222);
    float _1250 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1242);
    float _1252 = fma(_1220, _1222, _1236);
    int _1254 = _1240 + 96;
    uint _1257 = uint(int(uint(_1254) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = _1244 * _1196;
    float _1275 = -_1232;
    float _1277 = fma(_1220, _1238, _1275);
    float _1279 = -_1238;
    float _1281 = fma(_1220, _1232, _1279);
    float _1283 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1285 = -_1196;
    float _1287 = _1220 * _1285;
    float _1289 = fma(_1248, _1210, _1273);
    float _1291 = trunc(_1246);
    int _1293 = int(_1291);
    int _1295 = _1240 + 48;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    float _1313 = fma(_1208, _1210, _1287);
    float _1315 = fma(_1281, _1226, _1289);
    float _1317 = fma(_1277, _1210, _1230);
    float _1319 = fma(_1186, _1226, _1313);
    float _1321 = _1315 * _324;
    float _1323 = trunc(_1283);
    int _1325 = int(_1323);
    int _1327 = _1240 + 104;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.vp_c15)._m0[int(_1339)][_1341];
    float _1345 = _1315 * _316;
    float _1347 = fma(_1252, _1226, _1317);
    float _1349 = fma(_1319, _294, _1321);
    float _1351 = fma(_1319, _286, _1345);
    float _1353 = fma(_1347, _336, _1349);
    int _1355 = _1240 + 56;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    int _1373 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1375 = _1293 + _1373;
    int _1377 = _1375 + 1;
    float _1379 = fma(_1347, _328, _1351);
    float _1381 = _392 + _1353;
    bool _1383 = _1377 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1385 = _390 + _1379;
    int _1387 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1389 = _1325 + _1387;
    int _1391 = _1389 + 1;
    int _1393 = _1240 + 64;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    uint _1397 = uint(int(uint(int(_1395)) >> uint(2)));
    int _1399 = int(_1395) & 3;
    float _1401 = (*spvDescriptorSet0.vp_c15)._m0[int(_1397)][_1399];
    int _1403 = int(_1395) + 1;
    uint _1405 = uint(int(uint(_1403) >> uint(2)));
    int _1407 = _1403 & 3;
    float _1409 = (*spvDescriptorSet0.vp_c15)._m0[int(_1405)][_1407];
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1413 = _1381 + _1411;
    int _1415 = _1377 | _1391;
    float _1417 = _1413 * _1413;
    bool _1419 = _1415 < 0;
    bool _1421 = _1419 || _1383;
    int _1423 = _1240 + 72;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1385 + _1441;
    bool _1445 = _1391 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1447 = _1445 || _1421;
    float _1449 = fma(_1443, _1443, _1417);
    int _1451 = _1240 + 80;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    uint _1455 = uint(int(uint(int(_1453)) >> uint(2)));
    int _1457 = int(_1453) & 3;
    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[int(_1455)][_1457];
    int _1461 = int(_1453) + 1;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    int _1465 = _1461 & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    float _1469 = sqrt(_1449);
    float _1471 = _1176 * _1271;
    float _1473 = fma(_390, _1263, _1471);
    float _1475 = _1176 * _1311;
    int _1477 = _1377;
    int _1479 = as_type<int>(_1311);
    float _1481 = _1381;
    float _1483 = _1413;
    float _1485 = _1385;
    if (!_1447)
    {
        int _1487 = _1391 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1489 = _1487 + _1377;
        _1477 = _1489;
    }
    int _1491 = _1477;
    float _1493 = fma(_390, _1303, _1475);
    if (!_1447)
    {
        int _1495 = _1491 << 2;
        _1479 = _1495;
    }
    int _1497 = _1479;
    float _1499 = fma(_392, _1335, _1473);
    bool _1501 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1499 + _1343;
    float _1505 = fma(_392, _1363, _1493);
    float _1507 = _1315 * _320;
    float _1509 = 1.0 / _1503;
    float _1511 = _1505 + _1371;
    float _1513 = fma(_1319, _290, _1507);
    int _1515 = as_type<int>(_1507);
    float _1517 = as_type<float>(_1497);
    if (!_1447)
    {
        int _1519 = 12 & _1497;
        _1515 = _1519;
    }
    int _1521 = _1515;
    float _1523 = _1176 * _1409;
    float _1525 = fma(_1347, _332, _1513);
    float _1527 = fma(_390, _1401, _1523);
    int _1529 = as_type<int>(_1523);
    float _1531 = as_type<float>(_1521);
    if (!_1447)
    {
        uint _1533 = uint(int(uint(_1491) >> uint(2)));
        _1529 = int(_1533);
    }
    int _1535 = _1529;
    float _1537 = _1401;
    int _1539 = _1535;
    if (!_1447)
    {
        float _1541 = floor(_1246);
        _1537 = _1541;
    }
    float _1543 = _1537;
    float _1545 = _820 + _1525;
    float _1547 = fma(_392, _1431, _1527);
    float _1549 = _1467;
    if (!_1447)
    {
        int _1551 = _1535 << 4;
        int _1553 = _1551 + _1521;
        _1539 = _1553;
    }
    int _1555 = _1539;
    if (!_1501)
    {
        _1531 = _1385;
    }
    float _1557 = _1531;
    float _1559 = _1547 + _1439;
    float _1561 = _1557;
    if (!_1501)
    {
        _1517 = _1545;
    }
    float _1563 = _1517;
    bool _1565 = !_1501;
    float _1567 = _1563;
    if (!_1565)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1573 = _1469 + _1571;
        float _1575 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = rsqrt(_1449);
        float _1579 = _1573 * _1569;
        float _1581 = _1579 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        float _1587 = _1581 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = fma(_1585, _1575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1593 = _1577 * _1591;
        float _1595 = _1589 + (-1.0);
        float _1597 = fma(_1443, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = fma(_1413, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = fma(_1545, _1589, _1601);
        _1481 = _1599;
        _1561 = _1597;
        _1567 = _1603;
    }
    float _1605 = _1481;
    float _1607 = _1561;
    float _1609 = _1567;
    float _1611 = _1609;
    float _1613 = _1607;
    if (_1118)
    {
        _1483 = _1605;
    }
    float _1615 = _1483;
    float _1617 = _1615;
    if (!_1118)
    {
        float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1621 = _820 + _1619;
        float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1625 = _390 + _1623;
        float _1627 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = -_390;
        float _1631 = _1629 + _1607;
        float _1633 = _1621 * _1621;
        float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1637 = _392 + _1635;
        float _1639 = fma(_1625, _1625, _1633);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = fma(_1637, _1637, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1649 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1651 = _1649 * _1641;
        float _1653 = -_820;
        float _1655 = _1653 + _1609;
        float _1657 = _1647 * _1651;
        float _1659 = -_392;
        float _1661 = _1659 + _1605;
        float _1663 = fma(_1655, _1657, _820);
        float _1665 = fma(_1631, _1657, _390);
        float _1667 = fma(_1661, _1657, _392);
        _1611 = _1663;
        _1613 = _1665;
        _1617 = _1667;
    }
    float _1669 = _1611;
    float _1671 = _1613;
    float _1673 = _1617;
    float _1675 = _1431;
    if (!_1447)
    {
        int _1677 = _1555 + 400;
        uint _1679 = uint(int(uint(_1677) >> uint(2)));
        uint _1681 = uint(int(uint(int(_1679)) >> uint(2)));
        int _1683 = int(_1679) & 3;
        float _1685 = (*spvDescriptorSet0.vp_c15)._m0[int(_1681)][_1683];
        _1675 = _1685;
    }
    float _1687 = _1675;
    float _1689 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1691 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1693 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1695 = _1511 * _1509;
    float _1697 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1689);
    float _1699 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1691);
    float _1701 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1693);
    int _1703 = _1240 + 88;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    uint _1707 = uint(int(uint(int(_1705)) >> uint(2)));
    int _1709 = int(_1705) & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = int(_1705) + 1;
    uint _1715 = uint(int(uint(_1713) >> uint(2)));
    int _1717 = _1713 & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    float _1721 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1697);
    bool _1723 = _1695 >= 0.0;
    float _1725 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1699);
    float _1727 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1701);
    float _1729 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1731 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1733 = _1559 * _1509;
    bool _1735 = _1695 <= 1.0;
    bool _1737 = _1735 && _1723;
    float _1739 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1741 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1743 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1729);
    float _1745 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1747 = _1733 >= 0.0;
    bool _1749 = _1747 && _1737;
    float _1751 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1753 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1755 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1745);
    bool _1759 = _1733 <= 1.0;
    bool _1761 = _1759 && _1749;
    float _1763 = -_1753;
    float _1765 = fma(_1763, _1751, 1.0);
    float _1767 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1769 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1757);
    float _1771 = _1525;
    if (!_1447)
    {
        float _1773 = floor(_1283);
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1779 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1769);
    float _1783 = _1176 * _1467;
    float _1785 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1779);
    float _1787 = _1779;
    if (!_1447)
    {
        float _1789 = -_1543;
        float _1791 = _1246 + _1789;
        _1787 = _1791;
    }
    float _1793 = _1787;
    float _1795 = log2(_1765);
    if (_1761)
    {
        float _1797 = float(_1200);
        _1549 = _1797;
    }
    float _1799 = _1549;
    float _1801 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1777);
    float _1803 = fma(_390, _1459, _1783);
    float _1805 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1785);
    float _1807 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1809 = 1.0 / _1781;
    float _1811 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1805);
    float _1813 = _1775;
    if (!_1447)
    {
        float _1815 = -_1775;
        float _1817 = _1283 + _1815;
        _1813 = _1817;
    }
    float _1819 = _1813;
    float _1821 = _1783;
    if (_1761)
    {
        float _1823 = rint(_1799);
        float _1825 = precise::max(_1823, 0.0);
        uint _1827 = uint(_1825);
        uint _1829 = clamp(_1827, 0u, 65535u);
        _1821 = as_type<float>(_1829);
    }
    float _1831 = _1821;
    float _1833 = _1795 * 0.693147182464599609375;
    float _1835 = fma(_392, _1711, _1803);
    float _1837 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1807);
    float _1839 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1841 = _1835 + _1719;
    float _1843 = _1687;
    float _1845 = _1837;
    if (!_1447)
    {
        float _1847 = rint(_1687);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1843 = as_type<float>(_1853);
    }
    float _1855 = _1843;
    float _1857 = _1837 * _1809;
    float _1859 = _1811 * _1809;
    float _1861 = _1841 * _1509;
    float _1863 = fma(_1857, 0.5, 0.5);
    float _1865 = fma(_1859, -0.5, 0.5);
    float _1867 = _1543;
    if (_1761)
    {
        float3 _5791 = float3(_1695, _1733, float(as_type<int>(_1831)));
        float3 _5795 = select(_5791, float3(0.0), isnan(_5791));
        float _1869 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5795.xy, uint(rint(_5795.z)), _1861, level(0.0));
        _1867 = _1869;
    }
    float _1871 = _1867;
    float3 _5805 = float3(_1863, _1865, _1839);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5805, float3(0.0), isnan(_5805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5805, float3(0.0), isnan(_5805)), level(0.0)).x;
    float3 _5814 = float3(_1863, _1865, _1839);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5814, float3(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5814, float3(0.0), isnan(_5814)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = _1246;
    if (!_1447)
    {
        float3 _5837 = float3(_1793, _1819, float(as_type<int>(_1855)));
        float3 _5839 = select(_5837, float3(0.0), isnan(_5837));
        float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5839.xy, uint(rint(_5839.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5839.xy, uint(rint(_5839.z)), level(0.0)).x;
        _1886 = _1888;
    }
    float _1890 = _1886;
    if (_1447)
    {
        _1485 = 1.0;
    }
    float _1892 = _1485;
    float _1894 = _1892;
    if (!_1447)
    {
        int _1896 = _1491 << 4;
        int _1898 = _1896 + 2048;
        uint _1900 = uint(int(uint(_1898) >> uint(2)));
        uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
        int _1904 = int(_1900) & 3;
        float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
        int _1908 = int(_1900) + 1;
        uint _1910 = uint(int(uint(_1908) >> uint(2)));
        int _1912 = _1908 & 3;
        float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
        int _1916 = _1898 + 8;
        uint _1918 = uint(int(uint(_1916) >> uint(2)));
        uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
        int _1922 = int(_1918) & 3;
        float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
        int _1926 = int(_1918) + 1;
        uint _1928 = uint(int(uint(_1926) >> uint(2)));
        int _1930 = _1926 & 3;
        float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
        float _1934 = _1176 * _1914;
        float _1936 = fma(_390, _1906, _1934);
        float _1938 = fma(_392, _1924, _1936);
        float _1940 = _1938 + _1932;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        float _1944 = -_1942;
        float _1946 = _1944 + _1890;
        float _1948 = fma(_1946, 500.0, 1.5);
        float _1950 = exp2(_1948);
        float _1952 = 0.0 + _1950;
        float _1954 = precise::clamp(_1952, 0.0, 1.0);
        _1190 = _1934;
        _1894 = _1954;
    }
    float _1956 = _1190;
    float _1958 = _1894;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1962 = _1669 + _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1966 = _1671 + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1970 = _1673 + _1968;
    float _1972 = _1962 * _1962;
    float _1974 = fma(_1966, _1966, _1972);
    float _1976 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1978 = fma(_1970, _1970, _1974);
    float _1980 = precise::max(0.0, _1976);
    float _1982 = rsqrt(_1978);
    float _1984 = sqrt(_1978);
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1988 = _1966 * _1986;
    float _1990 = _1970 * _1986;
    float _1992 = -_1986;
    float _1994 = -_1980;
    float _1996 = fma(_1962, _1992, _1994);
    float _1998 = _1988 * _1988;
    float _2000 = _1990 * _1990;
    float _2002 = _1998 + _2000;
    float _2004 = sqrt(_2002);
    bool _2006 = _2004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2010 = _2004 + _2008;
    float _2012 = _1956;
    float _2014 = _1962;
    float _2016 = _2010;
    float _2018 = _1980;
    float _2020 = _1988;
    float _2022 = _1990;
    float _2024 = _1998;
    float _2026 = _2000;
    if (_2006)
    {
        float _2028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2012 = _2028;
    }
    float _2030 = _2012;
    if (_2006)
    {
        float _2032 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2014 = _2032;
    }
    float _2034 = _2014;
    float _2036 = _2030;
    float _2038 = _2034;
    if (_2006)
    {
        float _2040 = _2010 * _2030;
        _2016 = _2040;
    }
    float _2042 = _2016;
    if (_2006)
    {
        float _2044 = rsqrt(_2002);
        _2036 = _2044;
    }
    float _2046 = _2036;
    float _2048 = _2046;
    if (_2006)
    {
        float _2050 = _2042 * 0.15915493667125701904296875;
        _616 = _2050;
    }
    float _2052 = _616;
    float _2054 = _392;
    if (_2006)
    {
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = _2042;
    if (_2006)
    {
        float _2064 = _2052 * 6.283185482025146484375;
        float _2066 = cos(_2064);
        _2062 = _2066;
    }
    float _2068 = _2062;
    float _2070 = _2060;
    if (_2006)
    {
        float _2072 = fma(_2060, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = _2074;
    if (!_2006)
    {
        _2038 = _1996;
    }
    float _2078 = _2038;
    float _2080 = _2078;
    if (_2006)
    {
        float _2082 = _2046 * _2074;
        _2076 = _2082;
    }
    float _2084 = _2076;
    if (_2006)
    {
        float _2086 = _2068 + (-1.0);
        _2018 = _2086;
    }
    float _2088 = _2018;
    if (_2006)
    {
        float _2090 = _1988 * _2084;
        _2020 = _2090;
    }
    float _2092 = _2020;
    if (_2006)
    {
        float _2094 = _1990 * _2084;
        _2022 = _2094;
    }
    float _2096 = _2022;
    if (_2006)
    {
        float _2098 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2048 = _2098;
    }
    float _2100 = _2048;
    if (_2006)
    {
        float _2102 = _2092 * _2092;
        _2024 = _2102;
    }
    float _2104 = _2024;
    if (_2006)
    {
        float _2106 = _2096 * _2096;
        _2026 = _2106;
    }
    float _2108 = _2026;
    if (_2006)
    {
        float _2110 = fma(_1996, _2068, _2100);
        _2080 = _2110;
    }
    float _2112 = _2080;
    float _2114 = fma(_2112, _2112, _2104);
    float _2116 = _2114 + _2108;
    float _2118 = rsqrt(_2116);
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2122 = fma(_1984, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2120);
    float _2124 = precise::clamp(_2122, 0.0, 1.0);
    float _2126 = -_2124;
    float _2128 = _2126 + 1.0;
    float _2130 = _2118 * _2092;
    float _2132 = _2118 * _2112;
    float _2134 = _2118 * _2096;
    float _2136 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2138 = abs(_2128);
    float _2140 = log2(_2138);
    float _2142 = -_2136;
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2142);
    float _2146 = -_2134;
    float _2148 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2144);
    float _2150 = _2132 + 1.0;
    float _2152 = fma(_2148, -0.5, 0.5);
    float _2154 = fma(_2148, 0.5, 0.5);
    float _2156 = fma(_2154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2158 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2160 = sqrt(_2152);
    float _2162 = fma(_2154, _2156, -0.212114393711090087890625);
    float _2164 = fma(_2154, _2162, 1.570728778839111328125);
    float _2166 = exp2(_2158);
    float _2168 = _2160 * 0.636619746685028076171875;
    float _2170 = -_2164;
    float _2172 = fma(_2168, _2170, 1.0);
    float _2174 = -_2132;
    float _2176 = fma(_2166, _2150, _2174);
    float _2178 = fma(_2176, 0.5, 0.5);
    float2 _6287 = float2(_2172, _2178);
    float3 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6287, float2(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6287, float2(0.0), isnan(_6287)), level(0.0)).xyz;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = in.m_69.w;
    float _2192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2194 = _424 > 0.5;
    float _2196 = in.m_77.y;
    int _2198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2200 = _2198 != 0;
    float _2202 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2206 = _2204 != 0;
    float _2208 = in.m_77.x;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2212 = _2210 != 0;
    float _2214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2218 = _2216 != 0;
    float _2220 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2202);
    float _2222 = -_410;
    float _2224 = _2222 + 1.0;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2234 = _2190 > 0.5;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = -_2196;
    float _2242 = _2240 + 1.0;
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2246 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2248 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2250 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2252 = _2234 ? as_type<int>(_2242) : as_type<int>(_2196);
    int _2254 = 0;
    bool _2256 = _2234;
    float _2258 = _2196;
    bool _2260 = _2218;
    float _2262 = _2208;
    float _2264 = _2236;
    float _2266 = _2238;
    if (_2206)
    {
        float _2268 = -_2208;
        float _2270 = _2268 + 1.0;
        _2254 = as_type<int>(_2270);
    }
    int _2272 = _2254;
    float _2274 = as_type<float>(_2272);
    if (_2206)
    {
        bool _2276 = _442 > 0.5;
        _2256 = _2276;
    }
    bool _2278 = _2256;
    float _2280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2282 = _2218 ? as_type<float>(_2252) : _2196;
    out.m_79.x = _2246;
    out.m_79.y = _2248;
    out.m_79.z = _2250;
    out.m_79.w = _2244;
    if (_2200)
    {
        float _2284 = _2194 ? _2242 : _2196;
        _2258 = _2284;
    }
    float _2286 = _2258;
    int _2288 = 0;
    if (_2212)
    {
        float _2290 = -_2208;
        float _2292 = _2290 + 1.0;
        _2288 = as_type<int>(_2292);
    }
    int _2294 = _2288;
    float _2296 = as_type<float>(_2294);
    if (_2212)
    {
        bool _2298 = _416 > 0.5;
        _2260 = _2298;
    }
    bool _2300 = _2260;
    float _2302 = in.m_81.x;
    float _2304 = in.m_81.y;
    float _2306 = in.m_81.z;
    bool _2308 = _1104 != 0.0;
    bool _2310 = isnan(_1104);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2320 = in.m_83.x;
    float _2322 = in.m_83.y;
    float _2324 = in.m_83.z;
    float _2326 = in.m_83.w;
    bool _2328 = _1102 == 0.0;
    bool _2330 = !_2316;
    bool _2332 = _2328 && _2330;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2336 = 0.0;
    if (!_2206)
    {
        _2336 = _2208;
    }
    float _2338 = _2336;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2342 = _1106 == 0.0;
    bool _2344 = _2342 && _2332;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _2338;
    if (_2206)
    {
        float _2350 = _2278 ? as_type<float>(_2272) : _2208;
        _2348 = _2350;
    }
    float _2352 = _2348;
    float _2354 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2354;
    if (_2212)
    {
        float _2358 = _2300 ? as_type<float>(_2294) : _2208;
        _2262 = _2358;
    }
    float _2360 = _2262;
    out.m_85.x = _2346;
    out.m_85.y = _2354;
    out.m_85.z = _2238;
    out.m_85.w = _2236;
    float _2362 = 0.0;
    if (_2344)
    {
        _2362 = _2304;
    }
    float _2364 = _2362;
    float _2366 = _2364;
    if (_2344)
    {
        _2296 = _2306;
    }
    float _2368 = _2296;
    float _2370 = abs(_1144);
    float _2372 = log2(_2370);
    float _2374 = _2368;
    if (_2344)
    {
        _2356 = _2302;
    }
    float _2376 = _2356;
    float _2378 = _2376;
    if (_2344)
    {
        _2264 = _2364;
    }
    float _2380 = _2264;
    float _2382 = _2380;
    if (_2344)
    {
        _2274 = _2376;
    }
    float _2384 = _2274;
    float _2386 = _2384;
    if (!_2344)
    {
        _2378 = _2302;
    }
    float _2388 = _2378;
    float _2390 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2344)
    {
        _2366 = _2304;
    }
    float _2392 = _2366;
    float _2394 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2344)
    {
        _2266 = _2368;
    }
    float _2396 = _2266;
    float _2398 = _2396;
    if (!_2344)
    {
        float _2400 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2388);
        _2386 = _2400;
    }
    float _2402 = _2386;
    if (!_2344)
    {
        _2374 = _2306;
    }
    float _2404 = _2374;
    if (!_2344)
    {
        float _2406 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2392);
        _2382 = _2406;
    }
    float _2408 = _2382;
    float _2410 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2412 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2414 = _2394 * _2192;
    float _2416 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2418 = _2390 * _2214;
    float _2420 = _2410 * _2280;
    float _2422 = _2324 * _2388;
    float _2424 = exp2(_2412);
    float _2426 = _2322 * _2404;
    float _2428 = _2320 * _2392;
    if (!_2344)
    {
        float _2430 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2404);
        _2398 = _2430;
    }
    float _2432 = _2398;
    float _2434 = -_2422;
    float _2436 = fma(_2320, _2404, _2434);
    float _2438 = -_2426;
    float _2440 = fma(_2324, _2392, _2438);
    float _2442 = -_2428;
    float _2444 = fma(_2322, _2388, _2442);
    float _2446 = _2436 * _2326;
    float _2448 = _2416 * _2318;
    float _2450 = _2440 * _2326;
    float _2452 = _2444 * _2326;
    float _2454 = -_2408;
    float _2456 = _1220 * _2454;
    float _2458 = -_2322;
    float _2460 = _1220 * _2458;
    float _2462 = -_2446;
    float _2464 = _1220 * _2462;
    float _2466 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    out.m_87.x = _2420;
    out.m_87.y = _2418;
    out.m_87.z = _2448;
    out.m_87.w = _2414;
    float _2470 = fma(_1208, _2402, _2456);
    float _2472 = fma(_1208, _2450, _2464);
    bool _2474 = _1144 <= 8000.0;
    bool _2476 = isnan(_1144);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(8000.0);
    bool _2482 = _2478 || _2480;
    float _2484 = float(_2482);
    float _2486 = fma(_1208, _2320, _2460);
    float _2488 = fma(_2468, -2.0, 3.0);
    float _2490 = _2468 * _2468;
    float _2492 = fma(_1186, _2432, _2470);
    float _2494 = fma(_1186, _2324, _2486);
    float _2496 = fma(_1186, _2452, _2472);
    float _2498 = _2490 * _2488;
    float _2500 = _1244 * _2322;
    float _2502 = _1244 * _2408;
    float _2504 = _1224 * _2408;
    float _2506 = _1244 * _2446;
    float _2508 = _1224 * _2322;
    float _2510 = _1224 * _2446;
    float _2512 = fma(_1248, _2320, _2500);
    float _2514 = fma(_1248, _2402, _2502);
    float _2516 = fma(_1248, _2450, _2506);
    float _2518 = fma(_1277, _2402, _2504);
    float _2520 = fma(_1277, _2320, _2508);
    float _2522 = fma(_1277, _2450, _2510);
    float _2524 = fma(_1281, _2324, _2512);
    float _2526 = fma(_1281, _2432, _2514);
    float _2528 = fma(_1281, _2452, _2516);
    float _2530 = fma(_1252, _2432, _2518);
    float _2532 = fma(_1252, _2324, _2520);
    float _2534 = fma(_1252, _2452, _2522);
    float _2536 = _2524 * _316;
    float _2538 = _2524 * _320;
    float _2540 = _2526 * _324;
    float _2542 = _2524 * _324;
    float _2544 = _2528 * _324;
    float _2546 = _2526 * _316;
    float _2548 = fma(_2492, _294, _2540);
    float _2550 = fma(_2494, _294, _2542);
    float _2552 = fma(_2496, _294, _2544);
    float _2554 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2220);
    float _2556 = _2528 * _316;
    float _2558 = _2528 * _320;
    float _2560 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2562 = _2526 * _320;
    float _2564 = fma(_2494, _286, _2536);
    float _2566 = fma(_2494, _290, _2538);
    float _2568 = fma(_2496, _286, _2556);
    float _2570 = fma(_2496, _290, _2558);
    float _2572 = fma(_2492, _286, _2546);
    float _2574 = exp2(_2560);
    float _2576 = fma(_2532, _328, _2564);
    float _2578 = fma(_2532, _332, _2566);
    float _2580 = fma(_2534, _328, _2568);
    float _2582 = fma(_2534, _332, _2570);
    float _2584 = fma(_2532, _336, _2550);
    float _2586 = fma(_2534, _336, _2552);
    float _2588 = fma(_2530, _336, _2548);
    float _2590 = -_2498;
    float _2592 = _2590 + 1.0;
    float _2594 = fma(_2492, _290, _2562);
    out.m_89.x = _2576;
    out.m_89.y = _2578;
    out.m_89.z = _2584;
    float _2596 = fma(_2530, _328, _2572);
    float _2598 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2498);
    float _2600 = fma(_2530, _332, _2594);
    float _2602 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2554);
    float _2604 = _2484 * _2598;
    float _2606 = -_2574;
    float _2608 = _2606 + 1.0;
    if (!_1761)
    {
        _1845 = 1.0;
    }
    float _2610 = _1845;
    float _2612 = _2602 + _1781;
    float _2614 = _2610;
    if (_1761)
    {
        bool _2616 = _1871 >= _1861;
        bool _2618 = isnan(_1871);
        bool _2620 = _2616 || _2618;
        bool _2622 = isnan(_1861);
        bool _2624 = _2620 || _2622;
        float _2626 = float(_2624);
        _2614 = _2626;
    }
    float _2628 = _2614;
    float _2630 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2632 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2634 = _2612 * 0.5;
    float _2636 = _2628 * _1958;
    float _2638 = _2224 * _2632;
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2630 * _1873;
    float _2644 = -_2630;
    float _2646 = _2644 + 1.0;
    float _2648 = -_2640;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = _1884 * _2642;
    float _2654 = _1884 * _2646;
    out.m_91.x = _2580;
    out.m_91.y = _2582;
    out.m_91.z = _2586;
    float _2656 = -_2636;
    float _2658 = fma(_2656, _2650, 1.0);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    bool _2662 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2664 = isnan(_1984);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2670 = _2666 || _2668;
    out.m_93.x = 1.0;
    out.m_93.y = 1.0;
    out.m_93.z = 1.0;
    float _2672 = _2660 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1837;
    out.gl_Position.y = _1811;
    out.gl_Position.z = _2602;
    out.gl_Position.w = _1781;
    out.m_95.x = _2672;
    float _2674 = _2646;
    float _2676 = _2636;
    float _2678 = _2660;
    float _2680 = _2634;
    float _2682 = _2642;
    float _2684 = _2652;
    if (!_2670)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2686 = _2674;
    out.m_97.x = _2596;
    out.m_97.y = _2600;
    out.m_97.z = _2588;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2670)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2692 = _2676;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2670)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2698 = _2678;
    out.m_99.z = _2634;
    out.m_99.w = _1781;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2670)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2704 = _2680;
    float _2706 = _2188 * _2642;
    float _2708 = fma(_2184, _2652, _1878);
    float _2710 = fma(_2186, _2652, _1880);
    float _2712 = _2704;
    float _2714 = _2704;
    if (!_2670)
    {
        _2682 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2682;
    float _2718 = fma(_1884, _2706, _1882);
    float _2720 = _2716;
    float _2722 = _2716;
    if (!_2670)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2684;
    out.m_101.x = _2708;
    out.m_101.y = _2710;
    out.m_101.z = _2718;
    out.m_101.w = _2654;
    bool _2726 = !_2670;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2726)
    {
        bool _2732 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2734 = isnan(_1984);
        bool _2736 = _2732 || _2734;
        bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2740 = _2736 || _2738;
        if (!_2740)
        {
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2744 = _1984 + _2742;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2746;
            float _2750 = 1.0 / _2748;
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2772 = _2744 * _2750;
            float _2774 = precise::clamp(_2772, 0.0, 1.0);
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2780 = fma(_2774, _2754, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2714 = _2780;
            _2730 = _2788;
            _2722 = _2782;
            _2696 = _2786;
            _2690 = _2784;
            _2702 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2796 = isnan(_1984);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2804 = _2720;
            _2722 = _2804;
            if (!_2802)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2806 = _2712;
            _2714 = _2806;
            if (!_2802)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2808 = _2688;
            _2690 = _2808;
            if (!_2802)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2810 = _2694;
            _2696 = _2810;
            if (!_2802)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2812 = _2728;
            _2730 = _2812;
            if (!_2802)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2814 = _2700;
            bool _2816 = !_2802;
            _2702 = _2814;
            if (!_2816)
            {
                bool _2818 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2820 = isnan(_1984);
                bool _2822 = _2818 || _2820;
                bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2826 = _2822 || _2824;
                if (!_2826)
                {
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2830 = _1984 + _2828;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2832;
                    float _2836 = 1.0 / _2834;
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2858 = _2830 * _2836;
                    float _2860 = precise::clamp(_2858, 0.0, 1.0);
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2866 = fma(_2860, _2840, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2868 = fma(_2860, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2870 = fma(_2860, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2872 = fma(_2860, _2848, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2874 = fma(_2860, _2852, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2876 = fma(_2860, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2714 = _2866;
                    _2730 = _2874;
                    _2722 = _2868;
                    _2696 = _2872;
                    _2690 = _2870;
                    _2702 = _2876;
                    _2792 = true;
                }
                else
                {
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2792 = false;
    float _2878 = _2714;
    float _2880 = _2730;
    float _2882 = _2722;
    float _2884 = _2696;
    float _2886 = _2690;
    float _2888 = _2702;
    float _2890 = fma(_2600, -0.5, 0.5);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -_2878;
    float _2896 = _2894 + _2880;
    float _2898 = -_2882;
    float _2900 = _2898 + _2884;
    float _2902 = -_2886;
    float _2904 = _2902 + _2888;
    bool _2906 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2908 = fma(_2892, _2896, _2878);
    float _2910 = fma(_2892, _2900, _2882);
    float _2912 = fma(_2892, _2904, _2886);
    float _2914 = _2908 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2916 = fma(_2910, 0.298911988735198974609375, _2914);
    float _2918 = fma(_2912, 0.114477999508380889892578125, _2916);
    out.m_103.x = 0.0;
    float _2920 = -_2918;
    float _2922 = _2910 + _2920;
    float _2924 = -_2918;
    float _2926 = _2908 + _2924;
    float _2928 = -_2918;
    float _2930 = _2912 + _2928;
    float _2932 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2934 = fma(_2922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    float _2936 = fma(_2926, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    float _2938 = fma(_2930, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    out.m_95.w = _2932;
    out.m_105.x = _2934;
    out.m_105.y = _2936;
    out.m_105.z = _2938;
    if (!_2906)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2940 = -_1669;
    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2944 = -_1671;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2948 = -_1673;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2952 = _2942 * _2942;
    float _2954 = fma(_2946, _2946, _2952);
    float _2956 = fma(_2950, _2950, _2954);
    float _2958 = sqrt(_2956);
    float _2960 = rsqrt(_2956);
    float _2962 = -_2958;
    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = _2946 * _2960;
    float _2972 = _2942 * _2960;
    float _2974 = abs(_2968);
    float _2976 = log2(_2974);
    float _2978 = _2950 * _2960;
    float _2980 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2982 = _2600 * _2972;
    float _2984 = -_2972;
    float _2986 = -_2980;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2986);
    float _2990 = fma(_2596, _2970, _2982);
    float _2992 = -_2978;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2988);
    float _2996 = fma(_2588, _2978, _2990);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3002 = _2994 + _3000;
    float _3004 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3008 = precise::clamp(_3006, 0.0, 1.0);
    float _3010 = exp2(_3004);
    float _3012 = _3010 * _3008;
    float _3014 = _2998 * _3012;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _3016;
    out.m_103.y = _3018;
    out.m_103.z = _3020;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2792 = false;
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
    float _134 = _132;
    if (!_128)
    {
        out.m_59.x = 0.0;
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
        float _3077 = as_type<float>(_140);
        out.gl_Position.z = _3077;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3147 = as_type<float>(_178);
        out.gl_Position.z = _3147;
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
    float _226 = _218;
    float _228 = _216;
    if (_222)
    {
        float _230 = rsqrt(_210);
        _226 = _230;
    }
    float _232 = _226;
    float _234 = 0.0;
    if (!_222)
    {
        _234 = 0.0;
    }
    float _236 = _234;
    bool _238 = _220 > 0.0;
    float _240 = 0.0;
    float _242 = _236;
    if (!_222)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (!_222)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = 0.0;
    float _254 = _250;
    if (_224)
    {
        float _256 = rsqrt(_212);
        _252 = _256;
    }
    float _258 = _252;
    float _260 = 0.0;
    if (!_224)
    {
        _260 = 0.0;
    }
    float _262 = _260;
    float _264 = 0.0;
    float _266 = _262;
    if (!_224)
    {
        _264 = 0.0;
    }
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    if (!_224)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _220;
    float _278 = _274;
    if (_238)
    {
        float _280 = rsqrt(_214);
        _276 = _280;
    }
    float _282 = _276;
    if (_222)
    {
        float _284 = _232 * _186;
        _242 = _284;
    }
    float _286 = _242;
    if (_222)
    {
        float _288 = _232 * _180;
        _248 = _288;
    }
    float _290 = _248;
    if (_222)
    {
        float _292 = _232 * _192;
        _254 = _292;
    }
    float _294 = _254;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _298 = 0.0;
    if (!_238)
    {
        _228 = 0.0;
        _298 = 0.0;
    }
    float _300 = _228;
    float _302 = _298;
    float _304 = 0.0;
    float _306 = _302;
    float _308 = _300;
    if (!_238)
    {
        _304 = 0.0;
    }
    float _310 = _304;
    float _312 = _310;
    if (_224)
    {
        float _314 = _258 * _188;
        _266 = _314;
    }
    float _316 = _266;
    if (_224)
    {
        float _318 = _258 * _182;
        _272 = _318;
    }
    float _320 = _272;
    if (_224)
    {
        float _322 = _258 * _194;
        _278 = _322;
    }
    float _324 = _278;
    if (_238)
    {
        float _326 = _282 * _190;
        _312 = _326;
    }
    float _328 = _312;
    if (_238)
    {
        float _330 = _282 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_238)
    {
        float _334 = _282 * _196;
        _308 = _334;
    }
    float _336 = _308;
    bool _338 = !_296;
    float _356;
    if (!_338)
    {
        float _340 = in.m_69.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
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
        float _364 = _158 * _362;
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
    float2 _3477 = float2(_404, _408);
    float _410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3477, float2(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3477, float2(0.0), isnan(_3477)), level(0.0)).x;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    float _416 = in.m_69.z;
    float _418 = _182 * _370;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _366 + _420;
    float _424 = in.m_69.y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _442 = in.m_69.x;
    float _444 = 1.0 / _428;
    float _446 = fma(_180, _368, _418);
    float _448 = _414 * _158;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _456 = _366 + _454;
    float _458 = fma(_184, _372, _446);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _462 = _366 + _460;
    float _464 = 1.0 / _432;
    float _466 = in.m_63.w;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _478 = _476 != 0;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _482 = _366 + _480;
    bool _484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _492 = _488 || _490;
    float _494 = 1.0 / _436;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = _482 * _444;
    float _502 = _424 + _416;
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = _416 * 2.0;
    float _516 = _442 * 2.0;
    float _518 = _502 + (-1.0);
    float _520 = 1.0 / _440;
    float _522 = _422 * _464;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _526 = _366 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = exp2(_448);
    float _538 = _456 * _494;
    float _540 = fma(_534, _522, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = fma(_530, _500, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _544;
    float _548 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _550 = 1.0 / _452;
    float _552 = _526 * _520;
    float _554 = _424 * 2.0;
    float _556 = _442 + _424;
    float _558 = fma(_546, _538, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _560 = !_478;
    int _562 = _560 ? 0 : 1;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = _556 + (-1.0);
    float _570 = 1.0 / _498;
    float _572 = -_536;
    float _574 = _572 + 1.0;
    bool _576 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _578 = isnan(_366);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _512 ? _574 : 0.0;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _592 = _462 * _550;
    float _594 = _442 + _416;
    float _596 = floor(_554);
    bool _598 = !_474;
    int _600 = _598 ? 0 : 1;
    float _602 = _594 + (-1.0);
    bool _604 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _606 = isnan(_366);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _390;
    if (_492)
    {
        float _618 = _588 * _570;
        _160 = _618;
    }
    float _620 = _160;
    float _622 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _624 = floor(_514);
    bool _626 = !_470;
    int _628 = _626 ? 0 : 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _646 = floor(_516);
    float _648 = fma(_636, _522, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = fma(_632, _500, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _652 = fma(_644, _522, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _654 = fma(_640, _500, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _656;
    bool _660 = _596 > 0.0;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _662;
    bool _666 = _596 >= 0.0;
    bool _668 = isnan(_596);
    bool _670 = _666 || _668;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    float _676 = fma(_658, _538, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _678 = _624 >= 0.0;
    bool _680 = isnan(_624);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = fma(_664, _538, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _694 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _696 = isnan(_366);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _710 = _646 >= 0.0;
    bool _712 = isnan(_646);
    bool _714 = _710 || _712;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    bool _720 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _722 = isnan(_366);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _742 = _740 != 0;
    float _744 = -_704;
    float _746 = _744 + 1.0;
    bool _748 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _750 = isnan(_366);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_730;
    float _762 = _760 + 1.0;
    bool _764 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _766 = isnan(_366);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = _730 * _746;
    float _778 = fma(_692, _552, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _780 = -_586;
    float _782 = _780 + 1.0;
    int _784 = _718 ? 0 : 1;
    float _786 = -_758;
    float _788 = _786 + 1.0;
    bool _790 = _624 > 0.0;
    float _792 = _774 * _782;
    float _794 = -_774;
    float _796 = _794 + 1.0;
    bool _798 = !_734;
    int _800 = _798 ? 0 : 1;
    float _802 = _586 * _788;
    float _804 = _614 * _796;
    float _806 = -_614;
    float _808 = _806 + 1.0;
    int _810 = abs(_800);
    float _812 = _758 * _762;
    float _814 = _650 * _804;
    float _816 = _542 * _804;
    float _818 = _654 * _804;
    float _820 = _458 + _466;
    float _822 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].x, _814);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _826 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].z, _818);
    int _828 = _686 ? 0 : 1;
    float _830 = fma(_648, _792, _822);
    float _832 = _620 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _834 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _836;
    float _840 = fma(_652, _792, _826);
    int _842 = ~_828;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = fma(_540, _792, _834);
    int _850 = _846;
    if (!_790)
    {
        int _852 = ~_828;
        int _854 = _852 + 1;
        _850 = _854;
    }
    int _856 = _850;
    float _858 = fma(_838, _592, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _860 = !_738;
    int _862 = _860 ? 0 : 1;
    float _864 = fma(_566, _552, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _866 = _674 ? 0 : 1;
    float _868 = _832 * _824;
    bool _870 = _646 > 0.0;
    float _872 = fma(_708, _552, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _874 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _868);
    float _876 = float(_856);
    float _878 = fma(_558, _802, _848);
    bool _880 = !_742;
    int _882 = _880 ? 0 : 1;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _884;
    int _888 = abs(_862);
    float _890 = fma(_676, _802, _830);
    int _892 = ~_866;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = floor(_874);
    int _900 = _896;
    if (!_660)
    {
        int _902 = ~_866;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = _820 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _910 = float(_810);
    float _912 = fma(_886, _592, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _914 = abs(_882);
    float _916 = _874 + 0.25;
    float _918 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _920 = _910 * _876;
    int _922 = ~_784;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = floor(_916);
    float _930 = in.m_71.x;
    float _932 = in.m_71.y;
    float _934 = in.m_71.z;
    float _936 = fma(_688, _802, _840);
    int _938 = _926;
    if (!_870)
    {
        int _940 = ~_784;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _918);
    float _948 = -_898;
    float _950 = _874 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _952;
    float _956 = float(_944);
    float _958 = _874 * 6.283185482025146484375;
    float _960 = float(_888);
    float _962 = fma(_954, _592, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _964 = float(_906);
    float _966 = _820 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _968 = float(_914);
    float _970 = _960 * _956;
    bool _972 = _950 >= 0.5;
    bool _974 = isnan(_950);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.5);
    bool _980 = _976 || _978;
    float _982 = _958 * 0.15915493667125701904296875;
    float _984 = -_928;
    float _986 = _916 + _984;
    float _988 = _968 * _964;
    int _990 = abs(_600);
    float _992 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _966);
    float _994 = _970 * (-2.0);
    float _996 = _982 * 6.283185482025146484375;
    float _998 = sin(_996);
    bool _1000 = _986 > 0.5;
    float _1002 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _992);
    bool _1004 = !_980;
    float _1006 = _1004 ? 0.5 : (-0.5);
    float _1008 = fma(_548, _994, _548);
    float _1010 = fma(_994, _932, _932);
    float _1012 = float(_990);
    float _1014 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = _424 + (-0.5);
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1020 = _1018 * 2.0;
    float _1022 = _946 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1024 = abs(_628);
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1010);
    int _1028 = abs(_562);
    float _1030 = _1022 + _1014;
    float _1032 = 1.0 / _1014;
    float _1034 = _986;
    if (_1000)
    {
        float _1036 = -_986;
        float _1038 = _1036 + 1.0;
        _1034 = _1038;
    }
    float _1040 = _1034;
    float _1042 = _1012 * _1020;
    float _1044 = float(_1024);
    float _1046 = _998 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1048 = fma(_1040, 4.0, -1.0);
    float _1050 = fma(_1044, _1046, _1042);
    float _1052 = float(_1028);
    float _1054 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1056 = _988 * (-2.0);
    float _1058 = fma(_1008, _620, _1026);
    float _1060 = _416 + (-0.5);
    float _1062 = fma(_1052, _1054, _1050);
    float _1064 = fma(_622, _1056, _622);
    float _1066 = in.m_73.x;
    float _1068 = in.m_73.y;
    float _1070 = in.m_73.z;
    float _1072 = _1030 * _1032;
    float _1074 = _1072 * 0.5;
    float _1076 = _1058 * 0.15915493667125701904296875;
    float _1078 = fma(_1062, 3.1415927410125732421875, _930);
    float _1080 = _920 * (-2.0);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1082);
    float _1086 = fma(_1056, _934, _934);
    float _1088 = fma(_778, _812, _890);
    float _1090 = fma(_872, _812, _936);
    float _1092 = 1.0 / _1084;
    float _1094 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1086);
    float _1096 = fma(_858, _776, _1088);
    float _1098 = fma(_590, _1080, _590);
    float _1100 = fma(_962, _776, _1090);
    float _1102 = in.m_75.x;
    float _1104 = in.m_75.y;
    float _1106 = in.m_75.z;
    float _1108 = fma(_864, _812, _878);
    bool _1110 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1112 = isnan(0.5);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1118 = _1114 || _1116;
    float _1120 = _1076 * 6.283185482025146484375;
    float _1122 = sin(_1120);
    float _1124 = fma(_1064, _620, _1094);
    float _1126 = _442 + (-0.5);
    float _1128 = fma(_1078, _1080, _1078);
    float _1130 = fma(_912, _776, _1108);
    float _1132 = _1124 * 0.15915493667125701904296875;
    float _1134 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1128);
    float _1136 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1096);
    float _1138 = _1132 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1144 = _1092 * _1142;
    float _1146 = fma(_1098, _620, _1134);
    float _1148 = _1136 * _1066;
    float _1150 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1100);
    float _1152 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1130);
    float _1154 = _1146 * 0.15915493667125701904296875;
    bool _1156 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1158 = _1150 * _1070;
    float _1160 = _1076 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    bool _1164 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1166 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1170 = _1152 * _1068;
    bool _1172 = !_1156;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = _820 + _1166;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1180 = _1154 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1186 = _1122 * _1140;
    int _1188 = 2;
    float _1190 = _1176;
    if (!_1156)
    {
        _1188 = 1;
    }
    int _1192 = _1188;
    float _1194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1102);
    float _1196 = _1178 * _1184;
    int _1198 = _1192;
    if (!_1164)
    {
        _1198 = _1174;
    }
    int _1200 = _1198;
    float _1202 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1204 = _1154 * 6.283185482025146484375;
    float _1206 = cos(_1204);
    float _1208 = _1162 * _1140;
    float _1210 = _1194 * _1168;
    float _1212 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1106);
    float _1216 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1202);
    float _1218 = _1132 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1182 * _1122;
    float _1224 = _1182 * _1140;
    float _1226 = _1214 * _1212;
    float _1228 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1216);
    float _1230 = _1224 * _1196;
    float _1232 = _1206 * _1122;
    float _1234 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1236 = _1206 * _1162;
    float _1238 = _1182 * _1162;
    int _1240 = _1200 << 6;
    float _1242 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1234);
    float _1244 = _1206 * _1140;
    float _1246 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1248 = fma(_1220, _1236, _1222);
    float _1250 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1242);
    float _1252 = fma(_1220, _1222, _1236);
    int _1254 = _1240 + 96;
    uint _1257 = uint(int(uint(_1254) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = _1244 * _1196;
    float _1275 = -_1232;
    float _1277 = fma(_1220, _1238, _1275);
    float _1279 = -_1238;
    float _1281 = fma(_1220, _1232, _1279);
    float _1283 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1285 = -_1196;
    float _1287 = _1220 * _1285;
    float _1289 = fma(_1248, _1210, _1273);
    float _1291 = trunc(_1246);
    int _1293 = int(_1291);
    int _1295 = _1240 + 48;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    float _1313 = fma(_1208, _1210, _1287);
    float _1315 = fma(_1281, _1226, _1289);
    float _1317 = fma(_1277, _1210, _1230);
    float _1319 = fma(_1186, _1226, _1313);
    float _1321 = _1315 * _324;
    float _1323 = trunc(_1283);
    int _1325 = int(_1323);
    int _1327 = _1240 + 104;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.vp_c15)._m0[int(_1339)][_1341];
    float _1345 = _1315 * _316;
    float _1347 = fma(_1252, _1226, _1317);
    float _1349 = fma(_1319, _294, _1321);
    float _1351 = fma(_1319, _286, _1345);
    float _1353 = fma(_1347, _336, _1349);
    int _1355 = _1240 + 56;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    int _1373 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1375 = _1293 + _1373;
    int _1377 = _1375 + 1;
    float _1379 = fma(_1347, _328, _1351);
    float _1381 = _392 + _1353;
    bool _1383 = _1377 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1385 = _390 + _1379;
    int _1387 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1389 = _1325 + _1387;
    int _1391 = _1389 + 1;
    int _1393 = _1240 + 64;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    uint _1397 = uint(int(uint(int(_1395)) >> uint(2)));
    int _1399 = int(_1395) & 3;
    float _1401 = (*spvDescriptorSet0.vp_c15)._m0[int(_1397)][_1399];
    int _1403 = int(_1395) + 1;
    uint _1405 = uint(int(uint(_1403) >> uint(2)));
    int _1407 = _1403 & 3;
    float _1409 = (*spvDescriptorSet0.vp_c15)._m0[int(_1405)][_1407];
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1413 = _1381 + _1411;
    int _1415 = _1377 | _1391;
    float _1417 = _1413 * _1413;
    bool _1419 = _1415 < 0;
    bool _1421 = _1419 || _1383;
    int _1423 = _1240 + 72;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1385 + _1441;
    bool _1445 = _1391 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1447 = _1445 || _1421;
    float _1449 = fma(_1443, _1443, _1417);
    int _1451 = _1240 + 80;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    uint _1455 = uint(int(uint(int(_1453)) >> uint(2)));
    int _1457 = int(_1453) & 3;
    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[int(_1455)][_1457];
    int _1461 = int(_1453) + 1;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    int _1465 = _1461 & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    float _1469 = sqrt(_1449);
    float _1471 = _1176 * _1271;
    float _1473 = fma(_390, _1263, _1471);
    float _1475 = _1176 * _1311;
    int _1477 = _1377;
    int _1479 = as_type<int>(_1311);
    float _1481 = _1381;
    float _1483 = _1413;
    float _1485 = _1385;
    if (!_1447)
    {
        int _1487 = _1391 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1489 = _1487 + _1377;
        _1477 = _1489;
    }
    int _1491 = _1477;
    float _1493 = fma(_390, _1303, _1475);
    if (!_1447)
    {
        int _1495 = _1491 << 2;
        _1479 = _1495;
    }
    int _1497 = _1479;
    float _1499 = fma(_392, _1335, _1473);
    bool _1501 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1499 + _1343;
    float _1505 = fma(_392, _1363, _1493);
    float _1507 = _1315 * _320;
    float _1509 = 1.0 / _1503;
    float _1511 = _1505 + _1371;
    float _1513 = fma(_1319, _290, _1507);
    int _1515 = as_type<int>(_1507);
    float _1517 = as_type<float>(_1497);
    if (!_1447)
    {
        int _1519 = 12 & _1497;
        _1515 = _1519;
    }
    int _1521 = _1515;
    float _1523 = _1176 * _1409;
    float _1525 = fma(_1347, _332, _1513);
    float _1527 = fma(_390, _1401, _1523);
    int _1529 = as_type<int>(_1523);
    float _1531 = as_type<float>(_1521);
    if (!_1447)
    {
        uint _1533 = uint(int(uint(_1491) >> uint(2)));
        _1529 = int(_1533);
    }
    int _1535 = _1529;
    float _1537 = _1401;
    int _1539 = _1535;
    if (!_1447)
    {
        float _1541 = floor(_1246);
        _1537 = _1541;
    }
    float _1543 = _1537;
    float _1545 = _820 + _1525;
    float _1547 = fma(_392, _1431, _1527);
    float _1549 = _1467;
    if (!_1447)
    {
        int _1551 = _1535 << 4;
        int _1553 = _1551 + _1521;
        _1539 = _1553;
    }
    int _1555 = _1539;
    if (!_1501)
    {
        _1531 = _1385;
    }
    float _1557 = _1531;
    float _1559 = _1547 + _1439;
    float _1561 = _1557;
    if (!_1501)
    {
        _1517 = _1545;
    }
    float _1563 = _1517;
    bool _1565 = !_1501;
    float _1567 = _1563;
    if (!_1565)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1573 = _1469 + _1571;
        float _1575 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = rsqrt(_1449);
        float _1579 = _1573 * _1569;
        float _1581 = _1579 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        float _1587 = _1581 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = fma(_1585, _1575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1593 = _1577 * _1591;
        float _1595 = _1589 + (-1.0);
        float _1597 = fma(_1443, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = fma(_1413, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = fma(_1545, _1589, _1601);
        _1481 = _1599;
        _1561 = _1597;
        _1567 = _1603;
    }
    float _1605 = _1481;
    float _1607 = _1561;
    float _1609 = _1567;
    float _1611 = _1609;
    float _1613 = _1607;
    if (_1118)
    {
        _1483 = _1605;
    }
    float _1615 = _1483;
    float _1617 = _1615;
    if (!_1118)
    {
        float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1621 = _820 + _1619;
        float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1625 = _390 + _1623;
        float _1627 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = -_390;
        float _1631 = _1629 + _1607;
        float _1633 = _1621 * _1621;
        float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1637 = _392 + _1635;
        float _1639 = fma(_1625, _1625, _1633);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = fma(_1637, _1637, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1649 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1651 = _1649 * _1641;
        float _1653 = -_820;
        float _1655 = _1653 + _1609;
        float _1657 = _1647 * _1651;
        float _1659 = -_392;
        float _1661 = _1659 + _1605;
        float _1663 = fma(_1655, _1657, _820);
        float _1665 = fma(_1631, _1657, _390);
        float _1667 = fma(_1661, _1657, _392);
        _1611 = _1663;
        _1613 = _1665;
        _1617 = _1667;
    }
    float _1669 = _1611;
    float _1671 = _1613;
    float _1673 = _1617;
    float _1675 = _1431;
    if (!_1447)
    {
        int _1677 = _1555 + 400;
        uint _1679 = uint(int(uint(_1677) >> uint(2)));
        uint _1681 = uint(int(uint(int(_1679)) >> uint(2)));
        int _1683 = int(_1679) & 3;
        float _1685 = (*spvDescriptorSet0.vp_c15)._m0[int(_1681)][_1683];
        _1675 = _1685;
    }
    float _1687 = _1675;
    float _1689 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1691 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1693 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1695 = _1511 * _1509;
    float _1697 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1689);
    float _1699 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1691);
    float _1701 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1693);
    int _1703 = _1240 + 88;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    uint _1707 = uint(int(uint(int(_1705)) >> uint(2)));
    int _1709 = int(_1705) & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = int(_1705) + 1;
    uint _1715 = uint(int(uint(_1713) >> uint(2)));
    int _1717 = _1713 & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    float _1721 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1697);
    bool _1723 = _1695 >= 0.0;
    float _1725 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1699);
    float _1727 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1701);
    float _1729 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1731 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1733 = _1559 * _1509;
    bool _1735 = _1695 <= 1.0;
    bool _1737 = _1735 && _1723;
    float _1739 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1741 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1743 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1729);
    float _1745 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1747 = _1733 >= 0.0;
    bool _1749 = _1747 && _1737;
    float _1751 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1753 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1755 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1745);
    bool _1759 = _1733 <= 1.0;
    bool _1761 = _1759 && _1749;
    float _1763 = -_1753;
    float _1765 = fma(_1763, _1751, 1.0);
    float _1767 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1769 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1757);
    float _1771 = _1525;
    if (!_1447)
    {
        float _1773 = floor(_1283);
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1779 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1769);
    float _1783 = _1176 * _1467;
    float _1785 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1779);
    float _1787 = _1779;
    if (!_1447)
    {
        float _1789 = -_1543;
        float _1791 = _1246 + _1789;
        _1787 = _1791;
    }
    float _1793 = _1787;
    float _1795 = log2(_1765);
    if (_1761)
    {
        float _1797 = float(_1200);
        _1549 = _1797;
    }
    float _1799 = _1549;
    float _1801 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1777);
    float _1803 = fma(_390, _1459, _1783);
    float _1805 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1785);
    float _1807 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1809 = 1.0 / _1781;
    float _1811 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1805);
    float _1813 = _1775;
    if (!_1447)
    {
        float _1815 = -_1775;
        float _1817 = _1283 + _1815;
        _1813 = _1817;
    }
    float _1819 = _1813;
    float _1821 = _1783;
    if (_1761)
    {
        float _1823 = rint(_1799);
        float _1825 = precise::max(_1823, 0.0);
        uint _1827 = uint(_1825);
        uint _1829 = clamp(_1827, 0u, 65535u);
        _1821 = as_type<float>(_1829);
    }
    float _1831 = _1821;
    float _1833 = _1795 * 0.693147182464599609375;
    float _1835 = fma(_392, _1711, _1803);
    float _1837 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1807);
    float _1839 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1841 = _1835 + _1719;
    float _1843 = _1687;
    float _1845 = _1837;
    if (!_1447)
    {
        float _1847 = rint(_1687);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1843 = as_type<float>(_1853);
    }
    float _1855 = _1843;
    float _1857 = _1837 * _1809;
    float _1859 = _1811 * _1809;
    float _1861 = _1841 * _1509;
    float _1863 = fma(_1857, 0.5, 0.5);
    float _1865 = fma(_1859, -0.5, 0.5);
    float _1867 = _1543;
    if (_1761)
    {
        float3 _5791 = float3(_1695, _1733, float(as_type<int>(_1831)));
        float3 _5795 = select(_5791, float3(0.0), isnan(_5791));
        float _1869 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5795.xy, uint(rint(_5795.z)), _1861, level(0.0));
        _1867 = _1869;
    }
    float _1871 = _1867;
    float3 _5805 = float3(_1863, _1865, _1839);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5805, float3(0.0), isnan(_5805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5805, float3(0.0), isnan(_5805)), level(0.0)).x;
    float3 _5814 = float3(_1863, _1865, _1839);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5814, float3(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5814, float3(0.0), isnan(_5814)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = _1246;
    if (!_1447)
    {
        float3 _5837 = float3(_1793, _1819, float(as_type<int>(_1855)));
        float3 _5839 = select(_5837, float3(0.0), isnan(_5837));
        float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5839.xy, uint(rint(_5839.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5839.xy, uint(rint(_5839.z)), level(0.0)).x;
        _1886 = _1888;
    }
    float _1890 = _1886;
    if (_1447)
    {
        _1485 = 1.0;
    }
    float _1892 = _1485;
    float _1894 = _1892;
    if (!_1447)
    {
        int _1896 = _1491 << 4;
        int _1898 = _1896 + 2048;
        uint _1900 = uint(int(uint(_1898) >> uint(2)));
        uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
        int _1904 = int(_1900) & 3;
        float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
        int _1908 = int(_1900) + 1;
        uint _1910 = uint(int(uint(_1908) >> uint(2)));
        int _1912 = _1908 & 3;
        float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
        int _1916 = _1898 + 8;
        uint _1918 = uint(int(uint(_1916) >> uint(2)));
        uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
        int _1922 = int(_1918) & 3;
        float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
        int _1926 = int(_1918) + 1;
        uint _1928 = uint(int(uint(_1926) >> uint(2)));
        int _1930 = _1926 & 3;
        float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
        float _1934 = _1176 * _1914;
        float _1936 = fma(_390, _1906, _1934);
        float _1938 = fma(_392, _1924, _1936);
        float _1940 = _1938 + _1932;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        float _1944 = -_1942;
        float _1946 = _1944 + _1890;
        float _1948 = fma(_1946, 500.0, 1.5);
        float _1950 = exp2(_1948);
        float _1952 = 0.0 + _1950;
        float _1954 = precise::clamp(_1952, 0.0, 1.0);
        _1190 = _1934;
        _1894 = _1954;
    }
    float _1956 = _1190;
    float _1958 = _1894;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1962 = _1669 + _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1966 = _1671 + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1970 = _1673 + _1968;
    float _1972 = _1962 * _1962;
    float _1974 = fma(_1966, _1966, _1972);
    float _1976 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1978 = fma(_1970, _1970, _1974);
    float _1980 = precise::max(0.0, _1976);
    float _1982 = rsqrt(_1978);
    float _1984 = sqrt(_1978);
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1988 = _1966 * _1986;
    float _1990 = _1970 * _1986;
    float _1992 = -_1986;
    float _1994 = -_1980;
    float _1996 = fma(_1962, _1992, _1994);
    float _1998 = _1988 * _1988;
    float _2000 = _1990 * _1990;
    float _2002 = _1998 + _2000;
    float _2004 = sqrt(_2002);
    bool _2006 = _2004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2010 = _2004 + _2008;
    float _2012 = _1956;
    float _2014 = _1962;
    float _2016 = _2010;
    float _2018 = _1980;
    float _2020 = _1988;
    float _2022 = _1990;
    float _2024 = _1998;
    float _2026 = _2000;
    if (_2006)
    {
        float _2028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2012 = _2028;
    }
    float _2030 = _2012;
    if (_2006)
    {
        float _2032 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2014 = _2032;
    }
    float _2034 = _2014;
    float _2036 = _2030;
    float _2038 = _2034;
    if (_2006)
    {
        float _2040 = _2010 * _2030;
        _2016 = _2040;
    }
    float _2042 = _2016;
    if (_2006)
    {
        float _2044 = rsqrt(_2002);
        _2036 = _2044;
    }
    float _2046 = _2036;
    float _2048 = _2046;
    if (_2006)
    {
        float _2050 = _2042 * 0.15915493667125701904296875;
        _616 = _2050;
    }
    float _2052 = _616;
    float _2054 = _392;
    if (_2006)
    {
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = _2042;
    if (_2006)
    {
        float _2064 = _2052 * 6.283185482025146484375;
        float _2066 = cos(_2064);
        _2062 = _2066;
    }
    float _2068 = _2062;
    float _2070 = _2060;
    if (_2006)
    {
        float _2072 = fma(_2060, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = _2074;
    if (!_2006)
    {
        _2038 = _1996;
    }
    float _2078 = _2038;
    float _2080 = _2078;
    if (_2006)
    {
        float _2082 = _2046 * _2074;
        _2076 = _2082;
    }
    float _2084 = _2076;
    if (_2006)
    {
        float _2086 = _2068 + (-1.0);
        _2018 = _2086;
    }
    float _2088 = _2018;
    if (_2006)
    {
        float _2090 = _1988 * _2084;
        _2020 = _2090;
    }
    float _2092 = _2020;
    if (_2006)
    {
        float _2094 = _1990 * _2084;
        _2022 = _2094;
    }
    float _2096 = _2022;
    if (_2006)
    {
        float _2098 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2048 = _2098;
    }
    float _2100 = _2048;
    if (_2006)
    {
        float _2102 = _2092 * _2092;
        _2024 = _2102;
    }
    float _2104 = _2024;
    if (_2006)
    {
        float _2106 = _2096 * _2096;
        _2026 = _2106;
    }
    float _2108 = _2026;
    if (_2006)
    {
        float _2110 = fma(_1996, _2068, _2100);
        _2080 = _2110;
    }
    float _2112 = _2080;
    float _2114 = fma(_2112, _2112, _2104);
    float _2116 = _2114 + _2108;
    float _2118 = rsqrt(_2116);
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2122 = fma(_1984, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2120);
    float _2124 = precise::clamp(_2122, 0.0, 1.0);
    float _2126 = -_2124;
    float _2128 = _2126 + 1.0;
    float _2130 = _2118 * _2092;
    float _2132 = _2118 * _2112;
    float _2134 = _2118 * _2096;
    float _2136 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2138 = abs(_2128);
    float _2140 = log2(_2138);
    float _2142 = -_2136;
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2142);
    float _2146 = -_2134;
    float _2148 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2144);
    float _2150 = _2132 + 1.0;
    float _2152 = fma(_2148, -0.5, 0.5);
    float _2154 = fma(_2148, 0.5, 0.5);
    float _2156 = fma(_2154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2158 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2160 = sqrt(_2152);
    float _2162 = fma(_2154, _2156, -0.212114393711090087890625);
    float _2164 = fma(_2154, _2162, 1.570728778839111328125);
    float _2166 = exp2(_2158);
    float _2168 = _2160 * 0.636619746685028076171875;
    float _2170 = -_2164;
    float _2172 = fma(_2168, _2170, 1.0);
    float _2174 = -_2132;
    float _2176 = fma(_2166, _2150, _2174);
    float _2178 = fma(_2176, 0.5, 0.5);
    float2 _6287 = float2(_2172, _2178);
    float3 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6287, float2(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6287, float2(0.0), isnan(_6287)), level(0.0)).xyz;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = in.m_69.w;
    float _2192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2194 = _424 > 0.5;
    float _2196 = in.m_77.y;
    int _2198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2200 = _2198 != 0;
    float _2202 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2206 = _2204 != 0;
    float _2208 = in.m_77.x;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2212 = _2210 != 0;
    float _2214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2218 = _2216 != 0;
    float _2220 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2202);
    float _2222 = -_410;
    float _2224 = _2222 + 1.0;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2234 = _2190 > 0.5;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = -_2196;
    float _2242 = _2240 + 1.0;
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2246 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2248 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2250 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2252 = _2234 ? as_type<int>(_2242) : as_type<int>(_2196);
    int _2254 = 0;
    bool _2256 = _2234;
    float _2258 = _2196;
    bool _2260 = _2218;
    float _2262 = _2208;
    float _2264 = _2236;
    float _2266 = _2238;
    if (_2206)
    {
        float _2268 = -_2208;
        float _2270 = _2268 + 1.0;
        _2254 = as_type<int>(_2270);
    }
    int _2272 = _2254;
    float _2274 = as_type<float>(_2272);
    if (_2206)
    {
        bool _2276 = _442 > 0.5;
        _2256 = _2276;
    }
    bool _2278 = _2256;
    float _2280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2282 = _2218 ? as_type<float>(_2252) : _2196;
    out.m_79.x = _2246;
    out.m_79.y = _2248;
    out.m_79.z = _2250;
    out.m_79.w = _2244;
    if (_2200)
    {
        float _2284 = _2194 ? _2242 : _2196;
        _2258 = _2284;
    }
    float _2286 = _2258;
    int _2288 = 0;
    if (_2212)
    {
        float _2290 = -_2208;
        float _2292 = _2290 + 1.0;
        _2288 = as_type<int>(_2292);
    }
    int _2294 = _2288;
    float _2296 = as_type<float>(_2294);
    if (_2212)
    {
        bool _2298 = _416 > 0.5;
        _2260 = _2298;
    }
    bool _2300 = _2260;
    float _2302 = in.m_81.x;
    float _2304 = in.m_81.y;
    float _2306 = in.m_81.z;
    bool _2308 = _1104 != 0.0;
    bool _2310 = isnan(_1104);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2320 = in.m_83.x;
    float _2322 = in.m_83.y;
    float _2324 = in.m_83.z;
    float _2326 = in.m_83.w;
    bool _2328 = _1102 == 0.0;
    bool _2330 = !_2316;
    bool _2332 = _2328 && _2330;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2336 = 0.0;
    if (!_2206)
    {
        _2336 = _2208;
    }
    float _2338 = _2336;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2342 = _1106 == 0.0;
    bool _2344 = _2342 && _2332;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _2338;
    if (_2206)
    {
        float _2350 = _2278 ? as_type<float>(_2272) : _2208;
        _2348 = _2350;
    }
    float _2352 = _2348;
    float _2354 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2354;
    if (_2212)
    {
        float _2358 = _2300 ? as_type<float>(_2294) : _2208;
        _2262 = _2358;
    }
    float _2360 = _2262;
    out.m_85.x = _2346;
    out.m_85.y = _2354;
    out.m_85.z = _2238;
    out.m_85.w = _2236;
    float _2362 = 0.0;
    if (_2344)
    {
        _2362 = _2304;
    }
    float _2364 = _2362;
    float _2366 = _2364;
    if (_2344)
    {
        _2296 = _2306;
    }
    float _2368 = _2296;
    float _2370 = abs(_1144);
    float _2372 = log2(_2370);
    float _2374 = _2368;
    if (_2344)
    {
        _2356 = _2302;
    }
    float _2376 = _2356;
    float _2378 = _2376;
    if (_2344)
    {
        _2264 = _2364;
    }
    float _2380 = _2264;
    float _2382 = _2380;
    if (_2344)
    {
        _2274 = _2376;
    }
    float _2384 = _2274;
    float _2386 = _2384;
    if (!_2344)
    {
        _2378 = _2302;
    }
    float _2388 = _2378;
    float _2390 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2344)
    {
        _2366 = _2304;
    }
    float _2392 = _2366;
    float _2394 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2344)
    {
        _2266 = _2368;
    }
    float _2396 = _2266;
    float _2398 = _2396;
    if (!_2344)
    {
        float _2400 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2388);
        _2386 = _2400;
    }
    float _2402 = _2386;
    if (!_2344)
    {
        _2374 = _2306;
    }
    float _2404 = _2374;
    if (!_2344)
    {
        float _2406 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2392);
        _2382 = _2406;
    }
    float _2408 = _2382;
    float _2410 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2412 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2414 = _2394 * _2192;
    float _2416 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2418 = _2390 * _2214;
    float _2420 = _2410 * _2280;
    float _2422 = _2324 * _2388;
    float _2424 = exp2(_2412);
    float _2426 = _2322 * _2404;
    float _2428 = _2320 * _2392;
    if (!_2344)
    {
        float _2430 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2404);
        _2398 = _2430;
    }
    float _2432 = _2398;
    float _2434 = -_2422;
    float _2436 = fma(_2320, _2404, _2434);
    float _2438 = -_2426;
    float _2440 = fma(_2324, _2392, _2438);
    float _2442 = -_2428;
    float _2444 = fma(_2322, _2388, _2442);
    float _2446 = _2436 * _2326;
    float _2448 = _2416 * _2318;
    float _2450 = _2440 * _2326;
    float _2452 = _2444 * _2326;
    float _2454 = -_2408;
    float _2456 = _1220 * _2454;
    float _2458 = -_2322;
    float _2460 = _1220 * _2458;
    float _2462 = -_2446;
    float _2464 = _1220 * _2462;
    float _2466 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    out.m_87.x = _2420;
    out.m_87.y = _2418;
    out.m_87.z = _2448;
    out.m_87.w = _2414;
    float _2470 = fma(_1208, _2402, _2456);
    float _2472 = fma(_1208, _2450, _2464);
    bool _2474 = _1144 <= 8000.0;
    bool _2476 = isnan(_1144);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(8000.0);
    bool _2482 = _2478 || _2480;
    float _2484 = float(_2482);
    float _2486 = fma(_1208, _2320, _2460);
    float _2488 = fma(_2468, -2.0, 3.0);
    float _2490 = _2468 * _2468;
    float _2492 = fma(_1186, _2432, _2470);
    float _2494 = fma(_1186, _2324, _2486);
    float _2496 = fma(_1186, _2452, _2472);
    float _2498 = _2490 * _2488;
    float _2500 = _1244 * _2322;
    float _2502 = _1244 * _2408;
    float _2504 = _1224 * _2408;
    float _2506 = _1244 * _2446;
    float _2508 = _1224 * _2322;
    float _2510 = _1224 * _2446;
    float _2512 = fma(_1248, _2320, _2500);
    float _2514 = fma(_1248, _2402, _2502);
    float _2516 = fma(_1248, _2450, _2506);
    float _2518 = fma(_1277, _2402, _2504);
    float _2520 = fma(_1277, _2320, _2508);
    float _2522 = fma(_1277, _2450, _2510);
    float _2524 = fma(_1281, _2324, _2512);
    float _2526 = fma(_1281, _2432, _2514);
    float _2528 = fma(_1281, _2452, _2516);
    float _2530 = fma(_1252, _2432, _2518);
    float _2532 = fma(_1252, _2324, _2520);
    float _2534 = fma(_1252, _2452, _2522);
    float _2536 = _2524 * _316;
    float _2538 = _2524 * _320;
    float _2540 = _2526 * _324;
    float _2542 = _2524 * _324;
    float _2544 = _2528 * _324;
    float _2546 = _2526 * _316;
    float _2548 = fma(_2492, _294, _2540);
    float _2550 = fma(_2494, _294, _2542);
    float _2552 = fma(_2496, _294, _2544);
    float _2554 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2220);
    float _2556 = _2528 * _316;
    float _2558 = _2528 * _320;
    float _2560 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2562 = _2526 * _320;
    float _2564 = fma(_2494, _286, _2536);
    float _2566 = fma(_2494, _290, _2538);
    float _2568 = fma(_2496, _286, _2556);
    float _2570 = fma(_2496, _290, _2558);
    float _2572 = fma(_2492, _286, _2546);
    float _2574 = exp2(_2560);
    float _2576 = fma(_2532, _328, _2564);
    float _2578 = fma(_2532, _332, _2566);
    float _2580 = fma(_2534, _328, _2568);
    float _2582 = fma(_2534, _332, _2570);
    float _2584 = fma(_2532, _336, _2550);
    float _2586 = fma(_2534, _336, _2552);
    float _2588 = fma(_2530, _336, _2548);
    float _2590 = -_2498;
    float _2592 = _2590 + 1.0;
    float _2594 = fma(_2492, _290, _2562);
    out.m_89.x = _2576;
    out.m_89.y = _2578;
    out.m_89.z = _2584;
    float _2596 = fma(_2530, _328, _2572);
    float _2598 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2498);
    float _2600 = fma(_2530, _332, _2594);
    float _2602 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2554);
    float _2604 = _2484 * _2598;
    float _2606 = -_2574;
    float _2608 = _2606 + 1.0;
    if (!_1761)
    {
        _1845 = 1.0;
    }
    float _2610 = _1845;
    float _2612 = _2602 + _1781;
    float _2614 = _2610;
    if (_1761)
    {
        bool _2616 = _1871 >= _1861;
        bool _2618 = isnan(_1871);
        bool _2620 = _2616 || _2618;
        bool _2622 = isnan(_1861);
        bool _2624 = _2620 || _2622;
        float _2626 = float(_2624);
        _2614 = _2626;
    }
    float _2628 = _2614;
    float _2630 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2632 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2634 = _2612 * 0.5;
    float _2636 = _2628 * _1958;
    float _2638 = _2224 * _2632;
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2630 * _1873;
    float _2644 = -_2630;
    float _2646 = _2644 + 1.0;
    float _2648 = -_2640;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = _1884 * _2642;
    float _2654 = _1884 * _2646;
    out.m_91.x = _2580;
    out.m_91.y = _2582;
    out.m_91.z = _2586;
    float _2656 = -_2636;
    float _2658 = fma(_2656, _2650, 1.0);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    bool _2662 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2664 = isnan(_1984);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2670 = _2666 || _2668;
    out.m_93.x = 1.0;
    out.m_93.y = 1.0;
    out.m_93.z = 1.0;
    float _2672 = _2660 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1837;
    out.gl_Position.y = _1811;
    out.gl_Position.z = _2602;
    out.gl_Position.w = _1781;
    out.m_95.x = _2672;
    float _2674 = _2646;
    float _2676 = _2636;
    float _2678 = _2660;
    float _2680 = _2634;
    float _2682 = _2642;
    float _2684 = _2652;
    if (!_2670)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2686 = _2674;
    out.m_97.x = _2596;
    out.m_97.y = _2600;
    out.m_97.z = _2588;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2670)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2692 = _2676;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2670)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2698 = _2678;
    out.m_99.z = _2634;
    out.m_99.w = _1781;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2670)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2704 = _2680;
    float _2706 = _2188 * _2642;
    float _2708 = fma(_2184, _2652, _1878);
    float _2710 = fma(_2186, _2652, _1880);
    float _2712 = _2704;
    float _2714 = _2704;
    if (!_2670)
    {
        _2682 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2682;
    float _2718 = fma(_1884, _2706, _1882);
    float _2720 = _2716;
    float _2722 = _2716;
    if (!_2670)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2684;
    out.m_101.x = _2708;
    out.m_101.y = _2710;
    out.m_101.z = _2718;
    out.m_101.w = _2654;
    bool _2726 = !_2670;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2726)
    {
        bool _2732 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2734 = isnan(_1984);
        bool _2736 = _2732 || _2734;
        bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2740 = _2736 || _2738;
        if (!_2740)
        {
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2744 = _1984 + _2742;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2746;
            float _2750 = 1.0 / _2748;
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2772 = _2744 * _2750;
            float _2774 = precise::clamp(_2772, 0.0, 1.0);
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2780 = fma(_2774, _2754, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2714 = _2780;
            _2730 = _2788;
            _2722 = _2782;
            _2696 = _2786;
            _2690 = _2784;
            _2702 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2796 = isnan(_1984);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2804 = _2720;
            _2722 = _2804;
            if (!_2802)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2806 = _2712;
            _2714 = _2806;
            if (!_2802)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2808 = _2688;
            _2690 = _2808;
            if (!_2802)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2810 = _2694;
            _2696 = _2810;
            if (!_2802)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2812 = _2728;
            _2730 = _2812;
            if (!_2802)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2814 = _2700;
            bool _2816 = !_2802;
            _2702 = _2814;
            if (!_2816)
            {
                bool _2818 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2820 = isnan(_1984);
                bool _2822 = _2818 || _2820;
                bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2826 = _2822 || _2824;
                if (!_2826)
                {
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2830 = _1984 + _2828;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2832;
                    float _2836 = 1.0 / _2834;
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2858 = _2830 * _2836;
                    float _2860 = precise::clamp(_2858, 0.0, 1.0);
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2866 = fma(_2860, _2840, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2868 = fma(_2860, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2870 = fma(_2860, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2872 = fma(_2860, _2848, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2874 = fma(_2860, _2852, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2876 = fma(_2860, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2714 = _2866;
                    _2730 = _2874;
                    _2722 = _2868;
                    _2696 = _2872;
                    _2690 = _2870;
                    _2702 = _2876;
                    _2792 = true;
                }
                else
                {
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2792 = false;
    float _2878 = _2714;
    float _2880 = _2730;
    float _2882 = _2722;
    float _2884 = _2696;
    float _2886 = _2690;
    float _2888 = _2702;
    float _2890 = fma(_2600, -0.5, 0.5);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -_2878;
    float _2896 = _2894 + _2880;
    float _2898 = -_2882;
    float _2900 = _2898 + _2884;
    float _2902 = -_2886;
    float _2904 = _2902 + _2888;
    bool _2906 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2908 = fma(_2892, _2896, _2878);
    float _2910 = fma(_2892, _2900, _2882);
    float _2912 = fma(_2892, _2904, _2886);
    float _2914 = _2908 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2916 = fma(_2910, 0.298911988735198974609375, _2914);
    float _2918 = fma(_2912, 0.114477999508380889892578125, _2916);
    out.m_103.x = 0.0;
    float _2920 = -_2918;
    float _2922 = _2910 + _2920;
    float _2924 = -_2918;
    float _2926 = _2908 + _2924;
    float _2928 = -_2918;
    float _2930 = _2912 + _2928;
    float _2932 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2934 = fma(_2922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    float _2936 = fma(_2926, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    float _2938 = fma(_2930, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    out.m_95.w = _2932;
    out.m_105.x = _2934;
    out.m_105.y = _2936;
    out.m_105.z = _2938;
    if (!_2906)
    {
        return out;
    }
    float _2940 = -_1669;
    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2944 = -_1671;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2948 = -_1673;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2952 = _2942 * _2942;
    float _2954 = fma(_2946, _2946, _2952);
    float _2956 = fma(_2950, _2950, _2954);
    float _2958 = sqrt(_2956);
    float _2960 = rsqrt(_2956);
    float _2962 = -_2958;
    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = _2946 * _2960;
    float _2972 = _2942 * _2960;
    float _2974 = abs(_2968);
    float _2976 = log2(_2974);
    float _2978 = _2950 * _2960;
    float _2980 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2982 = _2600 * _2972;
    float _2984 = -_2972;
    float _2986 = -_2980;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2986);
    float _2990 = fma(_2596, _2970, _2982);
    float _2992 = -_2978;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2988);
    float _2996 = fma(_2588, _2978, _2990);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3002 = _2994 + _3000;
    float _3004 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3008 = precise::clamp(_3006, 0.0, 1.0);
    float _3010 = exp2(_3004);
    float _3012 = _3010 * _3008;
    float _3014 = _2998 * _3012;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _3016;
    out.m_103.y = _3018;
    out.m_103.z = _3020;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2792 = false;
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
    float _134 = _132;
    if (!_128)
    {
        out.m_59.x = 0.0;
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
        float _3077 = as_type<float>(_140);
        out.gl_Position.z = _3077;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3147 = as_type<float>(_178);
        out.gl_Position.z = _3147;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _226 = _218;
    float _228 = _216;
    if (_222)
    {
        float _230 = rsqrt(_210);
        _226 = _230;
    }
    float _232 = _226;
    float _234 = 0.0;
    if (!_222)
    {
        _234 = 0.0;
    }
    float _236 = _234;
    bool _238 = _220 > 0.0;
    float _240 = 0.0;
    float _242 = _236;
    if (!_222)
    {
        _240 = 0.0;
    }
    float _244 = _240;
    float _246 = 0.0;
    float _248 = _244;
    if (!_222)
    {
        _246 = 0.0;
    }
    float _250 = _246;
    float _252 = 0.0;
    float _254 = _250;
    if (_224)
    {
        float _256 = rsqrt(_212);
        _252 = _256;
    }
    float _258 = _252;
    float _260 = 0.0;
    if (!_224)
    {
        _260 = 0.0;
    }
    float _262 = _260;
    float _264 = 0.0;
    float _266 = _262;
    if (!_224)
    {
        _264 = 0.0;
    }
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    if (!_224)
    {
        _270 = 0.0;
    }
    float _274 = _270;
    float _276 = _220;
    float _278 = _274;
    if (_238)
    {
        float _280 = rsqrt(_214);
        _276 = _280;
    }
    float _282 = _276;
    if (_222)
    {
        float _284 = _232 * _186;
        _242 = _284;
    }
    float _286 = _242;
    if (_222)
    {
        float _288 = _232 * _180;
        _248 = _288;
    }
    float _290 = _248;
    if (_222)
    {
        float _292 = _232 * _192;
        _254 = _292;
    }
    float _294 = _254;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _298 = 0.0;
    if (!_238)
    {
        _228 = 0.0;
        _298 = 0.0;
    }
    float _300 = _228;
    float _302 = _298;
    float _304 = 0.0;
    float _306 = _302;
    float _308 = _300;
    if (!_238)
    {
        _304 = 0.0;
    }
    float _310 = _304;
    float _312 = _310;
    if (_224)
    {
        float _314 = _258 * _188;
        _266 = _314;
    }
    float _316 = _266;
    if (_224)
    {
        float _318 = _258 * _182;
        _272 = _318;
    }
    float _320 = _272;
    if (_224)
    {
        float _322 = _258 * _194;
        _278 = _322;
    }
    float _324 = _278;
    if (_238)
    {
        float _326 = _282 * _190;
        _312 = _326;
    }
    float _328 = _312;
    if (_238)
    {
        float _330 = _282 * _184;
        _306 = _330;
    }
    float _332 = _306;
    if (_238)
    {
        float _334 = _282 * _196;
        _308 = _334;
    }
    float _336 = _308;
    bool _338 = !_296;
    float _356;
    if (!_338)
    {
        float _340 = in.m_69.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
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
        float _364 = _158 * _362;
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
    float2 _3477 = float2(_404, _408);
    float _410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3477, float2(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3477, float2(0.0), isnan(_3477)), level(0.0)).x;
    float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _414 = log2(_412);
    float _416 = in.m_69.z;
    float _418 = _182 * _370;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _366 + _420;
    float _424 = in.m_69.y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _442 = in.m_69.x;
    float _444 = 1.0 / _428;
    float _446 = fma(_180, _368, _418);
    float _448 = _414 * _158;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _456 = _366 + _454;
    float _458 = fma(_184, _372, _446);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _462 = _366 + _460;
    float _464 = 1.0 / _432;
    float _466 = in.m_63.w;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _478 = _476 != 0;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _482 = _366 + _480;
    bool _484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _492 = _488 || _490;
    float _494 = 1.0 / _436;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _498 = 1.0 + _496;
    float _500 = _482 * _444;
    float _502 = _424 + _416;
    bool _504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _512 = _508 || _510;
    float _514 = _416 * 2.0;
    float _516 = _442 * 2.0;
    float _518 = _502 + (-1.0);
    float _520 = 1.0 / _440;
    float _522 = _422 * _464;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _526 = _366 + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = exp2(_448);
    float _538 = _456 * _494;
    float _540 = fma(_534, _522, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _542 = fma(_530, _500, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _544;
    float _548 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _550 = 1.0 / _452;
    float _552 = _526 * _520;
    float _554 = _424 * 2.0;
    float _556 = _442 + _424;
    float _558 = fma(_546, _538, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _560 = !_478;
    int _562 = _560 ? 0 : 1;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _568 = _556 + (-1.0);
    float _570 = 1.0 / _498;
    float _572 = -_536;
    float _574 = _572 + 1.0;
    bool _576 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _578 = isnan(_366);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _512 ? _574 : 0.0;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _592 = _462 * _550;
    float _594 = _442 + _416;
    float _596 = floor(_554);
    bool _598 = !_474;
    int _600 = _598 ? 0 : 1;
    float _602 = _594 + (-1.0);
    bool _604 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _606 = isnan(_366);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = _390;
    if (_492)
    {
        float _618 = _588 * _570;
        _160 = _618;
    }
    float _620 = _160;
    float _622 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _624 = floor(_514);
    bool _626 = !_470;
    int _628 = _626 ? 0 : 1;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _630;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _638;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _646 = floor(_516);
    float _648 = fma(_636, _522, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _650 = fma(_632, _500, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _652 = fma(_644, _522, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _654 = fma(_640, _500, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _656;
    bool _660 = _596 > 0.0;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _662;
    bool _666 = _596 >= 0.0;
    bool _668 = isnan(_596);
    bool _670 = _666 || _668;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    float _676 = fma(_658, _538, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _678 = _624 >= 0.0;
    bool _680 = isnan(_624);
    bool _682 = _678 || _680;
    bool _684 = isnan(0.0);
    bool _686 = _682 || _684;
    float _688 = fma(_664, _538, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _694 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _696 = isnan(_366);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _710 = _646 >= 0.0;
    bool _712 = isnan(_646);
    bool _714 = _710 || _712;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    bool _720 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _722 = isnan(_366);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _734 = _732 != 0;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _738 = _736 != 0;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _742 = _740 != 0;
    float _744 = -_704;
    float _746 = _744 + 1.0;
    bool _748 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _750 = isnan(_366);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_730;
    float _762 = _760 + 1.0;
    bool _764 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _766 = isnan(_366);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = _730 * _746;
    float _778 = fma(_692, _552, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _780 = -_586;
    float _782 = _780 + 1.0;
    int _784 = _718 ? 0 : 1;
    float _786 = -_758;
    float _788 = _786 + 1.0;
    bool _790 = _624 > 0.0;
    float _792 = _774 * _782;
    float _794 = -_774;
    float _796 = _794 + 1.0;
    bool _798 = !_734;
    int _800 = _798 ? 0 : 1;
    float _802 = _586 * _788;
    float _804 = _614 * _796;
    float _806 = -_614;
    float _808 = _806 + 1.0;
    int _810 = abs(_800);
    float _812 = _758 * _762;
    float _814 = _650 * _804;
    float _816 = _542 * _804;
    float _818 = _654 * _804;
    float _820 = _458 + _466;
    float _822 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].x, _814);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _826 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].z, _818);
    int _828 = _686 ? 0 : 1;
    float _830 = fma(_648, _792, _822);
    float _832 = _620 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _834 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[143].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _836;
    float _840 = fma(_652, _792, _826);
    int _842 = ~_828;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    float _848 = fma(_540, _792, _834);
    int _850 = _846;
    if (!_790)
    {
        int _852 = ~_828;
        int _854 = _852 + 1;
        _850 = _854;
    }
    int _856 = _850;
    float _858 = fma(_838, _592, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _860 = !_738;
    int _862 = _860 ? 0 : 1;
    float _864 = fma(_566, _552, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _866 = _674 ? 0 : 1;
    float _868 = _832 * _824;
    bool _870 = _646 > 0.0;
    float _872 = fma(_708, _552, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _874 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[203].x, _868);
    float _876 = float(_856);
    float _878 = fma(_558, _802, _848);
    bool _880 = !_742;
    int _882 = _880 ? 0 : 1;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _884;
    int _888 = abs(_862);
    float _890 = fma(_676, _802, _830);
    int _892 = ~_866;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    float _898 = floor(_874);
    int _900 = _896;
    if (!_660)
    {
        int _902 = ~_866;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = _820 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _910 = float(_810);
    float _912 = fma(_886, _592, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _914 = abs(_882);
    float _916 = _874 + 0.25;
    float _918 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[10].x, _908);
    float _920 = _910 * _876;
    int _922 = ~_784;
    int _924 = _922 + 1;
    int _926 = _924 + 1;
    float _928 = floor(_916);
    float _930 = in.m_71.x;
    float _932 = in.m_71.y;
    float _934 = in.m_71.z;
    float _936 = fma(_688, _802, _840);
    int _938 = _926;
    if (!_870)
    {
        int _940 = ~_784;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    float _946 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[10].z, _918);
    float _948 = -_898;
    float _950 = _874 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _952;
    float _956 = float(_944);
    float _958 = _874 * 6.283185482025146484375;
    float _960 = float(_888);
    float _962 = fma(_954, _592, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _964 = float(_906);
    float _966 = _820 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _968 = float(_914);
    float _970 = _960 * _956;
    bool _972 = _950 >= 0.5;
    bool _974 = isnan(_950);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.5);
    bool _980 = _976 || _978;
    float _982 = _958 * 0.15915493667125701904296875;
    float _984 = -_928;
    float _986 = _916 + _984;
    float _988 = _968 * _964;
    int _990 = abs(_600);
    float _992 = fma(_390, (*spvDescriptorSet0.vp_c8)._m0[11].x, _966);
    float _994 = _970 * (-2.0);
    float _996 = _982 * 6.283185482025146484375;
    float _998 = sin(_996);
    bool _1000 = _986 > 0.5;
    float _1002 = fma(_392, (*spvDescriptorSet0.vp_c8)._m0[11].z, _992);
    bool _1004 = !_980;
    float _1006 = _1004 ? 0.5 : (-0.5);
    float _1008 = fma(_548, _994, _548);
    float _1010 = fma(_994, _932, _932);
    float _1012 = float(_990);
    float _1014 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = _424 + (-0.5);
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1020 = _1018 * 2.0;
    float _1022 = _946 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1024 = abs(_628);
    float _1026 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1010);
    int _1028 = abs(_562);
    float _1030 = _1022 + _1014;
    float _1032 = 1.0 / _1014;
    float _1034 = _986;
    if (_1000)
    {
        float _1036 = -_986;
        float _1038 = _1036 + 1.0;
        _1034 = _1038;
    }
    float _1040 = _1034;
    float _1042 = _1012 * _1020;
    float _1044 = float(_1024);
    float _1046 = _998 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1048 = fma(_1040, 4.0, -1.0);
    float _1050 = fma(_1044, _1046, _1042);
    float _1052 = float(_1028);
    float _1054 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1056 = _988 * (-2.0);
    float _1058 = fma(_1008, _620, _1026);
    float _1060 = _416 + (-0.5);
    float _1062 = fma(_1052, _1054, _1050);
    float _1064 = fma(_622, _1056, _622);
    float _1066 = in.m_73.x;
    float _1068 = in.m_73.y;
    float _1070 = in.m_73.z;
    float _1072 = _1030 * _1032;
    float _1074 = _1072 * 0.5;
    float _1076 = _1058 * 0.15915493667125701904296875;
    float _1078 = fma(_1062, 3.1415927410125732421875, _930);
    float _1080 = _920 * (-2.0);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1082);
    float _1086 = fma(_1056, _934, _934);
    float _1088 = fma(_778, _812, _890);
    float _1090 = fma(_872, _812, _936);
    float _1092 = 1.0 / _1084;
    float _1094 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1086);
    float _1096 = fma(_858, _776, _1088);
    float _1098 = fma(_590, _1080, _590);
    float _1100 = fma(_962, _776, _1090);
    float _1102 = in.m_75.x;
    float _1104 = in.m_75.y;
    float _1106 = in.m_75.z;
    float _1108 = fma(_864, _812, _878);
    bool _1110 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1112 = isnan(0.5);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1118 = _1114 || _1116;
    float _1120 = _1076 * 6.283185482025146484375;
    float _1122 = sin(_1120);
    float _1124 = fma(_1064, _620, _1094);
    float _1126 = _442 + (-0.5);
    float _1128 = fma(_1078, _1080, _1078);
    float _1130 = fma(_912, _776, _1108);
    float _1132 = _1124 * 0.15915493667125701904296875;
    float _1134 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1128);
    float _1136 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1096);
    float _1138 = _1132 * 6.283185482025146484375;
    float _1140 = cos(_1138);
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1144 = _1092 * _1142;
    float _1146 = fma(_1098, _620, _1134);
    float _1148 = _1136 * _1066;
    float _1150 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1100);
    float _1152 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1130);
    float _1154 = _1146 * 0.15915493667125701904296875;
    bool _1156 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1158 = _1150 * _1070;
    float _1160 = _1076 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    bool _1164 = _1144 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1166 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1168 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1170 = _1152 * _1068;
    bool _1172 = !_1156;
    int _1174 = _1172 ? 0 : 1;
    float _1176 = _820 + _1166;
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1180 = _1154 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1186 = _1122 * _1140;
    int _1188 = 2;
    float _1190 = _1176;
    if (!_1156)
    {
        _1188 = 1;
    }
    int _1192 = _1188;
    float _1194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1102);
    float _1196 = _1178 * _1184;
    int _1198 = _1192;
    if (!_1164)
    {
        _1198 = _1174;
    }
    int _1200 = _1198;
    float _1202 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1204 = _1154 * 6.283185482025146484375;
    float _1206 = cos(_1204);
    float _1208 = _1162 * _1140;
    float _1210 = _1194 * _1168;
    float _1212 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1106);
    float _1216 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1202);
    float _1218 = _1132 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1182 * _1122;
    float _1224 = _1182 * _1140;
    float _1226 = _1214 * _1212;
    float _1228 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1216);
    float _1230 = _1224 * _1196;
    float _1232 = _1206 * _1122;
    float _1234 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1236 = _1206 * _1162;
    float _1238 = _1182 * _1162;
    int _1240 = _1200 << 6;
    float _1242 = fma(_390, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1234);
    float _1244 = _1206 * _1140;
    float _1246 = _1228 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1248 = fma(_1220, _1236, _1222);
    float _1250 = fma(_392, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1242);
    float _1252 = fma(_1220, _1222, _1236);
    int _1254 = _1240 + 96;
    uint _1257 = uint(int(uint(_1254) >> uint(2)));
    uint _1259 = uint(int(uint(int(_1257)) >> uint(2)));
    int _1261 = int(_1257) & 3;
    float _1263 = (*spvDescriptorSet0.vp_c15)._m0[int(_1259)][_1261];
    int _1265 = int(_1257) + 1;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    int _1269 = _1265 & 3;
    float _1271 = (*spvDescriptorSet0.vp_c15)._m0[int(_1267)][_1269];
    float _1273 = _1244 * _1196;
    float _1275 = -_1232;
    float _1277 = fma(_1220, _1238, _1275);
    float _1279 = -_1238;
    float _1281 = fma(_1220, _1232, _1279);
    float _1283 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1285 = -_1196;
    float _1287 = _1220 * _1285;
    float _1289 = fma(_1248, _1210, _1273);
    float _1291 = trunc(_1246);
    int _1293 = int(_1291);
    int _1295 = _1240 + 48;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    float _1313 = fma(_1208, _1210, _1287);
    float _1315 = fma(_1281, _1226, _1289);
    float _1317 = fma(_1277, _1210, _1230);
    float _1319 = fma(_1186, _1226, _1313);
    float _1321 = _1315 * _324;
    float _1323 = trunc(_1283);
    int _1325 = int(_1323);
    int _1327 = _1240 + 104;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.vp_c15)._m0[int(_1339)][_1341];
    float _1345 = _1315 * _316;
    float _1347 = fma(_1252, _1226, _1317);
    float _1349 = fma(_1319, _294, _1321);
    float _1351 = fma(_1319, _286, _1345);
    float _1353 = fma(_1347, _336, _1349);
    int _1355 = _1240 + 56;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    int _1373 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1375 = _1293 + _1373;
    int _1377 = _1375 + 1;
    float _1379 = fma(_1347, _328, _1351);
    float _1381 = _392 + _1353;
    bool _1383 = _1377 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1385 = _390 + _1379;
    int _1387 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1389 = _1325 + _1387;
    int _1391 = _1389 + 1;
    int _1393 = _1240 + 64;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    uint _1397 = uint(int(uint(int(_1395)) >> uint(2)));
    int _1399 = int(_1395) & 3;
    float _1401 = (*spvDescriptorSet0.vp_c15)._m0[int(_1397)][_1399];
    int _1403 = int(_1395) + 1;
    uint _1405 = uint(int(uint(_1403) >> uint(2)));
    int _1407 = _1403 & 3;
    float _1409 = (*spvDescriptorSet0.vp_c15)._m0[int(_1405)][_1407];
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1413 = _1381 + _1411;
    int _1415 = _1377 | _1391;
    float _1417 = _1413 * _1413;
    bool _1419 = _1415 < 0;
    bool _1421 = _1419 || _1383;
    int _1423 = _1240 + 72;
    uint _1425 = uint(int(uint(_1423) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c15)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c15)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1385 + _1441;
    bool _1445 = _1391 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1447 = _1445 || _1421;
    float _1449 = fma(_1443, _1443, _1417);
    int _1451 = _1240 + 80;
    uint _1453 = uint(int(uint(_1451) >> uint(2)));
    uint _1455 = uint(int(uint(int(_1453)) >> uint(2)));
    int _1457 = int(_1453) & 3;
    float _1459 = (*spvDescriptorSet0.vp_c15)._m0[int(_1455)][_1457];
    int _1461 = int(_1453) + 1;
    uint _1463 = uint(int(uint(_1461) >> uint(2)));
    int _1465 = _1461 & 3;
    float _1467 = (*spvDescriptorSet0.vp_c15)._m0[int(_1463)][_1465];
    float _1469 = sqrt(_1449);
    float _1471 = _1176 * _1271;
    float _1473 = fma(_390, _1263, _1471);
    float _1475 = _1176 * _1311;
    int _1477 = _1377;
    int _1479 = as_type<int>(_1311);
    float _1481 = _1381;
    float _1483 = _1413;
    float _1485 = _1385;
    if (!_1447)
    {
        int _1487 = _1391 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1489 = _1487 + _1377;
        _1477 = _1489;
    }
    int _1491 = _1477;
    float _1493 = fma(_390, _1303, _1475);
    if (!_1447)
    {
        int _1495 = _1491 << 2;
        _1479 = _1495;
    }
    int _1497 = _1479;
    float _1499 = fma(_392, _1335, _1473);
    bool _1501 = _1469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1503 = _1499 + _1343;
    float _1505 = fma(_392, _1363, _1493);
    float _1507 = _1315 * _320;
    float _1509 = 1.0 / _1503;
    float _1511 = _1505 + _1371;
    float _1513 = fma(_1319, _290, _1507);
    int _1515 = as_type<int>(_1507);
    float _1517 = as_type<float>(_1497);
    if (!_1447)
    {
        int _1519 = 12 & _1497;
        _1515 = _1519;
    }
    int _1521 = _1515;
    float _1523 = _1176 * _1409;
    float _1525 = fma(_1347, _332, _1513);
    float _1527 = fma(_390, _1401, _1523);
    int _1529 = as_type<int>(_1523);
    float _1531 = as_type<float>(_1521);
    if (!_1447)
    {
        uint _1533 = uint(int(uint(_1491) >> uint(2)));
        _1529 = int(_1533);
    }
    int _1535 = _1529;
    float _1537 = _1401;
    int _1539 = _1535;
    if (!_1447)
    {
        float _1541 = floor(_1246);
        _1537 = _1541;
    }
    float _1543 = _1537;
    float _1545 = _820 + _1525;
    float _1547 = fma(_392, _1431, _1527);
    float _1549 = _1467;
    if (!_1447)
    {
        int _1551 = _1535 << 4;
        int _1553 = _1551 + _1521;
        _1539 = _1553;
    }
    int _1555 = _1539;
    if (!_1501)
    {
        _1531 = _1385;
    }
    float _1557 = _1531;
    float _1559 = _1547 + _1439;
    float _1561 = _1557;
    if (!_1501)
    {
        _1517 = _1545;
    }
    float _1563 = _1517;
    bool _1565 = !_1501;
    float _1567 = _1563;
    if (!_1565)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1573 = _1469 + _1571;
        float _1575 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1577 = rsqrt(_1449);
        float _1579 = _1573 * _1569;
        float _1581 = _1579 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        float _1587 = _1581 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = fma(_1585, _1575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1593 = _1577 * _1591;
        float _1595 = _1589 + (-1.0);
        float _1597 = fma(_1443, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = fma(_1413, _1593, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1601 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1603 = fma(_1545, _1589, _1601);
        _1481 = _1599;
        _1561 = _1597;
        _1567 = _1603;
    }
    float _1605 = _1481;
    float _1607 = _1561;
    float _1609 = _1567;
    float _1611 = _1609;
    float _1613 = _1607;
    if (_1118)
    {
        _1483 = _1605;
    }
    float _1615 = _1483;
    float _1617 = _1615;
    if (!_1118)
    {
        float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1621 = _820 + _1619;
        float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1625 = _390 + _1623;
        float _1627 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1629 = -_390;
        float _1631 = _1629 + _1607;
        float _1633 = _1621 * _1621;
        float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1637 = _392 + _1635;
        float _1639 = fma(_1625, _1625, _1633);
        float _1641 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1643 = fma(_1637, _1637, _1639);
        float _1645 = sqrt(_1643);
        float _1647 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1649 = precise::min(_1645, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1651 = _1649 * _1641;
        float _1653 = -_820;
        float _1655 = _1653 + _1609;
        float _1657 = _1647 * _1651;
        float _1659 = -_392;
        float _1661 = _1659 + _1605;
        float _1663 = fma(_1655, _1657, _820);
        float _1665 = fma(_1631, _1657, _390);
        float _1667 = fma(_1661, _1657, _392);
        _1611 = _1663;
        _1613 = _1665;
        _1617 = _1667;
    }
    float _1669 = _1611;
    float _1671 = _1613;
    float _1673 = _1617;
    float _1675 = _1431;
    if (!_1447)
    {
        int _1677 = _1555 + 400;
        uint _1679 = uint(int(uint(_1677) >> uint(2)));
        uint _1681 = uint(int(uint(int(_1679)) >> uint(2)));
        int _1683 = int(_1679) & 3;
        float _1685 = (*spvDescriptorSet0.vp_c15)._m0[int(_1681)][_1683];
        _1675 = _1685;
    }
    float _1687 = _1675;
    float _1689 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1691 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1693 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1695 = _1511 * _1509;
    float _1697 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1689);
    float _1699 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1691);
    float _1701 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1693);
    int _1703 = _1240 + 88;
    uint _1705 = uint(int(uint(_1703) >> uint(2)));
    uint _1707 = uint(int(uint(int(_1705)) >> uint(2)));
    int _1709 = int(_1705) & 3;
    float _1711 = (*spvDescriptorSet0.vp_c15)._m0[int(_1707)][_1709];
    int _1713 = int(_1705) + 1;
    uint _1715 = uint(int(uint(_1713) >> uint(2)));
    int _1717 = _1713 & 3;
    float _1719 = (*spvDescriptorSet0.vp_c15)._m0[int(_1715)][_1717];
    float _1721 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1697);
    bool _1723 = _1695 >= 0.0;
    float _1725 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1699);
    float _1727 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1701);
    float _1729 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1731 = _1721 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1733 = _1559 * _1509;
    bool _1735 = _1695 <= 1.0;
    bool _1737 = _1735 && _1723;
    float _1739 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1741 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1743 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1729);
    float _1745 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1747 = _1733 >= 0.0;
    bool _1749 = _1747 && _1737;
    float _1751 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1753 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1755 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1757 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1745);
    bool _1759 = _1733 <= 1.0;
    bool _1761 = _1759 && _1749;
    float _1763 = -_1753;
    float _1765 = fma(_1763, _1751, 1.0);
    float _1767 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1769 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1757);
    float _1771 = _1525;
    if (!_1447)
    {
        float _1773 = floor(_1283);
        _1771 = _1773;
    }
    float _1775 = _1771;
    float _1777 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1779 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1769);
    float _1783 = _1176 * _1467;
    float _1785 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1779);
    float _1787 = _1779;
    if (!_1447)
    {
        float _1789 = -_1543;
        float _1791 = _1246 + _1789;
        _1787 = _1791;
    }
    float _1793 = _1787;
    float _1795 = log2(_1765);
    if (_1761)
    {
        float _1797 = float(_1200);
        _1549 = _1797;
    }
    float _1799 = _1549;
    float _1801 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1777);
    float _1803 = fma(_390, _1459, _1783);
    float _1805 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1785);
    float _1807 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1801);
    float _1809 = 1.0 / _1781;
    float _1811 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1805);
    float _1813 = _1775;
    if (!_1447)
    {
        float _1815 = -_1775;
        float _1817 = _1283 + _1815;
        _1813 = _1817;
    }
    float _1819 = _1813;
    float _1821 = _1783;
    if (_1761)
    {
        float _1823 = rint(_1799);
        float _1825 = precise::max(_1823, 0.0);
        uint _1827 = uint(_1825);
        uint _1829 = clamp(_1827, 0u, 65535u);
        _1821 = as_type<float>(_1829);
    }
    float _1831 = _1821;
    float _1833 = _1795 * 0.693147182464599609375;
    float _1835 = fma(_392, _1711, _1803);
    float _1837 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1807);
    float _1839 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1841 = _1835 + _1719;
    float _1843 = _1687;
    float _1845 = _1837;
    if (!_1447)
    {
        float _1847 = rint(_1687);
        float _1849 = precise::max(_1847, 0.0);
        uint _1851 = uint(_1849);
        uint _1853 = clamp(_1851, 0u, 65535u);
        _1843 = as_type<float>(_1853);
    }
    float _1855 = _1843;
    float _1857 = _1837 * _1809;
    float _1859 = _1811 * _1809;
    float _1861 = _1841 * _1509;
    float _1863 = fma(_1857, 0.5, 0.5);
    float _1865 = fma(_1859, -0.5, 0.5);
    float _1867 = _1543;
    if (_1761)
    {
        float3 _5791 = float3(_1695, _1733, float(as_type<int>(_1831)));
        float3 _5795 = select(_5791, float3(0.0), isnan(_5791));
        float _1869 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5795.xy, uint(rint(_5795.z)), _1861, level(0.0));
        _1867 = _1869;
    }
    float _1871 = _1867;
    float3 _5805 = float3(_1863, _1865, _1839);
    float _1873 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5805, float3(0.0), isnan(_5805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5805, float3(0.0), isnan(_5805)), level(0.0)).x;
    float3 _5814 = float3(_1863, _1865, _1839);
    float4 _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5814, float3(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5814, float3(0.0), isnan(_5814)), level(0.0)).xyzw;
    float _1878 = _1876.x;
    float _1880 = _1876.y;
    float _1882 = _1876.z;
    float _1884 = _1876.w;
    float _1886 = _1246;
    if (!_1447)
    {
        float3 _5837 = float3(_1793, _1819, float(as_type<int>(_1855)));
        float3 _5839 = select(_5837, float3(0.0), isnan(_5837));
        float _1888 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5839.xy, uint(rint(_5839.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5839.xy, uint(rint(_5839.z)), level(0.0)).x;
        _1886 = _1888;
    }
    float _1890 = _1886;
    if (_1447)
    {
        _1485 = 1.0;
    }
    float _1892 = _1485;
    float _1894 = _1892;
    if (!_1447)
    {
        int _1896 = _1491 << 4;
        int _1898 = _1896 + 2048;
        uint _1900 = uint(int(uint(_1898) >> uint(2)));
        uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
        int _1904 = int(_1900) & 3;
        float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
        int _1908 = int(_1900) + 1;
        uint _1910 = uint(int(uint(_1908) >> uint(2)));
        int _1912 = _1908 & 3;
        float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
        int _1916 = _1898 + 8;
        uint _1918 = uint(int(uint(_1916) >> uint(2)));
        uint _1920 = uint(int(uint(int(_1918)) >> uint(2)));
        int _1922 = int(_1918) & 3;
        float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
        int _1926 = int(_1918) + 1;
        uint _1928 = uint(int(uint(_1926) >> uint(2)));
        int _1930 = _1926 & 3;
        float _1932 = (*spvDescriptorSet0.vp_c15)._m0[int(_1928)][_1930];
        float _1934 = _1176 * _1914;
        float _1936 = fma(_390, _1906, _1934);
        float _1938 = fma(_392, _1924, _1936);
        float _1940 = _1938 + _1932;
        float _1942 = precise::clamp(_1940, 0.0, 1.0);
        float _1944 = -_1942;
        float _1946 = _1944 + _1890;
        float _1948 = fma(_1946, 500.0, 1.5);
        float _1950 = exp2(_1948);
        float _1952 = 0.0 + _1950;
        float _1954 = precise::clamp(_1952, 0.0, 1.0);
        _1190 = _1934;
        _1894 = _1954;
    }
    float _1956 = _1190;
    float _1958 = _1894;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1962 = _1669 + _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1966 = _1671 + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1970 = _1673 + _1968;
    float _1972 = _1962 * _1962;
    float _1974 = fma(_1966, _1966, _1972);
    float _1976 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1978 = fma(_1970, _1970, _1974);
    float _1980 = precise::max(0.0, _1976);
    float _1982 = rsqrt(_1978);
    float _1984 = sqrt(_1978);
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1988 = _1966 * _1986;
    float _1990 = _1970 * _1986;
    float _1992 = -_1986;
    float _1994 = -_1980;
    float _1996 = fma(_1962, _1992, _1994);
    float _1998 = _1988 * _1988;
    float _2000 = _1990 * _1990;
    float _2002 = _1998 + _2000;
    float _2004 = sqrt(_2002);
    bool _2006 = _2004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2010 = _2004 + _2008;
    float _2012 = _1956;
    float _2014 = _1962;
    float _2016 = _2010;
    float _2018 = _1980;
    float _2020 = _1988;
    float _2022 = _1990;
    float _2024 = _1998;
    float _2026 = _2000;
    if (_2006)
    {
        float _2028 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2012 = _2028;
    }
    float _2030 = _2012;
    if (_2006)
    {
        float _2032 = _1996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2014 = _2032;
    }
    float _2034 = _2014;
    float _2036 = _2030;
    float _2038 = _2034;
    if (_2006)
    {
        float _2040 = _2010 * _2030;
        _2016 = _2040;
    }
    float _2042 = _2016;
    if (_2006)
    {
        float _2044 = rsqrt(_2002);
        _2036 = _2044;
    }
    float _2046 = _2036;
    float _2048 = _2046;
    if (_2006)
    {
        float _2050 = _2042 * 0.15915493667125701904296875;
        _616 = _2050;
    }
    float _2052 = _616;
    float _2054 = _392;
    if (_2006)
    {
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        _2054 = _2058;
    }
    float _2060 = _2054;
    float _2062 = _2042;
    if (_2006)
    {
        float _2064 = _2052 * 6.283185482025146484375;
        float _2066 = cos(_2064);
        _2062 = _2066;
    }
    float _2068 = _2062;
    float _2070 = _2060;
    if (_2006)
    {
        float _2072 = fma(_2060, _2034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = _2074;
    if (!_2006)
    {
        _2038 = _1996;
    }
    float _2078 = _2038;
    float _2080 = _2078;
    if (_2006)
    {
        float _2082 = _2046 * _2074;
        _2076 = _2082;
    }
    float _2084 = _2076;
    if (_2006)
    {
        float _2086 = _2068 + (-1.0);
        _2018 = _2086;
    }
    float _2088 = _2018;
    if (_2006)
    {
        float _2090 = _1988 * _2084;
        _2020 = _2090;
    }
    float _2092 = _2020;
    if (_2006)
    {
        float _2094 = _1990 * _2084;
        _2022 = _2094;
    }
    float _2096 = _2022;
    if (_2006)
    {
        float _2098 = _2088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2048 = _2098;
    }
    float _2100 = _2048;
    if (_2006)
    {
        float _2102 = _2092 * _2092;
        _2024 = _2102;
    }
    float _2104 = _2024;
    if (_2006)
    {
        float _2106 = _2096 * _2096;
        _2026 = _2106;
    }
    float _2108 = _2026;
    if (_2006)
    {
        float _2110 = fma(_1996, _2068, _2100);
        _2080 = _2110;
    }
    float _2112 = _2080;
    float _2114 = fma(_2112, _2112, _2104);
    float _2116 = _2114 + _2108;
    float _2118 = rsqrt(_2116);
    float _2120 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2122 = fma(_1984, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2120);
    float _2124 = precise::clamp(_2122, 0.0, 1.0);
    float _2126 = -_2124;
    float _2128 = _2126 + 1.0;
    float _2130 = _2118 * _2092;
    float _2132 = _2118 * _2112;
    float _2134 = _2118 * _2096;
    float _2136 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2138 = abs(_2128);
    float _2140 = log2(_2138);
    float _2142 = -_2136;
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2142);
    float _2146 = -_2134;
    float _2148 = fma(_2146, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2144);
    float _2150 = _2132 + 1.0;
    float _2152 = fma(_2148, -0.5, 0.5);
    float _2154 = fma(_2148, 0.5, 0.5);
    float _2156 = fma(_2154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2158 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2160 = sqrt(_2152);
    float _2162 = fma(_2154, _2156, -0.212114393711090087890625);
    float _2164 = fma(_2154, _2162, 1.570728778839111328125);
    float _2166 = exp2(_2158);
    float _2168 = _2160 * 0.636619746685028076171875;
    float _2170 = -_2164;
    float _2172 = fma(_2168, _2170, 1.0);
    float _2174 = -_2132;
    float _2176 = fma(_2166, _2150, _2174);
    float _2178 = fma(_2176, 0.5, 0.5);
    float2 _6287 = float2(_2172, _2178);
    float3 _2182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6287, float2(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6287, float2(0.0), isnan(_6287)), level(0.0)).xyz;
    float _2184 = _2182.x;
    float _2186 = _2182.y;
    float _2188 = _2182.z;
    float _2190 = in.m_69.w;
    float _2192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2194 = _424 > 0.5;
    float _2196 = in.m_77.y;
    int _2198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2200 = _2198 != 0;
    float _2202 = _1731 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2206 = _2204 != 0;
    float _2208 = in.m_77.x;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2212 = _2210 != 0;
    float _2214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2218 = _2216 != 0;
    float _2220 = fma(_1741, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2202);
    float _2222 = -_410;
    float _2224 = _2222 + 1.0;
    float _2226 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2228 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2234 = _2190 > 0.5;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2238 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2240 = -_2196;
    float _2242 = _2240 + 1.0;
    float _2244 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2246 = _2228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2248 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2250 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2252 = _2234 ? as_type<int>(_2242) : as_type<int>(_2196);
    int _2254 = 0;
    bool _2256 = _2234;
    float _2258 = _2196;
    bool _2260 = _2218;
    float _2262 = _2208;
    float _2264 = _2236;
    float _2266 = _2238;
    if (_2206)
    {
        float _2268 = -_2208;
        float _2270 = _2268 + 1.0;
        _2254 = as_type<int>(_2270);
    }
    int _2272 = _2254;
    float _2274 = as_type<float>(_2272);
    if (_2206)
    {
        bool _2276 = _442 > 0.5;
        _2256 = _2276;
    }
    bool _2278 = _2256;
    float _2280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2282 = _2218 ? as_type<float>(_2252) : _2196;
    out.m_79.x = _2246;
    out.m_79.y = _2248;
    out.m_79.z = _2250;
    out.m_79.w = _2244;
    if (_2200)
    {
        float _2284 = _2194 ? _2242 : _2196;
        _2258 = _2284;
    }
    float _2286 = _2258;
    int _2288 = 0;
    if (_2212)
    {
        float _2290 = -_2208;
        float _2292 = _2290 + 1.0;
        _2288 = as_type<int>(_2292);
    }
    int _2294 = _2288;
    float _2296 = as_type<float>(_2294);
    if (_2212)
    {
        bool _2298 = _416 > 0.5;
        _2260 = _2298;
    }
    bool _2300 = _2260;
    float _2302 = in.m_81.x;
    float _2304 = in.m_81.y;
    float _2306 = in.m_81.z;
    bool _2308 = _1104 != 0.0;
    bool _2310 = isnan(_1104);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2320 = in.m_83.x;
    float _2322 = in.m_83.y;
    float _2324 = in.m_83.z;
    float _2326 = in.m_83.w;
    bool _2328 = _1102 == 0.0;
    bool _2330 = !_2316;
    bool _2332 = _2328 && _2330;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2336 = 0.0;
    if (!_2206)
    {
        _2336 = _2208;
    }
    float _2338 = _2336;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2342 = _1106 == 0.0;
    bool _2344 = _2342 && _2332;
    float _2346 = _2334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _2338;
    if (_2206)
    {
        float _2350 = _2278 ? as_type<float>(_2272) : _2208;
        _2348 = _2350;
    }
    float _2352 = _2348;
    float _2354 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2356 = _2354;
    if (_2212)
    {
        float _2358 = _2300 ? as_type<float>(_2294) : _2208;
        _2262 = _2358;
    }
    float _2360 = _2262;
    out.m_85.x = _2346;
    out.m_85.y = _2354;
    out.m_85.z = _2238;
    out.m_85.w = _2236;
    float _2362 = 0.0;
    if (_2344)
    {
        _2362 = _2304;
    }
    float _2364 = _2362;
    float _2366 = _2364;
    if (_2344)
    {
        _2296 = _2306;
    }
    float _2368 = _2296;
    float _2370 = abs(_1144);
    float _2372 = log2(_2370);
    float _2374 = _2368;
    if (_2344)
    {
        _2356 = _2302;
    }
    float _2376 = _2356;
    float _2378 = _2376;
    if (_2344)
    {
        _2264 = _2364;
    }
    float _2380 = _2264;
    float _2382 = _2380;
    if (_2344)
    {
        _2274 = _2376;
    }
    float _2384 = _2274;
    float _2386 = _2384;
    if (!_2344)
    {
        _2378 = _2302;
    }
    float _2388 = _2378;
    float _2390 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2344)
    {
        _2366 = _2304;
    }
    float _2392 = _2366;
    float _2394 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2344)
    {
        _2266 = _2368;
    }
    float _2396 = _2266;
    float _2398 = _2396;
    if (!_2344)
    {
        float _2400 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2388);
        _2386 = _2400;
    }
    float _2402 = _2386;
    if (!_2344)
    {
        _2374 = _2306;
    }
    float _2404 = _2374;
    if (!_2344)
    {
        float _2406 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2392);
        _2382 = _2406;
    }
    float _2408 = _2382;
    float _2410 = _2352 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2412 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2414 = _2394 * _2192;
    float _2416 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2418 = _2390 * _2214;
    float _2420 = _2410 * _2280;
    float _2422 = _2324 * _2388;
    float _2424 = exp2(_2412);
    float _2426 = _2322 * _2404;
    float _2428 = _2320 * _2392;
    if (!_2344)
    {
        float _2430 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2404);
        _2398 = _2430;
    }
    float _2432 = _2398;
    float _2434 = -_2422;
    float _2436 = fma(_2320, _2404, _2434);
    float _2438 = -_2426;
    float _2440 = fma(_2324, _2392, _2438);
    float _2442 = -_2428;
    float _2444 = fma(_2322, _2388, _2442);
    float _2446 = _2436 * _2326;
    float _2448 = _2416 * _2318;
    float _2450 = _2440 * _2326;
    float _2452 = _2444 * _2326;
    float _2454 = -_2408;
    float _2456 = _1220 * _2454;
    float _2458 = -_2322;
    float _2460 = _1220 * _2458;
    float _2462 = -_2446;
    float _2464 = _1220 * _2462;
    float _2466 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    out.m_87.x = _2420;
    out.m_87.y = _2418;
    out.m_87.z = _2448;
    out.m_87.w = _2414;
    float _2470 = fma(_1208, _2402, _2456);
    float _2472 = fma(_1208, _2450, _2464);
    bool _2474 = _1144 <= 8000.0;
    bool _2476 = isnan(_1144);
    bool _2478 = _2474 || _2476;
    bool _2480 = isnan(8000.0);
    bool _2482 = _2478 || _2480;
    float _2484 = float(_2482);
    float _2486 = fma(_1208, _2320, _2460);
    float _2488 = fma(_2468, -2.0, 3.0);
    float _2490 = _2468 * _2468;
    float _2492 = fma(_1186, _2432, _2470);
    float _2494 = fma(_1186, _2324, _2486);
    float _2496 = fma(_1186, _2452, _2472);
    float _2498 = _2490 * _2488;
    float _2500 = _1244 * _2322;
    float _2502 = _1244 * _2408;
    float _2504 = _1224 * _2408;
    float _2506 = _1244 * _2446;
    float _2508 = _1224 * _2322;
    float _2510 = _1224 * _2446;
    float _2512 = fma(_1248, _2320, _2500);
    float _2514 = fma(_1248, _2402, _2502);
    float _2516 = fma(_1248, _2450, _2506);
    float _2518 = fma(_1277, _2402, _2504);
    float _2520 = fma(_1277, _2320, _2508);
    float _2522 = fma(_1277, _2450, _2510);
    float _2524 = fma(_1281, _2324, _2512);
    float _2526 = fma(_1281, _2432, _2514);
    float _2528 = fma(_1281, _2452, _2516);
    float _2530 = fma(_1252, _2432, _2518);
    float _2532 = fma(_1252, _2324, _2520);
    float _2534 = fma(_1252, _2452, _2522);
    float _2536 = _2524 * _316;
    float _2538 = _2524 * _320;
    float _2540 = _2526 * _324;
    float _2542 = _2524 * _324;
    float _2544 = _2528 * _324;
    float _2546 = _2526 * _316;
    float _2548 = fma(_2492, _294, _2540);
    float _2550 = fma(_2494, _294, _2542);
    float _2552 = fma(_2496, _294, _2544);
    float _2554 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2220);
    float _2556 = _2528 * _316;
    float _2558 = _2528 * _320;
    float _2560 = _2140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2562 = _2526 * _320;
    float _2564 = fma(_2494, _286, _2536);
    float _2566 = fma(_2494, _290, _2538);
    float _2568 = fma(_2496, _286, _2556);
    float _2570 = fma(_2496, _290, _2558);
    float _2572 = fma(_2492, _286, _2546);
    float _2574 = exp2(_2560);
    float _2576 = fma(_2532, _328, _2564);
    float _2578 = fma(_2532, _332, _2566);
    float _2580 = fma(_2534, _328, _2568);
    float _2582 = fma(_2534, _332, _2570);
    float _2584 = fma(_2532, _336, _2550);
    float _2586 = fma(_2534, _336, _2552);
    float _2588 = fma(_2530, _336, _2548);
    float _2590 = -_2498;
    float _2592 = _2590 + 1.0;
    float _2594 = fma(_2492, _290, _2562);
    out.m_89.x = _2576;
    out.m_89.y = _2578;
    out.m_89.z = _2584;
    float _2596 = fma(_2530, _328, _2572);
    float _2598 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2498);
    float _2600 = fma(_2530, _332, _2594);
    float _2602 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2554);
    float _2604 = _2484 * _2598;
    float _2606 = -_2574;
    float _2608 = _2606 + 1.0;
    if (!_1761)
    {
        _1845 = 1.0;
    }
    float _2610 = _1845;
    float _2612 = _2602 + _1781;
    float _2614 = _2610;
    if (_1761)
    {
        bool _2616 = _1871 >= _1861;
        bool _2618 = isnan(_1871);
        bool _2620 = _2616 || _2618;
        bool _2622 = isnan(_1861);
        bool _2624 = _2620 || _2622;
        float _2626 = float(_2624);
        _2614 = _2626;
    }
    float _2628 = _2614;
    float _2630 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2632 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2634 = _2612 * 0.5;
    float _2636 = _2628 * _1958;
    float _2638 = _2224 * _2632;
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2630 * _1873;
    float _2644 = -_2630;
    float _2646 = _2644 + 1.0;
    float _2648 = -_2640;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2652 = _1884 * _2642;
    float _2654 = _1884 * _2646;
    out.m_91.x = _2580;
    out.m_91.y = _2582;
    out.m_91.z = _2586;
    float _2656 = -_2636;
    float _2658 = fma(_2656, _2650, 1.0);
    float _2660 = precise::clamp(_2658, 0.0, 1.0);
    bool _2662 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2664 = isnan(_1984);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2670 = _2666 || _2668;
    out.m_93.x = 1.0;
    out.m_93.y = 1.0;
    out.m_93.z = 1.0;
    float _2672 = _2660 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1837;
    out.gl_Position.y = _1811;
    out.gl_Position.z = _2602;
    out.gl_Position.w = _1781;
    out.m_95.x = _2672;
    float _2674 = _2646;
    float _2676 = _2636;
    float _2678 = _2660;
    float _2680 = _2634;
    float _2682 = _2642;
    float _2684 = _2652;
    if (!_2670)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2686 = _2674;
    out.m_97.x = _2596;
    out.m_97.y = _2600;
    out.m_97.z = _2588;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2670)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2692 = _2676;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2670)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2698 = _2678;
    out.m_99.z = _2634;
    out.m_99.w = _1781;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2670)
    {
        _2680 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2704 = _2680;
    float _2706 = _2188 * _2642;
    float _2708 = fma(_2184, _2652, _1878);
    float _2710 = fma(_2186, _2652, _1880);
    float _2712 = _2704;
    float _2714 = _2704;
    if (!_2670)
    {
        _2682 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2716 = _2682;
    float _2718 = fma(_1884, _2706, _1882);
    float _2720 = _2716;
    float _2722 = _2716;
    if (!_2670)
    {
        _2684 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2724 = _2684;
    out.m_101.x = _2708;
    out.m_101.y = _2710;
    out.m_101.z = _2718;
    out.m_101.w = _2654;
    bool _2726 = !_2670;
    float _2728 = _2724;
    float _2730 = _2724;
    if (!_2726)
    {
        bool _2732 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2734 = isnan(_1984);
        bool _2736 = _2732 || _2734;
        bool _2738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2740 = _2736 || _2738;
        if (!_2740)
        {
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2744 = _1984 + _2742;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2748 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2746;
            float _2750 = 1.0 / _2748;
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2772 = _2744 * _2750;
            float _2774 = precise::clamp(_2772, 0.0, 1.0);
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2780 = fma(_2774, _2754, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2782 = fma(_2774, _2778, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2784 = fma(_2774, _2758, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2786 = fma(_2774, _2762, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2788 = fma(_2774, _2766, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2790 = fma(_2774, _2770, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2714 = _2780;
            _2730 = _2788;
            _2722 = _2782;
            _2696 = _2786;
            _2690 = _2784;
            _2702 = _2790;
            _2792 = true;
        }
        else
        {
            bool _2794 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2796 = isnan(_1984);
            bool _2798 = _2794 || _2796;
            bool _2800 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2802 = _2798 || _2800;
            if (!_2802)
            {
                _2720 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2804 = _2720;
            _2722 = _2804;
            if (!_2802)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2806 = _2712;
            _2714 = _2806;
            if (!_2802)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2808 = _2688;
            _2690 = _2808;
            if (!_2802)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2810 = _2694;
            _2696 = _2810;
            if (!_2802)
            {
                _2728 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2812 = _2728;
            _2730 = _2812;
            if (!_2802)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2814 = _2700;
            bool _2816 = !_2802;
            _2702 = _2814;
            if (!_2816)
            {
                bool _2818 = _1984 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2820 = isnan(_1984);
                bool _2822 = _2818 || _2820;
                bool _2824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2826 = _2822 || _2824;
                if (!_2826)
                {
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2830 = _1984 + _2828;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2834 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2832;
                    float _2836 = 1.0 / _2834;
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2858 = _2830 * _2836;
                    float _2860 = precise::clamp(_2858, 0.0, 1.0);
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2866 = fma(_2860, _2840, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2868 = fma(_2860, _2864, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2870 = fma(_2860, _2844, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2872 = fma(_2860, _2848, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2874 = fma(_2860, _2852, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2876 = fma(_2860, _2856, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2714 = _2866;
                    _2730 = _2874;
                    _2722 = _2868;
                    _2696 = _2872;
                    _2690 = _2870;
                    _2702 = _2876;
                    _2792 = true;
                }
                else
                {
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2730 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2722 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2792 = false;
    float _2878 = _2714;
    float _2880 = _2730;
    float _2882 = _2722;
    float _2884 = _2696;
    float _2886 = _2690;
    float _2888 = _2702;
    float _2890 = fma(_2600, -0.5, 0.5);
    float _2892 = precise::clamp(_2890, 0.0, 1.0);
    float _2894 = -_2878;
    float _2896 = _2894 + _2880;
    float _2898 = -_2882;
    float _2900 = _2898 + _2884;
    float _2902 = -_2886;
    float _2904 = _2902 + _2888;
    bool _2906 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2908 = fma(_2892, _2896, _2878);
    float _2910 = fma(_2892, _2900, _2882);
    float _2912 = fma(_2892, _2904, _2886);
    float _2914 = _2908 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2916 = fma(_2910, 0.298911988735198974609375, _2914);
    float _2918 = fma(_2912, 0.114477999508380889892578125, _2916);
    out.m_103.x = 0.0;
    float _2920 = -_2918;
    float _2922 = _2910 + _2920;
    float _2924 = -_2918;
    float _2926 = _2908 + _2924;
    float _2928 = -_2918;
    float _2930 = _2912 + _2928;
    float _2932 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2934 = fma(_2922, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    float _2936 = fma(_2926, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    float _2938 = fma(_2930, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2918);
    out.m_95.w = _2932;
    out.m_105.x = _2934;
    out.m_105.y = _2936;
    out.m_105.z = _2938;
    if (!_2906)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2940 = -_1669;
    float _2942 = _2940 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2944 = -_1671;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2948 = -_1673;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2952 = _2942 * _2942;
    float _2954 = fma(_2946, _2946, _2952);
    float _2956 = fma(_2950, _2950, _2954);
    float _2958 = sqrt(_2956);
    float _2960 = rsqrt(_2956);
    float _2962 = -_2958;
    float _2964 = _2962 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2966 = _2964 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = _2946 * _2960;
    float _2972 = _2942 * _2960;
    float _2974 = abs(_2968);
    float _2976 = log2(_2974);
    float _2978 = _2950 * _2960;
    float _2980 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2982 = _2600 * _2972;
    float _2984 = -_2972;
    float _2986 = -_2980;
    float _2988 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2986);
    float _2990 = fma(_2596, _2970, _2982);
    float _2992 = -_2978;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2988);
    float _2996 = fma(_2588, _2978, _2990);
    float _2998 = precise::clamp(_2996, 0.0, 1.0);
    float _3000 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3002 = _2994 + _3000;
    float _3004 = _2976 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3006 = _3002 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3008 = precise::clamp(_3006, 0.0, 1.0);
    float _3010 = exp2(_3004);
    float _3012 = _3010 * _3008;
    float _3014 = _2998 * _3012;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3018 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_103.x = _3016;
    out.m_103.y = _3018;
    out.m_103.z = _3020;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

