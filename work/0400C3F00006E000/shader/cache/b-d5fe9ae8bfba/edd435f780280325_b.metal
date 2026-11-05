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
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_73 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_71 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2406 = false;
    bool _566 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_56.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_59.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2639 = as_type<float>(_126);
        out.gl_Position.z = _2639;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_61.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_110);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_162);
        out.gl_Position.z = _2708;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_63.x;
    float _166 = in.m_63.y;
    float _168 = in.m_63.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _208;
    if (!_190)
    {
        float _192 = in.m_65.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_110);
        float _214 = 1.0 / _212;
        float _216 = _144 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _232 = 1.0 / _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _242 = 1.0 / _226;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _252 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _254 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = 1.0 / _230;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _258;
    float _262 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _266 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _268 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_218);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _282 = _218 + _280;
    float _284 = 1.0 / _236;
    float _286 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _218 + _288;
    out.m_67.x = _262;
    out.m_67.y = _264;
    out.m_67.z = _266;
    float _292 = -_278;
    float _294 = _292 + 1.0;
    float _296 = _290 * _232;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _218 + _298;
    out.m_69.x = _252;
    out.m_69.y = _254;
    out.m_69.z = _286;
    float _302 = 1.0 / _260;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _218 + _304;
    float _308 = _300 * _242;
    bool _310 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _312 = isnan(_218);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = _282 * _256;
    bool _324 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_218);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = _306 * _284;
    bool _338 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_218);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = _218 + _350;
    bool _354 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_218);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_320;
    float _368 = _366 + 1.0;
    float _370 = _348 * _294;
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = _364 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _334 * _378;
    bool _392 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_218);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _404;
    float _408 = -_334;
    float _410 = _408 + 1.0;
    float _412 = fma(_384, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = fma(_388, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _416 = _402 * _374;
    float _418 = _352 * _302;
    float _420 = fma(_406, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = _278 * _410;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _412 * _416;
    float _438 = -_402;
    float _440 = _438 + 1.0;
    float _442 = _414 * _416;
    float _444 = _420 * _416;
    float _446 = fma(_426, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_430, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _464 = fma(_454, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_446, _370, _456);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_462, _322, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = fma(_464, _422, _466);
    float _486 = fma(_470, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _492 = fma(_448, _370, _472);
    float _494 = fma(_450, _370, _458);
    float _496 = fma(_476, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_482, _322, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_490, _322, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _504 = fma(_486, _422, _492);
    float _506 = fma(_496, _422, _494);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_478, _390, _484);
    float _522 = fma(_510, _418, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_514, _418, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _418, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_498, _390, _504);
    float _530 = fma(_500, _390, _506);
    float _532 = fma(_522, _380, _520);
    float _534 = fma(_524, _380, _528);
    float _536 = fma(_526, _380, _530);
    float _538 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_502;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _564;
    if (!_544)
    {
        float _548 = in.m_65.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[14].y, _144);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        float _568 = float(_110);
        float _570 = 1.0 / _568;
        float _572 = _144 * _570;
        _564 = _572;
    }
    _566 = false;
    float _574 = _564;
    float _576 = in.m_56.x;
    float _578 = in.m_56.y;
    float _580 = in.m_56.z;
    float _582 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _584 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _586 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _582);
    float _590 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _592 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _586);
    float _594 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _596 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _598 = in.m_71.x;
    float _600 = in.m_71.y;
    float _602 = in.m_71.z;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _606 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _608 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _610 = _604 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _614 = _606 + _612;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _618 = _608 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _610 + _620;
    float _624 = _614 * _614;
    float _626 = fma(_618, _618, _624);
    float _628 = fma(_622, _622, _626);
    float _630 = rsqrt(_628);
    float _632 = _538 * _598;
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _636 = _634 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _638 = _636 * _630;
    float _640 = _618 * _638;
    float _642 = _622 * _638;
    float _644 = -_640;
    float _646 = _608 + _644;
    float _648 = -_642;
    float _650 = _610 + _648;
    float _652 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _654 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _656 = floor(_652);
    float _658 = floor(_654);
    float _660 = -_656;
    float _662 = _652 + _660;
    float _664 = -_658;
    float _666 = _654 + _664;
    float2 _3592 = float2(_662, _666);
    float _668 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3592, float2(0.0), isnan(_3592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3592, float2(0.0), isnan(_3592)), level(0.0)).x;
    float _670 = _186 * _186;
    float _672 = _614 * _638;
    float _674 = -_640;
    float _676 = _618 + _674;
    float _678 = fma(_184, _184, _670);
    float _680 = -_672;
    float _682 = _606 + _680;
    float _684 = -_672;
    float _686 = _614 + _684;
    float _688 = fma(_188, _188, _678);
    float _690 = _682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _692 = _686 * _686;
    float _694 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[11].x, _690);
    float _696 = rsqrt(_688);
    float _698 = _682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _700 = fma(_676, _676, _692);
    float _702 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[11].z, _694);
    float _704 = -_642;
    float _706 = _622 + _704;
    float _708 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[10].x, _698);
    float _710 = _540 * _600;
    float _712 = _702 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _714 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[10].z, _708);
    float _716 = _542 * _602;
    float _718 = 1.0 / _712;
    float _720 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _722 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _726 = _186 * _696;
    float _728 = _184 * _696;
    float _730 = _188 * _696;
    float _732 = _720 + _712;
    float _734 = _726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _736 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[8].y, _734);
    float _738 = _732 * _718;
    float _740 = _738 * 0.5;
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[10].y, _736);
    float _744 = abs(_742);
    bool _746 = _744 > 0.99989998340606689453125;
    float _748 = _702;
    float _750 = _696;
    float _752 = _742;
    int _754 = 2;
    if (_746)
    {
        _748 = 0.001000000047497451305389404296875;
    }
    float _756 = _748;
    if (!_746)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _758 = _546;
    float _760 = _758;
    if (!_746)
    {
        _750 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _762 = _750;
    float _764 = _762;
    if (_746)
    {
        float _766 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _760 = _766;
    }
    float _768 = _760;
    if (!_746)
    {
        _752 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _770 = _752;
    float _772 = _770;
    if (_746)
    {
        float _774 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _764 = _774;
    }
    float _776 = _764;
    if (_746)
    {
        float _778 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _772 = _778;
    }
    float _780 = _772;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _784 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
    float _786 = -_768;
    float _788 = _730 * _786;
    float _790 = -_776;
    float _792 = _726 * _790;
    float _794 = fma(_706, _706, _700);
    float _796 = 1.0 / _784;
    float _798 = -_776;
    float _800 = -_788;
    float _802 = fma(_728, _798, _800);
    float _804 = -_780;
    float _806 = -_792;
    float _808 = fma(_730, _804, _806);
    float _810 = -_780;
    float _812 = _728 * _810;
    float _814 = _802 * _802;
    float _816 = -_768;
    float _818 = -_812;
    float _820 = fma(_726, _816, _818);
    float _822 = fma(_808, _808, _814);
    float _824 = sqrt(_794);
    float _826 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _828 = fma(_820, _820, _822);
    float _830 = in.m_73.x;
    float _832 = in.m_73.y;
    float _834 = in.m_73.z;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _838 = _796 * _836;
    float _840 = _682 + _826;
    float _842 = rsqrt(_828);
    bool _844 = _838 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _846 = _840 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _848 = _838 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _850 = !_844;
    int _852 = _850 ? 0 : 1;
    float _854 = _630 * _824;
    float _856 = _722 * _854;
    float _858 = _724 * _854;
    float _860 = _634 * _854;
    float _862 = _840;
    if (!_844)
    {
        _754 = 1;
    }
    int _864 = _754;
    float _866 = _808 * _842;
    int _868 = _864;
    if (!_848)
    {
        _868 = _852;
    }
    int _870 = _868;
    float _872 = _802 * _842;
    float _874 = _820 * _842;
    float _876 = _840 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _878 = _870 << 6;
    float _880 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[126].x, _846);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _832);
    float _884 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[127].x, _876);
    int _886 = _878 + 96;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[126].z, _880);
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _909 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[127].z, _884);
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _913 = _856 * _882;
    float _915 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _917 = _909 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _919 = _878 + 104;
    uint _921 = uint(int(uint(_919) >> uint(2)));
    uint _923 = uint(int(uint(int(_921)) >> uint(2)));
    int _925 = int(_921) & 3;
    float _927 = (*spvDescriptorSet0.vp_c15)._m0[int(_923)][_925];
    int _929 = int(_921) + 1;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    int _933 = _929 & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    float _937 = _858 * _907;
    float _939 = _860 * _911;
    float _941 = _728 * _872;
    float _943 = _913 * _730;
    float _945 = trunc(_915);
    int _947 = int(_945);
    float _949 = _726 * _874;
    float _951 = -_941;
    float _953 = fma(_726, _866, _951);
    int _955 = _878 + 48;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    float _973 = _913 * _728;
    float _975 = fma(_939, _874, _943);
    float _977 = -_949;
    float _979 = fma(_730, _872, _977);
    float _981 = trunc(_917);
    int _983 = int(_981);
    float _985 = fma(_939, _866, _973);
    float _987 = fma(_937, _953, _975);
    int _989 = _878 + 64;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_937, _979, _985);
    float _1009 = _610 + _987;
    int _1011 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1013 = _947 + _1011;
    int _1015 = _1013 + 1;
    float _1017 = _608 + _1007;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1009 + _1019;
    int _1023 = _878 + 56;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    bool _1041 = _1015 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1045 = _1017 + _1043;
    float _1047 = _1021 * _1021;
    int _1049 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1051 = _983 + _1049;
    int _1053 = _1051 + 1;
    float _1055 = fma(_1045, _1045, _1047);
    int _1057 = _878 + 72;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
    int _1063 = int(_1059) & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    int _1067 = int(_1059) + 1;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    int _1071 = _1067 & 3;
    float _1073 = (*spvDescriptorSet0.vp_c15)._m0[int(_1069)][_1071];
    int _1075 = _1015 | _1053;
    bool _1077 = _1075 < 0;
    bool _1079 = _1077 || _1041;
    float _1081 = sqrt(_1055);
    int _1083 = _878 + 80;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c15)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c15)._m0[int(_1095)][_1097];
    float _1101 = _840 * _903;
    bool _1103 = _1053 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1105 = _1103 || _1079;
    float _1107 = _913 * _726;
    float _1109 = _730 * _866;
    float _1111 = fma(_646, _895, _1101);
    bool _1113 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_939, _872, _1107);
    float _1125 = -_1109;
    float _1127 = fma(_728, _874, _1125);
    float _1129 = fma(_650, _927, _1111);
    float _1131 = fma(_937, _1127, _1123);
    float _1133 = _1129 + _935;
    bool _1135 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _840 * _971;
    int _1139 = as_type<int>(_939);
    int _1141 = _1053;
    int _1143 = _1015;
    float _1145 = _1017;
    float _1147 = _1009;
    float _1149 = _1055;
    float _1151 = _915;
    float _1153 = as_type<float>(_870);
    if (!_1105)
    {
        int _1155 = _1053 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1157 = _1155 + _1015;
        _1139 = _1157;
    }
    int _1159 = _1139;
    float _1161 = 1.0 / _1133;
    float _1163 = fma(_646, _963, _1137);
    float _1165 = as_type<float>(_1159);
    if (!_1105)
    {
        int _1167 = _1159 << 2;
        _1141 = _1167;
    }
    int _1169 = _1141;
    float _1171 = _840 * _1005;
    int _1173 = _1169;
    if (!_1105)
    {
        uint _1175 = uint(int(uint(_1159) >> uint(2)));
        _1143 = int(_1175);
    }
    int _1177 = _1143;
    float _1179 = _963;
    if (!_1105)
    {
        float _1181 = floor(_915);
        _1179 = _1181;
    }
    float _1183 = _1179;
    if (!_1105)
    {
        int _1185 = 12 & _1169;
        _1173 = _1185;
    }
    int _1187 = _1173;
    float _1189 = fma(_646, _997, _1171);
    float _1191 = _606 + _1131;
    float _1193 = fma(_650, _1031, _1163);
    int _1195 = as_type<int>(_1031);
    float _1197 = _1039;
    if (!_1105)
    {
        int _1199 = _1177 << 4;
        int _1201 = _1199 + _1187;
        _1195 = _1201;
    }
    int _1203 = _1195;
    float _1205 = fma(_650, _1065, _1189);
    float _1207 = _1193 + _1039;
    float _1209 = _1073;
    if (!_1135)
    {
        _1197 = _1191;
    }
    float _1211 = _1197;
    bool _1213 = !_1135;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1081 + _1219;
        float _1223 = rsqrt(_1055);
        float _1225 = _1221 * _1217;
        float _1227 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1225 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = sin(_1235);
        float _1239 = _1233 + (-1.0);
        float _1241 = fma(_1237, _1227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1243 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1245 = _1223 * _1241;
        float _1247 = fma(_1191, _1233, _1243);
        float _1249 = fma(_1045, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1251 = fma(_1021, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1215 = _1247;
        _1145 = _1249;
        _1147 = _1251;
        _1149 = _1223;
    }
    float _1253 = _1215;
    float _1255 = _1145;
    float _1257 = _1147;
    float _1259 = _1149;
    float _1261 = -_672;
    float _1263 = _1261 + _1253;
    float _1265 = -_640;
    float _1267 = _1265 + _1255;
    float _1269 = -_642;
    float _1271 = _1269 + _1257;
    float _1273 = _1205 + _1073;
    float _1275 = _1263;
    float _1277 = _1267;
    float _1279 = _1271;
    if (!_1121)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1283 = _682 + _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1287 = _646 + _1285;
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1291 = -_610;
        float _1293 = _1291 + _1257;
        float _1295 = _1283 * _1283;
        float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1299 = _650 + _1297;
        float _1301 = -_608;
        float _1303 = _1301 + _1255;
        float _1305 = fma(_1287, _1287, _1295);
        float _1307 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1309 = fma(_1299, _1299, _1305);
        float _1311 = sqrt(_1309);
        float _1313 = 1.0 / _854;
        float _1315 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1289;
        float _1321 = _1319 * _1313;
        float _1323 = -_606;
        float _1325 = _1323 + _1253;
        float _1327 = _1315 * _1321;
        float _1329 = _1293 * _1321;
        float _1331 = fma(_1325, _1327, _682);
        float _1333 = fma(_1303, _1327, _646);
        float _1335 = fma(_1315, _1329, _650);
        _1275 = _1331;
        _1277 = _1333;
        _1279 = _1335;
        _1209 = _1321;
    }
    float _1337 = _1275;
    float _1339 = _1277;
    float _1341 = _1279;
    float _1343 = _1209;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1347 = _878 + 88;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    float _1365 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1367 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1369 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1345);
    float _1371 = _1207 * _1161;
    float _1373 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1365);
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1377 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = _1259;
    if (!_1105)
    {
        int _1381 = _1203 + 400;
        uint _1383 = uint(int(uint(_1381) >> uint(2)));
        uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
        int _1387 = int(_1383) & 3;
        float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1373);
    float _1395 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1375);
    float _1397 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1401 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1405 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1409 = _1371 >= 0.0;
    float _1411 = _1273 * _1161;
    float _1413 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1405);
    float _1415 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1407);
    bool _1417 = _1371 <= 1.0;
    bool _1419 = _1417 && _1409;
    float _1421 = _1343;
    if (!_1105)
    {
        float _1423 = floor(_917);
        _1421 = _1423;
    }
    float _1425 = _1421;
    float _1427 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1429 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1415);
    bool _1431 = _1411 >= 0.0;
    bool _1433 = _1431 && _1419;
    float _1435 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1437 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1439 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1429);
    float _1441 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1443 = _1411 <= 1.0;
    bool _1445 = _1443 && _1433;
    float _1447 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1435);
    float _1449 = 1.0 / _1439;
    float _1451 = -_1441;
    float _1453 = fma(_1451, _1437, 1.0);
    float _1455 = _840 * _1099;
    float _1457 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1459 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1447);
    float _1461 = _1437;
    float _1463 = _1447;
    if (!_1105)
    {
        float _1465 = -_1183;
        float _1467 = _915 + _1465;
        _1151 = _1467;
    }
    float _1469 = _1151;
    float _1471 = fma(_646, _1091, _1455);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1457);
    float _1475 = log2(_1453);
    float _1477 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1459);
    if (!_1105)
    {
        float _1479 = -_1425;
        float _1481 = _917 + _1479;
        _1461 = _1481;
    }
    float _1483 = _1461;
    if (_1445)
    {
        float _1485 = float(_870);
        _1153 = _1485;
    }
    float _1487 = _1153;
    float _1489 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1473);
    float _1491 = _1477 * _1449;
    float _1493 = _1455;
    if (_1445)
    {
        float _1495 = rint(_1487);
        float _1497 = precise::max(_1495, 0.0);
        uint _1499 = uint(_1497);
        uint _1501 = clamp(_1499, 0u, 65535u);
        _1493 = as_type<float>(_1501);
    }
    float _1503 = _1493;
    float _1505 = fma(_650, _1355, _1471);
    float _1507 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1489);
    float _1509 = fma(_1491, -0.5, 0.5);
    float _1511 = _1505 + _1363;
    float _1513 = _1475 * 0.693147182464599609375;
    float _1515 = _1491;
    float _1517 = _1391;
    if (!_1105)
    {
        float _1519 = rint(_1391);
        float _1521 = precise::max(_1519, 0.0);
        uint _1523 = uint(_1521);
        uint _1525 = clamp(_1523, 0u, 65535u);
        _1515 = as_type<float>(_1525);
    }
    float _1527 = _1515;
    float _1529 = _1507 * _1449;
    float _1531 = _1511 * _1161;
    float _1533 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1535 = fma(_1529, 0.5, 0.5);
    float _1537 = _1449;
    if (_1445)
    {
        float3 _5030 = float3(_1371, _1411, float(as_type<int>(_1503)));
        float3 _5034 = select(_5030, float3(0.0), isnan(_5030));
        float _1539 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5034.xy, uint(rint(_5034.z)), _1531, level(0.0));
        _1537 = _1539;
    }
    float _1541 = _1537;
    float3 _5044 = float3(_1535, _1509, _1533);
    float _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5044, float3(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5044, float3(0.0), isnan(_5044)), level(0.0)).x;
    float3 _5053 = float3(_1535, _1509, _1533);
    float4 _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5053, float3(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5053, float3(0.0), isnan(_5053)), level(0.0)).xyzw;
    float _1548 = _1546.x;
    float _1550 = _1546.y;
    float _1552 = _1546.z;
    float _1554 = _1546.w;
    float _1556 = _1483;
    if (!_1105)
    {
        float3 _5076 = float3(_1469, _1483, float(as_type<int>(_1527)));
        float3 _5078 = select(_5076, float3(0.0), isnan(_5076));
        float _1558 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5078.xy, uint(rint(_5078.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5078.xy, uint(rint(_5078.z)), level(0.0)).x;
        _1556 = _1558;
    }
    float _1560 = _1556;
    if (_1105)
    {
        _1463 = 1.0;
    }
    float _1562 = _1463;
    float _1564 = _1562;
    if (!_1105)
    {
        int _1566 = _1159 << 4;
        int _1568 = _1566 + 2048;
        uint _1570 = uint(int(uint(_1568) >> uint(2)));
        uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
        int _1574 = int(_1570) & 3;
        float _1576 = (*spvDescriptorSet0.vp_c15)._m0[int(_1572)][_1574];
        int _1578 = int(_1570) + 1;
        uint _1580 = uint(int(uint(_1578) >> uint(2)));
        int _1582 = _1578 & 3;
        float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
        int _1586 = _1568 + 8;
        uint _1588 = uint(int(uint(_1586) >> uint(2)));
        uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
        int _1592 = int(_1588) & 3;
        float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
        int _1596 = int(_1588) + 1;
        uint _1598 = uint(int(uint(_1596) >> uint(2)));
        int _1600 = _1596 & 3;
        float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
        float _1604 = _840 * _1584;
        float _1606 = fma(_646, _1576, _1604);
        float _1608 = fma(_650, _1594, _1606);
        float _1610 = _1608 + _1602;
        float _1612 = precise::clamp(_1610, 0.0, 1.0);
        float _1614 = -_1612;
        float _1616 = _1614 + _1560;
        float _1618 = fma(_1616, 500.0, 1.5);
        float _1620 = exp2(_1618);
        float _1622 = 0.0 + _1620;
        float _1624 = precise::clamp(_1622, 0.0, 1.0);
        _862 = _1604;
        _1165 = as_type<float>(_1568);
        _1564 = _1624;
    }
    float _1626 = _862;
    float _1628 = _1165;
    float _1630 = _1564;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1634 = _1337 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1638 = _1339 + _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1642 = _1341 + _1640;
    float _1644 = _1634 * _1634;
    float _1646 = fma(_1638, _1638, _1644);
    float _1648 = fma(_1642, _1642, _1646);
    float _1650 = rsqrt(_1648);
    float _1652 = sqrt(_1648);
    float _1654 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1656 = _1638 * _1654;
    float _1658 = _1642 * _1654;
    float _1660 = _1656 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 + _1662;
    float _1666 = sqrt(_1664);
    bool _1668 = _1666 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = _1666 + _1670;
    float _1674 = _1626;
    float _1676 = _1664;
    float _1678 = _1672;
    float _1680 = _1656;
    float _1682 = _1658;
    float _1684 = _1660;
    float _1686 = _1662;
    if (_1668)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1688;
    }
    float _1690 = _1674;
    if (_1668)
    {
        float _1692 = rsqrt(_1664);
        _1676 = _1692;
    }
    float _1694 = _1676;
    if (_1668)
    {
        float _1696 = _1672 * _1690;
        _1678 = _1696;
    }
    float _1698 = _1678;
    if (_1668)
    {
        float _1700 = _1698 * 0.15915493667125701904296875;
        _1517 = _1700;
    }
    float _1702 = _1517;
    float _1704 = _650;
    if (_1668)
    {
        float _1706 = _1702 * 6.283185482025146484375;
        float _1708 = sin(_1706);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1714 = precise::max(0.0, _1712);
    float _1716 = _1628;
    float _1718 = _1714;
    float _1720 = _1712;
    if (_1668)
    {
        float _1722 = _1702 * 6.283185482025146484375;
        float _1724 = cos(_1722);
        _1716 = _1724;
    }
    float _1726 = _1716;
    float _1728 = -_1654;
    float _1730 = -_1714;
    float _1732 = fma(_1634, _1728, _1730);
    float _1734 = _1732;
    if (_1668)
    {
        float _1736 = _1732 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1718 = _1736;
    }
    float _1738 = _1718;
    float _1740 = _1738;
    float _1742 = _1710;
    if (_1668)
    {
        float _1744 = fma(_1710, _1738, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1740 = _1744;
    }
    float _1746 = _1740;
    if (_1668)
    {
        float _1748 = _1726 + (-1.0);
        _1720 = _1748;
    }
    float _1750 = _1720;
    float _1752 = _1750;
    if (_1668)
    {
        float _1754 = _1694 * _1746;
        _1742 = _1754;
    }
    float _1756 = _1742;
    if (_1668)
    {
        float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _1758;
    }
    float _1760 = _1752;
    if (_1668)
    {
        float _1762 = _1656 * _1756;
        _1680 = _1762;
    }
    float _1764 = _1680;
    if (_1668)
    {
        float _1766 = _1658 * _1756;
        _1682 = _1766;
    }
    float _1768 = _1682;
    if (_1668)
    {
        float _1770 = fma(_1732, _1726, _1760);
        _1734 = _1770;
    }
    float _1772 = _1734;
    if (_1668)
    {
        float _1774 = _1764 * _1764;
        _1684 = _1774;
    }
    float _1776 = _1684;
    if (_1668)
    {
        float _1778 = _1768 * _1768;
        _1686 = _1778;
    }
    float _1780 = _1686;
    float _1782 = fma(_1772, _1772, _1776);
    float _1784 = _1782 + _1780;
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1788 = fma(_1652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1786);
    float _1790 = precise::clamp(_1788, 0.0, 1.0);
    float _1792 = -_1790;
    float _1794 = _1792 + 1.0;
    float _1796 = rsqrt(_1784);
    float _1798 = abs(_1794);
    float _1800 = log2(_1798);
    float _1802 = _1796 * _1764;
    float _1804 = _1796 * _1772;
    float _1806 = _1796 * _1768;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = _1804 + 1.0;
    float _1812 = -_1808;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1812);
    float _1816 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1818 = -_1806;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1814);
    float _1822 = exp2(_1816);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = fma(_1820, 0.5, 0.5);
    float _1828 = fma(_1826, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = sqrt(_1824);
    float _1832 = fma(_1826, _1828, -0.212114393711090087890625);
    float _1834 = fma(_1826, _1832, 1.570728778839111328125);
    float _1836 = -_1804;
    float _1838 = fma(_1822, _1810, _1836);
    float _1840 = fma(_1838, 0.5, 0.5);
    float _1842 = _1830 * 0.636619746685028076171875;
    float _1844 = -_1834;
    float _1846 = fma(_1842, _1844, 1.0);
    float2 _5521 = float2(_1846, _1840);
    float3 _1850 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5521, float2(0.0), isnan(_5521)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5521, float2(0.0), isnan(_5521)), level(0.0)).xyz;
    float _1852 = _1850.x;
    float _1854 = _1850.y;
    float _1856 = _1850.z;
    float _1858 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1860 = -_668;
    float _1862 = _1860 + 1.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1876 = 1.0 / _1866;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1882;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1890 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1892 = isnan(_574);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    out.m_75.x = _1339;
    out.m_75.y = _1337;
    out.m_75.z = _1341;
    float _1902 = 1.0 / _1870;
    bool _1904 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1906 = isnan(_574);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    bool _1916 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1918 = isnan(_574);
    bool _1920 = _1916 || _1918;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1924 = _1920 || _1922;
    float _1926 = float(_1924);
    float _1928 = 1.0 / _1874;
    float _1930 = _1884 * _1876;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1932;
    float _1936 = -_1900;
    float _1938 = _1936 + 1.0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1950 = _1948 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1952 = 1.0 / _1880;
    float _1954 = _1888 * _1902;
    bool _1956 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1958 = isnan(_574);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1968;
    float _1972 = -_1926;
    float _1974 = _1972 + 1.0;
    bool _1976 = _832 != 0.0;
    bool _1978 = isnan(_832);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.0);
    bool _1984 = _1980 || _1982;
    float _1986 = _1966 * _1938;
    float _1988 = _1934 * _1928;
    bool _1990 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1992 = isnan(_574);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1966;
    float _2004 = _2002 + 1.0;
    float _2006 = 1.0 / _1950;
    bool _2008 = _830 == 0.0;
    bool _2010 = !_1984;
    bool _2012 = _2008 && _2010;
    float _2014 = _2000 * _2004;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2020 = _1942 * _1952;
    bool _2022 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2024 = isnan(_574);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    float _2034 = -_2000;
    float _2036 = _2034 + 1.0;
    float _2038 = 1.0 / _1946;
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2042 = _574 + _2040;
    bool _2044 = _834 == 0.0;
    bool _2046 = _2044 && _2012;
    float _2048 = _2032 * _2036;
    float _2050 = -_2032;
    float _2052 = _2050 + 1.0;
    float _2054 = 1.0 / _2018;
    float _2056 = _1970 * _2006;
    float _2058 = _1914 * _2052;
    float _2060 = -_1914;
    float _2062 = _2060 + 1.0;
    float _2064 = fma(_1930, _2042, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2066 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2068 = isnan(_574);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = _1926 * _2062;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2082 = _2080 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2084;
    float _2088 = _2076 * _1974;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2092 = _574 + _2090;
    float _2094 = _2082 * _2038;
    float _2096 = -_2076;
    float _2098 = _2096 + 1.0;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2102 = _574 + _2100;
    float _2104 = fma(_1954, _2092, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2106 = _2086 * _2054;
    float _2108 = _2064 * _2088;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2112 = _574 + _2110;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2116 = _574 + _2114;
    float _2118 = fma(_2020, _2102, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2120 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2108);
    float _2122 = fma(_1988, _2112, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2124 = fma(_2056, _2116, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2126 = exp2(_1858);
    float _2128 = fma(_2104, _2078, _2120);
    float _2130 = in.m_77.x;
    float _2132 = in.m_77.y;
    float _2134 = in.m_77.z;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2138 = _574 + _2136;
    float _2140 = fma(_2122, _2058, _2128);
    bool _2142 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2144 = isnan(_574);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2150 = _2146 || _2148;
    float _2152 = float(_2150);
    float _2154 = fma(_2094, _2138, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2156 = abs(_838);
    float _2158 = log2(_2156);
    float _2160 = fma(_2118, _2048, _2140);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2164 = _574 + _2162;
    float _2166 = -_2152;
    float _2168 = _2166 + 1.0;
    float _2170 = fma(_2124, _2014, _2160);
    float _2172 = fma(_2106, _2164, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2174 = _1900 * _2168;
    float _2176 = -_2126;
    float _2178 = _2176 + 1.0;
    bool _2180 = _838 <= 8000.0;
    bool _2182 = isnan(_838);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(8000.0);
    bool _2188 = _2184 || _2186;
    float _2190 = float(_2188);
    float _2192 = fma(_2154, _1986, _2170);
    float _2194 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2196 = fma(_2172, _2174, _2192);
    float _2198 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2200 = _2130;
    float _2202 = _2134;
    float _2204 = _2132;
    if (!_2046)
    {
        float _2206 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2200 = _2206;
    }
    float _2208 = _2200;
    if (!_2046)
    {
        float _2210 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2134);
        _2202 = _2210;
    }
    float _2212 = _2202;
    if (!_2046)
    {
        float _2214 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2204 = _2214;
    }
    float _2216 = _2204;
    float _2218 = exp2(_2198);
    float _2220 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2222 = _726 * _2216;
    float _2224 = _728 * _2216;
    float _2226 = _730 * _2216;
    float _2228 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2220);
    float _2230 = fma(_872, _2208, _2222);
    float _2232 = fma(_866, _2208, _2224);
    float _2234 = fma(_874, _2208, _2226);
    float _2236 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2228);
    float _2238 = fma(_1127, _2212, _2230);
    float _2240 = fma(_979, _2212, _2232);
    float _2242 = fma(_953, _2212, _2234);
    float _2244 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2236);
    float _2246 = fma(_2218, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2196);
    out.m_79.x = _2240;
    out.m_79.y = _2238;
    out.m_79.z = _2242;
    float _2252 = fma(_2248, -2.0, 3.0);
    float _2254 = _2248 * _2248;
    out.gl_Position.x = _1507;
    out.gl_Position.y = _1477;
    out.gl_Position.z = _2244;
    out.gl_Position.w = _1439;
    float _2256 = _2254 * _2252;
    out.m_81.x = _2250;
    float _2258 = -_2256;
    float _2260 = _2258 + 1.0;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2256);
    float _2264 = _2244 + _1439;
    float _2266 = _2190 * _2262;
    float _2268 = _2264 * 0.5;
    float _2270 = _2264;
    float _2272 = _2260;
    if (!_1445)
    {
        _2270 = 1.0;
    }
    float _2274 = _2270;
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2278 = _2274;
    if (_1445)
    {
        bool _2280 = _1541 >= _1531;
        bool _2282 = isnan(_1541);
        bool _2284 = _2280 || _2282;
        bool _2286 = isnan(_1531);
        bool _2288 = _2284 || _2286;
        float _2290 = float(_2288);
        _2278 = _2290;
    }
    float _2292 = _2278;
    out.m_83.z = _2268;
    out.m_83.w = _1439;
    bool _2294 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2296 = isnan(_1652);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2302 = _2298 || _2300;
    float _2304 = _1862 * _2276;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = _2194 * _1543;
    float _2310 = _2292 * _1630;
    float _2312 = -_2194;
    float _2314 = _2312 + 1.0;
    float _2316 = -_2306;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2320 = _1554 * _2308;
    float _2322 = _1554 * _2314;
    float _2324 = -_2310;
    float _2326 = fma(_2324, _2318, 1.0);
    float _2328 = precise::clamp(_2326, 0.0, 1.0);
    float _2330 = _2328 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2332 = _2328;
    float _2334 = _2308;
    if (!_2302)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2336 = _2272;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2302)
    {
        _2332 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2342 = _2332;
    out.m_85.x = _2330;
    float _2344 = _1856 * _2308;
    float _2346 = fma(_1852, _2320, _1548);
    float _2348 = fma(_1854, _2320, _1550);
    float _2350 = _2342;
    float _2352 = _2342;
    if (!_2302)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2354 = _2334;
    float _2356 = fma(_1554, _2344, _1552);
    out.m_87.x = _2346;
    out.m_87.y = _2348;
    out.m_87.z = _2356;
    out.m_87.w = _2322;
    bool _2358 = !_2302;
    float _2360 = _2354;
    float _2362 = _2354;
    if (!_2358)
    {
        bool _2364 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2366 = isnan(_1652);
        bool _2368 = _2364 || _2366;
        bool _2370 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2372 = _2368 || _2370;
        if (!_2372)
        {
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2376 = _1652 + _2374;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2380 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2378;
            float _2382 = 1.0 / _2380;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2392 = _2376 * _2382;
            float _2394 = precise::clamp(_2392, 0.0, 1.0);
            float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2400 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2394, _2398, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2404 = fma(_2394, _2386, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2340 = _2404;
            _2362 = _2402;
            _2352 = _2400;
            _2406 = true;
        }
        else
        {
            bool _2408 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2410 = isnan(_1652);
            bool _2412 = _2408 || _2410;
            bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2416 = _2412 || _2414;
            if (!_2416)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2418 = _2360;
            _2362 = _2418;
            if (!_2416)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2420 = _2338;
            _2340 = _2420;
            if (!_2416)
            {
                _2350 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2422 = _2350;
            bool _2424 = !_2416;
            _2352 = _2422;
            if (!_2424)
            {
                bool _2426 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2428 = isnan(_1652);
                bool _2430 = _2426 || _2428;
                bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2434 = _2430 || _2432;
                if (!_2434)
                {
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2438 = _1652 + _2436;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2440;
                    float _2444 = 1.0 / _2442;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2454 = _2438 * _2444;
                    float _2456 = precise::clamp(_2454, 0.0, 1.0);
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2462 = fma(_2456, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2464 = fma(_2456, _2460, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2466 = fma(_2456, _2448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2340 = _2466;
                    _2362 = _2464;
                    _2352 = _2462;
                    _2406 = true;
                }
                else
                {
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2352 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2406 = false;
    float _2468 = _2340;
    float _2470 = _2362;
    float _2472 = _2352;
    float _2474 = _2468 * 0.586610972881317138671875;
    bool _2476 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = 1.0;
    float _2478 = fma(_2470, 0.298911988735198974609375, _2474);
    out.m_89.x = 0.0;
    float _2480 = fma(_2472, 0.114477999508380889892578125, _2478);
    float _2482 = -_2480;
    float _2484 = _2482 + _2470;
    float _2486 = -_2480;
    float _2488 = _2486 + _2468;
    float _2490 = -_2480;
    float _2492 = _2490 + _2472;
    float _2494 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2496 = fma(_2484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    float _2498 = fma(_2488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    float _2500 = fma(_2492, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    out.m_85.w = _2494;
    out.m_91.x = _2496;
    out.m_91.y = _2498;
    out.m_91.z = _2500;
    if (!_2476)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2502 = -_1337;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2506 = -_1339;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2510 = -_1341;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2514 = _2504 * _2504;
    float _2516 = fma(_2508, _2508, _2514);
    float _2518 = fma(_2512, _2512, _2516);
    float _2520 = sqrt(_2518);
    float _2522 = rsqrt(_2518);
    float _2524 = -_2520;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2528 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2530 = precise::clamp(_2528, 0.0, 1.0);
    float _2532 = _2508 * _2522;
    float _2534 = _2504 * _2522;
    float _2536 = abs(_2530);
    float _2538 = log2(_2536);
    float _2540 = _2512 * _2522;
    float _2542 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2544 = _2238 * _2534;
    float _2546 = -_2534;
    float _2548 = -_2542;
    float _2550 = fma(_2546, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2548);
    float _2552 = fma(_2240, _2532, _2544);
    float _2554 = -_2540;
    float _2556 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2550);
    float _2558 = fma(_2242, _2540, _2552);
    float _2560 = precise::clamp(_2558, 0.0, 1.0);
    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2564 = _2556 + _2562;
    float _2566 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = exp2(_2566);
    float _2574 = _2572 * _2570;
    float _2576 = _2560 * _2574;
    float _2578 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2582 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2578;
    out.m_89.y = _2580;
    out.m_89.z = _2582;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2406 = false;
    bool _566 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_56.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_59.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2639 = as_type<float>(_126);
        out.gl_Position.z = _2639;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_61.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_110);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_162);
        out.gl_Position.z = _2708;
    }
    if (_154)
    {
        return out;
    }
    float _164 = in.m_63.x;
    float _166 = in.m_63.y;
    float _168 = in.m_63.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _208;
    if (!_190)
    {
        float _192 = in.m_65.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_110);
        float _214 = 1.0 / _212;
        float _216 = _144 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _232 = 1.0 / _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _242 = 1.0 / _226;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _252 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _254 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = 1.0 / _230;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _258;
    float _262 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _266 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _268 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_218);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _282 = _218 + _280;
    float _284 = 1.0 / _236;
    float _286 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _218 + _288;
    out.m_67.x = _262;
    out.m_67.y = _264;
    out.m_67.z = _266;
    float _292 = -_278;
    float _294 = _292 + 1.0;
    float _296 = _290 * _232;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _218 + _298;
    out.m_69.x = _252;
    out.m_69.y = _254;
    out.m_69.z = _286;
    float _302 = 1.0 / _260;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _218 + _304;
    float _308 = _300 * _242;
    bool _310 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _312 = isnan(_218);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = _282 * _256;
    bool _324 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_218);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = _306 * _284;
    bool _338 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_218);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = _218 + _350;
    bool _354 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_218);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_320;
    float _368 = _366 + 1.0;
    float _370 = _348 * _294;
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = _364 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _334 * _378;
    bool _392 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_218);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _404;
    float _408 = -_334;
    float _410 = _408 + 1.0;
    float _412 = fma(_384, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = fma(_388, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _416 = _402 * _374;
    float _418 = _352 * _302;
    float _420 = fma(_406, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = _278 * _410;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _412 * _416;
    float _438 = -_402;
    float _440 = _438 + 1.0;
    float _442 = _414 * _416;
    float _444 = _420 * _416;
    float _446 = fma(_426, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_430, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _464 = fma(_454, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_446, _370, _456);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_462, _322, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = fma(_464, _422, _466);
    float _486 = fma(_470, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _492 = fma(_448, _370, _472);
    float _494 = fma(_450, _370, _458);
    float _496 = fma(_476, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_482, _322, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_490, _322, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _504 = fma(_486, _422, _492);
    float _506 = fma(_496, _422, _494);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_478, _390, _484);
    float _522 = fma(_510, _418, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_514, _418, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _418, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_498, _390, _504);
    float _530 = fma(_500, _390, _506);
    float _532 = fma(_522, _380, _520);
    float _534 = fma(_524, _380, _528);
    float _536 = fma(_526, _380, _530);
    float _538 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_502;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _564;
    if (!_544)
    {
        float _548 = in.m_65.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[14].y, _144);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        float _568 = float(_110);
        float _570 = 1.0 / _568;
        float _572 = _144 * _570;
        _564 = _572;
    }
    _566 = false;
    float _574 = _564;
    float _576 = in.m_56.x;
    float _578 = in.m_56.y;
    float _580 = in.m_56.z;
    float _582 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _584 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _586 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _582);
    float _590 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _592 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _586);
    float _594 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _596 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _598 = in.m_71.x;
    float _600 = in.m_71.y;
    float _602 = in.m_71.z;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _606 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _608 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _610 = _604 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _614 = _606 + _612;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _618 = _608 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _610 + _620;
    float _624 = _614 * _614;
    float _626 = fma(_618, _618, _624);
    float _628 = fma(_622, _622, _626);
    float _630 = rsqrt(_628);
    float _632 = _538 * _598;
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _636 = _634 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _638 = _636 * _630;
    float _640 = _618 * _638;
    float _642 = _622 * _638;
    float _644 = -_640;
    float _646 = _608 + _644;
    float _648 = -_642;
    float _650 = _610 + _648;
    float _652 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _654 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _656 = floor(_652);
    float _658 = floor(_654);
    float _660 = -_656;
    float _662 = _652 + _660;
    float _664 = -_658;
    float _666 = _654 + _664;
    float2 _3592 = float2(_662, _666);
    float _668 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3592, float2(0.0), isnan(_3592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3592, float2(0.0), isnan(_3592)), level(0.0)).x;
    float _670 = _186 * _186;
    float _672 = _614 * _638;
    float _674 = -_640;
    float _676 = _618 + _674;
    float _678 = fma(_184, _184, _670);
    float _680 = -_672;
    float _682 = _606 + _680;
    float _684 = -_672;
    float _686 = _614 + _684;
    float _688 = fma(_188, _188, _678);
    float _690 = _682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _692 = _686 * _686;
    float _694 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[11].x, _690);
    float _696 = rsqrt(_688);
    float _698 = _682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _700 = fma(_676, _676, _692);
    float _702 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[11].z, _694);
    float _704 = -_642;
    float _706 = _622 + _704;
    float _708 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[10].x, _698);
    float _710 = _540 * _600;
    float _712 = _702 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _714 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[10].z, _708);
    float _716 = _542 * _602;
    float _718 = 1.0 / _712;
    float _720 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _722 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _726 = _186 * _696;
    float _728 = _184 * _696;
    float _730 = _188 * _696;
    float _732 = _720 + _712;
    float _734 = _726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _736 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[8].y, _734);
    float _738 = _732 * _718;
    float _740 = _738 * 0.5;
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[10].y, _736);
    float _744 = abs(_742);
    bool _746 = _744 > 0.99989998340606689453125;
    float _748 = _702;
    float _750 = _696;
    float _752 = _742;
    int _754 = 2;
    if (_746)
    {
        _748 = 0.001000000047497451305389404296875;
    }
    float _756 = _748;
    if (!_746)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _758 = _546;
    float _760 = _758;
    if (!_746)
    {
        _750 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _762 = _750;
    float _764 = _762;
    if (_746)
    {
        float _766 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _760 = _766;
    }
    float _768 = _760;
    if (!_746)
    {
        _752 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _770 = _752;
    float _772 = _770;
    if (_746)
    {
        float _774 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _764 = _774;
    }
    float _776 = _764;
    if (_746)
    {
        float _778 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _772 = _778;
    }
    float _780 = _772;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _784 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
    float _786 = -_768;
    float _788 = _730 * _786;
    float _790 = -_776;
    float _792 = _726 * _790;
    float _794 = fma(_706, _706, _700);
    float _796 = 1.0 / _784;
    float _798 = -_776;
    float _800 = -_788;
    float _802 = fma(_728, _798, _800);
    float _804 = -_780;
    float _806 = -_792;
    float _808 = fma(_730, _804, _806);
    float _810 = -_780;
    float _812 = _728 * _810;
    float _814 = _802 * _802;
    float _816 = -_768;
    float _818 = -_812;
    float _820 = fma(_726, _816, _818);
    float _822 = fma(_808, _808, _814);
    float _824 = sqrt(_794);
    float _826 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _828 = fma(_820, _820, _822);
    float _830 = in.m_73.x;
    float _832 = in.m_73.y;
    float _834 = in.m_73.z;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _838 = _796 * _836;
    float _840 = _682 + _826;
    float _842 = rsqrt(_828);
    bool _844 = _838 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _846 = _840 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _848 = _838 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _850 = !_844;
    int _852 = _850 ? 0 : 1;
    float _854 = _630 * _824;
    float _856 = _722 * _854;
    float _858 = _724 * _854;
    float _860 = _634 * _854;
    float _862 = _840;
    if (!_844)
    {
        _754 = 1;
    }
    int _864 = _754;
    float _866 = _808 * _842;
    int _868 = _864;
    if (!_848)
    {
        _868 = _852;
    }
    int _870 = _868;
    float _872 = _802 * _842;
    float _874 = _820 * _842;
    float _876 = _840 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _878 = _870 << 6;
    float _880 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[126].x, _846);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _832);
    float _884 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[127].x, _876);
    int _886 = _878 + 96;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[126].z, _880);
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _909 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[127].z, _884);
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _913 = _856 * _882;
    float _915 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _917 = _909 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _919 = _878 + 104;
    uint _921 = uint(int(uint(_919) >> uint(2)));
    uint _923 = uint(int(uint(int(_921)) >> uint(2)));
    int _925 = int(_921) & 3;
    float _927 = (*spvDescriptorSet0.vp_c15)._m0[int(_923)][_925];
    int _929 = int(_921) + 1;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    int _933 = _929 & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    float _937 = _858 * _907;
    float _939 = _860 * _911;
    float _941 = _728 * _872;
    float _943 = _913 * _730;
    float _945 = trunc(_915);
    int _947 = int(_945);
    float _949 = _726 * _874;
    float _951 = -_941;
    float _953 = fma(_726, _866, _951);
    int _955 = _878 + 48;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    float _973 = _913 * _728;
    float _975 = fma(_939, _874, _943);
    float _977 = -_949;
    float _979 = fma(_730, _872, _977);
    float _981 = trunc(_917);
    int _983 = int(_981);
    float _985 = fma(_939, _866, _973);
    float _987 = fma(_937, _953, _975);
    int _989 = _878 + 64;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_937, _979, _985);
    float _1009 = _610 + _987;
    int _1011 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1013 = _947 + _1011;
    int _1015 = _1013 + 1;
    float _1017 = _608 + _1007;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1009 + _1019;
    int _1023 = _878 + 56;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    bool _1041 = _1015 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1045 = _1017 + _1043;
    float _1047 = _1021 * _1021;
    int _1049 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1051 = _983 + _1049;
    int _1053 = _1051 + 1;
    float _1055 = fma(_1045, _1045, _1047);
    int _1057 = _878 + 72;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
    int _1063 = int(_1059) & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    int _1067 = int(_1059) + 1;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    int _1071 = _1067 & 3;
    float _1073 = (*spvDescriptorSet0.vp_c15)._m0[int(_1069)][_1071];
    int _1075 = _1015 | _1053;
    bool _1077 = _1075 < 0;
    bool _1079 = _1077 || _1041;
    float _1081 = sqrt(_1055);
    int _1083 = _878 + 80;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c15)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c15)._m0[int(_1095)][_1097];
    float _1101 = _840 * _903;
    bool _1103 = _1053 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1105 = _1103 || _1079;
    float _1107 = _913 * _726;
    float _1109 = _730 * _866;
    float _1111 = fma(_646, _895, _1101);
    bool _1113 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_939, _872, _1107);
    float _1125 = -_1109;
    float _1127 = fma(_728, _874, _1125);
    float _1129 = fma(_650, _927, _1111);
    float _1131 = fma(_937, _1127, _1123);
    float _1133 = _1129 + _935;
    bool _1135 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _840 * _971;
    int _1139 = as_type<int>(_939);
    int _1141 = _1053;
    int _1143 = _1015;
    float _1145 = _1017;
    float _1147 = _1009;
    float _1149 = _1055;
    float _1151 = _915;
    float _1153 = as_type<float>(_870);
    if (!_1105)
    {
        int _1155 = _1053 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1157 = _1155 + _1015;
        _1139 = _1157;
    }
    int _1159 = _1139;
    float _1161 = 1.0 / _1133;
    float _1163 = fma(_646, _963, _1137);
    float _1165 = as_type<float>(_1159);
    if (!_1105)
    {
        int _1167 = _1159 << 2;
        _1141 = _1167;
    }
    int _1169 = _1141;
    float _1171 = _840 * _1005;
    int _1173 = _1169;
    if (!_1105)
    {
        uint _1175 = uint(int(uint(_1159) >> uint(2)));
        _1143 = int(_1175);
    }
    int _1177 = _1143;
    float _1179 = _963;
    if (!_1105)
    {
        float _1181 = floor(_915);
        _1179 = _1181;
    }
    float _1183 = _1179;
    if (!_1105)
    {
        int _1185 = 12 & _1169;
        _1173 = _1185;
    }
    int _1187 = _1173;
    float _1189 = fma(_646, _997, _1171);
    float _1191 = _606 + _1131;
    float _1193 = fma(_650, _1031, _1163);
    int _1195 = as_type<int>(_1031);
    float _1197 = _1039;
    if (!_1105)
    {
        int _1199 = _1177 << 4;
        int _1201 = _1199 + _1187;
        _1195 = _1201;
    }
    int _1203 = _1195;
    float _1205 = fma(_650, _1065, _1189);
    float _1207 = _1193 + _1039;
    float _1209 = _1073;
    if (!_1135)
    {
        _1197 = _1191;
    }
    float _1211 = _1197;
    bool _1213 = !_1135;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1081 + _1219;
        float _1223 = rsqrt(_1055);
        float _1225 = _1221 * _1217;
        float _1227 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1225 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = sin(_1235);
        float _1239 = _1233 + (-1.0);
        float _1241 = fma(_1237, _1227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1243 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1245 = _1223 * _1241;
        float _1247 = fma(_1191, _1233, _1243);
        float _1249 = fma(_1045, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1251 = fma(_1021, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1215 = _1247;
        _1145 = _1249;
        _1147 = _1251;
        _1149 = _1223;
    }
    float _1253 = _1215;
    float _1255 = _1145;
    float _1257 = _1147;
    float _1259 = _1149;
    float _1261 = -_672;
    float _1263 = _1261 + _1253;
    float _1265 = -_640;
    float _1267 = _1265 + _1255;
    float _1269 = -_642;
    float _1271 = _1269 + _1257;
    float _1273 = _1205 + _1073;
    float _1275 = _1263;
    float _1277 = _1267;
    float _1279 = _1271;
    if (!_1121)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1283 = _682 + _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1287 = _646 + _1285;
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1291 = -_610;
        float _1293 = _1291 + _1257;
        float _1295 = _1283 * _1283;
        float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1299 = _650 + _1297;
        float _1301 = -_608;
        float _1303 = _1301 + _1255;
        float _1305 = fma(_1287, _1287, _1295);
        float _1307 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1309 = fma(_1299, _1299, _1305);
        float _1311 = sqrt(_1309);
        float _1313 = 1.0 / _854;
        float _1315 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1289;
        float _1321 = _1319 * _1313;
        float _1323 = -_606;
        float _1325 = _1323 + _1253;
        float _1327 = _1315 * _1321;
        float _1329 = _1293 * _1321;
        float _1331 = fma(_1325, _1327, _682);
        float _1333 = fma(_1303, _1327, _646);
        float _1335 = fma(_1315, _1329, _650);
        _1275 = _1331;
        _1277 = _1333;
        _1279 = _1335;
        _1209 = _1321;
    }
    float _1337 = _1275;
    float _1339 = _1277;
    float _1341 = _1279;
    float _1343 = _1209;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1347 = _878 + 88;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    float _1365 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1367 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1369 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1345);
    float _1371 = _1207 * _1161;
    float _1373 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1365);
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1377 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = _1259;
    if (!_1105)
    {
        int _1381 = _1203 + 400;
        uint _1383 = uint(int(uint(_1381) >> uint(2)));
        uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
        int _1387 = int(_1383) & 3;
        float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1373);
    float _1395 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1375);
    float _1397 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1401 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1405 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1409 = _1371 >= 0.0;
    float _1411 = _1273 * _1161;
    float _1413 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1405);
    float _1415 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1407);
    bool _1417 = _1371 <= 1.0;
    bool _1419 = _1417 && _1409;
    float _1421 = _1343;
    if (!_1105)
    {
        float _1423 = floor(_917);
        _1421 = _1423;
    }
    float _1425 = _1421;
    float _1427 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1429 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1415);
    bool _1431 = _1411 >= 0.0;
    bool _1433 = _1431 && _1419;
    float _1435 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1437 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1439 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1429);
    float _1441 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1443 = _1411 <= 1.0;
    bool _1445 = _1443 && _1433;
    float _1447 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1435);
    float _1449 = 1.0 / _1439;
    float _1451 = -_1441;
    float _1453 = fma(_1451, _1437, 1.0);
    float _1455 = _840 * _1099;
    float _1457 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1459 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1447);
    float _1461 = _1437;
    float _1463 = _1447;
    if (!_1105)
    {
        float _1465 = -_1183;
        float _1467 = _915 + _1465;
        _1151 = _1467;
    }
    float _1469 = _1151;
    float _1471 = fma(_646, _1091, _1455);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1457);
    float _1475 = log2(_1453);
    float _1477 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1459);
    if (!_1105)
    {
        float _1479 = -_1425;
        float _1481 = _917 + _1479;
        _1461 = _1481;
    }
    float _1483 = _1461;
    if (_1445)
    {
        float _1485 = float(_870);
        _1153 = _1485;
    }
    float _1487 = _1153;
    float _1489 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1473);
    float _1491 = _1477 * _1449;
    float _1493 = _1455;
    if (_1445)
    {
        float _1495 = rint(_1487);
        float _1497 = precise::max(_1495, 0.0);
        uint _1499 = uint(_1497);
        uint _1501 = clamp(_1499, 0u, 65535u);
        _1493 = as_type<float>(_1501);
    }
    float _1503 = _1493;
    float _1505 = fma(_650, _1355, _1471);
    float _1507 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1489);
    float _1509 = fma(_1491, -0.5, 0.5);
    float _1511 = _1505 + _1363;
    float _1513 = _1475 * 0.693147182464599609375;
    float _1515 = _1491;
    float _1517 = _1391;
    if (!_1105)
    {
        float _1519 = rint(_1391);
        float _1521 = precise::max(_1519, 0.0);
        uint _1523 = uint(_1521);
        uint _1525 = clamp(_1523, 0u, 65535u);
        _1515 = as_type<float>(_1525);
    }
    float _1527 = _1515;
    float _1529 = _1507 * _1449;
    float _1531 = _1511 * _1161;
    float _1533 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1535 = fma(_1529, 0.5, 0.5);
    float _1537 = _1449;
    if (_1445)
    {
        float3 _5030 = float3(_1371, _1411, float(as_type<int>(_1503)));
        float3 _5034 = select(_5030, float3(0.0), isnan(_5030));
        float _1539 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5034.xy, uint(rint(_5034.z)), _1531, level(0.0));
        _1537 = _1539;
    }
    float _1541 = _1537;
    float3 _5044 = float3(_1535, _1509, _1533);
    float _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5044, float3(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5044, float3(0.0), isnan(_5044)), level(0.0)).x;
    float3 _5053 = float3(_1535, _1509, _1533);
    float4 _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5053, float3(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5053, float3(0.0), isnan(_5053)), level(0.0)).xyzw;
    float _1548 = _1546.x;
    float _1550 = _1546.y;
    float _1552 = _1546.z;
    float _1554 = _1546.w;
    float _1556 = _1483;
    if (!_1105)
    {
        float3 _5076 = float3(_1469, _1483, float(as_type<int>(_1527)));
        float3 _5078 = select(_5076, float3(0.0), isnan(_5076));
        float _1558 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5078.xy, uint(rint(_5078.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5078.xy, uint(rint(_5078.z)), level(0.0)).x;
        _1556 = _1558;
    }
    float _1560 = _1556;
    if (_1105)
    {
        _1463 = 1.0;
    }
    float _1562 = _1463;
    float _1564 = _1562;
    if (!_1105)
    {
        int _1566 = _1159 << 4;
        int _1568 = _1566 + 2048;
        uint _1570 = uint(int(uint(_1568) >> uint(2)));
        uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
        int _1574 = int(_1570) & 3;
        float _1576 = (*spvDescriptorSet0.vp_c15)._m0[int(_1572)][_1574];
        int _1578 = int(_1570) + 1;
        uint _1580 = uint(int(uint(_1578) >> uint(2)));
        int _1582 = _1578 & 3;
        float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
        int _1586 = _1568 + 8;
        uint _1588 = uint(int(uint(_1586) >> uint(2)));
        uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
        int _1592 = int(_1588) & 3;
        float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
        int _1596 = int(_1588) + 1;
        uint _1598 = uint(int(uint(_1596) >> uint(2)));
        int _1600 = _1596 & 3;
        float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
        float _1604 = _840 * _1584;
        float _1606 = fma(_646, _1576, _1604);
        float _1608 = fma(_650, _1594, _1606);
        float _1610 = _1608 + _1602;
        float _1612 = precise::clamp(_1610, 0.0, 1.0);
        float _1614 = -_1612;
        float _1616 = _1614 + _1560;
        float _1618 = fma(_1616, 500.0, 1.5);
        float _1620 = exp2(_1618);
        float _1622 = 0.0 + _1620;
        float _1624 = precise::clamp(_1622, 0.0, 1.0);
        _862 = _1604;
        _1165 = as_type<float>(_1568);
        _1564 = _1624;
    }
    float _1626 = _862;
    float _1628 = _1165;
    float _1630 = _1564;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1634 = _1337 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1638 = _1339 + _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1642 = _1341 + _1640;
    float _1644 = _1634 * _1634;
    float _1646 = fma(_1638, _1638, _1644);
    float _1648 = fma(_1642, _1642, _1646);
    float _1650 = rsqrt(_1648);
    float _1652 = sqrt(_1648);
    float _1654 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1656 = _1638 * _1654;
    float _1658 = _1642 * _1654;
    float _1660 = _1656 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 + _1662;
    float _1666 = sqrt(_1664);
    bool _1668 = _1666 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = _1666 + _1670;
    float _1674 = _1626;
    float _1676 = _1664;
    float _1678 = _1672;
    float _1680 = _1656;
    float _1682 = _1658;
    float _1684 = _1660;
    float _1686 = _1662;
    if (_1668)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1688;
    }
    float _1690 = _1674;
    if (_1668)
    {
        float _1692 = rsqrt(_1664);
        _1676 = _1692;
    }
    float _1694 = _1676;
    if (_1668)
    {
        float _1696 = _1672 * _1690;
        _1678 = _1696;
    }
    float _1698 = _1678;
    if (_1668)
    {
        float _1700 = _1698 * 0.15915493667125701904296875;
        _1517 = _1700;
    }
    float _1702 = _1517;
    float _1704 = _650;
    if (_1668)
    {
        float _1706 = _1702 * 6.283185482025146484375;
        float _1708 = sin(_1706);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1714 = precise::max(0.0, _1712);
    float _1716 = _1628;
    float _1718 = _1714;
    float _1720 = _1712;
    if (_1668)
    {
        float _1722 = _1702 * 6.283185482025146484375;
        float _1724 = cos(_1722);
        _1716 = _1724;
    }
    float _1726 = _1716;
    float _1728 = -_1654;
    float _1730 = -_1714;
    float _1732 = fma(_1634, _1728, _1730);
    float _1734 = _1732;
    if (_1668)
    {
        float _1736 = _1732 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1718 = _1736;
    }
    float _1738 = _1718;
    float _1740 = _1738;
    float _1742 = _1710;
    if (_1668)
    {
        float _1744 = fma(_1710, _1738, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1740 = _1744;
    }
    float _1746 = _1740;
    if (_1668)
    {
        float _1748 = _1726 + (-1.0);
        _1720 = _1748;
    }
    float _1750 = _1720;
    float _1752 = _1750;
    if (_1668)
    {
        float _1754 = _1694 * _1746;
        _1742 = _1754;
    }
    float _1756 = _1742;
    if (_1668)
    {
        float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _1758;
    }
    float _1760 = _1752;
    if (_1668)
    {
        float _1762 = _1656 * _1756;
        _1680 = _1762;
    }
    float _1764 = _1680;
    if (_1668)
    {
        float _1766 = _1658 * _1756;
        _1682 = _1766;
    }
    float _1768 = _1682;
    if (_1668)
    {
        float _1770 = fma(_1732, _1726, _1760);
        _1734 = _1770;
    }
    float _1772 = _1734;
    if (_1668)
    {
        float _1774 = _1764 * _1764;
        _1684 = _1774;
    }
    float _1776 = _1684;
    if (_1668)
    {
        float _1778 = _1768 * _1768;
        _1686 = _1778;
    }
    float _1780 = _1686;
    float _1782 = fma(_1772, _1772, _1776);
    float _1784 = _1782 + _1780;
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1788 = fma(_1652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1786);
    float _1790 = precise::clamp(_1788, 0.0, 1.0);
    float _1792 = -_1790;
    float _1794 = _1792 + 1.0;
    float _1796 = rsqrt(_1784);
    float _1798 = abs(_1794);
    float _1800 = log2(_1798);
    float _1802 = _1796 * _1764;
    float _1804 = _1796 * _1772;
    float _1806 = _1796 * _1768;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = _1804 + 1.0;
    float _1812 = -_1808;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1812);
    float _1816 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1818 = -_1806;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1814);
    float _1822 = exp2(_1816);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = fma(_1820, 0.5, 0.5);
    float _1828 = fma(_1826, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = sqrt(_1824);
    float _1832 = fma(_1826, _1828, -0.212114393711090087890625);
    float _1834 = fma(_1826, _1832, 1.570728778839111328125);
    float _1836 = -_1804;
    float _1838 = fma(_1822, _1810, _1836);
    float _1840 = fma(_1838, 0.5, 0.5);
    float _1842 = _1830 * 0.636619746685028076171875;
    float _1844 = -_1834;
    float _1846 = fma(_1842, _1844, 1.0);
    float2 _5521 = float2(_1846, _1840);
    float3 _1850 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5521, float2(0.0), isnan(_5521)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5521, float2(0.0), isnan(_5521)), level(0.0)).xyz;
    float _1852 = _1850.x;
    float _1854 = _1850.y;
    float _1856 = _1850.z;
    float _1858 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1860 = -_668;
    float _1862 = _1860 + 1.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1876 = 1.0 / _1866;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1882;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1890 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1892 = isnan(_574);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    out.m_75.x = _1339;
    out.m_75.y = _1337;
    out.m_75.z = _1341;
    float _1902 = 1.0 / _1870;
    bool _1904 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1906 = isnan(_574);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    bool _1916 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1918 = isnan(_574);
    bool _1920 = _1916 || _1918;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1924 = _1920 || _1922;
    float _1926 = float(_1924);
    float _1928 = 1.0 / _1874;
    float _1930 = _1884 * _1876;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1932;
    float _1936 = -_1900;
    float _1938 = _1936 + 1.0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1950 = _1948 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1952 = 1.0 / _1880;
    float _1954 = _1888 * _1902;
    bool _1956 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1958 = isnan(_574);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1968;
    float _1972 = -_1926;
    float _1974 = _1972 + 1.0;
    bool _1976 = _832 != 0.0;
    bool _1978 = isnan(_832);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.0);
    bool _1984 = _1980 || _1982;
    float _1986 = _1966 * _1938;
    float _1988 = _1934 * _1928;
    bool _1990 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1992 = isnan(_574);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1966;
    float _2004 = _2002 + 1.0;
    float _2006 = 1.0 / _1950;
    bool _2008 = _830 == 0.0;
    bool _2010 = !_1984;
    bool _2012 = _2008 && _2010;
    float _2014 = _2000 * _2004;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2020 = _1942 * _1952;
    bool _2022 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2024 = isnan(_574);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    float _2034 = -_2000;
    float _2036 = _2034 + 1.0;
    float _2038 = 1.0 / _1946;
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2042 = _574 + _2040;
    bool _2044 = _834 == 0.0;
    bool _2046 = _2044 && _2012;
    float _2048 = _2032 * _2036;
    float _2050 = -_2032;
    float _2052 = _2050 + 1.0;
    float _2054 = 1.0 / _2018;
    float _2056 = _1970 * _2006;
    float _2058 = _1914 * _2052;
    float _2060 = -_1914;
    float _2062 = _2060 + 1.0;
    float _2064 = fma(_1930, _2042, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2066 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2068 = isnan(_574);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = _1926 * _2062;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2082 = _2080 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2084;
    float _2088 = _2076 * _1974;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2092 = _574 + _2090;
    float _2094 = _2082 * _2038;
    float _2096 = -_2076;
    float _2098 = _2096 + 1.0;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2102 = _574 + _2100;
    float _2104 = fma(_1954, _2092, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2106 = _2086 * _2054;
    float _2108 = _2064 * _2088;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2112 = _574 + _2110;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2116 = _574 + _2114;
    float _2118 = fma(_2020, _2102, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2120 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2108);
    float _2122 = fma(_1988, _2112, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2124 = fma(_2056, _2116, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2126 = exp2(_1858);
    float _2128 = fma(_2104, _2078, _2120);
    float _2130 = in.m_77.x;
    float _2132 = in.m_77.y;
    float _2134 = in.m_77.z;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2138 = _574 + _2136;
    float _2140 = fma(_2122, _2058, _2128);
    bool _2142 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2144 = isnan(_574);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2150 = _2146 || _2148;
    float _2152 = float(_2150);
    float _2154 = fma(_2094, _2138, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2156 = abs(_838);
    float _2158 = log2(_2156);
    float _2160 = fma(_2118, _2048, _2140);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2164 = _574 + _2162;
    float _2166 = -_2152;
    float _2168 = _2166 + 1.0;
    float _2170 = fma(_2124, _2014, _2160);
    float _2172 = fma(_2106, _2164, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2174 = _1900 * _2168;
    float _2176 = -_2126;
    float _2178 = _2176 + 1.0;
    bool _2180 = _838 <= 8000.0;
    bool _2182 = isnan(_838);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(8000.0);
    bool _2188 = _2184 || _2186;
    float _2190 = float(_2188);
    float _2192 = fma(_2154, _1986, _2170);
    float _2194 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2196 = fma(_2172, _2174, _2192);
    float _2198 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2200 = _2130;
    float _2202 = _2134;
    float _2204 = _2132;
    if (!_2046)
    {
        float _2206 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2200 = _2206;
    }
    float _2208 = _2200;
    if (!_2046)
    {
        float _2210 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2134);
        _2202 = _2210;
    }
    float _2212 = _2202;
    if (!_2046)
    {
        float _2214 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2204 = _2214;
    }
    float _2216 = _2204;
    float _2218 = exp2(_2198);
    float _2220 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2222 = _726 * _2216;
    float _2224 = _728 * _2216;
    float _2226 = _730 * _2216;
    float _2228 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2220);
    float _2230 = fma(_872, _2208, _2222);
    float _2232 = fma(_866, _2208, _2224);
    float _2234 = fma(_874, _2208, _2226);
    float _2236 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2228);
    float _2238 = fma(_1127, _2212, _2230);
    float _2240 = fma(_979, _2212, _2232);
    float _2242 = fma(_953, _2212, _2234);
    float _2244 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2236);
    float _2246 = fma(_2218, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2196);
    out.m_79.x = _2240;
    out.m_79.y = _2238;
    out.m_79.z = _2242;
    float _2252 = fma(_2248, -2.0, 3.0);
    float _2254 = _2248 * _2248;
    out.gl_Position.x = _1507;
    out.gl_Position.y = _1477;
    out.gl_Position.z = _2244;
    out.gl_Position.w = _1439;
    float _2256 = _2254 * _2252;
    out.m_81.x = _2250;
    float _2258 = -_2256;
    float _2260 = _2258 + 1.0;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2256);
    float _2264 = _2244 + _1439;
    float _2266 = _2190 * _2262;
    float _2268 = _2264 * 0.5;
    float _2270 = _2264;
    float _2272 = _2260;
    if (!_1445)
    {
        _2270 = 1.0;
    }
    float _2274 = _2270;
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2278 = _2274;
    if (_1445)
    {
        bool _2280 = _1541 >= _1531;
        bool _2282 = isnan(_1541);
        bool _2284 = _2280 || _2282;
        bool _2286 = isnan(_1531);
        bool _2288 = _2284 || _2286;
        float _2290 = float(_2288);
        _2278 = _2290;
    }
    float _2292 = _2278;
    out.m_83.z = _2268;
    out.m_83.w = _1439;
    bool _2294 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2296 = isnan(_1652);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2302 = _2298 || _2300;
    float _2304 = _1862 * _2276;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = _2194 * _1543;
    float _2310 = _2292 * _1630;
    float _2312 = -_2194;
    float _2314 = _2312 + 1.0;
    float _2316 = -_2306;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2320 = _1554 * _2308;
    float _2322 = _1554 * _2314;
    float _2324 = -_2310;
    float _2326 = fma(_2324, _2318, 1.0);
    float _2328 = precise::clamp(_2326, 0.0, 1.0);
    float _2330 = _2328 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2332 = _2328;
    float _2334 = _2308;
    if (!_2302)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2336 = _2272;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2302)
    {
        _2332 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2342 = _2332;
    out.m_85.x = _2330;
    float _2344 = _1856 * _2308;
    float _2346 = fma(_1852, _2320, _1548);
    float _2348 = fma(_1854, _2320, _1550);
    float _2350 = _2342;
    float _2352 = _2342;
    if (!_2302)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2354 = _2334;
    float _2356 = fma(_1554, _2344, _1552);
    out.m_87.x = _2346;
    out.m_87.y = _2348;
    out.m_87.z = _2356;
    out.m_87.w = _2322;
    bool _2358 = !_2302;
    float _2360 = _2354;
    float _2362 = _2354;
    if (!_2358)
    {
        bool _2364 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2366 = isnan(_1652);
        bool _2368 = _2364 || _2366;
        bool _2370 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2372 = _2368 || _2370;
        if (!_2372)
        {
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2376 = _1652 + _2374;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2380 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2378;
            float _2382 = 1.0 / _2380;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2392 = _2376 * _2382;
            float _2394 = precise::clamp(_2392, 0.0, 1.0);
            float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2400 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2394, _2398, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2404 = fma(_2394, _2386, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2340 = _2404;
            _2362 = _2402;
            _2352 = _2400;
            _2406 = true;
        }
        else
        {
            bool _2408 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2410 = isnan(_1652);
            bool _2412 = _2408 || _2410;
            bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2416 = _2412 || _2414;
            if (!_2416)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2418 = _2360;
            _2362 = _2418;
            if (!_2416)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2420 = _2338;
            _2340 = _2420;
            if (!_2416)
            {
                _2350 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2422 = _2350;
            bool _2424 = !_2416;
            _2352 = _2422;
            if (!_2424)
            {
                bool _2426 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2428 = isnan(_1652);
                bool _2430 = _2426 || _2428;
                bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2434 = _2430 || _2432;
                if (!_2434)
                {
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2438 = _1652 + _2436;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2440;
                    float _2444 = 1.0 / _2442;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2454 = _2438 * _2444;
                    float _2456 = precise::clamp(_2454, 0.0, 1.0);
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2462 = fma(_2456, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2464 = fma(_2456, _2460, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2466 = fma(_2456, _2448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2340 = _2466;
                    _2362 = _2464;
                    _2352 = _2462;
                    _2406 = true;
                }
                else
                {
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2352 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2406 = false;
    float _2468 = _2340;
    float _2470 = _2362;
    float _2472 = _2352;
    float _2474 = _2468 * 0.586610972881317138671875;
    bool _2476 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = 1.0;
    float _2478 = fma(_2470, 0.298911988735198974609375, _2474);
    out.m_89.x = 0.0;
    float _2480 = fma(_2472, 0.114477999508380889892578125, _2478);
    float _2482 = -_2480;
    float _2484 = _2482 + _2470;
    float _2486 = -_2480;
    float _2488 = _2486 + _2468;
    float _2490 = -_2480;
    float _2492 = _2490 + _2472;
    float _2494 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2496 = fma(_2484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    float _2498 = fma(_2488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    float _2500 = fma(_2492, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    out.m_85.w = _2494;
    out.m_91.x = _2496;
    out.m_91.y = _2498;
    out.m_91.z = _2500;
    if (!_2476)
    {
        return out;
    }
    float _2502 = -_1337;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2506 = -_1339;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2510 = -_1341;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2514 = _2504 * _2504;
    float _2516 = fma(_2508, _2508, _2514);
    float _2518 = fma(_2512, _2512, _2516);
    float _2520 = sqrt(_2518);
    float _2522 = rsqrt(_2518);
    float _2524 = -_2520;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2528 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2530 = precise::clamp(_2528, 0.0, 1.0);
    float _2532 = _2508 * _2522;
    float _2534 = _2504 * _2522;
    float _2536 = abs(_2530);
    float _2538 = log2(_2536);
    float _2540 = _2512 * _2522;
    float _2542 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2544 = _2238 * _2534;
    float _2546 = -_2534;
    float _2548 = -_2542;
    float _2550 = fma(_2546, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2548);
    float _2552 = fma(_2240, _2532, _2544);
    float _2554 = -_2540;
    float _2556 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2550);
    float _2558 = fma(_2242, _2540, _2552);
    float _2560 = precise::clamp(_2558, 0.0, 1.0);
    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2564 = _2556 + _2562;
    float _2566 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = exp2(_2566);
    float _2574 = _2572 * _2570;
    float _2576 = _2560 * _2574;
    float _2578 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2582 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2578;
    out.m_89.y = _2580;
    out.m_89.z = _2582;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2406 = false;
    bool _566 = false;
    bool _210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_56.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_59.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2639 = as_type<float>(_126);
        out.gl_Position.z = _2639;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_61.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_110);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_59.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_162);
        out.gl_Position.z = _2708;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_63.x;
    float _166 = in.m_63.y;
    float _168 = in.m_63.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _208;
    if (!_190)
    {
        float _192 = in.m_65.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _208 = _206;
        _210 = true;
    }
    else
    {
        float _212 = float(_110);
        float _214 = 1.0 / _212;
        float _216 = _144 * _214;
        _208 = _216;
    }
    _210 = false;
    float _218 = _208;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _232 = 1.0 / _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _242 = 1.0 / _226;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _252 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _254 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = 1.0 / _230;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _258;
    float _262 = _246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _266 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _268 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _270 = isnan(_218);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _282 = _218 + _280;
    float _284 = 1.0 / _236;
    float _286 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _218 + _288;
    out.m_67.x = _262;
    out.m_67.y = _264;
    out.m_67.z = _266;
    float _292 = -_278;
    float _294 = _292 + 1.0;
    float _296 = _290 * _232;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _218 + _298;
    out.m_69.x = _252;
    out.m_69.y = _254;
    out.m_69.z = _286;
    float _302 = 1.0 / _260;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _218 + _304;
    float _308 = _300 * _242;
    bool _310 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _312 = isnan(_218);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = _282 * _256;
    bool _324 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_218);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = _306 * _284;
    bool _338 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_218);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _352 = _218 + _350;
    bool _354 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_218);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_320;
    float _368 = _366 + 1.0;
    float _370 = _348 * _294;
    float _372 = -_348;
    float _374 = _372 + 1.0;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = _364 * _368;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _334 * _378;
    bool _392 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _394 = isnan(_218);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _404;
    float _408 = -_334;
    float _410 = _408 + 1.0;
    float _412 = fma(_384, _296, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _414 = fma(_388, _296, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _416 = _402 * _374;
    float _418 = _352 * _302;
    float _420 = fma(_406, _296, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = _278 * _410;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _412 * _416;
    float _438 = -_402;
    float _440 = _438 + 1.0;
    float _442 = _414 * _416;
    float _444 = _420 * _416;
    float _446 = fma(_426, _336, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_430, _336, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _336, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _444);
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _464 = fma(_454, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_446, _370, _456);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _468;
    float _472 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _442);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _474;
    float _478 = fma(_462, _322, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = fma(_464, _422, _466);
    float _486 = fma(_470, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _492 = fma(_448, _370, _472);
    float _494 = fma(_450, _370, _458);
    float _496 = fma(_476, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_482, _322, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _500 = fma(_490, _322, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _502 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _504 = fma(_486, _422, _492);
    float _506 = fma(_496, _422, _494);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_478, _390, _484);
    float _522 = fma(_510, _418, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_514, _418, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _418, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_498, _390, _504);
    float _530 = fma(_500, _390, _506);
    float _532 = fma(_522, _380, _520);
    float _534 = fma(_524, _380, _528);
    float _536 = fma(_526, _380, _530);
    float _538 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_502;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _564;
    if (!_544)
    {
        float _548 = in.m_65.x;
        float _550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _552 = _548 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[14].y, _144);
        float _556 = _554 * _550;
        float _558 = floor(_556);
        float _560 = -_558;
        float _562 = _556 + _560;
        _564 = _562;
        _566 = true;
    }
    else
    {
        float _568 = float(_110);
        float _570 = 1.0 / _568;
        float _572 = _144 * _570;
        _564 = _572;
    }
    _566 = false;
    float _574 = _564;
    float _576 = in.m_56.x;
    float _578 = in.m_56.y;
    float _580 = in.m_56.z;
    float _582 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _584 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _586 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _582);
    float _590 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _592 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _586);
    float _594 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _596 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _590);
    float _598 = in.m_71.x;
    float _600 = in.m_71.y;
    float _602 = in.m_71.z;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _606 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _608 = _596 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _610 = _604 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _612 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _614 = _606 + _612;
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _618 = _608 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _622 = _610 + _620;
    float _624 = _614 * _614;
    float _626 = fma(_618, _618, _624);
    float _628 = fma(_622, _622, _626);
    float _630 = rsqrt(_628);
    float _632 = _538 * _598;
    float _634 = _632 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _636 = _634 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _638 = _636 * _630;
    float _640 = _618 * _638;
    float _642 = _622 * _638;
    float _644 = -_640;
    float _646 = _608 + _644;
    float _648 = -_642;
    float _650 = _610 + _648;
    float _652 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _654 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _656 = floor(_652);
    float _658 = floor(_654);
    float _660 = -_656;
    float _662 = _652 + _660;
    float _664 = -_658;
    float _666 = _654 + _664;
    float2 _3592 = float2(_662, _666);
    float _668 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3592, float2(0.0), isnan(_3592)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3592, float2(0.0), isnan(_3592)), level(0.0)).x;
    float _670 = _186 * _186;
    float _672 = _614 * _638;
    float _674 = -_640;
    float _676 = _618 + _674;
    float _678 = fma(_184, _184, _670);
    float _680 = -_672;
    float _682 = _606 + _680;
    float _684 = -_672;
    float _686 = _614 + _684;
    float _688 = fma(_188, _188, _678);
    float _690 = _682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _692 = _686 * _686;
    float _694 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[11].x, _690);
    float _696 = rsqrt(_688);
    float _698 = _682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _700 = fma(_676, _676, _692);
    float _702 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[11].z, _694);
    float _704 = -_642;
    float _706 = _622 + _704;
    float _708 = fma(_646, (*spvDescriptorSet0.vp_c8)._m0[10].x, _698);
    float _710 = _540 * _600;
    float _712 = _702 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _714 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[10].z, _708);
    float _716 = _542 * _602;
    float _718 = 1.0 / _712;
    float _720 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _722 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _724 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _726 = _186 * _696;
    float _728 = _184 * _696;
    float _730 = _188 * _696;
    float _732 = _720 + _712;
    float _734 = _726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _736 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[8].y, _734);
    float _738 = _732 * _718;
    float _740 = _738 * 0.5;
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[10].y, _736);
    float _744 = abs(_742);
    bool _746 = _744 > 0.99989998340606689453125;
    float _748 = _702;
    float _750 = _696;
    float _752 = _742;
    int _754 = 2;
    if (_746)
    {
        _748 = 0.001000000047497451305389404296875;
    }
    float _756 = _748;
    if (!_746)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _758 = _546;
    float _760 = _758;
    if (!_746)
    {
        _750 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _762 = _750;
    float _764 = _762;
    if (_746)
    {
        float _766 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _760 = _766;
    }
    float _768 = _760;
    if (!_746)
    {
        _752 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _770 = _752;
    float _772 = _770;
    if (_746)
    {
        float _774 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _764 = _774;
    }
    float _776 = _764;
    if (_746)
    {
        float _778 = fma(_756, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _772 = _778;
    }
    float _780 = _772;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _784 = fma(_740, (*spvDescriptorSet0.vp_c8)._m0[30].w, _782);
    float _786 = -_768;
    float _788 = _730 * _786;
    float _790 = -_776;
    float _792 = _726 * _790;
    float _794 = fma(_706, _706, _700);
    float _796 = 1.0 / _784;
    float _798 = -_776;
    float _800 = -_788;
    float _802 = fma(_728, _798, _800);
    float _804 = -_780;
    float _806 = -_792;
    float _808 = fma(_730, _804, _806);
    float _810 = -_780;
    float _812 = _728 * _810;
    float _814 = _802 * _802;
    float _816 = -_768;
    float _818 = -_812;
    float _820 = fma(_726, _816, _818);
    float _822 = fma(_808, _808, _814);
    float _824 = sqrt(_794);
    float _826 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _828 = fma(_820, _820, _822);
    float _830 = in.m_73.x;
    float _832 = in.m_73.y;
    float _834 = in.m_73.z;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _838 = _796 * _836;
    float _840 = _682 + _826;
    float _842 = rsqrt(_828);
    bool _844 = _838 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _846 = _840 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _848 = _838 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _850 = !_844;
    int _852 = _850 ? 0 : 1;
    float _854 = _630 * _824;
    float _856 = _722 * _854;
    float _858 = _724 * _854;
    float _860 = _634 * _854;
    float _862 = _840;
    if (!_844)
    {
        _754 = 1;
    }
    int _864 = _754;
    float _866 = _808 * _842;
    int _868 = _864;
    if (!_848)
    {
        _868 = _852;
    }
    int _870 = _868;
    float _872 = _802 * _842;
    float _874 = _820 * _842;
    float _876 = _840 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _878 = _870 << 6;
    float _880 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[126].x, _846);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _832);
    float _884 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[127].x, _876);
    int _886 = _878 + 96;
    uint _889 = uint(int(uint(_886) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.vp_c15)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.vp_c15)._m0[int(_899)][_901];
    float _905 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[126].z, _880);
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _834);
    float _909 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[127].z, _884);
    float _911 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _830);
    float _913 = _856 * _882;
    float _915 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _917 = _909 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _919 = _878 + 104;
    uint _921 = uint(int(uint(_919) >> uint(2)));
    uint _923 = uint(int(uint(int(_921)) >> uint(2)));
    int _925 = int(_921) & 3;
    float _927 = (*spvDescriptorSet0.vp_c15)._m0[int(_923)][_925];
    int _929 = int(_921) + 1;
    uint _931 = uint(int(uint(_929) >> uint(2)));
    int _933 = _929 & 3;
    float _935 = (*spvDescriptorSet0.vp_c15)._m0[int(_931)][_933];
    float _937 = _858 * _907;
    float _939 = _860 * _911;
    float _941 = _728 * _872;
    float _943 = _913 * _730;
    float _945 = trunc(_915);
    int _947 = int(_945);
    float _949 = _726 * _874;
    float _951 = -_941;
    float _953 = fma(_726, _866, _951);
    int _955 = _878 + 48;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    float _973 = _913 * _728;
    float _975 = fma(_939, _874, _943);
    float _977 = -_949;
    float _979 = fma(_730, _872, _977);
    float _981 = trunc(_917);
    int _983 = int(_981);
    float _985 = fma(_939, _866, _973);
    float _987 = fma(_937, _953, _975);
    int _989 = _878 + 64;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_937, _979, _985);
    float _1009 = _610 + _987;
    int _1011 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1013 = _947 + _1011;
    int _1015 = _1013 + 1;
    float _1017 = _608 + _1007;
    float _1019 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1021 = _1009 + _1019;
    int _1023 = _878 + 56;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    uint _1027 = uint(int(uint(int(_1025)) >> uint(2)));
    int _1029 = int(_1025) & 3;
    float _1031 = (*spvDescriptorSet0.vp_c15)._m0[int(_1027)][_1029];
    int _1033 = int(_1025) + 1;
    uint _1035 = uint(int(uint(_1033) >> uint(2)));
    int _1037 = _1033 & 3;
    float _1039 = (*spvDescriptorSet0.vp_c15)._m0[int(_1035)][_1037];
    bool _1041 = _1015 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1045 = _1017 + _1043;
    float _1047 = _1021 * _1021;
    int _1049 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1051 = _983 + _1049;
    int _1053 = _1051 + 1;
    float _1055 = fma(_1045, _1045, _1047);
    int _1057 = _878 + 72;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
    int _1063 = int(_1059) & 3;
    float _1065 = (*spvDescriptorSet0.vp_c15)._m0[int(_1061)][_1063];
    int _1067 = int(_1059) + 1;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    int _1071 = _1067 & 3;
    float _1073 = (*spvDescriptorSet0.vp_c15)._m0[int(_1069)][_1071];
    int _1075 = _1015 | _1053;
    bool _1077 = _1075 < 0;
    bool _1079 = _1077 || _1041;
    float _1081 = sqrt(_1055);
    int _1083 = _878 + 80;
    uint _1085 = uint(int(uint(_1083) >> uint(2)));
    uint _1087 = uint(int(uint(int(_1085)) >> uint(2)));
    int _1089 = int(_1085) & 3;
    float _1091 = (*spvDescriptorSet0.vp_c15)._m0[int(_1087)][_1089];
    int _1093 = int(_1085) + 1;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    int _1097 = _1093 & 3;
    float _1099 = (*spvDescriptorSet0.vp_c15)._m0[int(_1095)][_1097];
    float _1101 = _840 * _903;
    bool _1103 = _1053 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1105 = _1103 || _1079;
    float _1107 = _913 * _726;
    float _1109 = _730 * _866;
    float _1111 = fma(_646, _895, _1101);
    bool _1113 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1115 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(0.5);
    bool _1121 = _1117 || _1119;
    float _1123 = fma(_939, _872, _1107);
    float _1125 = -_1109;
    float _1127 = fma(_728, _874, _1125);
    float _1129 = fma(_650, _927, _1111);
    float _1131 = fma(_937, _1127, _1123);
    float _1133 = _1129 + _935;
    bool _1135 = _1081 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _840 * _971;
    int _1139 = as_type<int>(_939);
    int _1141 = _1053;
    int _1143 = _1015;
    float _1145 = _1017;
    float _1147 = _1009;
    float _1149 = _1055;
    float _1151 = _915;
    float _1153 = as_type<float>(_870);
    if (!_1105)
    {
        int _1155 = _1053 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1157 = _1155 + _1015;
        _1139 = _1157;
    }
    int _1159 = _1139;
    float _1161 = 1.0 / _1133;
    float _1163 = fma(_646, _963, _1137);
    float _1165 = as_type<float>(_1159);
    if (!_1105)
    {
        int _1167 = _1159 << 2;
        _1141 = _1167;
    }
    int _1169 = _1141;
    float _1171 = _840 * _1005;
    int _1173 = _1169;
    if (!_1105)
    {
        uint _1175 = uint(int(uint(_1159) >> uint(2)));
        _1143 = int(_1175);
    }
    int _1177 = _1143;
    float _1179 = _963;
    if (!_1105)
    {
        float _1181 = floor(_915);
        _1179 = _1181;
    }
    float _1183 = _1179;
    if (!_1105)
    {
        int _1185 = 12 & _1169;
        _1173 = _1185;
    }
    int _1187 = _1173;
    float _1189 = fma(_646, _997, _1171);
    float _1191 = _606 + _1131;
    float _1193 = fma(_650, _1031, _1163);
    int _1195 = as_type<int>(_1031);
    float _1197 = _1039;
    if (!_1105)
    {
        int _1199 = _1177 << 4;
        int _1201 = _1199 + _1187;
        _1195 = _1201;
    }
    int _1203 = _1195;
    float _1205 = fma(_650, _1065, _1189);
    float _1207 = _1193 + _1039;
    float _1209 = _1073;
    if (!_1135)
    {
        _1197 = _1191;
    }
    float _1211 = _1197;
    bool _1213 = !_1135;
    float _1215 = _1211;
    if (!_1213)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1221 = _1081 + _1219;
        float _1223 = rsqrt(_1055);
        float _1225 = _1221 * _1217;
        float _1227 = _1191 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = _1225 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = _1229 * 6.283185482025146484375;
        float _1237 = sin(_1235);
        float _1239 = _1233 + (-1.0);
        float _1241 = fma(_1237, _1227, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1243 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1245 = _1223 * _1241;
        float _1247 = fma(_1191, _1233, _1243);
        float _1249 = fma(_1045, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1251 = fma(_1021, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1215 = _1247;
        _1145 = _1249;
        _1147 = _1251;
        _1149 = _1223;
    }
    float _1253 = _1215;
    float _1255 = _1145;
    float _1257 = _1147;
    float _1259 = _1149;
    float _1261 = -_672;
    float _1263 = _1261 + _1253;
    float _1265 = -_640;
    float _1267 = _1265 + _1255;
    float _1269 = -_642;
    float _1271 = _1269 + _1257;
    float _1273 = _1205 + _1073;
    float _1275 = _1263;
    float _1277 = _1267;
    float _1279 = _1271;
    if (!_1121)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1283 = _682 + _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1287 = _646 + _1285;
        float _1289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1291 = -_610;
        float _1293 = _1291 + _1257;
        float _1295 = _1283 * _1283;
        float _1297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1299 = _650 + _1297;
        float _1301 = -_608;
        float _1303 = _1301 + _1255;
        float _1305 = fma(_1287, _1287, _1295);
        float _1307 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1309 = fma(_1299, _1299, _1305);
        float _1311 = sqrt(_1309);
        float _1313 = 1.0 / _854;
        float _1315 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1289;
        float _1321 = _1319 * _1313;
        float _1323 = -_606;
        float _1325 = _1323 + _1253;
        float _1327 = _1315 * _1321;
        float _1329 = _1293 * _1321;
        float _1331 = fma(_1325, _1327, _682);
        float _1333 = fma(_1303, _1327, _646);
        float _1335 = fma(_1315, _1329, _650);
        _1275 = _1331;
        _1277 = _1333;
        _1279 = _1335;
        _1209 = _1321;
    }
    float _1337 = _1275;
    float _1339 = _1277;
    float _1341 = _1279;
    float _1343 = _1209;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _1347 = _878 + 88;
    uint _1349 = uint(int(uint(_1347) >> uint(2)));
    uint _1351 = uint(int(uint(int(_1349)) >> uint(2)));
    int _1353 = int(_1349) & 3;
    float _1355 = (*spvDescriptorSet0.vp_c15)._m0[int(_1351)][_1353];
    int _1357 = int(_1349) + 1;
    uint _1359 = uint(int(uint(_1357) >> uint(2)));
    int _1361 = _1357 & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    float _1365 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1367 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1369 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1345);
    float _1371 = _1207 * _1161;
    float _1373 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1365);
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1377 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = _1259;
    if (!_1105)
    {
        int _1381 = _1203 + 400;
        uint _1383 = uint(int(uint(_1381) >> uint(2)));
        uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
        int _1387 = int(_1383) & 3;
        float _1389 = (*spvDescriptorSet0.vp_c15)._m0[int(_1385)][_1387];
        _1379 = _1389;
    }
    float _1391 = _1379;
    float _1393 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1373);
    float _1395 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1375);
    float _1397 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1401 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1405 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1409 = _1371 >= 0.0;
    float _1411 = _1273 * _1161;
    float _1413 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1405);
    float _1415 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1407);
    bool _1417 = _1371 <= 1.0;
    bool _1419 = _1417 && _1409;
    float _1421 = _1343;
    if (!_1105)
    {
        float _1423 = floor(_917);
        _1421 = _1423;
    }
    float _1425 = _1421;
    float _1427 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1429 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1415);
    bool _1431 = _1411 >= 0.0;
    bool _1433 = _1431 && _1419;
    float _1435 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1437 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1439 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1429);
    float _1441 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1443 = _1411 <= 1.0;
    bool _1445 = _1443 && _1433;
    float _1447 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1435);
    float _1449 = 1.0 / _1439;
    float _1451 = -_1441;
    float _1453 = fma(_1451, _1437, 1.0);
    float _1455 = _840 * _1099;
    float _1457 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1459 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1447);
    float _1461 = _1437;
    float _1463 = _1447;
    if (!_1105)
    {
        float _1465 = -_1183;
        float _1467 = _915 + _1465;
        _1151 = _1467;
    }
    float _1469 = _1151;
    float _1471 = fma(_646, _1091, _1455);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1457);
    float _1475 = log2(_1453);
    float _1477 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1459);
    if (!_1105)
    {
        float _1479 = -_1425;
        float _1481 = _917 + _1479;
        _1461 = _1481;
    }
    float _1483 = _1461;
    if (_1445)
    {
        float _1485 = float(_870);
        _1153 = _1485;
    }
    float _1487 = _1153;
    float _1489 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1473);
    float _1491 = _1477 * _1449;
    float _1493 = _1455;
    if (_1445)
    {
        float _1495 = rint(_1487);
        float _1497 = precise::max(_1495, 0.0);
        uint _1499 = uint(_1497);
        uint _1501 = clamp(_1499, 0u, 65535u);
        _1493 = as_type<float>(_1501);
    }
    float _1503 = _1493;
    float _1505 = fma(_650, _1355, _1471);
    float _1507 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1489);
    float _1509 = fma(_1491, -0.5, 0.5);
    float _1511 = _1505 + _1363;
    float _1513 = _1475 * 0.693147182464599609375;
    float _1515 = _1491;
    float _1517 = _1391;
    if (!_1105)
    {
        float _1519 = rint(_1391);
        float _1521 = precise::max(_1519, 0.0);
        uint _1523 = uint(_1521);
        uint _1525 = clamp(_1523, 0u, 65535u);
        _1515 = as_type<float>(_1525);
    }
    float _1527 = _1515;
    float _1529 = _1507 * _1449;
    float _1531 = _1511 * _1161;
    float _1533 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1535 = fma(_1529, 0.5, 0.5);
    float _1537 = _1449;
    if (_1445)
    {
        float3 _5030 = float3(_1371, _1411, float(as_type<int>(_1503)));
        float3 _5034 = select(_5030, float3(0.0), isnan(_5030));
        float _1539 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5034.xy, uint(rint(_5034.z)), _1531, level(0.0));
        _1537 = _1539;
    }
    float _1541 = _1537;
    float3 _5044 = float3(_1535, _1509, _1533);
    float _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5044, float3(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5044, float3(0.0), isnan(_5044)), level(0.0)).x;
    float3 _5053 = float3(_1535, _1509, _1533);
    float4 _1546 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5053, float3(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5053, float3(0.0), isnan(_5053)), level(0.0)).xyzw;
    float _1548 = _1546.x;
    float _1550 = _1546.y;
    float _1552 = _1546.z;
    float _1554 = _1546.w;
    float _1556 = _1483;
    if (!_1105)
    {
        float3 _5076 = float3(_1469, _1483, float(as_type<int>(_1527)));
        float3 _5078 = select(_5076, float3(0.0), isnan(_5076));
        float _1558 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5078.xy, uint(rint(_5078.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5078.xy, uint(rint(_5078.z)), level(0.0)).x;
        _1556 = _1558;
    }
    float _1560 = _1556;
    if (_1105)
    {
        _1463 = 1.0;
    }
    float _1562 = _1463;
    float _1564 = _1562;
    if (!_1105)
    {
        int _1566 = _1159 << 4;
        int _1568 = _1566 + 2048;
        uint _1570 = uint(int(uint(_1568) >> uint(2)));
        uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
        int _1574 = int(_1570) & 3;
        float _1576 = (*spvDescriptorSet0.vp_c15)._m0[int(_1572)][_1574];
        int _1578 = int(_1570) + 1;
        uint _1580 = uint(int(uint(_1578) >> uint(2)));
        int _1582 = _1578 & 3;
        float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
        int _1586 = _1568 + 8;
        uint _1588 = uint(int(uint(_1586) >> uint(2)));
        uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
        int _1592 = int(_1588) & 3;
        float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
        int _1596 = int(_1588) + 1;
        uint _1598 = uint(int(uint(_1596) >> uint(2)));
        int _1600 = _1596 & 3;
        float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
        float _1604 = _840 * _1584;
        float _1606 = fma(_646, _1576, _1604);
        float _1608 = fma(_650, _1594, _1606);
        float _1610 = _1608 + _1602;
        float _1612 = precise::clamp(_1610, 0.0, 1.0);
        float _1614 = -_1612;
        float _1616 = _1614 + _1560;
        float _1618 = fma(_1616, 500.0, 1.5);
        float _1620 = exp2(_1618);
        float _1622 = 0.0 + _1620;
        float _1624 = precise::clamp(_1622, 0.0, 1.0);
        _862 = _1604;
        _1165 = as_type<float>(_1568);
        _1564 = _1624;
    }
    float _1626 = _862;
    float _1628 = _1165;
    float _1630 = _1564;
    float _1632 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1634 = _1337 + _1632;
    float _1636 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1638 = _1339 + _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1642 = _1341 + _1640;
    float _1644 = _1634 * _1634;
    float _1646 = fma(_1638, _1638, _1644);
    float _1648 = fma(_1642, _1642, _1646);
    float _1650 = rsqrt(_1648);
    float _1652 = sqrt(_1648);
    float _1654 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1656 = _1638 * _1654;
    float _1658 = _1642 * _1654;
    float _1660 = _1656 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 + _1662;
    float _1666 = sqrt(_1664);
    bool _1668 = _1666 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = _1666 + _1670;
    float _1674 = _1626;
    float _1676 = _1664;
    float _1678 = _1672;
    float _1680 = _1656;
    float _1682 = _1658;
    float _1684 = _1660;
    float _1686 = _1662;
    if (_1668)
    {
        float _1688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1688;
    }
    float _1690 = _1674;
    if (_1668)
    {
        float _1692 = rsqrt(_1664);
        _1676 = _1692;
    }
    float _1694 = _1676;
    if (_1668)
    {
        float _1696 = _1672 * _1690;
        _1678 = _1696;
    }
    float _1698 = _1678;
    if (_1668)
    {
        float _1700 = _1698 * 0.15915493667125701904296875;
        _1517 = _1700;
    }
    float _1702 = _1517;
    float _1704 = _650;
    if (_1668)
    {
        float _1706 = _1702 * 6.283185482025146484375;
        float _1708 = sin(_1706);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1714 = precise::max(0.0, _1712);
    float _1716 = _1628;
    float _1718 = _1714;
    float _1720 = _1712;
    if (_1668)
    {
        float _1722 = _1702 * 6.283185482025146484375;
        float _1724 = cos(_1722);
        _1716 = _1724;
    }
    float _1726 = _1716;
    float _1728 = -_1654;
    float _1730 = -_1714;
    float _1732 = fma(_1634, _1728, _1730);
    float _1734 = _1732;
    if (_1668)
    {
        float _1736 = _1732 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1718 = _1736;
    }
    float _1738 = _1718;
    float _1740 = _1738;
    float _1742 = _1710;
    if (_1668)
    {
        float _1744 = fma(_1710, _1738, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1740 = _1744;
    }
    float _1746 = _1740;
    if (_1668)
    {
        float _1748 = _1726 + (-1.0);
        _1720 = _1748;
    }
    float _1750 = _1720;
    float _1752 = _1750;
    if (_1668)
    {
        float _1754 = _1694 * _1746;
        _1742 = _1754;
    }
    float _1756 = _1742;
    if (_1668)
    {
        float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1752 = _1758;
    }
    float _1760 = _1752;
    if (_1668)
    {
        float _1762 = _1656 * _1756;
        _1680 = _1762;
    }
    float _1764 = _1680;
    if (_1668)
    {
        float _1766 = _1658 * _1756;
        _1682 = _1766;
    }
    float _1768 = _1682;
    if (_1668)
    {
        float _1770 = fma(_1732, _1726, _1760);
        _1734 = _1770;
    }
    float _1772 = _1734;
    if (_1668)
    {
        float _1774 = _1764 * _1764;
        _1684 = _1774;
    }
    float _1776 = _1684;
    if (_1668)
    {
        float _1778 = _1768 * _1768;
        _1686 = _1778;
    }
    float _1780 = _1686;
    float _1782 = fma(_1772, _1772, _1776);
    float _1784 = _1782 + _1780;
    float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1788 = fma(_1652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1786);
    float _1790 = precise::clamp(_1788, 0.0, 1.0);
    float _1792 = -_1790;
    float _1794 = _1792 + 1.0;
    float _1796 = rsqrt(_1784);
    float _1798 = abs(_1794);
    float _1800 = log2(_1798);
    float _1802 = _1796 * _1764;
    float _1804 = _1796 * _1772;
    float _1806 = _1796 * _1768;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = _1804 + 1.0;
    float _1812 = -_1808;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1812);
    float _1816 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1818 = -_1806;
    float _1820 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1814);
    float _1822 = exp2(_1816);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = fma(_1820, 0.5, 0.5);
    float _1828 = fma(_1826, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = sqrt(_1824);
    float _1832 = fma(_1826, _1828, -0.212114393711090087890625);
    float _1834 = fma(_1826, _1832, 1.570728778839111328125);
    float _1836 = -_1804;
    float _1838 = fma(_1822, _1810, _1836);
    float _1840 = fma(_1838, 0.5, 0.5);
    float _1842 = _1830 * 0.636619746685028076171875;
    float _1844 = -_1834;
    float _1846 = fma(_1842, _1844, 1.0);
    float2 _5521 = float2(_1846, _1840);
    float3 _1850 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5521, float2(0.0), isnan(_5521)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5521, float2(0.0), isnan(_5521)), level(0.0)).xyz;
    float _1852 = _1850.x;
    float _1854 = _1850.y;
    float _1856 = _1850.z;
    float _1858 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1860 = -_668;
    float _1862 = _1860 + 1.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1876 = 1.0 / _1866;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1882;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _1890 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1892 = isnan(_574);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    out.m_75.x = _1339;
    out.m_75.y = _1337;
    out.m_75.z = _1341;
    float _1902 = 1.0 / _1870;
    bool _1904 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1906 = isnan(_574);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    bool _1916 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1918 = isnan(_574);
    bool _1920 = _1916 || _1918;
    bool _1922 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1924 = _1920 || _1922;
    float _1926 = float(_1924);
    float _1928 = 1.0 / _1874;
    float _1930 = _1884 * _1876;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1932;
    float _1936 = -_1900;
    float _1938 = _1936 + 1.0;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1948 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1950 = _1948 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1952 = 1.0 / _1880;
    float _1954 = _1888 * _1902;
    bool _1956 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1958 = isnan(_574);
    bool _1960 = _1956 || _1958;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1964 = _1960 || _1962;
    float _1966 = float(_1964);
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1968;
    float _1972 = -_1926;
    float _1974 = _1972 + 1.0;
    bool _1976 = _832 != 0.0;
    bool _1978 = isnan(_832);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.0);
    bool _1984 = _1980 || _1982;
    float _1986 = _1966 * _1938;
    float _1988 = _1934 * _1928;
    bool _1990 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1992 = isnan(_574);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = -_1966;
    float _2004 = _2002 + 1.0;
    float _2006 = 1.0 / _1950;
    bool _2008 = _830 == 0.0;
    bool _2010 = !_1984;
    bool _2012 = _2008 && _2010;
    float _2014 = _2000 * _2004;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2020 = _1942 * _1952;
    bool _2022 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2024 = isnan(_574);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2030 = _2026 || _2028;
    float _2032 = float(_2030);
    float _2034 = -_2000;
    float _2036 = _2034 + 1.0;
    float _2038 = 1.0 / _1946;
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2042 = _574 + _2040;
    bool _2044 = _834 == 0.0;
    bool _2046 = _2044 && _2012;
    float _2048 = _2032 * _2036;
    float _2050 = -_2032;
    float _2052 = _2050 + 1.0;
    float _2054 = 1.0 / _2018;
    float _2056 = _1970 * _2006;
    float _2058 = _1914 * _2052;
    float _2060 = -_1914;
    float _2062 = _2060 + 1.0;
    float _2064 = fma(_1930, _2042, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2066 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2068 = isnan(_574);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = _1926 * _2062;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2082 = _2080 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2084;
    float _2088 = _2076 * _1974;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2092 = _574 + _2090;
    float _2094 = _2082 * _2038;
    float _2096 = -_2076;
    float _2098 = _2096 + 1.0;
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2102 = _574 + _2100;
    float _2104 = fma(_1954, _2092, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2106 = _2086 * _2054;
    float _2108 = _2064 * _2088;
    float _2110 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2112 = _574 + _2110;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2116 = _574 + _2114;
    float _2118 = fma(_2020, _2102, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2120 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2108);
    float _2122 = fma(_1988, _2112, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2124 = fma(_2056, _2116, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2126 = exp2(_1858);
    float _2128 = fma(_2104, _2078, _2120);
    float _2130 = in.m_77.x;
    float _2132 = in.m_77.y;
    float _2134 = in.m_77.z;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2138 = _574 + _2136;
    float _2140 = fma(_2122, _2058, _2128);
    bool _2142 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2144 = isnan(_574);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2150 = _2146 || _2148;
    float _2152 = float(_2150);
    float _2154 = fma(_2094, _2138, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2156 = abs(_838);
    float _2158 = log2(_2156);
    float _2160 = fma(_2118, _2048, _2140);
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2164 = _574 + _2162;
    float _2166 = -_2152;
    float _2168 = _2166 + 1.0;
    float _2170 = fma(_2124, _2014, _2160);
    float _2172 = fma(_2106, _2164, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2174 = _1900 * _2168;
    float _2176 = -_2126;
    float _2178 = _2176 + 1.0;
    bool _2180 = _838 <= 8000.0;
    bool _2182 = isnan(_838);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(8000.0);
    bool _2188 = _2184 || _2186;
    float _2190 = float(_2188);
    float _2192 = fma(_2154, _1986, _2170);
    float _2194 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2196 = fma(_2172, _2174, _2192);
    float _2198 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2200 = _2130;
    float _2202 = _2134;
    float _2204 = _2132;
    if (!_2046)
    {
        float _2206 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2130);
        _2200 = _2206;
    }
    float _2208 = _2200;
    if (!_2046)
    {
        float _2210 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2134);
        _2202 = _2210;
    }
    float _2212 = _2202;
    if (!_2046)
    {
        float _2214 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2132);
        _2204 = _2214;
    }
    float _2216 = _2204;
    float _2218 = exp2(_2198);
    float _2220 = _1399 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2222 = _726 * _2216;
    float _2224 = _728 * _2216;
    float _2226 = _730 * _2216;
    float _2228 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2220);
    float _2230 = fma(_872, _2208, _2222);
    float _2232 = fma(_866, _2208, _2224);
    float _2234 = fma(_874, _2208, _2226);
    float _2236 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2228);
    float _2238 = fma(_1127, _2212, _2230);
    float _2240 = fma(_979, _2212, _2232);
    float _2242 = fma(_953, _2212, _2234);
    float _2244 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2236);
    float _2246 = fma(_2218, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2196);
    out.m_79.x = _2240;
    out.m_79.y = _2238;
    out.m_79.z = _2242;
    float _2252 = fma(_2248, -2.0, 3.0);
    float _2254 = _2248 * _2248;
    out.gl_Position.x = _1507;
    out.gl_Position.y = _1477;
    out.gl_Position.z = _2244;
    out.gl_Position.w = _1439;
    float _2256 = _2254 * _2252;
    out.m_81.x = _2250;
    float _2258 = -_2256;
    float _2260 = _2258 + 1.0;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2256);
    float _2264 = _2244 + _1439;
    float _2266 = _2190 * _2262;
    float _2268 = _2264 * 0.5;
    float _2270 = _2264;
    float _2272 = _2260;
    if (!_1445)
    {
        _2270 = 1.0;
    }
    float _2274 = _2270;
    float _2276 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2278 = _2274;
    if (_1445)
    {
        bool _2280 = _1541 >= _1531;
        bool _2282 = isnan(_1541);
        bool _2284 = _2280 || _2282;
        bool _2286 = isnan(_1531);
        bool _2288 = _2284 || _2286;
        float _2290 = float(_2288);
        _2278 = _2290;
    }
    float _2292 = _2278;
    out.m_83.z = _2268;
    out.m_83.w = _1439;
    bool _2294 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2296 = isnan(_1652);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2302 = _2298 || _2300;
    float _2304 = _1862 * _2276;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    float _2308 = _2194 * _1543;
    float _2310 = _2292 * _1630;
    float _2312 = -_2194;
    float _2314 = _2312 + 1.0;
    float _2316 = -_2306;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2320 = _1554 * _2308;
    float _2322 = _1554 * _2314;
    float _2324 = -_2310;
    float _2326 = fma(_2324, _2318, 1.0);
    float _2328 = precise::clamp(_2326, 0.0, 1.0);
    float _2330 = _2328 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2332 = _2328;
    float _2334 = _2308;
    if (!_2302)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2336 = _2272;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2302)
    {
        _2332 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2342 = _2332;
    out.m_85.x = _2330;
    float _2344 = _1856 * _2308;
    float _2346 = fma(_1852, _2320, _1548);
    float _2348 = fma(_1854, _2320, _1550);
    float _2350 = _2342;
    float _2352 = _2342;
    if (!_2302)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2354 = _2334;
    float _2356 = fma(_1554, _2344, _1552);
    out.m_87.x = _2346;
    out.m_87.y = _2348;
    out.m_87.z = _2356;
    out.m_87.w = _2322;
    bool _2358 = !_2302;
    float _2360 = _2354;
    float _2362 = _2354;
    if (!_2358)
    {
        bool _2364 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2366 = isnan(_1652);
        bool _2368 = _2364 || _2366;
        bool _2370 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2372 = _2368 || _2370;
        if (!_2372)
        {
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2376 = _1652 + _2374;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2380 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2378;
            float _2382 = 1.0 / _2380;
            float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2386 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2390 = _2388 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2392 = _2376 * _2382;
            float _2394 = precise::clamp(_2392, 0.0, 1.0);
            float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2400 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2394, _2398, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2404 = fma(_2394, _2386, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _2340 = _2404;
            _2362 = _2402;
            _2352 = _2400;
            _2406 = true;
        }
        else
        {
            bool _2408 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2410 = isnan(_1652);
            bool _2412 = _2408 || _2410;
            bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2416 = _2412 || _2414;
            if (!_2416)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2418 = _2360;
            _2362 = _2418;
            if (!_2416)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2420 = _2338;
            _2340 = _2420;
            if (!_2416)
            {
                _2350 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2422 = _2350;
            bool _2424 = !_2416;
            _2352 = _2422;
            if (!_2424)
            {
                bool _2426 = _1652 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2428 = isnan(_1652);
                bool _2430 = _2426 || _2428;
                bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2434 = _2430 || _2432;
                if (!_2434)
                {
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2438 = _1652 + _2436;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2442 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2440;
                    float _2444 = 1.0 / _2442;
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2454 = _2438 * _2444;
                    float _2456 = precise::clamp(_2454, 0.0, 1.0);
                    float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2462 = fma(_2456, _2452, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2464 = fma(_2456, _2460, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2466 = fma(_2456, _2448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _2340 = _2466;
                    _2362 = _2464;
                    _2352 = _2462;
                    _2406 = true;
                }
                else
                {
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2352 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2406 = false;
    float _2468 = _2340;
    float _2470 = _2362;
    float _2472 = _2352;
    float _2474 = _2468 * 0.586610972881317138671875;
    bool _2476 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = 1.0;
    float _2478 = fma(_2470, 0.298911988735198974609375, _2474);
    out.m_89.x = 0.0;
    float _2480 = fma(_2472, 0.114477999508380889892578125, _2478);
    float _2482 = -_2480;
    float _2484 = _2482 + _2470;
    float _2486 = -_2480;
    float _2488 = _2486 + _2468;
    float _2490 = -_2480;
    float _2492 = _2490 + _2472;
    float _2494 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2496 = fma(_2484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    float _2498 = fma(_2488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    float _2500 = fma(_2492, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2480);
    out.m_85.w = _2494;
    out.m_91.x = _2496;
    out.m_91.y = _2498;
    out.m_91.z = _2500;
    if (!_2476)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2502 = -_1337;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2506 = -_1339;
    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2510 = -_1341;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2514 = _2504 * _2504;
    float _2516 = fma(_2508, _2508, _2514);
    float _2518 = fma(_2512, _2512, _2516);
    float _2520 = sqrt(_2518);
    float _2522 = rsqrt(_2518);
    float _2524 = -_2520;
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2528 = _2526 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2530 = precise::clamp(_2528, 0.0, 1.0);
    float _2532 = _2508 * _2522;
    float _2534 = _2504 * _2522;
    float _2536 = abs(_2530);
    float _2538 = log2(_2536);
    float _2540 = _2512 * _2522;
    float _2542 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2544 = _2238 * _2534;
    float _2546 = -_2534;
    float _2548 = -_2542;
    float _2550 = fma(_2546, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2548);
    float _2552 = fma(_2240, _2532, _2544);
    float _2554 = -_2540;
    float _2556 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2550);
    float _2558 = fma(_2242, _2540, _2552);
    float _2560 = precise::clamp(_2558, 0.0, 1.0);
    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2564 = _2556 + _2562;
    float _2566 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = exp2(_2566);
    float _2574 = _2572 * _2570;
    float _2576 = _2560 * _2574;
    float _2578 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2582 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2578;
    out.m_89.y = _2580;
    out.m_89.z = _2582;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

