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
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_93 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_75 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2560 = false;
    bool _1350 = false;
    bool _572 = false;
    bool _212 = false;
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
        float _2793 = as_type<float>(_128);
        out.gl_Position.z = _2793;
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
    float _148 = 0.0;
    if (_142)
    {
        float _150 = float(_112);
        _148 = _150;
    }
    float _152 = _148;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2861 = as_type<float>(_164);
        out.gl_Position.z = _2861;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_65.x;
    float _168 = in.m_65.y;
    float _170 = in.m_65.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _210;
    if (!_192)
    {
        float _194 = in.m_67.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_112);
        float _216 = 1.0 / _214;
        float _218 = _146 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = 1.0 / _224;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = 1.0 / _232;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _252 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _256 = 1.0 / _236;
    float _258 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _260 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _262 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _266 = 1.0 / _228;
    float _268 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _220 + _270;
    out.m_69.x = _260;
    out.m_69.y = _262;
    out.m_69.z = _264;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _274;
    float _278 = _272 * _238;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _220 + _280;
    out.m_71.x = _252;
    out.m_71.y = _258;
    out.m_71.z = _268;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _220 + _284;
    float _288 = 1.0 / _276;
    float _290 = _282 * _242;
    bool _292 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _294 = isnan(_220);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _220 + _304;
    bool _308 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_220);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    float _324 = _286 * _266;
    bool _326 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_220);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _306 * _256;
    bool _340 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_220);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_302;
    float _354 = _352 + 1.0;
    bool _356 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_220);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _370 = _220 + _368;
    float _372 = fma(_322, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _374 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _376 = isnan(_220);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = _366 * _354;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = _336 * _388;
    float _402 = -_350;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -_336;
    float _412 = _410 + 1.0;
    float _414 = fma(_398, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = _318 * _404;
    float _418 = -_318;
    float _420 = _418 + 1.0;
    float _422 = fma(_408, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _424 = _350 * _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _384 * _420;
    float _432 = -_384;
    float _434 = _432 + 1.0;
    float _436 = _370 * _288;
    float _438 = _414 * _430;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _444 = fma(_428, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = _422 * _430;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _448;
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _454 = _372 * _430;
    float _456 = fma(_442, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_394, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = fma(_450, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _462 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _464 = fma(_444, _416, _452);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _470;
    float _474 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _454);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = fma(_456, _416, _462);
    float _486 = fma(_460, _424, _464);
    float _488 = fma(_468, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_472, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_458, _416, _474);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _498 = fma(_478, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _500 = fma(_482, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _504 = fma(_488, _424, _484);
    float _506 = fma(_490, _424, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = fma(_496, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _518;
    float _522 = fma(_498, _400, _486);
    float _524 = fma(_510, _436, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _526 = fma(_514, _436, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _528 = fma(_520, _436, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _530 = fma(_500, _400, _504);
    float _532 = fma(_516, _400, _506);
    float _534 = fma(_524, _390, _522);
    float _536 = fma(_526, _390, _530);
    float _538 = fma(_528, _390, _532);
    float _540 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].x, _534);
    float _542 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].y, _536);
    float _544 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].z, _538);
    bool _546 = !_502;
    float _548 = _530;
    float _550 = _416;
    float _552 = _484;
    float _570;
    if (!_546)
    {
        float _554 = in.m_67.x;
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _558 = _554 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[14].y, _146);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_112);
        float _576 = 1.0 / _574;
        float _578 = _146 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = _188 * _188;
    float _584 = in.m_58.x;
    float _586 = in.m_58.y;
    float _588 = in.m_58.z;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _592 = _580 + _590;
    float _594 = fma(_186, _186, _582);
    float _596 = fma(_190, _190, _594);
    float _598 = rsqrt(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _616 = 1.0 / _602;
    bool _618 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _620 = isnan(_580);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _634 = _586 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _636 = _188 * _598;
    float _638 = _186 * _598;
    float _640 = _190 * _598;
    float _642 = _586 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _646 = _586 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _648 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _634);
    float _650 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].y, _644);
    float _654 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _646);
    float _656 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[5].z, _648);
    float _658 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _660 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[10].y, _652);
    float _662 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[6].z, _654);
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _666 = in.m_73.x;
    float _668 = in.m_73.y;
    float _670 = in.m_73.z;
    float _672 = _658 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = _662 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _678 = _664 + _676;
    float _680 = abs(_660);
    bool _682 = _680 > 0.99989998340606689453125;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _686 = _672 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _690 = _674 + _688;
    float _692 = _678 * _678;
    float _694 = 1.0 / _610;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _700;
    float _704 = fma(_686, _686, _692);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _710 = fma(_690, _690, _704);
    float _712 = 1.0 / _614;
    float _714 = _580;
    if (_682)
    {
        _548 = 0.001000000047497451305389404296875;
    }
    float _716 = _548;
    if (!_682)
    {
        _550 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _718 = _550;
    float _720 = _718;
    if (!_682)
    {
        _552 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _722 = _552;
    float _724 = _722;
    if (_682)
    {
        float _726 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _720 = _726;
    }
    float _728 = _720;
    float _730 = rsqrt(_710);
    float _732 = _540 * _666;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[167].w;
    if (_682)
    {
        float _736 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _724 = _736;
    }
    float _738 = _724;
    float _740 = -_728;
    float _742 = _640 * _740;
    float _744 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    if (!_682)
    {
        _734 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _750 = _734;
    float _752 = _750;
    if (_682)
    {
        float _754 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _752 = _754;
    }
    float _756 = _752;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _760 = 1.0 / _748;
    float _762 = _702 * _694;
    float _764 = -_756;
    float _766 = -_742;
    float _768 = fma(_638, _764, _766);
    float _770 = -_756;
    float _772 = _636 * _770;
    float _774 = -_628;
    float _776 = _774 + 1.0;
    float _778 = _606 * _712;
    float _780 = _758 * _730;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _786 = -_738;
    float _788 = -_772;
    float _790 = fma(_640, _786, _788);
    float _792 = -_738;
    float _794 = _638 * _792;
    float _796 = _678 * _780;
    float _798 = _686 * _780;
    float _800 = _690 * _780;
    float _802 = _768 * _768;
    float _804 = -_796;
    float _806 = _678 + _804;
    float _808 = -_798;
    float _810 = _686 + _808;
    float _812 = -_800;
    float _814 = _690 + _812;
    float _816 = -_728;
    float _818 = -_794;
    float _820 = fma(_636, _816, _818);
    float _822 = _806 * _806;
    float _824 = fma(_790, _790, _802);
    float _826 = 1.0 / _784;
    float _828 = _542 * _668;
    float _830 = fma(_810, _810, _822);
    float _832 = fma(_820, _820, _824);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _836 = _580 + _834;
    float _838 = fma(_814, _814, _830);
    float _840 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = 1.0 / _632;
    float _844 = in.m_75.x;
    float _846 = in.m_75.y;
    float _848 = in.m_75.z;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _858 = _544 * _670;
    float _860 = _852 * _760;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _862;
    float _866 = sqrt(_838);
    float _868 = _856 * _826;
    float _870 = fma(_860, _836, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _872 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _874 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _876 = isnan(_580);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = _864 * _616;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _890 = _580 + _888;
    float _892 = fma(_868, _592, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _894 = rsqrt(_832);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _898 = _580 + _896;
    float _900 = fma(_886, _890, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _902 = fma(_778, _898, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _904 = _730 * _866;
    bool _906 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _908 = isnan(_580);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _844);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _922 = _744 * _904;
    bool _924 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _926 = isnan(_580);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _840 * _904;
    float _938 = _872 * _904;
    float _940 = _790 * _894;
    float _942 = _768 * _894;
    float _944 = _820 * _894;
    float _946 = -_916;
    float _948 = _946 + 1.0;
    float _950 = _922 * _918;
    float _952 = -_934;
    float _954 = _952 + 1.0;
    float _956 = _936 * _920;
    float _958 = _934 * _948;
    bool _960 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _962 = isnan(_580);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = _884 * _954;
    float _974 = -_884;
    float _976 = _974 + 1.0;
    bool _978 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _980 = isnan(_580);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _848);
    float _992 = -_970;
    float _994 = _992 + 1.0;
    float _996 = _970 * _976;
    bool _998 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1000 = isnan(_580);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _938 * _990;
    float _1012 = _988 * _994;
    float _1014 = -_988;
    float _1016 = _1014 + 1.0;
    float _1018 = _636 * _944;
    float _1020 = -_1008;
    float _1022 = _1020 + 1.0;
    float _1024 = _956 * _638;
    float _1026 = _1008 * _1016;
    float _1028 = _638 * _942;
    float _1030 = _956 * _640;
    bool _1032 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1034 = isnan(_580);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1018;
    float _1046 = fma(_640, _942, _1044);
    float _1048 = fma(_950, _940, _1024);
    float _1050 = -_1028;
    float _1052 = fma(_636, _940, _1050);
    float _1054 = fma(_950, _944, _1030);
    float _1056 = _1042 * _1022;
    float _1058 = -_1042;
    float _1060 = _1058 + 1.0;
    float _1062 = fma(_1010, _1046, _1048);
    float _1064 = fma(_1010, _1052, _1054);
    float _1066 = 1.0 / _698;
    float _1068 = _628 * _1060;
    float _1070 = _672 + _1062;
    float _1072 = _674 + _1064;
    float _1074 = _956 * _636;
    float _1076 = _870 * _1068;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1080 = _1070 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1084 = _1072 + _1082;
    float _1086 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1076);
    float _1088 = _1080 * _1080;
    float _1090 = _1084 * _1084;
    bool _1092 = _846 != 0.0;
    bool _1094 = isnan(_846);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1102;
    float _1106 = fma(_892, _1056, _1086);
    float _1108 = _1088 + _1090;
    float _1110 = _708 * _1066;
    float _1112 = _1104 * _842;
    float _1114 = fma(_900, _1026, _1106);
    float _1116 = sqrt(_1108);
    float _1118 = in.m_77.x;
    float _1120 = in.m_77.y;
    float _1122 = in.m_77.z;
    float _1124 = _640 * _940;
    float _1126 = fma(_950, _942, _1074);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1130 = _580 + _1128;
    float _1132 = fma(_902, _1012, _1114);
    float _1134 = -_1124;
    float _1136 = fma(_638, _944, _1134);
    bool _1138 = _844 == 0.0;
    bool _1140 = !_1100;
    bool _1142 = _1138 && _1140;
    float _1144 = fma(_762, _1130, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1148 = _580 + _1146;
    float _1150 = fma(_1010, _1136, _1126);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1154 = _580 + _1152;
    bool _1156 = _848 == 0.0;
    bool _1158 = _1156 && _1142;
    float _1160 = _664 + _1150;
    bool _1162 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1070;
    float _1166 = _1088;
    float _1168 = _1090;
    float _1170 = _1072;
    float _1172 = _844;
    int _1174 = as_type<int>(_796);
    int _1176 = as_type<int>(_798);
    int _1178 = as_type<int>(_800);
    if (!_1162)
    {
        _714 = _1070;
    }
    float _1180 = _714;
    float _1182 = _1180;
    if (!_1162)
    {
        _1164 = _1160;
    }
    float _1184 = _1164;
    bool _1186 = !_1162;
    float _1188 = _1184;
    float _1190 = _1120;
    float _1192 = _1118;
    float _1194 = _1122;
    if (!_1186)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1116 + _1198;
        float _1202 = rsqrt(_1108);
        float _1204 = _1200 * _1196;
        float _1206 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = _1204 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = fma(_1212, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1202 * _1218;
        float _1222 = _1216 + (-1.0);
        float _1224 = fma(_1080, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1226 = fma(_1084, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1228 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1232 = _1224 + _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1236 = _1226 + _1234;
        float _1238 = fma(_1160, _1216, _1228);
        float _1240 = _1232 * _1232;
        float _1242 = _1236 * _1236;
        _1188 = _1238;
        _1166 = _1240;
        _1168 = _1242;
        _1182 = _1224;
        _1170 = _1226;
    }
    float _1244 = _1188;
    float _1246 = _1166;
    float _1248 = _1168;
    float _1250 = _1182;
    float _1252 = _1170;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1256 = _1244 + _1254;
    if (!_1158)
    {
        float _1258 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1120);
        _1190 = _1258;
    }
    float _1260 = _1190;
    float _1262 = fma(_1110, _1148, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1264 = fma(_1144, _996, _1132);
    float _1266 = fma(_1256, _1256, _1246);
    if (!_1158)
    {
        float _1268 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1118);
        _1192 = _1268;
    }
    float _1270 = _1192;
    float _1272 = _638 * _1260;
    float _1274 = _636 * _1260;
    float _1276 = _1266 + _1248;
    float _1278 = fma(_1112, _1154, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1280 = fma(_1262, _972, _1264);
    float _1282 = _640 * _1260;
    if (!_1158)
    {
        float _1284 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1122);
        _1194 = _1284;
    }
    float _1286 = _1194;
    float _1288 = fma(_940, _1270, _1272);
    float _1290 = sqrt(_1276);
    float _1292 = fma(_942, _1270, _1274);
    float _1294 = fma(_1278, _958, _1280);
    float _1296 = fma(_944, _1270, _1282);
    float _1298 = fma(_1046, _1286, _1288);
    float _1300 = fma(_1136, _1286, _1292);
    float _1302 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1294);
    float _1304 = fma(_1052, _1286, _1296);
    out.m_79.x = _1302;
    out.m_81.x = _1298;
    out.m_81.y = _1300;
    out.m_81.z = _1304;
    bool _1306 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1308 = isnan(_1290);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1314 = _1310 || _1312;
    if (!_1314)
    {
        _1172 = 1.0;
    }
    float _1316 = _1172;
    bool _1318 = !_1314;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1290);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1290 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1290);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1290 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = -_798;
    float _1384 = _672 + _1382;
    float _1386 = -_800;
    float _1388 = _674 + _1386;
    float _1390 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1392 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1394 = floor(_1390);
    float _1396 = floor(_1392);
    float _1398 = -_1394;
    float _1400 = _1390 + _1398;
    float _1402 = -_1396;
    float _1404 = _1392 + _1402;
    float2 _4913 = float2(_1400, _1404);
    float _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).x;
    float _1408 = -_796;
    float _1410 = _664 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1414 = _1250 + _1412;
    float _1416 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1420 = _1252 + _1418;
    float _1422 = fma(_1414, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1424 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1416);
    float _1426 = fma(_1420, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1428 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1424);
    float _1430 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1436 = 1.0 / _1432;
    float _1438 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1442 = _1440 + _1432;
    float _1444 = _1442 * _1436;
    float _1446 = _1444 * 0.5;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1448);
    float _1452 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1454 = 1.0 / _1450;
    float _1456 = _1410 + _1452;
    float _1458 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1460 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1458);
    float _1462 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1460);
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1466 = _1454 * _1464;
    float _1468 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1470 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1472 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1474 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1470);
    bool _1476 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1478 = trunc(_1468);
    int _1480 = int(_1478);
    bool _1482 = !_1472;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1474);
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1490 = 2;
    float _1492 = _1426;
    float _1494 = _1488;
    float _1496 = _1456;
    if (!_1472)
    {
        _1490 = 1;
    }
    int _1498 = _1490;
    float _1500 = trunc(_1488);
    int _1502 = int(_1500);
    int _1504 = _1498;
    if (!_1476)
    {
        _1504 = _1484;
    }
    int _1506 = _1504;
    int _1508 = _1506 << 6;
    bool _1510 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1522 = _1244 + _1520;
    int _1524 = _1508 + 48;
    uint _1527 = uint(int(uint(_1524) >> uint(2)));
    uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
    int _1531 = int(_1527) & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    int _1535 = int(_1527) + 1;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    int _1539 = _1535 & 3;
    float _1541 = (*spvDescriptorSet0.vp_c15)._m0[int(_1537)][_1539];
    int _1543 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1545 = _1480 + _1543;
    int _1547 = _1545 + 1;
    float _1549 = fma(_1522, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1551 = -_798;
    float _1553 = _1551 + _1422;
    bool _1555 = _1547 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1557 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1559 = _1502 + _1557;
    int _1561 = _1559 + 1;
    int _1563 = _1508 + 56;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    uint _1567 = uint(int(uint(int(_1565)) >> uint(2)));
    int _1569 = int(_1565) & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    int _1573 = int(_1565) + 1;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    int _1577 = _1573 & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    float _1581 = -_796;
    float _1583 = _1581 + _1549;
    int _1585 = _1547 | _1561;
    bool _1587 = _1585 < 0;
    bool _1589 = _1587 || _1555;
    int _1591 = _1508 + 64;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[int(_1603)][_1605];
    float _1609 = -_800;
    float _1611 = _1609 + _1426;
    bool _1613 = _1561 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1615 = _1613 || _1589;
    int _1617 = _1508 + 72;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    uint _1621 = uint(int(uint(int(_1619)) >> uint(2)));
    int _1623 = int(_1619) & 3;
    float _1625 = (*spvDescriptorSet0.vp_c15)._m0[int(_1621)][_1623];
    int _1627 = int(_1619) + 1;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    int _1631 = _1627 & 3;
    float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
    int _1635 = _1508 + 96;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    uint _1639 = uint(int(uint(int(_1637)) >> uint(2)));
    int _1641 = int(_1637) & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    int _1645 = int(_1637) + 1;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    int _1649 = _1645 & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = _1508 + 104;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    uint _1657 = uint(int(uint(int(_1655)) >> uint(2)));
    int _1659 = int(_1655) & 3;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[int(_1657)][_1659];
    int _1663 = int(_1655) + 1;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    int _1667 = _1663 & 3;
    float _1669 = (*spvDescriptorSet0.vp_c15)._m0[int(_1665)][_1667];
    float _1671 = _1583;
    float _1673 = _1553;
    float _1675 = _1611;
    float _1677 = as_type<float>(_1506);
    float _1679 = as_type<float>(_1547);
    if (!_1518)
    {
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1683 = _1410 + _1681;
        float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1687 = _1384 + _1685;
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = -_674;
        float _1693 = _1691 + _1426;
        float _1695 = _1683 * _1683;
        float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1699 = _1388 + _1697;
        float _1701 = -_672;
        float _1703 = _1701 + _1422;
        float _1705 = fma(_1687, _1687, _1695);
        float _1707 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1709 = fma(_1699, _1699, _1705);
        float _1711 = sqrt(_1709);
        float _1713 = 1.0 / _904;
        float _1715 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1717 = precise::min(_1711, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1719 = _1717 * _1689;
        float _1721 = _1719 * _1713;
        float _1723 = -_664;
        float _1725 = _1723 + _1549;
        float _1727 = _1715 * _1721;
        float _1729 = _1693 * _1721;
        float _1731 = fma(_1725, _1727, _1410);
        float _1733 = fma(_1703, _1727, _1384);
        float _1735 = fma(_1715, _1729, _1388);
        _1671 = _1731;
        _1673 = _1733;
        _1174 = as_type<int>(_1689);
        _1675 = _1735;
        _1176 = as_type<int>(_1721);
    }
    float _1737 = _1671;
    float _1739 = _1673;
    int _1741 = _1174;
    float _1743 = _1675;
    int _1745 = _1176;
    float _1747 = _1456 * _1651;
    int _1749 = _1741;
    int _1751 = _1745;
    if (!_1615)
    {
        int _1753 = _1561 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1755 = _1753 + _1547;
        _1178 = _1755;
    }
    int _1757 = _1178;
    float _1759 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1761 = _1456 * _1541;
    float _1763 = fma(_1384, _1643, _1747);
    float _1765 = _1456 * _1607;
    if (!_1615)
    {
        int _1767 = _1757 << 2;
        _1749 = _1767;
    }
    int _1769 = _1749;
    float _1771 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1759);
    float _1773 = fma(_1388, _1661, _1763);
    float _1775 = fma(_1384, _1599, _1765);
    int _1777 = _1769;
    if (!_1615)
    {
        uint _1779 = uint(int(uint(_1757) >> uint(2)));
        _1751 = int(_1779);
    }
    int _1781 = _1751;
    int _1783 = _1508 + 80;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
    int _1789 = int(_1785) & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    int _1793 = int(_1785) + 1;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    int _1797 = _1793 & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    float _1801 = _1773 + _1669;
    if (!_1615)
    {
        int _1803 = 12 & _1769;
        _1777 = _1803;
    }
    int _1805 = _1777;
    float _1807 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1771);
    float _1809 = fma(_1384, _1533, _1761);
    if (!_1615)
    {
        int _1811 = _1781 << 4;
        int _1813 = _1811 + _1805;
        _1492 = as_type<float>(_1813);
    }
    float _1815 = _1492;
    float _1817 = 1.0 / _1801;
    int _1819 = _1508 + 88;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
    int _1825 = int(_1821) & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = int(_1821) + 1;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    int _1833 = _1829 & 3;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
    float _1837 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1839 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1841 = fma(_1388, _1571, _1809);
    float _1843 = fma(_1388, _1625, _1775);
    float _1845 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1847 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1849 = _1841 + _1579;
    float _1851 = _1815;
    if (!_1615)
    {
        int _1853 = as_type<int>(_1815) + 400;
        uint _1855 = uint(int(uint(_1853) >> uint(2)));
        uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
        int _1859 = int(_1855) & 3;
        float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
        _1851 = _1861;
    }
    float _1863 = _1851;
    float _1865 = -_1845;
    float _1867 = fma(_1865, _1839, 1.0);
    float _1869 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1871 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = _1843 + _1633;
    float _1875 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1847);
    float _1877 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1869);
    float _1879 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = _1849 * _1817;
    float _1883 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1885 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1877);
    float _1887 = _1873 * _1817;
    float _1889 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    bool _1891 = _1881 >= 0.0;
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1897 = log2(_1867);
    bool _1899 = _1881 <= 1.0;
    bool _1901 = _1899 && _1891;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1907 = _1887 >= 0.0;
    bool _1909 = _1907 && _1901;
    float _1911 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1903);
    float _1913 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1915 = _1651;
    float _1917 = _1881;
    if (!_1615)
    {
        float _1919 = floor(_1468);
        _1915 = _1919;
    }
    float _1921 = _1915;
    bool _1923 = _1887 <= 1.0;
    bool _1925 = _1923 && _1909;
    float _1927 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1929 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1911);
    float _1931 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1933 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1929);
    float _1935 = _1456 * _1799;
    float _1937 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1913);
    float _1939 = _1549;
    if (!_1615)
    {
        float _1941 = floor(_1488);
        _1939 = _1941;
    }
    float _1943 = _1939;
    float _1945 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1947 = fma(_1384, _1791, _1935);
    float _1949 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1937);
    if (_1925)
    {
        float _1951 = float(_1506);
        _1677 = _1951;
    }
    float _1953 = _1677;
    float _1955 = _1897 * 0.693147182464599609375;
    float _1957 = fma(_1388, _1827, _1947);
    float _1959 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1949);
    float _1961 = 1.0 / _1933;
    float _1963 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1945);
    float _1965 = _1957 + _1835;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1969 = _1835;
    float _1971 = _1963;
    float _1973 = _1959;
    if (!_1615)
    {
        float _1975 = -_1921;
        float _1977 = _1468 + _1975;
        _1969 = _1977;
    }
    float _1979 = _1969;
    float _1981 = _1965 * _1817;
    float _1983 = _1935;
    if (_1925)
    {
        float _1985 = rint(_1953);
        float _1987 = precise::max(_1985, 0.0);
        uint _1989 = uint(_1987);
        uint _1991 = clamp(_1989, 0u, 65535u);
        _1983 = as_type<float>(_1991);
    }
    float _1993 = _1983;
    float _1995 = _1943;
    if (!_1615)
    {
        float _1997 = -_1943;
        float _1999 = _1488 + _1997;
        _1494 = _1999;
    }
    float _2001 = _1494;
    float _2003 = _1965;
    float _2005 = _1863;
    if (!_1615)
    {
        float _2007 = rint(_1863);
        float _2009 = precise::max(_2007, 0.0);
        uint _2011 = uint(_2009);
        uint _2013 = clamp(_2011, 0u, 65535u);
        _2003 = as_type<float>(_2013);
    }
    float _2015 = _2003;
    float _2017 = _1959 * _1961;
    float _2019 = _1963 * _1961;
    float _2021 = fma(_2017, 0.5, 0.5);
    float _2023 = fma(_2019, -0.5, 0.5);
    float _2025 = _1993;
    if (_1925)
    {
        float3 _5956 = float3(_1881, _1887, float(as_type<int>(_1993)));
        float3 _5960 = select(_5956, float3(0.0), isnan(_5956));
        float _2027 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5960.xy, uint(rint(_5960.z)), _1981, level(0.0));
        _2025 = _2027;
    }
    float _2029 = _2025;
    float3 _5970 = float3(_2021, _2023, _1967);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5979 = float3(_2021, _2023, _1967);
    float4 _2034 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5979, float3(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5979, float3(0.0), isnan(_5979)), level(0.0)).xyzw;
    float _2036 = _2034.x;
    float _2038 = _2034.y;
    float _2040 = _2034.z;
    float _2042 = _2034.w;
    float _2044 = _1979;
    if (!_1615)
    {
        float3 _6002 = float3(_1979, _2001, float(as_type<int>(_2015)));
        float3 _6004 = select(_6002, float3(0.0), isnan(_6002));
        float _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6004.xy, uint(rint(_6004.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6004.xy, uint(rint(_6004.z)), level(0.0)).x;
        _2044 = _2046;
    }
    float _2048 = _2044;
    if (_1615)
    {
        _1995 = 1.0;
    }
    float _2050 = _1995;
    float _2052 = _2050;
    if (!_1615)
    {
        int _2054 = _1757 << 4;
        int _2056 = _2054 + 2048;
        uint _2058 = uint(int(uint(_2056) >> uint(2)));
        uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
        int _2062 = int(_2058) & 3;
        float _2064 = (*spvDescriptorSet0.vp_c15)._m0[int(_2060)][_2062];
        int _2066 = int(_2058) + 1;
        uint _2068 = uint(int(uint(_2066) >> uint(2)));
        int _2070 = _2066 & 3;
        float _2072 = (*spvDescriptorSet0.vp_c15)._m0[int(_2068)][_2070];
        int _2074 = _2056 + 8;
        uint _2076 = uint(int(uint(_2074) >> uint(2)));
        uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
        int _2080 = int(_2076) & 3;
        float _2082 = (*spvDescriptorSet0.vp_c15)._m0[int(_2078)][_2080];
        int _2084 = int(_2076) + 1;
        uint _2086 = uint(int(uint(_2084) >> uint(2)));
        int _2088 = _2084 & 3;
        float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
        float _2092 = _1456 * _2072;
        float _2094 = fma(_1384, _2064, _2092);
        float _2096 = fma(_1388, _2082, _2094);
        float _2098 = _2096 + _2090;
        float _2100 = precise::clamp(_2098, 0.0, 1.0);
        float _2102 = -_2100;
        float _2104 = _2102 + _2048;
        float _2106 = fma(_2104, 500.0, 1.5);
        float _2108 = exp2(_2106);
        float _2110 = 0.0 + _2108;
        float _2112 = precise::clamp(_2110, 0.0, 1.0);
        _1496 = _2100;
        _2005 = _2072;
        _2052 = _2112;
    }
    float _2114 = _1496;
    float _2116 = _2005;
    float _2118 = _2052;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2122 = _1737 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2126 = _1739 + _2124;
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2130 = _1743 + _2128;
    float _2132 = _2122 * _2122;
    float _2134 = fma(_2126, _2126, _2132);
    float _2136 = fma(_2130, _2130, _2134);
    float _2138 = rsqrt(_2136);
    float _2140 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2142 = _2126 * _2140;
    float _2144 = _2130 * _2140;
    float _2146 = _2142 * _2142;
    float _2148 = _2144 * _2144;
    float _2150 = _2146 + _2148;
    float _2152 = sqrt(_2150);
    bool _2154 = _2152 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2158 = _2152 + _2156;
    float _2160 = _2138;
    float _2162 = _2158;
    float _2164 = _2114;
    float _2166 = _2122;
    if (_2154)
    {
        float _2168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2168;
    }
    float _2170 = _2160;
    if (_2154)
    {
        float _2172 = rsqrt(_2150);
        _1917 = _2172;
    }
    float _2174 = _1917;
    float _2176 = _2174;
    if (_2154)
    {
        float _2178 = _2158 * _2170;
        _2162 = _2178;
    }
    float _2180 = _2162;
    if (_2154)
    {
        float _2182 = _2180 * 0.15915493667125701904296875;
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2130;
    if (_2154)
    {
        float _2188 = _2184 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2196 = precise::max(0.0, _2194);
    float _2198 = _2116;
    float _2200 = _2196;
    float _2202 = _2194;
    if (_2154)
    {
        float _2204 = _2184 * 6.283185482025146484375;
        float _2206 = cos(_2204);
        _2198 = _2206;
    }
    float _2208 = _2198;
    float _2210 = -_2140;
    float _2212 = -_2196;
    float _2214 = fma(_2122, _2210, _2212);
    if (!_2154)
    {
        _2166 = _2146;
    }
    float _2216 = _2166;
    float _2218 = _2216;
    if (_2154)
    {
        float _2220 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2220;
    }
    float _2222 = _2200;
    float _2224 = _2192;
    float _2226 = _2222;
    if (_2154)
    {
        float _2228 = fma(_2192, _2222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2224 = _2228;
    }
    float _2230 = _2224;
    float _2232 = _2230;
    if (!_2154)
    {
        _2226 = _2214;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    float _2238 = _2208;
    if (_2154)
    {
        float _2240 = _2208 + (-1.0);
        _2202 = _2240;
    }
    float _2242 = _2202;
    float _2244 = _2242;
    if (_2154)
    {
        float _2246 = _2174 * _2230;
        _1679 = _2246;
    }
    float _2248 = _1679;
    if (!_2154)
    {
        _2176 = _2142;
    }
    float _2250 = _2176;
    float _2252 = _2250;
    if (_2154)
    {
        float _2254 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2244 = _2254;
    }
    float _2256 = _2244;
    if (_2154)
    {
        float _2258 = _2142 * _2248;
        _2252 = _2258;
    }
    float _2260 = _2252;
    if (!_2154)
    {
        _2232 = _2144;
    }
    float _2262 = _2232;
    float _2264 = _2262;
    if (_2154)
    {
        float _2266 = _2144 * _2248;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (_2154)
    {
        float _2270 = fma(_2214, _2208, _2256);
        _2236 = _2270;
    }
    float _2272 = _2236;
    if (_2154)
    {
        float _2274 = _2260 * _2260;
        _2218 = _2274;
    }
    float _2276 = _2218;
    if (!_2154)
    {
        _2238 = _2148;
    }
    float _2278 = _2238;
    float _2280 = sqrt(_2136);
    float _2282 = _2278;
    if (_2154)
    {
        float _2284 = _2268 * _2268;
        _2282 = _2284;
    }
    float _2286 = _2282;
    float _2288 = fma(_2272, _2272, _2276);
    float _2290 = _2288 + _2286;
    float _2292 = rsqrt(_2290);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = -_2298;
    float _2302 = _2300 + 1.0;
    float _2304 = _2292 * _2260;
    float _2306 = abs(_2302);
    float _2308 = log2(_2306);
    float _2310 = _2292 * _2272;
    float _2312 = _2292 * _2268;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2316 = -_2314;
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = -_2312;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2324 = fma(_2322, -0.5, 0.5);
    float _2326 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2328 = fma(_2322, 0.5, 0.5);
    float _2330 = _2310 + 1.0;
    float _2332 = exp2(_2326);
    float _2334 = fma(_2328, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = fma(_2328, _2334, -0.212114393711090087890625);
    float _2338 = sqrt(_2324);
    float _2340 = fma(_2328, _2336, 1.570728778839111328125);
    float _2342 = -_2310;
    float _2344 = fma(_2332, _2330, _2342);
    float _2346 = fma(_2344, 0.5, 0.5);
    float _2348 = _2338 * 0.636619746685028076171875;
    float _2350 = -_2340;
    float _2352 = fma(_2348, _2350, 1.0);
    float2 _6480 = float2(_2352, _2346);
    float3 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6480, float2(0.0), isnan(_6480)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6480, float2(0.0), isnan(_6480)), level(0.0)).xyz;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = abs(_1466);
    float _2366 = log2(_2364);
    float _2368 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2370 = -_1406;
    float _2372 = _2370 + 1.0;
    out.m_83.x = _1739;
    out.m_83.y = _1737;
    out.m_83.z = _1743;
    float _2374 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2368);
    bool _2376 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2378 = isnan(_2280);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2384 = _2380 || _2382;
    bool _2386 = _1466 <= 8000.0;
    bool _2388 = isnan(_1466);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan(8000.0);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2374);
    float _2400 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    float _2402 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1959;
    out.gl_Position.y = _1963;
    out.gl_Position.z = _2400;
    out.gl_Position.w = _1933;
    float _2404 = exp2(_2402);
    if (!_2384)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2406 = _1971;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2384)
    {
        _1973 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2412 = _1973;
    float _2414 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = fma(_2416, -2.0, 3.0);
    float _2420 = _2416 * _2416;
    float _2422 = _2420 * _2418;
    float _2424 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2426 = _2400 + _1933;
    float _2428 = -_2422;
    float _2430 = _2428 + 1.0;
    float _2432 = exp2(_2424);
    float _2434 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2436 = _2426 * 0.5;
    float _2438 = _2396 * _2434;
    float _2440 = _2434;
    float _2442 = _2412;
    float _2444 = _2412;
    if (!_1925)
    {
        _2440 = 1.0;
    }
    float _2446 = _2440;
    out.m_85.z = _2436;
    out.m_85.w = _1933;
    float _2448 = _2446;
    if (_1925)
    {
        bool _2450 = _2029 >= _1981;
        bool _2452 = isnan(_2029);
        bool _2454 = _2450 || _2452;
        bool _2456 = isnan(_1981);
        bool _2458 = _2454 || _2456;
        float _2460 = float(_2458);
        _2448 = _2460;
    }
    float _2462 = _2448;
    float _2464 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2466 = _2372 * _2464;
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = _2462 * _2118;
    float _2472 = -_2432;
    float _2474 = _2472 + 1.0;
    float _2476 = -_2468;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2480 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2482 = -_2470;
    float _2484 = fma(_2482, _2478, 1.0);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2480 * _2031;
    float _2490 = -_2480;
    float _2492 = _2490 + 1.0;
    float _2494 = _2486 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2496 = _2042 * _2488;
    float _2498 = _2042 * _2492;
    out.m_87.x = _2494;
    float _2500 = _2362 * _2488;
    float _2502 = fma(_2358, _2496, _2036);
    float _2504 = fma(_2360, _2496, _2038);
    float _2506 = fma(_2042, _2500, _2040);
    float _2508 = _2500;
    if (!_2384)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2510 = _2508;
    out.m_89.x = _2502;
    out.m_89.y = _2504;
    out.m_89.z = _2506;
    out.m_89.w = _2498;
    bool _2512 = !_2384;
    float _2514 = _2510;
    float _2516 = _2510;
    if (!_2512)
    {
        bool _2518 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2520 = isnan(_2280);
        bool _2522 = _2518 || _2520;
        bool _2524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2526 = _2522 || _2524;
        if (!_2526)
        {
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2530 = _2280 + _2528;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2544 = 1.0 / _2534;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2550 = _2530 * _2544;
            float _2552 = precise::clamp(_2550, 0.0, 1.0);
            float _2554 = fma(_2552, _2538, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2556 = fma(_2552, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2558 = fma(_2552, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2444 = _2556;
            _2410 = _2554;
            _2516 = _2558;
            _2560 = true;
        }
        else
        {
            bool _2562 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2564 = isnan(_2280);
            bool _2566 = _2562 || _2564;
            bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2570 = _2566 || _2568;
            if (!_2570)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2572 = _2408;
            _2410 = _2572;
            if (!_2570)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2574 = _2442;
            _2444 = _2574;
            if (!_2570)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2576 = _2514;
            bool _2578 = !_2570;
            _2516 = _2576;
            if (!_2578)
            {
                bool _2580 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_2280);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _2280 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2606 = 1.0 / _2596;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2612 = _2592 * _2606;
                    float _2614 = precise::clamp(_2612, 0.0, 1.0);
                    float _2616 = fma(_2614, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2618 = fma(_2614, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2620 = fma(_2614, _2610, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2444 = _2618;
                    _2410 = _2616;
                    _2516 = _2620;
                    _2560 = true;
                }
                else
                {
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2560 = false;
    float _2622 = _2444;
    float _2624 = _2410;
    float _2626 = _2516;
    float _2628 = _2622 * 0.586610972881317138671875;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _2632 = fma(_2624, 0.298911988735198974609375, _2628);
    out.m_91.x = 0.0;
    float _2634 = fma(_2626, 0.114477999508380889892578125, _2632);
    float _2636 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2638 = -_2634;
    float _2640 = _2638 + _2624;
    float _2642 = -_2634;
    float _2644 = _2642 + _2622;
    float _2646 = -_2634;
    float _2648 = _2646 + _2626;
    out.m_87.w = _2636;
    float _2650 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2652 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2654 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    out.m_93.x = _2650;
    out.m_93.y = _2652;
    out.m_93.z = _2654;
    if (!_2630)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2656 = -_1737;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2660 = -_1739;
    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2664 = -_1743;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2668 = _2658 * _2658;
    float _2670 = fma(_2662, _2662, _2668);
    float _2672 = fma(_2666, _2666, _2670);
    float _2674 = sqrt(_2672);
    float _2676 = rsqrt(_2672);
    float _2678 = -_2674;
    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = _2662 * _2676;
    float _2688 = _2658 * _2676;
    float _2690 = abs(_2684);
    float _2692 = log2(_2690);
    float _2694 = _2666 * _2676;
    float _2696 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2698 = _1300 * _2688;
    float _2700 = -_2688;
    float _2702 = -_2696;
    float _2704 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2702);
    float _2706 = fma(_1298, _2686, _2698);
    float _2708 = -_2694;
    float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2704);
    float _2712 = fma(_1304, _2694, _2706);
    float _2714 = precise::clamp(_2712, 0.0, 1.0);
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2718 = _2710 + _2716;
    float _2720 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2722 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2724 = precise::clamp(_2722, 0.0, 1.0);
    float _2726 = exp2(_2720);
    float _2728 = _2726 * _2724;
    float _2730 = _2714 * _2728;
    float _2732 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2736 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2732;
    out.m_91.y = _2734;
    out.m_91.z = _2736;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2560 = false;
    bool _1350 = false;
    bool _572 = false;
    bool _212 = false;
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
        float _2793 = as_type<float>(_128);
        out.gl_Position.z = _2793;
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
    float _148 = 0.0;
    if (_142)
    {
        float _150 = float(_112);
        _148 = _150;
    }
    float _152 = _148;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2861 = as_type<float>(_164);
        out.gl_Position.z = _2861;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_65.x;
    float _168 = in.m_65.y;
    float _170 = in.m_65.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _210;
    if (!_192)
    {
        float _194 = in.m_67.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_112);
        float _216 = 1.0 / _214;
        float _218 = _146 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = 1.0 / _224;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = 1.0 / _232;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _252 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _256 = 1.0 / _236;
    float _258 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _260 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _262 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _266 = 1.0 / _228;
    float _268 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _220 + _270;
    out.m_69.x = _260;
    out.m_69.y = _262;
    out.m_69.z = _264;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _274;
    float _278 = _272 * _238;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _220 + _280;
    out.m_71.x = _252;
    out.m_71.y = _258;
    out.m_71.z = _268;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _220 + _284;
    float _288 = 1.0 / _276;
    float _290 = _282 * _242;
    bool _292 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _294 = isnan(_220);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _220 + _304;
    bool _308 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_220);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    float _324 = _286 * _266;
    bool _326 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_220);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _306 * _256;
    bool _340 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_220);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_302;
    float _354 = _352 + 1.0;
    bool _356 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_220);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _370 = _220 + _368;
    float _372 = fma(_322, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _374 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _376 = isnan(_220);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = _366 * _354;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = _336 * _388;
    float _402 = -_350;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -_336;
    float _412 = _410 + 1.0;
    float _414 = fma(_398, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = _318 * _404;
    float _418 = -_318;
    float _420 = _418 + 1.0;
    float _422 = fma(_408, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _424 = _350 * _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _384 * _420;
    float _432 = -_384;
    float _434 = _432 + 1.0;
    float _436 = _370 * _288;
    float _438 = _414 * _430;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _444 = fma(_428, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = _422 * _430;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _448;
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _454 = _372 * _430;
    float _456 = fma(_442, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_394, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = fma(_450, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _462 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _464 = fma(_444, _416, _452);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _470;
    float _474 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _454);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = fma(_456, _416, _462);
    float _486 = fma(_460, _424, _464);
    float _488 = fma(_468, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_472, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_458, _416, _474);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _498 = fma(_478, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _500 = fma(_482, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _504 = fma(_488, _424, _484);
    float _506 = fma(_490, _424, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = fma(_496, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _518;
    float _522 = fma(_498, _400, _486);
    float _524 = fma(_510, _436, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _526 = fma(_514, _436, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _528 = fma(_520, _436, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _530 = fma(_500, _400, _504);
    float _532 = fma(_516, _400, _506);
    float _534 = fma(_524, _390, _522);
    float _536 = fma(_526, _390, _530);
    float _538 = fma(_528, _390, _532);
    float _540 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].x, _534);
    float _542 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].y, _536);
    float _544 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].z, _538);
    bool _546 = !_502;
    float _548 = _530;
    float _550 = _416;
    float _552 = _484;
    float _570;
    if (!_546)
    {
        float _554 = in.m_67.x;
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _558 = _554 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[14].y, _146);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_112);
        float _576 = 1.0 / _574;
        float _578 = _146 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = _188 * _188;
    float _584 = in.m_58.x;
    float _586 = in.m_58.y;
    float _588 = in.m_58.z;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _592 = _580 + _590;
    float _594 = fma(_186, _186, _582);
    float _596 = fma(_190, _190, _594);
    float _598 = rsqrt(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _616 = 1.0 / _602;
    bool _618 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _620 = isnan(_580);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _634 = _586 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _636 = _188 * _598;
    float _638 = _186 * _598;
    float _640 = _190 * _598;
    float _642 = _586 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _646 = _586 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _648 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _634);
    float _650 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].y, _644);
    float _654 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _646);
    float _656 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[5].z, _648);
    float _658 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _660 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[10].y, _652);
    float _662 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[6].z, _654);
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _666 = in.m_73.x;
    float _668 = in.m_73.y;
    float _670 = in.m_73.z;
    float _672 = _658 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = _662 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _678 = _664 + _676;
    float _680 = abs(_660);
    bool _682 = _680 > 0.99989998340606689453125;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _686 = _672 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _690 = _674 + _688;
    float _692 = _678 * _678;
    float _694 = 1.0 / _610;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _700;
    float _704 = fma(_686, _686, _692);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _710 = fma(_690, _690, _704);
    float _712 = 1.0 / _614;
    float _714 = _580;
    if (_682)
    {
        _548 = 0.001000000047497451305389404296875;
    }
    float _716 = _548;
    if (!_682)
    {
        _550 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _718 = _550;
    float _720 = _718;
    if (!_682)
    {
        _552 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _722 = _552;
    float _724 = _722;
    if (_682)
    {
        float _726 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _720 = _726;
    }
    float _728 = _720;
    float _730 = rsqrt(_710);
    float _732 = _540 * _666;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[167].w;
    if (_682)
    {
        float _736 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _724 = _736;
    }
    float _738 = _724;
    float _740 = -_728;
    float _742 = _640 * _740;
    float _744 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    if (!_682)
    {
        _734 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _750 = _734;
    float _752 = _750;
    if (_682)
    {
        float _754 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _752 = _754;
    }
    float _756 = _752;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _760 = 1.0 / _748;
    float _762 = _702 * _694;
    float _764 = -_756;
    float _766 = -_742;
    float _768 = fma(_638, _764, _766);
    float _770 = -_756;
    float _772 = _636 * _770;
    float _774 = -_628;
    float _776 = _774 + 1.0;
    float _778 = _606 * _712;
    float _780 = _758 * _730;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _786 = -_738;
    float _788 = -_772;
    float _790 = fma(_640, _786, _788);
    float _792 = -_738;
    float _794 = _638 * _792;
    float _796 = _678 * _780;
    float _798 = _686 * _780;
    float _800 = _690 * _780;
    float _802 = _768 * _768;
    float _804 = -_796;
    float _806 = _678 + _804;
    float _808 = -_798;
    float _810 = _686 + _808;
    float _812 = -_800;
    float _814 = _690 + _812;
    float _816 = -_728;
    float _818 = -_794;
    float _820 = fma(_636, _816, _818);
    float _822 = _806 * _806;
    float _824 = fma(_790, _790, _802);
    float _826 = 1.0 / _784;
    float _828 = _542 * _668;
    float _830 = fma(_810, _810, _822);
    float _832 = fma(_820, _820, _824);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _836 = _580 + _834;
    float _838 = fma(_814, _814, _830);
    float _840 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = 1.0 / _632;
    float _844 = in.m_75.x;
    float _846 = in.m_75.y;
    float _848 = in.m_75.z;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _858 = _544 * _670;
    float _860 = _852 * _760;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _862;
    float _866 = sqrt(_838);
    float _868 = _856 * _826;
    float _870 = fma(_860, _836, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _872 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _874 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _876 = isnan(_580);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = _864 * _616;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _890 = _580 + _888;
    float _892 = fma(_868, _592, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _894 = rsqrt(_832);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _898 = _580 + _896;
    float _900 = fma(_886, _890, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _902 = fma(_778, _898, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _904 = _730 * _866;
    bool _906 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _908 = isnan(_580);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _844);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _922 = _744 * _904;
    bool _924 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _926 = isnan(_580);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _840 * _904;
    float _938 = _872 * _904;
    float _940 = _790 * _894;
    float _942 = _768 * _894;
    float _944 = _820 * _894;
    float _946 = -_916;
    float _948 = _946 + 1.0;
    float _950 = _922 * _918;
    float _952 = -_934;
    float _954 = _952 + 1.0;
    float _956 = _936 * _920;
    float _958 = _934 * _948;
    bool _960 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _962 = isnan(_580);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = _884 * _954;
    float _974 = -_884;
    float _976 = _974 + 1.0;
    bool _978 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _980 = isnan(_580);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _848);
    float _992 = -_970;
    float _994 = _992 + 1.0;
    float _996 = _970 * _976;
    bool _998 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1000 = isnan(_580);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _938 * _990;
    float _1012 = _988 * _994;
    float _1014 = -_988;
    float _1016 = _1014 + 1.0;
    float _1018 = _636 * _944;
    float _1020 = -_1008;
    float _1022 = _1020 + 1.0;
    float _1024 = _956 * _638;
    float _1026 = _1008 * _1016;
    float _1028 = _638 * _942;
    float _1030 = _956 * _640;
    bool _1032 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1034 = isnan(_580);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1018;
    float _1046 = fma(_640, _942, _1044);
    float _1048 = fma(_950, _940, _1024);
    float _1050 = -_1028;
    float _1052 = fma(_636, _940, _1050);
    float _1054 = fma(_950, _944, _1030);
    float _1056 = _1042 * _1022;
    float _1058 = -_1042;
    float _1060 = _1058 + 1.0;
    float _1062 = fma(_1010, _1046, _1048);
    float _1064 = fma(_1010, _1052, _1054);
    float _1066 = 1.0 / _698;
    float _1068 = _628 * _1060;
    float _1070 = _672 + _1062;
    float _1072 = _674 + _1064;
    float _1074 = _956 * _636;
    float _1076 = _870 * _1068;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1080 = _1070 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1084 = _1072 + _1082;
    float _1086 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1076);
    float _1088 = _1080 * _1080;
    float _1090 = _1084 * _1084;
    bool _1092 = _846 != 0.0;
    bool _1094 = isnan(_846);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1102;
    float _1106 = fma(_892, _1056, _1086);
    float _1108 = _1088 + _1090;
    float _1110 = _708 * _1066;
    float _1112 = _1104 * _842;
    float _1114 = fma(_900, _1026, _1106);
    float _1116 = sqrt(_1108);
    float _1118 = in.m_77.x;
    float _1120 = in.m_77.y;
    float _1122 = in.m_77.z;
    float _1124 = _640 * _940;
    float _1126 = fma(_950, _942, _1074);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1130 = _580 + _1128;
    float _1132 = fma(_902, _1012, _1114);
    float _1134 = -_1124;
    float _1136 = fma(_638, _944, _1134);
    bool _1138 = _844 == 0.0;
    bool _1140 = !_1100;
    bool _1142 = _1138 && _1140;
    float _1144 = fma(_762, _1130, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1148 = _580 + _1146;
    float _1150 = fma(_1010, _1136, _1126);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1154 = _580 + _1152;
    bool _1156 = _848 == 0.0;
    bool _1158 = _1156 && _1142;
    float _1160 = _664 + _1150;
    bool _1162 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1070;
    float _1166 = _1088;
    float _1168 = _1090;
    float _1170 = _1072;
    float _1172 = _844;
    int _1174 = as_type<int>(_796);
    int _1176 = as_type<int>(_798);
    int _1178 = as_type<int>(_800);
    if (!_1162)
    {
        _714 = _1070;
    }
    float _1180 = _714;
    float _1182 = _1180;
    if (!_1162)
    {
        _1164 = _1160;
    }
    float _1184 = _1164;
    bool _1186 = !_1162;
    float _1188 = _1184;
    float _1190 = _1120;
    float _1192 = _1118;
    float _1194 = _1122;
    if (!_1186)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1116 + _1198;
        float _1202 = rsqrt(_1108);
        float _1204 = _1200 * _1196;
        float _1206 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = _1204 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = fma(_1212, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1202 * _1218;
        float _1222 = _1216 + (-1.0);
        float _1224 = fma(_1080, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1226 = fma(_1084, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1228 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1232 = _1224 + _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1236 = _1226 + _1234;
        float _1238 = fma(_1160, _1216, _1228);
        float _1240 = _1232 * _1232;
        float _1242 = _1236 * _1236;
        _1188 = _1238;
        _1166 = _1240;
        _1168 = _1242;
        _1182 = _1224;
        _1170 = _1226;
    }
    float _1244 = _1188;
    float _1246 = _1166;
    float _1248 = _1168;
    float _1250 = _1182;
    float _1252 = _1170;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1256 = _1244 + _1254;
    if (!_1158)
    {
        float _1258 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1120);
        _1190 = _1258;
    }
    float _1260 = _1190;
    float _1262 = fma(_1110, _1148, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1264 = fma(_1144, _996, _1132);
    float _1266 = fma(_1256, _1256, _1246);
    if (!_1158)
    {
        float _1268 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1118);
        _1192 = _1268;
    }
    float _1270 = _1192;
    float _1272 = _638 * _1260;
    float _1274 = _636 * _1260;
    float _1276 = _1266 + _1248;
    float _1278 = fma(_1112, _1154, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1280 = fma(_1262, _972, _1264);
    float _1282 = _640 * _1260;
    if (!_1158)
    {
        float _1284 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1122);
        _1194 = _1284;
    }
    float _1286 = _1194;
    float _1288 = fma(_940, _1270, _1272);
    float _1290 = sqrt(_1276);
    float _1292 = fma(_942, _1270, _1274);
    float _1294 = fma(_1278, _958, _1280);
    float _1296 = fma(_944, _1270, _1282);
    float _1298 = fma(_1046, _1286, _1288);
    float _1300 = fma(_1136, _1286, _1292);
    float _1302 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1294);
    float _1304 = fma(_1052, _1286, _1296);
    out.m_79.x = _1302;
    out.m_81.x = _1298;
    out.m_81.y = _1300;
    out.m_81.z = _1304;
    bool _1306 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1308 = isnan(_1290);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1314 = _1310 || _1312;
    if (!_1314)
    {
        _1172 = 1.0;
    }
    float _1316 = _1172;
    bool _1318 = !_1314;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1290);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1290 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1290);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1290 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = -_798;
    float _1384 = _672 + _1382;
    float _1386 = -_800;
    float _1388 = _674 + _1386;
    float _1390 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1392 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1394 = floor(_1390);
    float _1396 = floor(_1392);
    float _1398 = -_1394;
    float _1400 = _1390 + _1398;
    float _1402 = -_1396;
    float _1404 = _1392 + _1402;
    float2 _4913 = float2(_1400, _1404);
    float _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).x;
    float _1408 = -_796;
    float _1410 = _664 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1414 = _1250 + _1412;
    float _1416 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1420 = _1252 + _1418;
    float _1422 = fma(_1414, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1424 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1416);
    float _1426 = fma(_1420, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1428 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1424);
    float _1430 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1436 = 1.0 / _1432;
    float _1438 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1442 = _1440 + _1432;
    float _1444 = _1442 * _1436;
    float _1446 = _1444 * 0.5;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1448);
    float _1452 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1454 = 1.0 / _1450;
    float _1456 = _1410 + _1452;
    float _1458 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1460 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1458);
    float _1462 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1460);
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1466 = _1454 * _1464;
    float _1468 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1470 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1472 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1474 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1470);
    bool _1476 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1478 = trunc(_1468);
    int _1480 = int(_1478);
    bool _1482 = !_1472;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1474);
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1490 = 2;
    float _1492 = _1426;
    float _1494 = _1488;
    float _1496 = _1456;
    if (!_1472)
    {
        _1490 = 1;
    }
    int _1498 = _1490;
    float _1500 = trunc(_1488);
    int _1502 = int(_1500);
    int _1504 = _1498;
    if (!_1476)
    {
        _1504 = _1484;
    }
    int _1506 = _1504;
    int _1508 = _1506 << 6;
    bool _1510 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1522 = _1244 + _1520;
    int _1524 = _1508 + 48;
    uint _1527 = uint(int(uint(_1524) >> uint(2)));
    uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
    int _1531 = int(_1527) & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    int _1535 = int(_1527) + 1;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    int _1539 = _1535 & 3;
    float _1541 = (*spvDescriptorSet0.vp_c15)._m0[int(_1537)][_1539];
    int _1543 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1545 = _1480 + _1543;
    int _1547 = _1545 + 1;
    float _1549 = fma(_1522, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1551 = -_798;
    float _1553 = _1551 + _1422;
    bool _1555 = _1547 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1557 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1559 = _1502 + _1557;
    int _1561 = _1559 + 1;
    int _1563 = _1508 + 56;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    uint _1567 = uint(int(uint(int(_1565)) >> uint(2)));
    int _1569 = int(_1565) & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    int _1573 = int(_1565) + 1;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    int _1577 = _1573 & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    float _1581 = -_796;
    float _1583 = _1581 + _1549;
    int _1585 = _1547 | _1561;
    bool _1587 = _1585 < 0;
    bool _1589 = _1587 || _1555;
    int _1591 = _1508 + 64;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[int(_1603)][_1605];
    float _1609 = -_800;
    float _1611 = _1609 + _1426;
    bool _1613 = _1561 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1615 = _1613 || _1589;
    int _1617 = _1508 + 72;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    uint _1621 = uint(int(uint(int(_1619)) >> uint(2)));
    int _1623 = int(_1619) & 3;
    float _1625 = (*spvDescriptorSet0.vp_c15)._m0[int(_1621)][_1623];
    int _1627 = int(_1619) + 1;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    int _1631 = _1627 & 3;
    float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
    int _1635 = _1508 + 96;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    uint _1639 = uint(int(uint(int(_1637)) >> uint(2)));
    int _1641 = int(_1637) & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    int _1645 = int(_1637) + 1;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    int _1649 = _1645 & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = _1508 + 104;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    uint _1657 = uint(int(uint(int(_1655)) >> uint(2)));
    int _1659 = int(_1655) & 3;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[int(_1657)][_1659];
    int _1663 = int(_1655) + 1;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    int _1667 = _1663 & 3;
    float _1669 = (*spvDescriptorSet0.vp_c15)._m0[int(_1665)][_1667];
    float _1671 = _1583;
    float _1673 = _1553;
    float _1675 = _1611;
    float _1677 = as_type<float>(_1506);
    float _1679 = as_type<float>(_1547);
    if (!_1518)
    {
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1683 = _1410 + _1681;
        float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1687 = _1384 + _1685;
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = -_674;
        float _1693 = _1691 + _1426;
        float _1695 = _1683 * _1683;
        float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1699 = _1388 + _1697;
        float _1701 = -_672;
        float _1703 = _1701 + _1422;
        float _1705 = fma(_1687, _1687, _1695);
        float _1707 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1709 = fma(_1699, _1699, _1705);
        float _1711 = sqrt(_1709);
        float _1713 = 1.0 / _904;
        float _1715 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1717 = precise::min(_1711, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1719 = _1717 * _1689;
        float _1721 = _1719 * _1713;
        float _1723 = -_664;
        float _1725 = _1723 + _1549;
        float _1727 = _1715 * _1721;
        float _1729 = _1693 * _1721;
        float _1731 = fma(_1725, _1727, _1410);
        float _1733 = fma(_1703, _1727, _1384);
        float _1735 = fma(_1715, _1729, _1388);
        _1671 = _1731;
        _1673 = _1733;
        _1174 = as_type<int>(_1689);
        _1675 = _1735;
        _1176 = as_type<int>(_1721);
    }
    float _1737 = _1671;
    float _1739 = _1673;
    int _1741 = _1174;
    float _1743 = _1675;
    int _1745 = _1176;
    float _1747 = _1456 * _1651;
    int _1749 = _1741;
    int _1751 = _1745;
    if (!_1615)
    {
        int _1753 = _1561 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1755 = _1753 + _1547;
        _1178 = _1755;
    }
    int _1757 = _1178;
    float _1759 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1761 = _1456 * _1541;
    float _1763 = fma(_1384, _1643, _1747);
    float _1765 = _1456 * _1607;
    if (!_1615)
    {
        int _1767 = _1757 << 2;
        _1749 = _1767;
    }
    int _1769 = _1749;
    float _1771 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1759);
    float _1773 = fma(_1388, _1661, _1763);
    float _1775 = fma(_1384, _1599, _1765);
    int _1777 = _1769;
    if (!_1615)
    {
        uint _1779 = uint(int(uint(_1757) >> uint(2)));
        _1751 = int(_1779);
    }
    int _1781 = _1751;
    int _1783 = _1508 + 80;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
    int _1789 = int(_1785) & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    int _1793 = int(_1785) + 1;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    int _1797 = _1793 & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    float _1801 = _1773 + _1669;
    if (!_1615)
    {
        int _1803 = 12 & _1769;
        _1777 = _1803;
    }
    int _1805 = _1777;
    float _1807 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1771);
    float _1809 = fma(_1384, _1533, _1761);
    if (!_1615)
    {
        int _1811 = _1781 << 4;
        int _1813 = _1811 + _1805;
        _1492 = as_type<float>(_1813);
    }
    float _1815 = _1492;
    float _1817 = 1.0 / _1801;
    int _1819 = _1508 + 88;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
    int _1825 = int(_1821) & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = int(_1821) + 1;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    int _1833 = _1829 & 3;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
    float _1837 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1839 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1841 = fma(_1388, _1571, _1809);
    float _1843 = fma(_1388, _1625, _1775);
    float _1845 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1847 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1849 = _1841 + _1579;
    float _1851 = _1815;
    if (!_1615)
    {
        int _1853 = as_type<int>(_1815) + 400;
        uint _1855 = uint(int(uint(_1853) >> uint(2)));
        uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
        int _1859 = int(_1855) & 3;
        float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
        _1851 = _1861;
    }
    float _1863 = _1851;
    float _1865 = -_1845;
    float _1867 = fma(_1865, _1839, 1.0);
    float _1869 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1871 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = _1843 + _1633;
    float _1875 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1847);
    float _1877 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1869);
    float _1879 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = _1849 * _1817;
    float _1883 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1885 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1877);
    float _1887 = _1873 * _1817;
    float _1889 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    bool _1891 = _1881 >= 0.0;
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1897 = log2(_1867);
    bool _1899 = _1881 <= 1.0;
    bool _1901 = _1899 && _1891;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1907 = _1887 >= 0.0;
    bool _1909 = _1907 && _1901;
    float _1911 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1903);
    float _1913 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1915 = _1651;
    float _1917 = _1881;
    if (!_1615)
    {
        float _1919 = floor(_1468);
        _1915 = _1919;
    }
    float _1921 = _1915;
    bool _1923 = _1887 <= 1.0;
    bool _1925 = _1923 && _1909;
    float _1927 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1929 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1911);
    float _1931 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1933 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1929);
    float _1935 = _1456 * _1799;
    float _1937 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1913);
    float _1939 = _1549;
    if (!_1615)
    {
        float _1941 = floor(_1488);
        _1939 = _1941;
    }
    float _1943 = _1939;
    float _1945 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1947 = fma(_1384, _1791, _1935);
    float _1949 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1937);
    if (_1925)
    {
        float _1951 = float(_1506);
        _1677 = _1951;
    }
    float _1953 = _1677;
    float _1955 = _1897 * 0.693147182464599609375;
    float _1957 = fma(_1388, _1827, _1947);
    float _1959 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1949);
    float _1961 = 1.0 / _1933;
    float _1963 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1945);
    float _1965 = _1957 + _1835;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1969 = _1835;
    float _1971 = _1963;
    float _1973 = _1959;
    if (!_1615)
    {
        float _1975 = -_1921;
        float _1977 = _1468 + _1975;
        _1969 = _1977;
    }
    float _1979 = _1969;
    float _1981 = _1965 * _1817;
    float _1983 = _1935;
    if (_1925)
    {
        float _1985 = rint(_1953);
        float _1987 = precise::max(_1985, 0.0);
        uint _1989 = uint(_1987);
        uint _1991 = clamp(_1989, 0u, 65535u);
        _1983 = as_type<float>(_1991);
    }
    float _1993 = _1983;
    float _1995 = _1943;
    if (!_1615)
    {
        float _1997 = -_1943;
        float _1999 = _1488 + _1997;
        _1494 = _1999;
    }
    float _2001 = _1494;
    float _2003 = _1965;
    float _2005 = _1863;
    if (!_1615)
    {
        float _2007 = rint(_1863);
        float _2009 = precise::max(_2007, 0.0);
        uint _2011 = uint(_2009);
        uint _2013 = clamp(_2011, 0u, 65535u);
        _2003 = as_type<float>(_2013);
    }
    float _2015 = _2003;
    float _2017 = _1959 * _1961;
    float _2019 = _1963 * _1961;
    float _2021 = fma(_2017, 0.5, 0.5);
    float _2023 = fma(_2019, -0.5, 0.5);
    float _2025 = _1993;
    if (_1925)
    {
        float3 _5956 = float3(_1881, _1887, float(as_type<int>(_1993)));
        float3 _5960 = select(_5956, float3(0.0), isnan(_5956));
        float _2027 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5960.xy, uint(rint(_5960.z)), _1981, level(0.0));
        _2025 = _2027;
    }
    float _2029 = _2025;
    float3 _5970 = float3(_2021, _2023, _1967);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5979 = float3(_2021, _2023, _1967);
    float4 _2034 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5979, float3(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5979, float3(0.0), isnan(_5979)), level(0.0)).xyzw;
    float _2036 = _2034.x;
    float _2038 = _2034.y;
    float _2040 = _2034.z;
    float _2042 = _2034.w;
    float _2044 = _1979;
    if (!_1615)
    {
        float3 _6002 = float3(_1979, _2001, float(as_type<int>(_2015)));
        float3 _6004 = select(_6002, float3(0.0), isnan(_6002));
        float _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6004.xy, uint(rint(_6004.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6004.xy, uint(rint(_6004.z)), level(0.0)).x;
        _2044 = _2046;
    }
    float _2048 = _2044;
    if (_1615)
    {
        _1995 = 1.0;
    }
    float _2050 = _1995;
    float _2052 = _2050;
    if (!_1615)
    {
        int _2054 = _1757 << 4;
        int _2056 = _2054 + 2048;
        uint _2058 = uint(int(uint(_2056) >> uint(2)));
        uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
        int _2062 = int(_2058) & 3;
        float _2064 = (*spvDescriptorSet0.vp_c15)._m0[int(_2060)][_2062];
        int _2066 = int(_2058) + 1;
        uint _2068 = uint(int(uint(_2066) >> uint(2)));
        int _2070 = _2066 & 3;
        float _2072 = (*spvDescriptorSet0.vp_c15)._m0[int(_2068)][_2070];
        int _2074 = _2056 + 8;
        uint _2076 = uint(int(uint(_2074) >> uint(2)));
        uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
        int _2080 = int(_2076) & 3;
        float _2082 = (*spvDescriptorSet0.vp_c15)._m0[int(_2078)][_2080];
        int _2084 = int(_2076) + 1;
        uint _2086 = uint(int(uint(_2084) >> uint(2)));
        int _2088 = _2084 & 3;
        float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
        float _2092 = _1456 * _2072;
        float _2094 = fma(_1384, _2064, _2092);
        float _2096 = fma(_1388, _2082, _2094);
        float _2098 = _2096 + _2090;
        float _2100 = precise::clamp(_2098, 0.0, 1.0);
        float _2102 = -_2100;
        float _2104 = _2102 + _2048;
        float _2106 = fma(_2104, 500.0, 1.5);
        float _2108 = exp2(_2106);
        float _2110 = 0.0 + _2108;
        float _2112 = precise::clamp(_2110, 0.0, 1.0);
        _1496 = _2100;
        _2005 = _2072;
        _2052 = _2112;
    }
    float _2114 = _1496;
    float _2116 = _2005;
    float _2118 = _2052;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2122 = _1737 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2126 = _1739 + _2124;
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2130 = _1743 + _2128;
    float _2132 = _2122 * _2122;
    float _2134 = fma(_2126, _2126, _2132);
    float _2136 = fma(_2130, _2130, _2134);
    float _2138 = rsqrt(_2136);
    float _2140 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2142 = _2126 * _2140;
    float _2144 = _2130 * _2140;
    float _2146 = _2142 * _2142;
    float _2148 = _2144 * _2144;
    float _2150 = _2146 + _2148;
    float _2152 = sqrt(_2150);
    bool _2154 = _2152 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2158 = _2152 + _2156;
    float _2160 = _2138;
    float _2162 = _2158;
    float _2164 = _2114;
    float _2166 = _2122;
    if (_2154)
    {
        float _2168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2168;
    }
    float _2170 = _2160;
    if (_2154)
    {
        float _2172 = rsqrt(_2150);
        _1917 = _2172;
    }
    float _2174 = _1917;
    float _2176 = _2174;
    if (_2154)
    {
        float _2178 = _2158 * _2170;
        _2162 = _2178;
    }
    float _2180 = _2162;
    if (_2154)
    {
        float _2182 = _2180 * 0.15915493667125701904296875;
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2130;
    if (_2154)
    {
        float _2188 = _2184 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2196 = precise::max(0.0, _2194);
    float _2198 = _2116;
    float _2200 = _2196;
    float _2202 = _2194;
    if (_2154)
    {
        float _2204 = _2184 * 6.283185482025146484375;
        float _2206 = cos(_2204);
        _2198 = _2206;
    }
    float _2208 = _2198;
    float _2210 = -_2140;
    float _2212 = -_2196;
    float _2214 = fma(_2122, _2210, _2212);
    if (!_2154)
    {
        _2166 = _2146;
    }
    float _2216 = _2166;
    float _2218 = _2216;
    if (_2154)
    {
        float _2220 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2220;
    }
    float _2222 = _2200;
    float _2224 = _2192;
    float _2226 = _2222;
    if (_2154)
    {
        float _2228 = fma(_2192, _2222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2224 = _2228;
    }
    float _2230 = _2224;
    float _2232 = _2230;
    if (!_2154)
    {
        _2226 = _2214;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    float _2238 = _2208;
    if (_2154)
    {
        float _2240 = _2208 + (-1.0);
        _2202 = _2240;
    }
    float _2242 = _2202;
    float _2244 = _2242;
    if (_2154)
    {
        float _2246 = _2174 * _2230;
        _1679 = _2246;
    }
    float _2248 = _1679;
    if (!_2154)
    {
        _2176 = _2142;
    }
    float _2250 = _2176;
    float _2252 = _2250;
    if (_2154)
    {
        float _2254 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2244 = _2254;
    }
    float _2256 = _2244;
    if (_2154)
    {
        float _2258 = _2142 * _2248;
        _2252 = _2258;
    }
    float _2260 = _2252;
    if (!_2154)
    {
        _2232 = _2144;
    }
    float _2262 = _2232;
    float _2264 = _2262;
    if (_2154)
    {
        float _2266 = _2144 * _2248;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (_2154)
    {
        float _2270 = fma(_2214, _2208, _2256);
        _2236 = _2270;
    }
    float _2272 = _2236;
    if (_2154)
    {
        float _2274 = _2260 * _2260;
        _2218 = _2274;
    }
    float _2276 = _2218;
    if (!_2154)
    {
        _2238 = _2148;
    }
    float _2278 = _2238;
    float _2280 = sqrt(_2136);
    float _2282 = _2278;
    if (_2154)
    {
        float _2284 = _2268 * _2268;
        _2282 = _2284;
    }
    float _2286 = _2282;
    float _2288 = fma(_2272, _2272, _2276);
    float _2290 = _2288 + _2286;
    float _2292 = rsqrt(_2290);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = -_2298;
    float _2302 = _2300 + 1.0;
    float _2304 = _2292 * _2260;
    float _2306 = abs(_2302);
    float _2308 = log2(_2306);
    float _2310 = _2292 * _2272;
    float _2312 = _2292 * _2268;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2316 = -_2314;
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = -_2312;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2324 = fma(_2322, -0.5, 0.5);
    float _2326 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2328 = fma(_2322, 0.5, 0.5);
    float _2330 = _2310 + 1.0;
    float _2332 = exp2(_2326);
    float _2334 = fma(_2328, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = fma(_2328, _2334, -0.212114393711090087890625);
    float _2338 = sqrt(_2324);
    float _2340 = fma(_2328, _2336, 1.570728778839111328125);
    float _2342 = -_2310;
    float _2344 = fma(_2332, _2330, _2342);
    float _2346 = fma(_2344, 0.5, 0.5);
    float _2348 = _2338 * 0.636619746685028076171875;
    float _2350 = -_2340;
    float _2352 = fma(_2348, _2350, 1.0);
    float2 _6480 = float2(_2352, _2346);
    float3 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6480, float2(0.0), isnan(_6480)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6480, float2(0.0), isnan(_6480)), level(0.0)).xyz;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = abs(_1466);
    float _2366 = log2(_2364);
    float _2368 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2370 = -_1406;
    float _2372 = _2370 + 1.0;
    out.m_83.x = _1739;
    out.m_83.y = _1737;
    out.m_83.z = _1743;
    float _2374 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2368);
    bool _2376 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2378 = isnan(_2280);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2384 = _2380 || _2382;
    bool _2386 = _1466 <= 8000.0;
    bool _2388 = isnan(_1466);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan(8000.0);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2374);
    float _2400 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    float _2402 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1959;
    out.gl_Position.y = _1963;
    out.gl_Position.z = _2400;
    out.gl_Position.w = _1933;
    float _2404 = exp2(_2402);
    if (!_2384)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2406 = _1971;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2384)
    {
        _1973 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2412 = _1973;
    float _2414 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = fma(_2416, -2.0, 3.0);
    float _2420 = _2416 * _2416;
    float _2422 = _2420 * _2418;
    float _2424 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2426 = _2400 + _1933;
    float _2428 = -_2422;
    float _2430 = _2428 + 1.0;
    float _2432 = exp2(_2424);
    float _2434 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2436 = _2426 * 0.5;
    float _2438 = _2396 * _2434;
    float _2440 = _2434;
    float _2442 = _2412;
    float _2444 = _2412;
    if (!_1925)
    {
        _2440 = 1.0;
    }
    float _2446 = _2440;
    out.m_85.z = _2436;
    out.m_85.w = _1933;
    float _2448 = _2446;
    if (_1925)
    {
        bool _2450 = _2029 >= _1981;
        bool _2452 = isnan(_2029);
        bool _2454 = _2450 || _2452;
        bool _2456 = isnan(_1981);
        bool _2458 = _2454 || _2456;
        float _2460 = float(_2458);
        _2448 = _2460;
    }
    float _2462 = _2448;
    float _2464 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2466 = _2372 * _2464;
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = _2462 * _2118;
    float _2472 = -_2432;
    float _2474 = _2472 + 1.0;
    float _2476 = -_2468;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2480 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2482 = -_2470;
    float _2484 = fma(_2482, _2478, 1.0);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2480 * _2031;
    float _2490 = -_2480;
    float _2492 = _2490 + 1.0;
    float _2494 = _2486 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2496 = _2042 * _2488;
    float _2498 = _2042 * _2492;
    out.m_87.x = _2494;
    float _2500 = _2362 * _2488;
    float _2502 = fma(_2358, _2496, _2036);
    float _2504 = fma(_2360, _2496, _2038);
    float _2506 = fma(_2042, _2500, _2040);
    float _2508 = _2500;
    if (!_2384)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2510 = _2508;
    out.m_89.x = _2502;
    out.m_89.y = _2504;
    out.m_89.z = _2506;
    out.m_89.w = _2498;
    bool _2512 = !_2384;
    float _2514 = _2510;
    float _2516 = _2510;
    if (!_2512)
    {
        bool _2518 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2520 = isnan(_2280);
        bool _2522 = _2518 || _2520;
        bool _2524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2526 = _2522 || _2524;
        if (!_2526)
        {
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2530 = _2280 + _2528;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2544 = 1.0 / _2534;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2550 = _2530 * _2544;
            float _2552 = precise::clamp(_2550, 0.0, 1.0);
            float _2554 = fma(_2552, _2538, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2556 = fma(_2552, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2558 = fma(_2552, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2444 = _2556;
            _2410 = _2554;
            _2516 = _2558;
            _2560 = true;
        }
        else
        {
            bool _2562 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2564 = isnan(_2280);
            bool _2566 = _2562 || _2564;
            bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2570 = _2566 || _2568;
            if (!_2570)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2572 = _2408;
            _2410 = _2572;
            if (!_2570)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2574 = _2442;
            _2444 = _2574;
            if (!_2570)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2576 = _2514;
            bool _2578 = !_2570;
            _2516 = _2576;
            if (!_2578)
            {
                bool _2580 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_2280);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _2280 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2606 = 1.0 / _2596;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2612 = _2592 * _2606;
                    float _2614 = precise::clamp(_2612, 0.0, 1.0);
                    float _2616 = fma(_2614, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2618 = fma(_2614, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2620 = fma(_2614, _2610, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2444 = _2618;
                    _2410 = _2616;
                    _2516 = _2620;
                    _2560 = true;
                }
                else
                {
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2560 = false;
    float _2622 = _2444;
    float _2624 = _2410;
    float _2626 = _2516;
    float _2628 = _2622 * 0.586610972881317138671875;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _2632 = fma(_2624, 0.298911988735198974609375, _2628);
    out.m_91.x = 0.0;
    float _2634 = fma(_2626, 0.114477999508380889892578125, _2632);
    float _2636 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2638 = -_2634;
    float _2640 = _2638 + _2624;
    float _2642 = -_2634;
    float _2644 = _2642 + _2622;
    float _2646 = -_2634;
    float _2648 = _2646 + _2626;
    out.m_87.w = _2636;
    float _2650 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2652 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2654 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    out.m_93.x = _2650;
    out.m_93.y = _2652;
    out.m_93.z = _2654;
    if (!_2630)
    {
        return out;
    }
    float _2656 = -_1737;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2660 = -_1739;
    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2664 = -_1743;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2668 = _2658 * _2658;
    float _2670 = fma(_2662, _2662, _2668);
    float _2672 = fma(_2666, _2666, _2670);
    float _2674 = sqrt(_2672);
    float _2676 = rsqrt(_2672);
    float _2678 = -_2674;
    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = _2662 * _2676;
    float _2688 = _2658 * _2676;
    float _2690 = abs(_2684);
    float _2692 = log2(_2690);
    float _2694 = _2666 * _2676;
    float _2696 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2698 = _1300 * _2688;
    float _2700 = -_2688;
    float _2702 = -_2696;
    float _2704 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2702);
    float _2706 = fma(_1298, _2686, _2698);
    float _2708 = -_2694;
    float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2704);
    float _2712 = fma(_1304, _2694, _2706);
    float _2714 = precise::clamp(_2712, 0.0, 1.0);
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2718 = _2710 + _2716;
    float _2720 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2722 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2724 = precise::clamp(_2722, 0.0, 1.0);
    float _2726 = exp2(_2720);
    float _2728 = _2726 * _2724;
    float _2730 = _2714 * _2728;
    float _2732 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2736 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2732;
    out.m_91.y = _2734;
    out.m_91.z = _2736;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2560 = false;
    bool _1350 = false;
    bool _572 = false;
    bool _212 = false;
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
        float _2793 = as_type<float>(_128);
        out.gl_Position.z = _2793;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_63.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    if (_142)
    {
        float _150 = float(_112);
        _148 = _150;
    }
    float _152 = _148;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_158)
    {
        out.m_61.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2861 = as_type<float>(_164);
        out.gl_Position.z = _2861;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_65.x;
    float _168 = in.m_65.y;
    float _170 = in.m_65.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _174 = _168 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _168 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_172;
    float _210;
    if (!_192)
    {
        float _194 = in.m_67.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_112);
        float _216 = 1.0 / _214;
        float _218 = _146 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _228 = _226 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = 1.0 / _224;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = 1.0 / _232;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _252 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _256 = 1.0 / _236;
    float _258 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _260 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _262 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _266 = 1.0 / _228;
    float _268 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _220 + _270;
    out.m_69.x = _260;
    out.m_69.y = _262;
    out.m_69.z = _264;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _274;
    float _278 = _272 * _238;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = _220 + _280;
    out.m_71.x = _252;
    out.m_71.y = _258;
    out.m_71.z = _268;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _220 + _284;
    float _288 = 1.0 / _276;
    float _290 = _282 * _242;
    bool _292 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _294 = isnan(_220);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _220 + _304;
    bool _308 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_220);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    float _324 = _286 * _266;
    bool _326 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_220);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _306 * _256;
    bool _340 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_220);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_302;
    float _354 = _352 + 1.0;
    bool _356 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_220);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _370 = _220 + _368;
    float _372 = fma(_322, _278, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _374 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _376 = isnan(_220);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = _366 * _354;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = _336 * _388;
    float _402 = -_350;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _406;
    float _410 = -_336;
    float _412 = _410 + 1.0;
    float _414 = fma(_398, _278, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = _318 * _404;
    float _418 = -_318;
    float _420 = _418 + 1.0;
    float _422 = fma(_408, _278, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _424 = _350 * _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = _384 * _420;
    float _432 = -_384;
    float _434 = _432 + 1.0;
    float _436 = _370 * _288;
    float _438 = _414 * _430;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _444 = fma(_428, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _446 = _422 * _430;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _448;
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _454 = _372 * _430;
    float _456 = fma(_442, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_394, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = fma(_450, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _462 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _464 = fma(_444, _416, _452);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _470;
    float _474 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _454);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = fma(_456, _416, _462);
    float _486 = fma(_460, _424, _464);
    float _488 = fma(_468, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_472, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_458, _416, _474);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _498 = fma(_478, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _500 = fma(_482, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _504 = fma(_488, _424, _484);
    float _506 = fma(_490, _424, _492);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = fma(_496, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _518;
    float _522 = fma(_498, _400, _486);
    float _524 = fma(_510, _436, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _526 = fma(_514, _436, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _528 = fma(_520, _436, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _530 = fma(_500, _400, _504);
    float _532 = fma(_516, _400, _506);
    float _534 = fma(_524, _390, _522);
    float _536 = fma(_526, _390, _530);
    float _538 = fma(_528, _390, _532);
    float _540 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].x, _534);
    float _542 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].y, _536);
    float _544 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[148].z, _538);
    bool _546 = !_502;
    float _548 = _530;
    float _550 = _416;
    float _552 = _484;
    float _570;
    if (!_546)
    {
        float _554 = in.m_67.x;
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _558 = _554 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[14].y, _146);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        float _574 = float(_112);
        float _576 = 1.0 / _574;
        float _578 = _146 * _576;
        _570 = _578;
    }
    _572 = false;
    float _580 = _570;
    float _582 = _188 * _188;
    float _584 = in.m_58.x;
    float _586 = in.m_58.y;
    float _588 = in.m_58.z;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _592 = _580 + _590;
    float _594 = fma(_186, _186, _582);
    float _596 = fma(_190, _190, _594);
    float _598 = rsqrt(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _616 = 1.0 / _602;
    bool _618 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _620 = isnan(_580);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _634 = _586 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _636 = _188 * _598;
    float _638 = _186 * _598;
    float _640 = _190 * _598;
    float _642 = _586 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _644 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _646 = _586 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _648 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _634);
    float _650 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c10)._m0[8].y, _644);
    float _654 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _646);
    float _656 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[5].z, _648);
    float _658 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _660 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[10].y, _652);
    float _662 = fma(_588, (*spvDescriptorSet0.vp_c10)._m0[6].z, _654);
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _666 = in.m_73.x;
    float _668 = in.m_73.y;
    float _670 = in.m_73.z;
    float _672 = _658 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = _662 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _678 = _664 + _676;
    float _680 = abs(_660);
    bool _682 = _680 > 0.99989998340606689453125;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _686 = _672 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _690 = _674 + _688;
    float _692 = _678 * _678;
    float _694 = 1.0 / _610;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _700;
    float _704 = fma(_686, _686, _692);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _710 = fma(_690, _690, _704);
    float _712 = 1.0 / _614;
    float _714 = _580;
    if (_682)
    {
        _548 = 0.001000000047497451305389404296875;
    }
    float _716 = _548;
    if (!_682)
    {
        _550 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _718 = _550;
    float _720 = _718;
    if (!_682)
    {
        _552 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _722 = _552;
    float _724 = _722;
    if (_682)
    {
        float _726 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _720 = _726;
    }
    float _728 = _720;
    float _730 = rsqrt(_710);
    float _732 = _540 * _666;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[167].w;
    if (_682)
    {
        float _736 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _724 = _736;
    }
    float _738 = _724;
    float _740 = -_728;
    float _742 = _640 * _740;
    float _744 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    if (!_682)
    {
        _734 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _750 = _734;
    float _752 = _750;
    if (_682)
    {
        float _754 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _752 = _754;
    }
    float _756 = _752;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _760 = 1.0 / _748;
    float _762 = _702 * _694;
    float _764 = -_756;
    float _766 = -_742;
    float _768 = fma(_638, _764, _766);
    float _770 = -_756;
    float _772 = _636 * _770;
    float _774 = -_628;
    float _776 = _774 + 1.0;
    float _778 = _606 * _712;
    float _780 = _758 * _730;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _786 = -_738;
    float _788 = -_772;
    float _790 = fma(_640, _786, _788);
    float _792 = -_738;
    float _794 = _638 * _792;
    float _796 = _678 * _780;
    float _798 = _686 * _780;
    float _800 = _690 * _780;
    float _802 = _768 * _768;
    float _804 = -_796;
    float _806 = _678 + _804;
    float _808 = -_798;
    float _810 = _686 + _808;
    float _812 = -_800;
    float _814 = _690 + _812;
    float _816 = -_728;
    float _818 = -_794;
    float _820 = fma(_636, _816, _818);
    float _822 = _806 * _806;
    float _824 = fma(_790, _790, _802);
    float _826 = 1.0 / _784;
    float _828 = _542 * _668;
    float _830 = fma(_810, _810, _822);
    float _832 = fma(_820, _820, _824);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _836 = _580 + _834;
    float _838 = fma(_814, _814, _830);
    float _840 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = 1.0 / _632;
    float _844 = in.m_75.x;
    float _846 = in.m_75.y;
    float _848 = in.m_75.z;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _858 = _544 * _670;
    float _860 = _852 * _760;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _862;
    float _866 = sqrt(_838);
    float _868 = _856 * _826;
    float _870 = fma(_860, _836, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _872 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _874 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _876 = isnan(_580);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = _864 * _616;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _890 = _580 + _888;
    float _892 = fma(_868, _592, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _894 = rsqrt(_832);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _898 = _580 + _896;
    float _900 = fma(_886, _890, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _902 = fma(_778, _898, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _904 = _730 * _866;
    bool _906 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _908 = isnan(_580);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _844);
    float _920 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _922 = _744 * _904;
    bool _924 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _926 = isnan(_580);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _840 * _904;
    float _938 = _872 * _904;
    float _940 = _790 * _894;
    float _942 = _768 * _894;
    float _944 = _820 * _894;
    float _946 = -_916;
    float _948 = _946 + 1.0;
    float _950 = _922 * _918;
    float _952 = -_934;
    float _954 = _952 + 1.0;
    float _956 = _936 * _920;
    float _958 = _934 * _948;
    bool _960 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _962 = isnan(_580);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = _884 * _954;
    float _974 = -_884;
    float _976 = _974 + 1.0;
    bool _978 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _980 = isnan(_580);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _848);
    float _992 = -_970;
    float _994 = _992 + 1.0;
    float _996 = _970 * _976;
    bool _998 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1000 = isnan(_580);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _938 * _990;
    float _1012 = _988 * _994;
    float _1014 = -_988;
    float _1016 = _1014 + 1.0;
    float _1018 = _636 * _944;
    float _1020 = -_1008;
    float _1022 = _1020 + 1.0;
    float _1024 = _956 * _638;
    float _1026 = _1008 * _1016;
    float _1028 = _638 * _942;
    float _1030 = _956 * _640;
    bool _1032 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1034 = isnan(_580);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1018;
    float _1046 = fma(_640, _942, _1044);
    float _1048 = fma(_950, _940, _1024);
    float _1050 = -_1028;
    float _1052 = fma(_636, _940, _1050);
    float _1054 = fma(_950, _944, _1030);
    float _1056 = _1042 * _1022;
    float _1058 = -_1042;
    float _1060 = _1058 + 1.0;
    float _1062 = fma(_1010, _1046, _1048);
    float _1064 = fma(_1010, _1052, _1054);
    float _1066 = 1.0 / _698;
    float _1068 = _628 * _1060;
    float _1070 = _672 + _1062;
    float _1072 = _674 + _1064;
    float _1074 = _956 * _636;
    float _1076 = _870 * _1068;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1080 = _1070 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1084 = _1072 + _1082;
    float _1086 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1076);
    float _1088 = _1080 * _1080;
    float _1090 = _1084 * _1084;
    bool _1092 = _846 != 0.0;
    bool _1094 = isnan(_846);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1102;
    float _1106 = fma(_892, _1056, _1086);
    float _1108 = _1088 + _1090;
    float _1110 = _708 * _1066;
    float _1112 = _1104 * _842;
    float _1114 = fma(_900, _1026, _1106);
    float _1116 = sqrt(_1108);
    float _1118 = in.m_77.x;
    float _1120 = in.m_77.y;
    float _1122 = in.m_77.z;
    float _1124 = _640 * _940;
    float _1126 = fma(_950, _942, _1074);
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1130 = _580 + _1128;
    float _1132 = fma(_902, _1012, _1114);
    float _1134 = -_1124;
    float _1136 = fma(_638, _944, _1134);
    bool _1138 = _844 == 0.0;
    bool _1140 = !_1100;
    bool _1142 = _1138 && _1140;
    float _1144 = fma(_762, _1130, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1148 = _580 + _1146;
    float _1150 = fma(_1010, _1136, _1126);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1154 = _580 + _1152;
    bool _1156 = _848 == 0.0;
    bool _1158 = _1156 && _1142;
    float _1160 = _664 + _1150;
    bool _1162 = _1116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1070;
    float _1166 = _1088;
    float _1168 = _1090;
    float _1170 = _1072;
    float _1172 = _844;
    int _1174 = as_type<int>(_796);
    int _1176 = as_type<int>(_798);
    int _1178 = as_type<int>(_800);
    if (!_1162)
    {
        _714 = _1070;
    }
    float _1180 = _714;
    float _1182 = _1180;
    if (!_1162)
    {
        _1164 = _1160;
    }
    float _1184 = _1164;
    bool _1186 = !_1162;
    float _1188 = _1184;
    float _1190 = _1120;
    float _1192 = _1118;
    float _1194 = _1122;
    if (!_1186)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1116 + _1198;
        float _1202 = rsqrt(_1108);
        float _1204 = _1200 * _1196;
        float _1206 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1208 = _1204 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = fma(_1212, _1206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1202 * _1218;
        float _1222 = _1216 + (-1.0);
        float _1224 = fma(_1080, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1226 = fma(_1084, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1228 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1232 = _1224 + _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1236 = _1226 + _1234;
        float _1238 = fma(_1160, _1216, _1228);
        float _1240 = _1232 * _1232;
        float _1242 = _1236 * _1236;
        _1188 = _1238;
        _1166 = _1240;
        _1168 = _1242;
        _1182 = _1224;
        _1170 = _1226;
    }
    float _1244 = _1188;
    float _1246 = _1166;
    float _1248 = _1168;
    float _1250 = _1182;
    float _1252 = _1170;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1256 = _1244 + _1254;
    if (!_1158)
    {
        float _1258 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1120);
        _1190 = _1258;
    }
    float _1260 = _1190;
    float _1262 = fma(_1110, _1148, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1264 = fma(_1144, _996, _1132);
    float _1266 = fma(_1256, _1256, _1246);
    if (!_1158)
    {
        float _1268 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1118);
        _1192 = _1268;
    }
    float _1270 = _1192;
    float _1272 = _638 * _1260;
    float _1274 = _636 * _1260;
    float _1276 = _1266 + _1248;
    float _1278 = fma(_1112, _1154, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1280 = fma(_1262, _972, _1264);
    float _1282 = _640 * _1260;
    if (!_1158)
    {
        float _1284 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1122);
        _1194 = _1284;
    }
    float _1286 = _1194;
    float _1288 = fma(_940, _1270, _1272);
    float _1290 = sqrt(_1276);
    float _1292 = fma(_942, _1270, _1274);
    float _1294 = fma(_1278, _958, _1280);
    float _1296 = fma(_944, _1270, _1282);
    float _1298 = fma(_1046, _1286, _1288);
    float _1300 = fma(_1136, _1286, _1292);
    float _1302 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1294);
    float _1304 = fma(_1052, _1286, _1296);
    out.m_79.x = _1302;
    out.m_81.x = _1298;
    out.m_81.y = _1300;
    out.m_81.z = _1304;
    bool _1306 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1308 = isnan(_1290);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1314 = _1310 || _1312;
    if (!_1314)
    {
        _1172 = 1.0;
    }
    float _1316 = _1172;
    bool _1318 = !_1314;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1290);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1290 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1290);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1290 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = -_798;
    float _1384 = _672 + _1382;
    float _1386 = -_800;
    float _1388 = _674 + _1386;
    float _1390 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1392 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1394 = floor(_1390);
    float _1396 = floor(_1392);
    float _1398 = -_1394;
    float _1400 = _1390 + _1398;
    float _1402 = -_1396;
    float _1404 = _1392 + _1402;
    float2 _4913 = float2(_1400, _1404);
    float _1406 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4913, float2(0.0), isnan(_4913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4913, float2(0.0), isnan(_4913)), level(0.0)).x;
    float _1408 = -_796;
    float _1410 = _664 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1414 = _1250 + _1412;
    float _1416 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1420 = _1252 + _1418;
    float _1422 = fma(_1414, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1424 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1416);
    float _1426 = fma(_1420, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1428 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1424);
    float _1430 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1432 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1430);
    float _1436 = 1.0 / _1432;
    float _1438 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1434);
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1442 = _1440 + _1432;
    float _1444 = _1442 * _1436;
    float _1446 = _1444 * 0.5;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1450 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1448);
    float _1452 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1454 = 1.0 / _1450;
    float _1456 = _1410 + _1452;
    float _1458 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1460 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1458);
    float _1462 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1460);
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1466 = _1454 * _1464;
    float _1468 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1470 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1472 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1474 = fma(_1384, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1470);
    bool _1476 = _1466 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1478 = trunc(_1468);
    int _1480 = int(_1478);
    bool _1482 = !_1472;
    int _1484 = _1482 ? 0 : 1;
    float _1486 = fma(_1388, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1474);
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1490 = 2;
    float _1492 = _1426;
    float _1494 = _1488;
    float _1496 = _1456;
    if (!_1472)
    {
        _1490 = 1;
    }
    int _1498 = _1490;
    float _1500 = trunc(_1488);
    int _1502 = int(_1500);
    int _1504 = _1498;
    if (!_1476)
    {
        _1504 = _1484;
    }
    int _1506 = _1504;
    int _1508 = _1506 << 6;
    bool _1510 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(0.5);
    bool _1518 = _1514 || _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1522 = _1244 + _1520;
    int _1524 = _1508 + 48;
    uint _1527 = uint(int(uint(_1524) >> uint(2)));
    uint _1529 = uint(int(uint(int(_1527)) >> uint(2)));
    int _1531 = int(_1527) & 3;
    float _1533 = (*spvDescriptorSet0.vp_c15)._m0[int(_1529)][_1531];
    int _1535 = int(_1527) + 1;
    uint _1537 = uint(int(uint(_1535) >> uint(2)));
    int _1539 = _1535 & 3;
    float _1541 = (*spvDescriptorSet0.vp_c15)._m0[int(_1537)][_1539];
    int _1543 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1545 = _1480 + _1543;
    int _1547 = _1545 + 1;
    float _1549 = fma(_1522, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1551 = -_798;
    float _1553 = _1551 + _1422;
    bool _1555 = _1547 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1557 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1559 = _1502 + _1557;
    int _1561 = _1559 + 1;
    int _1563 = _1508 + 56;
    uint _1565 = uint(int(uint(_1563) >> uint(2)));
    uint _1567 = uint(int(uint(int(_1565)) >> uint(2)));
    int _1569 = int(_1565) & 3;
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[int(_1567)][_1569];
    int _1573 = int(_1565) + 1;
    uint _1575 = uint(int(uint(_1573) >> uint(2)));
    int _1577 = _1573 & 3;
    float _1579 = (*spvDescriptorSet0.vp_c15)._m0[int(_1575)][_1577];
    float _1581 = -_796;
    float _1583 = _1581 + _1549;
    int _1585 = _1547 | _1561;
    bool _1587 = _1585 < 0;
    bool _1589 = _1587 || _1555;
    int _1591 = _1508 + 64;
    uint _1593 = uint(int(uint(_1591) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c15)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c15)._m0[int(_1603)][_1605];
    float _1609 = -_800;
    float _1611 = _1609 + _1426;
    bool _1613 = _1561 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1615 = _1613 || _1589;
    int _1617 = _1508 + 72;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    uint _1621 = uint(int(uint(int(_1619)) >> uint(2)));
    int _1623 = int(_1619) & 3;
    float _1625 = (*spvDescriptorSet0.vp_c15)._m0[int(_1621)][_1623];
    int _1627 = int(_1619) + 1;
    uint _1629 = uint(int(uint(_1627) >> uint(2)));
    int _1631 = _1627 & 3;
    float _1633 = (*spvDescriptorSet0.vp_c15)._m0[int(_1629)][_1631];
    int _1635 = _1508 + 96;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    uint _1639 = uint(int(uint(int(_1637)) >> uint(2)));
    int _1641 = int(_1637) & 3;
    float _1643 = (*spvDescriptorSet0.vp_c15)._m0[int(_1639)][_1641];
    int _1645 = int(_1637) + 1;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    int _1649 = _1645 & 3;
    float _1651 = (*spvDescriptorSet0.vp_c15)._m0[int(_1647)][_1649];
    int _1653 = _1508 + 104;
    uint _1655 = uint(int(uint(_1653) >> uint(2)));
    uint _1657 = uint(int(uint(int(_1655)) >> uint(2)));
    int _1659 = int(_1655) & 3;
    float _1661 = (*spvDescriptorSet0.vp_c15)._m0[int(_1657)][_1659];
    int _1663 = int(_1655) + 1;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    int _1667 = _1663 & 3;
    float _1669 = (*spvDescriptorSet0.vp_c15)._m0[int(_1665)][_1667];
    float _1671 = _1583;
    float _1673 = _1553;
    float _1675 = _1611;
    float _1677 = as_type<float>(_1506);
    float _1679 = as_type<float>(_1547);
    if (!_1518)
    {
        float _1681 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1683 = _1410 + _1681;
        float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1687 = _1384 + _1685;
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1691 = -_674;
        float _1693 = _1691 + _1426;
        float _1695 = _1683 * _1683;
        float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1699 = _1388 + _1697;
        float _1701 = -_672;
        float _1703 = _1701 + _1422;
        float _1705 = fma(_1687, _1687, _1695);
        float _1707 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1709 = fma(_1699, _1699, _1705);
        float _1711 = sqrt(_1709);
        float _1713 = 1.0 / _904;
        float _1715 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1717 = precise::min(_1711, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1719 = _1717 * _1689;
        float _1721 = _1719 * _1713;
        float _1723 = -_664;
        float _1725 = _1723 + _1549;
        float _1727 = _1715 * _1721;
        float _1729 = _1693 * _1721;
        float _1731 = fma(_1725, _1727, _1410);
        float _1733 = fma(_1703, _1727, _1384);
        float _1735 = fma(_1715, _1729, _1388);
        _1671 = _1731;
        _1673 = _1733;
        _1174 = as_type<int>(_1689);
        _1675 = _1735;
        _1176 = as_type<int>(_1721);
    }
    float _1737 = _1671;
    float _1739 = _1673;
    int _1741 = _1174;
    float _1743 = _1675;
    int _1745 = _1176;
    float _1747 = _1456 * _1651;
    int _1749 = _1741;
    int _1751 = _1745;
    if (!_1615)
    {
        int _1753 = _1561 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1755 = _1753 + _1547;
        _1178 = _1755;
    }
    int _1757 = _1178;
    float _1759 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1761 = _1456 * _1541;
    float _1763 = fma(_1384, _1643, _1747);
    float _1765 = _1456 * _1607;
    if (!_1615)
    {
        int _1767 = _1757 << 2;
        _1749 = _1767;
    }
    int _1769 = _1749;
    float _1771 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1759);
    float _1773 = fma(_1388, _1661, _1763);
    float _1775 = fma(_1384, _1599, _1765);
    int _1777 = _1769;
    if (!_1615)
    {
        uint _1779 = uint(int(uint(_1757) >> uint(2)));
        _1751 = int(_1779);
    }
    int _1781 = _1751;
    int _1783 = _1508 + 80;
    uint _1785 = uint(int(uint(_1783) >> uint(2)));
    uint _1787 = uint(int(uint(int(_1785)) >> uint(2)));
    int _1789 = int(_1785) & 3;
    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[int(_1787)][_1789];
    int _1793 = int(_1785) + 1;
    uint _1795 = uint(int(uint(_1793) >> uint(2)));
    int _1797 = _1793 & 3;
    float _1799 = (*spvDescriptorSet0.vp_c15)._m0[int(_1795)][_1797];
    float _1801 = _1773 + _1669;
    if (!_1615)
    {
        int _1803 = 12 & _1769;
        _1777 = _1803;
    }
    int _1805 = _1777;
    float _1807 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1771);
    float _1809 = fma(_1384, _1533, _1761);
    if (!_1615)
    {
        int _1811 = _1781 << 4;
        int _1813 = _1811 + _1805;
        _1492 = as_type<float>(_1813);
    }
    float _1815 = _1492;
    float _1817 = 1.0 / _1801;
    int _1819 = _1508 + 88;
    uint _1821 = uint(int(uint(_1819) >> uint(2)));
    uint _1823 = uint(int(uint(int(_1821)) >> uint(2)));
    int _1825 = int(_1821) & 3;
    float _1827 = (*spvDescriptorSet0.vp_c15)._m0[int(_1823)][_1825];
    int _1829 = int(_1821) + 1;
    uint _1831 = uint(int(uint(_1829) >> uint(2)));
    int _1833 = _1829 & 3;
    float _1835 = (*spvDescriptorSet0.vp_c15)._m0[int(_1831)][_1833];
    float _1837 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1839 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1841 = fma(_1388, _1571, _1809);
    float _1843 = fma(_1388, _1625, _1775);
    float _1845 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1847 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1849 = _1841 + _1579;
    float _1851 = _1815;
    if (!_1615)
    {
        int _1853 = as_type<int>(_1815) + 400;
        uint _1855 = uint(int(uint(_1853) >> uint(2)));
        uint _1857 = uint(int(uint(int(_1855)) >> uint(2)));
        int _1859 = int(_1855) & 3;
        float _1861 = (*spvDescriptorSet0.vp_c15)._m0[int(_1857)][_1859];
        _1851 = _1861;
    }
    float _1863 = _1851;
    float _1865 = -_1845;
    float _1867 = fma(_1865, _1839, 1.0);
    float _1869 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1871 = _1737 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1873 = _1843 + _1633;
    float _1875 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1847);
    float _1877 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1869);
    float _1879 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1871);
    float _1881 = _1849 * _1817;
    float _1883 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1885 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1877);
    float _1887 = _1873 * _1817;
    float _1889 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1879);
    bool _1891 = _1881 >= 0.0;
    float _1893 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1897 = log2(_1867);
    bool _1899 = _1881 <= 1.0;
    bool _1901 = _1899 && _1891;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1907 = _1887 >= 0.0;
    bool _1909 = _1907 && _1901;
    float _1911 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1903);
    float _1913 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1915 = _1651;
    float _1917 = _1881;
    if (!_1615)
    {
        float _1919 = floor(_1468);
        _1915 = _1919;
    }
    float _1921 = _1915;
    bool _1923 = _1887 <= 1.0;
    bool _1925 = _1923 && _1909;
    float _1927 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1929 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1911);
    float _1931 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1905);
    float _1933 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1929);
    float _1935 = _1456 * _1799;
    float _1937 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1913);
    float _1939 = _1549;
    if (!_1615)
    {
        float _1941 = floor(_1488);
        _1939 = _1941;
    }
    float _1943 = _1939;
    float _1945 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1931);
    float _1947 = fma(_1384, _1791, _1935);
    float _1949 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1937);
    if (_1925)
    {
        float _1951 = float(_1506);
        _1677 = _1951;
    }
    float _1953 = _1677;
    float _1955 = _1897 * 0.693147182464599609375;
    float _1957 = fma(_1388, _1827, _1947);
    float _1959 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1949);
    float _1961 = 1.0 / _1933;
    float _1963 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1945);
    float _1965 = _1957 + _1835;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1969 = _1835;
    float _1971 = _1963;
    float _1973 = _1959;
    if (!_1615)
    {
        float _1975 = -_1921;
        float _1977 = _1468 + _1975;
        _1969 = _1977;
    }
    float _1979 = _1969;
    float _1981 = _1965 * _1817;
    float _1983 = _1935;
    if (_1925)
    {
        float _1985 = rint(_1953);
        float _1987 = precise::max(_1985, 0.0);
        uint _1989 = uint(_1987);
        uint _1991 = clamp(_1989, 0u, 65535u);
        _1983 = as_type<float>(_1991);
    }
    float _1993 = _1983;
    float _1995 = _1943;
    if (!_1615)
    {
        float _1997 = -_1943;
        float _1999 = _1488 + _1997;
        _1494 = _1999;
    }
    float _2001 = _1494;
    float _2003 = _1965;
    float _2005 = _1863;
    if (!_1615)
    {
        float _2007 = rint(_1863);
        float _2009 = precise::max(_2007, 0.0);
        uint _2011 = uint(_2009);
        uint _2013 = clamp(_2011, 0u, 65535u);
        _2003 = as_type<float>(_2013);
    }
    float _2015 = _2003;
    float _2017 = _1959 * _1961;
    float _2019 = _1963 * _1961;
    float _2021 = fma(_2017, 0.5, 0.5);
    float _2023 = fma(_2019, -0.5, 0.5);
    float _2025 = _1993;
    if (_1925)
    {
        float3 _5956 = float3(_1881, _1887, float(as_type<int>(_1993)));
        float3 _5960 = select(_5956, float3(0.0), isnan(_5956));
        float _2027 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5960.xy, uint(rint(_5960.z)), _1981, level(0.0));
        _2025 = _2027;
    }
    float _2029 = _2025;
    float3 _5970 = float3(_2021, _2023, _1967);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5979 = float3(_2021, _2023, _1967);
    float4 _2034 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5979, float3(0.0), isnan(_5979)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5979, float3(0.0), isnan(_5979)), level(0.0)).xyzw;
    float _2036 = _2034.x;
    float _2038 = _2034.y;
    float _2040 = _2034.z;
    float _2042 = _2034.w;
    float _2044 = _1979;
    if (!_1615)
    {
        float3 _6002 = float3(_1979, _2001, float(as_type<int>(_2015)));
        float3 _6004 = select(_6002, float3(0.0), isnan(_6002));
        float _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6004.xy, uint(rint(_6004.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6004.xy, uint(rint(_6004.z)), level(0.0)).x;
        _2044 = _2046;
    }
    float _2048 = _2044;
    if (_1615)
    {
        _1995 = 1.0;
    }
    float _2050 = _1995;
    float _2052 = _2050;
    if (!_1615)
    {
        int _2054 = _1757 << 4;
        int _2056 = _2054 + 2048;
        uint _2058 = uint(int(uint(_2056) >> uint(2)));
        uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
        int _2062 = int(_2058) & 3;
        float _2064 = (*spvDescriptorSet0.vp_c15)._m0[int(_2060)][_2062];
        int _2066 = int(_2058) + 1;
        uint _2068 = uint(int(uint(_2066) >> uint(2)));
        int _2070 = _2066 & 3;
        float _2072 = (*spvDescriptorSet0.vp_c15)._m0[int(_2068)][_2070];
        int _2074 = _2056 + 8;
        uint _2076 = uint(int(uint(_2074) >> uint(2)));
        uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
        int _2080 = int(_2076) & 3;
        float _2082 = (*spvDescriptorSet0.vp_c15)._m0[int(_2078)][_2080];
        int _2084 = int(_2076) + 1;
        uint _2086 = uint(int(uint(_2084) >> uint(2)));
        int _2088 = _2084 & 3;
        float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
        float _2092 = _1456 * _2072;
        float _2094 = fma(_1384, _2064, _2092);
        float _2096 = fma(_1388, _2082, _2094);
        float _2098 = _2096 + _2090;
        float _2100 = precise::clamp(_2098, 0.0, 1.0);
        float _2102 = -_2100;
        float _2104 = _2102 + _2048;
        float _2106 = fma(_2104, 500.0, 1.5);
        float _2108 = exp2(_2106);
        float _2110 = 0.0 + _2108;
        float _2112 = precise::clamp(_2110, 0.0, 1.0);
        _1496 = _2100;
        _2005 = _2072;
        _2052 = _2112;
    }
    float _2114 = _1496;
    float _2116 = _2005;
    float _2118 = _2052;
    float _2120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2122 = _1737 + _2120;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2126 = _1739 + _2124;
    float _2128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2130 = _1743 + _2128;
    float _2132 = _2122 * _2122;
    float _2134 = fma(_2126, _2126, _2132);
    float _2136 = fma(_2130, _2130, _2134);
    float _2138 = rsqrt(_2136);
    float _2140 = _2138 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2142 = _2126 * _2140;
    float _2144 = _2130 * _2140;
    float _2146 = _2142 * _2142;
    float _2148 = _2144 * _2144;
    float _2150 = _2146 + _2148;
    float _2152 = sqrt(_2150);
    bool _2154 = _2152 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2156 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2158 = _2152 + _2156;
    float _2160 = _2138;
    float _2162 = _2158;
    float _2164 = _2114;
    float _2166 = _2122;
    if (_2154)
    {
        float _2168 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2160 = _2168;
    }
    float _2170 = _2160;
    if (_2154)
    {
        float _2172 = rsqrt(_2150);
        _1917 = _2172;
    }
    float _2174 = _1917;
    float _2176 = _2174;
    if (_2154)
    {
        float _2178 = _2158 * _2170;
        _2162 = _2178;
    }
    float _2180 = _2162;
    if (_2154)
    {
        float _2182 = _2180 * 0.15915493667125701904296875;
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2130;
    if (_2154)
    {
        float _2188 = _2184 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        _2186 = _2190;
    }
    float _2192 = _2186;
    float _2194 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2196 = precise::max(0.0, _2194);
    float _2198 = _2116;
    float _2200 = _2196;
    float _2202 = _2194;
    if (_2154)
    {
        float _2204 = _2184 * 6.283185482025146484375;
        float _2206 = cos(_2204);
        _2198 = _2206;
    }
    float _2208 = _2198;
    float _2210 = -_2140;
    float _2212 = -_2196;
    float _2214 = fma(_2122, _2210, _2212);
    if (!_2154)
    {
        _2166 = _2146;
    }
    float _2216 = _2166;
    float _2218 = _2216;
    if (_2154)
    {
        float _2220 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2220;
    }
    float _2222 = _2200;
    float _2224 = _2192;
    float _2226 = _2222;
    if (_2154)
    {
        float _2228 = fma(_2192, _2222, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2224 = _2228;
    }
    float _2230 = _2224;
    float _2232 = _2230;
    if (!_2154)
    {
        _2226 = _2214;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    float _2238 = _2208;
    if (_2154)
    {
        float _2240 = _2208 + (-1.0);
        _2202 = _2240;
    }
    float _2242 = _2202;
    float _2244 = _2242;
    if (_2154)
    {
        float _2246 = _2174 * _2230;
        _1679 = _2246;
    }
    float _2248 = _1679;
    if (!_2154)
    {
        _2176 = _2142;
    }
    float _2250 = _2176;
    float _2252 = _2250;
    if (_2154)
    {
        float _2254 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2244 = _2254;
    }
    float _2256 = _2244;
    if (_2154)
    {
        float _2258 = _2142 * _2248;
        _2252 = _2258;
    }
    float _2260 = _2252;
    if (!_2154)
    {
        _2232 = _2144;
    }
    float _2262 = _2232;
    float _2264 = _2262;
    if (_2154)
    {
        float _2266 = _2144 * _2248;
        _2264 = _2266;
    }
    float _2268 = _2264;
    if (_2154)
    {
        float _2270 = fma(_2214, _2208, _2256);
        _2236 = _2270;
    }
    float _2272 = _2236;
    if (_2154)
    {
        float _2274 = _2260 * _2260;
        _2218 = _2274;
    }
    float _2276 = _2218;
    if (!_2154)
    {
        _2238 = _2148;
    }
    float _2278 = _2238;
    float _2280 = sqrt(_2136);
    float _2282 = _2278;
    if (_2154)
    {
        float _2284 = _2268 * _2268;
        _2282 = _2284;
    }
    float _2286 = _2282;
    float _2288 = fma(_2272, _2272, _2276);
    float _2290 = _2288 + _2286;
    float _2292 = rsqrt(_2290);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = -_2298;
    float _2302 = _2300 + 1.0;
    float _2304 = _2292 * _2260;
    float _2306 = abs(_2302);
    float _2308 = log2(_2306);
    float _2310 = _2292 * _2272;
    float _2312 = _2292 * _2268;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2316 = -_2314;
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2316);
    float _2320 = -_2312;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2318);
    float _2324 = fma(_2322, -0.5, 0.5);
    float _2326 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2328 = fma(_2322, 0.5, 0.5);
    float _2330 = _2310 + 1.0;
    float _2332 = exp2(_2326);
    float _2334 = fma(_2328, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2336 = fma(_2328, _2334, -0.212114393711090087890625);
    float _2338 = sqrt(_2324);
    float _2340 = fma(_2328, _2336, 1.570728778839111328125);
    float _2342 = -_2310;
    float _2344 = fma(_2332, _2330, _2342);
    float _2346 = fma(_2344, 0.5, 0.5);
    float _2348 = _2338 * 0.636619746685028076171875;
    float _2350 = -_2340;
    float _2352 = fma(_2348, _2350, 1.0);
    float2 _6480 = float2(_2352, _2346);
    float3 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6480, float2(0.0), isnan(_6480)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6480, float2(0.0), isnan(_6480)), level(0.0)).xyz;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = abs(_1466);
    float _2366 = log2(_2364);
    float _2368 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2370 = -_1406;
    float _2372 = _2370 + 1.0;
    out.m_83.x = _1739;
    out.m_83.y = _1737;
    out.m_83.z = _1743;
    float _2374 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2368);
    bool _2376 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2378 = isnan(_2280);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2384 = _2380 || _2382;
    bool _2386 = _1466 <= 8000.0;
    bool _2388 = isnan(_1466);
    bool _2390 = _2386 || _2388;
    bool _2392 = isnan(8000.0);
    bool _2394 = _2390 || _2392;
    float _2396 = float(_2394);
    float _2398 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2374);
    float _2400 = fma(_1927, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    float _2402 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _1959;
    out.gl_Position.y = _1963;
    out.gl_Position.z = _2400;
    out.gl_Position.w = _1933;
    float _2404 = exp2(_2402);
    if (!_2384)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2406 = _1971;
    float _2408 = _2406;
    float _2410 = _2406;
    if (!_2384)
    {
        _1973 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2412 = _1973;
    float _2414 = fma(_2404, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2416 = precise::clamp(_2414, 0.0, 1.0);
    float _2418 = fma(_2416, -2.0, 3.0);
    float _2420 = _2416 * _2416;
    float _2422 = _2420 * _2418;
    float _2424 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2426 = _2400 + _1933;
    float _2428 = -_2422;
    float _2430 = _2428 + 1.0;
    float _2432 = exp2(_2424);
    float _2434 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2422);
    float _2436 = _2426 * 0.5;
    float _2438 = _2396 * _2434;
    float _2440 = _2434;
    float _2442 = _2412;
    float _2444 = _2412;
    if (!_1925)
    {
        _2440 = 1.0;
    }
    float _2446 = _2440;
    out.m_85.z = _2436;
    out.m_85.w = _1933;
    float _2448 = _2446;
    if (_1925)
    {
        bool _2450 = _2029 >= _1981;
        bool _2452 = isnan(_2029);
        bool _2454 = _2450 || _2452;
        bool _2456 = isnan(_1981);
        bool _2458 = _2454 || _2456;
        float _2460 = float(_2458);
        _2448 = _2460;
    }
    float _2462 = _2448;
    float _2464 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2466 = _2372 * _2464;
    float _2468 = precise::clamp(_2466, 0.0, 1.0);
    float _2470 = _2462 * _2118;
    float _2472 = -_2432;
    float _2474 = _2472 + 1.0;
    float _2476 = -_2468;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2480 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2482 = -_2470;
    float _2484 = fma(_2482, _2478, 1.0);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2480 * _2031;
    float _2490 = -_2480;
    float _2492 = _2490 + 1.0;
    float _2494 = _2486 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2496 = _2042 * _2488;
    float _2498 = _2042 * _2492;
    out.m_87.x = _2494;
    float _2500 = _2362 * _2488;
    float _2502 = fma(_2358, _2496, _2036);
    float _2504 = fma(_2360, _2496, _2038);
    float _2506 = fma(_2042, _2500, _2040);
    float _2508 = _2500;
    if (!_2384)
    {
        _2508 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2510 = _2508;
    out.m_89.x = _2502;
    out.m_89.y = _2504;
    out.m_89.z = _2506;
    out.m_89.w = _2498;
    bool _2512 = !_2384;
    float _2514 = _2510;
    float _2516 = _2510;
    if (!_2512)
    {
        bool _2518 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2520 = isnan(_2280);
        bool _2522 = _2518 || _2520;
        bool _2524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2526 = _2522 || _2524;
        if (!_2526)
        {
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2530 = _2280 + _2528;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2544 = 1.0 / _2534;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2550 = _2530 * _2544;
            float _2552 = precise::clamp(_2550, 0.0, 1.0);
            float _2554 = fma(_2552, _2538, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2556 = fma(_2552, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2558 = fma(_2552, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2444 = _2556;
            _2410 = _2554;
            _2516 = _2558;
            _2560 = true;
        }
        else
        {
            bool _2562 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2564 = isnan(_2280);
            bool _2566 = _2562 || _2564;
            bool _2568 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2570 = _2566 || _2568;
            if (!_2570)
            {
                _2408 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2572 = _2408;
            _2410 = _2572;
            if (!_2570)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2574 = _2442;
            _2444 = _2574;
            if (!_2570)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2576 = _2514;
            bool _2578 = !_2570;
            _2516 = _2576;
            if (!_2578)
            {
                bool _2580 = _2280 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_2280);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _2280 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2606 = 1.0 / _2596;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2612 = _2592 * _2606;
                    float _2614 = precise::clamp(_2612, 0.0, 1.0);
                    float _2616 = fma(_2614, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2618 = fma(_2614, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2620 = fma(_2614, _2610, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2444 = _2618;
                    _2410 = _2616;
                    _2516 = _2620;
                    _2560 = true;
                }
                else
                {
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2410 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2560 = false;
    float _2622 = _2444;
    float _2624 = _2410;
    float _2626 = _2516;
    float _2628 = _2622 * 0.586610972881317138671875;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = 1.0;
    float _2632 = fma(_2624, 0.298911988735198974609375, _2628);
    out.m_91.x = 0.0;
    float _2634 = fma(_2626, 0.114477999508380889892578125, _2632);
    float _2636 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2638 = -_2634;
    float _2640 = _2638 + _2624;
    float _2642 = -_2634;
    float _2644 = _2642 + _2622;
    float _2646 = -_2634;
    float _2648 = _2646 + _2626;
    out.m_87.w = _2636;
    float _2650 = fma(_2640, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2652 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    float _2654 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2634);
    out.m_93.x = _2650;
    out.m_93.y = _2652;
    out.m_93.z = _2654;
    if (!_2630)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2656 = -_1737;
    float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2660 = -_1739;
    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2664 = -_1743;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2668 = _2658 * _2658;
    float _2670 = fma(_2662, _2662, _2668);
    float _2672 = fma(_2666, _2666, _2670);
    float _2674 = sqrt(_2672);
    float _2676 = rsqrt(_2672);
    float _2678 = -_2674;
    float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2682 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2684 = precise::clamp(_2682, 0.0, 1.0);
    float _2686 = _2662 * _2676;
    float _2688 = _2658 * _2676;
    float _2690 = abs(_2684);
    float _2692 = log2(_2690);
    float _2694 = _2666 * _2676;
    float _2696 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2698 = _1300 * _2688;
    float _2700 = -_2688;
    float _2702 = -_2696;
    float _2704 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2702);
    float _2706 = fma(_1298, _2686, _2698);
    float _2708 = -_2694;
    float _2710 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2704);
    float _2712 = fma(_1304, _2694, _2706);
    float _2714 = precise::clamp(_2712, 0.0, 1.0);
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2718 = _2710 + _2716;
    float _2720 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2722 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2724 = precise::clamp(_2722, 0.0, 1.0);
    float _2726 = exp2(_2720);
    float _2728 = _2726 * _2724;
    float _2730 = _2714 * _2728;
    float _2732 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2734 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2736 = _2730 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2732;
    out.m_91.y = _2734;
    out.m_91.z = _2736;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

