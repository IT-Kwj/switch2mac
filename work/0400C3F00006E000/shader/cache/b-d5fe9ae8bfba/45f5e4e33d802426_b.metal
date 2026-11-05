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
    float4 m_75 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3398 = false;
    bool _2161 = false;
    bool _786 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_58.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3683 = as_type<float>(_128);
        out.gl_Position.z = _3683;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_63.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3753 = as_type<float>(_166);
        out.gl_Position.z = _3753;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_65.w;
    float _170 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_63.x;
    float _184 = in.m_63.y;
    float _186 = in.m_63.z;
    float _188 = in.m_58.x;
    float _190 = in.m_58.y;
    float _192 = in.m_58.z;
    float _194 = 0.0;
    float _196 = _170;
    if (!_180)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    bool _210 = !_180;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _170 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _170);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_180;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _170 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _196 = _266;
    }
    float _268 = _196;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _182, _272);
    float _280 = fma(_268, _184, _274);
    float _282 = fma(_268, _186, _276);
    float _284 = fma(_278, _168, _188);
    float _286 = fma(_280, _168, _190);
    float _288 = fma(_282, _168, _192);
    bool _290 = !_270;
    float _308;
    if (!_290)
    {
        float _292 = in.m_67.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_112);
        float _314 = 1.0 / _312;
        float _316 = _146 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _318 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _336;
    float _340 = 1.0 / _330;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _354;
    float _358 = 1.0 / _334;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = _318 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = 1.0 / _338;
    float _374 = _362 * _340;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _318 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = _318 + _380;
    float _384 = fma(_366, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _388 = isnan(_318);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _348;
    float _400 = _378 * _358;
    bool _402 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _404 = isnan(_318);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_370, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = 1.0 / _352;
    float _428 = _382 * _372;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _432 = _318 + _430;
    float _434 = -_412;
    float _436 = _434 + 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = fma(_420, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _448 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _450 = isnan(_318);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = 1.0 / _356;
    bool _462 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _464 = isnan(_318);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = fma(_440, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _476 = fma(_444, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _482;
    float _486 = _472 * _436;
    float _488 = -_396;
    float _490 = _488 + 1.0;
    float _492 = 1.0 / _344;
    float _494 = _322 * _426;
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = fma(_480, _428, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = _458 * _490;
    float _504 = -_458;
    float _506 = _504 + 1.0;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _512 = _432 * _460;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _516 = _318 + _514;
    bool _518 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _520 = isnan(_318);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _516 * _398;
    bool _532 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _534 = isnan(_318);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _326 * _492;
    float _546 = -_528;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = _542 * _498;
    float _554 = -_542;
    float _556 = _554 + 1.0;
    bool _558 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _560 = isnan(_318);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _528 * _556;
    float _572 = _568 * _548;
    float _574 = -_568;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _578;
    float _582 = _396 * _576;
    float _584 = fma(_580, _428, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _586 = fma(_484, _428, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _588 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _590 = isnan(_318);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = _598 * _506;
    float _610 = -_598;
    float _612 = _610 + 1.0;
    float _614 = fma(_606, _494, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _616 = fma(_602, _494, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _618 = _384 * _608;
    float _620 = _474 * _608;
    float _622 = _424 * _608;
    float _624 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    float _626 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _620);
    float _628 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _622);
    float _630 = fma(_510, _494, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _632 = fma(_422, _502, _624);
    float _634 = fma(_476, _502, _626);
    float _636 = fma(_446, _502, _628);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _642 = fma(_584, _582, _632);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _644;
    float _648 = fma(_500, _582, _634);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _654 = fma(_586, _582, _636);
    float _656 = fma(_640, _530, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _658 = fma(_614, _572, _642);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _660;
    float _664 = in.m_65.x;
    float _666 = in.m_65.y;
    float _668 = in.m_65.z;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _670;
    float _674 = fma(_652, _530, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _676 = fma(_616, _572, _648);
    float _678 = fma(_630, _572, _654);
    float _680 = fma(_646, _544, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _682 = fma(_662, _544, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _684 = fma(_672, _544, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = fma(_680, _570, _658);
    float _692 = fma(_682, _570, _676);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _698;
    float _702 = fma(_688, _530, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _704;
    float _708 = fma(_684, _570, _678);
    float _710 = fma(_696, _512, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _712 = fma(_700, _512, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _714 = fma(_674, _552, _690);
    float _716 = fma(_706, _512, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _718 = fma(_656, _552, _692);
    float _720 = fma(_702, _552, _708);
    float _722 = fma(_710, _486, _714);
    float _724 = fma(_712, _486, _718);
    float _726 = fma(_716, _486, _720);
    float _728 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].x, _722);
    float _730 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].y, _724);
    float _732 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].z, _726);
    float _734 = _728 * _664;
    float _736 = _730 * _666;
    float _738 = _732 * _668;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _752 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _756 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _766 = !_550;
    float _784;
    if (!_766)
    {
        float _768 = in.m_67.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_112);
        float _790 = 1.0 / _788;
        float _792 = _146 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _798 = log2(_796);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _810 = 1.0 / _806;
    float _812 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _808);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _818 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = in.m_67.z;
    float _838 = 1.0 / _816;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _844 = in.m_67.y;
    float _846 = 1.0 / _822;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _852 = in.m_67.x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _862;
    float _866 = 1.0 / _842;
    float _868 = _856 * _810;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _886 = _836 * 2.0;
    float _888 = 1.0 / _850;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _892 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _894 = _860 * _846;
    float _896 = _798 * _146;
    float _898 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _890);
    float _900 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _892);
    float _902 = 1.0 / _884;
    float _904 = _864 * _866;
    float _906 = _872 * _838;
    float _908 = _844 * 2.0;
    float _910 = fma(_904, _802, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _912 = floor(_886);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _918 = _880 * _888;
    float _920 = _852 + _836;
    bool _922 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(1.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = 1.0 / _916;
    float _934 = _920 + (-1.0);
    float _936 = _876 * _902;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _940 = 1.0 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _942;
    bool _946 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _954 = _950 || _952;
    float _956 = exp2(_896);
    float _958 = _844 + _836;
    bool _960 = _912 > 0.0;
    float _962 = _836 + (-0.5);
    bool _964 = _912 >= 0.0;
    bool _966 = isnan(_912);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _958 + (-1.0);
    float _976 = _852 + _844;
    float _978 = 1.0 / _940;
    float _980 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = _852 * 2.0;
    float _984 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _986 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _988 = isnan(_794);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _944 * _932;
    bool _1000 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1002 = isnan(_794);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _976 + (-1.0);
    float _1014 = floor(_982);
    float _1016 = -_956;
    float _1018 = _1016 + 1.0;
    float _1020 = -_996;
    float _1022 = _1020 + 1.0;
    float _1024 = -_1010;
    float _1026 = _1024 + 1.0;
    int _1028 = _972 ? 0 : 1;
    float _1030 = _954 ? _1018 : 0.0;
    float _1032 = _1010 * _1022;
    float _1034 = floor(_908);
    bool _1036 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1038 = isnan(_794);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1050 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1052 = isnan(_794);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    if (_930)
    {
        float _1062 = _1030 * _978;
        _148 = _1062;
    }
    float _1064 = _148;
    bool _1066 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1068 = isnan(_794);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = -_1046;
    float _1080 = _1078 + 1.0;
    float _1082 = _1046 * _1026;
    bool _1084 = _1014 >= 0.0;
    bool _1086 = isnan(_1014);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan(0.0);
    bool _1092 = _1088 || _1090;
    float _1094 = _1060 * _1080;
    float _1096 = -_1060;
    float _1098 = _1096 + 1.0;
    bool _1100 = _1014 > 0.0;
    float _1102 = _1076 * _1098;
    float _1104 = -_1076;
    float _1106 = _1104 + 1.0;
    int _1108 = _1092 ? 0 : 1;
    float _1110 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _898);
    bool _1112 = _1034 > 0.0;
    float _1114 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _900);
    bool _1116 = _1034 >= 0.0;
    bool _1118 = isnan(_1034);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _812);
    bool _1128 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1130 = isnan(_794);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1142 = _794 + _1140;
    bool _1144 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1146 = isnan(_794);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    bool _1156 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1158 = isnan(_794);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -_1138;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_868, _1142, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1174 = _1154 * _1106;
    float _1176 = -_1154;
    float _1178 = _1176 + 1.0;
    float _1180 = _1166 * _1170;
    float _1182 = -_1166;
    float _1184 = _1182 + 1.0;
    float _1186 = rsqrt(_1126);
    float _1188 = _1138 * _1178;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1192 = _794 + _1190;
    float _1194 = _1172 * _1180;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1198 = _794 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1202 = _794 + _1200;
    float _1204 = fma(_894, _1192, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1208 = _794 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1212 = _794 + _1210;
    float _1214 = fma(_936, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1216 = _1124 ? 0 : 1;
    float _1218 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1194);
    float _1220 = fma(_998, _1212, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1222 = fma(_906, _1202, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1224 = ~_1216;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = fma(_1204, _1188, _1218);
    int _1232 = _1228;
    float _1234 = _1110;
    if (!_1112)
    {
        int _1236 = ~_1216;
        int _1238 = _1236 + 1;
        _1232 = _1238;
    }
    int _1240 = _1232;
    float _1242 = fma(_918, _1208, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1244 = !_826;
    int _1246 = _1244 ? 0 : 1;
    float _1248 = fma(_910, _1174, _1230);
    bool _1250 = !_830;
    int _1252 = _1250 ? 0 : 1;
    int _1254 = abs(_1246);
    float _1256 = fma(_1222, _1102, _1248);
    float _1258 = abs(_1114);
    bool _1260 = _1258 > 0.001000000047497451305389404296875;
    int _1262 = ~_1028;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = fma(_1214, _1094, _1256);
    int _1270 = abs(_1252);
    int _1272 = _1266;
    if (!_960)
    {
        int _1274 = ~_1028;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    float _1280 = fma(_1242, _1082, _1268);
    float _1282 = _1260 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1284 = fma(_1220, _1032, _1280);
    float _1286 = float(_1254);
    float _1288 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1290 = float(_1278);
    float _1292 = _1114 + _1282;
    bool _1294 = !_834;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1284);
    int _1300 = ~_1108;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = _1286 * _1290;
    int _1308 = abs(_1296);
    int _1310 = _1304;
    float _1312 = _1292;
    int _1314 = as_type<int>(_1288);
    if (!_1100)
    {
        int _1316 = ~_1108;
        int _1318 = _1316 + 1;
        _1310 = _1318;
    }
    int _1320 = _1310;
    float _1322 = _1306 * (-2.0);
    float _1324 = float(_1240);
    float _1326 = fma(_1048, _1322, _1048);
    float _1328 = abs(_1110);
    float _1330 = abs(_1292);
    float _1332 = precise::max(_1328, _1330);
    float _1334 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1336 = float(_1308);
    float _1338 = float(_1270);
    float _1340 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1342 = float(_1320);
    float _1344 = _1336 * _1324;
    bool _1346 = _1332 >= 16.0;
    float _1348 = _852 + (-0.5);
    float _1350 = _1338 * _1342;
    float _1352 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1356 = _1334 * _1334;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1360 = _1358 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1362 = _1350 * (-2.0);
    float _1364 = fma(_1326, _1064, _1354);
    float _1366 = fma(_1288, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1340);
    float _1368 = fma(_1298, _1360, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1370 = fma(_1288, _1288, _1356);
    float _1372 = fma(_980, _1362, _980);
    float _1374 = _844 + (-0.5);
    float _1376 = in.m_69.y;
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1366);
    float _1380 = _284 * _1368;
    float _1382 = fma(_1352, _1352, _1370);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1386 = _1344 * (-2.0);
    float _1388 = _1378 * _1380;
    float _1390 = fma(_1372, _1064, _1384);
    int _1392 = as_type<int>(_1342);
    if (_1346)
    {
        float _1394 = _1110 * 0.0625;
        _1234 = _1394;
    }
    float _1396 = _1234;
    float _1398 = fma(_1388, _1386, _1388);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1402 = _1400 != 0;
    if (_1346)
    {
        float _1404 = _1292 * 0.0625;
        _1312 = _1404;
    }
    float _1406 = _1312;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1410 = _1408 != 0;
    float _1412 = fma(_984, _1386, _984);
    float _1414 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1398);
    float _1416 = abs(_1396);
    bool _1418 = _1416 != 0.0;
    bool _1420 = isnan(_1416);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.0);
    bool _1426 = _1422 || _1424;
    float _1428 = in.m_71.x;
    float _1430 = in.m_71.y;
    float _1432 = in.m_71.z;
    bool _1434 = _844 > 0.5;
    float _1436 = fma(_1412, _1064, _1414);
    float _1438 = abs(_1406);
    bool _1440 = _1438 == 0.0;
    bool _1442 = !_1426;
    bool _1444 = _1440 && _1442;
    float _1446 = _1364 * 0.15915493667125701904296875;
    float _1448 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1450 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1452 = -_1376;
    float _1454 = _1452 + 1.0;
    float _1456 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1458 = rsqrt(_1382);
    float _1460 = _1390 * 0.15915493667125701904296875;
    float _1462 = _1436 * 0.15915493667125701904296875;
    float _1464 = _1376;
    bool _1466 = _1434;
    if (_1410)
    {
        float _1468 = _1434 ? _1454 : _1376;
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1450);
    float _1474 = abs(_1406);
    bool _1476 = _1474 == 0.0;
    if (_1444)
    {
        bool _1478 = as_type<int>(_1406) >= 0;
        _1466 = _1478;
    }
    bool _1480 = _1466;
    float _1482 = _1446 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1448);
    bool _1488 = _852 > 0.5;
    bool _1490 = _1488 && _1402;
    int _1492 = _1480 ? (-1) : 0;
    if (_1444)
    {
        int _1494 = _1480 ? 0 : 1078530011;
        _1392 = _1494;
    }
    int _1496 = _1392;
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1430);
    float _1500 = _1446 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1432);
    float _1506 = _1288 * _1458;
    float _1508 = _1352 * _1458;
    float _1510 = _1460 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    float _1514 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1456);
    float _1516 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1518 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1520 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1428);
    float _1522 = _1460 * 6.283185482025146484375;
    float _1524 = cos(_1522);
    float _1526 = _1516 * _1520;
    float _1528 = _818 * _1498;
    float _1530 = _1518 * _1504;
    float _1532 = _1334 * _1458;
    float _1534 = _1518;
    if (_1444)
    {
        int _1536 = int(0x80000000) & as_type<int>(_1396);
        int _1538 = _1496 | _1536;
        _1534 = as_type<float>(_1538);
    }
    float _1540 = _1534;
    float _1542 = _1462 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1462 * 6.283185482025146484375;
    float _1548 = cos(_1546);
    bool _1550 = !_1426;
    bool _1552 = _1550 && _1476;
    float _1554 = _1540;
    float _1556 = _1540;
    if (!_1552)
    {
        float _1558 = abs(_1396);
        bool _1560 = _1558 != as_type<float>(0x7f800000u /* inf */);
        bool _1562 = isnan(_1558);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1568 = _1564 || _1566;
        float _1570 = abs(_1406);
        bool _1572 = _1570 == as_type<float>(0x7f800000u /* inf */);
        float _1574 = abs(_1406);
        bool _1576 = _1574 == as_type<float>(0x7f800000u /* inf */);
        bool _1578 = !_1568;
        bool _1580 = _1576 && _1578;
        if (_1580)
        {
            bool _1582 = as_type<int>(_1406) >= 0;
            _1492 = _1582 ? (-1) : 0;
        }
        int _1584 = _1492;
        if (_1580)
        {
            _1314 = 1075235812;
        }
        int _1586 = _1314;
        int _1588 = _1586;
        if (_1580)
        {
            int _1590 = ~_1584;
            int _1592 = (_1590 != 0) ? _1586 : 1061752795;
            _1588 = _1592;
        }
        int _1594 = _1588;
        if (_1580)
        {
            int _1596 = int(0x80000000) & as_type<int>(_1396);
            int _1598 = _1594 | _1596;
            _1554 = as_type<float>(_1598);
        }
        float _1600 = _1554;
        bool _1602 = !_1568;
        bool _1604 = _1602 && _1572;
        _1556 = _1600;
        if (!_1604)
        {
            float _1606 = abs(_1396);
            float _1608 = abs(_1406);
            float _1610 = precise::max(_1606, _1608);
            float _1612 = abs(_1396);
            float _1614 = abs(_1406);
            float _1616 = precise::min(_1612, _1614);
            float _1618 = 1.0 / _1610;
            float _1620 = abs(_1396);
            float _1622 = abs(_1406);
            bool _1624 = _1620 > _1622;
            bool _1626 = as_type<int>(_1406) >= 0;
            float _1628 = _1616 * _1618;
            float _1630 = _1628 * _1628;
            float _1632 = _1630 + 11.33538818359375;
            float _1634 = fma(_1630, _1632, 28.84246826171875);
            float _1636 = fma(_1630, _1634, 19.6966705322265625);
            float _1638 = fma(_1630, -0.82336294651031494140625, -5.674867153167724609375);
            float _1640 = fma(_1630, _1638, -6.565555095672607421875);
            float _1642 = 1.0 / _1636;
            float _1644 = _1630 * _1640;
            float _1646 = abs(_1396);
            float _1648 = abs(_1406);
            float _1650 = _1646 + _1648;
            float _1652 = _1628 * _1644;
            bool _1654 = _1650 > as_type<float>(0x7f800000u /* inf */);
            bool _1656 = isnan(_1650);
            bool _1658 = _1654 || _1656;
            bool _1660 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1662 = _1658 || _1660;
            float _1664 = fma(_1652, _1642, _1628);
            int _1666 = as_type<int>(_1396) & int(0x80000000);
            float _1668 = _1664;
            _1556 = _1650;
            if (_1624)
            {
                float _1670 = -_1664;
                float _1672 = _1670 + 1.57079637050628662109375;
                _1668 = _1672;
            }
            float _1674 = _1668;
            int _1676 = as_type<int>(_1674);
            if (!_1626)
            {
                float _1678 = -_1674;
                float _1680 = _1678 + 3.1415927410125732421875;
                _1676 = as_type<int>(_1680);
            }
            int _1682 = _1676;
            if (!_1662)
            {
                int _1684 = _1666 | _1682;
                _1556 = as_type<float>(_1684);
            }
        }
    }
    float _1686 = _1556;
    float _1688 = _1484 * _1512;
    float _1690 = _1502 * _1524;
    float _1692 = _1502 * _1512;
    float _1694 = _1484 * _1524;
    float _1696 = _1502 * _1548;
    float _1698 = _1686 * (-0.15915493667125701904296875);
    float _1700 = _1484 * _1548;
    float _1702 = _1524 * _1548;
    float _1704 = fma(_1544, _1690, _1688);
    float _1706 = -_1528;
    float _1708 = _1544 * _1706;
    float _1710 = _1512 * _1548;
    float _1712 = fma(_1544, _1688, _1690);
    float _1714 = _1696 * _1528;
    float _1716 = _1698 * 6.283185482025146484375;
    float _1718 = cos(_1716);
    float _1720 = -_1694;
    float _1722 = fma(_1544, _1692, _1720);
    float _1724 = -_1692;
    float _1726 = fma(_1544, _1694, _1724);
    float _1728 = _1700 * _1528;
    float _1730 = fma(_1702, _1526, _1708);
    float _1732 = fma(_1704, _1526, _1714);
    bool _1734 = _1430 != 0.0;
    bool _1736 = isnan(_1430);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = fma(_1726, _1526, _1728);
    float _1746 = _1698 * 6.283185482025146484375;
    float _1748 = sin(_1746);
    float _1750 = fma(_1722, _1530, _1732);
    float _1752 = fma(_1710, _1530, _1730);
    float _1754 = fma(_1712, _1530, _1744);
    bool _1756 = _1428 == 0.0;
    bool _1758 = !_1742;
    bool _1760 = _1756 && _1758;
    float _1762 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1766 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1768 = -_1718;
    float _1770 = _1768 + 1.0;
    float _1772 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1762);
    float _1774 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1764);
    float _1776 = _1508 * _1508;
    float _1778 = _1506 * _1770;
    float _1780 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1772);
    float _1782 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1766);
    float _1784 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1774);
    float _1786 = _1508 * _1748;
    float _1788 = fma(_1770, _1776, _1718);
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1792 = _1506 * _1748;
    float _1794 = -_1786;
    float _1796 = fma(_1532, _1778, _1794);
    float _1798 = _1532 * _1770;
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1782);
    float _1802 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1804 = fma(_1506, _1778, _1718);
    float _1806 = _1790 * _1796;
    float _1808 = in.m_73.x;
    float _1810 = in.m_73.y;
    float _1812 = in.m_73.z;
    float _1814 = _1532 * _1748;
    float _1816 = fma(_1508, _1798, _1792);
    float _1818 = fma(_1802, _1804, _1806);
    float _1820 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1822 = -_1814;
    float _1824 = fma(_1508, _1778, _1822);
    float _1826 = _1790 * _1816;
    float _1828 = fma(_1508, _1778, _1814);
    float _1830 = in.m_69.x;
    bool _1832 = _1432 == 0.0;
    bool _1834 = _1832 && _1760;
    float _1836 = fma(_1802, _1824, _1826);
    float _1838 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1486);
    float _1840 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1514);
    float _1842 = fma(_1820, _1828, _1818);
    float _1844 = fma(_1820, _1788, _1836);
    float _1846 = _1838 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1848 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1850 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1472);
    float _1852 = fma(_1532, _1778, _1786);
    float _1854 = _1846 + _1842;
    float _1856 = _1848 + _1844;
    float _1858 = fma(_1532, _1798, _1718);
    float _1860 = -_1792;
    float _1862 = fma(_1508, _1798, _1860);
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1866 = _1854 + _1864;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1870 = _1856 + _1868;
    float _1872 = _1810;
    float _1874 = _1812;
    float _1876 = _1816;
    float _1878 = _1808;
    float _1880 = _1726;
    if (!_1834)
    {
        float _1882 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1810);
        _1872 = _1882;
    }
    float _1884 = _1872;
    if (!_1834)
    {
        float _1886 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1812);
        _1874 = _1886;
    }
    float _1888 = _1874;
    float _1890 = _1866 * _1866;
    float _1892 = _1870 * _1870;
    float _1894 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1896 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1898 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1900 = _1890 + _1892;
    float _1902 = _1830;
    float _1904 = _1892;
    float _1906 = _1890;
    if (_1402)
    {
        _1876 = _1830;
    }
    float _1908 = _1876;
    float _1910 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1914 = sqrt(_1900);
    float _1916 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1918 = _1908;
    if (_1490)
    {
        float _1920 = -_1908;
        float _1922 = _1920 + 1.0;
        _1918 = _1922;
    }
    float _1924 = _1918;
    if (!_1834)
    {
        float _1926 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1808);
        _1878 = _1926;
    }
    float _1928 = _1878;
    float _1930 = -_1544;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1894);
    float _1934 = -_1544;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1938 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    if (_1402)
    {
        _1902 = _1924;
    }
    float _1940 = _1902;
    float _1942 = -_1544;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1898);
    float _1946 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    float _1948 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1916);
    float _1950 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1952 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1954 = _1790 * _1858;
    float _1956 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1958 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1950);
    bool _1960 = _1914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1962 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1952);
    float _1964 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1956);
    float _1966 = fma(_1802, _1852, _1954);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1970 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1932);
    float _1972 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1936);
    float _1974 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1944);
    float _1976 = fma(_1820, _1862, _1966);
    float _1978 = _1850 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1980 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1938);
    float _1982 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1946);
    float _1984 = _1978 + _1976;
    float _1986 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1948);
    float _1988 = _1966;
    float _1990 = _1976;
    uint _1993 = as_type<uint>(_1978);
    if (!_1960)
    {
        _1880 = _1892;
    }
    float _1995 = _1880;
    float _1997 = _1995;
    if (!_1960)
    {
        _1904 = _1854;
    }
    float _1999 = _1904;
    float _2001 = _1999;
    if (!_1960)
    {
        _1988 = _1856;
    }
    float _2003 = _1988;
    float _2005 = _2003;
    if (!_1960)
    {
        _1990 = _1984;
    }
    float _2007 = _1990;
    bool _2009 = !_1960;
    float _2011 = _2007;
    if (!_2009)
    {
        float _2013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2017 = _1914 + _2015;
        float _2019 = rsqrt(_1900);
        float _2021 = _2017 * _2013;
        float _2023 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2025 = _2021 * 0.15915493667125701904296875;
        float _2027 = _2025 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = _2025 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = fma(_2029, _2023, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2037 = _2019 * _2035;
        float _2039 = _2033 + (-1.0);
        float _2041 = fma(_1866, _2037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2043 = fma(_1870, _2037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2045 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2049 = _2041 + _2047;
        float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2053 = _2043 + _2051;
        float _2055 = fma(_1984, _2033, _2045);
        float _2057 = _2049 * _2049;
        float _2059 = _2053 * _2053;
        _2011 = _2055;
        _1906 = _2057;
        _1997 = _2059;
        _2001 = _2041;
        _2005 = _2043;
    }
    float _2061 = _2011;
    float _2063 = _1906;
    float _2065 = _1997;
    float _2067 = _2001;
    float _2069 = _2005;
    float _2071 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1958);
    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2075 = _2061 + _2073;
    float _2077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2079 = _1970 * _1884;
    float _2081 = _1972 * _1884;
    float _2083 = fma(_2075, _2075, _2063);
    float _2085 = _1974 * _1884;
    float _2087 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1962);
    float _2089 = fma(_1980, _1928, _2079);
    float _2091 = _2083 + _2065;
    float _2093 = fma(_1982, _1928, _2081);
    float _2095 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2097 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1964);
    float _2099 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2101 = fma(_1986, _1928, _2085);
    float _2103 = sqrt(_2091);
    float _2105 = _2095 * _1968;
    float _2107 = fma(_2071, _1888, _2089);
    float _2109 = fma(_2087, _1888, _2093);
    float _2111 = _2099 * _2077;
    float _2113 = fma(_2097, _1888, _2101);
    out.m_75.x = _752;
    out.m_75.y = _756;
    out.m_75.z = _758;
    out.m_75.w = _754;
    out.m_77.x = _760;
    out.m_77.y = _762;
    out.m_77.z = _764;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    bool _2115 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2117 = isnan(_2103);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2123 = _2119 || _2121;
    out.m_81.x = _2105;
    out.m_81.y = _2111;
    out.m_83.x = _2107;
    out.m_83.y = _2109;
    out.m_83.z = _2113;
    float _2125 = _2099;
    if (!_2123)
    {
        _2125 = 1.0;
    }
    float _2127 = _2125;
    bool _2129 = !_2123;
    float _2131 = _2127;
    if (!_2129)
    {
        bool _2133 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2135 = isnan(_2103);
        bool _2137 = _2133 || _2135;
        bool _2139 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2141 = _2137 || _2139;
        if (!_2141)
        {
            float _2143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2145 = _2103 + _2143;
            float _2147 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2149 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2147;
            float _2151 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2153 = _2151 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2155 = 1.0 / _2149;
            float _2157 = _2145 * _2155;
            float _2159 = fma(_2157, _2153, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2131 = _2159;
            _2161 = true;
        }
        else
        {
            bool _2163 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2165 = isnan(_2103);
            bool _2167 = _2163 || _2165;
            bool _2169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2171 = _2167 || _2169;
            if (!_2171)
            {
                float _2173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2175 = _2103 + _2173;
                float _2177 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2179 = _2177 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2181 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2183 = _2181 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2185 = 1.0 / _2179;
                float _2187 = _2175 * _2185;
                float _2189 = fma(_2187, _2183, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2131 = _2189;
                _2161 = true;
            }
            else
            {
                _2131 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2161 = false;
    float _2191 = _2131;
    float _2193 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2195 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2197 = floor(_2193);
    float _2199 = floor(_2195);
    float _2201 = -_2197;
    float _2203 = _2193 + _2201;
    float _2205 = -_2199;
    float _2207 = _2195 + _2205;
    float2 _7042 = float2(_2203, _2207);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7042, float2(0.0), isnan(_7042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7042, float2(0.0), isnan(_7042)), level(0.0)).x;
    float _2211 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2213 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2215 = _2067 + _2213;
    float _2217 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    float _2219 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2221 = _2069 + _2219;
    float _2223 = fma(_2215, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2225 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2217);
    float _2227 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2229 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.5);
    bool _2237 = _2233 || _2235;
    float _2239 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2241 = _2061 + _2239;
    float _2243 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2245 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2227);
    float _2247 = fma(_2221, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2249 = fma(_2241, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2251 = 1.0 / _2243;
    float _2253 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2245);
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2257 = _2241;
    float _2259 = _2191;
    int _2261 = 2;
    float _2263 = _2223;
    int _2265 = as_type<int>(_2249);
    if (_2237)
    {
        _2257 = _2249;
    }
    float _2267 = _2257;
    float _2269 = _2255 + _2243;
    float _2271 = _2267;
    if (_2237)
    {
        _2259 = _2247;
    }
    float _2273 = _2259;
    float _2275 = _2269 * _2251;
    float _2277 = _2275 * 0.5;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2279);
    float _2283 = 1.0 / _2281;
    float _2285 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2287 = _1978 + _2285;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2291 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2289);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2295 = _2283 * _2293;
    float _2297 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2299 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2291);
    bool _2301 = _2295 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2303 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2297);
    bool _2305 = _2295 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2307 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2309 = !_2301;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2303);
    float _2315 = trunc(_2307);
    int _2317 = int(_2315);
    float _2319 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2321 = _2273;
    float _2323 = _2287;
    if (!_2301)
    {
        _2261 = 1;
    }
    int _2325 = _2261;
    int _2327 = _2325;
    if (!_2305)
    {
        _2327 = _2311;
    }
    int _2329 = _2327;
    float _2331 = trunc(_2319);
    int _2333 = int(_2331);
    int _2335 = _2329 << 6;
    int _2337 = _2335 + 48;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2357 = _2317 + _2355;
    int _2359 = _2357 + 1;
    bool _2361 = _2359 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2363 = _2335 + 56;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    uint _2367 = uint(int(uint(int(_2365)) >> uint(2)));
    int _2369 = int(_2365) & 3;
    float _2371 = (*spvDescriptorSet0.vp_c15)._m0[int(_2367)][_2369];
    int _2373 = int(_2365) + 1;
    uint _2375 = uint(int(uint(_2373) >> uint(2)));
    int _2377 = _2373 & 3;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[int(_2375)][_2377];
    int _2381 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2383 = _2333 + _2381;
    int _2385 = _2383 + 1;
    int _2387 = _2359 | _2385;
    int _2389 = _2335 + 64;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    uint _2393 = uint(int(uint(int(_2391)) >> uint(2)));
    int _2395 = int(_2391) & 3;
    float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
    int _2399 = int(_2391) + 1;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    int _2403 = _2399 & 3;
    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[int(_2401)][_2403];
    bool _2407 = _2387 < 0;
    bool _2409 = _2407 || _2361;
    float _2411 = as_type<float>(_2387);
    float _2413 = as_type<float>(_2329);
    if (_2237)
    {
        _2411 = _2223;
    }
    float _2415 = _2411;
    bool _2417 = _2385 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2419 = _2417 || _2409;
    int _2421 = _2335 + 72;
    uint _2423 = uint(int(uint(_2421) >> uint(2)));
    uint _2425 = uint(int(uint(int(_2423)) >> uint(2)));
    int _2427 = int(_2423) & 3;
    float _2429 = (*spvDescriptorSet0.vp_c15)._m0[int(_2425)][_2427];
    int _2431 = int(_2423) + 1;
    uint _2433 = uint(int(uint(_2431) >> uint(2)));
    int _2435 = _2431 & 3;
    float _2437 = (*spvDescriptorSet0.vp_c15)._m0[int(_2433)][_2435];
    int _2439 = _2335 + 96;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    uint _2443 = uint(int(uint(int(_2441)) >> uint(2)));
    int _2445 = int(_2441) & 3;
    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[int(_2443)][_2445];
    int _2449 = int(_2441) + 1;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    int _2453 = _2449 & 3;
    float _2455 = (*spvDescriptorSet0.vp_c15)._m0[int(_2451)][_2453];
    int _2457 = _2335 + 104;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    uint _2461 = uint(int(uint(int(_2459)) >> uint(2)));
    int _2463 = int(_2459) & 3;
    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[int(_2461)][_2463];
    int _2467 = int(_2459) + 1;
    uint _2469 = uint(int(uint(_2467) >> uint(2)));
    int _2471 = _2467 & 3;
    float _2473 = (*spvDescriptorSet0.vp_c15)._m0[int(_2469)][_2471];
    float _2475 = _2415;
    int _2477 = as_type<int>(_2465);
    if (!_2237)
    {
        float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2481 = _1978 + _2479;
        float _2483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2485 = _1846 + _2483;
        float _2487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2489 = _2481 * _2481;
        float _2491 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2493 = _1848 + _2491;
        float _2495 = fma(_2485, _2485, _2489);
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2499 = fma(_2493, _2493, _2495);
        float _2501 = sqrt(_2499);
        float _2503 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2505 = precise::min(_2501, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2507 = _2505 * _2497;
        float _2509 = -_1978;
        float _2511 = _2509 + _2249;
        float _2513 = -_1846;
        float _2515 = _2513 + _2223;
        float _2517 = -_1848;
        float _2519 = _2517 + _2247;
        float _2521 = _2503 * _2507;
        float _2523 = fma(_2511, _2521, _1978);
        float _2525 = fma(_2515, _2521, _1846);
        float _2527 = fma(_2519, _2521, _1848);
        _2271 = _2523;
        _2475 = _2525;
        _2321 = _2527;
        _2263 = _2519;
    }
    float _2529 = _2271;
    float _2531 = _2475;
    float _2533 = _2321;
    float _2535 = _2263;
    float _2537 = _2287 * _2455;
    if (!_2419)
    {
        int _2539 = _2385 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2541 = _2539 + _2359;
        _1993 = uint(_2541);
    }
    uint _2543 = _1993;
    float _2545 = _2287 * _2405;
    float _2547 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2549 = fma(_1846, _2447, _2537);
    float _2551 = _2287 * _2353;
    if (!_2419)
    {
        uint _2553 = uint(int(uint(int(_2543)) >> uint(2)));
        _2265 = int(_2553);
    }
    int _2555 = _2265;
    float _2557 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2547);
    float _2559 = fma(_1848, _2465, _2549);
    int _2561 = _2555;
    if (!_2419)
    {
        int _2563 = int(_2543) << 2;
        _2477 = _2563;
    }
    int _2565 = _2477;
    float _2567 = fma(_1846, _2345, _2551);
    float _2569 = fma(_1846, _2397, _2545);
    float _2571 = _2559 + _2473;
    int _2573 = _2335 + 80;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    uint _2577 = uint(int(uint(int(_2575)) >> uint(2)));
    int _2579 = int(_2575) & 3;
    float _2581 = (*spvDescriptorSet0.vp_c15)._m0[int(_2577)][_2579];
    int _2583 = int(_2575) + 1;
    uint _2585 = uint(int(uint(_2583) >> uint(2)));
    int _2587 = _2583 & 3;
    float _2589 = (*spvDescriptorSet0.vp_c15)._m0[int(_2585)][_2587];
    int _2591 = _2565;
    if (!_2419)
    {
        int _2593 = 12 & _2565;
        _2591 = _2593;
    }
    int _2595 = _2591;
    float _2597 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2557);
    float _2599 = fma(_1848, _2371, _2567);
    float _2601 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2603 = 1.0 / _2571;
    if (!_2419)
    {
        int _2605 = _2555 << 4;
        int _2607 = _2605 + _2595;
        _2561 = _2607;
    }
    int _2609 = _2561;
    float _2611 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2613 = _2335 + 88;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c15)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c15)._m0[int(_2625)][_2627];
    float _2631 = fma(_1848, _2429, _2569);
    float _2633 = _2599 + _2379;
    float _2635 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2637 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2639 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2641 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2643 = -_2635;
    float _2645 = fma(_2643, _2601, 1.0);
    float _2647 = _2535;
    float _2649 = _2633;
    if (!_2419)
    {
        int _2651 = _2609 + 400;
        uint _2653 = uint(int(uint(_2651) >> uint(2)));
        uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
        int _2657 = int(_2653) & 3;
        float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
        _2647 = _2659;
    }
    float _2661 = _2647;
    float _2663 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2637);
    float _2665 = _2631 + _2437;
    float _2667 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2639);
    float _2669 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2641);
    float _2671 = _2633 * _2603;
    float _2673 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2663);
    float _2675 = _2665 * _2603;
    float _2677 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2667);
    float _2679 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2669);
    bool _2681 = _2671 >= 0.0;
    float _2683 = _2673 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2687 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2689 = _2671 <= 1.0;
    bool _2691 = _2689 && _2681;
    float _2693 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2695 = log2(_2645);
    float _2697 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2699 = _2675 >= 0.0;
    bool _2701 = _2699 && _2691;
    float _2703 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2693);
    float _2705 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2697);
    bool _2707 = _2675 <= 1.0;
    bool _2709 = _2707 && _2701;
    float _2711 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2703);
    float _2713 = _2645;
    if (!_2419)
    {
        float _2715 = floor(_2319);
        _2713 = _2715;
    }
    float _2717 = _2713;
    float _2719 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2721 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2705);
    float _2723 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2711);
    float _2725 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2719);
    float _2727 = 1.0 / _2723;
    float _2729 = _2287 * _2589;
    float _2731 = _2695 * 0.693147182464599609375;
    float _2733 = _2589;
    float _2735 = _2723;
    if (_2709)
    {
        float _2737 = float(_2329);
        _2649 = _2737;
    }
    float _2739 = _2649;
    float _2741 = fma(_1846, _2581, _2729);
    float _2743 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2725);
    float _2745 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2721);
    float _2747 = _2665;
    if (!_2419)
    {
        float _2749 = floor(_2307);
        _2747 = _2749;
    }
    float _2751 = _2747;
    float _2753 = fma(_1848, _2621, _2741);
    float _2755 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2743);
    float _2757 = _2717;
    float _2759 = _2629;
    if (!_2419)
    {
        float _2761 = -_2717;
        float _2763 = _2319 + _2761;
        _2757 = _2763;
    }
    float _2765 = _2757;
    float _2767 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2769 = _2753 + _2629;
    float _2771 = _2739;
    if (_2709)
    {
        float _2773 = rint(_2739);
        float _2775 = precise::max(_2773, 0.0);
        uint _2777 = uint(_2775);
        uint _2779 = clamp(_2777, 0u, 65535u);
        _2771 = as_type<float>(_2779);
    }
    float _2781 = _2771;
    float _2783 = _2755 * _2727;
    float _2785 = _2745 * _2727;
    float _2787 = _2769 * _2603;
    float _2789 = fma(_2783, 0.5, 0.5);
    float _2791 = fma(_2785, -0.5, 0.5);
    float _2793 = _2621;
    float _2795 = _2791;
    float _2797 = _2787;
    if (!_2419)
    {
        float _2799 = rint(_2661);
        float _2801 = precise::max(_2799, 0.0);
        uint _2803 = uint(_2801);
        uint _2805 = clamp(_2803, 0u, 65535u);
        _2793 = as_type<float>(_2805);
    }
    float _2807 = _2793;
    if (!_2419)
    {
        float _2809 = -_2751;
        float _2811 = _2307 + _2809;
        _2759 = _2811;
    }
    float _2813 = _2759;
    float _2815 = _2781;
    if (_2709)
    {
        float3 _8071 = float3(_2671, _2675, float(as_type<int>(_2781)));
        float3 _8075 = select(_8071, float3(0.0), isnan(_8071));
        float _2817 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8075.xy, uint(rint(_8075.z)), _2787, level(0.0));
        _2815 = _2817;
    }
    float _2819 = _2815;
    float3 _8085 = float3(_2789, _2791, _2767);
    float _2821 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8085, float3(0.0), isnan(_8085)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8085, float3(0.0), isnan(_8085)), level(0.0)).x;
    float3 _8094 = float3(_2789, _2791, _2767);
    float4 _2824 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8094, float3(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8094, float3(0.0), isnan(_8094)), level(0.0)).xyzw;
    float _2826 = _2824.x;
    float _2828 = _2824.y;
    float _2830 = _2824.z;
    float _2832 = _2824.w;
    float _2834 = _2813;
    if (!_2419)
    {
        float3 _8117 = float3(_2813, _2765, float(as_type<int>(_2807)));
        float3 _8119 = select(_8117, float3(0.0), isnan(_8117));
        float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8119.xy, uint(rint(_8119.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8119.xy, uint(rint(_8119.z)), level(0.0)).x;
        _2834 = _2836;
    }
    float _2838 = _2834;
    if (_2419)
    {
        _2733 = 1.0;
    }
    float _2840 = _2733;
    float _2842 = _2840;
    if (!_2419)
    {
        int _2844 = int(_2543) << 4;
        int _2846 = _2844 + 2048;
        uint _2848 = uint(int(uint(_2846) >> uint(2)));
        uint _2850 = uint(int(uint(int(_2848)) >> uint(2)));
        int _2852 = int(_2848) & 3;
        float _2854 = (*spvDescriptorSet0.vp_c15)._m0[int(_2850)][_2852];
        int _2856 = int(_2848) + 1;
        uint _2858 = uint(int(uint(_2856) >> uint(2)));
        int _2860 = _2856 & 3;
        float _2862 = (*spvDescriptorSet0.vp_c15)._m0[int(_2858)][_2860];
        int _2864 = _2846 + 8;
        uint _2866 = uint(int(uint(_2864) >> uint(2)));
        uint _2868 = uint(int(uint(int(_2866)) >> uint(2)));
        int _2870 = int(_2866) & 3;
        float _2872 = (*spvDescriptorSet0.vp_c15)._m0[int(_2868)][_2870];
        int _2874 = int(_2866) + 1;
        uint _2876 = uint(int(uint(_2874) >> uint(2)));
        int _2878 = _2874 & 3;
        float _2880 = (*spvDescriptorSet0.vp_c15)._m0[int(_2876)][_2878];
        float _2882 = _2287 * _2862;
        float _2884 = fma(_1846, _2854, _2882);
        float _2886 = fma(_1848, _2872, _2884);
        float _2888 = _2886 + _2880;
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = -_2890;
        float _2894 = _2892 + _2838;
        float _2896 = fma(_2894, 500.0, 1.5);
        float _2898 = exp2(_2896);
        float _2900 = 0.0 + _2898;
        float _2902 = precise::clamp(_2900, 0.0, 1.0);
        _2323 = _2898;
        _2842 = _2902;
    }
    float _2904 = _2323;
    float _2906 = _2842;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2910 = _2529 + _2908;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2914 = _2531 + _2912;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2918 = _2533 + _2916;
    float _2920 = _2910 * _2910;
    float _2922 = fma(_2914, _2914, _2920);
    float _2924 = fma(_2918, _2918, _2922);
    float _2926 = rsqrt(_2924);
    float _2928 = _2926 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2930 = _2914 * _2928;
    float _2932 = _2918 * _2928;
    float _2934 = _2930 * _2930;
    float _2936 = _2932 * _2932;
    float _2938 = _2934 + _2936;
    float _2940 = sqrt(_2938);
    bool _2942 = _2940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2946 = _2940 + _2944;
    float _2948 = _2926;
    float _2950 = _2946;
    float _2952 = _2910;
    float _2954 = _2928;
    if (_2942)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2948 = _2956;
    }
    float _2958 = _2948;
    float _2960 = _2958;
    if (_2942)
    {
        float _2962 = _2946 * _2958;
        _2950 = _2962;
    }
    float _2964 = _2950;
    if (_2942)
    {
        float _2966 = rsqrt(_2938);
        _2960 = _2966;
    }
    float _2968 = _2960;
    float _2970 = _2968;
    if (_2942)
    {
        float _2972 = _2964 * 0.15915493667125701904296875;
        _2413 = _2972;
    }
    float _2974 = _2413;
    float _2976 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2978 = _2918;
    float _2980 = _2974;
    if (_2942)
    {
        float _2982 = _2974 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        _2978 = _2984;
    }
    float _2986 = _2978;
    float _2988 = precise::max(0.0, _2976);
    float _2990 = _2904;
    float _2992 = _2988;
    if (_2942)
    {
        float _2994 = _2974 * 6.283185482025146484375;
        float _2996 = cos(_2994);
        _2990 = _2996;
    }
    float _2998 = _2990;
    float _3000 = -_2928;
    float _3002 = -_2988;
    float _3004 = fma(_2910, _3000, _3002);
    if (_2942)
    {
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2952 = _3006;
    }
    float _3008 = _2952;
    float _3010 = _2986;
    float _3012 = _3008;
    if (_2942)
    {
        float _3014 = fma(_2986, _3008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3010 = _3014;
    }
    float _3016 = _3010;
    float _3018 = _3016;
    if (!_2942)
    {
        _3012 = _2932;
    }
    float _3020 = _3012;
    float _3022 = _3020;
    if (!_2942)
    {
        _2980 = _2934;
    }
    float _3024 = _2980;
    float _3026 = _3024;
    if (_2942)
    {
        float _3028 = _2968 * _3016;
        _2795 = _3028;
    }
    float _3030 = _2795;
    if (!_2942)
    {
        _2970 = _2930;
    }
    float _3032 = _2970;
    float _3034 = _3032;
    float _3036 = _2998;
    if (_2942)
    {
        float _3038 = _2998 + (-1.0);
        _2992 = _3038;
    }
    float _3040 = _2992;
    if (_2942)
    {
        float _3042 = _2930 * _3030;
        _3034 = _3042;
    }
    float _3044 = _3034;
    if (!_2942)
    {
        _3018 = _3004;
    }
    float _3046 = _3018;
    float _3048 = _3046;
    if (_2942)
    {
        float _3050 = _2932 * _3030;
        _3022 = _3050;
    }
    float _3052 = _3022;
    if (_2942)
    {
        float _3054 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2954 = _3054;
    }
    float _3056 = _2954;
    if (_2942)
    {
        float _3058 = _3044 * _3044;
        _3026 = _3058;
    }
    float _3060 = _3026;
    float _3062 = sqrt(_2924);
    if (_2942)
    {
        float _3064 = fma(_3004, _2998, _3056);
        _3048 = _3064;
    }
    float _3066 = _3048;
    if (!_2942)
    {
        _3036 = _2936;
    }
    float _3068 = _3036;
    float _3070 = _3068;
    if (_2942)
    {
        float _3072 = _3052 * _3052;
        _3070 = _3072;
    }
    float _3074 = _3070;
    float _3076 = fma(_3066, _3066, _3060);
    float _3078 = _3076 + _3074;
    float _3080 = rsqrt(_3078);
    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3084 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3082);
    float _3086 = precise::clamp(_3084, 0.0, 1.0);
    float _3088 = -_3086;
    float _3090 = _3088 + 1.0;
    float _3092 = _3080 * _3044;
    float _3094 = _3080 * _3066;
    float _3096 = _3080 * _3052;
    float _3098 = abs(_3090);
    float _3100 = log2(_3098);
    float _3102 = _3092 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3104 = -_3102;
    float _3106 = fma(_3094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3104);
    float _3108 = -_3096;
    float _3110 = fma(_3108, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3106);
    float _3112 = fma(_3110, -0.5, 0.5);
    float _3114 = fma(_3110, 0.5, 0.5);
    float _3116 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3118 = fma(_3114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3120 = sqrt(_3112);
    float _3122 = fma(_3114, _3118, -0.212114393711090087890625);
    float _3124 = _3094 + 1.0;
    float _3126 = fma(_3114, _3122, 1.570728778839111328125);
    float _3128 = exp2(_3116);
    float _3130 = _3120 * 0.636619746685028076171875;
    float _3132 = -_3094;
    float _3134 = fma(_3128, _3124, _3132);
    float _3136 = -_3126;
    float _3138 = fma(_3130, _3136, 1.0);
    float _3140 = fma(_3134, 0.5, 0.5);
    float2 _8593 = float2(_3138, _3140);
    float3 _3144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).xyz;
    float _3146 = _3144.x;
    float _3148 = _3144.y;
    float _3150 = _3144.z;
    float _3152 = abs(_2295);
    float _3154 = log2(_3152);
    float _3156 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3158 = -_2209;
    float _3160 = _3158 + 1.0;
    float _3162 = _2755 + _2723;
    float _3164 = exp2(_3156);
    float _3166 = _3162 * 0.5;
    float _3168 = _3154 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3170 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3172 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3170);
    float _3174 = exp2(_3168);
    float _3176 = -_3164;
    float _3178 = _3176 + 1.0;
    float _3180 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3182 = _3180 * _2821;
    float _3184 = fma(_3174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3186 = precise::clamp(_3184, 0.0, 1.0);
    float _3188 = _2723 * 0.5;
    float _3190 = fma(_3186, -2.0, 3.0);
    float _3192 = _3186 * _3186;
    float _3194 = _3192 * _3190;
    float _3196 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3172);
    float _3198 = -_3194;
    float _3200 = _3198 + 1.0;
    float _3202 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3196);
    float _3204 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3194);
    bool _3206 = _2295 <= 8000.0;
    bool _3208 = isnan(_2295);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(8000.0);
    bool _3214 = _3210 || _3212;
    float _3216 = float(_3214);
    float _3218 = fma(_2745, -0.5, _3188);
    float _3220 = _3188;
    float _3222 = _3160;
    float _3224 = _3202;
    if (!_2709)
    {
        _3220 = 1.0;
    }
    float _3226 = _3220;
    out.gl_Position.x = _2755;
    out.gl_Position.y = _2745;
    out.gl_Position.z = _3202;
    out.gl_Position.w = _2723;
    float _3228 = _3226;
    if (_2709)
    {
        bool _3230 = _2819 >= _2787;
        bool _3232 = isnan(_2819);
        bool _3234 = _3230 || _3232;
        bool _3236 = isnan(_2787);
        bool _3238 = _3234 || _3236;
        float _3240 = float(_3238);
        _3228 = _3240;
    }
    float _3242 = _3228;
    float _3244 = _3216 * _3204;
    float _3246 = _3202 + _2723;
    bool _3248 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3250 = isnan(_3062);
    bool _3252 = _3248 || _3250;
    bool _3254 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3256 = _3252 || _3254;
    float _3258 = _3244 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3260 = _3242 * _2906;
    float _3262 = _3246 * 0.5;
    float _3264 = _3160 * _3258;
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    out.m_85.x = _3166;
    out.m_85.y = _3218;
    out.m_85.z = _3262;
    out.m_85.w = _2723;
    float _3268 = -_3266;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3272 = _2832 * _3182;
    float _3274 = -_3180;
    float _3276 = _3274 + 1.0;
    float _3278 = _3276;
    float _3280 = _3272;
    if (!_3256)
    {
        _2797 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3282 = _2797;
    float _3284 = -_3260;
    float _3286 = fma(_3284, _3270, 1.0);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    float _3290 = _3282;
    float _3292 = _3282;
    if (!_3256)
    {
        _3222 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3294 = _3222;
    float _3296 = _2832 * _3276;
    float _3298 = _3294;
    float _3300 = _3294;
    if (!_3256)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3302 = _2735;
    float _3304 = _3288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3306 = _3302;
    float _3308 = _3302;
    if (!_3256)
    {
        _3224 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3310 = _3224;
    float _3312 = _3310;
    float _3314 = _3310;
    if (!_3256)
    {
        _3278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3316 = _3278;
    out.m_87.x = _3304;
    float _3318 = _3150 * _3182;
    float _3320 = fma(_3146, _3272, _2826);
    float _3322 = fma(_3148, _3272, _2828);
    float _3324 = _3316;
    float _3326 = _3316;
    if (!_3256)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3328 = _3280;
    float _3330 = fma(_2832, _3318, _2830);
    out.m_89.x = _3320;
    out.m_89.y = _3322;
    out.m_89.z = _3330;
    out.m_89.w = _3296;
    bool _3332 = !_3256;
    float _3334 = _3328;
    float _3336 = _3328;
    if (!_3332)
    {
        bool _3338 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3340 = isnan(_3062);
        bool _3342 = _3338 || _3340;
        bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3346 = _3342 || _3344;
        if (!_3346)
        {
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3350 = _3062 + _3348;
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3354 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3352;
            float _3356 = 1.0 / _3354;
            float _3358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3364 = _3362 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3366 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3368 = _3366 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3372 = _3370 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3374 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3376 = _3374 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3378 = _3350 * _3356;
            float _3380 = precise::clamp(_3378, 0.0, 1.0);
            float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3386 = fma(_3380, _3360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3388 = fma(_3380, _3384, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3390 = fma(_3380, _3364, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3392 = fma(_3380, _3368, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3394 = fma(_3380, _3372, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3396 = fma(_3380, _3376, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3300 = _3388;
            _3336 = _3394;
            _3292 = _3386;
            _3314 = _3392;
            _3308 = _3390;
            _3326 = _3396;
            _3398 = true;
        }
        else
        {
            bool _3400 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3402 = isnan(_3062);
            bool _3404 = _3400 || _3402;
            bool _3406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3408 = _3404 || _3406;
            if (!_3408)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3410 = _3290;
            _3292 = _3410;
            if (!_3408)
            {
                _3298 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3412 = _3298;
            _3300 = _3412;
            if (!_3408)
            {
                _3306 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3414 = _3306;
            _3308 = _3414;
            if (!_3408)
            {
                _3312 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3416 = _3312;
            _3314 = _3416;
            if (!_3408)
            {
                _3334 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3418 = _3334;
            _3336 = _3418;
            if (!_3408)
            {
                _3324 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3420 = _3324;
            bool _3422 = !_3408;
            _3326 = _3420;
            if (!_3422)
            {
                bool _3424 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3426 = isnan(_3062);
                bool _3428 = _3424 || _3426;
                bool _3430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3432 = _3428 || _3430;
                if (!_3432)
                {
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3436 = _3062 + _3434;
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3440 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3438;
                    float _3442 = 1.0 / _3440;
                    float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3464 = _3436 * _3442;
                    float _3466 = precise::clamp(_3464, 0.0, 1.0);
                    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3470 = _3468 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3472 = fma(_3466, _3446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3474 = fma(_3466, _3470, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3476 = fma(_3466, _3450, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3478 = fma(_3466, _3454, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3480 = fma(_3466, _3458, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3482 = fma(_3466, _3462, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3300 = _3474;
                    _3336 = _3480;
                    _3292 = _3472;
                    _3314 = _3478;
                    _3308 = _3476;
                    _3326 = _3482;
                    _3398 = true;
                }
                else
                {
                    _3300 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3336 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3314 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3308 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3326 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3398 = false;
    float _3484 = _3300;
    float _3486 = _3336;
    float _3488 = _3292;
    float _3490 = _3314;
    float _3492 = _3308;
    float _3494 = _3326;
    float _3496 = fma(_2109, -0.5, 0.5);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = -_3484;
    float _3502 = _3500 + _3486;
    float _3504 = -_3488;
    float _3506 = _3504 + _3490;
    float _3508 = -_3492;
    float _3510 = _3508 + _3494;
    bool _3512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3514 = fma(_3498, _3502, _3484);
    float _3516 = fma(_3498, _3506, _3488);
    float _3518 = fma(_3498, _3510, _3492);
    float _3520 = _3514 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3522 = fma(_3516, 0.298911988735198974609375, _3520);
    float _3524 = fma(_3518, 0.114477999508380889892578125, _3522);
    float _3526 = -_3524;
    float _3528 = _3516 + _3526;
    float _3530 = -_3524;
    float _3532 = _3514 + _3530;
    float _3534 = -_3524;
    float _3536 = _3518 + _3534;
    float _3538 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3540 = fma(_3528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    float _3542 = fma(_3532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    float _3544 = fma(_3536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    out.m_61.x = _3538;
    out.m_93.x = _3540;
    out.m_93.y = _3542;
    out.m_93.z = _3544;
    if (!_3512)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3546 = -_2529;
    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3550 = -_2531;
    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3554 = -_2533;
    float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3558 = _3548 * _3548;
    float _3560 = fma(_3552, _3552, _3558);
    float _3562 = fma(_3556, _3556, _3560);
    float _3564 = sqrt(_3562);
    float _3566 = rsqrt(_3562);
    float _3568 = -_3564;
    float _3570 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3572 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3574 = precise::clamp(_3572, 0.0, 1.0);
    float _3576 = _3552 * _3566;
    float _3578 = _3548 * _3566;
    float _3580 = abs(_3574);
    float _3582 = log2(_3580);
    float _3584 = _3556 * _3566;
    float _3586 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3588 = _2109 * _3578;
    float _3590 = -_3578;
    float _3592 = -_3586;
    float _3594 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3592);
    float _3596 = fma(_2107, _3576, _3588);
    float _3598 = -_3584;
    float _3600 = fma(_3598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3594);
    float _3602 = fma(_2113, _3584, _3596);
    float _3604 = precise::clamp(_3602, 0.0, 1.0);
    float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3608 = _3600 + _3606;
    float _3610 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3614 = precise::clamp(_3612, 0.0, 1.0);
    float _3616 = exp2(_3610);
    float _3618 = _3616 * _3614;
    float _3620 = _3604 * _3618;
    float _3622 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3624 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3626 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3622;
    out.m_91.y = _3624;
    out.m_91.z = _3626;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3398 = false;
    bool _2161 = false;
    bool _786 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_58.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3683 = as_type<float>(_128);
        out.gl_Position.z = _3683;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_63.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3753 = as_type<float>(_166);
        out.gl_Position.z = _3753;
    }
    if (_158)
    {
        return out;
    }
    float _168 = in.m_65.w;
    float _170 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_63.x;
    float _184 = in.m_63.y;
    float _186 = in.m_63.z;
    float _188 = in.m_58.x;
    float _190 = in.m_58.y;
    float _192 = in.m_58.z;
    float _194 = 0.0;
    float _196 = _170;
    if (!_180)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    bool _210 = !_180;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _170 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _170);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_180;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _170 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _196 = _266;
    }
    float _268 = _196;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _182, _272);
    float _280 = fma(_268, _184, _274);
    float _282 = fma(_268, _186, _276);
    float _284 = fma(_278, _168, _188);
    float _286 = fma(_280, _168, _190);
    float _288 = fma(_282, _168, _192);
    bool _290 = !_270;
    float _308;
    if (!_290)
    {
        float _292 = in.m_67.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_112);
        float _314 = 1.0 / _312;
        float _316 = _146 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _318 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _336;
    float _340 = 1.0 / _330;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _354;
    float _358 = 1.0 / _334;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = _318 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = 1.0 / _338;
    float _374 = _362 * _340;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _318 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = _318 + _380;
    float _384 = fma(_366, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _388 = isnan(_318);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _348;
    float _400 = _378 * _358;
    bool _402 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _404 = isnan(_318);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_370, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = 1.0 / _352;
    float _428 = _382 * _372;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _432 = _318 + _430;
    float _434 = -_412;
    float _436 = _434 + 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = fma(_420, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _448 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _450 = isnan(_318);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = 1.0 / _356;
    bool _462 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _464 = isnan(_318);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = fma(_440, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _476 = fma(_444, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _482;
    float _486 = _472 * _436;
    float _488 = -_396;
    float _490 = _488 + 1.0;
    float _492 = 1.0 / _344;
    float _494 = _322 * _426;
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = fma(_480, _428, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = _458 * _490;
    float _504 = -_458;
    float _506 = _504 + 1.0;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _512 = _432 * _460;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _516 = _318 + _514;
    bool _518 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _520 = isnan(_318);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _516 * _398;
    bool _532 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _534 = isnan(_318);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _326 * _492;
    float _546 = -_528;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = _542 * _498;
    float _554 = -_542;
    float _556 = _554 + 1.0;
    bool _558 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _560 = isnan(_318);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _528 * _556;
    float _572 = _568 * _548;
    float _574 = -_568;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _578;
    float _582 = _396 * _576;
    float _584 = fma(_580, _428, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _586 = fma(_484, _428, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _588 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _590 = isnan(_318);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = _598 * _506;
    float _610 = -_598;
    float _612 = _610 + 1.0;
    float _614 = fma(_606, _494, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _616 = fma(_602, _494, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _618 = _384 * _608;
    float _620 = _474 * _608;
    float _622 = _424 * _608;
    float _624 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    float _626 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _620);
    float _628 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _622);
    float _630 = fma(_510, _494, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _632 = fma(_422, _502, _624);
    float _634 = fma(_476, _502, _626);
    float _636 = fma(_446, _502, _628);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _642 = fma(_584, _582, _632);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _644;
    float _648 = fma(_500, _582, _634);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _654 = fma(_586, _582, _636);
    float _656 = fma(_640, _530, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _658 = fma(_614, _572, _642);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _660;
    float _664 = in.m_65.x;
    float _666 = in.m_65.y;
    float _668 = in.m_65.z;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _670;
    float _674 = fma(_652, _530, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _676 = fma(_616, _572, _648);
    float _678 = fma(_630, _572, _654);
    float _680 = fma(_646, _544, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _682 = fma(_662, _544, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _684 = fma(_672, _544, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = fma(_680, _570, _658);
    float _692 = fma(_682, _570, _676);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _698;
    float _702 = fma(_688, _530, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _704;
    float _708 = fma(_684, _570, _678);
    float _710 = fma(_696, _512, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _712 = fma(_700, _512, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _714 = fma(_674, _552, _690);
    float _716 = fma(_706, _512, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _718 = fma(_656, _552, _692);
    float _720 = fma(_702, _552, _708);
    float _722 = fma(_710, _486, _714);
    float _724 = fma(_712, _486, _718);
    float _726 = fma(_716, _486, _720);
    float _728 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].x, _722);
    float _730 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].y, _724);
    float _732 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].z, _726);
    float _734 = _728 * _664;
    float _736 = _730 * _666;
    float _738 = _732 * _668;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _752 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _756 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _766 = !_550;
    float _784;
    if (!_766)
    {
        float _768 = in.m_67.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_112);
        float _790 = 1.0 / _788;
        float _792 = _146 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _798 = log2(_796);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _810 = 1.0 / _806;
    float _812 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _808);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _818 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = in.m_67.z;
    float _838 = 1.0 / _816;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _844 = in.m_67.y;
    float _846 = 1.0 / _822;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _852 = in.m_67.x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _862;
    float _866 = 1.0 / _842;
    float _868 = _856 * _810;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _886 = _836 * 2.0;
    float _888 = 1.0 / _850;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _892 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _894 = _860 * _846;
    float _896 = _798 * _146;
    float _898 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _890);
    float _900 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _892);
    float _902 = 1.0 / _884;
    float _904 = _864 * _866;
    float _906 = _872 * _838;
    float _908 = _844 * 2.0;
    float _910 = fma(_904, _802, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _912 = floor(_886);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _918 = _880 * _888;
    float _920 = _852 + _836;
    bool _922 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(1.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = 1.0 / _916;
    float _934 = _920 + (-1.0);
    float _936 = _876 * _902;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _940 = 1.0 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _942;
    bool _946 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _954 = _950 || _952;
    float _956 = exp2(_896);
    float _958 = _844 + _836;
    bool _960 = _912 > 0.0;
    float _962 = _836 + (-0.5);
    bool _964 = _912 >= 0.0;
    bool _966 = isnan(_912);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _958 + (-1.0);
    float _976 = _852 + _844;
    float _978 = 1.0 / _940;
    float _980 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = _852 * 2.0;
    float _984 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _986 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _988 = isnan(_794);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _944 * _932;
    bool _1000 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1002 = isnan(_794);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _976 + (-1.0);
    float _1014 = floor(_982);
    float _1016 = -_956;
    float _1018 = _1016 + 1.0;
    float _1020 = -_996;
    float _1022 = _1020 + 1.0;
    float _1024 = -_1010;
    float _1026 = _1024 + 1.0;
    int _1028 = _972 ? 0 : 1;
    float _1030 = _954 ? _1018 : 0.0;
    float _1032 = _1010 * _1022;
    float _1034 = floor(_908);
    bool _1036 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1038 = isnan(_794);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1050 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1052 = isnan(_794);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    if (_930)
    {
        float _1062 = _1030 * _978;
        _148 = _1062;
    }
    float _1064 = _148;
    bool _1066 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1068 = isnan(_794);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = -_1046;
    float _1080 = _1078 + 1.0;
    float _1082 = _1046 * _1026;
    bool _1084 = _1014 >= 0.0;
    bool _1086 = isnan(_1014);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan(0.0);
    bool _1092 = _1088 || _1090;
    float _1094 = _1060 * _1080;
    float _1096 = -_1060;
    float _1098 = _1096 + 1.0;
    bool _1100 = _1014 > 0.0;
    float _1102 = _1076 * _1098;
    float _1104 = -_1076;
    float _1106 = _1104 + 1.0;
    int _1108 = _1092 ? 0 : 1;
    float _1110 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _898);
    bool _1112 = _1034 > 0.0;
    float _1114 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _900);
    bool _1116 = _1034 >= 0.0;
    bool _1118 = isnan(_1034);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _812);
    bool _1128 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1130 = isnan(_794);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1142 = _794 + _1140;
    bool _1144 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1146 = isnan(_794);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    bool _1156 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1158 = isnan(_794);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -_1138;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_868, _1142, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1174 = _1154 * _1106;
    float _1176 = -_1154;
    float _1178 = _1176 + 1.0;
    float _1180 = _1166 * _1170;
    float _1182 = -_1166;
    float _1184 = _1182 + 1.0;
    float _1186 = rsqrt(_1126);
    float _1188 = _1138 * _1178;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1192 = _794 + _1190;
    float _1194 = _1172 * _1180;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1198 = _794 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1202 = _794 + _1200;
    float _1204 = fma(_894, _1192, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1208 = _794 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1212 = _794 + _1210;
    float _1214 = fma(_936, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1216 = _1124 ? 0 : 1;
    float _1218 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1194);
    float _1220 = fma(_998, _1212, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1222 = fma(_906, _1202, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1224 = ~_1216;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = fma(_1204, _1188, _1218);
    int _1232 = _1228;
    float _1234 = _1110;
    if (!_1112)
    {
        int _1236 = ~_1216;
        int _1238 = _1236 + 1;
        _1232 = _1238;
    }
    int _1240 = _1232;
    float _1242 = fma(_918, _1208, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1244 = !_826;
    int _1246 = _1244 ? 0 : 1;
    float _1248 = fma(_910, _1174, _1230);
    bool _1250 = !_830;
    int _1252 = _1250 ? 0 : 1;
    int _1254 = abs(_1246);
    float _1256 = fma(_1222, _1102, _1248);
    float _1258 = abs(_1114);
    bool _1260 = _1258 > 0.001000000047497451305389404296875;
    int _1262 = ~_1028;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = fma(_1214, _1094, _1256);
    int _1270 = abs(_1252);
    int _1272 = _1266;
    if (!_960)
    {
        int _1274 = ~_1028;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    float _1280 = fma(_1242, _1082, _1268);
    float _1282 = _1260 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1284 = fma(_1220, _1032, _1280);
    float _1286 = float(_1254);
    float _1288 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1290 = float(_1278);
    float _1292 = _1114 + _1282;
    bool _1294 = !_834;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1284);
    int _1300 = ~_1108;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = _1286 * _1290;
    int _1308 = abs(_1296);
    int _1310 = _1304;
    float _1312 = _1292;
    int _1314 = as_type<int>(_1288);
    if (!_1100)
    {
        int _1316 = ~_1108;
        int _1318 = _1316 + 1;
        _1310 = _1318;
    }
    int _1320 = _1310;
    float _1322 = _1306 * (-2.0);
    float _1324 = float(_1240);
    float _1326 = fma(_1048, _1322, _1048);
    float _1328 = abs(_1110);
    float _1330 = abs(_1292);
    float _1332 = precise::max(_1328, _1330);
    float _1334 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1336 = float(_1308);
    float _1338 = float(_1270);
    float _1340 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1342 = float(_1320);
    float _1344 = _1336 * _1324;
    bool _1346 = _1332 >= 16.0;
    float _1348 = _852 + (-0.5);
    float _1350 = _1338 * _1342;
    float _1352 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1356 = _1334 * _1334;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1360 = _1358 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1362 = _1350 * (-2.0);
    float _1364 = fma(_1326, _1064, _1354);
    float _1366 = fma(_1288, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1340);
    float _1368 = fma(_1298, _1360, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1370 = fma(_1288, _1288, _1356);
    float _1372 = fma(_980, _1362, _980);
    float _1374 = _844 + (-0.5);
    float _1376 = in.m_69.y;
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1366);
    float _1380 = _284 * _1368;
    float _1382 = fma(_1352, _1352, _1370);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1386 = _1344 * (-2.0);
    float _1388 = _1378 * _1380;
    float _1390 = fma(_1372, _1064, _1384);
    int _1392 = as_type<int>(_1342);
    if (_1346)
    {
        float _1394 = _1110 * 0.0625;
        _1234 = _1394;
    }
    float _1396 = _1234;
    float _1398 = fma(_1388, _1386, _1388);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1402 = _1400 != 0;
    if (_1346)
    {
        float _1404 = _1292 * 0.0625;
        _1312 = _1404;
    }
    float _1406 = _1312;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1410 = _1408 != 0;
    float _1412 = fma(_984, _1386, _984);
    float _1414 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1398);
    float _1416 = abs(_1396);
    bool _1418 = _1416 != 0.0;
    bool _1420 = isnan(_1416);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.0);
    bool _1426 = _1422 || _1424;
    float _1428 = in.m_71.x;
    float _1430 = in.m_71.y;
    float _1432 = in.m_71.z;
    bool _1434 = _844 > 0.5;
    float _1436 = fma(_1412, _1064, _1414);
    float _1438 = abs(_1406);
    bool _1440 = _1438 == 0.0;
    bool _1442 = !_1426;
    bool _1444 = _1440 && _1442;
    float _1446 = _1364 * 0.15915493667125701904296875;
    float _1448 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1450 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1452 = -_1376;
    float _1454 = _1452 + 1.0;
    float _1456 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1458 = rsqrt(_1382);
    float _1460 = _1390 * 0.15915493667125701904296875;
    float _1462 = _1436 * 0.15915493667125701904296875;
    float _1464 = _1376;
    bool _1466 = _1434;
    if (_1410)
    {
        float _1468 = _1434 ? _1454 : _1376;
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1450);
    float _1474 = abs(_1406);
    bool _1476 = _1474 == 0.0;
    if (_1444)
    {
        bool _1478 = as_type<int>(_1406) >= 0;
        _1466 = _1478;
    }
    bool _1480 = _1466;
    float _1482 = _1446 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1448);
    bool _1488 = _852 > 0.5;
    bool _1490 = _1488 && _1402;
    int _1492 = _1480 ? (-1) : 0;
    if (_1444)
    {
        int _1494 = _1480 ? 0 : 1078530011;
        _1392 = _1494;
    }
    int _1496 = _1392;
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1430);
    float _1500 = _1446 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1432);
    float _1506 = _1288 * _1458;
    float _1508 = _1352 * _1458;
    float _1510 = _1460 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    float _1514 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1456);
    float _1516 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1518 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1520 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1428);
    float _1522 = _1460 * 6.283185482025146484375;
    float _1524 = cos(_1522);
    float _1526 = _1516 * _1520;
    float _1528 = _818 * _1498;
    float _1530 = _1518 * _1504;
    float _1532 = _1334 * _1458;
    float _1534 = _1518;
    if (_1444)
    {
        int _1536 = int(0x80000000) & as_type<int>(_1396);
        int _1538 = _1496 | _1536;
        _1534 = as_type<float>(_1538);
    }
    float _1540 = _1534;
    float _1542 = _1462 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1462 * 6.283185482025146484375;
    float _1548 = cos(_1546);
    bool _1550 = !_1426;
    bool _1552 = _1550 && _1476;
    float _1554 = _1540;
    float _1556 = _1540;
    if (!_1552)
    {
        float _1558 = abs(_1396);
        bool _1560 = _1558 != as_type<float>(0x7f800000u /* inf */);
        bool _1562 = isnan(_1558);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1568 = _1564 || _1566;
        float _1570 = abs(_1406);
        bool _1572 = _1570 == as_type<float>(0x7f800000u /* inf */);
        float _1574 = abs(_1406);
        bool _1576 = _1574 == as_type<float>(0x7f800000u /* inf */);
        bool _1578 = !_1568;
        bool _1580 = _1576 && _1578;
        if (_1580)
        {
            bool _1582 = as_type<int>(_1406) >= 0;
            _1492 = _1582 ? (-1) : 0;
        }
        int _1584 = _1492;
        if (_1580)
        {
            _1314 = 1075235812;
        }
        int _1586 = _1314;
        int _1588 = _1586;
        if (_1580)
        {
            int _1590 = ~_1584;
            int _1592 = (_1590 != 0) ? _1586 : 1061752795;
            _1588 = _1592;
        }
        int _1594 = _1588;
        if (_1580)
        {
            int _1596 = int(0x80000000) & as_type<int>(_1396);
            int _1598 = _1594 | _1596;
            _1554 = as_type<float>(_1598);
        }
        float _1600 = _1554;
        bool _1602 = !_1568;
        bool _1604 = _1602 && _1572;
        _1556 = _1600;
        if (!_1604)
        {
            float _1606 = abs(_1396);
            float _1608 = abs(_1406);
            float _1610 = precise::max(_1606, _1608);
            float _1612 = abs(_1396);
            float _1614 = abs(_1406);
            float _1616 = precise::min(_1612, _1614);
            float _1618 = 1.0 / _1610;
            float _1620 = abs(_1396);
            float _1622 = abs(_1406);
            bool _1624 = _1620 > _1622;
            bool _1626 = as_type<int>(_1406) >= 0;
            float _1628 = _1616 * _1618;
            float _1630 = _1628 * _1628;
            float _1632 = _1630 + 11.33538818359375;
            float _1634 = fma(_1630, _1632, 28.84246826171875);
            float _1636 = fma(_1630, _1634, 19.6966705322265625);
            float _1638 = fma(_1630, -0.82336294651031494140625, -5.674867153167724609375);
            float _1640 = fma(_1630, _1638, -6.565555095672607421875);
            float _1642 = 1.0 / _1636;
            float _1644 = _1630 * _1640;
            float _1646 = abs(_1396);
            float _1648 = abs(_1406);
            float _1650 = _1646 + _1648;
            float _1652 = _1628 * _1644;
            bool _1654 = _1650 > as_type<float>(0x7f800000u /* inf */);
            bool _1656 = isnan(_1650);
            bool _1658 = _1654 || _1656;
            bool _1660 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1662 = _1658 || _1660;
            float _1664 = fma(_1652, _1642, _1628);
            int _1666 = as_type<int>(_1396) & int(0x80000000);
            float _1668 = _1664;
            _1556 = _1650;
            if (_1624)
            {
                float _1670 = -_1664;
                float _1672 = _1670 + 1.57079637050628662109375;
                _1668 = _1672;
            }
            float _1674 = _1668;
            int _1676 = as_type<int>(_1674);
            if (!_1626)
            {
                float _1678 = -_1674;
                float _1680 = _1678 + 3.1415927410125732421875;
                _1676 = as_type<int>(_1680);
            }
            int _1682 = _1676;
            if (!_1662)
            {
                int _1684 = _1666 | _1682;
                _1556 = as_type<float>(_1684);
            }
        }
    }
    float _1686 = _1556;
    float _1688 = _1484 * _1512;
    float _1690 = _1502 * _1524;
    float _1692 = _1502 * _1512;
    float _1694 = _1484 * _1524;
    float _1696 = _1502 * _1548;
    float _1698 = _1686 * (-0.15915493667125701904296875);
    float _1700 = _1484 * _1548;
    float _1702 = _1524 * _1548;
    float _1704 = fma(_1544, _1690, _1688);
    float _1706 = -_1528;
    float _1708 = _1544 * _1706;
    float _1710 = _1512 * _1548;
    float _1712 = fma(_1544, _1688, _1690);
    float _1714 = _1696 * _1528;
    float _1716 = _1698 * 6.283185482025146484375;
    float _1718 = cos(_1716);
    float _1720 = -_1694;
    float _1722 = fma(_1544, _1692, _1720);
    float _1724 = -_1692;
    float _1726 = fma(_1544, _1694, _1724);
    float _1728 = _1700 * _1528;
    float _1730 = fma(_1702, _1526, _1708);
    float _1732 = fma(_1704, _1526, _1714);
    bool _1734 = _1430 != 0.0;
    bool _1736 = isnan(_1430);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = fma(_1726, _1526, _1728);
    float _1746 = _1698 * 6.283185482025146484375;
    float _1748 = sin(_1746);
    float _1750 = fma(_1722, _1530, _1732);
    float _1752 = fma(_1710, _1530, _1730);
    float _1754 = fma(_1712, _1530, _1744);
    bool _1756 = _1428 == 0.0;
    bool _1758 = !_1742;
    bool _1760 = _1756 && _1758;
    float _1762 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1766 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1768 = -_1718;
    float _1770 = _1768 + 1.0;
    float _1772 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1762);
    float _1774 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1764);
    float _1776 = _1508 * _1508;
    float _1778 = _1506 * _1770;
    float _1780 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1772);
    float _1782 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1766);
    float _1784 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1774);
    float _1786 = _1508 * _1748;
    float _1788 = fma(_1770, _1776, _1718);
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1792 = _1506 * _1748;
    float _1794 = -_1786;
    float _1796 = fma(_1532, _1778, _1794);
    float _1798 = _1532 * _1770;
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1782);
    float _1802 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1804 = fma(_1506, _1778, _1718);
    float _1806 = _1790 * _1796;
    float _1808 = in.m_73.x;
    float _1810 = in.m_73.y;
    float _1812 = in.m_73.z;
    float _1814 = _1532 * _1748;
    float _1816 = fma(_1508, _1798, _1792);
    float _1818 = fma(_1802, _1804, _1806);
    float _1820 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1822 = -_1814;
    float _1824 = fma(_1508, _1778, _1822);
    float _1826 = _1790 * _1816;
    float _1828 = fma(_1508, _1778, _1814);
    float _1830 = in.m_69.x;
    bool _1832 = _1432 == 0.0;
    bool _1834 = _1832 && _1760;
    float _1836 = fma(_1802, _1824, _1826);
    float _1838 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1486);
    float _1840 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1514);
    float _1842 = fma(_1820, _1828, _1818);
    float _1844 = fma(_1820, _1788, _1836);
    float _1846 = _1838 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1848 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1850 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1472);
    float _1852 = fma(_1532, _1778, _1786);
    float _1854 = _1846 + _1842;
    float _1856 = _1848 + _1844;
    float _1858 = fma(_1532, _1798, _1718);
    float _1860 = -_1792;
    float _1862 = fma(_1508, _1798, _1860);
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1866 = _1854 + _1864;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1870 = _1856 + _1868;
    float _1872 = _1810;
    float _1874 = _1812;
    float _1876 = _1816;
    float _1878 = _1808;
    float _1880 = _1726;
    if (!_1834)
    {
        float _1882 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1810);
        _1872 = _1882;
    }
    float _1884 = _1872;
    if (!_1834)
    {
        float _1886 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1812);
        _1874 = _1886;
    }
    float _1888 = _1874;
    float _1890 = _1866 * _1866;
    float _1892 = _1870 * _1870;
    float _1894 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1896 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1898 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1900 = _1890 + _1892;
    float _1902 = _1830;
    float _1904 = _1892;
    float _1906 = _1890;
    if (_1402)
    {
        _1876 = _1830;
    }
    float _1908 = _1876;
    float _1910 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1914 = sqrt(_1900);
    float _1916 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1918 = _1908;
    if (_1490)
    {
        float _1920 = -_1908;
        float _1922 = _1920 + 1.0;
        _1918 = _1922;
    }
    float _1924 = _1918;
    if (!_1834)
    {
        float _1926 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1808);
        _1878 = _1926;
    }
    float _1928 = _1878;
    float _1930 = -_1544;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1894);
    float _1934 = -_1544;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1938 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    if (_1402)
    {
        _1902 = _1924;
    }
    float _1940 = _1902;
    float _1942 = -_1544;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1898);
    float _1946 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    float _1948 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1916);
    float _1950 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1952 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1954 = _1790 * _1858;
    float _1956 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1958 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1950);
    bool _1960 = _1914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1962 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1952);
    float _1964 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1956);
    float _1966 = fma(_1802, _1852, _1954);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1970 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1932);
    float _1972 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1936);
    float _1974 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1944);
    float _1976 = fma(_1820, _1862, _1966);
    float _1978 = _1850 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1980 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1938);
    float _1982 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1946);
    float _1984 = _1978 + _1976;
    float _1986 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1948);
    float _1988 = _1966;
    float _1990 = _1976;
    uint _1993 = as_type<uint>(_1978);
    if (!_1960)
    {
        _1880 = _1892;
    }
    float _1995 = _1880;
    float _1997 = _1995;
    if (!_1960)
    {
        _1904 = _1854;
    }
    float _1999 = _1904;
    float _2001 = _1999;
    if (!_1960)
    {
        _1988 = _1856;
    }
    float _2003 = _1988;
    float _2005 = _2003;
    if (!_1960)
    {
        _1990 = _1984;
    }
    float _2007 = _1990;
    bool _2009 = !_1960;
    float _2011 = _2007;
    if (!_2009)
    {
        float _2013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2017 = _1914 + _2015;
        float _2019 = rsqrt(_1900);
        float _2021 = _2017 * _2013;
        float _2023 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2025 = _2021 * 0.15915493667125701904296875;
        float _2027 = _2025 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = _2025 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = fma(_2029, _2023, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2037 = _2019 * _2035;
        float _2039 = _2033 + (-1.0);
        float _2041 = fma(_1866, _2037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2043 = fma(_1870, _2037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2045 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2049 = _2041 + _2047;
        float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2053 = _2043 + _2051;
        float _2055 = fma(_1984, _2033, _2045);
        float _2057 = _2049 * _2049;
        float _2059 = _2053 * _2053;
        _2011 = _2055;
        _1906 = _2057;
        _1997 = _2059;
        _2001 = _2041;
        _2005 = _2043;
    }
    float _2061 = _2011;
    float _2063 = _1906;
    float _2065 = _1997;
    float _2067 = _2001;
    float _2069 = _2005;
    float _2071 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1958);
    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2075 = _2061 + _2073;
    float _2077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2079 = _1970 * _1884;
    float _2081 = _1972 * _1884;
    float _2083 = fma(_2075, _2075, _2063);
    float _2085 = _1974 * _1884;
    float _2087 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1962);
    float _2089 = fma(_1980, _1928, _2079);
    float _2091 = _2083 + _2065;
    float _2093 = fma(_1982, _1928, _2081);
    float _2095 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2097 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1964);
    float _2099 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2101 = fma(_1986, _1928, _2085);
    float _2103 = sqrt(_2091);
    float _2105 = _2095 * _1968;
    float _2107 = fma(_2071, _1888, _2089);
    float _2109 = fma(_2087, _1888, _2093);
    float _2111 = _2099 * _2077;
    float _2113 = fma(_2097, _1888, _2101);
    out.m_75.x = _752;
    out.m_75.y = _756;
    out.m_75.z = _758;
    out.m_75.w = _754;
    out.m_77.x = _760;
    out.m_77.y = _762;
    out.m_77.z = _764;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    bool _2115 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2117 = isnan(_2103);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2123 = _2119 || _2121;
    out.m_81.x = _2105;
    out.m_81.y = _2111;
    out.m_83.x = _2107;
    out.m_83.y = _2109;
    out.m_83.z = _2113;
    float _2125 = _2099;
    if (!_2123)
    {
        _2125 = 1.0;
    }
    float _2127 = _2125;
    bool _2129 = !_2123;
    float _2131 = _2127;
    if (!_2129)
    {
        bool _2133 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2135 = isnan(_2103);
        bool _2137 = _2133 || _2135;
        bool _2139 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2141 = _2137 || _2139;
        if (!_2141)
        {
            float _2143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2145 = _2103 + _2143;
            float _2147 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2149 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2147;
            float _2151 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2153 = _2151 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2155 = 1.0 / _2149;
            float _2157 = _2145 * _2155;
            float _2159 = fma(_2157, _2153, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2131 = _2159;
            _2161 = true;
        }
        else
        {
            bool _2163 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2165 = isnan(_2103);
            bool _2167 = _2163 || _2165;
            bool _2169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2171 = _2167 || _2169;
            if (!_2171)
            {
                float _2173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2175 = _2103 + _2173;
                float _2177 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2179 = _2177 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2181 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2183 = _2181 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2185 = 1.0 / _2179;
                float _2187 = _2175 * _2185;
                float _2189 = fma(_2187, _2183, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2131 = _2189;
                _2161 = true;
            }
            else
            {
                _2131 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2161 = false;
    float _2191 = _2131;
    float _2193 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2195 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2197 = floor(_2193);
    float _2199 = floor(_2195);
    float _2201 = -_2197;
    float _2203 = _2193 + _2201;
    float _2205 = -_2199;
    float _2207 = _2195 + _2205;
    float2 _7042 = float2(_2203, _2207);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7042, float2(0.0), isnan(_7042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7042, float2(0.0), isnan(_7042)), level(0.0)).x;
    float _2211 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2213 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2215 = _2067 + _2213;
    float _2217 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    float _2219 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2221 = _2069 + _2219;
    float _2223 = fma(_2215, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2225 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2217);
    float _2227 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2229 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.5);
    bool _2237 = _2233 || _2235;
    float _2239 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2241 = _2061 + _2239;
    float _2243 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2245 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2227);
    float _2247 = fma(_2221, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2249 = fma(_2241, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2251 = 1.0 / _2243;
    float _2253 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2245);
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2257 = _2241;
    float _2259 = _2191;
    int _2261 = 2;
    float _2263 = _2223;
    int _2265 = as_type<int>(_2249);
    if (_2237)
    {
        _2257 = _2249;
    }
    float _2267 = _2257;
    float _2269 = _2255 + _2243;
    float _2271 = _2267;
    if (_2237)
    {
        _2259 = _2247;
    }
    float _2273 = _2259;
    float _2275 = _2269 * _2251;
    float _2277 = _2275 * 0.5;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2279);
    float _2283 = 1.0 / _2281;
    float _2285 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2287 = _1978 + _2285;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2291 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2289);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2295 = _2283 * _2293;
    float _2297 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2299 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2291);
    bool _2301 = _2295 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2303 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2297);
    bool _2305 = _2295 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2307 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2309 = !_2301;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2303);
    float _2315 = trunc(_2307);
    int _2317 = int(_2315);
    float _2319 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2321 = _2273;
    float _2323 = _2287;
    if (!_2301)
    {
        _2261 = 1;
    }
    int _2325 = _2261;
    int _2327 = _2325;
    if (!_2305)
    {
        _2327 = _2311;
    }
    int _2329 = _2327;
    float _2331 = trunc(_2319);
    int _2333 = int(_2331);
    int _2335 = _2329 << 6;
    int _2337 = _2335 + 48;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2357 = _2317 + _2355;
    int _2359 = _2357 + 1;
    bool _2361 = _2359 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2363 = _2335 + 56;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    uint _2367 = uint(int(uint(int(_2365)) >> uint(2)));
    int _2369 = int(_2365) & 3;
    float _2371 = (*spvDescriptorSet0.vp_c15)._m0[int(_2367)][_2369];
    int _2373 = int(_2365) + 1;
    uint _2375 = uint(int(uint(_2373) >> uint(2)));
    int _2377 = _2373 & 3;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[int(_2375)][_2377];
    int _2381 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2383 = _2333 + _2381;
    int _2385 = _2383 + 1;
    int _2387 = _2359 | _2385;
    int _2389 = _2335 + 64;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    uint _2393 = uint(int(uint(int(_2391)) >> uint(2)));
    int _2395 = int(_2391) & 3;
    float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
    int _2399 = int(_2391) + 1;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    int _2403 = _2399 & 3;
    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[int(_2401)][_2403];
    bool _2407 = _2387 < 0;
    bool _2409 = _2407 || _2361;
    float _2411 = as_type<float>(_2387);
    float _2413 = as_type<float>(_2329);
    if (_2237)
    {
        _2411 = _2223;
    }
    float _2415 = _2411;
    bool _2417 = _2385 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2419 = _2417 || _2409;
    int _2421 = _2335 + 72;
    uint _2423 = uint(int(uint(_2421) >> uint(2)));
    uint _2425 = uint(int(uint(int(_2423)) >> uint(2)));
    int _2427 = int(_2423) & 3;
    float _2429 = (*spvDescriptorSet0.vp_c15)._m0[int(_2425)][_2427];
    int _2431 = int(_2423) + 1;
    uint _2433 = uint(int(uint(_2431) >> uint(2)));
    int _2435 = _2431 & 3;
    float _2437 = (*spvDescriptorSet0.vp_c15)._m0[int(_2433)][_2435];
    int _2439 = _2335 + 96;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    uint _2443 = uint(int(uint(int(_2441)) >> uint(2)));
    int _2445 = int(_2441) & 3;
    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[int(_2443)][_2445];
    int _2449 = int(_2441) + 1;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    int _2453 = _2449 & 3;
    float _2455 = (*spvDescriptorSet0.vp_c15)._m0[int(_2451)][_2453];
    int _2457 = _2335 + 104;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    uint _2461 = uint(int(uint(int(_2459)) >> uint(2)));
    int _2463 = int(_2459) & 3;
    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[int(_2461)][_2463];
    int _2467 = int(_2459) + 1;
    uint _2469 = uint(int(uint(_2467) >> uint(2)));
    int _2471 = _2467 & 3;
    float _2473 = (*spvDescriptorSet0.vp_c15)._m0[int(_2469)][_2471];
    float _2475 = _2415;
    int _2477 = as_type<int>(_2465);
    if (!_2237)
    {
        float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2481 = _1978 + _2479;
        float _2483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2485 = _1846 + _2483;
        float _2487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2489 = _2481 * _2481;
        float _2491 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2493 = _1848 + _2491;
        float _2495 = fma(_2485, _2485, _2489);
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2499 = fma(_2493, _2493, _2495);
        float _2501 = sqrt(_2499);
        float _2503 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2505 = precise::min(_2501, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2507 = _2505 * _2497;
        float _2509 = -_1978;
        float _2511 = _2509 + _2249;
        float _2513 = -_1846;
        float _2515 = _2513 + _2223;
        float _2517 = -_1848;
        float _2519 = _2517 + _2247;
        float _2521 = _2503 * _2507;
        float _2523 = fma(_2511, _2521, _1978);
        float _2525 = fma(_2515, _2521, _1846);
        float _2527 = fma(_2519, _2521, _1848);
        _2271 = _2523;
        _2475 = _2525;
        _2321 = _2527;
        _2263 = _2519;
    }
    float _2529 = _2271;
    float _2531 = _2475;
    float _2533 = _2321;
    float _2535 = _2263;
    float _2537 = _2287 * _2455;
    if (!_2419)
    {
        int _2539 = _2385 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2541 = _2539 + _2359;
        _1993 = uint(_2541);
    }
    uint _2543 = _1993;
    float _2545 = _2287 * _2405;
    float _2547 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2549 = fma(_1846, _2447, _2537);
    float _2551 = _2287 * _2353;
    if (!_2419)
    {
        uint _2553 = uint(int(uint(int(_2543)) >> uint(2)));
        _2265 = int(_2553);
    }
    int _2555 = _2265;
    float _2557 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2547);
    float _2559 = fma(_1848, _2465, _2549);
    int _2561 = _2555;
    if (!_2419)
    {
        int _2563 = int(_2543) << 2;
        _2477 = _2563;
    }
    int _2565 = _2477;
    float _2567 = fma(_1846, _2345, _2551);
    float _2569 = fma(_1846, _2397, _2545);
    float _2571 = _2559 + _2473;
    int _2573 = _2335 + 80;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    uint _2577 = uint(int(uint(int(_2575)) >> uint(2)));
    int _2579 = int(_2575) & 3;
    float _2581 = (*spvDescriptorSet0.vp_c15)._m0[int(_2577)][_2579];
    int _2583 = int(_2575) + 1;
    uint _2585 = uint(int(uint(_2583) >> uint(2)));
    int _2587 = _2583 & 3;
    float _2589 = (*spvDescriptorSet0.vp_c15)._m0[int(_2585)][_2587];
    int _2591 = _2565;
    if (!_2419)
    {
        int _2593 = 12 & _2565;
        _2591 = _2593;
    }
    int _2595 = _2591;
    float _2597 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2557);
    float _2599 = fma(_1848, _2371, _2567);
    float _2601 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2603 = 1.0 / _2571;
    if (!_2419)
    {
        int _2605 = _2555 << 4;
        int _2607 = _2605 + _2595;
        _2561 = _2607;
    }
    int _2609 = _2561;
    float _2611 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2613 = _2335 + 88;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c15)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c15)._m0[int(_2625)][_2627];
    float _2631 = fma(_1848, _2429, _2569);
    float _2633 = _2599 + _2379;
    float _2635 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2637 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2639 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2641 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2643 = -_2635;
    float _2645 = fma(_2643, _2601, 1.0);
    float _2647 = _2535;
    float _2649 = _2633;
    if (!_2419)
    {
        int _2651 = _2609 + 400;
        uint _2653 = uint(int(uint(_2651) >> uint(2)));
        uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
        int _2657 = int(_2653) & 3;
        float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
        _2647 = _2659;
    }
    float _2661 = _2647;
    float _2663 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2637);
    float _2665 = _2631 + _2437;
    float _2667 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2639);
    float _2669 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2641);
    float _2671 = _2633 * _2603;
    float _2673 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2663);
    float _2675 = _2665 * _2603;
    float _2677 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2667);
    float _2679 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2669);
    bool _2681 = _2671 >= 0.0;
    float _2683 = _2673 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2687 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2689 = _2671 <= 1.0;
    bool _2691 = _2689 && _2681;
    float _2693 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2695 = log2(_2645);
    float _2697 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2699 = _2675 >= 0.0;
    bool _2701 = _2699 && _2691;
    float _2703 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2693);
    float _2705 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2697);
    bool _2707 = _2675 <= 1.0;
    bool _2709 = _2707 && _2701;
    float _2711 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2703);
    float _2713 = _2645;
    if (!_2419)
    {
        float _2715 = floor(_2319);
        _2713 = _2715;
    }
    float _2717 = _2713;
    float _2719 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2721 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2705);
    float _2723 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2711);
    float _2725 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2719);
    float _2727 = 1.0 / _2723;
    float _2729 = _2287 * _2589;
    float _2731 = _2695 * 0.693147182464599609375;
    float _2733 = _2589;
    float _2735 = _2723;
    if (_2709)
    {
        float _2737 = float(_2329);
        _2649 = _2737;
    }
    float _2739 = _2649;
    float _2741 = fma(_1846, _2581, _2729);
    float _2743 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2725);
    float _2745 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2721);
    float _2747 = _2665;
    if (!_2419)
    {
        float _2749 = floor(_2307);
        _2747 = _2749;
    }
    float _2751 = _2747;
    float _2753 = fma(_1848, _2621, _2741);
    float _2755 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2743);
    float _2757 = _2717;
    float _2759 = _2629;
    if (!_2419)
    {
        float _2761 = -_2717;
        float _2763 = _2319 + _2761;
        _2757 = _2763;
    }
    float _2765 = _2757;
    float _2767 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2769 = _2753 + _2629;
    float _2771 = _2739;
    if (_2709)
    {
        float _2773 = rint(_2739);
        float _2775 = precise::max(_2773, 0.0);
        uint _2777 = uint(_2775);
        uint _2779 = clamp(_2777, 0u, 65535u);
        _2771 = as_type<float>(_2779);
    }
    float _2781 = _2771;
    float _2783 = _2755 * _2727;
    float _2785 = _2745 * _2727;
    float _2787 = _2769 * _2603;
    float _2789 = fma(_2783, 0.5, 0.5);
    float _2791 = fma(_2785, -0.5, 0.5);
    float _2793 = _2621;
    float _2795 = _2791;
    float _2797 = _2787;
    if (!_2419)
    {
        float _2799 = rint(_2661);
        float _2801 = precise::max(_2799, 0.0);
        uint _2803 = uint(_2801);
        uint _2805 = clamp(_2803, 0u, 65535u);
        _2793 = as_type<float>(_2805);
    }
    float _2807 = _2793;
    if (!_2419)
    {
        float _2809 = -_2751;
        float _2811 = _2307 + _2809;
        _2759 = _2811;
    }
    float _2813 = _2759;
    float _2815 = _2781;
    if (_2709)
    {
        float3 _8071 = float3(_2671, _2675, float(as_type<int>(_2781)));
        float3 _8075 = select(_8071, float3(0.0), isnan(_8071));
        float _2817 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8075.xy, uint(rint(_8075.z)), _2787, level(0.0));
        _2815 = _2817;
    }
    float _2819 = _2815;
    float3 _8085 = float3(_2789, _2791, _2767);
    float _2821 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8085, float3(0.0), isnan(_8085)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8085, float3(0.0), isnan(_8085)), level(0.0)).x;
    float3 _8094 = float3(_2789, _2791, _2767);
    float4 _2824 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8094, float3(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8094, float3(0.0), isnan(_8094)), level(0.0)).xyzw;
    float _2826 = _2824.x;
    float _2828 = _2824.y;
    float _2830 = _2824.z;
    float _2832 = _2824.w;
    float _2834 = _2813;
    if (!_2419)
    {
        float3 _8117 = float3(_2813, _2765, float(as_type<int>(_2807)));
        float3 _8119 = select(_8117, float3(0.0), isnan(_8117));
        float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8119.xy, uint(rint(_8119.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8119.xy, uint(rint(_8119.z)), level(0.0)).x;
        _2834 = _2836;
    }
    float _2838 = _2834;
    if (_2419)
    {
        _2733 = 1.0;
    }
    float _2840 = _2733;
    float _2842 = _2840;
    if (!_2419)
    {
        int _2844 = int(_2543) << 4;
        int _2846 = _2844 + 2048;
        uint _2848 = uint(int(uint(_2846) >> uint(2)));
        uint _2850 = uint(int(uint(int(_2848)) >> uint(2)));
        int _2852 = int(_2848) & 3;
        float _2854 = (*spvDescriptorSet0.vp_c15)._m0[int(_2850)][_2852];
        int _2856 = int(_2848) + 1;
        uint _2858 = uint(int(uint(_2856) >> uint(2)));
        int _2860 = _2856 & 3;
        float _2862 = (*spvDescriptorSet0.vp_c15)._m0[int(_2858)][_2860];
        int _2864 = _2846 + 8;
        uint _2866 = uint(int(uint(_2864) >> uint(2)));
        uint _2868 = uint(int(uint(int(_2866)) >> uint(2)));
        int _2870 = int(_2866) & 3;
        float _2872 = (*spvDescriptorSet0.vp_c15)._m0[int(_2868)][_2870];
        int _2874 = int(_2866) + 1;
        uint _2876 = uint(int(uint(_2874) >> uint(2)));
        int _2878 = _2874 & 3;
        float _2880 = (*spvDescriptorSet0.vp_c15)._m0[int(_2876)][_2878];
        float _2882 = _2287 * _2862;
        float _2884 = fma(_1846, _2854, _2882);
        float _2886 = fma(_1848, _2872, _2884);
        float _2888 = _2886 + _2880;
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = -_2890;
        float _2894 = _2892 + _2838;
        float _2896 = fma(_2894, 500.0, 1.5);
        float _2898 = exp2(_2896);
        float _2900 = 0.0 + _2898;
        float _2902 = precise::clamp(_2900, 0.0, 1.0);
        _2323 = _2898;
        _2842 = _2902;
    }
    float _2904 = _2323;
    float _2906 = _2842;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2910 = _2529 + _2908;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2914 = _2531 + _2912;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2918 = _2533 + _2916;
    float _2920 = _2910 * _2910;
    float _2922 = fma(_2914, _2914, _2920);
    float _2924 = fma(_2918, _2918, _2922);
    float _2926 = rsqrt(_2924);
    float _2928 = _2926 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2930 = _2914 * _2928;
    float _2932 = _2918 * _2928;
    float _2934 = _2930 * _2930;
    float _2936 = _2932 * _2932;
    float _2938 = _2934 + _2936;
    float _2940 = sqrt(_2938);
    bool _2942 = _2940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2946 = _2940 + _2944;
    float _2948 = _2926;
    float _2950 = _2946;
    float _2952 = _2910;
    float _2954 = _2928;
    if (_2942)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2948 = _2956;
    }
    float _2958 = _2948;
    float _2960 = _2958;
    if (_2942)
    {
        float _2962 = _2946 * _2958;
        _2950 = _2962;
    }
    float _2964 = _2950;
    if (_2942)
    {
        float _2966 = rsqrt(_2938);
        _2960 = _2966;
    }
    float _2968 = _2960;
    float _2970 = _2968;
    if (_2942)
    {
        float _2972 = _2964 * 0.15915493667125701904296875;
        _2413 = _2972;
    }
    float _2974 = _2413;
    float _2976 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2978 = _2918;
    float _2980 = _2974;
    if (_2942)
    {
        float _2982 = _2974 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        _2978 = _2984;
    }
    float _2986 = _2978;
    float _2988 = precise::max(0.0, _2976);
    float _2990 = _2904;
    float _2992 = _2988;
    if (_2942)
    {
        float _2994 = _2974 * 6.283185482025146484375;
        float _2996 = cos(_2994);
        _2990 = _2996;
    }
    float _2998 = _2990;
    float _3000 = -_2928;
    float _3002 = -_2988;
    float _3004 = fma(_2910, _3000, _3002);
    if (_2942)
    {
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2952 = _3006;
    }
    float _3008 = _2952;
    float _3010 = _2986;
    float _3012 = _3008;
    if (_2942)
    {
        float _3014 = fma(_2986, _3008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3010 = _3014;
    }
    float _3016 = _3010;
    float _3018 = _3016;
    if (!_2942)
    {
        _3012 = _2932;
    }
    float _3020 = _3012;
    float _3022 = _3020;
    if (!_2942)
    {
        _2980 = _2934;
    }
    float _3024 = _2980;
    float _3026 = _3024;
    if (_2942)
    {
        float _3028 = _2968 * _3016;
        _2795 = _3028;
    }
    float _3030 = _2795;
    if (!_2942)
    {
        _2970 = _2930;
    }
    float _3032 = _2970;
    float _3034 = _3032;
    float _3036 = _2998;
    if (_2942)
    {
        float _3038 = _2998 + (-1.0);
        _2992 = _3038;
    }
    float _3040 = _2992;
    if (_2942)
    {
        float _3042 = _2930 * _3030;
        _3034 = _3042;
    }
    float _3044 = _3034;
    if (!_2942)
    {
        _3018 = _3004;
    }
    float _3046 = _3018;
    float _3048 = _3046;
    if (_2942)
    {
        float _3050 = _2932 * _3030;
        _3022 = _3050;
    }
    float _3052 = _3022;
    if (_2942)
    {
        float _3054 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2954 = _3054;
    }
    float _3056 = _2954;
    if (_2942)
    {
        float _3058 = _3044 * _3044;
        _3026 = _3058;
    }
    float _3060 = _3026;
    float _3062 = sqrt(_2924);
    if (_2942)
    {
        float _3064 = fma(_3004, _2998, _3056);
        _3048 = _3064;
    }
    float _3066 = _3048;
    if (!_2942)
    {
        _3036 = _2936;
    }
    float _3068 = _3036;
    float _3070 = _3068;
    if (_2942)
    {
        float _3072 = _3052 * _3052;
        _3070 = _3072;
    }
    float _3074 = _3070;
    float _3076 = fma(_3066, _3066, _3060);
    float _3078 = _3076 + _3074;
    float _3080 = rsqrt(_3078);
    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3084 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3082);
    float _3086 = precise::clamp(_3084, 0.0, 1.0);
    float _3088 = -_3086;
    float _3090 = _3088 + 1.0;
    float _3092 = _3080 * _3044;
    float _3094 = _3080 * _3066;
    float _3096 = _3080 * _3052;
    float _3098 = abs(_3090);
    float _3100 = log2(_3098);
    float _3102 = _3092 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3104 = -_3102;
    float _3106 = fma(_3094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3104);
    float _3108 = -_3096;
    float _3110 = fma(_3108, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3106);
    float _3112 = fma(_3110, -0.5, 0.5);
    float _3114 = fma(_3110, 0.5, 0.5);
    float _3116 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3118 = fma(_3114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3120 = sqrt(_3112);
    float _3122 = fma(_3114, _3118, -0.212114393711090087890625);
    float _3124 = _3094 + 1.0;
    float _3126 = fma(_3114, _3122, 1.570728778839111328125);
    float _3128 = exp2(_3116);
    float _3130 = _3120 * 0.636619746685028076171875;
    float _3132 = -_3094;
    float _3134 = fma(_3128, _3124, _3132);
    float _3136 = -_3126;
    float _3138 = fma(_3130, _3136, 1.0);
    float _3140 = fma(_3134, 0.5, 0.5);
    float2 _8593 = float2(_3138, _3140);
    float3 _3144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).xyz;
    float _3146 = _3144.x;
    float _3148 = _3144.y;
    float _3150 = _3144.z;
    float _3152 = abs(_2295);
    float _3154 = log2(_3152);
    float _3156 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3158 = -_2209;
    float _3160 = _3158 + 1.0;
    float _3162 = _2755 + _2723;
    float _3164 = exp2(_3156);
    float _3166 = _3162 * 0.5;
    float _3168 = _3154 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3170 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3172 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3170);
    float _3174 = exp2(_3168);
    float _3176 = -_3164;
    float _3178 = _3176 + 1.0;
    float _3180 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3182 = _3180 * _2821;
    float _3184 = fma(_3174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3186 = precise::clamp(_3184, 0.0, 1.0);
    float _3188 = _2723 * 0.5;
    float _3190 = fma(_3186, -2.0, 3.0);
    float _3192 = _3186 * _3186;
    float _3194 = _3192 * _3190;
    float _3196 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3172);
    float _3198 = -_3194;
    float _3200 = _3198 + 1.0;
    float _3202 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3196);
    float _3204 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3194);
    bool _3206 = _2295 <= 8000.0;
    bool _3208 = isnan(_2295);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(8000.0);
    bool _3214 = _3210 || _3212;
    float _3216 = float(_3214);
    float _3218 = fma(_2745, -0.5, _3188);
    float _3220 = _3188;
    float _3222 = _3160;
    float _3224 = _3202;
    if (!_2709)
    {
        _3220 = 1.0;
    }
    float _3226 = _3220;
    out.gl_Position.x = _2755;
    out.gl_Position.y = _2745;
    out.gl_Position.z = _3202;
    out.gl_Position.w = _2723;
    float _3228 = _3226;
    if (_2709)
    {
        bool _3230 = _2819 >= _2787;
        bool _3232 = isnan(_2819);
        bool _3234 = _3230 || _3232;
        bool _3236 = isnan(_2787);
        bool _3238 = _3234 || _3236;
        float _3240 = float(_3238);
        _3228 = _3240;
    }
    float _3242 = _3228;
    float _3244 = _3216 * _3204;
    float _3246 = _3202 + _2723;
    bool _3248 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3250 = isnan(_3062);
    bool _3252 = _3248 || _3250;
    bool _3254 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3256 = _3252 || _3254;
    float _3258 = _3244 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3260 = _3242 * _2906;
    float _3262 = _3246 * 0.5;
    float _3264 = _3160 * _3258;
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    out.m_85.x = _3166;
    out.m_85.y = _3218;
    out.m_85.z = _3262;
    out.m_85.w = _2723;
    float _3268 = -_3266;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3272 = _2832 * _3182;
    float _3274 = -_3180;
    float _3276 = _3274 + 1.0;
    float _3278 = _3276;
    float _3280 = _3272;
    if (!_3256)
    {
        _2797 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3282 = _2797;
    float _3284 = -_3260;
    float _3286 = fma(_3284, _3270, 1.0);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    float _3290 = _3282;
    float _3292 = _3282;
    if (!_3256)
    {
        _3222 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3294 = _3222;
    float _3296 = _2832 * _3276;
    float _3298 = _3294;
    float _3300 = _3294;
    if (!_3256)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3302 = _2735;
    float _3304 = _3288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3306 = _3302;
    float _3308 = _3302;
    if (!_3256)
    {
        _3224 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3310 = _3224;
    float _3312 = _3310;
    float _3314 = _3310;
    if (!_3256)
    {
        _3278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3316 = _3278;
    out.m_87.x = _3304;
    float _3318 = _3150 * _3182;
    float _3320 = fma(_3146, _3272, _2826);
    float _3322 = fma(_3148, _3272, _2828);
    float _3324 = _3316;
    float _3326 = _3316;
    if (!_3256)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3328 = _3280;
    float _3330 = fma(_2832, _3318, _2830);
    out.m_89.x = _3320;
    out.m_89.y = _3322;
    out.m_89.z = _3330;
    out.m_89.w = _3296;
    bool _3332 = !_3256;
    float _3334 = _3328;
    float _3336 = _3328;
    if (!_3332)
    {
        bool _3338 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3340 = isnan(_3062);
        bool _3342 = _3338 || _3340;
        bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3346 = _3342 || _3344;
        if (!_3346)
        {
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3350 = _3062 + _3348;
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3354 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3352;
            float _3356 = 1.0 / _3354;
            float _3358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3364 = _3362 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3366 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3368 = _3366 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3372 = _3370 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3374 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3376 = _3374 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3378 = _3350 * _3356;
            float _3380 = precise::clamp(_3378, 0.0, 1.0);
            float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3386 = fma(_3380, _3360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3388 = fma(_3380, _3384, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3390 = fma(_3380, _3364, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3392 = fma(_3380, _3368, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3394 = fma(_3380, _3372, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3396 = fma(_3380, _3376, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3300 = _3388;
            _3336 = _3394;
            _3292 = _3386;
            _3314 = _3392;
            _3308 = _3390;
            _3326 = _3396;
            _3398 = true;
        }
        else
        {
            bool _3400 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3402 = isnan(_3062);
            bool _3404 = _3400 || _3402;
            bool _3406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3408 = _3404 || _3406;
            if (!_3408)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3410 = _3290;
            _3292 = _3410;
            if (!_3408)
            {
                _3298 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3412 = _3298;
            _3300 = _3412;
            if (!_3408)
            {
                _3306 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3414 = _3306;
            _3308 = _3414;
            if (!_3408)
            {
                _3312 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3416 = _3312;
            _3314 = _3416;
            if (!_3408)
            {
                _3334 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3418 = _3334;
            _3336 = _3418;
            if (!_3408)
            {
                _3324 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3420 = _3324;
            bool _3422 = !_3408;
            _3326 = _3420;
            if (!_3422)
            {
                bool _3424 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3426 = isnan(_3062);
                bool _3428 = _3424 || _3426;
                bool _3430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3432 = _3428 || _3430;
                if (!_3432)
                {
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3436 = _3062 + _3434;
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3440 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3438;
                    float _3442 = 1.0 / _3440;
                    float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3464 = _3436 * _3442;
                    float _3466 = precise::clamp(_3464, 0.0, 1.0);
                    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3470 = _3468 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3472 = fma(_3466, _3446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3474 = fma(_3466, _3470, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3476 = fma(_3466, _3450, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3478 = fma(_3466, _3454, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3480 = fma(_3466, _3458, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3482 = fma(_3466, _3462, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3300 = _3474;
                    _3336 = _3480;
                    _3292 = _3472;
                    _3314 = _3478;
                    _3308 = _3476;
                    _3326 = _3482;
                    _3398 = true;
                }
                else
                {
                    _3300 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3336 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3314 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3308 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3326 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3398 = false;
    float _3484 = _3300;
    float _3486 = _3336;
    float _3488 = _3292;
    float _3490 = _3314;
    float _3492 = _3308;
    float _3494 = _3326;
    float _3496 = fma(_2109, -0.5, 0.5);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = -_3484;
    float _3502 = _3500 + _3486;
    float _3504 = -_3488;
    float _3506 = _3504 + _3490;
    float _3508 = -_3492;
    float _3510 = _3508 + _3494;
    bool _3512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3514 = fma(_3498, _3502, _3484);
    float _3516 = fma(_3498, _3506, _3488);
    float _3518 = fma(_3498, _3510, _3492);
    float _3520 = _3514 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3522 = fma(_3516, 0.298911988735198974609375, _3520);
    float _3524 = fma(_3518, 0.114477999508380889892578125, _3522);
    float _3526 = -_3524;
    float _3528 = _3516 + _3526;
    float _3530 = -_3524;
    float _3532 = _3514 + _3530;
    float _3534 = -_3524;
    float _3536 = _3518 + _3534;
    float _3538 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3540 = fma(_3528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    float _3542 = fma(_3532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    float _3544 = fma(_3536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    out.m_61.x = _3538;
    out.m_93.x = _3540;
    out.m_93.y = _3542;
    out.m_93.z = _3544;
    if (!_3512)
    {
        return out;
    }
    float _3546 = -_2529;
    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3550 = -_2531;
    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3554 = -_2533;
    float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3558 = _3548 * _3548;
    float _3560 = fma(_3552, _3552, _3558);
    float _3562 = fma(_3556, _3556, _3560);
    float _3564 = sqrt(_3562);
    float _3566 = rsqrt(_3562);
    float _3568 = -_3564;
    float _3570 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3572 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3574 = precise::clamp(_3572, 0.0, 1.0);
    float _3576 = _3552 * _3566;
    float _3578 = _3548 * _3566;
    float _3580 = abs(_3574);
    float _3582 = log2(_3580);
    float _3584 = _3556 * _3566;
    float _3586 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3588 = _2109 * _3578;
    float _3590 = -_3578;
    float _3592 = -_3586;
    float _3594 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3592);
    float _3596 = fma(_2107, _3576, _3588);
    float _3598 = -_3584;
    float _3600 = fma(_3598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3594);
    float _3602 = fma(_2113, _3584, _3596);
    float _3604 = precise::clamp(_3602, 0.0, 1.0);
    float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3608 = _3600 + _3606;
    float _3610 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3614 = precise::clamp(_3612, 0.0, 1.0);
    float _3616 = exp2(_3610);
    float _3618 = _3616 * _3614;
    float _3620 = _3604 * _3618;
    float _3622 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3624 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3626 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3622;
    out.m_91.y = _3624;
    out.m_91.z = _3626;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3398 = false;
    bool _2161 = false;
    bool _786 = false;
    bool _310 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_58.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3683 = as_type<float>(_128);
        out.gl_Position.z = _3683;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_63.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3753 = as_type<float>(_166);
        out.gl_Position.z = _3753;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_65.w;
    float _170 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_63.x;
    float _184 = in.m_63.y;
    float _186 = in.m_63.z;
    float _188 = in.m_58.x;
    float _190 = in.m_58.y;
    float _192 = in.m_58.z;
    float _194 = 0.0;
    float _196 = _170;
    if (!_180)
    {
        float _198 = _170 * _170;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    bool _210 = !_180;
    float _212 = _208;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _170 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _170);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_180;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _170 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _196 = _266;
    }
    float _268 = _196;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _272 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _278 = fma(_268, _182, _272);
    float _280 = fma(_268, _184, _274);
    float _282 = fma(_268, _186, _276);
    float _284 = fma(_278, _168, _188);
    float _286 = fma(_280, _168, _190);
    float _288 = fma(_282, _168, _192);
    bool _290 = !_270;
    float _308;
    if (!_290)
    {
        float _292 = in.m_67.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        float _312 = float(_112);
        float _314 = 1.0 / _312;
        float _316 = _146 * _314;
        _308 = _316;
    }
    _310 = false;
    float _318 = _308;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = _318 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _336;
    float _340 = 1.0 / _330;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _354;
    float _358 = 1.0 / _334;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = _318 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _372 = 1.0 / _338;
    float _374 = _362 * _340;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _318 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = _318 + _380;
    float _384 = fma(_366, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _386 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _388 = isnan(_318);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = 1.0 / _348;
    float _400 = _378 * _358;
    bool _402 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _404 = isnan(_318);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = fma(_370, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = 1.0 / _352;
    float _428 = _382 * _372;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _432 = _318 + _430;
    float _434 = -_412;
    float _436 = _434 + 1.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _446 = fma(_420, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _448 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _450 = isnan(_318);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = 1.0 / _356;
    bool _462 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _464 = isnan(_318);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = fma(_440, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _476 = fma(_444, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _482;
    float _486 = _472 * _436;
    float _488 = -_396;
    float _490 = _488 + 1.0;
    float _492 = 1.0 / _344;
    float _494 = _322 * _426;
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = fma(_480, _428, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _502 = _458 * _490;
    float _504 = -_458;
    float _506 = _504 + 1.0;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _512 = _432 * _460;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _516 = _318 + _514;
    bool _518 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _520 = isnan(_318);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _516 * _398;
    bool _532 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _534 = isnan(_318);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = _326 * _492;
    float _546 = -_528;
    float _548 = _546 + 1.0;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = _542 * _498;
    float _554 = -_542;
    float _556 = _554 + 1.0;
    bool _558 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _560 = isnan(_318);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _528 * _556;
    float _572 = _568 * _548;
    float _574 = -_568;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _578;
    float _582 = _396 * _576;
    float _584 = fma(_580, _428, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _586 = fma(_484, _428, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _588 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _590 = isnan(_318);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = _598 * _506;
    float _610 = -_598;
    float _612 = _610 + 1.0;
    float _614 = fma(_606, _494, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _616 = fma(_602, _494, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _618 = _384 * _608;
    float _620 = _474 * _608;
    float _622 = _424 * _608;
    float _624 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _618);
    float _626 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _620);
    float _628 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _622);
    float _630 = fma(_510, _494, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _632 = fma(_422, _502, _624);
    float _634 = fma(_476, _502, _626);
    float _636 = fma(_446, _502, _628);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _642 = fma(_584, _582, _632);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _644;
    float _648 = fma(_500, _582, _634);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _654 = fma(_586, _582, _636);
    float _656 = fma(_640, _530, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _658 = fma(_614, _572, _642);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _660;
    float _664 = in.m_65.x;
    float _666 = in.m_65.y;
    float _668 = in.m_65.z;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _670;
    float _674 = fma(_652, _530, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _676 = fma(_616, _572, _648);
    float _678 = fma(_630, _572, _654);
    float _680 = fma(_646, _544, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _682 = fma(_662, _544, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _684 = fma(_672, _544, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = fma(_680, _570, _658);
    float _692 = fma(_682, _570, _676);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _698;
    float _702 = fma(_688, _530, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _704;
    float _708 = fma(_684, _570, _678);
    float _710 = fma(_696, _512, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _712 = fma(_700, _512, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _714 = fma(_674, _552, _690);
    float _716 = fma(_706, _512, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _718 = fma(_656, _552, _692);
    float _720 = fma(_702, _552, _708);
    float _722 = fma(_710, _486, _714);
    float _724 = fma(_712, _486, _718);
    float _726 = fma(_716, _486, _720);
    float _728 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].x, _722);
    float _730 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].y, _724);
    float _732 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[150].z, _726);
    float _734 = _728 * _664;
    float _736 = _730 * _666;
    float _738 = _732 * _668;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _752 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _756 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _766 = !_550;
    float _784;
    if (!_766)
    {
        float _768 = in.m_67.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_112);
        float _790 = 1.0 / _788;
        float _792 = _146 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _798 = log2(_796);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _808 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _810 = 1.0 / _806;
    float _812 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _808);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _818 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = in.m_67.z;
    float _838 = 1.0 / _816;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _844 = in.m_67.y;
    float _846 = 1.0 / _822;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _852 = in.m_67.x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _854;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _862;
    float _866 = 1.0 / _842;
    float _868 = _856 * _810;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _886 = _836 * 2.0;
    float _888 = 1.0 / _850;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _892 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _894 = _860 * _846;
    float _896 = _798 * _146;
    float _898 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _890);
    float _900 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _892);
    float _902 = 1.0 / _884;
    float _904 = _864 * _866;
    float _906 = _872 * _838;
    float _908 = _844 * 2.0;
    float _910 = fma(_904, _802, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _912 = floor(_886);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _918 = _880 * _888;
    float _920 = _852 + _836;
    bool _922 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(1.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = 1.0 / _916;
    float _934 = _920 + (-1.0);
    float _936 = _876 * _902;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _940 = 1.0 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _942;
    bool _946 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _954 = _950 || _952;
    float _956 = exp2(_896);
    float _958 = _844 + _836;
    bool _960 = _912 > 0.0;
    float _962 = _836 + (-0.5);
    bool _964 = _912 >= 0.0;
    bool _966 = isnan(_912);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _958 + (-1.0);
    float _976 = _852 + _844;
    float _978 = 1.0 / _940;
    float _980 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = _852 * 2.0;
    float _984 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _986 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _988 = isnan(_794);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _944 * _932;
    bool _1000 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1002 = isnan(_794);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _976 + (-1.0);
    float _1014 = floor(_982);
    float _1016 = -_956;
    float _1018 = _1016 + 1.0;
    float _1020 = -_996;
    float _1022 = _1020 + 1.0;
    float _1024 = -_1010;
    float _1026 = _1024 + 1.0;
    int _1028 = _972 ? 0 : 1;
    float _1030 = _954 ? _1018 : 0.0;
    float _1032 = _1010 * _1022;
    float _1034 = floor(_908);
    bool _1036 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1038 = isnan(_794);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1050 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1052 = isnan(_794);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1058 = _1054 || _1056;
    float _1060 = float(_1058);
    if (_930)
    {
        float _1062 = _1030 * _978;
        _148 = _1062;
    }
    float _1064 = _148;
    bool _1066 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1068 = isnan(_794);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = -_1046;
    float _1080 = _1078 + 1.0;
    float _1082 = _1046 * _1026;
    bool _1084 = _1014 >= 0.0;
    bool _1086 = isnan(_1014);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan(0.0);
    bool _1092 = _1088 || _1090;
    float _1094 = _1060 * _1080;
    float _1096 = -_1060;
    float _1098 = _1096 + 1.0;
    bool _1100 = _1014 > 0.0;
    float _1102 = _1076 * _1098;
    float _1104 = -_1076;
    float _1106 = _1104 + 1.0;
    int _1108 = _1092 ? 0 : 1;
    float _1110 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _898);
    bool _1112 = _1034 > 0.0;
    float _1114 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _900);
    bool _1116 = _1034 >= 0.0;
    bool _1118 = isnan(_1034);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _812);
    bool _1128 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1130 = isnan(_794);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1142 = _794 + _1140;
    bool _1144 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1146 = isnan(_794);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    bool _1156 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1158 = isnan(_794);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -_1138;
    float _1170 = _1168 + 1.0;
    float _1172 = fma(_868, _1142, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1174 = _1154 * _1106;
    float _1176 = -_1154;
    float _1178 = _1176 + 1.0;
    float _1180 = _1166 * _1170;
    float _1182 = -_1166;
    float _1184 = _1182 + 1.0;
    float _1186 = rsqrt(_1126);
    float _1188 = _1138 * _1178;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1192 = _794 + _1190;
    float _1194 = _1172 * _1180;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1198 = _794 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1202 = _794 + _1200;
    float _1204 = fma(_894, _1192, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1208 = _794 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1212 = _794 + _1210;
    float _1214 = fma(_936, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1216 = _1124 ? 0 : 1;
    float _1218 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1194);
    float _1220 = fma(_998, _1212, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1222 = fma(_906, _1202, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1224 = ~_1216;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = fma(_1204, _1188, _1218);
    int _1232 = _1228;
    float _1234 = _1110;
    if (!_1112)
    {
        int _1236 = ~_1216;
        int _1238 = _1236 + 1;
        _1232 = _1238;
    }
    int _1240 = _1232;
    float _1242 = fma(_918, _1208, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1244 = !_826;
    int _1246 = _1244 ? 0 : 1;
    float _1248 = fma(_910, _1174, _1230);
    bool _1250 = !_830;
    int _1252 = _1250 ? 0 : 1;
    int _1254 = abs(_1246);
    float _1256 = fma(_1222, _1102, _1248);
    float _1258 = abs(_1114);
    bool _1260 = _1258 > 0.001000000047497451305389404296875;
    int _1262 = ~_1028;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = fma(_1214, _1094, _1256);
    int _1270 = abs(_1252);
    int _1272 = _1266;
    if (!_960)
    {
        int _1274 = ~_1028;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    float _1280 = fma(_1242, _1082, _1268);
    float _1282 = _1260 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1284 = fma(_1220, _1032, _1280);
    float _1286 = float(_1254);
    float _1288 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1290 = float(_1278);
    float _1292 = _1114 + _1282;
    bool _1294 = !_834;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1284);
    int _1300 = ~_1108;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = _1286 * _1290;
    int _1308 = abs(_1296);
    int _1310 = _1304;
    float _1312 = _1292;
    int _1314 = as_type<int>(_1288);
    if (!_1100)
    {
        int _1316 = ~_1108;
        int _1318 = _1316 + 1;
        _1310 = _1318;
    }
    int _1320 = _1310;
    float _1322 = _1306 * (-2.0);
    float _1324 = float(_1240);
    float _1326 = fma(_1048, _1322, _1048);
    float _1328 = abs(_1110);
    float _1330 = abs(_1292);
    float _1332 = precise::max(_1328, _1330);
    float _1334 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1336 = float(_1308);
    float _1338 = float(_1270);
    float _1340 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1342 = float(_1320);
    float _1344 = _1336 * _1324;
    bool _1346 = _1332 >= 16.0;
    float _1348 = _852 + (-0.5);
    float _1350 = _1338 * _1342;
    float _1352 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1354 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1356 = _1334 * _1334;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1360 = _1358 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1362 = _1350 * (-2.0);
    float _1364 = fma(_1326, _1064, _1354);
    float _1366 = fma(_1288, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1340);
    float _1368 = fma(_1298, _1360, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _1370 = fma(_1288, _1288, _1356);
    float _1372 = fma(_980, _1362, _980);
    float _1374 = _844 + (-0.5);
    float _1376 = in.m_69.y;
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1366);
    float _1380 = _284 * _1368;
    float _1382 = fma(_1352, _1352, _1370);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1386 = _1344 * (-2.0);
    float _1388 = _1378 * _1380;
    float _1390 = fma(_1372, _1064, _1384);
    int _1392 = as_type<int>(_1342);
    if (_1346)
    {
        float _1394 = _1110 * 0.0625;
        _1234 = _1394;
    }
    float _1396 = _1234;
    float _1398 = fma(_1388, _1386, _1388);
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1402 = _1400 != 0;
    if (_1346)
    {
        float _1404 = _1292 * 0.0625;
        _1312 = _1404;
    }
    float _1406 = _1312;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1410 = _1408 != 0;
    float _1412 = fma(_984, _1386, _984);
    float _1414 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1398);
    float _1416 = abs(_1396);
    bool _1418 = _1416 != 0.0;
    bool _1420 = isnan(_1416);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan(0.0);
    bool _1426 = _1422 || _1424;
    float _1428 = in.m_71.x;
    float _1430 = in.m_71.y;
    float _1432 = in.m_71.z;
    bool _1434 = _844 > 0.5;
    float _1436 = fma(_1412, _1064, _1414);
    float _1438 = abs(_1406);
    bool _1440 = _1438 == 0.0;
    bool _1442 = !_1426;
    bool _1444 = _1440 && _1442;
    float _1446 = _1364 * 0.15915493667125701904296875;
    float _1448 = _286 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1450 = _286 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1452 = -_1376;
    float _1454 = _1452 + 1.0;
    float _1456 = _286 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1458 = rsqrt(_1382);
    float _1460 = _1390 * 0.15915493667125701904296875;
    float _1462 = _1436 * 0.15915493667125701904296875;
    float _1464 = _1376;
    bool _1466 = _1434;
    if (_1410)
    {
        float _1468 = _1434 ? _1454 : _1376;
        _1464 = _1468;
    }
    float _1470 = _1464;
    float _1472 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1450);
    float _1474 = abs(_1406);
    bool _1476 = _1474 == 0.0;
    if (_1444)
    {
        bool _1478 = as_type<int>(_1406) >= 0;
        _1466 = _1478;
    }
    bool _1480 = _1466;
    float _1482 = _1446 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1448);
    bool _1488 = _852 > 0.5;
    bool _1490 = _1488 && _1402;
    int _1492 = _1480 ? (-1) : 0;
    if (_1444)
    {
        int _1494 = _1480 ? 0 : 1078530011;
        _1392 = _1494;
    }
    int _1496 = _1392;
    float _1498 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1430);
    float _1500 = _1446 * 6.283185482025146484375;
    float _1502 = cos(_1500);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1432);
    float _1506 = _1288 * _1458;
    float _1508 = _1352 * _1458;
    float _1510 = _1460 * 6.283185482025146484375;
    float _1512 = sin(_1510);
    float _1514 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1456);
    float _1516 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1518 = _738 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1520 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1428);
    float _1522 = _1460 * 6.283185482025146484375;
    float _1524 = cos(_1522);
    float _1526 = _1516 * _1520;
    float _1528 = _818 * _1498;
    float _1530 = _1518 * _1504;
    float _1532 = _1334 * _1458;
    float _1534 = _1518;
    if (_1444)
    {
        int _1536 = int(0x80000000) & as_type<int>(_1396);
        int _1538 = _1496 | _1536;
        _1534 = as_type<float>(_1538);
    }
    float _1540 = _1534;
    float _1542 = _1462 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = _1462 * 6.283185482025146484375;
    float _1548 = cos(_1546);
    bool _1550 = !_1426;
    bool _1552 = _1550 && _1476;
    float _1554 = _1540;
    float _1556 = _1540;
    if (!_1552)
    {
        float _1558 = abs(_1396);
        bool _1560 = _1558 != as_type<float>(0x7f800000u /* inf */);
        bool _1562 = isnan(_1558);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1568 = _1564 || _1566;
        float _1570 = abs(_1406);
        bool _1572 = _1570 == as_type<float>(0x7f800000u /* inf */);
        float _1574 = abs(_1406);
        bool _1576 = _1574 == as_type<float>(0x7f800000u /* inf */);
        bool _1578 = !_1568;
        bool _1580 = _1576 && _1578;
        if (_1580)
        {
            bool _1582 = as_type<int>(_1406) >= 0;
            _1492 = _1582 ? (-1) : 0;
        }
        int _1584 = _1492;
        if (_1580)
        {
            _1314 = 1075235812;
        }
        int _1586 = _1314;
        int _1588 = _1586;
        if (_1580)
        {
            int _1590 = ~_1584;
            int _1592 = (_1590 != 0) ? _1586 : 1061752795;
            _1588 = _1592;
        }
        int _1594 = _1588;
        if (_1580)
        {
            int _1596 = int(0x80000000) & as_type<int>(_1396);
            int _1598 = _1594 | _1596;
            _1554 = as_type<float>(_1598);
        }
        float _1600 = _1554;
        bool _1602 = !_1568;
        bool _1604 = _1602 && _1572;
        _1556 = _1600;
        if (!_1604)
        {
            float _1606 = abs(_1396);
            float _1608 = abs(_1406);
            float _1610 = precise::max(_1606, _1608);
            float _1612 = abs(_1396);
            float _1614 = abs(_1406);
            float _1616 = precise::min(_1612, _1614);
            float _1618 = 1.0 / _1610;
            float _1620 = abs(_1396);
            float _1622 = abs(_1406);
            bool _1624 = _1620 > _1622;
            bool _1626 = as_type<int>(_1406) >= 0;
            float _1628 = _1616 * _1618;
            float _1630 = _1628 * _1628;
            float _1632 = _1630 + 11.33538818359375;
            float _1634 = fma(_1630, _1632, 28.84246826171875);
            float _1636 = fma(_1630, _1634, 19.6966705322265625);
            float _1638 = fma(_1630, -0.82336294651031494140625, -5.674867153167724609375);
            float _1640 = fma(_1630, _1638, -6.565555095672607421875);
            float _1642 = 1.0 / _1636;
            float _1644 = _1630 * _1640;
            float _1646 = abs(_1396);
            float _1648 = abs(_1406);
            float _1650 = _1646 + _1648;
            float _1652 = _1628 * _1644;
            bool _1654 = _1650 > as_type<float>(0x7f800000u /* inf */);
            bool _1656 = isnan(_1650);
            bool _1658 = _1654 || _1656;
            bool _1660 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1662 = _1658 || _1660;
            float _1664 = fma(_1652, _1642, _1628);
            int _1666 = as_type<int>(_1396) & int(0x80000000);
            float _1668 = _1664;
            _1556 = _1650;
            if (_1624)
            {
                float _1670 = -_1664;
                float _1672 = _1670 + 1.57079637050628662109375;
                _1668 = _1672;
            }
            float _1674 = _1668;
            int _1676 = as_type<int>(_1674);
            if (!_1626)
            {
                float _1678 = -_1674;
                float _1680 = _1678 + 3.1415927410125732421875;
                _1676 = as_type<int>(_1680);
            }
            int _1682 = _1676;
            if (!_1662)
            {
                int _1684 = _1666 | _1682;
                _1556 = as_type<float>(_1684);
            }
        }
    }
    float _1686 = _1556;
    float _1688 = _1484 * _1512;
    float _1690 = _1502 * _1524;
    float _1692 = _1502 * _1512;
    float _1694 = _1484 * _1524;
    float _1696 = _1502 * _1548;
    float _1698 = _1686 * (-0.15915493667125701904296875);
    float _1700 = _1484 * _1548;
    float _1702 = _1524 * _1548;
    float _1704 = fma(_1544, _1690, _1688);
    float _1706 = -_1528;
    float _1708 = _1544 * _1706;
    float _1710 = _1512 * _1548;
    float _1712 = fma(_1544, _1688, _1690);
    float _1714 = _1696 * _1528;
    float _1716 = _1698 * 6.283185482025146484375;
    float _1718 = cos(_1716);
    float _1720 = -_1694;
    float _1722 = fma(_1544, _1692, _1720);
    float _1724 = -_1692;
    float _1726 = fma(_1544, _1694, _1724);
    float _1728 = _1700 * _1528;
    float _1730 = fma(_1702, _1526, _1708);
    float _1732 = fma(_1704, _1526, _1714);
    bool _1734 = _1430 != 0.0;
    bool _1736 = isnan(_1430);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan(0.0);
    bool _1742 = _1738 || _1740;
    float _1744 = fma(_1726, _1526, _1728);
    float _1746 = _1698 * 6.283185482025146484375;
    float _1748 = sin(_1746);
    float _1750 = fma(_1722, _1530, _1732);
    float _1752 = fma(_1710, _1530, _1730);
    float _1754 = fma(_1712, _1530, _1744);
    bool _1756 = _1428 == 0.0;
    bool _1758 = !_1742;
    bool _1760 = _1756 && _1758;
    float _1762 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1766 = _1750 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1768 = -_1718;
    float _1770 = _1768 + 1.0;
    float _1772 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1762);
    float _1774 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1764);
    float _1776 = _1508 * _1508;
    float _1778 = _1506 * _1770;
    float _1780 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1772);
    float _1782 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1766);
    float _1784 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1774);
    float _1786 = _1508 * _1748;
    float _1788 = fma(_1770, _1776, _1718);
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1792 = _1506 * _1748;
    float _1794 = -_1786;
    float _1796 = fma(_1532, _1778, _1794);
    float _1798 = _1532 * _1770;
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1782);
    float _1802 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1804 = fma(_1506, _1778, _1718);
    float _1806 = _1790 * _1796;
    float _1808 = in.m_73.x;
    float _1810 = in.m_73.y;
    float _1812 = in.m_73.z;
    float _1814 = _1532 * _1748;
    float _1816 = fma(_1508, _1798, _1792);
    float _1818 = fma(_1802, _1804, _1806);
    float _1820 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1822 = -_1814;
    float _1824 = fma(_1508, _1778, _1822);
    float _1826 = _1790 * _1816;
    float _1828 = fma(_1508, _1778, _1814);
    float _1830 = in.m_69.x;
    bool _1832 = _1432 == 0.0;
    bool _1834 = _1832 && _1760;
    float _1836 = fma(_1802, _1824, _1826);
    float _1838 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1486);
    float _1840 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1514);
    float _1842 = fma(_1820, _1828, _1818);
    float _1844 = fma(_1820, _1788, _1836);
    float _1846 = _1838 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1848 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1850 = fma(_288, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1472);
    float _1852 = fma(_1532, _1778, _1786);
    float _1854 = _1846 + _1842;
    float _1856 = _1848 + _1844;
    float _1858 = fma(_1532, _1798, _1718);
    float _1860 = -_1792;
    float _1862 = fma(_1508, _1798, _1860);
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1866 = _1854 + _1864;
    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1870 = _1856 + _1868;
    float _1872 = _1810;
    float _1874 = _1812;
    float _1876 = _1816;
    float _1878 = _1808;
    float _1880 = _1726;
    if (!_1834)
    {
        float _1882 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1810);
        _1872 = _1882;
    }
    float _1884 = _1872;
    if (!_1834)
    {
        float _1886 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1812);
        _1874 = _1886;
    }
    float _1888 = _1874;
    float _1890 = _1866 * _1866;
    float _1892 = _1870 * _1870;
    float _1894 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1896 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1898 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1900 = _1890 + _1892;
    float _1902 = _1830;
    float _1904 = _1892;
    float _1906 = _1890;
    if (_1402)
    {
        _1876 = _1830;
    }
    float _1908 = _1876;
    float _1910 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1912 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1914 = sqrt(_1900);
    float _1916 = _1704 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1918 = _1908;
    if (_1490)
    {
        float _1920 = -_1908;
        float _1922 = _1920 + 1.0;
        _1918 = _1922;
    }
    float _1924 = _1918;
    if (!_1834)
    {
        float _1926 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1808);
        _1878 = _1926;
    }
    float _1928 = _1878;
    float _1930 = -_1544;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1894);
    float _1934 = -_1544;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1938 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1910);
    if (_1402)
    {
        _1902 = _1924;
    }
    float _1940 = _1902;
    float _1942 = -_1544;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1898);
    float _1946 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1912);
    float _1948 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1916);
    float _1950 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1952 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1954 = _1790 * _1858;
    float _1956 = _1722 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1958 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1950);
    bool _1960 = _1914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1962 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1952);
    float _1964 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1956);
    float _1966 = fma(_1802, _1852, _1954);
    float _1968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1970 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1932);
    float _1972 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1936);
    float _1974 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1944);
    float _1976 = fma(_1820, _1862, _1966);
    float _1978 = _1850 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1980 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1938);
    float _1982 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1946);
    float _1984 = _1978 + _1976;
    float _1986 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1948);
    float _1988 = _1966;
    float _1990 = _1976;
    uint _1993 = as_type<uint>(_1978);
    if (!_1960)
    {
        _1880 = _1892;
    }
    float _1995 = _1880;
    float _1997 = _1995;
    if (!_1960)
    {
        _1904 = _1854;
    }
    float _1999 = _1904;
    float _2001 = _1999;
    if (!_1960)
    {
        _1988 = _1856;
    }
    float _2003 = _1988;
    float _2005 = _2003;
    if (!_1960)
    {
        _1990 = _1984;
    }
    float _2007 = _1990;
    bool _2009 = !_1960;
    float _2011 = _2007;
    if (!_2009)
    {
        float _2013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2017 = _1914 + _2015;
        float _2019 = rsqrt(_1900);
        float _2021 = _2017 * _2013;
        float _2023 = _1984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2025 = _2021 * 0.15915493667125701904296875;
        float _2027 = _2025 * 6.283185482025146484375;
        float _2029 = sin(_2027);
        float _2031 = _2025 * 6.283185482025146484375;
        float _2033 = cos(_2031);
        float _2035 = fma(_2029, _2023, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2037 = _2019 * _2035;
        float _2039 = _2033 + (-1.0);
        float _2041 = fma(_1866, _2037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2043 = fma(_1870, _2037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2045 = _2039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2049 = _2041 + _2047;
        float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2053 = _2043 + _2051;
        float _2055 = fma(_1984, _2033, _2045);
        float _2057 = _2049 * _2049;
        float _2059 = _2053 * _2053;
        _2011 = _2055;
        _1906 = _2057;
        _1997 = _2059;
        _2001 = _2041;
        _2005 = _2043;
    }
    float _2061 = _2011;
    float _2063 = _1906;
    float _2065 = _1997;
    float _2067 = _2001;
    float _2069 = _2005;
    float _2071 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1958);
    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2075 = _2061 + _2073;
    float _2077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2079 = _1970 * _1884;
    float _2081 = _1972 * _1884;
    float _2083 = fma(_2075, _2075, _2063);
    float _2085 = _1974 * _1884;
    float _2087 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1962);
    float _2089 = fma(_1980, _1928, _2079);
    float _2091 = _2083 + _2065;
    float _2093 = fma(_1982, _1928, _2081);
    float _2095 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2097 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1964);
    float _2099 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2101 = fma(_1986, _1928, _2085);
    float _2103 = sqrt(_2091);
    float _2105 = _2095 * _1968;
    float _2107 = fma(_2071, _1888, _2089);
    float _2109 = fma(_2087, _1888, _2093);
    float _2111 = _2099 * _2077;
    float _2113 = fma(_2097, _1888, _2101);
    out.m_75.x = _752;
    out.m_75.y = _756;
    out.m_75.z = _758;
    out.m_75.w = _754;
    out.m_77.x = _760;
    out.m_77.y = _762;
    out.m_77.z = _764;
    out.m_79.x = 1.0;
    out.m_79.y = 1.0;
    out.m_79.z = 1.0;
    bool _2115 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2117 = isnan(_2103);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2123 = _2119 || _2121;
    out.m_81.x = _2105;
    out.m_81.y = _2111;
    out.m_83.x = _2107;
    out.m_83.y = _2109;
    out.m_83.z = _2113;
    float _2125 = _2099;
    if (!_2123)
    {
        _2125 = 1.0;
    }
    float _2127 = _2125;
    bool _2129 = !_2123;
    float _2131 = _2127;
    if (!_2129)
    {
        bool _2133 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2135 = isnan(_2103);
        bool _2137 = _2133 || _2135;
        bool _2139 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2141 = _2137 || _2139;
        if (!_2141)
        {
            float _2143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2145 = _2103 + _2143;
            float _2147 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2149 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2147;
            float _2151 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2153 = _2151 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2155 = 1.0 / _2149;
            float _2157 = _2145 * _2155;
            float _2159 = fma(_2157, _2153, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2131 = _2159;
            _2161 = true;
        }
        else
        {
            bool _2163 = _2103 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2165 = isnan(_2103);
            bool _2167 = _2163 || _2165;
            bool _2169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2171 = _2167 || _2169;
            if (!_2171)
            {
                float _2173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2175 = _2103 + _2173;
                float _2177 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2179 = _2177 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2181 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2183 = _2181 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2185 = 1.0 / _2179;
                float _2187 = _2175 * _2185;
                float _2189 = fma(_2187, _2183, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2131 = _2189;
                _2161 = true;
            }
            else
            {
                _2131 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2161 = false;
    float _2191 = _2131;
    float _2193 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2195 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2197 = floor(_2193);
    float _2199 = floor(_2195);
    float _2201 = -_2197;
    float _2203 = _2193 + _2201;
    float _2205 = -_2199;
    float _2207 = _2195 + _2205;
    float2 _7042 = float2(_2203, _2207);
    float _2209 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7042, float2(0.0), isnan(_7042)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7042, float2(0.0), isnan(_7042)), level(0.0)).x;
    float _2211 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2213 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2215 = _2067 + _2213;
    float _2217 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    float _2219 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2221 = _2069 + _2219;
    float _2223 = fma(_2215, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2225 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2217);
    float _2227 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2229 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2231 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.5);
    bool _2237 = _2233 || _2235;
    float _2239 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2241 = _2061 + _2239;
    float _2243 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2245 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2227);
    float _2247 = fma(_2221, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2249 = fma(_2241, _2191, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2251 = 1.0 / _2243;
    float _2253 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2245);
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2257 = _2241;
    float _2259 = _2191;
    int _2261 = 2;
    float _2263 = _2223;
    int _2265 = as_type<int>(_2249);
    if (_2237)
    {
        _2257 = _2249;
    }
    float _2267 = _2257;
    float _2269 = _2255 + _2243;
    float _2271 = _2267;
    if (_2237)
    {
        _2259 = _2247;
    }
    float _2273 = _2259;
    float _2275 = _2269 * _2251;
    float _2277 = _2275 * 0.5;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2281 = fma(_2277, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2279);
    float _2283 = 1.0 / _2281;
    float _2285 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2287 = _1978 + _2285;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2291 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2289);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2295 = _2283 * _2293;
    float _2297 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2299 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2291);
    bool _2301 = _2295 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2303 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2297);
    bool _2305 = _2295 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2307 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2309 = !_2301;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = fma(_1848, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2303);
    float _2315 = trunc(_2307);
    int _2317 = int(_2315);
    float _2319 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2321 = _2273;
    float _2323 = _2287;
    if (!_2301)
    {
        _2261 = 1;
    }
    int _2325 = _2261;
    int _2327 = _2325;
    if (!_2305)
    {
        _2327 = _2311;
    }
    int _2329 = _2327;
    float _2331 = trunc(_2319);
    int _2333 = int(_2331);
    int _2335 = _2329 << 6;
    int _2337 = _2335 + 48;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c15)._m0[int(_2349)][_2351];
    int _2355 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2357 = _2317 + _2355;
    int _2359 = _2357 + 1;
    bool _2361 = _2359 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2363 = _2335 + 56;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    uint _2367 = uint(int(uint(int(_2365)) >> uint(2)));
    int _2369 = int(_2365) & 3;
    float _2371 = (*spvDescriptorSet0.vp_c15)._m0[int(_2367)][_2369];
    int _2373 = int(_2365) + 1;
    uint _2375 = uint(int(uint(_2373) >> uint(2)));
    int _2377 = _2373 & 3;
    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[int(_2375)][_2377];
    int _2381 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2383 = _2333 + _2381;
    int _2385 = _2383 + 1;
    int _2387 = _2359 | _2385;
    int _2389 = _2335 + 64;
    uint _2391 = uint(int(uint(_2389) >> uint(2)));
    uint _2393 = uint(int(uint(int(_2391)) >> uint(2)));
    int _2395 = int(_2391) & 3;
    float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
    int _2399 = int(_2391) + 1;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    int _2403 = _2399 & 3;
    float _2405 = (*spvDescriptorSet0.vp_c15)._m0[int(_2401)][_2403];
    bool _2407 = _2387 < 0;
    bool _2409 = _2407 || _2361;
    float _2411 = as_type<float>(_2387);
    float _2413 = as_type<float>(_2329);
    if (_2237)
    {
        _2411 = _2223;
    }
    float _2415 = _2411;
    bool _2417 = _2385 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2419 = _2417 || _2409;
    int _2421 = _2335 + 72;
    uint _2423 = uint(int(uint(_2421) >> uint(2)));
    uint _2425 = uint(int(uint(int(_2423)) >> uint(2)));
    int _2427 = int(_2423) & 3;
    float _2429 = (*spvDescriptorSet0.vp_c15)._m0[int(_2425)][_2427];
    int _2431 = int(_2423) + 1;
    uint _2433 = uint(int(uint(_2431) >> uint(2)));
    int _2435 = _2431 & 3;
    float _2437 = (*spvDescriptorSet0.vp_c15)._m0[int(_2433)][_2435];
    int _2439 = _2335 + 96;
    uint _2441 = uint(int(uint(_2439) >> uint(2)));
    uint _2443 = uint(int(uint(int(_2441)) >> uint(2)));
    int _2445 = int(_2441) & 3;
    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[int(_2443)][_2445];
    int _2449 = int(_2441) + 1;
    uint _2451 = uint(int(uint(_2449) >> uint(2)));
    int _2453 = _2449 & 3;
    float _2455 = (*spvDescriptorSet0.vp_c15)._m0[int(_2451)][_2453];
    int _2457 = _2335 + 104;
    uint _2459 = uint(int(uint(_2457) >> uint(2)));
    uint _2461 = uint(int(uint(int(_2459)) >> uint(2)));
    int _2463 = int(_2459) & 3;
    float _2465 = (*spvDescriptorSet0.vp_c15)._m0[int(_2461)][_2463];
    int _2467 = int(_2459) + 1;
    uint _2469 = uint(int(uint(_2467) >> uint(2)));
    int _2471 = _2467 & 3;
    float _2473 = (*spvDescriptorSet0.vp_c15)._m0[int(_2469)][_2471];
    float _2475 = _2415;
    int _2477 = as_type<int>(_2465);
    if (!_2237)
    {
        float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2481 = _1978 + _2479;
        float _2483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2485 = _1846 + _2483;
        float _2487 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2489 = _2481 * _2481;
        float _2491 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2493 = _1848 + _2491;
        float _2495 = fma(_2485, _2485, _2489);
        float _2497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2499 = fma(_2493, _2493, _2495);
        float _2501 = sqrt(_2499);
        float _2503 = _2487 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2505 = precise::min(_2501, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2507 = _2505 * _2497;
        float _2509 = -_1978;
        float _2511 = _2509 + _2249;
        float _2513 = -_1846;
        float _2515 = _2513 + _2223;
        float _2517 = -_1848;
        float _2519 = _2517 + _2247;
        float _2521 = _2503 * _2507;
        float _2523 = fma(_2511, _2521, _1978);
        float _2525 = fma(_2515, _2521, _1846);
        float _2527 = fma(_2519, _2521, _1848);
        _2271 = _2523;
        _2475 = _2525;
        _2321 = _2527;
        _2263 = _2519;
    }
    float _2529 = _2271;
    float _2531 = _2475;
    float _2533 = _2321;
    float _2535 = _2263;
    float _2537 = _2287 * _2455;
    if (!_2419)
    {
        int _2539 = _2385 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2541 = _2539 + _2359;
        _1993 = uint(_2541);
    }
    uint _2543 = _1993;
    float _2545 = _2287 * _2405;
    float _2547 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2549 = fma(_1846, _2447, _2537);
    float _2551 = _2287 * _2353;
    if (!_2419)
    {
        uint _2553 = uint(int(uint(int(_2543)) >> uint(2)));
        _2265 = int(_2553);
    }
    int _2555 = _2265;
    float _2557 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2547);
    float _2559 = fma(_1848, _2465, _2549);
    int _2561 = _2555;
    if (!_2419)
    {
        int _2563 = int(_2543) << 2;
        _2477 = _2563;
    }
    int _2565 = _2477;
    float _2567 = fma(_1846, _2345, _2551);
    float _2569 = fma(_1846, _2397, _2545);
    float _2571 = _2559 + _2473;
    int _2573 = _2335 + 80;
    uint _2575 = uint(int(uint(_2573) >> uint(2)));
    uint _2577 = uint(int(uint(int(_2575)) >> uint(2)));
    int _2579 = int(_2575) & 3;
    float _2581 = (*spvDescriptorSet0.vp_c15)._m0[int(_2577)][_2579];
    int _2583 = int(_2575) + 1;
    uint _2585 = uint(int(uint(_2583) >> uint(2)));
    int _2587 = _2583 & 3;
    float _2589 = (*spvDescriptorSet0.vp_c15)._m0[int(_2585)][_2587];
    int _2591 = _2565;
    if (!_2419)
    {
        int _2593 = 12 & _2565;
        _2591 = _2593;
    }
    int _2595 = _2591;
    float _2597 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2557);
    float _2599 = fma(_1848, _2371, _2567);
    float _2601 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2603 = 1.0 / _2571;
    if (!_2419)
    {
        int _2605 = _2555 << 4;
        int _2607 = _2605 + _2595;
        _2561 = _2607;
    }
    int _2609 = _2561;
    float _2611 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _2613 = _2335 + 88;
    uint _2615 = uint(int(uint(_2613) >> uint(2)));
    uint _2617 = uint(int(uint(int(_2615)) >> uint(2)));
    int _2619 = int(_2615) & 3;
    float _2621 = (*spvDescriptorSet0.vp_c15)._m0[int(_2617)][_2619];
    int _2623 = int(_2615) + 1;
    uint _2625 = uint(int(uint(_2623) >> uint(2)));
    int _2627 = _2623 & 3;
    float _2629 = (*spvDescriptorSet0.vp_c15)._m0[int(_2625)][_2627];
    float _2631 = fma(_1848, _2429, _2569);
    float _2633 = _2599 + _2379;
    float _2635 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2637 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2639 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2641 = _2529 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2643 = -_2635;
    float _2645 = fma(_2643, _2601, 1.0);
    float _2647 = _2535;
    float _2649 = _2633;
    if (!_2419)
    {
        int _2651 = _2609 + 400;
        uint _2653 = uint(int(uint(_2651) >> uint(2)));
        uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
        int _2657 = int(_2653) & 3;
        float _2659 = (*spvDescriptorSet0.vp_c15)._m0[int(_2655)][_2657];
        _2647 = _2659;
    }
    float _2661 = _2647;
    float _2663 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2637);
    float _2665 = _2631 + _2437;
    float _2667 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2639);
    float _2669 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2641);
    float _2671 = _2633 * _2603;
    float _2673 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2663);
    float _2675 = _2665 * _2603;
    float _2677 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2667);
    float _2679 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2669);
    bool _2681 = _2671 >= 0.0;
    float _2683 = _2673 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2687 = _2679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2689 = _2671 <= 1.0;
    bool _2691 = _2689 && _2681;
    float _2693 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2695 = log2(_2645);
    float _2697 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2699 = _2675 >= 0.0;
    bool _2701 = _2699 && _2691;
    float _2703 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2693);
    float _2705 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2697);
    bool _2707 = _2675 <= 1.0;
    bool _2709 = _2707 && _2701;
    float _2711 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2703);
    float _2713 = _2645;
    if (!_2419)
    {
        float _2715 = floor(_2319);
        _2713 = _2715;
    }
    float _2717 = _2713;
    float _2719 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2721 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2705);
    float _2723 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2711);
    float _2725 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2719);
    float _2727 = 1.0 / _2723;
    float _2729 = _2287 * _2589;
    float _2731 = _2695 * 0.693147182464599609375;
    float _2733 = _2589;
    float _2735 = _2723;
    if (_2709)
    {
        float _2737 = float(_2329);
        _2649 = _2737;
    }
    float _2739 = _2649;
    float _2741 = fma(_1846, _2581, _2729);
    float _2743 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2725);
    float _2745 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2721);
    float _2747 = _2665;
    if (!_2419)
    {
        float _2749 = floor(_2307);
        _2747 = _2749;
    }
    float _2751 = _2747;
    float _2753 = fma(_1848, _2621, _2741);
    float _2755 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2743);
    float _2757 = _2717;
    float _2759 = _2629;
    if (!_2419)
    {
        float _2761 = -_2717;
        float _2763 = _2319 + _2761;
        _2757 = _2763;
    }
    float _2765 = _2757;
    float _2767 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2769 = _2753 + _2629;
    float _2771 = _2739;
    if (_2709)
    {
        float _2773 = rint(_2739);
        float _2775 = precise::max(_2773, 0.0);
        uint _2777 = uint(_2775);
        uint _2779 = clamp(_2777, 0u, 65535u);
        _2771 = as_type<float>(_2779);
    }
    float _2781 = _2771;
    float _2783 = _2755 * _2727;
    float _2785 = _2745 * _2727;
    float _2787 = _2769 * _2603;
    float _2789 = fma(_2783, 0.5, 0.5);
    float _2791 = fma(_2785, -0.5, 0.5);
    float _2793 = _2621;
    float _2795 = _2791;
    float _2797 = _2787;
    if (!_2419)
    {
        float _2799 = rint(_2661);
        float _2801 = precise::max(_2799, 0.0);
        uint _2803 = uint(_2801);
        uint _2805 = clamp(_2803, 0u, 65535u);
        _2793 = as_type<float>(_2805);
    }
    float _2807 = _2793;
    if (!_2419)
    {
        float _2809 = -_2751;
        float _2811 = _2307 + _2809;
        _2759 = _2811;
    }
    float _2813 = _2759;
    float _2815 = _2781;
    if (_2709)
    {
        float3 _8071 = float3(_2671, _2675, float(as_type<int>(_2781)));
        float3 _8075 = select(_8071, float3(0.0), isnan(_8071));
        float _2817 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _8075.xy, uint(rint(_8075.z)), _2787, level(0.0));
        _2815 = _2817;
    }
    float _2819 = _2815;
    float3 _8085 = float3(_2789, _2791, _2767);
    float _2821 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8085, float3(0.0), isnan(_8085)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8085, float3(0.0), isnan(_8085)), level(0.0)).x;
    float3 _8094 = float3(_2789, _2791, _2767);
    float4 _2824 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8094, float3(0.0), isnan(_8094)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8094, float3(0.0), isnan(_8094)), level(0.0)).xyzw;
    float _2826 = _2824.x;
    float _2828 = _2824.y;
    float _2830 = _2824.z;
    float _2832 = _2824.w;
    float _2834 = _2813;
    if (!_2419)
    {
        float3 _8117 = float3(_2813, _2765, float(as_type<int>(_2807)));
        float3 _8119 = select(_8117, float3(0.0), isnan(_8117));
        float _2836 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _8119.xy, uint(rint(_8119.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _8119.xy, uint(rint(_8119.z)), level(0.0)).x;
        _2834 = _2836;
    }
    float _2838 = _2834;
    if (_2419)
    {
        _2733 = 1.0;
    }
    float _2840 = _2733;
    float _2842 = _2840;
    if (!_2419)
    {
        int _2844 = int(_2543) << 4;
        int _2846 = _2844 + 2048;
        uint _2848 = uint(int(uint(_2846) >> uint(2)));
        uint _2850 = uint(int(uint(int(_2848)) >> uint(2)));
        int _2852 = int(_2848) & 3;
        float _2854 = (*spvDescriptorSet0.vp_c15)._m0[int(_2850)][_2852];
        int _2856 = int(_2848) + 1;
        uint _2858 = uint(int(uint(_2856) >> uint(2)));
        int _2860 = _2856 & 3;
        float _2862 = (*spvDescriptorSet0.vp_c15)._m0[int(_2858)][_2860];
        int _2864 = _2846 + 8;
        uint _2866 = uint(int(uint(_2864) >> uint(2)));
        uint _2868 = uint(int(uint(int(_2866)) >> uint(2)));
        int _2870 = int(_2866) & 3;
        float _2872 = (*spvDescriptorSet0.vp_c15)._m0[int(_2868)][_2870];
        int _2874 = int(_2866) + 1;
        uint _2876 = uint(int(uint(_2874) >> uint(2)));
        int _2878 = _2874 & 3;
        float _2880 = (*spvDescriptorSet0.vp_c15)._m0[int(_2876)][_2878];
        float _2882 = _2287 * _2862;
        float _2884 = fma(_1846, _2854, _2882);
        float _2886 = fma(_1848, _2872, _2884);
        float _2888 = _2886 + _2880;
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = -_2890;
        float _2894 = _2892 + _2838;
        float _2896 = fma(_2894, 500.0, 1.5);
        float _2898 = exp2(_2896);
        float _2900 = 0.0 + _2898;
        float _2902 = precise::clamp(_2900, 0.0, 1.0);
        _2323 = _2898;
        _2842 = _2902;
    }
    float _2904 = _2323;
    float _2906 = _2842;
    float _2908 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2910 = _2529 + _2908;
    float _2912 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2914 = _2531 + _2912;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2918 = _2533 + _2916;
    float _2920 = _2910 * _2910;
    float _2922 = fma(_2914, _2914, _2920);
    float _2924 = fma(_2918, _2918, _2922);
    float _2926 = rsqrt(_2924);
    float _2928 = _2926 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2930 = _2914 * _2928;
    float _2932 = _2918 * _2928;
    float _2934 = _2930 * _2930;
    float _2936 = _2932 * _2932;
    float _2938 = _2934 + _2936;
    float _2940 = sqrt(_2938);
    bool _2942 = _2940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2946 = _2940 + _2944;
    float _2948 = _2926;
    float _2950 = _2946;
    float _2952 = _2910;
    float _2954 = _2928;
    if (_2942)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2948 = _2956;
    }
    float _2958 = _2948;
    float _2960 = _2958;
    if (_2942)
    {
        float _2962 = _2946 * _2958;
        _2950 = _2962;
    }
    float _2964 = _2950;
    if (_2942)
    {
        float _2966 = rsqrt(_2938);
        _2960 = _2966;
    }
    float _2968 = _2960;
    float _2970 = _2968;
    if (_2942)
    {
        float _2972 = _2964 * 0.15915493667125701904296875;
        _2413 = _2972;
    }
    float _2974 = _2413;
    float _2976 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2978 = _2918;
    float _2980 = _2974;
    if (_2942)
    {
        float _2982 = _2974 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        _2978 = _2984;
    }
    float _2986 = _2978;
    float _2988 = precise::max(0.0, _2976);
    float _2990 = _2904;
    float _2992 = _2988;
    if (_2942)
    {
        float _2994 = _2974 * 6.283185482025146484375;
        float _2996 = cos(_2994);
        _2990 = _2996;
    }
    float _2998 = _2990;
    float _3000 = -_2928;
    float _3002 = -_2988;
    float _3004 = fma(_2910, _3000, _3002);
    if (_2942)
    {
        float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2952 = _3006;
    }
    float _3008 = _2952;
    float _3010 = _2986;
    float _3012 = _3008;
    if (_2942)
    {
        float _3014 = fma(_2986, _3008, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3010 = _3014;
    }
    float _3016 = _3010;
    float _3018 = _3016;
    if (!_2942)
    {
        _3012 = _2932;
    }
    float _3020 = _3012;
    float _3022 = _3020;
    if (!_2942)
    {
        _2980 = _2934;
    }
    float _3024 = _2980;
    float _3026 = _3024;
    if (_2942)
    {
        float _3028 = _2968 * _3016;
        _2795 = _3028;
    }
    float _3030 = _2795;
    if (!_2942)
    {
        _2970 = _2930;
    }
    float _3032 = _2970;
    float _3034 = _3032;
    float _3036 = _2998;
    if (_2942)
    {
        float _3038 = _2998 + (-1.0);
        _2992 = _3038;
    }
    float _3040 = _2992;
    if (_2942)
    {
        float _3042 = _2930 * _3030;
        _3034 = _3042;
    }
    float _3044 = _3034;
    if (!_2942)
    {
        _3018 = _3004;
    }
    float _3046 = _3018;
    float _3048 = _3046;
    if (_2942)
    {
        float _3050 = _2932 * _3030;
        _3022 = _3050;
    }
    float _3052 = _3022;
    if (_2942)
    {
        float _3054 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2954 = _3054;
    }
    float _3056 = _2954;
    if (_2942)
    {
        float _3058 = _3044 * _3044;
        _3026 = _3058;
    }
    float _3060 = _3026;
    float _3062 = sqrt(_2924);
    if (_2942)
    {
        float _3064 = fma(_3004, _2998, _3056);
        _3048 = _3064;
    }
    float _3066 = _3048;
    if (!_2942)
    {
        _3036 = _2936;
    }
    float _3068 = _3036;
    float _3070 = _3068;
    if (_2942)
    {
        float _3072 = _3052 * _3052;
        _3070 = _3072;
    }
    float _3074 = _3070;
    float _3076 = fma(_3066, _3066, _3060);
    float _3078 = _3076 + _3074;
    float _3080 = rsqrt(_3078);
    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3084 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3082);
    float _3086 = precise::clamp(_3084, 0.0, 1.0);
    float _3088 = -_3086;
    float _3090 = _3088 + 1.0;
    float _3092 = _3080 * _3044;
    float _3094 = _3080 * _3066;
    float _3096 = _3080 * _3052;
    float _3098 = abs(_3090);
    float _3100 = log2(_3098);
    float _3102 = _3092 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3104 = -_3102;
    float _3106 = fma(_3094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3104);
    float _3108 = -_3096;
    float _3110 = fma(_3108, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3106);
    float _3112 = fma(_3110, -0.5, 0.5);
    float _3114 = fma(_3110, 0.5, 0.5);
    float _3116 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3118 = fma(_3114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3120 = sqrt(_3112);
    float _3122 = fma(_3114, _3118, -0.212114393711090087890625);
    float _3124 = _3094 + 1.0;
    float _3126 = fma(_3114, _3122, 1.570728778839111328125);
    float _3128 = exp2(_3116);
    float _3130 = _3120 * 0.636619746685028076171875;
    float _3132 = -_3094;
    float _3134 = fma(_3128, _3124, _3132);
    float _3136 = -_3126;
    float _3138 = fma(_3130, _3136, 1.0);
    float _3140 = fma(_3134, 0.5, 0.5);
    float2 _8593 = float2(_3138, _3140);
    float3 _3144 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).xyz;
    float _3146 = _3144.x;
    float _3148 = _3144.y;
    float _3150 = _3144.z;
    float _3152 = abs(_2295);
    float _3154 = log2(_3152);
    float _3156 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3158 = -_2209;
    float _3160 = _3158 + 1.0;
    float _3162 = _2755 + _2723;
    float _3164 = exp2(_3156);
    float _3166 = _3162 * 0.5;
    float _3168 = _3154 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3170 = _2683 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3172 = fma(_2685, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3170);
    float _3174 = exp2(_3168);
    float _3176 = -_3164;
    float _3178 = _3176 + 1.0;
    float _3180 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3182 = _3180 * _2821;
    float _3184 = fma(_3174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3186 = precise::clamp(_3184, 0.0, 1.0);
    float _3188 = _2723 * 0.5;
    float _3190 = fma(_3186, -2.0, 3.0);
    float _3192 = _3186 * _3186;
    float _3194 = _3192 * _3190;
    float _3196 = fma(_2611, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3172);
    float _3198 = -_3194;
    float _3200 = _3198 + 1.0;
    float _3202 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3196);
    float _3204 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3194);
    bool _3206 = _2295 <= 8000.0;
    bool _3208 = isnan(_2295);
    bool _3210 = _3206 || _3208;
    bool _3212 = isnan(8000.0);
    bool _3214 = _3210 || _3212;
    float _3216 = float(_3214);
    float _3218 = fma(_2745, -0.5, _3188);
    float _3220 = _3188;
    float _3222 = _3160;
    float _3224 = _3202;
    if (!_2709)
    {
        _3220 = 1.0;
    }
    float _3226 = _3220;
    out.gl_Position.x = _2755;
    out.gl_Position.y = _2745;
    out.gl_Position.z = _3202;
    out.gl_Position.w = _2723;
    float _3228 = _3226;
    if (_2709)
    {
        bool _3230 = _2819 >= _2787;
        bool _3232 = isnan(_2819);
        bool _3234 = _3230 || _3232;
        bool _3236 = isnan(_2787);
        bool _3238 = _3234 || _3236;
        float _3240 = float(_3238);
        _3228 = _3240;
    }
    float _3242 = _3228;
    float _3244 = _3216 * _3204;
    float _3246 = _3202 + _2723;
    bool _3248 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3250 = isnan(_3062);
    bool _3252 = _3248 || _3250;
    bool _3254 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3256 = _3252 || _3254;
    float _3258 = _3244 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3260 = _3242 * _2906;
    float _3262 = _3246 * 0.5;
    float _3264 = _3160 * _3258;
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    out.m_85.x = _3166;
    out.m_85.y = _3218;
    out.m_85.z = _3262;
    out.m_85.w = _2723;
    float _3268 = -_3266;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3272 = _2832 * _3182;
    float _3274 = -_3180;
    float _3276 = _3274 + 1.0;
    float _3278 = _3276;
    float _3280 = _3272;
    if (!_3256)
    {
        _2797 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3282 = _2797;
    float _3284 = -_3260;
    float _3286 = fma(_3284, _3270, 1.0);
    float _3288 = precise::clamp(_3286, 0.0, 1.0);
    float _3290 = _3282;
    float _3292 = _3282;
    if (!_3256)
    {
        _3222 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3294 = _3222;
    float _3296 = _2832 * _3276;
    float _3298 = _3294;
    float _3300 = _3294;
    if (!_3256)
    {
        _2735 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3302 = _2735;
    float _3304 = _3288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3306 = _3302;
    float _3308 = _3302;
    if (!_3256)
    {
        _3224 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3310 = _3224;
    float _3312 = _3310;
    float _3314 = _3310;
    if (!_3256)
    {
        _3278 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3316 = _3278;
    out.m_87.x = _3304;
    float _3318 = _3150 * _3182;
    float _3320 = fma(_3146, _3272, _2826);
    float _3322 = fma(_3148, _3272, _2828);
    float _3324 = _3316;
    float _3326 = _3316;
    if (!_3256)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3328 = _3280;
    float _3330 = fma(_2832, _3318, _2830);
    out.m_89.x = _3320;
    out.m_89.y = _3322;
    out.m_89.z = _3330;
    out.m_89.w = _3296;
    bool _3332 = !_3256;
    float _3334 = _3328;
    float _3336 = _3328;
    if (!_3332)
    {
        bool _3338 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3340 = isnan(_3062);
        bool _3342 = _3338 || _3340;
        bool _3344 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3346 = _3342 || _3344;
        if (!_3346)
        {
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3350 = _3062 + _3348;
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3354 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3352;
            float _3356 = 1.0 / _3354;
            float _3358 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3360 = _3358 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3362 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3364 = _3362 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3366 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3368 = _3366 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3370 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3372 = _3370 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3374 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3376 = _3374 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3378 = _3350 * _3356;
            float _3380 = precise::clamp(_3378, 0.0, 1.0);
            float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3386 = fma(_3380, _3360, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3388 = fma(_3380, _3384, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3390 = fma(_3380, _3364, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3392 = fma(_3380, _3368, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3394 = fma(_3380, _3372, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3396 = fma(_3380, _3376, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3300 = _3388;
            _3336 = _3394;
            _3292 = _3386;
            _3314 = _3392;
            _3308 = _3390;
            _3326 = _3396;
            _3398 = true;
        }
        else
        {
            bool _3400 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3402 = isnan(_3062);
            bool _3404 = _3400 || _3402;
            bool _3406 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3408 = _3404 || _3406;
            if (!_3408)
            {
                _3290 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3410 = _3290;
            _3292 = _3410;
            if (!_3408)
            {
                _3298 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3412 = _3298;
            _3300 = _3412;
            if (!_3408)
            {
                _3306 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3414 = _3306;
            _3308 = _3414;
            if (!_3408)
            {
                _3312 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3416 = _3312;
            _3314 = _3416;
            if (!_3408)
            {
                _3334 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3418 = _3334;
            _3336 = _3418;
            if (!_3408)
            {
                _3324 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3420 = _3324;
            bool _3422 = !_3408;
            _3326 = _3420;
            if (!_3422)
            {
                bool _3424 = _3062 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3426 = isnan(_3062);
                bool _3428 = _3424 || _3426;
                bool _3430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3432 = _3428 || _3430;
                if (!_3432)
                {
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3436 = _3062 + _3434;
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3440 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3438;
                    float _3442 = 1.0 / _3440;
                    float _3444 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3446 = _3444 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3448 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3450 = _3448 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3452 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3454 = _3452 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3458 = _3456 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3460 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3462 = _3460 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3464 = _3436 * _3442;
                    float _3466 = precise::clamp(_3464, 0.0, 1.0);
                    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3470 = _3468 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3472 = fma(_3466, _3446, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3474 = fma(_3466, _3470, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3476 = fma(_3466, _3450, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3478 = fma(_3466, _3454, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3480 = fma(_3466, _3458, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3482 = fma(_3466, _3462, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3300 = _3474;
                    _3336 = _3480;
                    _3292 = _3472;
                    _3314 = _3478;
                    _3308 = _3476;
                    _3326 = _3482;
                    _3398 = true;
                }
                else
                {
                    _3300 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3336 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3292 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3314 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3308 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3326 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3398 = false;
    float _3484 = _3300;
    float _3486 = _3336;
    float _3488 = _3292;
    float _3490 = _3314;
    float _3492 = _3308;
    float _3494 = _3326;
    float _3496 = fma(_2109, -0.5, 0.5);
    float _3498 = precise::clamp(_3496, 0.0, 1.0);
    float _3500 = -_3484;
    float _3502 = _3500 + _3486;
    float _3504 = -_3488;
    float _3506 = _3504 + _3490;
    float _3508 = -_3492;
    float _3510 = _3508 + _3494;
    bool _3512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3514 = fma(_3498, _3502, _3484);
    float _3516 = fma(_3498, _3506, _3488);
    float _3518 = fma(_3498, _3510, _3492);
    float _3520 = _3514 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _3522 = fma(_3516, 0.298911988735198974609375, _3520);
    float _3524 = fma(_3518, 0.114477999508380889892578125, _3522);
    float _3526 = -_3524;
    float _3528 = _3516 + _3526;
    float _3530 = -_3524;
    float _3532 = _3514 + _3530;
    float _3534 = -_3524;
    float _3536 = _3518 + _3534;
    float _3538 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3540 = fma(_3528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    float _3542 = fma(_3532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    float _3544 = fma(_3536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3524);
    out.m_61.x = _3538;
    out.m_93.x = _3540;
    out.m_93.y = _3542;
    out.m_93.z = _3544;
    if (!_3512)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3546 = -_2529;
    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3550 = -_2531;
    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3554 = -_2533;
    float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3558 = _3548 * _3548;
    float _3560 = fma(_3552, _3552, _3558);
    float _3562 = fma(_3556, _3556, _3560);
    float _3564 = sqrt(_3562);
    float _3566 = rsqrt(_3562);
    float _3568 = -_3564;
    float _3570 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3572 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3574 = precise::clamp(_3572, 0.0, 1.0);
    float _3576 = _3552 * _3566;
    float _3578 = _3548 * _3566;
    float _3580 = abs(_3574);
    float _3582 = log2(_3580);
    float _3584 = _3556 * _3566;
    float _3586 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3588 = _2109 * _3578;
    float _3590 = -_3578;
    float _3592 = -_3586;
    float _3594 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3592);
    float _3596 = fma(_2107, _3576, _3588);
    float _3598 = -_3584;
    float _3600 = fma(_3598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3594);
    float _3602 = fma(_2113, _3584, _3596);
    float _3604 = precise::clamp(_3602, 0.0, 1.0);
    float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3608 = _3600 + _3606;
    float _3610 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3614 = precise::clamp(_3612, 0.0, 1.0);
    float _3616 = exp2(_3610);
    float _3618 = _3616 * _3614;
    float _3620 = _3604 * _3618;
    float _3622 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3624 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3626 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _3622;
    out.m_91.y = _3624;
    out.m_91.z = _3626;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

