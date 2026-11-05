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
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2458 = false;
    bool _1292 = false;
    bool _464 = false;
    bool _308 = false;
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
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2704 = as_type<float>(_126);
        out.gl_Position.z = _2704;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_63.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    if (_140)
    {
        float _148 = float(_112);
        _146 = _148;
    }
    float _150 = _146;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = 0.0;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    float _162 = _160;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _164 = _160 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2773 = as_type<float>(_166);
        out.gl_Position.z = _2773;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_65.w;
    float _170 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _194 = _170;
    if (!_180)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _162 = _198;
    }
    float _200 = _162;
    float _202 = _200;
    if (!_180)
    {
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_180;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _170 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _170);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_180;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _170 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _194 = _264;
    }
    float _266 = _194;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _276 = fma(_266, _182, _270);
    float _278 = fma(_266, _184, _272);
    float _280 = fma(_266, _186, _274);
    float _282 = fma(_276, _168, _188);
    float _284 = fma(_278, _168, _190);
    float _286 = fma(_280, _168, _192);
    bool _288 = !_268;
    float _306;
    if (!_288)
    {
        float _290 = in.m_67.x;
        float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _294 = _290 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _298 = _296 * _292;
        float _300 = floor(_298);
        float _302 = -_300;
        float _304 = _298 + _302;
        _306 = _304;
        _308 = true;
    }
    else
    {
        float _310 = float(_112);
        float _312 = 1.0 / _310;
        float _314 = _144 * _312;
        _306 = _314;
    }
    _308 = false;
    float _316 = _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _320 = _316 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = isnan(_316);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _342 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _344 = isnan(_316);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _354;
    bool _358 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _360 = isnan(_316);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = 1.0 / _324;
    float _372 = -_336;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _378 = _352 * _374;
    float _380 = -_352;
    float _382 = _380 + 1.0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _386 = 1.0 / _340;
    float _388 = _356 * _370;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _394 = fma(_388, _320, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = -_368;
    float _398 = _396 + 1.0;
    float _400 = _394 * _378;
    float _402 = _392 * _386;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _406 = _316 + _404;
    float _408 = _336 * _398;
    float _410 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[115].x, _400);
    float _412 = fma(_402, _406, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _414 = fma(_412, _408, _410);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[117].x, _414);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _430 = _416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _436;
    out.m_69.y = _438;
    out.m_69.z = _440;
    out.m_69.w = _384;
    out.m_71.x = _430;
    out.m_71.y = _432;
    out.m_71.z = _434;
    out.m_71.w = _442;
    bool _444 = !_376;
    float _462;
    if (!_444)
    {
        float _446 = in.m_67.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_112);
        float _468 = 1.0 / _466;
        float _470 = _144 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_73.y;
    float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _490 = 1.0 / _480;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _496;
    bool _500 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _502 = isnan(_472);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _484;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _516 = 1.0 / _494;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _526 = _524 * _490;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _532 = 1.0 / _488;
    float _534 = _520 * _512;
    bool _536 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _538 = isnan(_472);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    bool _548 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _550 = isnan(_472);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _530 * _516;
    bool _562 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _564 = isnan(_472);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_558;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _584 = -_572;
    float _586 = _584 + 1.0;
    float _588 = _498 * _532;
    float _590 = -_546;
    float _592 = _590 + 1.0;
    float _594 = _510 * _586;
    float _596 = -_510;
    float _598 = _596 + 1.0;
    float _600 = 1.0 / _580;
    float _602 = _558 * _592;
    float _604 = _572 * _576;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _610 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _612 = isnan(_472);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _624 = _472 + _622;
    bool _626 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _628 = isnan(_472);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = 1.0 / _608;
    float _640 = fma(_534, _624, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _642 = _620 * _598;
    bool _644 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _646 = isnan(_472);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_620;
    float _658 = _656 + 1.0;
    float _660 = _654 * _658;
    float _662 = -_654;
    float _664 = _662 + 1.0;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _678 = _636 * _664;
    float _680 = 1.0 / _668;
    float _682 = _672 * _600;
    float _684 = _676 * _638;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _688 = _472 + _686;
    float _690 = _640 * _678;
    float _692 = -_636;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _698 = _472 + _696;
    float _700 = fma(_526, _688, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[159].x, _690);
    float _704 = fma(_588, _698, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _472 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _712 = _472 + _710;
    float _714 = fma(_700, _660, _702);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _722 = _472 + _720;
    float _724 = fma(_560, _708, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _726 = fma(_704, _642, _714);
    float _728 = _718 * _680;
    float _730 = fma(_682, _722, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _732 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _734 = isnan(_472);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = in.m_75.x;
    float _746 = in.m_75.y;
    float _748 = in.m_75.z;
    float _750 = in.m_75.w;
    float _752 = fma(_724, _594, _726);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _756 = _472 + _754;
    float _758 = fma(_684, _712, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _760 = fma(_730, _604, _752);
    float _762 = -_742;
    float _764 = _762 + 1.0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = fma(_728, _756, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _774 = _772 != 0;
    float _776 = fma(_758, _602, _760);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _780 = _778 != 0;
    float _782 = _546 * _764;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _786 = _784 != 0;
    float _788 = in.m_67.x;
    float _790 = fma(_770, _782, _776);
    float _792 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = in.m_65.x;
    float _796 = in.m_65.y;
    float _798 = in.m_65.z;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _802 = _800 != 0;
    float _804 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[166].x, _790);
    float _806 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _808 = in.m_67.y;
    float _810 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = -_750;
    float _814 = _812 + 1.0;
    float _816 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _818 = in.m_67.w;
    float _820 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _806);
    float _822 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    bool _824 = _804 >= _814;
    bool _826 = isnan(_804);
    bool _828 = _824 || _826;
    bool _830 = isnan(_814);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = in.m_73.x;
    float _838 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _816);
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _842 = _834 * _744;
    float _844 = _834 * _746;
    float _846 = _834 * _748;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _850 = _792;
    float _852 = _594;
    float _854 = _788;
    float _856 = _474;
    if (_774)
    {
        float _858 = in.m_67.z;
        _850 = _858;
    }
    float _860 = _850;
    float _862 = _838 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _864 = _796 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _868 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _870 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _872 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_802)
    {
        _852 = _808;
    }
    float _874 = _852;
    float _876 = -_866;
    float _878 = fma(_868, 2.0, _876);
    float _880 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _882 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _884 = fma(_872, -2.0, _848);
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _888 = -_474;
    float _890 = _888 + 1.0;
    bool _892 = _818 > 0.5;
    float _894 = _798 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _896 = _874;
    bool _898 = _892;
    if (_802)
    {
        _896 = _788;
    }
    float _900 = _896;
    float _902 = _798;
    if (!_802)
    {
        float _904 = in.m_67.z;
        _902 = _904;
    }
    float _906 = _902;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _910 = _892 ? as_type<int>(_890) : as_type<int>(_474);
    float _912 = _864 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_768)
    {
        bool _914 = _788 > 0.5;
        _898 = _914;
    }
    bool _916 = _898;
    float _918 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _908);
    float _920 = _780 ? as_type<float>(_910) : _474;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _924 = _808 > 0.5;
    float _926 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _928 = _886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _930 = _836;
    if (!_768)
    {
        _854 = _836;
    }
    float _932 = _854;
    float _934 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _922);
    float _936 = _932;
    if (_786)
    {
        float _938 = _924 ? _890 : _474;
        _856 = _938;
    }
    float _940 = _856;
    float _942 = fma(_920, _928, -0.5);
    float _944 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _946 = false;
    float _948 = _860;
    if (_774)
    {
        bool _950 = _860 > 0.5;
        _946 = _950;
    }
    bool _952 = _946;
    float _954 = _840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_768)
    {
        _948 = _932;
    }
    float _956 = _948;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _844);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _842);
    float _962 = _956;
    if (_768)
    {
        _936 = _836;
    }
    float _964 = _936;
    float _966 = fma(_954, _940, -0.5);
    float _968 = _912 * _958;
    float _970 = _906;
    float _972 = _964;
    if (!_802)
    {
        _930 = _906;
    }
    float _974 = _930;
    float _976 = _926 * _960;
    float _978 = _974;
    if (_802)
    {
        _978 = _808;
    }
    float _980 = _978;
    float _982 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_802)
    {
        _970 = _808;
    }
    float _984 = _970;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _846);
    float _988 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _990 = 0;
    if (_768)
    {
        float _992 = -_964;
        float _994 = _992 + 1.0;
        _990 = as_type<int>(_994);
    }
    int _996 = _990;
    float _998 = _944 * _986;
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _982);
    float _1002 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _1004 = _882 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1000);
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1002);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1014 = 0;
    float _1016 = _1004;
    if (_774)
    {
        float _1018 = -_964;
        float _1020 = _1018 + 1.0;
        _1014 = as_type<int>(_1020);
    }
    int _1022 = _1014;
    float _1024 = _862 + _1008;
    float _1026 = _1004 + _1010;
    float _1028 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1012);
    float _1030 = _900 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1034 = _1024 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1038 = _1026 + _1036;
    float _1040 = _1024;
    if (_768)
    {
        float _1042 = _916 ? as_type<float>(_996) : _964;
        _962 = _1042;
    }
    float _1044 = _962;
    float _1046 = -_1006;
    float _1048 = fma(_1030, 2.0, _1046);
    float _1050 = _1034 * _1034;
    float _1052 = _1038 * _1038;
    float _1054 = _1050;
    float _1056 = _1052;
    if (_774)
    {
        float _1058 = _952 ? as_type<float>(_1022) : _964;
        _972 = _1058;
    }
    float _1060 = _972;
    float _1062 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1064 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[83].w, _514);
    float _1066 = _1050 + _1052;
    float _1068 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _934);
    float _1070 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _884);
    float _1072 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1062);
    float _1074 = sqrt(_1066);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1078 = _980 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1080 = _476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1082 = -_1070;
    float _1084 = fma(_1068, _966, _1082);
    float _1086 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1072);
    float _1088 = _880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1090 = _582 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1092 = fma(_1078, -2.0, _1076);
    float _1094 = fma(_1080, _1044, -0.5);
    float _1096 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    float _1098 = -_144;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _1102 = _1088 + _1086;
    float _1104 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1028);
    float _1106 = -_144;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1048);
    float _1110 = fma(_1090, _1060, -0.5);
    bool _1112 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1064);
    float _1116 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1092);
    float _1118 = fma(_1096, _1094, _1100);
    float _1120 = fma(_1104, _1110, _1108);
    float _1122 = _1096;
    float _1124 = _1094;
    float _1126 = _1090;
    float _1128 = _1120;
    if (!_1112)
    {
        _1122 = _1026;
    }
    float _1130 = _1122;
    float _1132 = _1130;
    if (!_1112)
    {
        _1124 = _1102;
    }
    float _1134 = _1124;
    bool _1136 = !_1112;
    float _1138 = _1134;
    if (!_1136)
    {
        float _1140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1144 = _1074 + _1142;
        float _1146 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = rsqrt(_1066);
        float _1150 = _1144 * _1140;
        float _1152 = _1150 * 0.15915493667125701904296875;
        float _1154 = _1152 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        float _1158 = _1152 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        float _1162 = fma(_1156, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1164 = _1148 * _1162;
        float _1166 = _1160 + (-1.0);
        float _1168 = fma(_1034, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1170 = fma(_1038, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1172 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1176 = _1168 + _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1180 = _1170 + _1178;
        float _1182 = fma(_1102, _1160, _1172);
        float _1184 = _1176 * _1176;
        float _1186 = _1180 * _1180;
        _1138 = _1182;
        _1054 = _1184;
        _1056 = _1186;
        _1040 = _1168;
        _1132 = _1170;
    }
    float _1188 = _1138;
    float _1190 = _1054;
    float _1192 = _1056;
    float _1194 = _1040;
    float _1196 = _1132;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1200 = _1188 + _1198;
    float _1202 = _844 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1204 = _842 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1206 = -_1116;
    float _1208 = fma(_1114, _942, _1206);
    float _1210 = fma(_1200, _1200, _1190);
    float _1212 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1218 = _1210 + _1192;
    float _1220 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1212);
    float _1224 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1214);
    float _1226 = sqrt(_1218);
    float _1228 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1216);
    float _1230 = _1084 + 0.5;
    float _1232 = _1118 + 0.5;
    float _1234 = _1208 + 0.5;
    float _1236 = _1120 + 0.5;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1222);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1224);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1228);
    out.m_77.w = _750;
    out.m_79.x = _1232;
    out.m_79.y = _1230;
    out.m_79.z = _1236;
    out.m_79.w = _1234;
    bool _1244 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1246 = isnan(_1226);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1252 = _1248 || _1250;
    out.m_81.x = _804;
    out.m_83.x = _1238;
    out.m_83.y = _1240;
    out.m_83.z = _1242;
    float _1254 = _1192;
    float _1256 = _1194;
    if (!_1252)
    {
        _1126 = 1.0;
    }
    float _1258 = _1126;
    bool _1260 = !_1252;
    float _1262 = _1258;
    if (!_1260)
    {
        bool _1264 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1266 = isnan(_1226);
        bool _1268 = _1264 || _1266;
        bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1272 = _1268 || _1270;
        if (!_1272)
        {
            float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1276 = _1226 + _1274;
            float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1280 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1278;
            float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1284 = _1282 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1286 = 1.0 / _1280;
            float _1288 = _1276 * _1286;
            float _1290 = fma(_1288, _1284, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1262 = _1290;
            _1292 = true;
        }
        else
        {
            bool _1294 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1296 = isnan(_1226);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1302 = _1298 || _1300;
            if (!_1302)
            {
                float _1304 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1306 = _1226 + _1304;
                float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1310 = _1308 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1314 = _1312 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1316 = 1.0 / _1310;
                float _1318 = _1306 * _1316;
                float _1320 = fma(_1318, _1314, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1262 = _1320;
                _1292 = true;
            }
            else
            {
                _1262 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1292 = false;
    float _1322 = _1262;
    float _1324 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1328 = _1194 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1332 = _1196 + _1330;
    float _1334 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1324);
    float _1336 = fma(_1328, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1338 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1340 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1344 = _1336 + _1342;
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1348 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1340);
    float _1350 = 1.0 / _1346;
    float _1352 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1348);
    float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1356 = _1188 + _1354;
    float _1358 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1362 = fma(_1356, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1364 = fma(_1332, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1366 = floor(_1358);
    float _1368 = _1360 + _1346;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1362 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1364 + _1374;
    float _1378 = _1372 * _1372;
    float _1380 = _1368 * _1350;
    float _1382 = _1380 * 0.5;
    float _1384 = fma(_1344, _1344, _1378);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1388 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1386);
    float _1390 = fma(_1376, _1376, _1384);
    float _1392 = 1.0 / _1388;
    float _1394 = rsqrt(_1390);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1398 = _1392 * _1396;
    float _1400 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1402 = sqrt(_1390);
    bool _1404 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1406 = _1088 + _1400;
    bool _1408 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1410 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    bool _1412 = !_1404;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1420 = _1344 * _1410;
    float _1422 = _1376 * _1410;
    float _1424 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1416);
    float _1426 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1418);
    float _1428 = _1420 * _1420;
    float _1430 = _1422 * _1422;
    int _1432 = 2;
    float _1434 = _1422;
    float _1436 = _1428;
    float _1438 = _1420;
    if (!_1404)
    {
        _1432 = 1;
    }
    int _1440 = _1432;
    float _1442 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1424);
    int _1444 = _1440;
    if (!_1408)
    {
        _1444 = _1414;
    }
    int _1446 = _1444;
    float _1448 = _1428 + _1430;
    float _1450 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1426);
    float _1452 = _1442 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1454 = _1446 << 6;
    float _1456 = sqrt(_1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1460 = _1454 + 96;
    uint _1463 = uint(int(uint(_1460) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    float _1479 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1481 = trunc(_1452);
    int _1483 = int(_1481);
    float _1485 = trunc(_1458);
    int _1487 = int(_1485);
    bool _1489 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1456 + _1491;
    int _1495 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1497 = _1483 + _1495;
    int _1499 = _1497 + 1;
    float _1501 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1503 = floor(_1479);
    bool _1505 = _1499 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1507 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1501);
    float _1509 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1511 = 0.0;
    float _1513 = _1493;
    int _1515 = _1499;
    float _1517 = _1458;
    if (!_1489)
    {
        _1511 = _1420;
    }
    float _1519 = _1511;
    int _1521 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1523 = _1487 + _1521;
    int _1525 = _1523 + 1;
    float _1527 = _1332;
    float _1529 = _1519;
    if (_1489)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1531;
    }
    float _1533 = _1527;
    float _1535 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    int _1537 = _1499 | _1525;
    float _1539 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1541 = _1537 < 0;
    bool _1543 = _1541 || _1505;
    float _1545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (_1489)
    {
        float _1549 = rsqrt(_1448);
        _1254 = _1549;
    }
    float _1551 = _1254;
    bool _1553 = _1525 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1555 = _1553 || _1543;
    float _1557 = -_1503;
    float _1559 = _1479 + _1557;
    float _1561 = precise::max(0.0, _1545);
    float _1563 = -_1547;
    float _1565 = fma(_1563, _1509, 1.0);
    float _1567 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1489)
    {
        float _1569 = _1493 * _1533;
        _1513 = _1569;
    }
    float _1571 = _1513;
    float _1573 = _1406 * _1477;
    float _1575 = -_1410;
    float _1577 = -_1561;
    float _1579 = fma(_1372, _1575, _1577);
    float _1581 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1489)
    {
        float _1583 = _1571 * 0.15915493667125701904296875;
        _1256 = _1583;
    }
    float _1585 = _1256;
    float _1587 = fma(_862, _1469, _1573);
    int _1589 = _1454 + 104;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    float _1607 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1567);
    float _1609 = _1188;
    if (_1489)
    {
        float _1611 = _1585 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        _1609 = _1613;
    }
    float _1615 = _1609;
    float _1617 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1581);
    float _1619 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1621 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1607);
    float _1623 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1617);
    float _1625 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1619);
    float _1627 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1629 = _1617;
    if (_1489)
    {
        float _1631 = _1585 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        _1629 = _1633;
    }
    float _1635 = _1629;
    int _1637 = _1454 + 48;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c15)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c15)._m0[int(_1649)][_1651];
    if (_1489)
    {
        float _1655 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1128 = _1655;
    }
    float _1657 = _1128;
    if (!_1555)
    {
        int _1659 = _1525 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1661 = _1659 + _1499;
        _1515 = _1661;
    }
    int _1663 = _1515;
    float _1665 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1625);
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1669 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1667);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1675 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1677 = 0.0;
    float _1679 = _1671;
    if (_1489)
    {
        float _1681 = fma(_1615, _1657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1677 = _1681;
    }
    float _1683 = _1677;
    int _1685 = _1454 + 64;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    float _1703 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1675);
    float _1707 = 0.0;
    if (_1489)
    {
        float _1709 = _1551 * _1683;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = -_1671;
    float _1715 = _1713 + 1.0;
    float _1717 = 0.0;
    if (!_1489)
    {
        _1717 = _1579;
    }
    float _1719 = _1717;
    float _1721 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1705);
    float _1723 = _1719;
    int _1725 = as_type<int>(_1721);
    if (_1489)
    {
        float _1727 = _1635 + (-1.0);
        _1679 = _1727;
    }
    float _1729 = _1679;
    int _1731 = _1454 + 56;
    uint _1733 = uint(int(uint(_1731) >> uint(2)));
    uint _1735 = uint(int(uint(int(_1733)) >> uint(2)));
    int _1737 = int(_1733) & 3;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
    int _1741 = int(_1733) + 1;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    int _1745 = _1741 & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    if (_1489)
    {
        float _1749 = _1420 * _1711;
        _1529 = _1749;
    }
    float _1751 = _1529;
    if (_1489)
    {
        float _1753 = _1422 * _1711;
        _1434 = _1753;
    }
    float _1755 = _1434;
    float _1757 = 0.0;
    if (_1489)
    {
        float _1759 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1721);
    if (_1489)
    {
        float _1765 = _1751 * _1751;
        _1436 = _1765;
    }
    float _1767 = _1436;
    int _1769 = as_type<int>(_1767);
    if (!_1489)
    {
        _1438 = _1430;
    }
    float _1771 = _1438;
    float _1773 = _1771;
    if (_1489)
    {
        float _1775 = fma(_1579, _1635, _1761);
        _1723 = _1775;
    }
    float _1777 = _1723;
    int _1779 = _1454 + 72;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    if (!_1555)
    {
        int _1797 = _1663 << 2;
        _1725 = _1797;
    }
    int _1799 = _1725;
    int _1801 = _1799;
    if (_1489)
    {
        float _1803 = _1755 * _1755;
        _1773 = _1803;
    }
    float _1805 = _1773;
    float _1807 = fma(_1777, _1777, _1767);
    if (!_1555)
    {
        uint _1809 = uint(int(uint(_1663) >> uint(2)));
        _1769 = int(_1809);
    }
    int _1811 = _1769;
    float _1813 = abs(_1715);
    float _1815 = log2(_1813);
    float _1817 = as_type<float>(_1811);
    if (!_1555)
    {
        int _1819 = 12 & _1799;
        _1801 = _1819;
    }
    int _1821 = _1801;
    float _1823 = _1807 + _1805;
    int _1825 = _1454 + 80;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    uint _1829 = uint(int(uint(int(_1827)) >> uint(2)));
    int _1831 = int(_1827) & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    int _1835 = int(_1827) + 1;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    int _1839 = _1835 & 3;
    float _1841 = (*spvDescriptorSet0.vp_c15)._m0[int(_1837)][_1839];
    float _1843 = -_1366;
    float _1845 = _1358 + _1843;
    if (!_1555)
    {
        int _1847 = _1811 << 4;
        int _1849 = _1847 + _1821;
        _1817 = as_type<float>(_1849);
    }
    float _1851 = _1817;
    float _1853 = fma(_1004, _1597, _1587);
    float _1855 = 1.0 / _1763;
    int _1857 = _1454 + 88;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
    float _1875 = _1853 + _1605;
    float _1877 = rsqrt(_1823);
    float _1879 = _1406 * _1653;
    float _1881 = _1851;
    if (!_1555)
    {
        int _1883 = as_type<int>(_1851) + 400;
        uint _1885 = uint(int(uint(_1883) >> uint(2)));
        uint _1887 = uint(int(uint(int(_1885)) >> uint(2)));
        int _1889 = int(_1885) & 3;
        float _1891 = (*spvDescriptorSet0.vp_c15)._m0[int(_1887)][_1889];
        _1881 = _1891;
    }
    float _1893 = _1881;
    float _1895 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1897 = fma(_862, _1645, _1879);
    float _1899 = 1.0 / _1875;
    float _1901 = _1406 * _1701;
    float _1903 = fma(_862, _1693, _1901);
    float _1905 = _1877 * _1751;
    float _1907 = _1877 * _1777;
    float _1909 = fma(_1004, _1739, _1897);
    float _1911 = _1877 * _1755;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1915 = _1739;
    if (!_1555)
    {
        float _1917 = floor(_1458);
        _1915 = _1917;
    }
    float _1919 = _1915;
    float _1921 = _1909 + _1747;
    float _1923 = -_1913;
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1923);
    float _1927 = fma(_1004, _1787, _1903);
    float _1929 = _1921 * _1899;
    float _1931 = -_1911;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1925);
    float _1935 = exp2(_1895);
    float _1937 = _1927 + _1795;
    float _1939 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1941 = _1929 >= 0.0;
    float _1943 = fma(_1933, -0.5, 0.5);
    float _1945 = _1406 * _1841;
    float _1947 = fma(_1933, 0.5, 0.5);
    bool _1949 = _1929 <= 1.0;
    bool _1951 = _1949 && _1941;
    float _1953 = log2(_1565);
    float _1955 = fma(_862, _1833, _1945);
    float _1957 = _1937 * _1899;
    float _1959 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1939);
    float _1961 = _1943;
    if (!_1555)
    {
        float _1963 = -_1919;
        float _1965 = _1458 + _1963;
        _1517 = _1965;
    }
    float _1967 = _1517;
    float _1969 = fma(_1004, _1865, _1955);
    bool _1971 = _1957 >= 0.0;
    bool _1973 = _1971 && _1951;
    float _1975 = _1969 + _1873;
    float _1977 = sqrt(_1943);
    float _1979 = fma(_1947, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1981 = _1957 <= 1.0;
    bool _1983 = _1981 && _1973;
    float _1985 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1959);
    float _1989 = fma(_1947, _1979, -0.212114393711090087890625);
    float _1991 = _1907 + 1.0;
    float _1993 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1995 = _1841;
    if (!_1555)
    {
        float _1997 = floor(_1452);
        _1995 = _1997;
    }
    float _1999 = _1995;
    float _2001 = fma(_1947, _1989, 1.570728778839111328125);
    float _2003 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1987);
    float _2005 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1993);
    float _2007 = -_1907;
    float _2009 = fma(_1935, _1991, _2007);
    float _2011 = _1953 * 0.693147182464599609375;
    float _2013 = _2003 * _1855;
    float _2015 = _2013;
    float _2017 = _2003;
    if (_1983)
    {
        float _2019 = float(_1446);
        _1961 = _2019;
    }
    float _2021 = _1961;
    float _2023 = _1979;
    if (!_1555)
    {
        float _2025 = rint(_1893);
        float _2027 = precise::max(_2025, 0.0);
        uint _2029 = uint(_2027);
        uint _2031 = clamp(_2029, 0u, 65535u);
        _2023 = as_type<float>(_2031);
    }
    float _2033 = _2023;
    float _2035 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2037 = _1977 * 0.636619746685028076171875;
    float _2039 = fma(_2013, 0.5, 0.5);
    float _2041 = fma(_2009, 0.5, 0.5);
    float _2043 = _2035 * _1855;
    float _2045 = -_2001;
    float _2047 = fma(_2037, _2045, 1.0);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2051 = _2021;
    if (_1983)
    {
        float _2053 = rint(_2021);
        float _2055 = precise::max(_2053, 0.0);
        uint _2057 = uint(_2055);
        uint _2059 = clamp(_2057, 0u, 65535u);
        _2051 = as_type<float>(_2059);
    }
    float _2061 = _2051;
    if (!_1555)
    {
        float _2063 = -_1999;
        float _2065 = _1452 + _2063;
        _2015 = _2065;
    }
    float _2067 = _2015;
    float _2069 = _1975 * _1899;
    float _2071 = fma(_2043, -0.5, 0.5);
    float2 _5942 = float2(_1559, _1845);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).x;
    float _2075 = _1967;
    if (!_1555)
    {
        float3 _5959 = float3(_2067, _1967, float(as_type<int>(_2033)));
        float3 _5963 = select(_5959, float3(0.0), isnan(_5959));
        float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5963.xy, uint(rint(_5963.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5963.xy, uint(rint(_5963.z)), level(0.0)).x;
        _2075 = _2077;
    }
    float _2079 = _2075;
    float _2081 = _2061;
    if (_1983)
    {
        float3 _5978 = float3(_1929, _1957, float(as_type<int>(_2061)));
        float3 _5980 = select(_5978, float3(0.0), isnan(_5978));
        float _2083 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5980.xy, uint(rint(_5980.z)), _2069, level(0.0));
        _2081 = _2083;
    }
    float _2085 = _2081;
    float3 _5990 = float3(_2039, _2071, _2049);
    float _2087 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5990, float3(0.0), isnan(_5990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5990, float3(0.0), isnan(_5990)), level(0.0)).x;
    float3 _5999 = float3(_2039, _2071, _2049);
    float4 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5999, float3(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5999, float3(0.0), isnan(_5999)), level(0.0)).xyzw;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = _2090.w;
    float2 _6015 = float2(_2047, _2041);
    float3 _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6015, float2(0.0), isnan(_6015)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6015, float2(0.0), isnan(_6015)), level(0.0)).xyz;
    float _2104 = _2102.x;
    float _2106 = _2102.y;
    float _2108 = _2102.z;
    float _2110 = abs(_1398);
    float _2112 = log2(_2110);
    float _2114 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2116 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2118 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2114);
    float _2120 = _2003 + _1763;
    float _2122 = exp2(_2116);
    float _2124 = _2120 * 0.5;
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2128 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2118);
    float _2130 = _1763 * 0.5;
    float _2132 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2128);
    float _2134 = exp2(_2126);
    float _2136 = fma(_2035, -0.5, _2130);
    float _2138 = _2132 + _1763;
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2035;
    out.gl_Position.z = _2132;
    out.gl_Position.w = _1763;
    float _2140 = _2138 * 0.5;
    bool _2142 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan(0.5);
    bool _2150 = _2146 || _2148;
    out.m_85.x = _2124;
    out.m_85.y = _2136;
    out.m_85.z = _2140;
    out.m_85.w = _1763;
    bool _2152 = _1398 <= 8000.0;
    bool _2154 = isnan(_1398);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan(8000.0);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2166 = precise::clamp(_2164, 0.0, 1.0);
    float _2168 = fma(_2166, -2.0, 3.0);
    float _2170 = _2166 * _2166;
    float _2172 = _2132;
    if (_2150)
    {
        _2017 = 1.0;
    }
    float _2174 = _2017;
    float _2176 = _2170 * _2168;
    float _2178 = -_2176;
    float _2180 = _2178 + 1.0;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2176);
    float _2184 = _2162 * _2182;
    float _2186 = _2174;
    if (!_2150)
    {
        float _2188 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2190 = _2188 * 0.15915493667125701904296875;
        float _2192 = _2190 * 6.283185482025146484375;
        float _2194 = cos(_2192);
        float _2196 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2198 = _2196 * 0.15915493667125701904296875;
        float _2200 = _2190 * 6.283185482025146484375;
        float _2202 = sin(_2200);
        float _2204 = 1.0 / _2194;
        float _2206 = _2198 * 6.283185482025146484375;
        float _2208 = cos(_2206);
        float _2210 = _2202 * _2204;
        float _2212 = _2198 * 6.283185482025146484375;
        float _2214 = sin(_2212);
        float _2216 = _2208 * _2210;
        float _2218 = 1.0 / _2216;
        float _2220 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2222 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2220;
        float _2224 = 1.0 / _2222;
        float _2226 = _2214 * _2218;
        float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2230 = fma(_1398, _2226, _2228);
        float _2232 = _2230 * _2224;
        float _2234 = precise::clamp(_2232, 0.0, 1.0);
        _2172 = _2224;
        _2186 = _2234;
    }
    float _2236 = _2172;
    float _2238 = _2186;
    float _2240 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2242 = -_2073;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2122;
    float _2248 = _2246 + 1.0;
    float _2250 = _2236;
    float _2252 = _2240;
    if (!_1983)
    {
        _2250 = 1.0;
    }
    float _2254 = _2250;
    float _2256 = _2244 * _2240;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = _2254;
    if (_1983)
    {
        bool _2262 = _2085 >= _2069;
        bool _2264 = isnan(_2085);
        bool _2266 = _2262 || _2264;
        bool _2268 = isnan(_2069);
        bool _2270 = _2266 || _2268;
        float _2272 = float(_2270);
        _2260 = _2272;
    }
    float _2274 = _2260;
    float _2276 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1555)
    {
        _2252 = 1.0;
    }
    float _2278 = _2252;
    float _2280 = _2278;
    if (!_1555)
    {
        int _2282 = _1663 << 4;
        int _2284 = _2282 + 2048;
        uint _2286 = uint(int(uint(_2284) >> uint(2)));
        uint _2288 = uint(int(uint(int(_2286)) >> uint(2)));
        int _2290 = int(_2286) & 3;
        float _2292 = (*spvDescriptorSet0.vp_c15)._m0[int(_2288)][_2290];
        int _2294 = int(_2286) + 1;
        uint _2296 = uint(int(uint(_2294) >> uint(2)));
        int _2298 = _2294 & 3;
        float _2300 = (*spvDescriptorSet0.vp_c15)._m0[int(_2296)][_2298];
        int _2302 = _2284 + 8;
        uint _2304 = uint(int(uint(_2302) >> uint(2)));
        uint _2306 = uint(int(uint(int(_2304)) >> uint(2)));
        int _2308 = int(_2304) & 3;
        float _2310 = (*spvDescriptorSet0.vp_c15)._m0[int(_2306)][_2308];
        int _2312 = int(_2304) + 1;
        uint _2314 = uint(int(uint(_2312) >> uint(2)));
        int _2316 = _2312 & 3;
        float _2318 = (*spvDescriptorSet0.vp_c15)._m0[int(_2314)][_2316];
        float _2320 = _1406 * _2300;
        float _2322 = fma(_862, _2292, _2320);
        float _2324 = fma(_1004, _2310, _2322);
        float _2326 = _2324 + _2318;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = -_2328;
        float _2332 = _2330 + _2079;
        float _2334 = fma(_2332, 500.0, 1.5);
        float _2336 = exp2(_2334);
        float _2338 = 0.0 + _2336;
        float _2340 = precise::clamp(_2338, 0.0, 1.0);
        _2280 = _2340;
        _1016 = 500.0;
    }
    float _2342 = _2280;
    float _2344 = _1016;
    float _2346 = _2276 * _2087;
    float _2348 = _2274 * _2342;
    float _2350 = -_2258;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2354 = -_2276;
    float _2356 = _2354 + 1.0;
    float _2358 = _2098 * _2346;
    float _2360 = _2108 * _2346;
    float _2362 = -_2348;
    float _2364 = fma(_2362, _2352, 1.0);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2098 * _2356;
    float _2370 = fma(_2104, _2358, _2092);
    float _2372 = fma(_2106, _2358, _2094);
    float _2374 = _2366 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2376 = fma(_2098, _2360, _2096);
    bool _2378 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2380 = isnan(_1402);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2386 = _2382 || _2384;
    float _2388 = _2238 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_87.x = _2374;
    out.m_89.x = _2370;
    out.m_89.y = _2372;
    out.m_89.z = _2376;
    out.m_89.w = _2368;
    float _2390 = _2356;
    float _2392 = _2366;
    float _2394 = _2344;
    if (!_2386)
    {
        _2390 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2396 = _2390;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2386)
    {
        _2392 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2402 = _2392;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2386)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2408 = _2394;
    bool _2410 = !_2386;
    float _2412 = _2408;
    float _2414 = _2408;
    if (!_2410)
    {
        bool _2416 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2418 = isnan(_1402);
        bool _2420 = _2416 || _2418;
        bool _2422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2424 = _2420 || _2422;
        if (!_2424)
        {
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2428 = _1402 + _2426;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2430;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2442 = 1.0 / _2432;
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2448 = _2428 * _2442;
            float _2450 = precise::clamp(_2448, 0.0, 1.0);
            float _2452 = fma(_2450, _2436, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2454 = fma(_2450, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2456 = fma(_2450, _2446, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2406 = _2454;
            _2400 = _2452;
            _2414 = _2456;
            _2458 = true;
        }
        else
        {
            bool _2460 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2462 = isnan(_1402);
            bool _2464 = _2460 || _2462;
            bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2468 = _2464 || _2466;
            if (!_2468)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2470 = _2398;
            _2400 = _2470;
            if (!_2468)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2472 = _2404;
            _2406 = _2472;
            if (!_2468)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2474 = _2412;
            bool _2476 = !_2468;
            _2414 = _2474;
            if (!_2476)
            {
                bool _2478 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1402);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1402 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2504 = 1.0 / _2494;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2510 = _2490 * _2504;
                    float _2512 = precise::clamp(_2510, 0.0, 1.0);
                    float _2514 = fma(_2512, _2498, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2516 = fma(_2512, _2502, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2518 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2406 = _2516;
                    _2400 = _2514;
                    _2414 = _2518;
                    _2458 = true;
                }
                else
                {
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2458 = false;
    float _2520 = _2406;
    float _2522 = _2400;
    float _2524 = _2414;
    float _2526 = _2388 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2528 = _2520 * 0.586610972881317138671875;
    bool _2530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = _2526;
    float _2532 = fma(_2522, 0.298911988735198974609375, _2528);
    bool _2534 = _2238 > 0.0;
    bool _2536 = isnan(_2238);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = fma(_2524, 0.114477999508380889892578125, _2532);
    float _2546 = -_2544;
    float _2548 = _2546 + _2522;
    float _2550 = -_2544;
    float _2552 = _2550 + _2520;
    float _2554 = -_2544;
    float _2556 = _2554 + _2524;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    bool _2564 = !_2530;
    if (!_2564)
    {
        float _2566 = -_1362;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2570 = -_1336;
        float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2574 = -_1364;
        float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2578 = _2568 * _2568;
        float _2580 = fma(_2572, _2572, _2578);
        float _2582 = fma(_2576, _2576, _2580);
        float _2584 = sqrt(_2582);
        float _2586 = rsqrt(_2582);
        float _2588 = -_2584;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = _2572 * _2586;
        float _2598 = _2568 * _2586;
        float _2600 = abs(_2594);
        float _2602 = log2(_2600);
        float _2604 = _2576 * _2586;
        float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2608 = _1240 * _2598;
        float _2610 = -_2598;
        float _2612 = -_2606;
        float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2612);
        float _2616 = fma(_1238, _2596, _2608);
        float _2618 = -_2604;
        float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2614);
        float _2622 = fma(_1242, _2604, _2616);
        float _2624 = precise::clamp(_2622, 0.0, 1.0);
        float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2628 = _2620 + _2626;
        float _2630 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = exp2(_2630);
        float _2638 = _2636 * _2634;
        float _2640 = _2624 * _2638;
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2644 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2642;
        out.m_91.y = _2644;
        out.m_91.z = _2646;
    }
    out.m_93.x = _2558;
    out.m_93.y = _2560;
    out.m_93.z = _2562;
    if (_2542)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2648;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2458 = false;
    bool _1292 = false;
    bool _464 = false;
    bool _308 = false;
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
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2704 = as_type<float>(_126);
        out.gl_Position.z = _2704;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_63.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    if (_140)
    {
        float _148 = float(_112);
        _146 = _148;
    }
    float _150 = _146;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = 0.0;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    float _162 = _160;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _164 = _160 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2773 = as_type<float>(_166);
        out.gl_Position.z = _2773;
    }
    if (_156)
    {
        return out;
    }
    float _168 = in.m_65.w;
    float _170 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _194 = _170;
    if (!_180)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _162 = _198;
    }
    float _200 = _162;
    float _202 = _200;
    if (!_180)
    {
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_180;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _170 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _170);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_180;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _170 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _194 = _264;
    }
    float _266 = _194;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _276 = fma(_266, _182, _270);
    float _278 = fma(_266, _184, _272);
    float _280 = fma(_266, _186, _274);
    float _282 = fma(_276, _168, _188);
    float _284 = fma(_278, _168, _190);
    float _286 = fma(_280, _168, _192);
    bool _288 = !_268;
    float _306;
    if (!_288)
    {
        float _290 = in.m_67.x;
        float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _294 = _290 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _298 = _296 * _292;
        float _300 = floor(_298);
        float _302 = -_300;
        float _304 = _298 + _302;
        _306 = _304;
        _308 = true;
    }
    else
    {
        float _310 = float(_112);
        float _312 = 1.0 / _310;
        float _314 = _144 * _312;
        _306 = _314;
    }
    _308 = false;
    float _316 = _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _320 = _316 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = isnan(_316);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _342 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _344 = isnan(_316);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _354;
    bool _358 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _360 = isnan(_316);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = 1.0 / _324;
    float _372 = -_336;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _378 = _352 * _374;
    float _380 = -_352;
    float _382 = _380 + 1.0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _386 = 1.0 / _340;
    float _388 = _356 * _370;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _394 = fma(_388, _320, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = -_368;
    float _398 = _396 + 1.0;
    float _400 = _394 * _378;
    float _402 = _392 * _386;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _406 = _316 + _404;
    float _408 = _336 * _398;
    float _410 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[115].x, _400);
    float _412 = fma(_402, _406, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _414 = fma(_412, _408, _410);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[117].x, _414);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _430 = _416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _436;
    out.m_69.y = _438;
    out.m_69.z = _440;
    out.m_69.w = _384;
    out.m_71.x = _430;
    out.m_71.y = _432;
    out.m_71.z = _434;
    out.m_71.w = _442;
    bool _444 = !_376;
    float _462;
    if (!_444)
    {
        float _446 = in.m_67.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_112);
        float _468 = 1.0 / _466;
        float _470 = _144 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_73.y;
    float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _490 = 1.0 / _480;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _496;
    bool _500 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _502 = isnan(_472);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _484;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _516 = 1.0 / _494;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _526 = _524 * _490;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _532 = 1.0 / _488;
    float _534 = _520 * _512;
    bool _536 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _538 = isnan(_472);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    bool _548 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _550 = isnan(_472);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _530 * _516;
    bool _562 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _564 = isnan(_472);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_558;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _584 = -_572;
    float _586 = _584 + 1.0;
    float _588 = _498 * _532;
    float _590 = -_546;
    float _592 = _590 + 1.0;
    float _594 = _510 * _586;
    float _596 = -_510;
    float _598 = _596 + 1.0;
    float _600 = 1.0 / _580;
    float _602 = _558 * _592;
    float _604 = _572 * _576;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _610 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _612 = isnan(_472);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _624 = _472 + _622;
    bool _626 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _628 = isnan(_472);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = 1.0 / _608;
    float _640 = fma(_534, _624, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _642 = _620 * _598;
    bool _644 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _646 = isnan(_472);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_620;
    float _658 = _656 + 1.0;
    float _660 = _654 * _658;
    float _662 = -_654;
    float _664 = _662 + 1.0;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _678 = _636 * _664;
    float _680 = 1.0 / _668;
    float _682 = _672 * _600;
    float _684 = _676 * _638;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _688 = _472 + _686;
    float _690 = _640 * _678;
    float _692 = -_636;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _698 = _472 + _696;
    float _700 = fma(_526, _688, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[159].x, _690);
    float _704 = fma(_588, _698, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _472 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _712 = _472 + _710;
    float _714 = fma(_700, _660, _702);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _722 = _472 + _720;
    float _724 = fma(_560, _708, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _726 = fma(_704, _642, _714);
    float _728 = _718 * _680;
    float _730 = fma(_682, _722, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _732 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _734 = isnan(_472);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = in.m_75.x;
    float _746 = in.m_75.y;
    float _748 = in.m_75.z;
    float _750 = in.m_75.w;
    float _752 = fma(_724, _594, _726);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _756 = _472 + _754;
    float _758 = fma(_684, _712, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _760 = fma(_730, _604, _752);
    float _762 = -_742;
    float _764 = _762 + 1.0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = fma(_728, _756, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _774 = _772 != 0;
    float _776 = fma(_758, _602, _760);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _780 = _778 != 0;
    float _782 = _546 * _764;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _786 = _784 != 0;
    float _788 = in.m_67.x;
    float _790 = fma(_770, _782, _776);
    float _792 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = in.m_65.x;
    float _796 = in.m_65.y;
    float _798 = in.m_65.z;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _802 = _800 != 0;
    float _804 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[166].x, _790);
    float _806 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _808 = in.m_67.y;
    float _810 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = -_750;
    float _814 = _812 + 1.0;
    float _816 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _818 = in.m_67.w;
    float _820 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _806);
    float _822 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    bool _824 = _804 >= _814;
    bool _826 = isnan(_804);
    bool _828 = _824 || _826;
    bool _830 = isnan(_814);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = in.m_73.x;
    float _838 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _816);
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _842 = _834 * _744;
    float _844 = _834 * _746;
    float _846 = _834 * _748;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _850 = _792;
    float _852 = _594;
    float _854 = _788;
    float _856 = _474;
    if (_774)
    {
        float _858 = in.m_67.z;
        _850 = _858;
    }
    float _860 = _850;
    float _862 = _838 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _864 = _796 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _868 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _870 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _872 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_802)
    {
        _852 = _808;
    }
    float _874 = _852;
    float _876 = -_866;
    float _878 = fma(_868, 2.0, _876);
    float _880 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _882 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _884 = fma(_872, -2.0, _848);
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _888 = -_474;
    float _890 = _888 + 1.0;
    bool _892 = _818 > 0.5;
    float _894 = _798 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _896 = _874;
    bool _898 = _892;
    if (_802)
    {
        _896 = _788;
    }
    float _900 = _896;
    float _902 = _798;
    if (!_802)
    {
        float _904 = in.m_67.z;
        _902 = _904;
    }
    float _906 = _902;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _910 = _892 ? as_type<int>(_890) : as_type<int>(_474);
    float _912 = _864 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_768)
    {
        bool _914 = _788 > 0.5;
        _898 = _914;
    }
    bool _916 = _898;
    float _918 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _908);
    float _920 = _780 ? as_type<float>(_910) : _474;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _924 = _808 > 0.5;
    float _926 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _928 = _886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _930 = _836;
    if (!_768)
    {
        _854 = _836;
    }
    float _932 = _854;
    float _934 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _922);
    float _936 = _932;
    if (_786)
    {
        float _938 = _924 ? _890 : _474;
        _856 = _938;
    }
    float _940 = _856;
    float _942 = fma(_920, _928, -0.5);
    float _944 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _946 = false;
    float _948 = _860;
    if (_774)
    {
        bool _950 = _860 > 0.5;
        _946 = _950;
    }
    bool _952 = _946;
    float _954 = _840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_768)
    {
        _948 = _932;
    }
    float _956 = _948;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _844);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _842);
    float _962 = _956;
    if (_768)
    {
        _936 = _836;
    }
    float _964 = _936;
    float _966 = fma(_954, _940, -0.5);
    float _968 = _912 * _958;
    float _970 = _906;
    float _972 = _964;
    if (!_802)
    {
        _930 = _906;
    }
    float _974 = _930;
    float _976 = _926 * _960;
    float _978 = _974;
    if (_802)
    {
        _978 = _808;
    }
    float _980 = _978;
    float _982 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_802)
    {
        _970 = _808;
    }
    float _984 = _970;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _846);
    float _988 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _990 = 0;
    if (_768)
    {
        float _992 = -_964;
        float _994 = _992 + 1.0;
        _990 = as_type<int>(_994);
    }
    int _996 = _990;
    float _998 = _944 * _986;
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _982);
    float _1002 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _1004 = _882 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1000);
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1002);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1014 = 0;
    float _1016 = _1004;
    if (_774)
    {
        float _1018 = -_964;
        float _1020 = _1018 + 1.0;
        _1014 = as_type<int>(_1020);
    }
    int _1022 = _1014;
    float _1024 = _862 + _1008;
    float _1026 = _1004 + _1010;
    float _1028 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1012);
    float _1030 = _900 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1034 = _1024 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1038 = _1026 + _1036;
    float _1040 = _1024;
    if (_768)
    {
        float _1042 = _916 ? as_type<float>(_996) : _964;
        _962 = _1042;
    }
    float _1044 = _962;
    float _1046 = -_1006;
    float _1048 = fma(_1030, 2.0, _1046);
    float _1050 = _1034 * _1034;
    float _1052 = _1038 * _1038;
    float _1054 = _1050;
    float _1056 = _1052;
    if (_774)
    {
        float _1058 = _952 ? as_type<float>(_1022) : _964;
        _972 = _1058;
    }
    float _1060 = _972;
    float _1062 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1064 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[83].w, _514);
    float _1066 = _1050 + _1052;
    float _1068 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _934);
    float _1070 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _884);
    float _1072 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1062);
    float _1074 = sqrt(_1066);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1078 = _980 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1080 = _476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1082 = -_1070;
    float _1084 = fma(_1068, _966, _1082);
    float _1086 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1072);
    float _1088 = _880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1090 = _582 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1092 = fma(_1078, -2.0, _1076);
    float _1094 = fma(_1080, _1044, -0.5);
    float _1096 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    float _1098 = -_144;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _1102 = _1088 + _1086;
    float _1104 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1028);
    float _1106 = -_144;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1048);
    float _1110 = fma(_1090, _1060, -0.5);
    bool _1112 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1064);
    float _1116 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1092);
    float _1118 = fma(_1096, _1094, _1100);
    float _1120 = fma(_1104, _1110, _1108);
    float _1122 = _1096;
    float _1124 = _1094;
    float _1126 = _1090;
    float _1128 = _1120;
    if (!_1112)
    {
        _1122 = _1026;
    }
    float _1130 = _1122;
    float _1132 = _1130;
    if (!_1112)
    {
        _1124 = _1102;
    }
    float _1134 = _1124;
    bool _1136 = !_1112;
    float _1138 = _1134;
    if (!_1136)
    {
        float _1140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1144 = _1074 + _1142;
        float _1146 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = rsqrt(_1066);
        float _1150 = _1144 * _1140;
        float _1152 = _1150 * 0.15915493667125701904296875;
        float _1154 = _1152 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        float _1158 = _1152 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        float _1162 = fma(_1156, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1164 = _1148 * _1162;
        float _1166 = _1160 + (-1.0);
        float _1168 = fma(_1034, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1170 = fma(_1038, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1172 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1176 = _1168 + _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1180 = _1170 + _1178;
        float _1182 = fma(_1102, _1160, _1172);
        float _1184 = _1176 * _1176;
        float _1186 = _1180 * _1180;
        _1138 = _1182;
        _1054 = _1184;
        _1056 = _1186;
        _1040 = _1168;
        _1132 = _1170;
    }
    float _1188 = _1138;
    float _1190 = _1054;
    float _1192 = _1056;
    float _1194 = _1040;
    float _1196 = _1132;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1200 = _1188 + _1198;
    float _1202 = _844 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1204 = _842 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1206 = -_1116;
    float _1208 = fma(_1114, _942, _1206);
    float _1210 = fma(_1200, _1200, _1190);
    float _1212 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1218 = _1210 + _1192;
    float _1220 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1212);
    float _1224 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1214);
    float _1226 = sqrt(_1218);
    float _1228 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1216);
    float _1230 = _1084 + 0.5;
    float _1232 = _1118 + 0.5;
    float _1234 = _1208 + 0.5;
    float _1236 = _1120 + 0.5;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1222);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1224);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1228);
    out.m_77.w = _750;
    out.m_79.x = _1232;
    out.m_79.y = _1230;
    out.m_79.z = _1236;
    out.m_79.w = _1234;
    bool _1244 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1246 = isnan(_1226);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1252 = _1248 || _1250;
    out.m_81.x = _804;
    out.m_83.x = _1238;
    out.m_83.y = _1240;
    out.m_83.z = _1242;
    float _1254 = _1192;
    float _1256 = _1194;
    if (!_1252)
    {
        _1126 = 1.0;
    }
    float _1258 = _1126;
    bool _1260 = !_1252;
    float _1262 = _1258;
    if (!_1260)
    {
        bool _1264 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1266 = isnan(_1226);
        bool _1268 = _1264 || _1266;
        bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1272 = _1268 || _1270;
        if (!_1272)
        {
            float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1276 = _1226 + _1274;
            float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1280 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1278;
            float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1284 = _1282 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1286 = 1.0 / _1280;
            float _1288 = _1276 * _1286;
            float _1290 = fma(_1288, _1284, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1262 = _1290;
            _1292 = true;
        }
        else
        {
            bool _1294 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1296 = isnan(_1226);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1302 = _1298 || _1300;
            if (!_1302)
            {
                float _1304 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1306 = _1226 + _1304;
                float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1310 = _1308 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1314 = _1312 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1316 = 1.0 / _1310;
                float _1318 = _1306 * _1316;
                float _1320 = fma(_1318, _1314, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1262 = _1320;
                _1292 = true;
            }
            else
            {
                _1262 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1292 = false;
    float _1322 = _1262;
    float _1324 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1328 = _1194 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1332 = _1196 + _1330;
    float _1334 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1324);
    float _1336 = fma(_1328, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1338 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1340 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1344 = _1336 + _1342;
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1348 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1340);
    float _1350 = 1.0 / _1346;
    float _1352 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1348);
    float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1356 = _1188 + _1354;
    float _1358 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1362 = fma(_1356, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1364 = fma(_1332, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1366 = floor(_1358);
    float _1368 = _1360 + _1346;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1362 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1364 + _1374;
    float _1378 = _1372 * _1372;
    float _1380 = _1368 * _1350;
    float _1382 = _1380 * 0.5;
    float _1384 = fma(_1344, _1344, _1378);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1388 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1386);
    float _1390 = fma(_1376, _1376, _1384);
    float _1392 = 1.0 / _1388;
    float _1394 = rsqrt(_1390);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1398 = _1392 * _1396;
    float _1400 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1402 = sqrt(_1390);
    bool _1404 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1406 = _1088 + _1400;
    bool _1408 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1410 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    bool _1412 = !_1404;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1420 = _1344 * _1410;
    float _1422 = _1376 * _1410;
    float _1424 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1416);
    float _1426 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1418);
    float _1428 = _1420 * _1420;
    float _1430 = _1422 * _1422;
    int _1432 = 2;
    float _1434 = _1422;
    float _1436 = _1428;
    float _1438 = _1420;
    if (!_1404)
    {
        _1432 = 1;
    }
    int _1440 = _1432;
    float _1442 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1424);
    int _1444 = _1440;
    if (!_1408)
    {
        _1444 = _1414;
    }
    int _1446 = _1444;
    float _1448 = _1428 + _1430;
    float _1450 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1426);
    float _1452 = _1442 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1454 = _1446 << 6;
    float _1456 = sqrt(_1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1460 = _1454 + 96;
    uint _1463 = uint(int(uint(_1460) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    float _1479 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1481 = trunc(_1452);
    int _1483 = int(_1481);
    float _1485 = trunc(_1458);
    int _1487 = int(_1485);
    bool _1489 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1456 + _1491;
    int _1495 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1497 = _1483 + _1495;
    int _1499 = _1497 + 1;
    float _1501 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1503 = floor(_1479);
    bool _1505 = _1499 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1507 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1501);
    float _1509 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1511 = 0.0;
    float _1513 = _1493;
    int _1515 = _1499;
    float _1517 = _1458;
    if (!_1489)
    {
        _1511 = _1420;
    }
    float _1519 = _1511;
    int _1521 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1523 = _1487 + _1521;
    int _1525 = _1523 + 1;
    float _1527 = _1332;
    float _1529 = _1519;
    if (_1489)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1531;
    }
    float _1533 = _1527;
    float _1535 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    int _1537 = _1499 | _1525;
    float _1539 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1541 = _1537 < 0;
    bool _1543 = _1541 || _1505;
    float _1545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (_1489)
    {
        float _1549 = rsqrt(_1448);
        _1254 = _1549;
    }
    float _1551 = _1254;
    bool _1553 = _1525 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1555 = _1553 || _1543;
    float _1557 = -_1503;
    float _1559 = _1479 + _1557;
    float _1561 = precise::max(0.0, _1545);
    float _1563 = -_1547;
    float _1565 = fma(_1563, _1509, 1.0);
    float _1567 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1489)
    {
        float _1569 = _1493 * _1533;
        _1513 = _1569;
    }
    float _1571 = _1513;
    float _1573 = _1406 * _1477;
    float _1575 = -_1410;
    float _1577 = -_1561;
    float _1579 = fma(_1372, _1575, _1577);
    float _1581 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1489)
    {
        float _1583 = _1571 * 0.15915493667125701904296875;
        _1256 = _1583;
    }
    float _1585 = _1256;
    float _1587 = fma(_862, _1469, _1573);
    int _1589 = _1454 + 104;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    float _1607 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1567);
    float _1609 = _1188;
    if (_1489)
    {
        float _1611 = _1585 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        _1609 = _1613;
    }
    float _1615 = _1609;
    float _1617 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1581);
    float _1619 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1621 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1607);
    float _1623 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1617);
    float _1625 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1619);
    float _1627 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1629 = _1617;
    if (_1489)
    {
        float _1631 = _1585 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        _1629 = _1633;
    }
    float _1635 = _1629;
    int _1637 = _1454 + 48;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c15)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c15)._m0[int(_1649)][_1651];
    if (_1489)
    {
        float _1655 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1128 = _1655;
    }
    float _1657 = _1128;
    if (!_1555)
    {
        int _1659 = _1525 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1661 = _1659 + _1499;
        _1515 = _1661;
    }
    int _1663 = _1515;
    float _1665 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1625);
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1669 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1667);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1675 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1677 = 0.0;
    float _1679 = _1671;
    if (_1489)
    {
        float _1681 = fma(_1615, _1657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1677 = _1681;
    }
    float _1683 = _1677;
    int _1685 = _1454 + 64;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    float _1703 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1675);
    float _1707 = 0.0;
    if (_1489)
    {
        float _1709 = _1551 * _1683;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = -_1671;
    float _1715 = _1713 + 1.0;
    float _1717 = 0.0;
    if (!_1489)
    {
        _1717 = _1579;
    }
    float _1719 = _1717;
    float _1721 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1705);
    float _1723 = _1719;
    int _1725 = as_type<int>(_1721);
    if (_1489)
    {
        float _1727 = _1635 + (-1.0);
        _1679 = _1727;
    }
    float _1729 = _1679;
    int _1731 = _1454 + 56;
    uint _1733 = uint(int(uint(_1731) >> uint(2)));
    uint _1735 = uint(int(uint(int(_1733)) >> uint(2)));
    int _1737 = int(_1733) & 3;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
    int _1741 = int(_1733) + 1;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    int _1745 = _1741 & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    if (_1489)
    {
        float _1749 = _1420 * _1711;
        _1529 = _1749;
    }
    float _1751 = _1529;
    if (_1489)
    {
        float _1753 = _1422 * _1711;
        _1434 = _1753;
    }
    float _1755 = _1434;
    float _1757 = 0.0;
    if (_1489)
    {
        float _1759 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1721);
    if (_1489)
    {
        float _1765 = _1751 * _1751;
        _1436 = _1765;
    }
    float _1767 = _1436;
    int _1769 = as_type<int>(_1767);
    if (!_1489)
    {
        _1438 = _1430;
    }
    float _1771 = _1438;
    float _1773 = _1771;
    if (_1489)
    {
        float _1775 = fma(_1579, _1635, _1761);
        _1723 = _1775;
    }
    float _1777 = _1723;
    int _1779 = _1454 + 72;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    if (!_1555)
    {
        int _1797 = _1663 << 2;
        _1725 = _1797;
    }
    int _1799 = _1725;
    int _1801 = _1799;
    if (_1489)
    {
        float _1803 = _1755 * _1755;
        _1773 = _1803;
    }
    float _1805 = _1773;
    float _1807 = fma(_1777, _1777, _1767);
    if (!_1555)
    {
        uint _1809 = uint(int(uint(_1663) >> uint(2)));
        _1769 = int(_1809);
    }
    int _1811 = _1769;
    float _1813 = abs(_1715);
    float _1815 = log2(_1813);
    float _1817 = as_type<float>(_1811);
    if (!_1555)
    {
        int _1819 = 12 & _1799;
        _1801 = _1819;
    }
    int _1821 = _1801;
    float _1823 = _1807 + _1805;
    int _1825 = _1454 + 80;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    uint _1829 = uint(int(uint(int(_1827)) >> uint(2)));
    int _1831 = int(_1827) & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    int _1835 = int(_1827) + 1;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    int _1839 = _1835 & 3;
    float _1841 = (*spvDescriptorSet0.vp_c15)._m0[int(_1837)][_1839];
    float _1843 = -_1366;
    float _1845 = _1358 + _1843;
    if (!_1555)
    {
        int _1847 = _1811 << 4;
        int _1849 = _1847 + _1821;
        _1817 = as_type<float>(_1849);
    }
    float _1851 = _1817;
    float _1853 = fma(_1004, _1597, _1587);
    float _1855 = 1.0 / _1763;
    int _1857 = _1454 + 88;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
    float _1875 = _1853 + _1605;
    float _1877 = rsqrt(_1823);
    float _1879 = _1406 * _1653;
    float _1881 = _1851;
    if (!_1555)
    {
        int _1883 = as_type<int>(_1851) + 400;
        uint _1885 = uint(int(uint(_1883) >> uint(2)));
        uint _1887 = uint(int(uint(int(_1885)) >> uint(2)));
        int _1889 = int(_1885) & 3;
        float _1891 = (*spvDescriptorSet0.vp_c15)._m0[int(_1887)][_1889];
        _1881 = _1891;
    }
    float _1893 = _1881;
    float _1895 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1897 = fma(_862, _1645, _1879);
    float _1899 = 1.0 / _1875;
    float _1901 = _1406 * _1701;
    float _1903 = fma(_862, _1693, _1901);
    float _1905 = _1877 * _1751;
    float _1907 = _1877 * _1777;
    float _1909 = fma(_1004, _1739, _1897);
    float _1911 = _1877 * _1755;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1915 = _1739;
    if (!_1555)
    {
        float _1917 = floor(_1458);
        _1915 = _1917;
    }
    float _1919 = _1915;
    float _1921 = _1909 + _1747;
    float _1923 = -_1913;
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1923);
    float _1927 = fma(_1004, _1787, _1903);
    float _1929 = _1921 * _1899;
    float _1931 = -_1911;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1925);
    float _1935 = exp2(_1895);
    float _1937 = _1927 + _1795;
    float _1939 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1941 = _1929 >= 0.0;
    float _1943 = fma(_1933, -0.5, 0.5);
    float _1945 = _1406 * _1841;
    float _1947 = fma(_1933, 0.5, 0.5);
    bool _1949 = _1929 <= 1.0;
    bool _1951 = _1949 && _1941;
    float _1953 = log2(_1565);
    float _1955 = fma(_862, _1833, _1945);
    float _1957 = _1937 * _1899;
    float _1959 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1939);
    float _1961 = _1943;
    if (!_1555)
    {
        float _1963 = -_1919;
        float _1965 = _1458 + _1963;
        _1517 = _1965;
    }
    float _1967 = _1517;
    float _1969 = fma(_1004, _1865, _1955);
    bool _1971 = _1957 >= 0.0;
    bool _1973 = _1971 && _1951;
    float _1975 = _1969 + _1873;
    float _1977 = sqrt(_1943);
    float _1979 = fma(_1947, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1981 = _1957 <= 1.0;
    bool _1983 = _1981 && _1973;
    float _1985 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1959);
    float _1989 = fma(_1947, _1979, -0.212114393711090087890625);
    float _1991 = _1907 + 1.0;
    float _1993 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1995 = _1841;
    if (!_1555)
    {
        float _1997 = floor(_1452);
        _1995 = _1997;
    }
    float _1999 = _1995;
    float _2001 = fma(_1947, _1989, 1.570728778839111328125);
    float _2003 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1987);
    float _2005 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1993);
    float _2007 = -_1907;
    float _2009 = fma(_1935, _1991, _2007);
    float _2011 = _1953 * 0.693147182464599609375;
    float _2013 = _2003 * _1855;
    float _2015 = _2013;
    float _2017 = _2003;
    if (_1983)
    {
        float _2019 = float(_1446);
        _1961 = _2019;
    }
    float _2021 = _1961;
    float _2023 = _1979;
    if (!_1555)
    {
        float _2025 = rint(_1893);
        float _2027 = precise::max(_2025, 0.0);
        uint _2029 = uint(_2027);
        uint _2031 = clamp(_2029, 0u, 65535u);
        _2023 = as_type<float>(_2031);
    }
    float _2033 = _2023;
    float _2035 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2037 = _1977 * 0.636619746685028076171875;
    float _2039 = fma(_2013, 0.5, 0.5);
    float _2041 = fma(_2009, 0.5, 0.5);
    float _2043 = _2035 * _1855;
    float _2045 = -_2001;
    float _2047 = fma(_2037, _2045, 1.0);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2051 = _2021;
    if (_1983)
    {
        float _2053 = rint(_2021);
        float _2055 = precise::max(_2053, 0.0);
        uint _2057 = uint(_2055);
        uint _2059 = clamp(_2057, 0u, 65535u);
        _2051 = as_type<float>(_2059);
    }
    float _2061 = _2051;
    if (!_1555)
    {
        float _2063 = -_1999;
        float _2065 = _1452 + _2063;
        _2015 = _2065;
    }
    float _2067 = _2015;
    float _2069 = _1975 * _1899;
    float _2071 = fma(_2043, -0.5, 0.5);
    float2 _5942 = float2(_1559, _1845);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).x;
    float _2075 = _1967;
    if (!_1555)
    {
        float3 _5959 = float3(_2067, _1967, float(as_type<int>(_2033)));
        float3 _5963 = select(_5959, float3(0.0), isnan(_5959));
        float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5963.xy, uint(rint(_5963.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5963.xy, uint(rint(_5963.z)), level(0.0)).x;
        _2075 = _2077;
    }
    float _2079 = _2075;
    float _2081 = _2061;
    if (_1983)
    {
        float3 _5978 = float3(_1929, _1957, float(as_type<int>(_2061)));
        float3 _5980 = select(_5978, float3(0.0), isnan(_5978));
        float _2083 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5980.xy, uint(rint(_5980.z)), _2069, level(0.0));
        _2081 = _2083;
    }
    float _2085 = _2081;
    float3 _5990 = float3(_2039, _2071, _2049);
    float _2087 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5990, float3(0.0), isnan(_5990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5990, float3(0.0), isnan(_5990)), level(0.0)).x;
    float3 _5999 = float3(_2039, _2071, _2049);
    float4 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5999, float3(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5999, float3(0.0), isnan(_5999)), level(0.0)).xyzw;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = _2090.w;
    float2 _6015 = float2(_2047, _2041);
    float3 _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6015, float2(0.0), isnan(_6015)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6015, float2(0.0), isnan(_6015)), level(0.0)).xyz;
    float _2104 = _2102.x;
    float _2106 = _2102.y;
    float _2108 = _2102.z;
    float _2110 = abs(_1398);
    float _2112 = log2(_2110);
    float _2114 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2116 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2118 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2114);
    float _2120 = _2003 + _1763;
    float _2122 = exp2(_2116);
    float _2124 = _2120 * 0.5;
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2128 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2118);
    float _2130 = _1763 * 0.5;
    float _2132 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2128);
    float _2134 = exp2(_2126);
    float _2136 = fma(_2035, -0.5, _2130);
    float _2138 = _2132 + _1763;
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2035;
    out.gl_Position.z = _2132;
    out.gl_Position.w = _1763;
    float _2140 = _2138 * 0.5;
    bool _2142 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan(0.5);
    bool _2150 = _2146 || _2148;
    out.m_85.x = _2124;
    out.m_85.y = _2136;
    out.m_85.z = _2140;
    out.m_85.w = _1763;
    bool _2152 = _1398 <= 8000.0;
    bool _2154 = isnan(_1398);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan(8000.0);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2166 = precise::clamp(_2164, 0.0, 1.0);
    float _2168 = fma(_2166, -2.0, 3.0);
    float _2170 = _2166 * _2166;
    float _2172 = _2132;
    if (_2150)
    {
        _2017 = 1.0;
    }
    float _2174 = _2017;
    float _2176 = _2170 * _2168;
    float _2178 = -_2176;
    float _2180 = _2178 + 1.0;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2176);
    float _2184 = _2162 * _2182;
    float _2186 = _2174;
    if (!_2150)
    {
        float _2188 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2190 = _2188 * 0.15915493667125701904296875;
        float _2192 = _2190 * 6.283185482025146484375;
        float _2194 = cos(_2192);
        float _2196 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2198 = _2196 * 0.15915493667125701904296875;
        float _2200 = _2190 * 6.283185482025146484375;
        float _2202 = sin(_2200);
        float _2204 = 1.0 / _2194;
        float _2206 = _2198 * 6.283185482025146484375;
        float _2208 = cos(_2206);
        float _2210 = _2202 * _2204;
        float _2212 = _2198 * 6.283185482025146484375;
        float _2214 = sin(_2212);
        float _2216 = _2208 * _2210;
        float _2218 = 1.0 / _2216;
        float _2220 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2222 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2220;
        float _2224 = 1.0 / _2222;
        float _2226 = _2214 * _2218;
        float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2230 = fma(_1398, _2226, _2228);
        float _2232 = _2230 * _2224;
        float _2234 = precise::clamp(_2232, 0.0, 1.0);
        _2172 = _2224;
        _2186 = _2234;
    }
    float _2236 = _2172;
    float _2238 = _2186;
    float _2240 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2242 = -_2073;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2122;
    float _2248 = _2246 + 1.0;
    float _2250 = _2236;
    float _2252 = _2240;
    if (!_1983)
    {
        _2250 = 1.0;
    }
    float _2254 = _2250;
    float _2256 = _2244 * _2240;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = _2254;
    if (_1983)
    {
        bool _2262 = _2085 >= _2069;
        bool _2264 = isnan(_2085);
        bool _2266 = _2262 || _2264;
        bool _2268 = isnan(_2069);
        bool _2270 = _2266 || _2268;
        float _2272 = float(_2270);
        _2260 = _2272;
    }
    float _2274 = _2260;
    float _2276 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1555)
    {
        _2252 = 1.0;
    }
    float _2278 = _2252;
    float _2280 = _2278;
    if (!_1555)
    {
        int _2282 = _1663 << 4;
        int _2284 = _2282 + 2048;
        uint _2286 = uint(int(uint(_2284) >> uint(2)));
        uint _2288 = uint(int(uint(int(_2286)) >> uint(2)));
        int _2290 = int(_2286) & 3;
        float _2292 = (*spvDescriptorSet0.vp_c15)._m0[int(_2288)][_2290];
        int _2294 = int(_2286) + 1;
        uint _2296 = uint(int(uint(_2294) >> uint(2)));
        int _2298 = _2294 & 3;
        float _2300 = (*spvDescriptorSet0.vp_c15)._m0[int(_2296)][_2298];
        int _2302 = _2284 + 8;
        uint _2304 = uint(int(uint(_2302) >> uint(2)));
        uint _2306 = uint(int(uint(int(_2304)) >> uint(2)));
        int _2308 = int(_2304) & 3;
        float _2310 = (*spvDescriptorSet0.vp_c15)._m0[int(_2306)][_2308];
        int _2312 = int(_2304) + 1;
        uint _2314 = uint(int(uint(_2312) >> uint(2)));
        int _2316 = _2312 & 3;
        float _2318 = (*spvDescriptorSet0.vp_c15)._m0[int(_2314)][_2316];
        float _2320 = _1406 * _2300;
        float _2322 = fma(_862, _2292, _2320);
        float _2324 = fma(_1004, _2310, _2322);
        float _2326 = _2324 + _2318;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = -_2328;
        float _2332 = _2330 + _2079;
        float _2334 = fma(_2332, 500.0, 1.5);
        float _2336 = exp2(_2334);
        float _2338 = 0.0 + _2336;
        float _2340 = precise::clamp(_2338, 0.0, 1.0);
        _2280 = _2340;
        _1016 = 500.0;
    }
    float _2342 = _2280;
    float _2344 = _1016;
    float _2346 = _2276 * _2087;
    float _2348 = _2274 * _2342;
    float _2350 = -_2258;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2354 = -_2276;
    float _2356 = _2354 + 1.0;
    float _2358 = _2098 * _2346;
    float _2360 = _2108 * _2346;
    float _2362 = -_2348;
    float _2364 = fma(_2362, _2352, 1.0);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2098 * _2356;
    float _2370 = fma(_2104, _2358, _2092);
    float _2372 = fma(_2106, _2358, _2094);
    float _2374 = _2366 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2376 = fma(_2098, _2360, _2096);
    bool _2378 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2380 = isnan(_1402);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2386 = _2382 || _2384;
    float _2388 = _2238 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_87.x = _2374;
    out.m_89.x = _2370;
    out.m_89.y = _2372;
    out.m_89.z = _2376;
    out.m_89.w = _2368;
    float _2390 = _2356;
    float _2392 = _2366;
    float _2394 = _2344;
    if (!_2386)
    {
        _2390 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2396 = _2390;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2386)
    {
        _2392 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2402 = _2392;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2386)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2408 = _2394;
    bool _2410 = !_2386;
    float _2412 = _2408;
    float _2414 = _2408;
    if (!_2410)
    {
        bool _2416 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2418 = isnan(_1402);
        bool _2420 = _2416 || _2418;
        bool _2422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2424 = _2420 || _2422;
        if (!_2424)
        {
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2428 = _1402 + _2426;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2430;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2442 = 1.0 / _2432;
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2448 = _2428 * _2442;
            float _2450 = precise::clamp(_2448, 0.0, 1.0);
            float _2452 = fma(_2450, _2436, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2454 = fma(_2450, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2456 = fma(_2450, _2446, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2406 = _2454;
            _2400 = _2452;
            _2414 = _2456;
            _2458 = true;
        }
        else
        {
            bool _2460 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2462 = isnan(_1402);
            bool _2464 = _2460 || _2462;
            bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2468 = _2464 || _2466;
            if (!_2468)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2470 = _2398;
            _2400 = _2470;
            if (!_2468)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2472 = _2404;
            _2406 = _2472;
            if (!_2468)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2474 = _2412;
            bool _2476 = !_2468;
            _2414 = _2474;
            if (!_2476)
            {
                bool _2478 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1402);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1402 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2504 = 1.0 / _2494;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2510 = _2490 * _2504;
                    float _2512 = precise::clamp(_2510, 0.0, 1.0);
                    float _2514 = fma(_2512, _2498, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2516 = fma(_2512, _2502, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2518 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2406 = _2516;
                    _2400 = _2514;
                    _2414 = _2518;
                    _2458 = true;
                }
                else
                {
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2458 = false;
    float _2520 = _2406;
    float _2522 = _2400;
    float _2524 = _2414;
    float _2526 = _2388 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2528 = _2520 * 0.586610972881317138671875;
    bool _2530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = _2526;
    float _2532 = fma(_2522, 0.298911988735198974609375, _2528);
    bool _2534 = _2238 > 0.0;
    bool _2536 = isnan(_2238);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = fma(_2524, 0.114477999508380889892578125, _2532);
    float _2546 = -_2544;
    float _2548 = _2546 + _2522;
    float _2550 = -_2544;
    float _2552 = _2550 + _2520;
    float _2554 = -_2544;
    float _2556 = _2554 + _2524;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    bool _2564 = !_2530;
    if (!_2564)
    {
        float _2566 = -_1362;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2570 = -_1336;
        float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2574 = -_1364;
        float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2578 = _2568 * _2568;
        float _2580 = fma(_2572, _2572, _2578);
        float _2582 = fma(_2576, _2576, _2580);
        float _2584 = sqrt(_2582);
        float _2586 = rsqrt(_2582);
        float _2588 = -_2584;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = _2572 * _2586;
        float _2598 = _2568 * _2586;
        float _2600 = abs(_2594);
        float _2602 = log2(_2600);
        float _2604 = _2576 * _2586;
        float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2608 = _1240 * _2598;
        float _2610 = -_2598;
        float _2612 = -_2606;
        float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2612);
        float _2616 = fma(_1238, _2596, _2608);
        float _2618 = -_2604;
        float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2614);
        float _2622 = fma(_1242, _2604, _2616);
        float _2624 = precise::clamp(_2622, 0.0, 1.0);
        float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2628 = _2620 + _2626;
        float _2630 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = exp2(_2630);
        float _2638 = _2636 * _2634;
        float _2640 = _2624 * _2638;
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2644 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2642;
        out.m_91.y = _2644;
        out.m_91.z = _2646;
    }
    out.m_93.x = _2558;
    out.m_93.y = _2560;
    out.m_93.z = _2562;
    if (_2542)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2648;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2458 = false;
    bool _1292 = false;
    bool _464 = false;
    bool _308 = false;
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
    if (!_116)
    {
        out.m_61.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2704 = as_type<float>(_126);
        out.gl_Position.z = _2704;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_63.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    if (_140)
    {
        float _148 = float(_112);
        _146 = _148;
    }
    float _150 = _146;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = 0.0;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    float _162 = _160;
    if (_156)
    {
        out.m_61.x = 0.0;
    }
    if (_156)
    {
        float _164 = _160 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2773 = as_type<float>(_166);
        out.gl_Position.z = _2773;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_65.w;
    float _170 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _194 = _170;
    if (!_180)
    {
        float _196 = _170 * _170;
        float _198 = _196 * 0.5;
        _162 = _198;
    }
    float _200 = _162;
    float _202 = _200;
    if (!_180)
    {
        float _204 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _204;
    }
    float _206 = _202;
    bool _208 = !_180;
    float _210 = _206;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _170 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _170);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_180;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _170 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _194 = _264;
    }
    float _266 = _194;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _270 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _272 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _274 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _276 = fma(_266, _182, _270);
    float _278 = fma(_266, _184, _272);
    float _280 = fma(_266, _186, _274);
    float _282 = fma(_276, _168, _188);
    float _284 = fma(_278, _168, _190);
    float _286 = fma(_280, _168, _192);
    bool _288 = !_268;
    float _306;
    if (!_288)
    {
        float _290 = in.m_67.x;
        float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _294 = _290 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _296 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _298 = _296 * _292;
        float _300 = floor(_298);
        float _302 = -_300;
        float _304 = _298 + _302;
        _306 = _304;
        _308 = true;
    }
    else
    {
        float _310 = float(_112);
        float _312 = 1.0 / _310;
        float _314 = _144 * _312;
        _306 = _314;
    }
    _308 = false;
    float _316 = _306;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _320 = _316 + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _328 = isnan(_316);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _342 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _344 = isnan(_316);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _354;
    bool _358 = _316 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _360 = isnan(_316);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = 1.0 / _324;
    float _372 = -_336;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _378 = _352 * _374;
    float _380 = -_352;
    float _382 = _380 + 1.0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _386 = 1.0 / _340;
    float _388 = _356 * _370;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _394 = fma(_388, _320, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _396 = -_368;
    float _398 = _396 + 1.0;
    float _400 = _394 * _378;
    float _402 = _392 * _386;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _406 = _316 + _404;
    float _408 = _336 * _398;
    float _410 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[115].x, _400);
    float _412 = fma(_402, _406, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _414 = fma(_412, _408, _410);
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[117].x, _414);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _430 = _416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _436 = _424 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _426 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = _428 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _436;
    out.m_69.y = _438;
    out.m_69.z = _440;
    out.m_69.w = _384;
    out.m_71.x = _430;
    out.m_71.y = _432;
    out.m_71.z = _434;
    out.m_71.w = _442;
    bool _444 = !_376;
    float _462;
    if (!_444)
    {
        float _446 = in.m_67.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_112);
        float _468 = 1.0 / _466;
        float _470 = _144 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = in.m_73.y;
    float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _490 = 1.0 / _480;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _496;
    bool _500 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _502 = isnan(_472);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _484;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _516 = 1.0 / _494;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _526 = _524 * _490;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _532 = 1.0 / _488;
    float _534 = _520 * _512;
    bool _536 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _538 = isnan(_472);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    bool _548 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _550 = isnan(_472);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _530 * _516;
    bool _562 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _564 = isnan(_472);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -_558;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _584 = -_572;
    float _586 = _584 + 1.0;
    float _588 = _498 * _532;
    float _590 = -_546;
    float _592 = _590 + 1.0;
    float _594 = _510 * _586;
    float _596 = -_510;
    float _598 = _596 + 1.0;
    float _600 = 1.0 / _580;
    float _602 = _558 * _592;
    float _604 = _572 * _576;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _610 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _612 = isnan(_472);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _624 = _472 + _622;
    bool _626 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _628 = isnan(_472);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = 1.0 / _608;
    float _640 = fma(_534, _624, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _642 = _620 * _598;
    bool _644 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _646 = isnan(_472);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -_620;
    float _658 = _656 + 1.0;
    float _660 = _654 * _658;
    float _662 = -_654;
    float _664 = _662 + 1.0;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _678 = _636 * _664;
    float _680 = 1.0 / _668;
    float _682 = _672 * _600;
    float _684 = _676 * _638;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _688 = _472 + _686;
    float _690 = _640 * _678;
    float _692 = -_636;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _698 = _472 + _696;
    float _700 = fma(_526, _688, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[159].x, _690);
    float _704 = fma(_588, _698, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _708 = _472 + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _712 = _472 + _710;
    float _714 = fma(_700, _660, _702);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _722 = _472 + _720;
    float _724 = fma(_560, _708, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _726 = fma(_704, _642, _714);
    float _728 = _718 * _680;
    float _730 = fma(_682, _722, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _732 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _734 = isnan(_472);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = in.m_75.x;
    float _746 = in.m_75.y;
    float _748 = in.m_75.z;
    float _750 = in.m_75.w;
    float _752 = fma(_724, _594, _726);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _756 = _472 + _754;
    float _758 = fma(_684, _712, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _760 = fma(_730, _604, _752);
    float _762 = -_742;
    float _764 = _762 + 1.0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _768 = _766 != 0;
    float _770 = fma(_728, _756, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _774 = _772 != 0;
    float _776 = fma(_758, _602, _760);
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _780 = _778 != 0;
    float _782 = _546 * _764;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _786 = _784 != 0;
    float _788 = in.m_67.x;
    float _790 = fma(_770, _782, _776);
    float _792 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = in.m_65.x;
    float _796 = in.m_65.y;
    float _798 = in.m_65.z;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _802 = _800 != 0;
    float _804 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[166].x, _790);
    float _806 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _808 = in.m_67.y;
    float _810 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = -_750;
    float _814 = _812 + 1.0;
    float _816 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _818 = in.m_67.w;
    float _820 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _806);
    float _822 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    bool _824 = _804 >= _814;
    bool _826 = isnan(_804);
    bool _828 = _824 || _826;
    bool _830 = isnan(_814);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = in.m_73.x;
    float _838 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].z, _816);
    float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _842 = _834 * _744;
    float _844 = _834 * _746;
    float _846 = _834 * _748;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _850 = _792;
    float _852 = _594;
    float _854 = _788;
    float _856 = _474;
    if (_774)
    {
        float _858 = in.m_67.z;
        _850 = _858;
    }
    float _860 = _850;
    float _862 = _838 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _864 = _796 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _868 = _788 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _870 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _872 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_802)
    {
        _852 = _808;
    }
    float _874 = _852;
    float _876 = -_866;
    float _878 = fma(_868, 2.0, _876);
    float _880 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].z, _820);
    float _882 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].z, _822);
    float _884 = fma(_872, -2.0, _848);
    float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _888 = -_474;
    float _890 = _888 + 1.0;
    bool _892 = _818 > 0.5;
    float _894 = _798 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _896 = _874;
    bool _898 = _892;
    if (_802)
    {
        _896 = _788;
    }
    float _900 = _896;
    float _902 = _798;
    if (!_802)
    {
        float _904 = in.m_67.z;
        _902 = _904;
    }
    float _906 = _902;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _910 = _892 ? as_type<int>(_890) : as_type<int>(_474);
    float _912 = _864 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_768)
    {
        bool _914 = _788 > 0.5;
        _898 = _914;
    }
    bool _916 = _898;
    float _918 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[78].z, _908);
    float _920 = _780 ? as_type<float>(_910) : _474;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _924 = _808 > 0.5;
    float _926 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _928 = _886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _930 = _836;
    if (!_768)
    {
        _854 = _836;
    }
    float _932 = _854;
    float _934 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].w, _922);
    float _936 = _932;
    if (_786)
    {
        float _938 = _924 ? _890 : _474;
        _856 = _938;
    }
    float _940 = _856;
    float _942 = fma(_920, _928, -0.5);
    float _944 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _946 = false;
    float _948 = _860;
    if (_774)
    {
        bool _950 = _860 > 0.5;
        _946 = _950;
    }
    bool _952 = _946;
    float _954 = _840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_768)
    {
        _948 = _932;
    }
    float _956 = _948;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _844);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _842);
    float _962 = _956;
    if (_768)
    {
        _936 = _836;
    }
    float _964 = _936;
    float _966 = fma(_954, _940, -0.5);
    float _968 = _912 * _958;
    float _970 = _906;
    float _972 = _964;
    if (!_802)
    {
        _930 = _906;
    }
    float _974 = _930;
    float _976 = _926 * _960;
    float _978 = _974;
    if (_802)
    {
        _978 = _808;
    }
    float _980 = _978;
    float _982 = _968 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_802)
    {
        _970 = _808;
    }
    float _984 = _970;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _846);
    float _988 = _968 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _990 = 0;
    if (_768)
    {
        float _992 = -_964;
        float _994 = _992 + 1.0;
        _990 = as_type<int>(_994);
    }
    int _996 = _990;
    float _998 = _944 * _986;
    float _1000 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[8].x, _982);
    float _1002 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[10].x, _988);
    float _1004 = _882 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1008 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1000);
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1002);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1014 = 0;
    float _1016 = _1004;
    if (_774)
    {
        float _1018 = -_964;
        float _1020 = _1018 + 1.0;
        _1014 = as_type<int>(_1020);
    }
    int _1022 = _1014;
    float _1024 = _862 + _1008;
    float _1026 = _1004 + _1010;
    float _1028 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1012);
    float _1030 = _900 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1032 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1034 = _1024 + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1038 = _1026 + _1036;
    float _1040 = _1024;
    if (_768)
    {
        float _1042 = _916 ? as_type<float>(_996) : _964;
        _962 = _1042;
    }
    float _1044 = _962;
    float _1046 = -_1006;
    float _1048 = fma(_1030, 2.0, _1046);
    float _1050 = _1034 * _1034;
    float _1052 = _1038 * _1038;
    float _1054 = _1050;
    float _1056 = _1052;
    if (_774)
    {
        float _1058 = _952 ? as_type<float>(_1022) : _964;
        _972 = _1058;
    }
    float _1060 = _972;
    float _1062 = _968 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1064 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[83].w, _514);
    float _1066 = _1050 + _1052;
    float _1068 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _934);
    float _1070 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _884);
    float _1072 = fma(_976, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1062);
    float _1074 = sqrt(_1066);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1078 = _980 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1080 = _476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1082 = -_1070;
    float _1084 = fma(_1068, _966, _1082);
    float _1086 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1072);
    float _1088 = _880 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1090 = _582 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1092 = fma(_1078, -2.0, _1076);
    float _1094 = fma(_1080, _1044, -0.5);
    float _1096 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _918);
    float _1098 = -_144;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[76].x, _878);
    float _1102 = _1088 + _1086;
    float _1104 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1028);
    float _1106 = -_144;
    float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1048);
    float _1110 = fma(_1090, _1060, -0.5);
    bool _1112 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1064);
    float _1116 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1092);
    float _1118 = fma(_1096, _1094, _1100);
    float _1120 = fma(_1104, _1110, _1108);
    float _1122 = _1096;
    float _1124 = _1094;
    float _1126 = _1090;
    float _1128 = _1120;
    if (!_1112)
    {
        _1122 = _1026;
    }
    float _1130 = _1122;
    float _1132 = _1130;
    if (!_1112)
    {
        _1124 = _1102;
    }
    float _1134 = _1124;
    bool _1136 = !_1112;
    float _1138 = _1134;
    if (!_1136)
    {
        float _1140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1144 = _1074 + _1142;
        float _1146 = _1102 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = rsqrt(_1066);
        float _1150 = _1144 * _1140;
        float _1152 = _1150 * 0.15915493667125701904296875;
        float _1154 = _1152 * 6.283185482025146484375;
        float _1156 = sin(_1154);
        float _1158 = _1152 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        float _1162 = fma(_1156, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1164 = _1148 * _1162;
        float _1166 = _1160 + (-1.0);
        float _1168 = fma(_1034, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1170 = fma(_1038, _1164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1172 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1176 = _1168 + _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1180 = _1170 + _1178;
        float _1182 = fma(_1102, _1160, _1172);
        float _1184 = _1176 * _1176;
        float _1186 = _1180 * _1180;
        _1138 = _1182;
        _1054 = _1184;
        _1056 = _1186;
        _1040 = _1168;
        _1132 = _1170;
    }
    float _1188 = _1138;
    float _1190 = _1054;
    float _1192 = _1056;
    float _1194 = _1040;
    float _1196 = _1132;
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1200 = _1188 + _1198;
    float _1202 = _844 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1204 = _842 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1206 = -_1116;
    float _1208 = fma(_1114, _942, _1206);
    float _1210 = fma(_1200, _1200, _1190);
    float _1212 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1214 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1218 = _1210 + _1192;
    float _1220 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1222 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1212);
    float _1224 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1214);
    float _1226 = sqrt(_1218);
    float _1228 = fma(_1204, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1216);
    float _1230 = _1084 + 0.5;
    float _1232 = _1118 + 0.5;
    float _1234 = _1208 + 0.5;
    float _1236 = _1120 + 0.5;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1222);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1224);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1228);
    out.m_77.w = _750;
    out.m_79.x = _1232;
    out.m_79.y = _1230;
    out.m_79.z = _1236;
    out.m_79.w = _1234;
    bool _1244 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1246 = isnan(_1226);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1252 = _1248 || _1250;
    out.m_81.x = _804;
    out.m_83.x = _1238;
    out.m_83.y = _1240;
    out.m_83.z = _1242;
    float _1254 = _1192;
    float _1256 = _1194;
    if (!_1252)
    {
        _1126 = 1.0;
    }
    float _1258 = _1126;
    bool _1260 = !_1252;
    float _1262 = _1258;
    if (!_1260)
    {
        bool _1264 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1266 = isnan(_1226);
        bool _1268 = _1264 || _1266;
        bool _1270 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1272 = _1268 || _1270;
        if (!_1272)
        {
            float _1274 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1276 = _1226 + _1274;
            float _1278 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1280 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1278;
            float _1282 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1284 = _1282 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1286 = 1.0 / _1280;
            float _1288 = _1276 * _1286;
            float _1290 = fma(_1288, _1284, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1262 = _1290;
            _1292 = true;
        }
        else
        {
            bool _1294 = _1226 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1296 = isnan(_1226);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1302 = _1298 || _1300;
            if (!_1302)
            {
                float _1304 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1306 = _1226 + _1304;
                float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1310 = _1308 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1314 = _1312 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1316 = 1.0 / _1310;
                float _1318 = _1306 * _1316;
                float _1320 = fma(_1318, _1314, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1262 = _1320;
                _1292 = true;
            }
            else
            {
                _1262 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1292 = false;
    float _1322 = _1262;
    float _1324 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1326 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1328 = _1194 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1332 = _1196 + _1330;
    float _1334 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1324);
    float _1336 = fma(_1328, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1338 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1334);
    float _1340 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1344 = _1336 + _1342;
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1348 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1340);
    float _1350 = 1.0 / _1346;
    float _1352 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1348);
    float _1354 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1356 = _1188 + _1354;
    float _1358 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1362 = fma(_1356, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1364 = fma(_1332, _1322, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1366 = floor(_1358);
    float _1368 = _1360 + _1346;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1362 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1376 = _1364 + _1374;
    float _1378 = _1372 * _1372;
    float _1380 = _1368 * _1350;
    float _1382 = _1380 * 0.5;
    float _1384 = fma(_1344, _1344, _1378);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1388 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1386);
    float _1390 = fma(_1376, _1376, _1384);
    float _1392 = 1.0 / _1388;
    float _1394 = rsqrt(_1390);
    float _1396 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1398 = _1392 * _1396;
    float _1400 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1402 = sqrt(_1390);
    bool _1404 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1406 = _1088 + _1400;
    bool _1408 = _1398 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1410 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    bool _1412 = !_1404;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1420 = _1344 * _1410;
    float _1422 = _1376 * _1410;
    float _1424 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1416);
    float _1426 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1418);
    float _1428 = _1420 * _1420;
    float _1430 = _1422 * _1422;
    int _1432 = 2;
    float _1434 = _1422;
    float _1436 = _1428;
    float _1438 = _1420;
    if (!_1404)
    {
        _1432 = 1;
    }
    int _1440 = _1432;
    float _1442 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1424);
    int _1444 = _1440;
    if (!_1408)
    {
        _1444 = _1414;
    }
    int _1446 = _1444;
    float _1448 = _1428 + _1430;
    float _1450 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1426);
    float _1452 = _1442 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    int _1454 = _1446 << 6;
    float _1456 = sqrt(_1448);
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1460 = _1454 + 96;
    uint _1463 = uint(int(uint(_1460) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c15)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c15)._m0[int(_1473)][_1475];
    float _1479 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1481 = trunc(_1452);
    int _1483 = int(_1481);
    float _1485 = trunc(_1458);
    int _1487 = int(_1485);
    bool _1489 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1491 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1493 = _1456 + _1491;
    int _1495 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1497 = _1483 + _1495;
    int _1499 = _1497 + 1;
    float _1501 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1503 = floor(_1479);
    bool _1505 = _1499 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1507 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1501);
    float _1509 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1511 = 0.0;
    float _1513 = _1493;
    int _1515 = _1499;
    float _1517 = _1458;
    if (!_1489)
    {
        _1511 = _1420;
    }
    float _1519 = _1511;
    int _1521 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1523 = _1487 + _1521;
    int _1525 = _1523 + 1;
    float _1527 = _1332;
    float _1529 = _1519;
    if (_1489)
    {
        float _1531 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _1531;
    }
    float _1533 = _1527;
    float _1535 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    int _1537 = _1499 | _1525;
    float _1539 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1541 = _1537 < 0;
    bool _1543 = _1541 || _1505;
    float _1545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (_1489)
    {
        float _1549 = rsqrt(_1448);
        _1254 = _1549;
    }
    float _1551 = _1254;
    bool _1553 = _1525 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1555 = _1553 || _1543;
    float _1557 = -_1503;
    float _1559 = _1479 + _1557;
    float _1561 = precise::max(0.0, _1545);
    float _1563 = -_1547;
    float _1565 = fma(_1563, _1509, 1.0);
    float _1567 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1489)
    {
        float _1569 = _1493 * _1533;
        _1513 = _1569;
    }
    float _1571 = _1513;
    float _1573 = _1406 * _1477;
    float _1575 = -_1410;
    float _1577 = -_1561;
    float _1579 = fma(_1372, _1575, _1577);
    float _1581 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1489)
    {
        float _1583 = _1571 * 0.15915493667125701904296875;
        _1256 = _1583;
    }
    float _1585 = _1256;
    float _1587 = fma(_862, _1469, _1573);
    int _1589 = _1454 + 104;
    uint _1591 = uint(int(uint(_1589) >> uint(2)));
    uint _1593 = uint(int(uint(int(_1591)) >> uint(2)));
    int _1595 = int(_1591) & 3;
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[int(_1593)][_1595];
    int _1599 = int(_1591) + 1;
    uint _1601 = uint(int(uint(_1599) >> uint(2)));
    int _1603 = _1599 & 3;
    float _1605 = (*spvDescriptorSet0.vp_c15)._m0[int(_1601)][_1603];
    float _1607 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1567);
    float _1609 = _1188;
    if (_1489)
    {
        float _1611 = _1585 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        _1609 = _1613;
    }
    float _1615 = _1609;
    float _1617 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1581);
    float _1619 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1621 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1607);
    float _1623 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1617);
    float _1625 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1619);
    float _1627 = _1621 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1629 = _1617;
    if (_1489)
    {
        float _1631 = _1585 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        _1629 = _1633;
    }
    float _1635 = _1629;
    int _1637 = _1454 + 48;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    uint _1641 = uint(int(uint(int(_1639)) >> uint(2)));
    int _1643 = int(_1639) & 3;
    float _1645 = (*spvDescriptorSet0.vp_c15)._m0[int(_1641)][_1643];
    int _1647 = int(_1639) + 1;
    uint _1649 = uint(int(uint(_1647) >> uint(2)));
    int _1651 = _1647 & 3;
    float _1653 = (*spvDescriptorSet0.vp_c15)._m0[int(_1649)][_1651];
    if (_1489)
    {
        float _1655 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1128 = _1655;
    }
    float _1657 = _1128;
    if (!_1555)
    {
        int _1659 = _1525 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1661 = _1659 + _1499;
        _1515 = _1661;
    }
    int _1663 = _1515;
    float _1665 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1625);
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1669 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1667);
    float _1671 = precise::clamp(_1669, 0.0, 1.0);
    float _1673 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1675 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1677 = 0.0;
    float _1679 = _1671;
    if (_1489)
    {
        float _1681 = fma(_1615, _1657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1677 = _1681;
    }
    float _1683 = _1677;
    int _1685 = _1454 + 64;
    uint _1687 = uint(int(uint(_1685) >> uint(2)));
    uint _1689 = uint(int(uint(int(_1687)) >> uint(2)));
    int _1691 = int(_1687) & 3;
    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[int(_1689)][_1691];
    int _1695 = int(_1687) + 1;
    uint _1697 = uint(int(uint(_1695) >> uint(2)));
    int _1699 = _1695 & 3;
    float _1701 = (*spvDescriptorSet0.vp_c15)._m0[int(_1697)][_1699];
    float _1703 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1675);
    float _1707 = 0.0;
    if (_1489)
    {
        float _1709 = _1551 * _1683;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = -_1671;
    float _1715 = _1713 + 1.0;
    float _1717 = 0.0;
    if (!_1489)
    {
        _1717 = _1579;
    }
    float _1719 = _1717;
    float _1721 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1705);
    float _1723 = _1719;
    int _1725 = as_type<int>(_1721);
    if (_1489)
    {
        float _1727 = _1635 + (-1.0);
        _1679 = _1727;
    }
    float _1729 = _1679;
    int _1731 = _1454 + 56;
    uint _1733 = uint(int(uint(_1731) >> uint(2)));
    uint _1735 = uint(int(uint(int(_1733)) >> uint(2)));
    int _1737 = int(_1733) & 3;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
    int _1741 = int(_1733) + 1;
    uint _1743 = uint(int(uint(_1741) >> uint(2)));
    int _1745 = _1741 & 3;
    float _1747 = (*spvDescriptorSet0.vp_c15)._m0[int(_1743)][_1745];
    if (_1489)
    {
        float _1749 = _1420 * _1711;
        _1529 = _1749;
    }
    float _1751 = _1529;
    if (_1489)
    {
        float _1753 = _1422 * _1711;
        _1434 = _1753;
    }
    float _1755 = _1434;
    float _1757 = 0.0;
    if (_1489)
    {
        float _1759 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1757 = _1759;
    }
    float _1761 = _1757;
    float _1763 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1721);
    if (_1489)
    {
        float _1765 = _1751 * _1751;
        _1436 = _1765;
    }
    float _1767 = _1436;
    int _1769 = as_type<int>(_1767);
    if (!_1489)
    {
        _1438 = _1430;
    }
    float _1771 = _1438;
    float _1773 = _1771;
    if (_1489)
    {
        float _1775 = fma(_1579, _1635, _1761);
        _1723 = _1775;
    }
    float _1777 = _1723;
    int _1779 = _1454 + 72;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.vp_c15)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.vp_c15)._m0[int(_1791)][_1793];
    if (!_1555)
    {
        int _1797 = _1663 << 2;
        _1725 = _1797;
    }
    int _1799 = _1725;
    int _1801 = _1799;
    if (_1489)
    {
        float _1803 = _1755 * _1755;
        _1773 = _1803;
    }
    float _1805 = _1773;
    float _1807 = fma(_1777, _1777, _1767);
    if (!_1555)
    {
        uint _1809 = uint(int(uint(_1663) >> uint(2)));
        _1769 = int(_1809);
    }
    int _1811 = _1769;
    float _1813 = abs(_1715);
    float _1815 = log2(_1813);
    float _1817 = as_type<float>(_1811);
    if (!_1555)
    {
        int _1819 = 12 & _1799;
        _1801 = _1819;
    }
    int _1821 = _1801;
    float _1823 = _1807 + _1805;
    int _1825 = _1454 + 80;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    uint _1829 = uint(int(uint(int(_1827)) >> uint(2)));
    int _1831 = int(_1827) & 3;
    float _1833 = (*spvDescriptorSet0.vp_c15)._m0[int(_1829)][_1831];
    int _1835 = int(_1827) + 1;
    uint _1837 = uint(int(uint(_1835) >> uint(2)));
    int _1839 = _1835 & 3;
    float _1841 = (*spvDescriptorSet0.vp_c15)._m0[int(_1837)][_1839];
    float _1843 = -_1366;
    float _1845 = _1358 + _1843;
    if (!_1555)
    {
        int _1847 = _1811 << 4;
        int _1849 = _1847 + _1821;
        _1817 = as_type<float>(_1849);
    }
    float _1851 = _1817;
    float _1853 = fma(_1004, _1597, _1587);
    float _1855 = 1.0 / _1763;
    int _1857 = _1454 + 88;
    uint _1859 = uint(int(uint(_1857) >> uint(2)));
    uint _1861 = uint(int(uint(int(_1859)) >> uint(2)));
    int _1863 = int(_1859) & 3;
    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[int(_1861)][_1863];
    int _1867 = int(_1859) + 1;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    int _1871 = _1867 & 3;
    float _1873 = (*spvDescriptorSet0.vp_c15)._m0[int(_1869)][_1871];
    float _1875 = _1853 + _1605;
    float _1877 = rsqrt(_1823);
    float _1879 = _1406 * _1653;
    float _1881 = _1851;
    if (!_1555)
    {
        int _1883 = as_type<int>(_1851) + 400;
        uint _1885 = uint(int(uint(_1883) >> uint(2)));
        uint _1887 = uint(int(uint(int(_1885)) >> uint(2)));
        int _1889 = int(_1885) & 3;
        float _1891 = (*spvDescriptorSet0.vp_c15)._m0[int(_1887)][_1889];
        _1881 = _1891;
    }
    float _1893 = _1881;
    float _1895 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1897 = fma(_862, _1645, _1879);
    float _1899 = 1.0 / _1875;
    float _1901 = _1406 * _1701;
    float _1903 = fma(_862, _1693, _1901);
    float _1905 = _1877 * _1751;
    float _1907 = _1877 * _1777;
    float _1909 = fma(_1004, _1739, _1897);
    float _1911 = _1877 * _1755;
    float _1913 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1915 = _1739;
    if (!_1555)
    {
        float _1917 = floor(_1458);
        _1915 = _1917;
    }
    float _1919 = _1915;
    float _1921 = _1909 + _1747;
    float _1923 = -_1913;
    float _1925 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1923);
    float _1927 = fma(_1004, _1787, _1903);
    float _1929 = _1921 * _1899;
    float _1931 = -_1911;
    float _1933 = fma(_1931, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1925);
    float _1935 = exp2(_1895);
    float _1937 = _1927 + _1795;
    float _1939 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _1941 = _1929 >= 0.0;
    float _1943 = fma(_1933, -0.5, 0.5);
    float _1945 = _1406 * _1841;
    float _1947 = fma(_1933, 0.5, 0.5);
    bool _1949 = _1929 <= 1.0;
    bool _1951 = _1949 && _1941;
    float _1953 = log2(_1565);
    float _1955 = fma(_862, _1833, _1945);
    float _1957 = _1937 * _1899;
    float _1959 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1939);
    float _1961 = _1943;
    if (!_1555)
    {
        float _1963 = -_1919;
        float _1965 = _1458 + _1963;
        _1517 = _1965;
    }
    float _1967 = _1517;
    float _1969 = fma(_1004, _1865, _1955);
    bool _1971 = _1957 >= 0.0;
    bool _1973 = _1971 && _1951;
    float _1975 = _1969 + _1873;
    float _1977 = sqrt(_1943);
    float _1979 = fma(_1947, -0.0187292993068695068359375, 0.07426099479198455810546875);
    bool _1981 = _1957 <= 1.0;
    bool _1983 = _1981 && _1973;
    float _1985 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1987 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1959);
    float _1989 = fma(_1947, _1979, -0.212114393711090087890625);
    float _1991 = _1907 + 1.0;
    float _1993 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1985);
    float _1995 = _1841;
    if (!_1555)
    {
        float _1997 = floor(_1452);
        _1995 = _1997;
    }
    float _1999 = _1995;
    float _2001 = fma(_1947, _1989, 1.570728778839111328125);
    float _2003 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1987);
    float _2005 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1993);
    float _2007 = -_1907;
    float _2009 = fma(_1935, _1991, _2007);
    float _2011 = _1953 * 0.693147182464599609375;
    float _2013 = _2003 * _1855;
    float _2015 = _2013;
    float _2017 = _2003;
    if (_1983)
    {
        float _2019 = float(_1446);
        _1961 = _2019;
    }
    float _2021 = _1961;
    float _2023 = _1979;
    if (!_1555)
    {
        float _2025 = rint(_1893);
        float _2027 = precise::max(_2025, 0.0);
        uint _2029 = uint(_2027);
        uint _2031 = clamp(_2029, 0u, 65535u);
        _2023 = as_type<float>(_2031);
    }
    float _2033 = _2023;
    float _2035 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2037 = _1977 * 0.636619746685028076171875;
    float _2039 = fma(_2013, 0.5, 0.5);
    float _2041 = fma(_2009, 0.5, 0.5);
    float _2043 = _2035 * _1855;
    float _2045 = -_2001;
    float _2047 = fma(_2037, _2045, 1.0);
    float _2049 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2051 = _2021;
    if (_1983)
    {
        float _2053 = rint(_2021);
        float _2055 = precise::max(_2053, 0.0);
        uint _2057 = uint(_2055);
        uint _2059 = clamp(_2057, 0u, 65535u);
        _2051 = as_type<float>(_2059);
    }
    float _2061 = _2051;
    if (!_1555)
    {
        float _2063 = -_1999;
        float _2065 = _1452 + _2063;
        _2015 = _2065;
    }
    float _2067 = _2015;
    float _2069 = _1975 * _1899;
    float _2071 = fma(_2043, -0.5, 0.5);
    float2 _5942 = float2(_1559, _1845);
    float _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5942, float2(0.0), isnan(_5942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5942, float2(0.0), isnan(_5942)), level(0.0)).x;
    float _2075 = _1967;
    if (!_1555)
    {
        float3 _5959 = float3(_2067, _1967, float(as_type<int>(_2033)));
        float3 _5963 = select(_5959, float3(0.0), isnan(_5959));
        float _2077 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5963.xy, uint(rint(_5963.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5963.xy, uint(rint(_5963.z)), level(0.0)).x;
        _2075 = _2077;
    }
    float _2079 = _2075;
    float _2081 = _2061;
    if (_1983)
    {
        float3 _5978 = float3(_1929, _1957, float(as_type<int>(_2061)));
        float3 _5980 = select(_5978, float3(0.0), isnan(_5978));
        float _2083 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5980.xy, uint(rint(_5980.z)), _2069, level(0.0));
        _2081 = _2083;
    }
    float _2085 = _2081;
    float3 _5990 = float3(_2039, _2071, _2049);
    float _2087 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5990, float3(0.0), isnan(_5990)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5990, float3(0.0), isnan(_5990)), level(0.0)).x;
    float3 _5999 = float3(_2039, _2071, _2049);
    float4 _2090 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5999, float3(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5999, float3(0.0), isnan(_5999)), level(0.0)).xyzw;
    float _2092 = _2090.x;
    float _2094 = _2090.y;
    float _2096 = _2090.z;
    float _2098 = _2090.w;
    float2 _6015 = float2(_2047, _2041);
    float3 _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6015, float2(0.0), isnan(_6015)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6015, float2(0.0), isnan(_6015)), level(0.0)).xyz;
    float _2104 = _2102.x;
    float _2106 = _2102.y;
    float _2108 = _2102.z;
    float _2110 = abs(_1398);
    float _2112 = log2(_2110);
    float _2114 = _1627 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2116 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2118 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2114);
    float _2120 = _2003 + _1763;
    float _2122 = exp2(_2116);
    float _2124 = _2120 * 0.5;
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2128 = fma(_1539, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2118);
    float _2130 = _1763 * 0.5;
    float _2132 = fma(_1703, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2128);
    float _2134 = exp2(_2126);
    float _2136 = fma(_2035, -0.5, _2130);
    float _2138 = _2132 + _1763;
    out.gl_Position.x = _2003;
    out.gl_Position.y = _2035;
    out.gl_Position.z = _2132;
    out.gl_Position.w = _1763;
    float _2140 = _2138 * 0.5;
    bool _2142 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan(0.5);
    bool _2150 = _2146 || _2148;
    out.m_85.x = _2124;
    out.m_85.y = _2136;
    out.m_85.z = _2140;
    out.m_85.w = _1763;
    bool _2152 = _1398 <= 8000.0;
    bool _2154 = isnan(_1398);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan(8000.0);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2166 = precise::clamp(_2164, 0.0, 1.0);
    float _2168 = fma(_2166, -2.0, 3.0);
    float _2170 = _2166 * _2166;
    float _2172 = _2132;
    if (_2150)
    {
        _2017 = 1.0;
    }
    float _2174 = _2017;
    float _2176 = _2170 * _2168;
    float _2178 = -_2176;
    float _2180 = _2178 + 1.0;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2176);
    float _2184 = _2162 * _2182;
    float _2186 = _2174;
    if (!_2150)
    {
        float _2188 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2190 = _2188 * 0.15915493667125701904296875;
        float _2192 = _2190 * 6.283185482025146484375;
        float _2194 = cos(_2192);
        float _2196 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2198 = _2196 * 0.15915493667125701904296875;
        float _2200 = _2190 * 6.283185482025146484375;
        float _2202 = sin(_2200);
        float _2204 = 1.0 / _2194;
        float _2206 = _2198 * 6.283185482025146484375;
        float _2208 = cos(_2206);
        float _2210 = _2202 * _2204;
        float _2212 = _2198 * 6.283185482025146484375;
        float _2214 = sin(_2212);
        float _2216 = _2208 * _2210;
        float _2218 = 1.0 / _2216;
        float _2220 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2222 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2220;
        float _2224 = 1.0 / _2222;
        float _2226 = _2214 * _2218;
        float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2230 = fma(_1398, _2226, _2228);
        float _2232 = _2230 * _2224;
        float _2234 = precise::clamp(_2232, 0.0, 1.0);
        _2172 = _2224;
        _2186 = _2234;
    }
    float _2236 = _2172;
    float _2238 = _2186;
    float _2240 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2242 = -_2073;
    float _2244 = _2242 + 1.0;
    float _2246 = -_2122;
    float _2248 = _2246 + 1.0;
    float _2250 = _2236;
    float _2252 = _2240;
    if (!_1983)
    {
        _2250 = 1.0;
    }
    float _2254 = _2250;
    float _2256 = _2244 * _2240;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    float _2260 = _2254;
    if (_1983)
    {
        bool _2262 = _2085 >= _2069;
        bool _2264 = isnan(_2085);
        bool _2266 = _2262 || _2264;
        bool _2268 = isnan(_2069);
        bool _2270 = _2266 || _2268;
        float _2272 = float(_2270);
        _2260 = _2272;
    }
    float _2274 = _2260;
    float _2276 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1555)
    {
        _2252 = 1.0;
    }
    float _2278 = _2252;
    float _2280 = _2278;
    if (!_1555)
    {
        int _2282 = _1663 << 4;
        int _2284 = _2282 + 2048;
        uint _2286 = uint(int(uint(_2284) >> uint(2)));
        uint _2288 = uint(int(uint(int(_2286)) >> uint(2)));
        int _2290 = int(_2286) & 3;
        float _2292 = (*spvDescriptorSet0.vp_c15)._m0[int(_2288)][_2290];
        int _2294 = int(_2286) + 1;
        uint _2296 = uint(int(uint(_2294) >> uint(2)));
        int _2298 = _2294 & 3;
        float _2300 = (*spvDescriptorSet0.vp_c15)._m0[int(_2296)][_2298];
        int _2302 = _2284 + 8;
        uint _2304 = uint(int(uint(_2302) >> uint(2)));
        uint _2306 = uint(int(uint(int(_2304)) >> uint(2)));
        int _2308 = int(_2304) & 3;
        float _2310 = (*spvDescriptorSet0.vp_c15)._m0[int(_2306)][_2308];
        int _2312 = int(_2304) + 1;
        uint _2314 = uint(int(uint(_2312) >> uint(2)));
        int _2316 = _2312 & 3;
        float _2318 = (*spvDescriptorSet0.vp_c15)._m0[int(_2314)][_2316];
        float _2320 = _1406 * _2300;
        float _2322 = fma(_862, _2292, _2320);
        float _2324 = fma(_1004, _2310, _2322);
        float _2326 = _2324 + _2318;
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = -_2328;
        float _2332 = _2330 + _2079;
        float _2334 = fma(_2332, 500.0, 1.5);
        float _2336 = exp2(_2334);
        float _2338 = 0.0 + _2336;
        float _2340 = precise::clamp(_2338, 0.0, 1.0);
        _2280 = _2340;
        _1016 = 500.0;
    }
    float _2342 = _2280;
    float _2344 = _1016;
    float _2346 = _2276 * _2087;
    float _2348 = _2274 * _2342;
    float _2350 = -_2258;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2354 = -_2276;
    float _2356 = _2354 + 1.0;
    float _2358 = _2098 * _2346;
    float _2360 = _2108 * _2346;
    float _2362 = -_2348;
    float _2364 = fma(_2362, _2352, 1.0);
    float _2366 = precise::clamp(_2364, 0.0, 1.0);
    float _2368 = _2098 * _2356;
    float _2370 = fma(_2104, _2358, _2092);
    float _2372 = fma(_2106, _2358, _2094);
    float _2374 = _2366 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2376 = fma(_2098, _2360, _2096);
    bool _2378 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2380 = isnan(_1402);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2386 = _2382 || _2384;
    float _2388 = _2238 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_87.x = _2374;
    out.m_89.x = _2370;
    out.m_89.y = _2372;
    out.m_89.z = _2376;
    out.m_89.w = _2368;
    float _2390 = _2356;
    float _2392 = _2366;
    float _2394 = _2344;
    if (!_2386)
    {
        _2390 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2396 = _2390;
    float _2398 = _2396;
    float _2400 = _2396;
    if (!_2386)
    {
        _2392 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2402 = _2392;
    float _2404 = _2402;
    float _2406 = _2402;
    if (!_2386)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2408 = _2394;
    bool _2410 = !_2386;
    float _2412 = _2408;
    float _2414 = _2408;
    if (!_2410)
    {
        bool _2416 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2418 = isnan(_1402);
        bool _2420 = _2416 || _2418;
        bool _2422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2424 = _2420 || _2422;
        if (!_2424)
        {
            float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2428 = _1402 + _2426;
            float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2432 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2430;
            float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2442 = 1.0 / _2432;
            float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2448 = _2428 * _2442;
            float _2450 = precise::clamp(_2448, 0.0, 1.0);
            float _2452 = fma(_2450, _2436, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2454 = fma(_2450, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2456 = fma(_2450, _2446, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _2406 = _2454;
            _2400 = _2452;
            _2414 = _2456;
            _2458 = true;
        }
        else
        {
            bool _2460 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2462 = isnan(_1402);
            bool _2464 = _2460 || _2462;
            bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2468 = _2464 || _2466;
            if (!_2468)
            {
                _2398 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2470 = _2398;
            _2400 = _2470;
            if (!_2468)
            {
                _2404 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2472 = _2404;
            _2406 = _2472;
            if (!_2468)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2474 = _2412;
            bool _2476 = !_2468;
            _2414 = _2474;
            if (!_2476)
            {
                bool _2478 = _1402 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1402);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1402 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2504 = 1.0 / _2494;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2510 = _2490 * _2504;
                    float _2512 = precise::clamp(_2510, 0.0, 1.0);
                    float _2514 = fma(_2512, _2498, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2516 = fma(_2512, _2502, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2518 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _2406 = _2516;
                    _2400 = _2514;
                    _2414 = _2518;
                    _2458 = true;
                }
                else
                {
                    _2406 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2400 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _2458 = false;
    float _2520 = _2406;
    float _2522 = _2400;
    float _2524 = _2414;
    float _2526 = _2388 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _2528 = _2520 * 0.586610972881317138671875;
    bool _2530 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_61.x = _2526;
    float _2532 = fma(_2522, 0.298911988735198974609375, _2528);
    bool _2534 = _2238 > 0.0;
    bool _2536 = isnan(_2238);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = fma(_2524, 0.114477999508380889892578125, _2532);
    float _2546 = -_2544;
    float _2548 = _2546 + _2522;
    float _2550 = -_2544;
    float _2552 = _2550 + _2520;
    float _2554 = -_2544;
    float _2556 = _2554 + _2524;
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2560 = fma(_2552, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    float _2562 = fma(_2556, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2544);
    bool _2564 = !_2530;
    if (!_2564)
    {
        float _2566 = -_1362;
        float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2570 = -_1336;
        float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2574 = -_1364;
        float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2578 = _2568 * _2568;
        float _2580 = fma(_2572, _2572, _2578);
        float _2582 = fma(_2576, _2576, _2580);
        float _2584 = sqrt(_2582);
        float _2586 = rsqrt(_2582);
        float _2588 = -_2584;
        float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2592 = _2590 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        float _2596 = _2572 * _2586;
        float _2598 = _2568 * _2586;
        float _2600 = abs(_2594);
        float _2602 = log2(_2600);
        float _2604 = _2576 * _2586;
        float _2606 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2608 = _1240 * _2598;
        float _2610 = -_2598;
        float _2612 = -_2606;
        float _2614 = fma(_2610, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2612);
        float _2616 = fma(_1238, _2596, _2608);
        float _2618 = -_2604;
        float _2620 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2614);
        float _2622 = fma(_1242, _2604, _2616);
        float _2624 = precise::clamp(_2622, 0.0, 1.0);
        float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2628 = _2620 + _2626;
        float _2630 = _2602 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = exp2(_2630);
        float _2638 = _2636 * _2634;
        float _2640 = _2624 * _2638;
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2644 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2646 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2642;
        out.m_91.y = _2644;
        out.m_91.z = _2646;
    }
    out.m_93.x = _2558;
    out.m_93.y = _2560;
    out.m_93.z = _2562;
    if (_2542)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2648 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2648;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

