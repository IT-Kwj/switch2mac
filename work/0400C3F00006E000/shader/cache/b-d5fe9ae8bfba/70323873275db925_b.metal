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
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    texture2d_array<float> vp_t_tcb_14 [[id(16)]];
    sampler vp_t_tcb_14Smplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
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
    float4 m_75 [[attribute(5)]];
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2366 = false;
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
        float _2651 = as_type<float>(_126);
        out.gl_Position.z = _2651;
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
        float _2720 = as_type<float>(_162);
        out.gl_Position.z = _2720;
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
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _228;
    float _232 = 1.0 / _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = 1.0 / _226;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = 1.0 / _230;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _254 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _218 + _258;
    float _262 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = 1.0 / _236;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _266;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _272 = _260 * _238;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = _218 + _274;
    bool _278 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _280 = isnan(_218);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = _270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _292 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_218);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _268;
    float _306 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _218 + _308;
    out.m_67.x = _256;
    out.m_67.y = _290;
    out.m_67.z = _262;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _318 = _310 * _232;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _218 + _320;
    out.m_69.x = _246;
    out.m_69.y = _254;
    out.m_69.z = _306;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _326 = _218 + _324;
    float _328 = _322 * _248;
    bool _330 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _332 = isnan(_218);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = _326 * _264;
    float _344 = fma(_314, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = -_288;
    float _348 = _346 + 1.0;
    float _350 = _276 * _304;
    bool _352 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_218);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -_340;
    float _366 = _364 + 1.0;
    bool _368 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_218);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _302 * _348;
    float _386 = -_302;
    float _388 = _386 + 1.0;
    bool _390 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_218);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _378 * _366;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = fma(_382, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _410 = -_378;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = fma(_406, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = _362 * _388;
    float _422 = -_362;
    float _424 = _422 + 1.0;
    float _426 = _288 * _412;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _400 * _424;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = fma(_416, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = _418 * _436;
    float _446 = _408 * _436;
    float _448 = fma(_430, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = _344 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _444);
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _462 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _464 = fma(_456, _328, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = fma(_442, _420, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_468, _342, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_464, _384, _470);
    float _488 = fma(_474, _328, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_478, _328, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_448, _420, _460);
    float _494 = fma(_450, _420, _462);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = fma(_482, _342, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_488, _384, _492);
    float _504 = fma(_490, _384, _494);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _510;
    float _514 = fma(_498, _342, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_484, _426, _486);
    float _522 = fma(_508, _350, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_512, _350, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _350, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_514, _426, _502);
    float _530 = fma(_500, _426, _504);
    float _532 = fma(_522, _402, _520);
    float _534 = fma(_524, _402, _528);
    float _536 = fma(_526, _402, _530);
    float _538 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_316;
    float _546 = _538;
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
    float _582 = _186 * _186;
    float _584 = fma(_184, _184, _582);
    float _586 = fma(_188, _188, _584);
    float _588 = rsqrt(_586);
    float _590 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _592 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _594 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _596 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _590);
    float _598 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _592);
    float _600 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
    float _602 = _186 * _588;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _596);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _598);
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
    float _610 = _184 * _588;
    float _612 = in.m_71.x;
    float _614 = in.m_71.y;
    float _616 = in.m_71.z;
    float _618 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _620 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _622 = _602 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _624 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _632 = _620 + _630;
    float _634 = _188 * _588;
    float _636 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[8].y, _622);
    float _638 = _628 * _628;
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _642 = _624 + _640;
    float _644 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[10].y, _636);
    float _646 = fma(_632, _632, _638);
    float _648 = fma(_642, _642, _646);
    float _650 = abs(_644);
    bool _652 = _650 > 0.99989998340606689453125;
    float _654 = rsqrt(_648);
    float _656 = _538 * _612;
    float _658 = _540 * _614;
    float _660 = _542 * _616;
    float _662 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _664 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _666 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _668 = _644;
    float _670 = _648;
    float _672 = _588;
    if (_652)
    {
        _668 = 0.001000000047497451305389404296875;
    }
    float _674 = _668;
    float _676 = _662 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (!_652)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _678 = _546;
    float _680 = _678;
    if (!_652)
    {
        _670 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _682 = _670;
    float _684 = _682;
    if (_652)
    {
        float _686 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = _676 * _654;
    if (_652)
    {
        float _692 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _684 = _692;
    }
    float _694 = _684;
    if (!_652)
    {
        _672 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _696 = _672;
    float _698 = -_688;
    float _700 = _634 * _698;
    float _702 = _628 * _690;
    float _704 = _632 * _690;
    float _706 = _696;
    if (_652)
    {
        float _708 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _706 = _708;
    }
    float _710 = _706;
    float _712 = -_694;
    float _714 = -_700;
    float _716 = fma(_610, _712, _714);
    float _718 = -_702;
    float _720 = _628 + _718;
    float _722 = -_704;
    float _724 = _632 + _722;
    float _726 = _642 * _690;
    float _728 = _716 * _716;
    float _730 = _720 * _720;
    float _732 = -_694;
    float _734 = _602 * _732;
    float _736 = -_726;
    float _738 = _642 + _736;
    float _740 = fma(_724, _724, _730);
    float _742 = -_710;
    float _744 = -_734;
    float _746 = fma(_634, _742, _744);
    float _748 = -_710;
    float _750 = _610 * _748;
    float _752 = fma(_738, _738, _740);
    float _754 = fma(_746, _746, _728);
    float _756 = -_688;
    float _758 = -_750;
    float _760 = fma(_602, _756, _758);
    float _762 = in.m_73.x;
    float _764 = in.m_73.y;
    float _766 = in.m_73.z;
    float _768 = sqrt(_752);
    float _770 = fma(_760, _760, _754);
    float _772 = rsqrt(_770);
    float _774 = _654 * _768;
    float _776 = _664 * _774;
    float _778 = _666 * _774;
    float _780 = _662 * _774;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _784 = _760 * _772;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _788 = _716 * _772;
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _792 = _776 * _782;
    float _794 = _778 * _786;
    float _796 = _746 * _772;
    float _798 = _780 * _790;
    float _800 = _610 * _788;
    float _802 = _792 * _634;
    float _804 = _602 * _784;
    float _806 = _792 * _610;
    float _808 = -_800;
    float _810 = fma(_602, _796, _808);
    float _812 = fma(_798, _784, _802);
    float _814 = -_804;
    float _816 = fma(_634, _788, _814);
    float _818 = fma(_798, _796, _806);
    float _820 = _634 * _796;
    float _822 = fma(_794, _810, _812);
    float _824 = fma(_794, _816, _818);
    float _826 = -_820;
    float _828 = fma(_610, _784, _826);
    float _830 = _624 + _822;
    float _832 = _620 + _824;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _836 = _830 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _840 = _832 + _838;
    float _842 = _836 * _836;
    float _844 = fma(_840, _840, _842);
    float _846 = _792 * _602;
    float _848 = sqrt(_844);
    float _850 = fma(_798, _788, _846);
    float _852 = fma(_794, _828, _850);
    float _854 = _618 + _852;
    bool _856 = _848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = _794;
    float _860 = _798;
    float _862 = _792;
    if (!_856)
    {
        _858 = _832;
    }
    float _864 = _858;
    float _866 = _864;
    if (!_856)
    {
        _860 = _830;
    }
    float _868 = _860;
    float _870 = _868;
    if (!_856)
    {
        _862 = _854;
    }
    float _872 = _862;
    bool _874 = !_856;
    float _876 = _872;
    if (!_874)
    {
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _882 = _848 + _880;
        float _884 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = rsqrt(_844);
        float _888 = _882 * _878;
        float _890 = _888 * 0.15915493667125701904296875;
        float _892 = _890 * 6.283185482025146484375;
        float _894 = sin(_892);
        float _896 = _890 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = fma(_894, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _902 = _886 * _900;
        float _904 = _898 + (-1.0);
        float _906 = fma(_840, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _908 = fma(_836, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _910 = _904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_854, _898, _910);
        _876 = _912;
        _866 = _906;
        _870 = _908;
    }
    float _914 = _876;
    float _916 = _866;
    float _918 = _870;
    float _920 = -_702;
    float _922 = _920 + _914;
    float _924 = -_704;
    float _926 = _924 + _916;
    float _928 = -_726;
    float _930 = _928 + _918;
    float _932 = -_702;
    float _934 = _618 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _938 = _922 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _942 = _926 + _940;
    float _944 = -_704;
    float _946 = _620 + _944;
    float _948 = _934 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _950 = _938 * _938;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _930 + _952;
    float _956 = -_726;
    float _958 = _624 + _956;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].x, _948);
    float _962 = fma(_942, _942, _950);
    float _964 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _960);
    float _966 = fma(_954, _954, _962);
    float _968 = _934 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _970 = _964 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _972 = rsqrt(_966);
    float _974 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].x, _968);
    float _976 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _974);
    float _978 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _980 = 1.0 / _970;
    float _982 = _976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _984 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _986 = _982 + _970;
    float _988 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _990 = floor(_978);
    float _992 = _942 * _988;
    float _994 = _954 * _988;
    float _996 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _998 = _986 * _980;
    float _1000 = _998 * 0.5;
    float _1002 = _992 * _992;
    float _1004 = _994 * _994;
    float _1006 = _934 + _996;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1010 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1008);
    float _1012 = sqrt(_966);
    float _1014 = _1002 + _1004;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1020 = -_990;
    float _1022 = _978 + _1020;
    float _1024 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1016);
    float _1026 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1018);
    float _1028 = sqrt(_1014);
    float _1030 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1024);
    float _1032 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1026);
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1038 = 1.0 / _1010;
    bool _1040 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = trunc(_1034);
    int _1044 = int(_1042);
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = _1028 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1052 = _1038 * _1050;
    float _1054 = floor(_984);
    bool _1056 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1058 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1060 = _1030;
    int _1062 = 2;
    float _1064 = _1048;
    float _1066 = _990;
    float _1068 = _988;
    float _1070 = _992;
    float _1072 = _994;
    int _1074 = as_type<int>(_1054);
    int _1076 = as_type<int>(_984);
    float _1078 = _1002;
    float _1080 = _1004;
    float _1082 = _1036;
    if (_1040)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1084;
    }
    float _1086 = _1060;
    bool _1088 = !_1056;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1094 = _1044 + _1092;
    int _1096 = _1094 + 1;
    float _1098 = trunc(_1036);
    int _1100 = int(_1098);
    float _1102 = as_type<float>(_1090);
    float _1104 = as_type<float>(_1096);
    if (!_1056)
    {
        _1062 = 1;
    }
    int _1106 = _1062;
    int _1108 = _1106;
    if (!_1058)
    {
        _1108 = _1090;
    }
    int _1110 = _1108;
    bool _1112 = _1096 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1114 = _1110 << 6;
    if (_1040)
    {
        float _1116 = _1048 * _1086;
        _1102 = _1116;
    }
    float _1118 = _1102;
    if (_1040)
    {
        float _1120 = rsqrt(_1014);
        _1064 = _1120;
    }
    float _1122 = _1064;
    int _1124 = _1114 + 96;
    uint _1127 = uint(int(uint(_1124) >> uint(2)));
    uint _1129 = uint(int(uint(int(_1127)) >> uint(2)));
    int _1131 = int(_1127) & 3;
    float _1133 = (*spvDescriptorSet0.vp_c15)._m0[int(_1129)][_1131];
    int _1135 = int(_1127) + 1;
    uint _1137 = uint(int(uint(_1135) >> uint(2)));
    int _1139 = _1135 & 3;
    float _1141 = (*spvDescriptorSet0.vp_c15)._m0[int(_1137)][_1139];
    float _1143 = 0.0;
    float _1145 = _1122;
    if (_1040)
    {
        float _1147 = _1118 * 0.15915493667125701904296875;
        _1143 = _1147;
    }
    float _1149 = _1143;
    int _1151 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1153 = _1100 + _1151;
    int _1155 = _1153 + 1;
    float _1157 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1159 = 0.0;
    float _1161 = _1149;
    if (_1040)
    {
        float _1163 = _1149 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        _1159 = _1165;
    }
    float _1167 = _1159;
    int _1169 = _1114 + 48;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    uint _1173 = uint(int(uint(int(_1171)) >> uint(2)));
    int _1175 = int(_1171) & 3;
    float _1177 = (*spvDescriptorSet0.vp_c15)._m0[int(_1173)][_1175];
    int _1179 = int(_1171) + 1;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    int _1183 = _1179 & 3;
    float _1185 = (*spvDescriptorSet0.vp_c15)._m0[int(_1181)][_1183];
    int _1187 = _1096 | _1155;
    bool _1189 = _1187 < 0;
    bool _1191 = _1189 || _1112;
    float _1193 = precise::max(0.0, _1157);
    int _1195 = _1114 + 64;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    uint _1199 = uint(int(uint(int(_1197)) >> uint(2)));
    int _1201 = int(_1197) & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    int _1205 = int(_1197) + 1;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    int _1209 = _1205 & 3;
    float _1211 = (*spvDescriptorSet0.vp_c15)._m0[int(_1207)][_1209];
    float _1213 = 0.0;
    if (_1040)
    {
        float _1215 = _1149 * 6.283185482025146484375;
        float _1217 = sin(_1215);
        _1213 = _1217;
    }
    float _1219 = _1213;
    bool _1221 = _1155 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1223 = _1221 || _1191;
    float _1225 = -_988;
    float _1227 = -_1193;
    float _1229 = fma(_938, _1225, _1227);
    if (_1040)
    {
        float _1231 = _1167 + (-1.0);
        _1066 = _1231;
    }
    float _1233 = _1066;
    int _1235 = _1114 + 104;
    uint _1237 = uint(int(uint(_1235) >> uint(2)));
    uint _1239 = uint(int(uint(int(_1237)) >> uint(2)));
    int _1241 = int(_1237) & 3;
    float _1243 = (*spvDescriptorSet0.vp_c15)._m0[int(_1239)][_1241];
    int _1245 = int(_1237) + 1;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    int _1249 = _1245 & 3;
    float _1251 = (*spvDescriptorSet0.vp_c15)._m0[int(_1247)][_1249];
    if (_1040)
    {
        float _1253 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1068 = _1253;
    }
    float _1255 = _1068;
    int _1257 = _1114 + 56;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c15)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
    float _1275 = _1219;
    int _1277 = as_type<int>(_1255);
    if (_1040)
    {
        float _1279 = fma(_1219, _1255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1275 = _1279;
    }
    float _1281 = _1275;
    float _1283 = _1281;
    if (!_1223)
    {
        int _1285 = _1155 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1287 = _1285 + _1096;
        _1277 = _1287;
    }
    int _1289 = _1277;
    if (_1040)
    {
        float _1291 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1291;
    }
    float _1293 = _1104;
    float _1295 = -_1054;
    float _1297 = _984 + _1295;
    if (_1040)
    {
        float _1299 = _1122 * _1281;
        _1161 = _1299;
    }
    float _1301 = _1161;
    if (!_1040)
    {
        _1145 = _1229;
    }
    float _1303 = _1145;
    float _1305 = _1303;
    if (_1040)
    {
        float _1307 = fma(_1229, _1167, _1293);
        _1305 = _1307;
    }
    float _1309 = _1305;
    int _1311 = _1114 + 80;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    if (_1040)
    {
        float _1329 = _992 * _1301;
        _1070 = _1329;
    }
    float _1331 = _1070;
    if (_1040)
    {
        float _1333 = _994 * _1301;
        _1072 = _1333;
    }
    float _1335 = _1072;
    if (!_1223)
    {
        int _1337 = _1289 << 2;
        _1074 = _1337;
    }
    int _1339 = _1074;
    int _1341 = _1339;
    if (!_1223)
    {
        uint _1343 = uint(int(uint(_1289) >> uint(2)));
        _1076 = int(_1343);
    }
    int _1345 = _1076;
    if (_1040)
    {
        float _1347 = _1331 * _1331;
        _1078 = _1347;
    }
    float _1349 = _1078;
    if (_1040)
    {
        float _1351 = _1335 * _1335;
        _1080 = _1351;
    }
    float _1353 = _1080;
    int _1355 = _1114 + 72;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    float _1373 = _1006 * _1141;
    float _1375 = fma(_1309, _1309, _1349);
    int _1377 = as_type<int>(_1141);
    if (!_1223)
    {
        int _1379 = 12 & _1339;
        _1341 = _1379;
    }
    int _1381 = _1341;
    int _1383 = _1114 + 88;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    float _1401 = fma(_946, _1133, _1373);
    float _1403 = _1006 * _1185;
    float _1405 = _1375 + _1353;
    if (!_1223)
    {
        int _1407 = _1345 << 4;
        int _1409 = _1407 + _1381;
        _1377 = _1409;
    }
    int _1411 = _1377;
    float _1413 = _1006 * _1211;
    float _1415 = fma(_946, _1177, _1403);
    float _1417 = rsqrt(_1405);
    float _1419 = as_type<float>(_1345);
    if (!_1223)
    {
        int _1421 = _1411 + 400;
        uint _1423 = uint(int(uint(_1421) >> uint(2)));
        uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
        int _1427 = int(_1423) & 3;
        float _1429 = (*spvDescriptorSet0.vp_c15)._m0[int(_1425)][_1427];
        _1419 = _1429;
    }
    float _1431 = _1419;
    float _1433 = fma(_946, _1203, _1413);
    float _1435 = fma(_958, _1243, _1401);
    float2 _4851 = float2(_1022, _1297);
    float _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).x;
    if (!_1223)
    {
        float _1439 = floor(_1036);
        _1283 = _1439;
    }
    float _1441 = _1283;
    float _1443 = fma(_958, _1265, _1415);
    float _1445 = _1435 + _1251;
    float _1447 = _922 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1449 = _1417 * _1331;
    float _1451 = _1443 + _1273;
    float _1453 = _1417 * _1309;
    float _1455 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1447);
    float _1457 = 1.0 / _1445;
    float _1459 = _1006 * _1327;
    float _1461 = _1417 * _1335;
    float _1463 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1455);
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1467 = fma(_946, _1319, _1459);
    float _1469 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1473 = _922 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1475 = fma(_958, _1363, _1433);
    float _1477 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1479 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1473);
    float _1481 = _1475 + _1371;
    float _1483 = -_1465;
    float _1485 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1483);
    float _1487 = -_1477;
    float _1489 = fma(_1487, _1469, 1.0);
    float _1491 = _1451 * _1457;
    float _1493 = fma(_958, _1391, _1467);
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1497 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1495);
    float _1499 = precise::clamp(_1497, 0.0, 1.0);
    float _1501 = _1481 * _1457;
    float _1503 = _922 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1505 = _1491 >= 0.0;
    float _1507 = -_1499;
    float _1509 = _1507 + 1.0;
    float _1511 = _922 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1503);
    bool _1515 = _1491 <= 1.0;
    bool _1517 = _1515 && _1505;
    float _1519 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1521 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1523 = abs(_1509);
    float _1525 = log2(_1523);
    bool _1527 = _1501 >= 0.0;
    bool _1529 = _1527 && _1517;
    float _1531 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1513);
    float _1533 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1521);
    float _1535 = -_1461;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1485);
    bool _1539 = _1501 <= 1.0;
    bool _1541 = _1539 && _1529;
    float _1543 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1545 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1547 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1549 = _1453 + 1.0;
    float _1551 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1553 = log2(_1489);
    float _1555 = _1493 + _1399;
    float _1557 = fma(_1537, -0.5, 0.5);
    float _1559 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1551);
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1563 = fma(_1537, 0.5, 0.5);
    float _1565 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1559);
    float _1567 = _1451;
    float _1569 = _1489;
    if (!_1223)
    {
        float _1571 = floor(_1034);
        _1567 = _1571;
    }
    float _1573 = _1567;
    if (_1541)
    {
        float _1575 = float(_1110);
        _1569 = _1575;
    }
    float _1577 = _1569;
    float _1579 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1581 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1583 = fma(_1563, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1223)
    {
        float _1585 = -_1441;
        float _1587 = _1036 + _1585;
        _1082 = _1587;
    }
    float _1589 = _1082;
    float _1591 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1579);
    float _1593 = exp2(_1561);
    float _1595 = fma(_1563, _1583, -0.212114393711090087890625);
    float _1597 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1591);
    float _1599 = _1553 * 0.693147182464599609375;
    float _1601 = fma(_1563, _1595, 1.570728778839111328125);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1577;
    if (_1541)
    {
        float _1607 = rint(_1577);
        float _1609 = precise::max(_1607, 0.0);
        uint _1611 = uint(_1609);
        uint _1613 = clamp(_1611, 0u, 65535u);
        _1605 = as_type<float>(_1613);
    }
    float _1615 = _1605;
    float _1617 = _1573;
    if (!_1223)
    {
        float _1619 = -_1573;
        float _1621 = _1034 + _1619;
        _1617 = _1621;
    }
    float _1623 = _1617;
    float _1625 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1597);
    float _1627 = -_1453;
    float _1629 = fma(_1593, _1549, _1627);
    float _1631 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1633 = sqrt(_1557);
    float _1635 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1631);
    float _1637 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1639 = _1555 * _1457;
    float _1641 = 1.0 / _1581;
    float _1643 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1637);
    float _1645 = _1615;
    if (_1541)
    {
        float3 _5226 = float3(_1491, _1501, float(as_type<int>(_1615)));
        float3 _5230 = select(_5226, float3(0.0), isnan(_5226));
        float _1647 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5230.xy, uint(rint(_5230.z)), _1639, level(0.0));
        _1645 = _1647;
    }
    float _1649 = _1645;
    float _1651 = _1633 * 0.636619746685028076171875;
    float _1653 = _1457;
    if (!_1223)
    {
        float _1655 = rint(_1431);
        float _1657 = precise::max(_1655, 0.0);
        uint _1659 = uint(_1657);
        uint _1661 = clamp(_1659, 0u, 65535u);
        _1653 = as_type<float>(_1661);
    }
    float _1663 = _1653;
    float _1665 = -_1601;
    float _1667 = fma(_1651, _1665, 1.0);
    float _1669 = _1643 * _1641;
    float _1671 = _1625 * _1641;
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = fma(_1671, 0.5, 0.5);
    float _1677 = fma(_1629, 0.5, 0.5);
    float3 _5276 = float3(_1675, _1673, _1603);
    float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5276, float3(0.0), isnan(_5276)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5276, float3(0.0), isnan(_5276)), level(0.0)).x;
    float3 _5285 = float3(_1675, _1673, _1603);
    float4 _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5285, float3(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5285, float3(0.0), isnan(_5285)), level(0.0)).xyzw;
    float _1684 = _1682.x;
    float _1686 = _1682.y;
    float _1688 = _1682.z;
    float _1690 = _1682.w;
    float2 _5301 = float2(_1667, _1677);
    float3 _1694 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5301, float2(0.0), isnan(_5301)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5301, float2(0.0), isnan(_5301)), level(0.0)).xyz;
    float _1696 = _1694.x;
    float _1698 = _1694.y;
    float _1700 = _1694.z;
    float _1702 = _1589;
    if (!_1223)
    {
        float3 _5322 = float3(_1623, _1589, float(as_type<int>(_1663)));
        float3 _5324 = select(_5322, float3(0.0), isnan(_5322));
        float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5324.xy, uint(rint(_5324.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5324.xy, uint(rint(_5324.z)), level(0.0)).x;
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1710 = _574 + _1708;
    float _1712 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1722 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1724 = isnan(_574);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1738 = 1.0 / _1716;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1756 = 1.0 / _1720;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1766 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1712);
    bool _1768 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1770 = isnan(_574);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    bool _1780 = _764 != 0.0;
    bool _1782 = isnan(_764);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan(0.0);
    bool _1788 = _1784 || _1786;
    float _1790 = 1.0 / _1746;
    float _1792 = _1750 * _1738;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1798 = -_1732;
    float _1800 = _1798 + 1.0;
    bool _1802 = _762 == 0.0;
    bool _1804 = !_1788;
    bool _1806 = _1802 && _1804;
    float _1808 = fma(_1792, _1710, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1810 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1766);
    float _1812 = 1.0 / _1736;
    float _1814 = _1760 * _1756;
    bool _1816 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1818 = isnan(_574);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1828;
    bool _1832 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1834 = isnan(_574);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    bool _1844 = _766 == 0.0;
    bool _1846 = _1844 && _1806;
    float _1848 = _1826 * _1800;
    float _1850 = 1.0 / _1764;
    float _1852 = _1796 * _1790;
    bool _1854 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1856 = isnan(_574);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = -_1826;
    float _1868 = _1866 + 1.0;
    float _1870 = -_1842;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1742;
    float _1876 = _1754 * _1812;
    float _1878 = _1864 * _1868;
    bool _1880 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1882 = isnan(_574);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1892;
    float _1896 = -_1864;
    float _1898 = _1896 + 1.0;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1904 = _1894 * _1850;
    float _1906 = -_1890;
    float _1908 = _1906 + 1.0;
    bool _1910 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1912 = isnan(_574);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    float _1922 = _1842 * _1898;
    float _1924 = _1890 * _1872;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1930 = _1778 * _1908;
    bool _1932 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1934 = isnan(_574);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = -_1778;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1920;
    float _1950 = _1948 + 1.0;
    float _1952 = abs(_1052);
    float _1954 = log2(_1952);
    float _1956 = _1902 * _1874;
    float _1958 = _1920 * _1946;
    float _1960 = _1942 * _1950;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1964 = _574 + _1962;
    float _1966 = -_1942;
    float _1968 = _1966 + 1.0;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1972 = _574 + _1970;
    float _1974 = _1808 * _1960;
    float _1976 = fma(_1876, _1964, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1978 = 1.0 / _1928;
    float _1980 = in.m_75.x;
    float _1982 = in.m_75.y;
    float _1984 = in.m_75.z;
    float _1986 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1974);
    float _1988 = fma(_1814, _1972, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1992 = _574 + _1990;
    bool _1994 = _1052 <= 8000.0;
    bool _1996 = isnan(_1052);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan(8000.0);
    bool _2002 = _1998 || _2000;
    float _2004 = float(_2002);
    float _2006 = fma(_1976, _1958, _1986);
    float _2008 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2012 = _574 + _2010;
    float _2014 = fma(_1904, _1992, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2016 = fma(_1988, _1930, _2006);
    float _2018 = fma(_1852, _2012, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2020 = exp2(_2008);
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2024 = _574 + _2022;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2028 = _574 + _2026;
    float _2030 = fma(_2018, _1924, _2016);
    float _2032 = _1830 * _1978;
    float _2034 = fma(_1956, _2024, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2036 = fma(_2014, _1922, _2030);
    float _2038 = fma(_2032, _2028, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2040 = fma(_2034, _1878, _2036);
    float _2042 = _1982;
    float _2044 = _1980;
    float _2046 = _1984;
    if (!_1846)
    {
        float _2048 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1982);
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1846)
    {
        float _2052 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1980);
        _2044 = _2052;
    }
    float _2054 = _2044;
    float _2056 = fma(_2038, _1848, _2040);
    if (!_1846)
    {
        float _2058 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1984);
        _2046 = _2058;
    }
    float _2060 = _2046;
    float _2062 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2064 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2056);
    float _2070 = _610 * _2050;
    float _2072 = _602 * _2050;
    float _2074 = fma(_2066, -2.0, 3.0);
    float _2076 = _2066 * _2066;
    out.m_77.x = _2068;
    float _2078 = exp2(_2062);
    float _2080 = _634 * _2050;
    float _2082 = _2076 * _2074;
    float _2084 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1810);
    float _2086 = fma(_796, _2054, _2070);
    float _2088 = -_2082;
    float _2090 = _2088 + 1.0;
    float _2092 = _2084 + _1581;
    out.gl_Position.x = _1625;
    out.gl_Position.y = _1643;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _1581;
    float _2094 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2082);
    float _2096 = _2092 * 0.5;
    float _2098 = fma(_788, _2054, _2072);
    float _2100 = fma(_784, _2054, _2080);
    float _2102 = _2004 * _2094;
    float _2104 = fma(_816, _2060, _2086);
    float _2106 = -_2078;
    float _2108 = _2106 + 1.0;
    out.m_79.z = _2096;
    out.m_79.w = _1581;
    float _2110 = fma(_828, _2060, _2098);
    float _2112 = fma(_810, _2060, _2100);
    float _2114 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2118 = _1581;
    float _2120 = _2096;
    float _2122 = _1625;
    if (!_1541)
    {
        _2118 = 1.0;
    }
    float _2124 = _2118;
    float _2126 = _2124;
    if (_1223)
    {
        _2120 = 1.0;
    }
    float _2128 = _2120;
    float _2130 = -_1437;
    float _2132 = _2130 + 1.0;
    float _2134 = _2132 * _2116;
    float _2136 = precise::clamp(_2134, 0.0, 1.0);
    float _2138 = _2128;
    if (_1541)
    {
        bool _2140 = _1649 >= _1639;
        bool _2142 = isnan(_1649);
        bool _2144 = _2140 || _2142;
        bool _2146 = isnan(_1639);
        bool _2148 = _2144 || _2146;
        float _2150 = float(_2148);
        _2126 = _2150;
    }
    float _2152 = _2126;
    float _2154 = _2152;
    if (!_1223)
    {
        int _2156 = _1289 << 4;
        int _2158 = _2156 + 2048;
        uint _2160 = uint(int(uint(_2158) >> uint(2)));
        uint _2162 = uint(int(uint(int(_2160)) >> uint(2)));
        int _2164 = int(_2160) & 3;
        float _2166 = (*spvDescriptorSet0.vp_c15)._m0[int(_2162)][_2164];
        int _2168 = int(_2160) + 1;
        uint _2170 = uint(int(uint(_2168) >> uint(2)));
        int _2172 = _2168 & 3;
        float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
        int _2176 = _2158 + 8;
        uint _2178 = uint(int(uint(_2176) >> uint(2)));
        uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
        int _2182 = int(_2178) & 3;
        float _2184 = (*spvDescriptorSet0.vp_c15)._m0[int(_2180)][_2182];
        int _2186 = int(_2178) + 1;
        uint _2188 = uint(int(uint(_2186) >> uint(2)));
        int _2190 = _2186 & 3;
        float _2192 = (*spvDescriptorSet0.vp_c15)._m0[int(_2188)][_2190];
        float _2194 = _1006 * _2174;
        float _2196 = fma(_946, _2166, _2194);
        float _2198 = fma(_958, _2184, _2196);
        float _2200 = _2198 + _2192;
        float _2202 = precise::clamp(_2200, 0.0, 1.0);
        float _2204 = -_2202;
        float _2206 = _2204 + _1706;
        float _2208 = fma(_2206, 500.0, 1.5);
        float _2210 = exp2(_2208);
        float _2212 = 0.0 + _2210;
        float _2214 = precise::clamp(_2212, 0.0, 1.0);
        _2138 = _2214;
    }
    float _2216 = _2138;
    float _2218 = _2114 * _1679;
    float _2220 = _2152 * _2216;
    float _2222 = -_2136;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2226 = -_2114;
    float _2228 = _2226 + 1.0;
    float _2230 = _1690 * _2218;
    float _2232 = _1700 * _2218;
    float _2234 = -_2220;
    float _2236 = fma(_2234, _2224, 1.0);
    float _2238 = precise::clamp(_2236, 0.0, 1.0);
    out.m_81.x = _2104;
    out.m_81.y = _2110;
    out.m_81.z = _2112;
    float _2240 = fma(_1696, _2230, _1684);
    float _2242 = fma(_1698, _2230, _1686);
    float _2244 = _2238 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2246 = _1690 * _2228;
    float _2248 = fma(_1690, _2232, _1688);
    out.m_83.x = _926;
    out.m_83.y = _922;
    out.m_83.z = _930;
    bool _2250 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2252 = isnan(_1012);
    bool _2254 = _2250 || _2252;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2258 = _2254 || _2256;
    out.m_85.x = _2244;
    out.m_87.x = _2240;
    out.m_87.y = _2242;
    out.m_87.z = _2248;
    out.m_87.w = _2246;
    float _2260 = _2224;
    float _2262 = _2228;
    float _2264 = _2238;
    float _2266 = _2230;
    if (!_2258)
    {
        _2122 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2268 = _2122;
    float _2270 = _2268;
    float _2272 = _2268;
    if (!_2258)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2274 = _2260;
    float _2276 = _2274;
    float _2278 = _2274;
    if (!_2258)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2280 = _2262;
    float _2282 = _2280;
    float _2284 = _2280;
    if (!_2258)
    {
        _2154 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2286 = _2154;
    float _2288 = _2286;
    float _2290 = _2286;
    if (!_2258)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2264;
    float _2294 = _2292;
    float _2296 = _2292;
    if (!_2258)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2298 = _2266;
    bool _2300 = !_2258;
    float _2302 = _2298;
    float _2304 = _2298;
    if (!_2300)
    {
        bool _2306 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2308 = isnan(_1012);
        bool _2310 = _2306 || _2308;
        bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2314 = _2310 || _2312;
        if (!_2314)
        {
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2318 = _1012 + _2316;
            float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2322 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2320;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2328 = 1.0 / _2322;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2346 = _2318 * _2328;
            float _2348 = precise::clamp(_2346, 0.0, 1.0);
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2354 = fma(_2348, _2326, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2356 = fma(_2348, _2352, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2358 = fma(_2348, _2332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2360 = fma(_2348, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2362 = fma(_2348, _2340, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2364 = fma(_2348, _2344, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2278 = _2358;
            _2296 = _2362;
            _2272 = _2354;
            _2290 = _2360;
            _2284 = _2356;
            _2304 = _2364;
            _2366 = true;
        }
        else
        {
            bool _2368 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2370 = isnan(_1012);
            bool _2372 = _2368 || _2370;
            bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2376 = _2372 || _2374;
            if (!_2376)
            {
                _2270 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2378 = _2270;
            _2272 = _2378;
            if (!_2376)
            {
                _2276 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2380 = _2276;
            _2278 = _2380;
            if (!_2376)
            {
                _2282 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2382 = _2282;
            _2284 = _2382;
            if (!_2376)
            {
                _2288 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2384 = _2288;
            _2290 = _2384;
            if (!_2376)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2386 = _2294;
            _2296 = _2386;
            if (!_2376)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2388 = _2302;
            bool _2390 = !_2376;
            _2304 = _2388;
            if (!_2390)
            {
                bool _2392 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2394 = isnan(_1012);
                bool _2396 = _2392 || _2394;
                bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2400 = _2396 || _2398;
                if (!_2400)
                {
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2404 = _1012 + _2402;
                    float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2406;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2414 = 1.0 / _2408;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2432 = _2404 * _2414;
                    float _2434 = precise::clamp(_2432, 0.0, 1.0);
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2440 = fma(_2434, _2412, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2278 = _2444;
                    _2296 = _2448;
                    _2272 = _2440;
                    _2290 = _2446;
                    _2284 = _2442;
                    _2304 = _2450;
                    _2366 = true;
                }
                else
                {
                    _2278 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2272 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2290 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2284 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2366 = false;
    float _2452 = _2278;
    float _2454 = _2296;
    float _2456 = _2272;
    float _2458 = _2290;
    float _2460 = _2284;
    float _2462 = _2304;
    float _2464 = fma(_2110, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2452;
    float _2470 = _2468 + _2454;
    float _2472 = -_2456;
    float _2474 = _2472 + _2458;
    float _2476 = -_2460;
    float _2478 = _2476 + _2462;
    bool _2480 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2482 = fma(_2466, _2470, _2452);
    float _2484 = fma(_2466, _2474, _2456);
    float _2486 = fma(_2466, _2478, _2460);
    float _2488 = _2482 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2490 = fma(_2484, 0.298911988735198974609375, _2488);
    float _2492 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2494 = fma(_2486, 0.114477999508380889892578125, _2490);
    out.m_85.w = _2492;
    float _2496 = -_2494;
    float _2498 = _2484 + _2496;
    float _2500 = -_2494;
    float _2502 = _2482 + _2500;
    float _2504 = -_2494;
    float _2506 = _2486 + _2504;
    out.m_89.x = 0.0;
    float _2508 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2510 = fma(_2502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2512 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    out.m_91.x = _2508;
    out.m_91.y = _2510;
    out.m_91.z = _2512;
    if (!_2480)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2514 = -_922;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2518 = -_926;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2522 = -_930;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2526 = _2516 * _2516;
    float _2528 = fma(_2520, _2520, _2526);
    float _2530 = fma(_2524, _2524, _2528);
    float _2532 = sqrt(_2530);
    float _2534 = rsqrt(_2530);
    float _2536 = -_2532;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2542 = precise::clamp(_2540, 0.0, 1.0);
    float _2544 = _2520 * _2534;
    float _2546 = _2516 * _2534;
    float _2548 = abs(_2542);
    float _2550 = log2(_2548);
    float _2552 = _2524 * _2534;
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2556 = _2110 * _2546;
    float _2558 = -_2546;
    float _2560 = -_2554;
    float _2562 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2560);
    float _2564 = fma(_2104, _2544, _2556);
    float _2566 = -_2552;
    float _2568 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2562);
    float _2570 = fma(_2112, _2552, _2564);
    float _2572 = precise::clamp(_2570, 0.0, 1.0);
    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2576 = _2568 + _2574;
    float _2578 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = exp2(_2578);
    float _2586 = _2584 * _2582;
    float _2588 = _2572 * _2586;
    float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2592 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2594 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2590;
    out.m_89.y = _2592;
    out.m_89.z = _2594;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2366 = false;
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
        float _2651 = as_type<float>(_126);
        out.gl_Position.z = _2651;
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
        float _2720 = as_type<float>(_162);
        out.gl_Position.z = _2720;
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
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _228;
    float _232 = 1.0 / _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = 1.0 / _226;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = 1.0 / _230;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _254 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _218 + _258;
    float _262 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = 1.0 / _236;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _266;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _272 = _260 * _238;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = _218 + _274;
    bool _278 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _280 = isnan(_218);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = _270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _292 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_218);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _268;
    float _306 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _218 + _308;
    out.m_67.x = _256;
    out.m_67.y = _290;
    out.m_67.z = _262;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _318 = _310 * _232;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _218 + _320;
    out.m_69.x = _246;
    out.m_69.y = _254;
    out.m_69.z = _306;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _326 = _218 + _324;
    float _328 = _322 * _248;
    bool _330 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _332 = isnan(_218);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = _326 * _264;
    float _344 = fma(_314, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = -_288;
    float _348 = _346 + 1.0;
    float _350 = _276 * _304;
    bool _352 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_218);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -_340;
    float _366 = _364 + 1.0;
    bool _368 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_218);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _302 * _348;
    float _386 = -_302;
    float _388 = _386 + 1.0;
    bool _390 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_218);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _378 * _366;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = fma(_382, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _410 = -_378;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = fma(_406, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = _362 * _388;
    float _422 = -_362;
    float _424 = _422 + 1.0;
    float _426 = _288 * _412;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _400 * _424;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = fma(_416, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = _418 * _436;
    float _446 = _408 * _436;
    float _448 = fma(_430, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = _344 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _444);
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _462 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _464 = fma(_456, _328, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = fma(_442, _420, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_468, _342, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_464, _384, _470);
    float _488 = fma(_474, _328, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_478, _328, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_448, _420, _460);
    float _494 = fma(_450, _420, _462);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = fma(_482, _342, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_488, _384, _492);
    float _504 = fma(_490, _384, _494);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _510;
    float _514 = fma(_498, _342, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_484, _426, _486);
    float _522 = fma(_508, _350, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_512, _350, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _350, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_514, _426, _502);
    float _530 = fma(_500, _426, _504);
    float _532 = fma(_522, _402, _520);
    float _534 = fma(_524, _402, _528);
    float _536 = fma(_526, _402, _530);
    float _538 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_316;
    float _546 = _538;
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
    float _582 = _186 * _186;
    float _584 = fma(_184, _184, _582);
    float _586 = fma(_188, _188, _584);
    float _588 = rsqrt(_586);
    float _590 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _592 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _594 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _596 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _590);
    float _598 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _592);
    float _600 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
    float _602 = _186 * _588;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _596);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _598);
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
    float _610 = _184 * _588;
    float _612 = in.m_71.x;
    float _614 = in.m_71.y;
    float _616 = in.m_71.z;
    float _618 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _620 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _622 = _602 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _624 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _632 = _620 + _630;
    float _634 = _188 * _588;
    float _636 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[8].y, _622);
    float _638 = _628 * _628;
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _642 = _624 + _640;
    float _644 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[10].y, _636);
    float _646 = fma(_632, _632, _638);
    float _648 = fma(_642, _642, _646);
    float _650 = abs(_644);
    bool _652 = _650 > 0.99989998340606689453125;
    float _654 = rsqrt(_648);
    float _656 = _538 * _612;
    float _658 = _540 * _614;
    float _660 = _542 * _616;
    float _662 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _664 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _666 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _668 = _644;
    float _670 = _648;
    float _672 = _588;
    if (_652)
    {
        _668 = 0.001000000047497451305389404296875;
    }
    float _674 = _668;
    float _676 = _662 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (!_652)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _678 = _546;
    float _680 = _678;
    if (!_652)
    {
        _670 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _682 = _670;
    float _684 = _682;
    if (_652)
    {
        float _686 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = _676 * _654;
    if (_652)
    {
        float _692 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _684 = _692;
    }
    float _694 = _684;
    if (!_652)
    {
        _672 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _696 = _672;
    float _698 = -_688;
    float _700 = _634 * _698;
    float _702 = _628 * _690;
    float _704 = _632 * _690;
    float _706 = _696;
    if (_652)
    {
        float _708 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _706 = _708;
    }
    float _710 = _706;
    float _712 = -_694;
    float _714 = -_700;
    float _716 = fma(_610, _712, _714);
    float _718 = -_702;
    float _720 = _628 + _718;
    float _722 = -_704;
    float _724 = _632 + _722;
    float _726 = _642 * _690;
    float _728 = _716 * _716;
    float _730 = _720 * _720;
    float _732 = -_694;
    float _734 = _602 * _732;
    float _736 = -_726;
    float _738 = _642 + _736;
    float _740 = fma(_724, _724, _730);
    float _742 = -_710;
    float _744 = -_734;
    float _746 = fma(_634, _742, _744);
    float _748 = -_710;
    float _750 = _610 * _748;
    float _752 = fma(_738, _738, _740);
    float _754 = fma(_746, _746, _728);
    float _756 = -_688;
    float _758 = -_750;
    float _760 = fma(_602, _756, _758);
    float _762 = in.m_73.x;
    float _764 = in.m_73.y;
    float _766 = in.m_73.z;
    float _768 = sqrt(_752);
    float _770 = fma(_760, _760, _754);
    float _772 = rsqrt(_770);
    float _774 = _654 * _768;
    float _776 = _664 * _774;
    float _778 = _666 * _774;
    float _780 = _662 * _774;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _784 = _760 * _772;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _788 = _716 * _772;
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _792 = _776 * _782;
    float _794 = _778 * _786;
    float _796 = _746 * _772;
    float _798 = _780 * _790;
    float _800 = _610 * _788;
    float _802 = _792 * _634;
    float _804 = _602 * _784;
    float _806 = _792 * _610;
    float _808 = -_800;
    float _810 = fma(_602, _796, _808);
    float _812 = fma(_798, _784, _802);
    float _814 = -_804;
    float _816 = fma(_634, _788, _814);
    float _818 = fma(_798, _796, _806);
    float _820 = _634 * _796;
    float _822 = fma(_794, _810, _812);
    float _824 = fma(_794, _816, _818);
    float _826 = -_820;
    float _828 = fma(_610, _784, _826);
    float _830 = _624 + _822;
    float _832 = _620 + _824;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _836 = _830 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _840 = _832 + _838;
    float _842 = _836 * _836;
    float _844 = fma(_840, _840, _842);
    float _846 = _792 * _602;
    float _848 = sqrt(_844);
    float _850 = fma(_798, _788, _846);
    float _852 = fma(_794, _828, _850);
    float _854 = _618 + _852;
    bool _856 = _848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = _794;
    float _860 = _798;
    float _862 = _792;
    if (!_856)
    {
        _858 = _832;
    }
    float _864 = _858;
    float _866 = _864;
    if (!_856)
    {
        _860 = _830;
    }
    float _868 = _860;
    float _870 = _868;
    if (!_856)
    {
        _862 = _854;
    }
    float _872 = _862;
    bool _874 = !_856;
    float _876 = _872;
    if (!_874)
    {
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _882 = _848 + _880;
        float _884 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = rsqrt(_844);
        float _888 = _882 * _878;
        float _890 = _888 * 0.15915493667125701904296875;
        float _892 = _890 * 6.283185482025146484375;
        float _894 = sin(_892);
        float _896 = _890 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = fma(_894, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _902 = _886 * _900;
        float _904 = _898 + (-1.0);
        float _906 = fma(_840, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _908 = fma(_836, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _910 = _904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_854, _898, _910);
        _876 = _912;
        _866 = _906;
        _870 = _908;
    }
    float _914 = _876;
    float _916 = _866;
    float _918 = _870;
    float _920 = -_702;
    float _922 = _920 + _914;
    float _924 = -_704;
    float _926 = _924 + _916;
    float _928 = -_726;
    float _930 = _928 + _918;
    float _932 = -_702;
    float _934 = _618 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _938 = _922 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _942 = _926 + _940;
    float _944 = -_704;
    float _946 = _620 + _944;
    float _948 = _934 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _950 = _938 * _938;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _930 + _952;
    float _956 = -_726;
    float _958 = _624 + _956;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].x, _948);
    float _962 = fma(_942, _942, _950);
    float _964 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _960);
    float _966 = fma(_954, _954, _962);
    float _968 = _934 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _970 = _964 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _972 = rsqrt(_966);
    float _974 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].x, _968);
    float _976 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _974);
    float _978 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _980 = 1.0 / _970;
    float _982 = _976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _984 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _986 = _982 + _970;
    float _988 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _990 = floor(_978);
    float _992 = _942 * _988;
    float _994 = _954 * _988;
    float _996 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _998 = _986 * _980;
    float _1000 = _998 * 0.5;
    float _1002 = _992 * _992;
    float _1004 = _994 * _994;
    float _1006 = _934 + _996;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1010 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1008);
    float _1012 = sqrt(_966);
    float _1014 = _1002 + _1004;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1020 = -_990;
    float _1022 = _978 + _1020;
    float _1024 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1016);
    float _1026 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1018);
    float _1028 = sqrt(_1014);
    float _1030 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1024);
    float _1032 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1026);
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1038 = 1.0 / _1010;
    bool _1040 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = trunc(_1034);
    int _1044 = int(_1042);
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = _1028 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1052 = _1038 * _1050;
    float _1054 = floor(_984);
    bool _1056 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1058 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1060 = _1030;
    int _1062 = 2;
    float _1064 = _1048;
    float _1066 = _990;
    float _1068 = _988;
    float _1070 = _992;
    float _1072 = _994;
    int _1074 = as_type<int>(_1054);
    int _1076 = as_type<int>(_984);
    float _1078 = _1002;
    float _1080 = _1004;
    float _1082 = _1036;
    if (_1040)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1084;
    }
    float _1086 = _1060;
    bool _1088 = !_1056;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1094 = _1044 + _1092;
    int _1096 = _1094 + 1;
    float _1098 = trunc(_1036);
    int _1100 = int(_1098);
    float _1102 = as_type<float>(_1090);
    float _1104 = as_type<float>(_1096);
    if (!_1056)
    {
        _1062 = 1;
    }
    int _1106 = _1062;
    int _1108 = _1106;
    if (!_1058)
    {
        _1108 = _1090;
    }
    int _1110 = _1108;
    bool _1112 = _1096 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1114 = _1110 << 6;
    if (_1040)
    {
        float _1116 = _1048 * _1086;
        _1102 = _1116;
    }
    float _1118 = _1102;
    if (_1040)
    {
        float _1120 = rsqrt(_1014);
        _1064 = _1120;
    }
    float _1122 = _1064;
    int _1124 = _1114 + 96;
    uint _1127 = uint(int(uint(_1124) >> uint(2)));
    uint _1129 = uint(int(uint(int(_1127)) >> uint(2)));
    int _1131 = int(_1127) & 3;
    float _1133 = (*spvDescriptorSet0.vp_c15)._m0[int(_1129)][_1131];
    int _1135 = int(_1127) + 1;
    uint _1137 = uint(int(uint(_1135) >> uint(2)));
    int _1139 = _1135 & 3;
    float _1141 = (*spvDescriptorSet0.vp_c15)._m0[int(_1137)][_1139];
    float _1143 = 0.0;
    float _1145 = _1122;
    if (_1040)
    {
        float _1147 = _1118 * 0.15915493667125701904296875;
        _1143 = _1147;
    }
    float _1149 = _1143;
    int _1151 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1153 = _1100 + _1151;
    int _1155 = _1153 + 1;
    float _1157 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1159 = 0.0;
    float _1161 = _1149;
    if (_1040)
    {
        float _1163 = _1149 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        _1159 = _1165;
    }
    float _1167 = _1159;
    int _1169 = _1114 + 48;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    uint _1173 = uint(int(uint(int(_1171)) >> uint(2)));
    int _1175 = int(_1171) & 3;
    float _1177 = (*spvDescriptorSet0.vp_c15)._m0[int(_1173)][_1175];
    int _1179 = int(_1171) + 1;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    int _1183 = _1179 & 3;
    float _1185 = (*spvDescriptorSet0.vp_c15)._m0[int(_1181)][_1183];
    int _1187 = _1096 | _1155;
    bool _1189 = _1187 < 0;
    bool _1191 = _1189 || _1112;
    float _1193 = precise::max(0.0, _1157);
    int _1195 = _1114 + 64;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    uint _1199 = uint(int(uint(int(_1197)) >> uint(2)));
    int _1201 = int(_1197) & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    int _1205 = int(_1197) + 1;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    int _1209 = _1205 & 3;
    float _1211 = (*spvDescriptorSet0.vp_c15)._m0[int(_1207)][_1209];
    float _1213 = 0.0;
    if (_1040)
    {
        float _1215 = _1149 * 6.283185482025146484375;
        float _1217 = sin(_1215);
        _1213 = _1217;
    }
    float _1219 = _1213;
    bool _1221 = _1155 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1223 = _1221 || _1191;
    float _1225 = -_988;
    float _1227 = -_1193;
    float _1229 = fma(_938, _1225, _1227);
    if (_1040)
    {
        float _1231 = _1167 + (-1.0);
        _1066 = _1231;
    }
    float _1233 = _1066;
    int _1235 = _1114 + 104;
    uint _1237 = uint(int(uint(_1235) >> uint(2)));
    uint _1239 = uint(int(uint(int(_1237)) >> uint(2)));
    int _1241 = int(_1237) & 3;
    float _1243 = (*spvDescriptorSet0.vp_c15)._m0[int(_1239)][_1241];
    int _1245 = int(_1237) + 1;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    int _1249 = _1245 & 3;
    float _1251 = (*spvDescriptorSet0.vp_c15)._m0[int(_1247)][_1249];
    if (_1040)
    {
        float _1253 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1068 = _1253;
    }
    float _1255 = _1068;
    int _1257 = _1114 + 56;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c15)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
    float _1275 = _1219;
    int _1277 = as_type<int>(_1255);
    if (_1040)
    {
        float _1279 = fma(_1219, _1255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1275 = _1279;
    }
    float _1281 = _1275;
    float _1283 = _1281;
    if (!_1223)
    {
        int _1285 = _1155 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1287 = _1285 + _1096;
        _1277 = _1287;
    }
    int _1289 = _1277;
    if (_1040)
    {
        float _1291 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1291;
    }
    float _1293 = _1104;
    float _1295 = -_1054;
    float _1297 = _984 + _1295;
    if (_1040)
    {
        float _1299 = _1122 * _1281;
        _1161 = _1299;
    }
    float _1301 = _1161;
    if (!_1040)
    {
        _1145 = _1229;
    }
    float _1303 = _1145;
    float _1305 = _1303;
    if (_1040)
    {
        float _1307 = fma(_1229, _1167, _1293);
        _1305 = _1307;
    }
    float _1309 = _1305;
    int _1311 = _1114 + 80;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    if (_1040)
    {
        float _1329 = _992 * _1301;
        _1070 = _1329;
    }
    float _1331 = _1070;
    if (_1040)
    {
        float _1333 = _994 * _1301;
        _1072 = _1333;
    }
    float _1335 = _1072;
    if (!_1223)
    {
        int _1337 = _1289 << 2;
        _1074 = _1337;
    }
    int _1339 = _1074;
    int _1341 = _1339;
    if (!_1223)
    {
        uint _1343 = uint(int(uint(_1289) >> uint(2)));
        _1076 = int(_1343);
    }
    int _1345 = _1076;
    if (_1040)
    {
        float _1347 = _1331 * _1331;
        _1078 = _1347;
    }
    float _1349 = _1078;
    if (_1040)
    {
        float _1351 = _1335 * _1335;
        _1080 = _1351;
    }
    float _1353 = _1080;
    int _1355 = _1114 + 72;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    float _1373 = _1006 * _1141;
    float _1375 = fma(_1309, _1309, _1349);
    int _1377 = as_type<int>(_1141);
    if (!_1223)
    {
        int _1379 = 12 & _1339;
        _1341 = _1379;
    }
    int _1381 = _1341;
    int _1383 = _1114 + 88;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    float _1401 = fma(_946, _1133, _1373);
    float _1403 = _1006 * _1185;
    float _1405 = _1375 + _1353;
    if (!_1223)
    {
        int _1407 = _1345 << 4;
        int _1409 = _1407 + _1381;
        _1377 = _1409;
    }
    int _1411 = _1377;
    float _1413 = _1006 * _1211;
    float _1415 = fma(_946, _1177, _1403);
    float _1417 = rsqrt(_1405);
    float _1419 = as_type<float>(_1345);
    if (!_1223)
    {
        int _1421 = _1411 + 400;
        uint _1423 = uint(int(uint(_1421) >> uint(2)));
        uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
        int _1427 = int(_1423) & 3;
        float _1429 = (*spvDescriptorSet0.vp_c15)._m0[int(_1425)][_1427];
        _1419 = _1429;
    }
    float _1431 = _1419;
    float _1433 = fma(_946, _1203, _1413);
    float _1435 = fma(_958, _1243, _1401);
    float2 _4851 = float2(_1022, _1297);
    float _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).x;
    if (!_1223)
    {
        float _1439 = floor(_1036);
        _1283 = _1439;
    }
    float _1441 = _1283;
    float _1443 = fma(_958, _1265, _1415);
    float _1445 = _1435 + _1251;
    float _1447 = _922 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1449 = _1417 * _1331;
    float _1451 = _1443 + _1273;
    float _1453 = _1417 * _1309;
    float _1455 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1447);
    float _1457 = 1.0 / _1445;
    float _1459 = _1006 * _1327;
    float _1461 = _1417 * _1335;
    float _1463 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1455);
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1467 = fma(_946, _1319, _1459);
    float _1469 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1473 = _922 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1475 = fma(_958, _1363, _1433);
    float _1477 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1479 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1473);
    float _1481 = _1475 + _1371;
    float _1483 = -_1465;
    float _1485 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1483);
    float _1487 = -_1477;
    float _1489 = fma(_1487, _1469, 1.0);
    float _1491 = _1451 * _1457;
    float _1493 = fma(_958, _1391, _1467);
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1497 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1495);
    float _1499 = precise::clamp(_1497, 0.0, 1.0);
    float _1501 = _1481 * _1457;
    float _1503 = _922 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1505 = _1491 >= 0.0;
    float _1507 = -_1499;
    float _1509 = _1507 + 1.0;
    float _1511 = _922 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1503);
    bool _1515 = _1491 <= 1.0;
    bool _1517 = _1515 && _1505;
    float _1519 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1521 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1523 = abs(_1509);
    float _1525 = log2(_1523);
    bool _1527 = _1501 >= 0.0;
    bool _1529 = _1527 && _1517;
    float _1531 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1513);
    float _1533 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1521);
    float _1535 = -_1461;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1485);
    bool _1539 = _1501 <= 1.0;
    bool _1541 = _1539 && _1529;
    float _1543 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1545 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1547 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1549 = _1453 + 1.0;
    float _1551 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1553 = log2(_1489);
    float _1555 = _1493 + _1399;
    float _1557 = fma(_1537, -0.5, 0.5);
    float _1559 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1551);
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1563 = fma(_1537, 0.5, 0.5);
    float _1565 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1559);
    float _1567 = _1451;
    float _1569 = _1489;
    if (!_1223)
    {
        float _1571 = floor(_1034);
        _1567 = _1571;
    }
    float _1573 = _1567;
    if (_1541)
    {
        float _1575 = float(_1110);
        _1569 = _1575;
    }
    float _1577 = _1569;
    float _1579 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1581 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1583 = fma(_1563, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1223)
    {
        float _1585 = -_1441;
        float _1587 = _1036 + _1585;
        _1082 = _1587;
    }
    float _1589 = _1082;
    float _1591 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1579);
    float _1593 = exp2(_1561);
    float _1595 = fma(_1563, _1583, -0.212114393711090087890625);
    float _1597 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1591);
    float _1599 = _1553 * 0.693147182464599609375;
    float _1601 = fma(_1563, _1595, 1.570728778839111328125);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1577;
    if (_1541)
    {
        float _1607 = rint(_1577);
        float _1609 = precise::max(_1607, 0.0);
        uint _1611 = uint(_1609);
        uint _1613 = clamp(_1611, 0u, 65535u);
        _1605 = as_type<float>(_1613);
    }
    float _1615 = _1605;
    float _1617 = _1573;
    if (!_1223)
    {
        float _1619 = -_1573;
        float _1621 = _1034 + _1619;
        _1617 = _1621;
    }
    float _1623 = _1617;
    float _1625 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1597);
    float _1627 = -_1453;
    float _1629 = fma(_1593, _1549, _1627);
    float _1631 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1633 = sqrt(_1557);
    float _1635 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1631);
    float _1637 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1639 = _1555 * _1457;
    float _1641 = 1.0 / _1581;
    float _1643 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1637);
    float _1645 = _1615;
    if (_1541)
    {
        float3 _5226 = float3(_1491, _1501, float(as_type<int>(_1615)));
        float3 _5230 = select(_5226, float3(0.0), isnan(_5226));
        float _1647 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5230.xy, uint(rint(_5230.z)), _1639, level(0.0));
        _1645 = _1647;
    }
    float _1649 = _1645;
    float _1651 = _1633 * 0.636619746685028076171875;
    float _1653 = _1457;
    if (!_1223)
    {
        float _1655 = rint(_1431);
        float _1657 = precise::max(_1655, 0.0);
        uint _1659 = uint(_1657);
        uint _1661 = clamp(_1659, 0u, 65535u);
        _1653 = as_type<float>(_1661);
    }
    float _1663 = _1653;
    float _1665 = -_1601;
    float _1667 = fma(_1651, _1665, 1.0);
    float _1669 = _1643 * _1641;
    float _1671 = _1625 * _1641;
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = fma(_1671, 0.5, 0.5);
    float _1677 = fma(_1629, 0.5, 0.5);
    float3 _5276 = float3(_1675, _1673, _1603);
    float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5276, float3(0.0), isnan(_5276)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5276, float3(0.0), isnan(_5276)), level(0.0)).x;
    float3 _5285 = float3(_1675, _1673, _1603);
    float4 _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5285, float3(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5285, float3(0.0), isnan(_5285)), level(0.0)).xyzw;
    float _1684 = _1682.x;
    float _1686 = _1682.y;
    float _1688 = _1682.z;
    float _1690 = _1682.w;
    float2 _5301 = float2(_1667, _1677);
    float3 _1694 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5301, float2(0.0), isnan(_5301)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5301, float2(0.0), isnan(_5301)), level(0.0)).xyz;
    float _1696 = _1694.x;
    float _1698 = _1694.y;
    float _1700 = _1694.z;
    float _1702 = _1589;
    if (!_1223)
    {
        float3 _5322 = float3(_1623, _1589, float(as_type<int>(_1663)));
        float3 _5324 = select(_5322, float3(0.0), isnan(_5322));
        float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5324.xy, uint(rint(_5324.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5324.xy, uint(rint(_5324.z)), level(0.0)).x;
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1710 = _574 + _1708;
    float _1712 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1722 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1724 = isnan(_574);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1738 = 1.0 / _1716;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1756 = 1.0 / _1720;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1766 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1712);
    bool _1768 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1770 = isnan(_574);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    bool _1780 = _764 != 0.0;
    bool _1782 = isnan(_764);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan(0.0);
    bool _1788 = _1784 || _1786;
    float _1790 = 1.0 / _1746;
    float _1792 = _1750 * _1738;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1798 = -_1732;
    float _1800 = _1798 + 1.0;
    bool _1802 = _762 == 0.0;
    bool _1804 = !_1788;
    bool _1806 = _1802 && _1804;
    float _1808 = fma(_1792, _1710, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1810 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1766);
    float _1812 = 1.0 / _1736;
    float _1814 = _1760 * _1756;
    bool _1816 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1818 = isnan(_574);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1828;
    bool _1832 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1834 = isnan(_574);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    bool _1844 = _766 == 0.0;
    bool _1846 = _1844 && _1806;
    float _1848 = _1826 * _1800;
    float _1850 = 1.0 / _1764;
    float _1852 = _1796 * _1790;
    bool _1854 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1856 = isnan(_574);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = -_1826;
    float _1868 = _1866 + 1.0;
    float _1870 = -_1842;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1742;
    float _1876 = _1754 * _1812;
    float _1878 = _1864 * _1868;
    bool _1880 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1882 = isnan(_574);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1892;
    float _1896 = -_1864;
    float _1898 = _1896 + 1.0;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1904 = _1894 * _1850;
    float _1906 = -_1890;
    float _1908 = _1906 + 1.0;
    bool _1910 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1912 = isnan(_574);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    float _1922 = _1842 * _1898;
    float _1924 = _1890 * _1872;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1930 = _1778 * _1908;
    bool _1932 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1934 = isnan(_574);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = -_1778;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1920;
    float _1950 = _1948 + 1.0;
    float _1952 = abs(_1052);
    float _1954 = log2(_1952);
    float _1956 = _1902 * _1874;
    float _1958 = _1920 * _1946;
    float _1960 = _1942 * _1950;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1964 = _574 + _1962;
    float _1966 = -_1942;
    float _1968 = _1966 + 1.0;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1972 = _574 + _1970;
    float _1974 = _1808 * _1960;
    float _1976 = fma(_1876, _1964, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1978 = 1.0 / _1928;
    float _1980 = in.m_75.x;
    float _1982 = in.m_75.y;
    float _1984 = in.m_75.z;
    float _1986 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1974);
    float _1988 = fma(_1814, _1972, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1992 = _574 + _1990;
    bool _1994 = _1052 <= 8000.0;
    bool _1996 = isnan(_1052);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan(8000.0);
    bool _2002 = _1998 || _2000;
    float _2004 = float(_2002);
    float _2006 = fma(_1976, _1958, _1986);
    float _2008 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2012 = _574 + _2010;
    float _2014 = fma(_1904, _1992, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2016 = fma(_1988, _1930, _2006);
    float _2018 = fma(_1852, _2012, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2020 = exp2(_2008);
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2024 = _574 + _2022;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2028 = _574 + _2026;
    float _2030 = fma(_2018, _1924, _2016);
    float _2032 = _1830 * _1978;
    float _2034 = fma(_1956, _2024, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2036 = fma(_2014, _1922, _2030);
    float _2038 = fma(_2032, _2028, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2040 = fma(_2034, _1878, _2036);
    float _2042 = _1982;
    float _2044 = _1980;
    float _2046 = _1984;
    if (!_1846)
    {
        float _2048 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1982);
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1846)
    {
        float _2052 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1980);
        _2044 = _2052;
    }
    float _2054 = _2044;
    float _2056 = fma(_2038, _1848, _2040);
    if (!_1846)
    {
        float _2058 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1984);
        _2046 = _2058;
    }
    float _2060 = _2046;
    float _2062 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2064 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2056);
    float _2070 = _610 * _2050;
    float _2072 = _602 * _2050;
    float _2074 = fma(_2066, -2.0, 3.0);
    float _2076 = _2066 * _2066;
    out.m_77.x = _2068;
    float _2078 = exp2(_2062);
    float _2080 = _634 * _2050;
    float _2082 = _2076 * _2074;
    float _2084 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1810);
    float _2086 = fma(_796, _2054, _2070);
    float _2088 = -_2082;
    float _2090 = _2088 + 1.0;
    float _2092 = _2084 + _1581;
    out.gl_Position.x = _1625;
    out.gl_Position.y = _1643;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _1581;
    float _2094 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2082);
    float _2096 = _2092 * 0.5;
    float _2098 = fma(_788, _2054, _2072);
    float _2100 = fma(_784, _2054, _2080);
    float _2102 = _2004 * _2094;
    float _2104 = fma(_816, _2060, _2086);
    float _2106 = -_2078;
    float _2108 = _2106 + 1.0;
    out.m_79.z = _2096;
    out.m_79.w = _1581;
    float _2110 = fma(_828, _2060, _2098);
    float _2112 = fma(_810, _2060, _2100);
    float _2114 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2118 = _1581;
    float _2120 = _2096;
    float _2122 = _1625;
    if (!_1541)
    {
        _2118 = 1.0;
    }
    float _2124 = _2118;
    float _2126 = _2124;
    if (_1223)
    {
        _2120 = 1.0;
    }
    float _2128 = _2120;
    float _2130 = -_1437;
    float _2132 = _2130 + 1.0;
    float _2134 = _2132 * _2116;
    float _2136 = precise::clamp(_2134, 0.0, 1.0);
    float _2138 = _2128;
    if (_1541)
    {
        bool _2140 = _1649 >= _1639;
        bool _2142 = isnan(_1649);
        bool _2144 = _2140 || _2142;
        bool _2146 = isnan(_1639);
        bool _2148 = _2144 || _2146;
        float _2150 = float(_2148);
        _2126 = _2150;
    }
    float _2152 = _2126;
    float _2154 = _2152;
    if (!_1223)
    {
        int _2156 = _1289 << 4;
        int _2158 = _2156 + 2048;
        uint _2160 = uint(int(uint(_2158) >> uint(2)));
        uint _2162 = uint(int(uint(int(_2160)) >> uint(2)));
        int _2164 = int(_2160) & 3;
        float _2166 = (*spvDescriptorSet0.vp_c15)._m0[int(_2162)][_2164];
        int _2168 = int(_2160) + 1;
        uint _2170 = uint(int(uint(_2168) >> uint(2)));
        int _2172 = _2168 & 3;
        float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
        int _2176 = _2158 + 8;
        uint _2178 = uint(int(uint(_2176) >> uint(2)));
        uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
        int _2182 = int(_2178) & 3;
        float _2184 = (*spvDescriptorSet0.vp_c15)._m0[int(_2180)][_2182];
        int _2186 = int(_2178) + 1;
        uint _2188 = uint(int(uint(_2186) >> uint(2)));
        int _2190 = _2186 & 3;
        float _2192 = (*spvDescriptorSet0.vp_c15)._m0[int(_2188)][_2190];
        float _2194 = _1006 * _2174;
        float _2196 = fma(_946, _2166, _2194);
        float _2198 = fma(_958, _2184, _2196);
        float _2200 = _2198 + _2192;
        float _2202 = precise::clamp(_2200, 0.0, 1.0);
        float _2204 = -_2202;
        float _2206 = _2204 + _1706;
        float _2208 = fma(_2206, 500.0, 1.5);
        float _2210 = exp2(_2208);
        float _2212 = 0.0 + _2210;
        float _2214 = precise::clamp(_2212, 0.0, 1.0);
        _2138 = _2214;
    }
    float _2216 = _2138;
    float _2218 = _2114 * _1679;
    float _2220 = _2152 * _2216;
    float _2222 = -_2136;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2226 = -_2114;
    float _2228 = _2226 + 1.0;
    float _2230 = _1690 * _2218;
    float _2232 = _1700 * _2218;
    float _2234 = -_2220;
    float _2236 = fma(_2234, _2224, 1.0);
    float _2238 = precise::clamp(_2236, 0.0, 1.0);
    out.m_81.x = _2104;
    out.m_81.y = _2110;
    out.m_81.z = _2112;
    float _2240 = fma(_1696, _2230, _1684);
    float _2242 = fma(_1698, _2230, _1686);
    float _2244 = _2238 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2246 = _1690 * _2228;
    float _2248 = fma(_1690, _2232, _1688);
    out.m_83.x = _926;
    out.m_83.y = _922;
    out.m_83.z = _930;
    bool _2250 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2252 = isnan(_1012);
    bool _2254 = _2250 || _2252;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2258 = _2254 || _2256;
    out.m_85.x = _2244;
    out.m_87.x = _2240;
    out.m_87.y = _2242;
    out.m_87.z = _2248;
    out.m_87.w = _2246;
    float _2260 = _2224;
    float _2262 = _2228;
    float _2264 = _2238;
    float _2266 = _2230;
    if (!_2258)
    {
        _2122 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2268 = _2122;
    float _2270 = _2268;
    float _2272 = _2268;
    if (!_2258)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2274 = _2260;
    float _2276 = _2274;
    float _2278 = _2274;
    if (!_2258)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2280 = _2262;
    float _2282 = _2280;
    float _2284 = _2280;
    if (!_2258)
    {
        _2154 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2286 = _2154;
    float _2288 = _2286;
    float _2290 = _2286;
    if (!_2258)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2264;
    float _2294 = _2292;
    float _2296 = _2292;
    if (!_2258)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2298 = _2266;
    bool _2300 = !_2258;
    float _2302 = _2298;
    float _2304 = _2298;
    if (!_2300)
    {
        bool _2306 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2308 = isnan(_1012);
        bool _2310 = _2306 || _2308;
        bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2314 = _2310 || _2312;
        if (!_2314)
        {
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2318 = _1012 + _2316;
            float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2322 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2320;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2328 = 1.0 / _2322;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2346 = _2318 * _2328;
            float _2348 = precise::clamp(_2346, 0.0, 1.0);
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2354 = fma(_2348, _2326, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2356 = fma(_2348, _2352, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2358 = fma(_2348, _2332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2360 = fma(_2348, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2362 = fma(_2348, _2340, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2364 = fma(_2348, _2344, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2278 = _2358;
            _2296 = _2362;
            _2272 = _2354;
            _2290 = _2360;
            _2284 = _2356;
            _2304 = _2364;
            _2366 = true;
        }
        else
        {
            bool _2368 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2370 = isnan(_1012);
            bool _2372 = _2368 || _2370;
            bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2376 = _2372 || _2374;
            if (!_2376)
            {
                _2270 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2378 = _2270;
            _2272 = _2378;
            if (!_2376)
            {
                _2276 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2380 = _2276;
            _2278 = _2380;
            if (!_2376)
            {
                _2282 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2382 = _2282;
            _2284 = _2382;
            if (!_2376)
            {
                _2288 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2384 = _2288;
            _2290 = _2384;
            if (!_2376)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2386 = _2294;
            _2296 = _2386;
            if (!_2376)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2388 = _2302;
            bool _2390 = !_2376;
            _2304 = _2388;
            if (!_2390)
            {
                bool _2392 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2394 = isnan(_1012);
                bool _2396 = _2392 || _2394;
                bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2400 = _2396 || _2398;
                if (!_2400)
                {
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2404 = _1012 + _2402;
                    float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2406;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2414 = 1.0 / _2408;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2432 = _2404 * _2414;
                    float _2434 = precise::clamp(_2432, 0.0, 1.0);
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2440 = fma(_2434, _2412, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2278 = _2444;
                    _2296 = _2448;
                    _2272 = _2440;
                    _2290 = _2446;
                    _2284 = _2442;
                    _2304 = _2450;
                    _2366 = true;
                }
                else
                {
                    _2278 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2272 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2290 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2284 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2366 = false;
    float _2452 = _2278;
    float _2454 = _2296;
    float _2456 = _2272;
    float _2458 = _2290;
    float _2460 = _2284;
    float _2462 = _2304;
    float _2464 = fma(_2110, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2452;
    float _2470 = _2468 + _2454;
    float _2472 = -_2456;
    float _2474 = _2472 + _2458;
    float _2476 = -_2460;
    float _2478 = _2476 + _2462;
    bool _2480 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2482 = fma(_2466, _2470, _2452);
    float _2484 = fma(_2466, _2474, _2456);
    float _2486 = fma(_2466, _2478, _2460);
    float _2488 = _2482 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2490 = fma(_2484, 0.298911988735198974609375, _2488);
    float _2492 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2494 = fma(_2486, 0.114477999508380889892578125, _2490);
    out.m_85.w = _2492;
    float _2496 = -_2494;
    float _2498 = _2484 + _2496;
    float _2500 = -_2494;
    float _2502 = _2482 + _2500;
    float _2504 = -_2494;
    float _2506 = _2486 + _2504;
    out.m_89.x = 0.0;
    float _2508 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2510 = fma(_2502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2512 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    out.m_91.x = _2508;
    out.m_91.y = _2510;
    out.m_91.z = _2512;
    if (!_2480)
    {
        return out;
    }
    float _2514 = -_922;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2518 = -_926;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2522 = -_930;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2526 = _2516 * _2516;
    float _2528 = fma(_2520, _2520, _2526);
    float _2530 = fma(_2524, _2524, _2528);
    float _2532 = sqrt(_2530);
    float _2534 = rsqrt(_2530);
    float _2536 = -_2532;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2542 = precise::clamp(_2540, 0.0, 1.0);
    float _2544 = _2520 * _2534;
    float _2546 = _2516 * _2534;
    float _2548 = abs(_2542);
    float _2550 = log2(_2548);
    float _2552 = _2524 * _2534;
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2556 = _2110 * _2546;
    float _2558 = -_2546;
    float _2560 = -_2554;
    float _2562 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2560);
    float _2564 = fma(_2104, _2544, _2556);
    float _2566 = -_2552;
    float _2568 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2562);
    float _2570 = fma(_2112, _2552, _2564);
    float _2572 = precise::clamp(_2570, 0.0, 1.0);
    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2576 = _2568 + _2574;
    float _2578 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = exp2(_2578);
    float _2586 = _2584 * _2582;
    float _2588 = _2572 * _2586;
    float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2592 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2594 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2590;
    out.m_89.y = _2592;
    out.m_89.z = _2594;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2366 = false;
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
        float _2651 = as_type<float>(_126);
        out.gl_Position.z = _2651;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2720 = as_type<float>(_162);
        out.gl_Position.z = _2720;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _228;
    float _232 = 1.0 / _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _238 = 1.0 / _226;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _248 = 1.0 / _230;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _254 = _244 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _256 = _250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _218 + _258;
    float _262 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = 1.0 / _236;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _266;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _272 = _260 * _238;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = _218 + _274;
    bool _278 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _280 = isnan(_218);
    bool _282 = _278 || _280;
    bool _284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _286 = _282 || _284;
    float _288 = float(_286);
    float _290 = _270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _292 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_218);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _268;
    float _306 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = _218 + _308;
    out.m_67.x = _256;
    out.m_67.y = _290;
    out.m_67.z = _262;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _318 = _310 * _232;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _218 + _320;
    out.m_69.x = _246;
    out.m_69.y = _254;
    out.m_69.z = _306;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _326 = _218 + _324;
    float _328 = _322 * _248;
    bool _330 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _332 = isnan(_218);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = _326 * _264;
    float _344 = fma(_314, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _346 = -_288;
    float _348 = _346 + 1.0;
    float _350 = _276 * _304;
    bool _352 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _354 = isnan(_218);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = -_340;
    float _366 = _364 + 1.0;
    bool _368 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _370 = isnan(_218);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _302 * _348;
    float _386 = -_302;
    float _388 = _386 + 1.0;
    bool _390 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_218);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _378 * _366;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = fma(_382, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _410 = -_378;
    float _412 = _410 + 1.0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = fma(_406, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = _362 * _388;
    float _422 = -_362;
    float _424 = _422 + 1.0;
    float _426 = _288 * _412;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _400 * _424;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = fma(_416, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _444 = _418 * _436;
    float _446 = _408 * _436;
    float _448 = fma(_430, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = _344 * _436;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _444);
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _446);
    float _462 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _464 = fma(_456, _328, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = fma(_442, _420, _458);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_468, _342, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_464, _384, _470);
    float _488 = fma(_474, _328, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = fma(_478, _328, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _492 = fma(_448, _420, _460);
    float _494 = fma(_450, _420, _462);
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _500 = fma(_482, _342, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _502 = fma(_488, _384, _492);
    float _504 = fma(_490, _384, _494);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _510;
    float _514 = fma(_498, _342, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_484, _426, _486);
    float _522 = fma(_508, _350, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_512, _350, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _350, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_514, _426, _502);
    float _530 = fma(_500, _426, _504);
    float _532 = fma(_522, _402, _520);
    float _534 = fma(_524, _402, _528);
    float _536 = fma(_526, _402, _530);
    float _538 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_316;
    float _546 = _538;
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
    float _582 = _186 * _186;
    float _584 = fma(_184, _184, _582);
    float _586 = fma(_188, _188, _584);
    float _588 = rsqrt(_586);
    float _590 = _578 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _592 = _578 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _594 = _578 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _596 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[5].x, _590);
    float _598 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[4].x, _592);
    float _600 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[6].x, _594);
    float _602 = _186 * _588;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[5].z, _596);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[4].z, _598);
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
    float _610 = _184 * _588;
    float _612 = in.m_71.x;
    float _614 = in.m_71.y;
    float _616 = in.m_71.z;
    float _618 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _620 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _622 = _602 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _624 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _628 = _618 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _632 = _620 + _630;
    float _634 = _188 * _588;
    float _636 = fma(_610, (*spvDescriptorSet0.vp_c10)._m0[8].y, _622);
    float _638 = _628 * _628;
    float _640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _642 = _624 + _640;
    float _644 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[10].y, _636);
    float _646 = fma(_632, _632, _638);
    float _648 = fma(_642, _642, _646);
    float _650 = abs(_644);
    bool _652 = _650 > 0.99989998340606689453125;
    float _654 = rsqrt(_648);
    float _656 = _538 * _612;
    float _658 = _540 * _614;
    float _660 = _542 * _616;
    float _662 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _664 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _666 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _668 = _644;
    float _670 = _648;
    float _672 = _588;
    if (_652)
    {
        _668 = 0.001000000047497451305389404296875;
    }
    float _674 = _668;
    float _676 = _662 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (!_652)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _678 = _546;
    float _680 = _678;
    if (!_652)
    {
        _670 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _682 = _670;
    float _684 = _682;
    if (_652)
    {
        float _686 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _680 = _686;
    }
    float _688 = _680;
    float _690 = _676 * _654;
    if (_652)
    {
        float _692 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _684 = _692;
    }
    float _694 = _684;
    if (!_652)
    {
        _672 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _696 = _672;
    float _698 = -_688;
    float _700 = _634 * _698;
    float _702 = _628 * _690;
    float _704 = _632 * _690;
    float _706 = _696;
    if (_652)
    {
        float _708 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _706 = _708;
    }
    float _710 = _706;
    float _712 = -_694;
    float _714 = -_700;
    float _716 = fma(_610, _712, _714);
    float _718 = -_702;
    float _720 = _628 + _718;
    float _722 = -_704;
    float _724 = _632 + _722;
    float _726 = _642 * _690;
    float _728 = _716 * _716;
    float _730 = _720 * _720;
    float _732 = -_694;
    float _734 = _602 * _732;
    float _736 = -_726;
    float _738 = _642 + _736;
    float _740 = fma(_724, _724, _730);
    float _742 = -_710;
    float _744 = -_734;
    float _746 = fma(_634, _742, _744);
    float _748 = -_710;
    float _750 = _610 * _748;
    float _752 = fma(_738, _738, _740);
    float _754 = fma(_746, _746, _728);
    float _756 = -_688;
    float _758 = -_750;
    float _760 = fma(_602, _756, _758);
    float _762 = in.m_73.x;
    float _764 = in.m_73.y;
    float _766 = in.m_73.z;
    float _768 = sqrt(_752);
    float _770 = fma(_760, _760, _754);
    float _772 = rsqrt(_770);
    float _774 = _654 * _768;
    float _776 = _664 * _774;
    float _778 = _666 * _774;
    float _780 = _662 * _774;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _764);
    float _784 = _760 * _772;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _766);
    float _788 = _716 * _772;
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _762);
    float _792 = _776 * _782;
    float _794 = _778 * _786;
    float _796 = _746 * _772;
    float _798 = _780 * _790;
    float _800 = _610 * _788;
    float _802 = _792 * _634;
    float _804 = _602 * _784;
    float _806 = _792 * _610;
    float _808 = -_800;
    float _810 = fma(_602, _796, _808);
    float _812 = fma(_798, _784, _802);
    float _814 = -_804;
    float _816 = fma(_634, _788, _814);
    float _818 = fma(_798, _796, _806);
    float _820 = _634 * _796;
    float _822 = fma(_794, _810, _812);
    float _824 = fma(_794, _816, _818);
    float _826 = -_820;
    float _828 = fma(_610, _784, _826);
    float _830 = _624 + _822;
    float _832 = _620 + _824;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _836 = _830 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _840 = _832 + _838;
    float _842 = _836 * _836;
    float _844 = fma(_840, _840, _842);
    float _846 = _792 * _602;
    float _848 = sqrt(_844);
    float _850 = fma(_798, _788, _846);
    float _852 = fma(_794, _828, _850);
    float _854 = _618 + _852;
    bool _856 = _848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = _794;
    float _860 = _798;
    float _862 = _792;
    if (!_856)
    {
        _858 = _832;
    }
    float _864 = _858;
    float _866 = _864;
    if (!_856)
    {
        _860 = _830;
    }
    float _868 = _860;
    float _870 = _868;
    if (!_856)
    {
        _862 = _854;
    }
    float _872 = _862;
    bool _874 = !_856;
    float _876 = _872;
    if (!_874)
    {
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _882 = _848 + _880;
        float _884 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = rsqrt(_844);
        float _888 = _882 * _878;
        float _890 = _888 * 0.15915493667125701904296875;
        float _892 = _890 * 6.283185482025146484375;
        float _894 = sin(_892);
        float _896 = _890 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = fma(_894, _884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _902 = _886 * _900;
        float _904 = _898 + (-1.0);
        float _906 = fma(_840, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _908 = fma(_836, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _910 = _904 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_854, _898, _910);
        _876 = _912;
        _866 = _906;
        _870 = _908;
    }
    float _914 = _876;
    float _916 = _866;
    float _918 = _870;
    float _920 = -_702;
    float _922 = _920 + _914;
    float _924 = -_704;
    float _926 = _924 + _916;
    float _928 = -_726;
    float _930 = _928 + _918;
    float _932 = -_702;
    float _934 = _618 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _938 = _922 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _942 = _926 + _940;
    float _944 = -_704;
    float _946 = _620 + _944;
    float _948 = _934 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _950 = _938 * _938;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _930 + _952;
    float _956 = -_726;
    float _958 = _624 + _956;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[11].x, _948);
    float _962 = fma(_942, _942, _950);
    float _964 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _960);
    float _966 = fma(_954, _954, _962);
    float _968 = _934 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _970 = _964 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _972 = rsqrt(_966);
    float _974 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[10].x, _968);
    float _976 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _974);
    float _978 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _980 = 1.0 / _970;
    float _982 = _976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _984 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _986 = _982 + _970;
    float _988 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _990 = floor(_978);
    float _992 = _942 * _988;
    float _994 = _954 * _988;
    float _996 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _998 = _986 * _980;
    float _1000 = _998 * 0.5;
    float _1002 = _992 * _992;
    float _1004 = _994 * _994;
    float _1006 = _934 + _996;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1010 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1008);
    float _1012 = sqrt(_966);
    float _1014 = _1002 + _1004;
    float _1016 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1020 = -_990;
    float _1022 = _978 + _1020;
    float _1024 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1016);
    float _1026 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1018);
    float _1028 = sqrt(_1014);
    float _1030 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1024);
    float _1032 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1026);
    float _1034 = _1030 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1038 = 1.0 / _1010;
    bool _1040 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = trunc(_1034);
    int _1044 = int(_1042);
    float _1046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1048 = _1028 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1052 = _1038 * _1050;
    float _1054 = floor(_984);
    bool _1056 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1058 = _1052 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1060 = _1030;
    int _1062 = 2;
    float _1064 = _1048;
    float _1066 = _990;
    float _1068 = _988;
    float _1070 = _992;
    float _1072 = _994;
    int _1074 = as_type<int>(_1054);
    int _1076 = as_type<int>(_984);
    float _1078 = _1002;
    float _1080 = _1004;
    float _1082 = _1036;
    if (_1040)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1084;
    }
    float _1086 = _1060;
    bool _1088 = !_1056;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1094 = _1044 + _1092;
    int _1096 = _1094 + 1;
    float _1098 = trunc(_1036);
    int _1100 = int(_1098);
    float _1102 = as_type<float>(_1090);
    float _1104 = as_type<float>(_1096);
    if (!_1056)
    {
        _1062 = 1;
    }
    int _1106 = _1062;
    int _1108 = _1106;
    if (!_1058)
    {
        _1108 = _1090;
    }
    int _1110 = _1108;
    bool _1112 = _1096 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1114 = _1110 << 6;
    if (_1040)
    {
        float _1116 = _1048 * _1086;
        _1102 = _1116;
    }
    float _1118 = _1102;
    if (_1040)
    {
        float _1120 = rsqrt(_1014);
        _1064 = _1120;
    }
    float _1122 = _1064;
    int _1124 = _1114 + 96;
    uint _1127 = uint(int(uint(_1124) >> uint(2)));
    uint _1129 = uint(int(uint(int(_1127)) >> uint(2)));
    int _1131 = int(_1127) & 3;
    float _1133 = (*spvDescriptorSet0.vp_c15)._m0[int(_1129)][_1131];
    int _1135 = int(_1127) + 1;
    uint _1137 = uint(int(uint(_1135) >> uint(2)));
    int _1139 = _1135 & 3;
    float _1141 = (*spvDescriptorSet0.vp_c15)._m0[int(_1137)][_1139];
    float _1143 = 0.0;
    float _1145 = _1122;
    if (_1040)
    {
        float _1147 = _1118 * 0.15915493667125701904296875;
        _1143 = _1147;
    }
    float _1149 = _1143;
    int _1151 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1153 = _1100 + _1151;
    int _1155 = _1153 + 1;
    float _1157 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1159 = 0.0;
    float _1161 = _1149;
    if (_1040)
    {
        float _1163 = _1149 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        _1159 = _1165;
    }
    float _1167 = _1159;
    int _1169 = _1114 + 48;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    uint _1173 = uint(int(uint(int(_1171)) >> uint(2)));
    int _1175 = int(_1171) & 3;
    float _1177 = (*spvDescriptorSet0.vp_c15)._m0[int(_1173)][_1175];
    int _1179 = int(_1171) + 1;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    int _1183 = _1179 & 3;
    float _1185 = (*spvDescriptorSet0.vp_c15)._m0[int(_1181)][_1183];
    int _1187 = _1096 | _1155;
    bool _1189 = _1187 < 0;
    bool _1191 = _1189 || _1112;
    float _1193 = precise::max(0.0, _1157);
    int _1195 = _1114 + 64;
    uint _1197 = uint(int(uint(_1195) >> uint(2)));
    uint _1199 = uint(int(uint(int(_1197)) >> uint(2)));
    int _1201 = int(_1197) & 3;
    float _1203 = (*spvDescriptorSet0.vp_c15)._m0[int(_1199)][_1201];
    int _1205 = int(_1197) + 1;
    uint _1207 = uint(int(uint(_1205) >> uint(2)));
    int _1209 = _1205 & 3;
    float _1211 = (*spvDescriptorSet0.vp_c15)._m0[int(_1207)][_1209];
    float _1213 = 0.0;
    if (_1040)
    {
        float _1215 = _1149 * 6.283185482025146484375;
        float _1217 = sin(_1215);
        _1213 = _1217;
    }
    float _1219 = _1213;
    bool _1221 = _1155 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1223 = _1221 || _1191;
    float _1225 = -_988;
    float _1227 = -_1193;
    float _1229 = fma(_938, _1225, _1227);
    if (_1040)
    {
        float _1231 = _1167 + (-1.0);
        _1066 = _1231;
    }
    float _1233 = _1066;
    int _1235 = _1114 + 104;
    uint _1237 = uint(int(uint(_1235) >> uint(2)));
    uint _1239 = uint(int(uint(int(_1237)) >> uint(2)));
    int _1241 = int(_1237) & 3;
    float _1243 = (*spvDescriptorSet0.vp_c15)._m0[int(_1239)][_1241];
    int _1245 = int(_1237) + 1;
    uint _1247 = uint(int(uint(_1245) >> uint(2)));
    int _1249 = _1245 & 3;
    float _1251 = (*spvDescriptorSet0.vp_c15)._m0[int(_1247)][_1249];
    if (_1040)
    {
        float _1253 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1068 = _1253;
    }
    float _1255 = _1068;
    int _1257 = _1114 + 56;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    uint _1261 = uint(int(uint(int(_1259)) >> uint(2)));
    int _1263 = int(_1259) & 3;
    float _1265 = (*spvDescriptorSet0.vp_c15)._m0[int(_1261)][_1263];
    int _1267 = int(_1259) + 1;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    int _1271 = _1267 & 3;
    float _1273 = (*spvDescriptorSet0.vp_c15)._m0[int(_1269)][_1271];
    float _1275 = _1219;
    int _1277 = as_type<int>(_1255);
    if (_1040)
    {
        float _1279 = fma(_1219, _1255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1275 = _1279;
    }
    float _1281 = _1275;
    float _1283 = _1281;
    if (!_1223)
    {
        int _1285 = _1155 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1287 = _1285 + _1096;
        _1277 = _1287;
    }
    int _1289 = _1277;
    if (_1040)
    {
        float _1291 = _1233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1104 = _1291;
    }
    float _1293 = _1104;
    float _1295 = -_1054;
    float _1297 = _984 + _1295;
    if (_1040)
    {
        float _1299 = _1122 * _1281;
        _1161 = _1299;
    }
    float _1301 = _1161;
    if (!_1040)
    {
        _1145 = _1229;
    }
    float _1303 = _1145;
    float _1305 = _1303;
    if (_1040)
    {
        float _1307 = fma(_1229, _1167, _1293);
        _1305 = _1307;
    }
    float _1309 = _1305;
    int _1311 = _1114 + 80;
    uint _1313 = uint(int(uint(_1311) >> uint(2)));
    uint _1315 = uint(int(uint(int(_1313)) >> uint(2)));
    int _1317 = int(_1313) & 3;
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[int(_1315)][_1317];
    int _1321 = int(_1313) + 1;
    uint _1323 = uint(int(uint(_1321) >> uint(2)));
    int _1325 = _1321 & 3;
    float _1327 = (*spvDescriptorSet0.vp_c15)._m0[int(_1323)][_1325];
    if (_1040)
    {
        float _1329 = _992 * _1301;
        _1070 = _1329;
    }
    float _1331 = _1070;
    if (_1040)
    {
        float _1333 = _994 * _1301;
        _1072 = _1333;
    }
    float _1335 = _1072;
    if (!_1223)
    {
        int _1337 = _1289 << 2;
        _1074 = _1337;
    }
    int _1339 = _1074;
    int _1341 = _1339;
    if (!_1223)
    {
        uint _1343 = uint(int(uint(_1289) >> uint(2)));
        _1076 = int(_1343);
    }
    int _1345 = _1076;
    if (_1040)
    {
        float _1347 = _1331 * _1331;
        _1078 = _1347;
    }
    float _1349 = _1078;
    if (_1040)
    {
        float _1351 = _1335 * _1335;
        _1080 = _1351;
    }
    float _1353 = _1080;
    int _1355 = _1114 + 72;
    uint _1357 = uint(int(uint(_1355) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c15)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c15)._m0[int(_1367)][_1369];
    float _1373 = _1006 * _1141;
    float _1375 = fma(_1309, _1309, _1349);
    int _1377 = as_type<int>(_1141);
    if (!_1223)
    {
        int _1379 = 12 & _1339;
        _1341 = _1379;
    }
    int _1381 = _1341;
    int _1383 = _1114 + 88;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    uint _1387 = uint(int(uint(int(_1385)) >> uint(2)));
    int _1389 = int(_1385) & 3;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[int(_1387)][_1389];
    int _1393 = int(_1385) + 1;
    uint _1395 = uint(int(uint(_1393) >> uint(2)));
    int _1397 = _1393 & 3;
    float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
    float _1401 = fma(_946, _1133, _1373);
    float _1403 = _1006 * _1185;
    float _1405 = _1375 + _1353;
    if (!_1223)
    {
        int _1407 = _1345 << 4;
        int _1409 = _1407 + _1381;
        _1377 = _1409;
    }
    int _1411 = _1377;
    float _1413 = _1006 * _1211;
    float _1415 = fma(_946, _1177, _1403);
    float _1417 = rsqrt(_1405);
    float _1419 = as_type<float>(_1345);
    if (!_1223)
    {
        int _1421 = _1411 + 400;
        uint _1423 = uint(int(uint(_1421) >> uint(2)));
        uint _1425 = uint(int(uint(int(_1423)) >> uint(2)));
        int _1427 = int(_1423) & 3;
        float _1429 = (*spvDescriptorSet0.vp_c15)._m0[int(_1425)][_1427];
        _1419 = _1429;
    }
    float _1431 = _1419;
    float _1433 = fma(_946, _1203, _1413);
    float _1435 = fma(_958, _1243, _1401);
    float2 _4851 = float2(_1022, _1297);
    float _1437 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).x;
    if (!_1223)
    {
        float _1439 = floor(_1036);
        _1283 = _1439;
    }
    float _1441 = _1283;
    float _1443 = fma(_958, _1265, _1415);
    float _1445 = _1435 + _1251;
    float _1447 = _922 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1449 = _1417 * _1331;
    float _1451 = _1443 + _1273;
    float _1453 = _1417 * _1309;
    float _1455 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1447);
    float _1457 = 1.0 / _1445;
    float _1459 = _1006 * _1327;
    float _1461 = _1417 * _1335;
    float _1463 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1455);
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1467 = fma(_946, _1319, _1459);
    float _1469 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1471 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1473 = _922 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1475 = fma(_958, _1363, _1433);
    float _1477 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1479 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1473);
    float _1481 = _1475 + _1371;
    float _1483 = -_1465;
    float _1485 = fma(_1453, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1483);
    float _1487 = -_1477;
    float _1489 = fma(_1487, _1469, 1.0);
    float _1491 = _1451 * _1457;
    float _1493 = fma(_958, _1391, _1467);
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1497 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1495);
    float _1499 = precise::clamp(_1497, 0.0, 1.0);
    float _1501 = _1481 * _1457;
    float _1503 = _922 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1505 = _1491 >= 0.0;
    float _1507 = -_1499;
    float _1509 = _1507 + 1.0;
    float _1511 = _922 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1503);
    bool _1515 = _1491 <= 1.0;
    bool _1517 = _1515 && _1505;
    float _1519 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1479);
    float _1521 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1523 = abs(_1509);
    float _1525 = log2(_1523);
    bool _1527 = _1501 >= 0.0;
    bool _1529 = _1527 && _1517;
    float _1531 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1513);
    float _1533 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1521);
    float _1535 = -_1461;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1485);
    bool _1539 = _1501 <= 1.0;
    bool _1541 = _1539 && _1529;
    float _1543 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1545 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1547 = _1519 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1549 = _1453 + 1.0;
    float _1551 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1553 = log2(_1489);
    float _1555 = _1493 + _1399;
    float _1557 = fma(_1537, -0.5, 0.5);
    float _1559 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1551);
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1563 = fma(_1537, 0.5, 0.5);
    float _1565 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1559);
    float _1567 = _1451;
    float _1569 = _1489;
    if (!_1223)
    {
        float _1571 = floor(_1034);
        _1567 = _1571;
    }
    float _1573 = _1567;
    if (_1541)
    {
        float _1575 = float(_1110);
        _1569 = _1575;
    }
    float _1577 = _1569;
    float _1579 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1581 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1583 = fma(_1563, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1223)
    {
        float _1585 = -_1441;
        float _1587 = _1036 + _1585;
        _1082 = _1587;
    }
    float _1589 = _1082;
    float _1591 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1579);
    float _1593 = exp2(_1561);
    float _1595 = fma(_1563, _1583, -0.212114393711090087890625);
    float _1597 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1591);
    float _1599 = _1553 * 0.693147182464599609375;
    float _1601 = fma(_1563, _1595, 1.570728778839111328125);
    float _1603 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1605 = _1577;
    if (_1541)
    {
        float _1607 = rint(_1577);
        float _1609 = precise::max(_1607, 0.0);
        uint _1611 = uint(_1609);
        uint _1613 = clamp(_1611, 0u, 65535u);
        _1605 = as_type<float>(_1613);
    }
    float _1615 = _1605;
    float _1617 = _1573;
    if (!_1223)
    {
        float _1619 = -_1573;
        float _1621 = _1034 + _1619;
        _1617 = _1621;
    }
    float _1623 = _1617;
    float _1625 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1597);
    float _1627 = -_1453;
    float _1629 = fma(_1593, _1549, _1627);
    float _1631 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1633 = sqrt(_1557);
    float _1635 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1631);
    float _1637 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1639 = _1555 * _1457;
    float _1641 = 1.0 / _1581;
    float _1643 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1637);
    float _1645 = _1615;
    if (_1541)
    {
        float3 _5226 = float3(_1491, _1501, float(as_type<int>(_1615)));
        float3 _5230 = select(_5226, float3(0.0), isnan(_5226));
        float _1647 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5230.xy, uint(rint(_5230.z)), _1639, level(0.0));
        _1645 = _1647;
    }
    float _1649 = _1645;
    float _1651 = _1633 * 0.636619746685028076171875;
    float _1653 = _1457;
    if (!_1223)
    {
        float _1655 = rint(_1431);
        float _1657 = precise::max(_1655, 0.0);
        uint _1659 = uint(_1657);
        uint _1661 = clamp(_1659, 0u, 65535u);
        _1653 = as_type<float>(_1661);
    }
    float _1663 = _1653;
    float _1665 = -_1601;
    float _1667 = fma(_1651, _1665, 1.0);
    float _1669 = _1643 * _1641;
    float _1671 = _1625 * _1641;
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = fma(_1671, 0.5, 0.5);
    float _1677 = fma(_1629, 0.5, 0.5);
    float3 _5276 = float3(_1675, _1673, _1603);
    float _1679 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5276, float3(0.0), isnan(_5276)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5276, float3(0.0), isnan(_5276)), level(0.0)).x;
    float3 _5285 = float3(_1675, _1673, _1603);
    float4 _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5285, float3(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5285, float3(0.0), isnan(_5285)), level(0.0)).xyzw;
    float _1684 = _1682.x;
    float _1686 = _1682.y;
    float _1688 = _1682.z;
    float _1690 = _1682.w;
    float2 _5301 = float2(_1667, _1677);
    float3 _1694 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5301, float2(0.0), isnan(_5301)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5301, float2(0.0), isnan(_5301)), level(0.0)).xyz;
    float _1696 = _1694.x;
    float _1698 = _1694.y;
    float _1700 = _1694.z;
    float _1702 = _1589;
    if (!_1223)
    {
        float3 _5322 = float3(_1623, _1589, float(as_type<int>(_1663)));
        float3 _5324 = select(_5322, float3(0.0), isnan(_5322));
        float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5324.xy, uint(rint(_5324.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5324.xy, uint(rint(_5324.z)), level(0.0)).x;
        _1702 = _1704;
    }
    float _1706 = _1702;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1710 = _574 + _1708;
    float _1712 = _1543 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1722 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1724 = isnan(_574);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1730 = _1726 || _1728;
    float _1732 = float(_1730);
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1736 = _1734 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1738 = 1.0 / _1716;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1750 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1748;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1756 = 1.0 / _1720;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1766 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1712);
    bool _1768 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1770 = isnan(_574);
    bool _1772 = _1768 || _1770;
    bool _1774 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1776 = _1772 || _1774;
    float _1778 = float(_1776);
    bool _1780 = _764 != 0.0;
    bool _1782 = isnan(_764);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan(0.0);
    bool _1788 = _1784 || _1786;
    float _1790 = 1.0 / _1746;
    float _1792 = _1750 * _1738;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1796 = _1794 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1798 = -_1732;
    float _1800 = _1798 + 1.0;
    bool _1802 = _762 == 0.0;
    bool _1804 = !_1788;
    bool _1806 = _1802 && _1804;
    float _1808 = fma(_1792, _1710, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1810 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1766);
    float _1812 = 1.0 / _1736;
    float _1814 = _1760 * _1756;
    bool _1816 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1818 = isnan(_574);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1828;
    bool _1832 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1834 = isnan(_574);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    bool _1844 = _766 == 0.0;
    bool _1846 = _1844 && _1806;
    float _1848 = _1826 * _1800;
    float _1850 = 1.0 / _1764;
    float _1852 = _1796 * _1790;
    bool _1854 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1856 = isnan(_574);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = -_1826;
    float _1868 = _1866 + 1.0;
    float _1870 = -_1842;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1742;
    float _1876 = _1754 * _1812;
    float _1878 = _1864 * _1868;
    bool _1880 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1882 = isnan(_574);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1888 = _1884 || _1886;
    float _1890 = float(_1888);
    float _1892 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1892;
    float _1896 = -_1864;
    float _1898 = _1896 + 1.0;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1904 = _1894 * _1850;
    float _1906 = -_1890;
    float _1908 = _1906 + 1.0;
    bool _1910 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1912 = isnan(_574);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    float _1922 = _1842 * _1898;
    float _1924 = _1890 * _1872;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1930 = _1778 * _1908;
    bool _1932 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1934 = isnan(_574);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = -_1778;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1920;
    float _1950 = _1948 + 1.0;
    float _1952 = abs(_1052);
    float _1954 = log2(_1952);
    float _1956 = _1902 * _1874;
    float _1958 = _1920 * _1946;
    float _1960 = _1942 * _1950;
    float _1962 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1964 = _574 + _1962;
    float _1966 = -_1942;
    float _1968 = _1966 + 1.0;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1972 = _574 + _1970;
    float _1974 = _1808 * _1960;
    float _1976 = fma(_1876, _1964, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1978 = 1.0 / _1928;
    float _1980 = in.m_75.x;
    float _1982 = in.m_75.y;
    float _1984 = in.m_75.z;
    float _1986 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1974);
    float _1988 = fma(_1814, _1972, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1992 = _574 + _1990;
    bool _1994 = _1052 <= 8000.0;
    bool _1996 = isnan(_1052);
    bool _1998 = _1994 || _1996;
    bool _2000 = isnan(8000.0);
    bool _2002 = _1998 || _2000;
    float _2004 = float(_2002);
    float _2006 = fma(_1976, _1958, _1986);
    float _2008 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2012 = _574 + _2010;
    float _2014 = fma(_1904, _1992, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2016 = fma(_1988, _1930, _2006);
    float _2018 = fma(_1852, _2012, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2020 = exp2(_2008);
    float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2024 = _574 + _2022;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2028 = _574 + _2026;
    float _2030 = fma(_2018, _1924, _2016);
    float _2032 = _1830 * _1978;
    float _2034 = fma(_1956, _2024, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2036 = fma(_2014, _1922, _2030);
    float _2038 = fma(_2032, _2028, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2040 = fma(_2034, _1878, _2036);
    float _2042 = _1982;
    float _2044 = _1980;
    float _2046 = _1984;
    if (!_1846)
    {
        float _2048 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1982);
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1846)
    {
        float _2052 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1980);
        _2044 = _2052;
    }
    float _2054 = _2044;
    float _2056 = fma(_2038, _1848, _2040);
    if (!_1846)
    {
        float _2058 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1984);
        _2046 = _2058;
    }
    float _2060 = _2046;
    float _2062 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2064 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2066 = precise::clamp(_2064, 0.0, 1.0);
    float _2068 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2056);
    float _2070 = _610 * _2050;
    float _2072 = _602 * _2050;
    float _2074 = fma(_2066, -2.0, 3.0);
    float _2076 = _2066 * _2066;
    out.m_77.x = _2068;
    float _2078 = exp2(_2062);
    float _2080 = _634 * _2050;
    float _2082 = _2076 * _2074;
    float _2084 = fma(_1547, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1810);
    float _2086 = fma(_796, _2054, _2070);
    float _2088 = -_2082;
    float _2090 = _2088 + 1.0;
    float _2092 = _2084 + _1581;
    out.gl_Position.x = _1625;
    out.gl_Position.y = _1643;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _1581;
    float _2094 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2082);
    float _2096 = _2092 * 0.5;
    float _2098 = fma(_788, _2054, _2072);
    float _2100 = fma(_784, _2054, _2080);
    float _2102 = _2004 * _2094;
    float _2104 = fma(_816, _2060, _2086);
    float _2106 = -_2078;
    float _2108 = _2106 + 1.0;
    out.m_79.z = _2096;
    out.m_79.w = _1581;
    float _2110 = fma(_828, _2060, _2098);
    float _2112 = fma(_810, _2060, _2100);
    float _2114 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2116 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2118 = _1581;
    float _2120 = _2096;
    float _2122 = _1625;
    if (!_1541)
    {
        _2118 = 1.0;
    }
    float _2124 = _2118;
    float _2126 = _2124;
    if (_1223)
    {
        _2120 = 1.0;
    }
    float _2128 = _2120;
    float _2130 = -_1437;
    float _2132 = _2130 + 1.0;
    float _2134 = _2132 * _2116;
    float _2136 = precise::clamp(_2134, 0.0, 1.0);
    float _2138 = _2128;
    if (_1541)
    {
        bool _2140 = _1649 >= _1639;
        bool _2142 = isnan(_1649);
        bool _2144 = _2140 || _2142;
        bool _2146 = isnan(_1639);
        bool _2148 = _2144 || _2146;
        float _2150 = float(_2148);
        _2126 = _2150;
    }
    float _2152 = _2126;
    float _2154 = _2152;
    if (!_1223)
    {
        int _2156 = _1289 << 4;
        int _2158 = _2156 + 2048;
        uint _2160 = uint(int(uint(_2158) >> uint(2)));
        uint _2162 = uint(int(uint(int(_2160)) >> uint(2)));
        int _2164 = int(_2160) & 3;
        float _2166 = (*spvDescriptorSet0.vp_c15)._m0[int(_2162)][_2164];
        int _2168 = int(_2160) + 1;
        uint _2170 = uint(int(uint(_2168) >> uint(2)));
        int _2172 = _2168 & 3;
        float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
        int _2176 = _2158 + 8;
        uint _2178 = uint(int(uint(_2176) >> uint(2)));
        uint _2180 = uint(int(uint(int(_2178)) >> uint(2)));
        int _2182 = int(_2178) & 3;
        float _2184 = (*spvDescriptorSet0.vp_c15)._m0[int(_2180)][_2182];
        int _2186 = int(_2178) + 1;
        uint _2188 = uint(int(uint(_2186) >> uint(2)));
        int _2190 = _2186 & 3;
        float _2192 = (*spvDescriptorSet0.vp_c15)._m0[int(_2188)][_2190];
        float _2194 = _1006 * _2174;
        float _2196 = fma(_946, _2166, _2194);
        float _2198 = fma(_958, _2184, _2196);
        float _2200 = _2198 + _2192;
        float _2202 = precise::clamp(_2200, 0.0, 1.0);
        float _2204 = -_2202;
        float _2206 = _2204 + _1706;
        float _2208 = fma(_2206, 500.0, 1.5);
        float _2210 = exp2(_2208);
        float _2212 = 0.0 + _2210;
        float _2214 = precise::clamp(_2212, 0.0, 1.0);
        _2138 = _2214;
    }
    float _2216 = _2138;
    float _2218 = _2114 * _1679;
    float _2220 = _2152 * _2216;
    float _2222 = -_2136;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2226 = -_2114;
    float _2228 = _2226 + 1.0;
    float _2230 = _1690 * _2218;
    float _2232 = _1700 * _2218;
    float _2234 = -_2220;
    float _2236 = fma(_2234, _2224, 1.0);
    float _2238 = precise::clamp(_2236, 0.0, 1.0);
    out.m_81.x = _2104;
    out.m_81.y = _2110;
    out.m_81.z = _2112;
    float _2240 = fma(_1696, _2230, _1684);
    float _2242 = fma(_1698, _2230, _1686);
    float _2244 = _2238 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2246 = _1690 * _2228;
    float _2248 = fma(_1690, _2232, _1688);
    out.m_83.x = _926;
    out.m_83.y = _922;
    out.m_83.z = _930;
    bool _2250 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2252 = isnan(_1012);
    bool _2254 = _2250 || _2252;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2258 = _2254 || _2256;
    out.m_85.x = _2244;
    out.m_87.x = _2240;
    out.m_87.y = _2242;
    out.m_87.z = _2248;
    out.m_87.w = _2246;
    float _2260 = _2224;
    float _2262 = _2228;
    float _2264 = _2238;
    float _2266 = _2230;
    if (!_2258)
    {
        _2122 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2268 = _2122;
    float _2270 = _2268;
    float _2272 = _2268;
    if (!_2258)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2274 = _2260;
    float _2276 = _2274;
    float _2278 = _2274;
    if (!_2258)
    {
        _2262 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2280 = _2262;
    float _2282 = _2280;
    float _2284 = _2280;
    if (!_2258)
    {
        _2154 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2286 = _2154;
    float _2288 = _2286;
    float _2290 = _2286;
    if (!_2258)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2292 = _2264;
    float _2294 = _2292;
    float _2296 = _2292;
    if (!_2258)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2298 = _2266;
    bool _2300 = !_2258;
    float _2302 = _2298;
    float _2304 = _2298;
    if (!_2300)
    {
        bool _2306 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2308 = isnan(_1012);
        bool _2310 = _2306 || _2308;
        bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2314 = _2310 || _2312;
        if (!_2314)
        {
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2318 = _1012 + _2316;
            float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2322 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2320;
            float _2324 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2328 = 1.0 / _2322;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2340 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2344 = _2342 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2346 = _2318 * _2328;
            float _2348 = precise::clamp(_2346, 0.0, 1.0);
            float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2352 = _2350 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2354 = fma(_2348, _2326, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2356 = fma(_2348, _2352, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2358 = fma(_2348, _2332, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2360 = fma(_2348, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2362 = fma(_2348, _2340, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2364 = fma(_2348, _2344, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2278 = _2358;
            _2296 = _2362;
            _2272 = _2354;
            _2290 = _2360;
            _2284 = _2356;
            _2304 = _2364;
            _2366 = true;
        }
        else
        {
            bool _2368 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2370 = isnan(_1012);
            bool _2372 = _2368 || _2370;
            bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2376 = _2372 || _2374;
            if (!_2376)
            {
                _2270 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2378 = _2270;
            _2272 = _2378;
            if (!_2376)
            {
                _2276 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2380 = _2276;
            _2278 = _2380;
            if (!_2376)
            {
                _2282 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2382 = _2282;
            _2284 = _2382;
            if (!_2376)
            {
                _2288 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2384 = _2288;
            _2290 = _2384;
            if (!_2376)
            {
                _2294 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2386 = _2294;
            _2296 = _2386;
            if (!_2376)
            {
                _2302 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2388 = _2302;
            bool _2390 = !_2376;
            _2304 = _2388;
            if (!_2390)
            {
                bool _2392 = _1012 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2394 = isnan(_1012);
                bool _2396 = _2392 || _2394;
                bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2400 = _2396 || _2398;
                if (!_2400)
                {
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2404 = _1012 + _2402;
                    float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2406;
                    float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2414 = 1.0 / _2408;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2432 = _2404 * _2414;
                    float _2434 = precise::clamp(_2432, 0.0, 1.0);
                    float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2440 = fma(_2434, _2412, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2278 = _2444;
                    _2296 = _2448;
                    _2272 = _2440;
                    _2290 = _2446;
                    _2284 = _2442;
                    _2304 = _2450;
                    _2366 = true;
                }
                else
                {
                    _2278 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2296 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2272 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2290 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2284 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2304 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2366 = false;
    float _2452 = _2278;
    float _2454 = _2296;
    float _2456 = _2272;
    float _2458 = _2290;
    float _2460 = _2284;
    float _2462 = _2304;
    float _2464 = fma(_2110, -0.5, 0.5);
    float _2466 = precise::clamp(_2464, 0.0, 1.0);
    float _2468 = -_2452;
    float _2470 = _2468 + _2454;
    float _2472 = -_2456;
    float _2474 = _2472 + _2458;
    float _2476 = -_2460;
    float _2478 = _2476 + _2462;
    bool _2480 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2482 = fma(_2466, _2470, _2452);
    float _2484 = fma(_2466, _2474, _2456);
    float _2486 = fma(_2466, _2478, _2460);
    float _2488 = _2482 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2490 = fma(_2484, 0.298911988735198974609375, _2488);
    float _2492 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2494 = fma(_2486, 0.114477999508380889892578125, _2490);
    out.m_85.w = _2492;
    float _2496 = -_2494;
    float _2498 = _2484 + _2496;
    float _2500 = -_2494;
    float _2502 = _2482 + _2500;
    float _2504 = -_2494;
    float _2506 = _2486 + _2504;
    out.m_89.x = 0.0;
    float _2508 = fma(_2498, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2510 = fma(_2502, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    float _2512 = fma(_2506, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2494);
    out.m_91.x = _2508;
    out.m_91.y = _2510;
    out.m_91.z = _2512;
    if (!_2480)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2514 = -_922;
    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2518 = -_926;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2522 = -_930;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2526 = _2516 * _2516;
    float _2528 = fma(_2520, _2520, _2526);
    float _2530 = fma(_2524, _2524, _2528);
    float _2532 = sqrt(_2530);
    float _2534 = rsqrt(_2530);
    float _2536 = -_2532;
    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2542 = precise::clamp(_2540, 0.0, 1.0);
    float _2544 = _2520 * _2534;
    float _2546 = _2516 * _2534;
    float _2548 = abs(_2542);
    float _2550 = log2(_2548);
    float _2552 = _2524 * _2534;
    float _2554 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2556 = _2110 * _2546;
    float _2558 = -_2546;
    float _2560 = -_2554;
    float _2562 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2560);
    float _2564 = fma(_2104, _2544, _2556);
    float _2566 = -_2552;
    float _2568 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2562);
    float _2570 = fma(_2112, _2552, _2564);
    float _2572 = precise::clamp(_2570, 0.0, 1.0);
    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2576 = _2568 + _2574;
    float _2578 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2580 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2582 = precise::clamp(_2580, 0.0, 1.0);
    float _2584 = exp2(_2578);
    float _2586 = _2584 * _2582;
    float _2588 = _2572 * _2586;
    float _2590 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2592 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2594 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2590;
    out.m_89.y = _2592;
    out.m_89.z = _2594;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

