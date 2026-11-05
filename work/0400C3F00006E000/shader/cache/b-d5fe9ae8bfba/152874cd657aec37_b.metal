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
    float4 m_79 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2452 = false;
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
        float _2737 = as_type<float>(_126);
        out.gl_Position.z = _2737;
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
        float _2806 = as_type<float>(_162);
        out.gl_Position.z = _2806;
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
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _298 = _290 * _232;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _218 + _300;
    out.m_69.x = _252;
    out.m_69.y = _254;
    out.m_69.z = _286;
    float _304 = 1.0 / _260;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _218 + _306;
    float _310 = _302 * _242;
    bool _312 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _314 = isnan(_218);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = _282 * _256;
    bool _326 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_218);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _308 * _284;
    bool _340 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_218);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = _218 + _352;
    bool _356 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_218);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_322;
    float _370 = _368 + 1.0;
    float _372 = _350 * _294;
    float _374 = -_350;
    float _376 = _374 + 1.0;
    float _378 = -_366;
    float _380 = _378 + 1.0;
    float _382 = _366 * _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = _336 * _380;
    bool _394 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_218);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _406;
    float _410 = -_336;
    float _412 = _410 + 1.0;
    float _414 = fma(_386, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_390, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = _404 * _376;
    float _420 = _354 * _304;
    float _422 = fma(_408, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _424 = _278 * _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = _414 * _418;
    float _440 = -_404;
    float _442 = _440 + 1.0;
    float _444 = _416 * _418;
    float _446 = _422 * _418;
    float _448 = fma(_428, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = fma(_432, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_436, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _460 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _446);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _466 = fma(_456, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_448, _372, _458);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _470;
    float _474 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _476;
    float _480 = fma(_464, _324, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = fma(_466, _424, _468);
    float _488 = fma(_472, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_450, _372, _474);
    float _496 = fma(_452, _372, _460);
    float _498 = fma(_478, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_484, _324, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _502 = fma(_492, _324, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _504 = fma(_488, _424, _494);
    float _506 = fma(_498, _424, _496);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_480, _392, _486);
    float _522 = fma(_510, _420, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_514, _420, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _420, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_500, _392, _504);
    float _530 = fma(_502, _392, _506);
    float _532 = fma(_522, _382, _520);
    float _534 = fma(_524, _382, _528);
    float _536 = fma(_526, _382, _530);
    float _538 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_296;
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
    float2 _3690 = float2(_662, _666);
    float _668 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3690, float2(0.0), isnan(_3690)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3690, float2(0.0), isnan(_3690)), level(0.0)).x;
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
    float _716 = 1.0 / _712;
    float _718 = _542 * _602;
    float _720 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _722 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _724 = _186 * _696;
    float _726 = _184 * _696;
    float _728 = _188 * _696;
    float _730 = _720 + _712;
    float _732 = _724 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _734 = _682 + _722;
    float _736 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].y, _732);
    float _740 = _730 * _716;
    float _742 = _740 * 0.5;
    float _744 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[10].y, _738);
    float _746 = abs(_744);
    bool _748 = _746 > 0.99989998340606689453125;
    float _750 = _702;
    float _752 = _696;
    float _754 = _744;
    int _756 = 2;
    float _758 = _734;
    if (_748)
    {
        _750 = 0.001000000047497451305389404296875;
    }
    float _760 = _750;
    if (!_748)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _762 = _546;
    float _764 = _762;
    if (!_748)
    {
        _752 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _766 = _752;
    float _768 = _766;
    if (_748)
    {
        float _770 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _764 = _770;
    }
    float _772 = _764;
    if (!_748)
    {
        _754 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _774 = _754;
    float _776 = _774;
    if (_748)
    {
        float _778 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _768 = _778;
    }
    float _780 = _768;
    if (_748)
    {
        float _782 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _776 = _782;
    }
    float _784 = _776;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[30].w, _786);
    float _790 = -_772;
    float _792 = _728 * _790;
    float _794 = -_780;
    float _796 = _724 * _794;
    float _798 = fma(_706, _706, _700);
    float _800 = 1.0 / _788;
    float _802 = -_780;
    float _804 = -_792;
    float _806 = fma(_726, _802, _804);
    float _808 = -_784;
    float _810 = -_796;
    float _812 = fma(_728, _808, _810);
    float _814 = -_784;
    float _816 = _726 * _814;
    float _818 = _806 * _806;
    float _820 = -_772;
    float _822 = -_816;
    float _824 = fma(_724, _820, _822);
    float _826 = sqrt(_798);
    float _828 = fma(_812, _812, _818);
    float _830 = fma(_824, _824, _828);
    float _832 = in.m_73.x;
    float _834 = in.m_73.y;
    float _836 = in.m_73.z;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _840 = _800 * _838;
    float _842 = _734 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _844 = rsqrt(_830);
    bool _846 = _840 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _848 = _840 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _850 = _630 * _826;
    bool _852 = !_846;
    int _854 = _852 ? 0 : 1;
    float _856 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _858 = _736 * _850;
    float _860 = _634 * _850;
    float _862 = _856 * _850;
    if (!_846)
    {
        _756 = 1;
    }
    int _864 = _756;
    float _866 = _812 * _844;
    int _868 = _864;
    if (!_848)
    {
        _868 = _854;
    }
    int _870 = _868;
    float _872 = _806 * _844;
    float _874 = _824 * _844;
    float _876 = _734 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _878 = _870 << 6;
    float _880 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[126].x, _842);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
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
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _909 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[127].z, _884);
    float _911 = _858 * _882;
    float _913 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
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
    float _937 = _860 * _907;
    float _939 = _726 * _872;
    float _941 = _911 * _728;
    float _943 = trunc(_913);
    int _945 = int(_943);
    float _947 = _862 * _915;
    float _949 = _724 * _874;
    float _951 = -_939;
    float _953 = fma(_724, _866, _951);
    int _955 = _878 + 48;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    float _973 = _911 * _726;
    float _975 = fma(_937, _874, _941);
    float _977 = -_949;
    float _979 = fma(_728, _872, _977);
    float _981 = trunc(_917);
    int _983 = int(_981);
    float _985 = fma(_937, _866, _973);
    float _987 = fma(_947, _953, _975);
    int _989 = _878 + 64;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_947, _979, _985);
    float _1009 = _610 + _987;
    int _1011 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1013 = _945 + _1011;
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
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1043 = _1017 + _1041;
    float _1045 = _1021 * _1021;
    bool _1047 = _1015 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1049 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1051 = _983 + _1049;
    int _1053 = _1051 + 1;
    float _1055 = fma(_1043, _1043, _1045);
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
    bool _1077 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    bool _1087 = _1075 < 0;
    bool _1089 = _1087 || _1047;
    float _1091 = sqrt(_1055);
    int _1093 = _878 + 80;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    float _1111 = _734 * _903;
    bool _1113 = _1053 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1115 = _1113 || _1089;
    float _1117 = _911 * _724;
    float _1119 = _728 * _866;
    float _1121 = fma(_646, _895, _1111);
    float _1123 = fma(_937, _872, _1117);
    float _1125 = -_1119;
    float _1127 = fma(_726, _874, _1125);
    float _1129 = fma(_650, _927, _1121);
    float _1131 = fma(_947, _1127, _1123);
    float _1133 = _1129 + _935;
    bool _1135 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _734 * _971;
    int _1139 = as_type<int>(_937);
    int _1141 = _1053;
    int _1143 = _1015;
    float _1145 = _1017;
    float _1147 = _1009;
    float _1149 = _1055;
    float _1151 = _913;
    float _1153 = as_type<float>(_870);
    if (!_1115)
    {
        int _1155 = _1053 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1157 = _1155 + _1015;
        _1139 = _1157;
    }
    int _1159 = _1139;
    float _1161 = 1.0 / _1133;
    float _1163 = fma(_646, _963, _1137);
    float _1165 = as_type<float>(_1159);
    if (!_1115)
    {
        int _1167 = _1159 << 2;
        _1141 = _1167;
    }
    int _1169 = _1141;
    float _1171 = _734 * _1005;
    int _1173 = _1169;
    if (!_1115)
    {
        uint _1175 = uint(int(uint(_1159) >> uint(2)));
        _1143 = int(_1175);
    }
    int _1177 = _1143;
    float _1179 = _963;
    if (!_1115)
    {
        float _1181 = floor(_913);
        _1179 = _1181;
    }
    float _1183 = _1179;
    if (!_1115)
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
    if (!_1115)
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
        float _1221 = _1091 + _1219;
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
        float _1249 = fma(_1043, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].x);
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
    if (!_1085)
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
        float _1313 = 1.0 / _850;
        float _1315 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1289;
        float _1321 = -_606;
        float _1323 = _1321 + _1253;
        float _1325 = _1319 * _1313;
        float _1327 = _1315 * _1325;
        float _1329 = _1293 * _1325;
        float _1331 = fma(_1323, _1327, _682);
        float _1333 = fma(_1303, _1327, _646);
        float _1335 = fma(_1315, _1329, _650);
        _1275 = _1331;
        _1277 = _1333;
        _1279 = _1335;
        _1209 = _1295;
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
    float _1371 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1373 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1365);
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1377 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = _1259;
    if (!_1115)
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
    float _1397 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1399 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1371);
    float _1401 = _1207 * _1161;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1405 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1407 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1409 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1399);
    bool _1411 = _1401 >= 0.0;
    float _1413 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1405);
    float _1415 = _1273 * _1161;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1419 = _1401 <= 1.0;
    bool _1421 = _1419 && _1411;
    float _1423 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1413);
    float _1425 = _1343;
    if (!_1115)
    {
        float _1427 = floor(_917);
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1433 = _1415 >= 0.0;
    bool _1435 = _1433 && _1421;
    float _1437 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1423);
    float _1439 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1441 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1443 = _1415 <= 1.0;
    bool _1445 = _1443 && _1435;
    float _1447 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1431);
    float _1449 = 1.0 / _1437;
    float _1451 = -_1441;
    float _1453 = fma(_1451, _1439, 1.0);
    float _1455 = _734 * _1109;
    float _1457 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1459 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1447);
    float _1461 = _1439;
    float _1463 = _1447;
    if (!_1115)
    {
        float _1465 = -_1183;
        float _1467 = _913 + _1465;
        _1151 = _1467;
    }
    float _1469 = _1151;
    float _1471 = fma(_646, _1101, _1455);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1457);
    float _1475 = log2(_1453);
    float _1477 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1459);
    float _1479 = _1477;
    if (!_1115)
    {
        float _1481 = -_1429;
        float _1483 = _917 + _1481;
        _1461 = _1483;
    }
    float _1485 = _1461;
    if (_1445)
    {
        float _1487 = float(_870);
        _1153 = _1487;
    }
    float _1489 = _1153;
    float _1491 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1473);
    float _1493 = _1477 * _1449;
    float _1495 = _1455;
    if (_1445)
    {
        float _1497 = rint(_1489);
        float _1499 = precise::max(_1497, 0.0);
        uint _1501 = uint(_1499);
        uint _1503 = clamp(_1501, 0u, 65535u);
        _1495 = as_type<float>(_1503);
    }
    float _1505 = _1495;
    float _1507 = fma(_650, _1355, _1471);
    float _1509 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1491);
    float _1511 = fma(_1493, -0.5, 0.5);
    float _1513 = _1507 + _1363;
    float _1515 = _1475 * 0.693147182464599609375;
    float _1517 = _1493;
    float _1519 = _1509;
    if (!_1115)
    {
        float _1521 = rint(_1391);
        float _1523 = precise::max(_1521, 0.0);
        uint _1525 = uint(_1523);
        uint _1527 = clamp(_1525, 0u, 65535u);
        _1517 = as_type<float>(_1527);
    }
    float _1529 = _1517;
    float _1531 = _1509 * _1449;
    float _1533 = _1513 * _1161;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = fma(_1531, 0.5, 0.5);
    float _1539 = _1449;
    if (_1445)
    {
        float3 _5129 = float3(_1401, _1415, float(as_type<int>(_1505)));
        float3 _5133 = select(_5129, float3(0.0), isnan(_5129));
        float _1541 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5133.xy, uint(rint(_5133.z)), _1533, level(0.0));
        _1539 = _1541;
    }
    float _1543 = _1539;
    float3 _5143 = float3(_1537, _1511, _1535);
    float _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5143, float3(0.0), isnan(_5143)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5143, float3(0.0), isnan(_5143)), level(0.0)).x;
    float3 _5152 = float3(_1537, _1511, _1535);
    float4 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5152, float3(0.0), isnan(_5152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5152, float3(0.0), isnan(_5152)), level(0.0)).xyzw;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _1548.w;
    float _1558 = _1485;
    if (!_1115)
    {
        float3 _5175 = float3(_1469, _1485, float(as_type<int>(_1529)));
        float3 _5177 = select(_5175, float3(0.0), isnan(_5175));
        float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5177.xy, uint(rint(_5177.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5177.xy, uint(rint(_5177.z)), level(0.0)).x;
        _1558 = _1560;
    }
    float _1562 = _1558;
    if (_1115)
    {
        _1463 = 1.0;
    }
    float _1564 = _1463;
    float _1566 = _1564;
    if (!_1115)
    {
        int _1568 = _1159 << 4;
        int _1570 = _1568 + 2048;
        uint _1572 = uint(int(uint(_1570) >> uint(2)));
        uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
        int _1576 = int(_1572) & 3;
        float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
        int _1580 = int(_1572) + 1;
        uint _1582 = uint(int(uint(_1580) >> uint(2)));
        int _1584 = _1580 & 3;
        float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
        int _1588 = _1570 + 8;
        uint _1590 = uint(int(uint(_1588) >> uint(2)));
        uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
        int _1594 = int(_1590) & 3;
        float _1596 = (*spvDescriptorSet0.vp_c15)._m0[int(_1592)][_1594];
        int _1598 = int(_1590) + 1;
        uint _1600 = uint(int(uint(_1598) >> uint(2)));
        int _1602 = _1598 & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        float _1606 = _734 * _1586;
        float _1608 = fma(_646, _1578, _1606);
        float _1610 = fma(_650, _1596, _1608);
        float _1612 = _1610 + _1604;
        float _1614 = precise::clamp(_1612, 0.0, 1.0);
        float _1616 = -_1614;
        float _1618 = _1616 + _1562;
        float _1620 = fma(_1618, 500.0, 1.5);
        float _1622 = exp2(_1620);
        float _1624 = 0.0 + _1622;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        _758 = _1606;
        _1165 = as_type<float>(_1570);
        _1566 = _1626;
    }
    float _1628 = _758;
    float _1630 = _1165;
    float _1632 = _1566;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = _1337 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1640 = _1339 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1644 = _1341 + _1642;
    float _1646 = _1636 * _1636;
    float _1648 = fma(_1640, _1640, _1646);
    float _1650 = fma(_1644, _1644, _1648);
    float _1652 = rsqrt(_1650);
    float _1654 = sqrt(_1650);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1658 = _1640 * _1656;
    float _1660 = _1644 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 * _1660;
    float _1666 = _1662 + _1664;
    float _1668 = sqrt(_1666);
    bool _1670 = _1668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1668 + _1672;
    float _1676 = _1628;
    float _1678 = _1666;
    float _1680 = _1674;
    float _1682 = _1630;
    float _1684 = _1636;
    float _1686 = _1658;
    float _1688 = _1660;
    float _1690 = _1662;
    float _1692 = _1664;
    if (_1670)
    {
        float _1694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1694;
    }
    float _1696 = _1676;
    if (_1670)
    {
        float _1698 = rsqrt(_1666);
        _1678 = _1698;
    }
    float _1700 = _1678;
    if (_1670)
    {
        float _1702 = _1674 * _1696;
        _1680 = _1702;
    }
    float _1704 = _1680;
    if (_1670)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1682 = _1706;
    }
    float _1708 = _1682;
    float _1710 = _650;
    if (_1670)
    {
        float _1712 = _1708 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1720 = precise::max(0.0, _1718);
    float _1722 = _1696;
    float _1724 = _1720;
    if (_1670)
    {
        float _1726 = _1708 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = -_1656;
    float _1734 = -_1720;
    float _1736 = fma(_1636, _1732, _1734);
    if (_1670)
    {
        float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1738;
    }
    float _1740 = _1684;
    float _1742 = _1740;
    float _1744 = _1716;
    if (_1670)
    {
        float _1746 = fma(_1716, _1740, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1742 = _1746;
    }
    float _1748 = _1742;
    float _1750 = _1748;
    if (_1670)
    {
        float _1752 = _1730 + (-1.0);
        _1724 = _1752;
    }
    float _1754 = _1724;
    float _1756 = _1754;
    if (_1670)
    {
        float _1758 = _1700 * _1748;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (!_1670)
    {
        _1750 = _1736;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (_1670)
    {
        float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1766;
    }
    float _1768 = _1756;
    if (_1670)
    {
        float _1770 = _1658 * _1760;
        _1686 = _1770;
    }
    float _1772 = _1686;
    if (_1670)
    {
        float _1774 = _1660 * _1760;
        _1688 = _1774;
    }
    float _1776 = _1688;
    if (_1670)
    {
        float _1778 = fma(_1736, _1730, _1768);
        _1764 = _1778;
    }
    float _1780 = _1764;
    if (_1670)
    {
        float _1782 = _1772 * _1772;
        _1690 = _1782;
    }
    float _1784 = _1690;
    if (_1670)
    {
        float _1786 = _1776 * _1776;
        _1692 = _1786;
    }
    float _1788 = _1692;
    float _1790 = fma(_1780, _1780, _1784);
    float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1794 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1792);
    float _1796 = precise::clamp(_1794, 0.0, 1.0);
    float _1798 = _1790 + _1788;
    float _1800 = -_1796;
    float _1802 = _1800 + 1.0;
    float _1804 = rsqrt(_1798);
    float _1806 = abs(_1802);
    float _1808 = log2(_1806);
    float _1810 = _1804 * _1772;
    float _1812 = _1804 * _1780;
    float _1814 = _1804 * _1776;
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1818 = -_1816;
    float _1820 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = -_1814;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1826 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = fma(_1824, 0.5, 0.5);
    float _1832 = _1812 + 1.0;
    float _1834 = exp2(_1826);
    float _1836 = fma(_1830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1838 = fma(_1830, _1836, -0.212114393711090087890625);
    float _1840 = sqrt(_1828);
    float _1842 = fma(_1830, _1838, 1.570728778839111328125);
    float _1844 = -_1812;
    float _1846 = fma(_1834, _1832, _1844);
    float _1848 = fma(_1846, 0.5, 0.5);
    float _1850 = _1840 * 0.636619746685028076171875;
    float _1852 = -_1842;
    float _1854 = fma(_1850, _1852, 1.0);
    float2 _5628 = float2(_1854, _1848);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5628, float2(0.0), isnan(_5628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5628, float2(0.0), isnan(_5628)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1868 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1882 = 1.0 / _1872;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1888 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1868);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1890;
    bool _1894 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1896 = isnan(_574);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1910 = 1.0 / _1876;
    bool _1912 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1914 = isnan(_574);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = -_1904;
    float _1926 = _1924 + 1.0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1936 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1888);
    float _1938 = 1.0 / _1880;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1940;
    bool _1944 = _834 != 0.0;
    bool _1946 = isnan(_834);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(0.0);
    bool _1952 = _1948 || _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1958 = -_668;
    float _1960 = _1958 + 1.0;
    out.m_75.x = _1339;
    out.m_75.y = _1337;
    out.m_75.z = _1341;
    bool _1962 = _832 == 0.0;
    bool _1964 = !_1952;
    bool _1966 = _1962 && _1964;
    float _1968 = 1.0 / _1886;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1970;
    float _1974 = _1892 * _1910;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _1980 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1982 = isnan(_574);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1988 = _1984 || _1986;
    float _1990 = float(_1988);
    float _1992 = _1972 * _1882;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1998 = _836 == 0.0;
    bool _2000 = _1998 && _1966;
    float _2002 = _1908 * _1938;
    float _2004 = _1990 * _1926;
    float _2006 = -_1990;
    float _2008 = _2006 + 1.0;
    float _2010 = 1.0 / _1996;
    bool _2012 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2014 = isnan(_574);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2028 = _1978 * _1968;
    bool _2030 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2032 = isnan(_574);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2038 = _2034 || _2036;
    float _2040 = float(_2038);
    float _2042 = -_2022;
    float _2044 = _2042 + 1.0;
    float _2046 = 1.0 / _1956;
    float _2048 = -_2040;
    float _2050 = _2048 + 1.0;
    float _2052 = _2040 * _2008;
    float _2054 = _2022 * _2050;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2058 = _574 + _2056;
    float _2060 = 1.0 / _2026;
    float _2062 = _1930 * _2010;
    bool _2064 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2066 = isnan(_574);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2072 = _2068 || _2070;
    float _2074 = float(_2072);
    float _2076 = _1922 * _2044;
    float _2078 = -_1922;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_1974, _2058, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2084 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2086 = isnan(_574);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2092 = _2088 || _2090;
    float _2094 = float(_2092);
    float _2096 = _2074 * _2080;
    float _2098 = -_2074;
    float _2100 = _2098 + 1.0;
    float _2102 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2104 = _574 + _2102;
    float _2106 = _1934 * _2046;
    float _2108 = exp2(_1866);
    float _2110 = _2094 * _2100;
    float _2112 = fma(_2002, _2104, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2116 = _574 + _2114;
    float _2118 = _1942 * _2060;
    float _2120 = _2082 * _2110;
    float _2122 = -_2094;
    float _2124 = _2122 + 1.0;
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2128 = _574 + _2126;
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2132 = _574 + _2130;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2120);
    float _2136 = fma(_2028, _2128, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2138 = fma(_1992, _2132, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2140 = fma(_2062, _2116, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2142 = fma(_2112, _2096, _2134);
    float _2144 = in.m_77.x;
    float _2146 = in.m_77.y;
    float _2148 = in.m_77.z;
    float _2150 = abs(_840);
    float _2152 = log2(_2150);
    float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2156 = _574 + _2154;
    float _2158 = fma(_2138, _2076, _2142);
    bool _2160 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2162 = isnan(_574);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2174 = _574 + _2172;
    float _2176 = fma(_2106, _2156, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2178 = fma(_2136, _2054, _2158);
    float _2180 = -_2108;
    float _2182 = _2180 + 1.0;
    float _2184 = -_2170;
    float _2186 = _2184 + 1.0;
    float _2188 = fma(_2118, _2174, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2190 = fma(_2140, _2052, _2178);
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2194 = _1904 * _2186;
    float _2196 = fma(_2176, _2004, _2190);
    float _2198 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2200 = fma(_2188, _2194, _2196);
    float _2202 = exp2(_2198);
    float _2204 = _2146;
    float _2206 = _2144;
    float _2208 = _2148;
    if (!_2000)
    {
        float _2210 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2204 = _2210;
    }
    float _2212 = _2204;
    if (!_2000)
    {
        float _2214 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2144);
        _2206 = _2214;
    }
    float _2216 = _2206;
    float _2218 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2200);
    float _2220 = _726 * _2212;
    float _2222 = _724 * _2212;
    float _2224 = _728 * _2212;
    if (!_2000)
    {
        float _2226 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2148);
        _2208 = _2226;
    }
    float _2228 = _2208;
    out.m_79.x = _2218;
    float _2230 = fma(_866, _2216, _2220);
    float _2232 = fma(_872, _2216, _2222);
    float _2234 = fma(_874, _2216, _2224);
    float _2236 = fma(_979, _2228, _2230);
    float _2238 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1936);
    float _2244 = fma(_2240, -2.0, 3.0);
    float _2246 = _2240 * _2240;
    float _2248 = fma(_1127, _2228, _2232);
    float _2250 = fma(_953, _2228, _2234);
    float _2252 = _2246 * _2244;
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1477;
    out.gl_Position.z = _2242;
    out.gl_Position.w = _1437;
    float _2254 = -_2252;
    float _2256 = _2254 + 1.0;
    out.m_81.x = _2236;
    out.m_81.y = _2248;
    out.m_81.z = _2250;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2252);
    bool _2260 = _840 <= 8000.0;
    bool _2262 = isnan(_840);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan(8000.0);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = _2242 + _1437;
    float _2274 = _2270 * _2258;
    float _2276 = _2272 * 0.5;
    float _2278 = _2272;
    float _2280 = _2274;
    if (!_1445)
    {
        _2278 = 1.0;
    }
    float _2282 = _2278;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2286 = _2282;
    if (_1445)
    {
        bool _2288 = _1543 >= _1533;
        bool _2290 = isnan(_1543);
        bool _2292 = _2288 || _2290;
        bool _2294 = isnan(_1533);
        bool _2296 = _2292 || _2294;
        float _2298 = float(_2296);
        _2286 = _2298;
    }
    float _2300 = _2286;
    out.m_83.z = _2276;
    out.m_83.w = _1437;
    bool _2302 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2304 = isnan(_1654);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2310 = _2306 || _2308;
    float _2312 = _1960 * _2284;
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = _2192 * _1545;
    float _2318 = _2300 * _1632;
    float _2320 = -_2192;
    float _2322 = _2320 + 1.0;
    float _2324 = -_2314;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2328 = _1556 * _2322;
    float _2330 = _1556 * _2316;
    float _2332 = -_2318;
    float _2334 = fma(_2332, _2326, 1.0);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2326;
    float _2340 = _2336;
    float _2342 = _2316;
    if (!_2310)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2344 = _1479;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2348 = _2344;
    float _2350 = _2344;
    if (!_2310)
    {
        _1519 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2352 = _1519;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2310)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2358 = _2338;
    out.m_85.x = _2346;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2310)
    {
        _2280 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2364 = _2280;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2310)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2370 = _2340;
    float _2372 = _1864 * _2316;
    float _2374 = fma(_1860, _2330, _1550);
    float _2376 = fma(_1862, _2330, _1552);
    float _2378 = _2370;
    float _2380 = _2370;
    if (!_2310)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2382 = _2342;
    float _2384 = fma(_1556, _2372, _1554);
    out.m_87.x = _2374;
    out.m_87.y = _2376;
    out.m_87.z = _2384;
    out.m_87.w = _2328;
    bool _2386 = !_2310;
    float _2388 = _2382;
    float _2390 = _2382;
    if (!_2386)
    {
        bool _2392 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2394 = isnan(_1654);
        bool _2396 = _2392 || _2394;
        bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2400 = _2396 || _2398;
        if (!_2400)
        {
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2404 = _1654 + _2402;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2406;
            float _2410 = 1.0 / _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2432 = _2404 * _2410;
            float _2434 = precise::clamp(_2432, 0.0, 1.0);
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2440 = fma(_2434, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2356 = _2442;
            _2368 = _2448;
            _2350 = _2440;
            _2390 = _2446;
            _2362 = _2444;
            _2380 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2456 = isnan(_1654);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2464 = _2348;
            _2350 = _2464;
            if (!_2462)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2466 = _2354;
            _2356 = _2466;
            if (!_2462)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2468 = _2360;
            _2362 = _2468;
            if (!_2462)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2470 = _2388;
            _2390 = _2470;
            if (!_2462)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2472 = _2366;
            _2368 = _2472;
            if (!_2462)
            {
                _2378 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2474 = _2378;
            bool _2476 = !_2462;
            _2380 = _2474;
            if (!_2476)
            {
                bool _2478 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1654);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1654 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = 1.0 / _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2518 = _2490 * _2496;
                    float _2520 = precise::clamp(_2518, 0.0, 1.0);
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2526 = fma(_2520, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2528 = fma(_2520, _2524, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2530 = fma(_2520, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2520, _2508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2534 = fma(_2520, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2536 = fma(_2520, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2356 = _2528;
                    _2368 = _2534;
                    _2350 = _2526;
                    _2390 = _2532;
                    _2362 = _2530;
                    _2380 = _2536;
                    _2452 = true;
                }
                else
                {
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2380 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2452 = false;
    float _2538 = _2356;
    float _2540 = _2368;
    float _2542 = _2350;
    float _2544 = _2390;
    float _2546 = _2362;
    float _2548 = _2380;
    float _2550 = fma(_2248, -0.5, 0.5);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -_2538;
    float _2556 = _2554 + _2540;
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    bool _2566 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2568 = fma(_2552, _2556, _2538);
    float _2570 = fma(_2552, _2560, _2542);
    float _2572 = fma(_2552, _2564, _2546);
    float _2574 = _2568 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2576 = fma(_2570, 0.298911988735198974609375, _2574);
    float _2578 = fma(_2572, 0.114477999508380889892578125, _2576);
    out.m_89.x = 0.0;
    float _2580 = -_2578;
    float _2582 = _2570 + _2580;
    float _2584 = -_2578;
    float _2586 = _2568 + _2584;
    float _2588 = -_2578;
    float _2590 = _2572 + _2588;
    float _2592 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    float _2596 = fma(_2586, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    float _2598 = fma(_2590, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    out.m_85.w = _2592;
    out.m_91.x = _2594;
    out.m_91.y = _2596;
    out.m_91.z = _2598;
    if (!_2566)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2600 = -_1337;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2604 = -_1339;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2608 = -_1341;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2612 = _2602 * _2602;
    float _2614 = fma(_2606, _2606, _2612);
    float _2616 = fma(_2610, _2610, _2614);
    float _2618 = sqrt(_2616);
    float _2620 = rsqrt(_2616);
    float _2622 = -_2618;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = _2606 * _2620;
    float _2632 = _2602 * _2620;
    float _2634 = abs(_2628);
    float _2636 = log2(_2634);
    float _2638 = _2610 * _2620;
    float _2640 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2642 = _2248 * _2632;
    float _2644 = -_2632;
    float _2646 = -_2640;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2646);
    float _2650 = fma(_2236, _2630, _2642);
    float _2652 = -_2638;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2648);
    float _2656 = fma(_2250, _2638, _2650);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2662 = _2654 + _2660;
    float _2664 = _2636 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2666 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = exp2(_2664);
    float _2672 = _2670 * _2668;
    float _2674 = _2658 * _2672;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2676;
    out.m_89.y = _2678;
    out.m_89.z = _2680;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2452 = false;
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
        float _2737 = as_type<float>(_126);
        out.gl_Position.z = _2737;
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
        float _2806 = as_type<float>(_162);
        out.gl_Position.z = _2806;
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
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _298 = _290 * _232;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _218 + _300;
    out.m_69.x = _252;
    out.m_69.y = _254;
    out.m_69.z = _286;
    float _304 = 1.0 / _260;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _218 + _306;
    float _310 = _302 * _242;
    bool _312 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _314 = isnan(_218);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = _282 * _256;
    bool _326 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_218);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _308 * _284;
    bool _340 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_218);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = _218 + _352;
    bool _356 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_218);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_322;
    float _370 = _368 + 1.0;
    float _372 = _350 * _294;
    float _374 = -_350;
    float _376 = _374 + 1.0;
    float _378 = -_366;
    float _380 = _378 + 1.0;
    float _382 = _366 * _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = _336 * _380;
    bool _394 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_218);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _406;
    float _410 = -_336;
    float _412 = _410 + 1.0;
    float _414 = fma(_386, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_390, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = _404 * _376;
    float _420 = _354 * _304;
    float _422 = fma(_408, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _424 = _278 * _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = _414 * _418;
    float _440 = -_404;
    float _442 = _440 + 1.0;
    float _444 = _416 * _418;
    float _446 = _422 * _418;
    float _448 = fma(_428, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = fma(_432, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_436, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _460 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _446);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _466 = fma(_456, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_448, _372, _458);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _470;
    float _474 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _476;
    float _480 = fma(_464, _324, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = fma(_466, _424, _468);
    float _488 = fma(_472, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_450, _372, _474);
    float _496 = fma(_452, _372, _460);
    float _498 = fma(_478, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_484, _324, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _502 = fma(_492, _324, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _504 = fma(_488, _424, _494);
    float _506 = fma(_498, _424, _496);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_480, _392, _486);
    float _522 = fma(_510, _420, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_514, _420, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _420, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_500, _392, _504);
    float _530 = fma(_502, _392, _506);
    float _532 = fma(_522, _382, _520);
    float _534 = fma(_524, _382, _528);
    float _536 = fma(_526, _382, _530);
    float _538 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_296;
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
    float2 _3690 = float2(_662, _666);
    float _668 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3690, float2(0.0), isnan(_3690)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3690, float2(0.0), isnan(_3690)), level(0.0)).x;
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
    float _716 = 1.0 / _712;
    float _718 = _542 * _602;
    float _720 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _722 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _724 = _186 * _696;
    float _726 = _184 * _696;
    float _728 = _188 * _696;
    float _730 = _720 + _712;
    float _732 = _724 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _734 = _682 + _722;
    float _736 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].y, _732);
    float _740 = _730 * _716;
    float _742 = _740 * 0.5;
    float _744 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[10].y, _738);
    float _746 = abs(_744);
    bool _748 = _746 > 0.99989998340606689453125;
    float _750 = _702;
    float _752 = _696;
    float _754 = _744;
    int _756 = 2;
    float _758 = _734;
    if (_748)
    {
        _750 = 0.001000000047497451305389404296875;
    }
    float _760 = _750;
    if (!_748)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _762 = _546;
    float _764 = _762;
    if (!_748)
    {
        _752 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _766 = _752;
    float _768 = _766;
    if (_748)
    {
        float _770 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _764 = _770;
    }
    float _772 = _764;
    if (!_748)
    {
        _754 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _774 = _754;
    float _776 = _774;
    if (_748)
    {
        float _778 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _768 = _778;
    }
    float _780 = _768;
    if (_748)
    {
        float _782 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _776 = _782;
    }
    float _784 = _776;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[30].w, _786);
    float _790 = -_772;
    float _792 = _728 * _790;
    float _794 = -_780;
    float _796 = _724 * _794;
    float _798 = fma(_706, _706, _700);
    float _800 = 1.0 / _788;
    float _802 = -_780;
    float _804 = -_792;
    float _806 = fma(_726, _802, _804);
    float _808 = -_784;
    float _810 = -_796;
    float _812 = fma(_728, _808, _810);
    float _814 = -_784;
    float _816 = _726 * _814;
    float _818 = _806 * _806;
    float _820 = -_772;
    float _822 = -_816;
    float _824 = fma(_724, _820, _822);
    float _826 = sqrt(_798);
    float _828 = fma(_812, _812, _818);
    float _830 = fma(_824, _824, _828);
    float _832 = in.m_73.x;
    float _834 = in.m_73.y;
    float _836 = in.m_73.z;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _840 = _800 * _838;
    float _842 = _734 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _844 = rsqrt(_830);
    bool _846 = _840 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _848 = _840 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _850 = _630 * _826;
    bool _852 = !_846;
    int _854 = _852 ? 0 : 1;
    float _856 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _858 = _736 * _850;
    float _860 = _634 * _850;
    float _862 = _856 * _850;
    if (!_846)
    {
        _756 = 1;
    }
    int _864 = _756;
    float _866 = _812 * _844;
    int _868 = _864;
    if (!_848)
    {
        _868 = _854;
    }
    int _870 = _868;
    float _872 = _806 * _844;
    float _874 = _824 * _844;
    float _876 = _734 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _878 = _870 << 6;
    float _880 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[126].x, _842);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
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
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _909 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[127].z, _884);
    float _911 = _858 * _882;
    float _913 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
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
    float _937 = _860 * _907;
    float _939 = _726 * _872;
    float _941 = _911 * _728;
    float _943 = trunc(_913);
    int _945 = int(_943);
    float _947 = _862 * _915;
    float _949 = _724 * _874;
    float _951 = -_939;
    float _953 = fma(_724, _866, _951);
    int _955 = _878 + 48;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    float _973 = _911 * _726;
    float _975 = fma(_937, _874, _941);
    float _977 = -_949;
    float _979 = fma(_728, _872, _977);
    float _981 = trunc(_917);
    int _983 = int(_981);
    float _985 = fma(_937, _866, _973);
    float _987 = fma(_947, _953, _975);
    int _989 = _878 + 64;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_947, _979, _985);
    float _1009 = _610 + _987;
    int _1011 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1013 = _945 + _1011;
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
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1043 = _1017 + _1041;
    float _1045 = _1021 * _1021;
    bool _1047 = _1015 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1049 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1051 = _983 + _1049;
    int _1053 = _1051 + 1;
    float _1055 = fma(_1043, _1043, _1045);
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
    bool _1077 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    bool _1087 = _1075 < 0;
    bool _1089 = _1087 || _1047;
    float _1091 = sqrt(_1055);
    int _1093 = _878 + 80;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    float _1111 = _734 * _903;
    bool _1113 = _1053 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1115 = _1113 || _1089;
    float _1117 = _911 * _724;
    float _1119 = _728 * _866;
    float _1121 = fma(_646, _895, _1111);
    float _1123 = fma(_937, _872, _1117);
    float _1125 = -_1119;
    float _1127 = fma(_726, _874, _1125);
    float _1129 = fma(_650, _927, _1121);
    float _1131 = fma(_947, _1127, _1123);
    float _1133 = _1129 + _935;
    bool _1135 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _734 * _971;
    int _1139 = as_type<int>(_937);
    int _1141 = _1053;
    int _1143 = _1015;
    float _1145 = _1017;
    float _1147 = _1009;
    float _1149 = _1055;
    float _1151 = _913;
    float _1153 = as_type<float>(_870);
    if (!_1115)
    {
        int _1155 = _1053 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1157 = _1155 + _1015;
        _1139 = _1157;
    }
    int _1159 = _1139;
    float _1161 = 1.0 / _1133;
    float _1163 = fma(_646, _963, _1137);
    float _1165 = as_type<float>(_1159);
    if (!_1115)
    {
        int _1167 = _1159 << 2;
        _1141 = _1167;
    }
    int _1169 = _1141;
    float _1171 = _734 * _1005;
    int _1173 = _1169;
    if (!_1115)
    {
        uint _1175 = uint(int(uint(_1159) >> uint(2)));
        _1143 = int(_1175);
    }
    int _1177 = _1143;
    float _1179 = _963;
    if (!_1115)
    {
        float _1181 = floor(_913);
        _1179 = _1181;
    }
    float _1183 = _1179;
    if (!_1115)
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
    if (!_1115)
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
        float _1221 = _1091 + _1219;
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
        float _1249 = fma(_1043, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].x);
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
    if (!_1085)
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
        float _1313 = 1.0 / _850;
        float _1315 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1289;
        float _1321 = -_606;
        float _1323 = _1321 + _1253;
        float _1325 = _1319 * _1313;
        float _1327 = _1315 * _1325;
        float _1329 = _1293 * _1325;
        float _1331 = fma(_1323, _1327, _682);
        float _1333 = fma(_1303, _1327, _646);
        float _1335 = fma(_1315, _1329, _650);
        _1275 = _1331;
        _1277 = _1333;
        _1279 = _1335;
        _1209 = _1295;
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
    float _1371 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1373 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1365);
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1377 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = _1259;
    if (!_1115)
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
    float _1397 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1399 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1371);
    float _1401 = _1207 * _1161;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1405 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1407 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1409 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1399);
    bool _1411 = _1401 >= 0.0;
    float _1413 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1405);
    float _1415 = _1273 * _1161;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1419 = _1401 <= 1.0;
    bool _1421 = _1419 && _1411;
    float _1423 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1413);
    float _1425 = _1343;
    if (!_1115)
    {
        float _1427 = floor(_917);
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1433 = _1415 >= 0.0;
    bool _1435 = _1433 && _1421;
    float _1437 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1423);
    float _1439 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1441 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1443 = _1415 <= 1.0;
    bool _1445 = _1443 && _1435;
    float _1447 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1431);
    float _1449 = 1.0 / _1437;
    float _1451 = -_1441;
    float _1453 = fma(_1451, _1439, 1.0);
    float _1455 = _734 * _1109;
    float _1457 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1459 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1447);
    float _1461 = _1439;
    float _1463 = _1447;
    if (!_1115)
    {
        float _1465 = -_1183;
        float _1467 = _913 + _1465;
        _1151 = _1467;
    }
    float _1469 = _1151;
    float _1471 = fma(_646, _1101, _1455);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1457);
    float _1475 = log2(_1453);
    float _1477 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1459);
    float _1479 = _1477;
    if (!_1115)
    {
        float _1481 = -_1429;
        float _1483 = _917 + _1481;
        _1461 = _1483;
    }
    float _1485 = _1461;
    if (_1445)
    {
        float _1487 = float(_870);
        _1153 = _1487;
    }
    float _1489 = _1153;
    float _1491 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1473);
    float _1493 = _1477 * _1449;
    float _1495 = _1455;
    if (_1445)
    {
        float _1497 = rint(_1489);
        float _1499 = precise::max(_1497, 0.0);
        uint _1501 = uint(_1499);
        uint _1503 = clamp(_1501, 0u, 65535u);
        _1495 = as_type<float>(_1503);
    }
    float _1505 = _1495;
    float _1507 = fma(_650, _1355, _1471);
    float _1509 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1491);
    float _1511 = fma(_1493, -0.5, 0.5);
    float _1513 = _1507 + _1363;
    float _1515 = _1475 * 0.693147182464599609375;
    float _1517 = _1493;
    float _1519 = _1509;
    if (!_1115)
    {
        float _1521 = rint(_1391);
        float _1523 = precise::max(_1521, 0.0);
        uint _1525 = uint(_1523);
        uint _1527 = clamp(_1525, 0u, 65535u);
        _1517 = as_type<float>(_1527);
    }
    float _1529 = _1517;
    float _1531 = _1509 * _1449;
    float _1533 = _1513 * _1161;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = fma(_1531, 0.5, 0.5);
    float _1539 = _1449;
    if (_1445)
    {
        float3 _5129 = float3(_1401, _1415, float(as_type<int>(_1505)));
        float3 _5133 = select(_5129, float3(0.0), isnan(_5129));
        float _1541 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5133.xy, uint(rint(_5133.z)), _1533, level(0.0));
        _1539 = _1541;
    }
    float _1543 = _1539;
    float3 _5143 = float3(_1537, _1511, _1535);
    float _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5143, float3(0.0), isnan(_5143)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5143, float3(0.0), isnan(_5143)), level(0.0)).x;
    float3 _5152 = float3(_1537, _1511, _1535);
    float4 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5152, float3(0.0), isnan(_5152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5152, float3(0.0), isnan(_5152)), level(0.0)).xyzw;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _1548.w;
    float _1558 = _1485;
    if (!_1115)
    {
        float3 _5175 = float3(_1469, _1485, float(as_type<int>(_1529)));
        float3 _5177 = select(_5175, float3(0.0), isnan(_5175));
        float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5177.xy, uint(rint(_5177.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5177.xy, uint(rint(_5177.z)), level(0.0)).x;
        _1558 = _1560;
    }
    float _1562 = _1558;
    if (_1115)
    {
        _1463 = 1.0;
    }
    float _1564 = _1463;
    float _1566 = _1564;
    if (!_1115)
    {
        int _1568 = _1159 << 4;
        int _1570 = _1568 + 2048;
        uint _1572 = uint(int(uint(_1570) >> uint(2)));
        uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
        int _1576 = int(_1572) & 3;
        float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
        int _1580 = int(_1572) + 1;
        uint _1582 = uint(int(uint(_1580) >> uint(2)));
        int _1584 = _1580 & 3;
        float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
        int _1588 = _1570 + 8;
        uint _1590 = uint(int(uint(_1588) >> uint(2)));
        uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
        int _1594 = int(_1590) & 3;
        float _1596 = (*spvDescriptorSet0.vp_c15)._m0[int(_1592)][_1594];
        int _1598 = int(_1590) + 1;
        uint _1600 = uint(int(uint(_1598) >> uint(2)));
        int _1602 = _1598 & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        float _1606 = _734 * _1586;
        float _1608 = fma(_646, _1578, _1606);
        float _1610 = fma(_650, _1596, _1608);
        float _1612 = _1610 + _1604;
        float _1614 = precise::clamp(_1612, 0.0, 1.0);
        float _1616 = -_1614;
        float _1618 = _1616 + _1562;
        float _1620 = fma(_1618, 500.0, 1.5);
        float _1622 = exp2(_1620);
        float _1624 = 0.0 + _1622;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        _758 = _1606;
        _1165 = as_type<float>(_1570);
        _1566 = _1626;
    }
    float _1628 = _758;
    float _1630 = _1165;
    float _1632 = _1566;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = _1337 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1640 = _1339 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1644 = _1341 + _1642;
    float _1646 = _1636 * _1636;
    float _1648 = fma(_1640, _1640, _1646);
    float _1650 = fma(_1644, _1644, _1648);
    float _1652 = rsqrt(_1650);
    float _1654 = sqrt(_1650);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1658 = _1640 * _1656;
    float _1660 = _1644 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 * _1660;
    float _1666 = _1662 + _1664;
    float _1668 = sqrt(_1666);
    bool _1670 = _1668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1668 + _1672;
    float _1676 = _1628;
    float _1678 = _1666;
    float _1680 = _1674;
    float _1682 = _1630;
    float _1684 = _1636;
    float _1686 = _1658;
    float _1688 = _1660;
    float _1690 = _1662;
    float _1692 = _1664;
    if (_1670)
    {
        float _1694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1694;
    }
    float _1696 = _1676;
    if (_1670)
    {
        float _1698 = rsqrt(_1666);
        _1678 = _1698;
    }
    float _1700 = _1678;
    if (_1670)
    {
        float _1702 = _1674 * _1696;
        _1680 = _1702;
    }
    float _1704 = _1680;
    if (_1670)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1682 = _1706;
    }
    float _1708 = _1682;
    float _1710 = _650;
    if (_1670)
    {
        float _1712 = _1708 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1720 = precise::max(0.0, _1718);
    float _1722 = _1696;
    float _1724 = _1720;
    if (_1670)
    {
        float _1726 = _1708 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = -_1656;
    float _1734 = -_1720;
    float _1736 = fma(_1636, _1732, _1734);
    if (_1670)
    {
        float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1738;
    }
    float _1740 = _1684;
    float _1742 = _1740;
    float _1744 = _1716;
    if (_1670)
    {
        float _1746 = fma(_1716, _1740, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1742 = _1746;
    }
    float _1748 = _1742;
    float _1750 = _1748;
    if (_1670)
    {
        float _1752 = _1730 + (-1.0);
        _1724 = _1752;
    }
    float _1754 = _1724;
    float _1756 = _1754;
    if (_1670)
    {
        float _1758 = _1700 * _1748;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (!_1670)
    {
        _1750 = _1736;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (_1670)
    {
        float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1766;
    }
    float _1768 = _1756;
    if (_1670)
    {
        float _1770 = _1658 * _1760;
        _1686 = _1770;
    }
    float _1772 = _1686;
    if (_1670)
    {
        float _1774 = _1660 * _1760;
        _1688 = _1774;
    }
    float _1776 = _1688;
    if (_1670)
    {
        float _1778 = fma(_1736, _1730, _1768);
        _1764 = _1778;
    }
    float _1780 = _1764;
    if (_1670)
    {
        float _1782 = _1772 * _1772;
        _1690 = _1782;
    }
    float _1784 = _1690;
    if (_1670)
    {
        float _1786 = _1776 * _1776;
        _1692 = _1786;
    }
    float _1788 = _1692;
    float _1790 = fma(_1780, _1780, _1784);
    float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1794 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1792);
    float _1796 = precise::clamp(_1794, 0.0, 1.0);
    float _1798 = _1790 + _1788;
    float _1800 = -_1796;
    float _1802 = _1800 + 1.0;
    float _1804 = rsqrt(_1798);
    float _1806 = abs(_1802);
    float _1808 = log2(_1806);
    float _1810 = _1804 * _1772;
    float _1812 = _1804 * _1780;
    float _1814 = _1804 * _1776;
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1818 = -_1816;
    float _1820 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = -_1814;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1826 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = fma(_1824, 0.5, 0.5);
    float _1832 = _1812 + 1.0;
    float _1834 = exp2(_1826);
    float _1836 = fma(_1830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1838 = fma(_1830, _1836, -0.212114393711090087890625);
    float _1840 = sqrt(_1828);
    float _1842 = fma(_1830, _1838, 1.570728778839111328125);
    float _1844 = -_1812;
    float _1846 = fma(_1834, _1832, _1844);
    float _1848 = fma(_1846, 0.5, 0.5);
    float _1850 = _1840 * 0.636619746685028076171875;
    float _1852 = -_1842;
    float _1854 = fma(_1850, _1852, 1.0);
    float2 _5628 = float2(_1854, _1848);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5628, float2(0.0), isnan(_5628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5628, float2(0.0), isnan(_5628)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1868 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1882 = 1.0 / _1872;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1888 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1868);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1890;
    bool _1894 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1896 = isnan(_574);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1910 = 1.0 / _1876;
    bool _1912 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1914 = isnan(_574);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = -_1904;
    float _1926 = _1924 + 1.0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1936 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1888);
    float _1938 = 1.0 / _1880;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1940;
    bool _1944 = _834 != 0.0;
    bool _1946 = isnan(_834);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(0.0);
    bool _1952 = _1948 || _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1958 = -_668;
    float _1960 = _1958 + 1.0;
    out.m_75.x = _1339;
    out.m_75.y = _1337;
    out.m_75.z = _1341;
    bool _1962 = _832 == 0.0;
    bool _1964 = !_1952;
    bool _1966 = _1962 && _1964;
    float _1968 = 1.0 / _1886;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1970;
    float _1974 = _1892 * _1910;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _1980 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1982 = isnan(_574);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1988 = _1984 || _1986;
    float _1990 = float(_1988);
    float _1992 = _1972 * _1882;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1998 = _836 == 0.0;
    bool _2000 = _1998 && _1966;
    float _2002 = _1908 * _1938;
    float _2004 = _1990 * _1926;
    float _2006 = -_1990;
    float _2008 = _2006 + 1.0;
    float _2010 = 1.0 / _1996;
    bool _2012 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2014 = isnan(_574);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2028 = _1978 * _1968;
    bool _2030 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2032 = isnan(_574);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2038 = _2034 || _2036;
    float _2040 = float(_2038);
    float _2042 = -_2022;
    float _2044 = _2042 + 1.0;
    float _2046 = 1.0 / _1956;
    float _2048 = -_2040;
    float _2050 = _2048 + 1.0;
    float _2052 = _2040 * _2008;
    float _2054 = _2022 * _2050;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2058 = _574 + _2056;
    float _2060 = 1.0 / _2026;
    float _2062 = _1930 * _2010;
    bool _2064 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2066 = isnan(_574);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2072 = _2068 || _2070;
    float _2074 = float(_2072);
    float _2076 = _1922 * _2044;
    float _2078 = -_1922;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_1974, _2058, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2084 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2086 = isnan(_574);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2092 = _2088 || _2090;
    float _2094 = float(_2092);
    float _2096 = _2074 * _2080;
    float _2098 = -_2074;
    float _2100 = _2098 + 1.0;
    float _2102 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2104 = _574 + _2102;
    float _2106 = _1934 * _2046;
    float _2108 = exp2(_1866);
    float _2110 = _2094 * _2100;
    float _2112 = fma(_2002, _2104, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2116 = _574 + _2114;
    float _2118 = _1942 * _2060;
    float _2120 = _2082 * _2110;
    float _2122 = -_2094;
    float _2124 = _2122 + 1.0;
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2128 = _574 + _2126;
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2132 = _574 + _2130;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2120);
    float _2136 = fma(_2028, _2128, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2138 = fma(_1992, _2132, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2140 = fma(_2062, _2116, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2142 = fma(_2112, _2096, _2134);
    float _2144 = in.m_77.x;
    float _2146 = in.m_77.y;
    float _2148 = in.m_77.z;
    float _2150 = abs(_840);
    float _2152 = log2(_2150);
    float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2156 = _574 + _2154;
    float _2158 = fma(_2138, _2076, _2142);
    bool _2160 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2162 = isnan(_574);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2174 = _574 + _2172;
    float _2176 = fma(_2106, _2156, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2178 = fma(_2136, _2054, _2158);
    float _2180 = -_2108;
    float _2182 = _2180 + 1.0;
    float _2184 = -_2170;
    float _2186 = _2184 + 1.0;
    float _2188 = fma(_2118, _2174, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2190 = fma(_2140, _2052, _2178);
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2194 = _1904 * _2186;
    float _2196 = fma(_2176, _2004, _2190);
    float _2198 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2200 = fma(_2188, _2194, _2196);
    float _2202 = exp2(_2198);
    float _2204 = _2146;
    float _2206 = _2144;
    float _2208 = _2148;
    if (!_2000)
    {
        float _2210 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2204 = _2210;
    }
    float _2212 = _2204;
    if (!_2000)
    {
        float _2214 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2144);
        _2206 = _2214;
    }
    float _2216 = _2206;
    float _2218 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2200);
    float _2220 = _726 * _2212;
    float _2222 = _724 * _2212;
    float _2224 = _728 * _2212;
    if (!_2000)
    {
        float _2226 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2148);
        _2208 = _2226;
    }
    float _2228 = _2208;
    out.m_79.x = _2218;
    float _2230 = fma(_866, _2216, _2220);
    float _2232 = fma(_872, _2216, _2222);
    float _2234 = fma(_874, _2216, _2224);
    float _2236 = fma(_979, _2228, _2230);
    float _2238 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1936);
    float _2244 = fma(_2240, -2.0, 3.0);
    float _2246 = _2240 * _2240;
    float _2248 = fma(_1127, _2228, _2232);
    float _2250 = fma(_953, _2228, _2234);
    float _2252 = _2246 * _2244;
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1477;
    out.gl_Position.z = _2242;
    out.gl_Position.w = _1437;
    float _2254 = -_2252;
    float _2256 = _2254 + 1.0;
    out.m_81.x = _2236;
    out.m_81.y = _2248;
    out.m_81.z = _2250;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2252);
    bool _2260 = _840 <= 8000.0;
    bool _2262 = isnan(_840);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan(8000.0);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = _2242 + _1437;
    float _2274 = _2270 * _2258;
    float _2276 = _2272 * 0.5;
    float _2278 = _2272;
    float _2280 = _2274;
    if (!_1445)
    {
        _2278 = 1.0;
    }
    float _2282 = _2278;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2286 = _2282;
    if (_1445)
    {
        bool _2288 = _1543 >= _1533;
        bool _2290 = isnan(_1543);
        bool _2292 = _2288 || _2290;
        bool _2294 = isnan(_1533);
        bool _2296 = _2292 || _2294;
        float _2298 = float(_2296);
        _2286 = _2298;
    }
    float _2300 = _2286;
    out.m_83.z = _2276;
    out.m_83.w = _1437;
    bool _2302 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2304 = isnan(_1654);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2310 = _2306 || _2308;
    float _2312 = _1960 * _2284;
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = _2192 * _1545;
    float _2318 = _2300 * _1632;
    float _2320 = -_2192;
    float _2322 = _2320 + 1.0;
    float _2324 = -_2314;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2328 = _1556 * _2322;
    float _2330 = _1556 * _2316;
    float _2332 = -_2318;
    float _2334 = fma(_2332, _2326, 1.0);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2326;
    float _2340 = _2336;
    float _2342 = _2316;
    if (!_2310)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2344 = _1479;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2348 = _2344;
    float _2350 = _2344;
    if (!_2310)
    {
        _1519 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2352 = _1519;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2310)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2358 = _2338;
    out.m_85.x = _2346;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2310)
    {
        _2280 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2364 = _2280;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2310)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2370 = _2340;
    float _2372 = _1864 * _2316;
    float _2374 = fma(_1860, _2330, _1550);
    float _2376 = fma(_1862, _2330, _1552);
    float _2378 = _2370;
    float _2380 = _2370;
    if (!_2310)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2382 = _2342;
    float _2384 = fma(_1556, _2372, _1554);
    out.m_87.x = _2374;
    out.m_87.y = _2376;
    out.m_87.z = _2384;
    out.m_87.w = _2328;
    bool _2386 = !_2310;
    float _2388 = _2382;
    float _2390 = _2382;
    if (!_2386)
    {
        bool _2392 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2394 = isnan(_1654);
        bool _2396 = _2392 || _2394;
        bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2400 = _2396 || _2398;
        if (!_2400)
        {
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2404 = _1654 + _2402;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2406;
            float _2410 = 1.0 / _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2432 = _2404 * _2410;
            float _2434 = precise::clamp(_2432, 0.0, 1.0);
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2440 = fma(_2434, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2356 = _2442;
            _2368 = _2448;
            _2350 = _2440;
            _2390 = _2446;
            _2362 = _2444;
            _2380 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2456 = isnan(_1654);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2464 = _2348;
            _2350 = _2464;
            if (!_2462)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2466 = _2354;
            _2356 = _2466;
            if (!_2462)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2468 = _2360;
            _2362 = _2468;
            if (!_2462)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2470 = _2388;
            _2390 = _2470;
            if (!_2462)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2472 = _2366;
            _2368 = _2472;
            if (!_2462)
            {
                _2378 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2474 = _2378;
            bool _2476 = !_2462;
            _2380 = _2474;
            if (!_2476)
            {
                bool _2478 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1654);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1654 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = 1.0 / _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2518 = _2490 * _2496;
                    float _2520 = precise::clamp(_2518, 0.0, 1.0);
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2526 = fma(_2520, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2528 = fma(_2520, _2524, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2530 = fma(_2520, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2520, _2508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2534 = fma(_2520, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2536 = fma(_2520, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2356 = _2528;
                    _2368 = _2534;
                    _2350 = _2526;
                    _2390 = _2532;
                    _2362 = _2530;
                    _2380 = _2536;
                    _2452 = true;
                }
                else
                {
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2380 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2452 = false;
    float _2538 = _2356;
    float _2540 = _2368;
    float _2542 = _2350;
    float _2544 = _2390;
    float _2546 = _2362;
    float _2548 = _2380;
    float _2550 = fma(_2248, -0.5, 0.5);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -_2538;
    float _2556 = _2554 + _2540;
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    bool _2566 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2568 = fma(_2552, _2556, _2538);
    float _2570 = fma(_2552, _2560, _2542);
    float _2572 = fma(_2552, _2564, _2546);
    float _2574 = _2568 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2576 = fma(_2570, 0.298911988735198974609375, _2574);
    float _2578 = fma(_2572, 0.114477999508380889892578125, _2576);
    out.m_89.x = 0.0;
    float _2580 = -_2578;
    float _2582 = _2570 + _2580;
    float _2584 = -_2578;
    float _2586 = _2568 + _2584;
    float _2588 = -_2578;
    float _2590 = _2572 + _2588;
    float _2592 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    float _2596 = fma(_2586, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    float _2598 = fma(_2590, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    out.m_85.w = _2592;
    out.m_91.x = _2594;
    out.m_91.y = _2596;
    out.m_91.z = _2598;
    if (!_2566)
    {
        return out;
    }
    float _2600 = -_1337;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2604 = -_1339;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2608 = -_1341;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2612 = _2602 * _2602;
    float _2614 = fma(_2606, _2606, _2612);
    float _2616 = fma(_2610, _2610, _2614);
    float _2618 = sqrt(_2616);
    float _2620 = rsqrt(_2616);
    float _2622 = -_2618;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = _2606 * _2620;
    float _2632 = _2602 * _2620;
    float _2634 = abs(_2628);
    float _2636 = log2(_2634);
    float _2638 = _2610 * _2620;
    float _2640 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2642 = _2248 * _2632;
    float _2644 = -_2632;
    float _2646 = -_2640;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2646);
    float _2650 = fma(_2236, _2630, _2642);
    float _2652 = -_2638;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2648);
    float _2656 = fma(_2250, _2638, _2650);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2662 = _2654 + _2660;
    float _2664 = _2636 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2666 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = exp2(_2664);
    float _2672 = _2670 * _2668;
    float _2674 = _2658 * _2672;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2676;
    out.m_89.y = _2678;
    out.m_89.z = _2680;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2452 = false;
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
        float _2737 = as_type<float>(_126);
        out.gl_Position.z = _2737;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2806 = as_type<float>(_162);
        out.gl_Position.z = _2806;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _298 = _290 * _232;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _218 + _300;
    out.m_69.x = _252;
    out.m_69.y = _254;
    out.m_69.z = _286;
    float _304 = 1.0 / _260;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _218 + _306;
    float _310 = _302 * _242;
    bool _312 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _314 = isnan(_218);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = _282 * _256;
    bool _326 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _328 = isnan(_218);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _308 * _284;
    bool _340 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _342 = isnan(_218);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _354 = _218 + _352;
    bool _356 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _358 = isnan(_218);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_322;
    float _370 = _368 + 1.0;
    float _372 = _350 * _294;
    float _374 = -_350;
    float _376 = _374 + 1.0;
    float _378 = -_366;
    float _380 = _378 + 1.0;
    float _382 = _366 * _370;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = _336 * _380;
    bool _394 = _218 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_218);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _406;
    float _410 = -_336;
    float _412 = _410 + 1.0;
    float _414 = fma(_386, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _416 = fma(_390, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _418 = _404 * _376;
    float _420 = _354 * _304;
    float _422 = fma(_408, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _424 = _278 * _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = _414 * _418;
    float _440 = -_404;
    float _442 = _440 + 1.0;
    float _444 = _416 * _418;
    float _446 = _422 * _418;
    float _448 = fma(_428, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = fma(_432, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_436, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _454;
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _460 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].z, _446);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _466 = fma(_456, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_448, _372, _458);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _470;
    float _474 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _476;
    float _480 = fma(_464, _324, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _486 = fma(_466, _424, _468);
    float _488 = fma(_472, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _494 = fma(_450, _372, _474);
    float _496 = fma(_452, _372, _460);
    float _498 = fma(_478, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _500 = fma(_484, _324, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _502 = fma(_492, _324, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _504 = fma(_488, _424, _494);
    float _506 = fma(_498, _424, _496);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _516;
    float _520 = fma(_480, _392, _486);
    float _522 = fma(_510, _420, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _524 = fma(_514, _420, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _526 = fma(_518, _420, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _528 = fma(_500, _392, _504);
    float _530 = fma(_502, _392, _506);
    float _532 = fma(_522, _382, _520);
    float _534 = fma(_524, _382, _528);
    float _536 = fma(_526, _382, _530);
    float _538 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].x, _532);
    float _540 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].y, _534);
    float _542 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[148].z, _536);
    bool _544 = !_296;
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
    float2 _3690 = float2(_662, _666);
    float _668 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3690, float2(0.0), isnan(_3690)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3690, float2(0.0), isnan(_3690)), level(0.0)).x;
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
    float _716 = 1.0 / _712;
    float _718 = _542 * _602;
    float _720 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _722 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _724 = _186 * _696;
    float _726 = _184 * _696;
    float _728 = _188 * _696;
    float _730 = _720 + _712;
    float _732 = _724 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _734 = _682 + _722;
    float _736 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _738 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].y, _732);
    float _740 = _730 * _716;
    float _742 = _740 * 0.5;
    float _744 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[10].y, _738);
    float _746 = abs(_744);
    bool _748 = _746 > 0.99989998340606689453125;
    float _750 = _702;
    float _752 = _696;
    float _754 = _744;
    int _756 = 2;
    float _758 = _734;
    if (_748)
    {
        _750 = 0.001000000047497451305389404296875;
    }
    float _760 = _750;
    if (!_748)
    {
        _546 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _762 = _546;
    float _764 = _762;
    if (!_748)
    {
        _752 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _766 = _752;
    float _768 = _766;
    if (_748)
    {
        float _770 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _764 = _770;
    }
    float _772 = _764;
    if (!_748)
    {
        _754 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _774 = _754;
    float _776 = _774;
    if (_748)
    {
        float _778 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _768 = _778;
    }
    float _780 = _768;
    if (_748)
    {
        float _782 = fma(_760, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _776 = _782;
    }
    float _784 = _776;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _788 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[30].w, _786);
    float _790 = -_772;
    float _792 = _728 * _790;
    float _794 = -_780;
    float _796 = _724 * _794;
    float _798 = fma(_706, _706, _700);
    float _800 = 1.0 / _788;
    float _802 = -_780;
    float _804 = -_792;
    float _806 = fma(_726, _802, _804);
    float _808 = -_784;
    float _810 = -_796;
    float _812 = fma(_728, _808, _810);
    float _814 = -_784;
    float _816 = _726 * _814;
    float _818 = _806 * _806;
    float _820 = -_772;
    float _822 = -_816;
    float _824 = fma(_724, _820, _822);
    float _826 = sqrt(_798);
    float _828 = fma(_812, _812, _818);
    float _830 = fma(_824, _824, _828);
    float _832 = in.m_73.x;
    float _834 = in.m_73.y;
    float _836 = in.m_73.z;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _840 = _800 * _838;
    float _842 = _734 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _844 = rsqrt(_830);
    bool _846 = _840 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _848 = _840 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _850 = _630 * _826;
    bool _852 = !_846;
    int _854 = _852 ? 0 : 1;
    float _856 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _858 = _736 * _850;
    float _860 = _634 * _850;
    float _862 = _856 * _850;
    if (!_846)
    {
        _756 = 1;
    }
    int _864 = _756;
    float _866 = _812 * _844;
    int _868 = _864;
    if (!_848)
    {
        _868 = _854;
    }
    int _870 = _868;
    float _872 = _806 * _844;
    float _874 = _824 * _844;
    float _876 = _734 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _878 = _870 << 6;
    float _880 = fma(_646, (*spvDescriptorSet0.vp_c15)._m0[126].x, _842);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _834);
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
    float _907 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _832);
    float _909 = fma(_650, (*spvDescriptorSet0.vp_c15)._m0[127].z, _884);
    float _911 = _858 * _882;
    float _913 = _905 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
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
    float _937 = _860 * _907;
    float _939 = _726 * _872;
    float _941 = _911 * _728;
    float _943 = trunc(_913);
    int _945 = int(_943);
    float _947 = _862 * _915;
    float _949 = _724 * _874;
    float _951 = -_939;
    float _953 = fma(_724, _866, _951);
    int _955 = _878 + 48;
    uint _957 = uint(int(uint(_955) >> uint(2)));
    uint _959 = uint(int(uint(int(_957)) >> uint(2)));
    int _961 = int(_957) & 3;
    float _963 = (*spvDescriptorSet0.vp_c15)._m0[int(_959)][_961];
    int _965 = int(_957) + 1;
    uint _967 = uint(int(uint(_965) >> uint(2)));
    int _969 = _965 & 3;
    float _971 = (*spvDescriptorSet0.vp_c15)._m0[int(_967)][_969];
    float _973 = _911 * _726;
    float _975 = fma(_937, _874, _941);
    float _977 = -_949;
    float _979 = fma(_728, _872, _977);
    float _981 = trunc(_917);
    int _983 = int(_981);
    float _985 = fma(_937, _866, _973);
    float _987 = fma(_947, _953, _975);
    int _989 = _878 + 64;
    uint _991 = uint(int(uint(_989) >> uint(2)));
    uint _993 = uint(int(uint(int(_991)) >> uint(2)));
    int _995 = int(_991) & 3;
    float _997 = (*spvDescriptorSet0.vp_c15)._m0[int(_993)][_995];
    int _999 = int(_991) + 1;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    int _1003 = _999 & 3;
    float _1005 = (*spvDescriptorSet0.vp_c15)._m0[int(_1001)][_1003];
    float _1007 = fma(_947, _979, _985);
    float _1009 = _610 + _987;
    int _1011 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1013 = _945 + _1011;
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
    float _1041 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1043 = _1017 + _1041;
    float _1045 = _1021 * _1021;
    bool _1047 = _1015 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1049 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1051 = _983 + _1049;
    int _1053 = _1051 + 1;
    float _1055 = fma(_1043, _1043, _1045);
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
    bool _1077 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.5);
    bool _1085 = _1081 || _1083;
    bool _1087 = _1075 < 0;
    bool _1089 = _1087 || _1047;
    float _1091 = sqrt(_1055);
    int _1093 = _878 + 80;
    uint _1095 = uint(int(uint(_1093) >> uint(2)));
    uint _1097 = uint(int(uint(int(_1095)) >> uint(2)));
    int _1099 = int(_1095) & 3;
    float _1101 = (*spvDescriptorSet0.vp_c15)._m0[int(_1097)][_1099];
    int _1103 = int(_1095) + 1;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    int _1107 = _1103 & 3;
    float _1109 = (*spvDescriptorSet0.vp_c15)._m0[int(_1105)][_1107];
    float _1111 = _734 * _903;
    bool _1113 = _1053 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1115 = _1113 || _1089;
    float _1117 = _911 * _724;
    float _1119 = _728 * _866;
    float _1121 = fma(_646, _895, _1111);
    float _1123 = fma(_937, _872, _1117);
    float _1125 = -_1119;
    float _1127 = fma(_726, _874, _1125);
    float _1129 = fma(_650, _927, _1121);
    float _1131 = fma(_947, _1127, _1123);
    float _1133 = _1129 + _935;
    bool _1135 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1137 = _734 * _971;
    int _1139 = as_type<int>(_937);
    int _1141 = _1053;
    int _1143 = _1015;
    float _1145 = _1017;
    float _1147 = _1009;
    float _1149 = _1055;
    float _1151 = _913;
    float _1153 = as_type<float>(_870);
    if (!_1115)
    {
        int _1155 = _1053 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1157 = _1155 + _1015;
        _1139 = _1157;
    }
    int _1159 = _1139;
    float _1161 = 1.0 / _1133;
    float _1163 = fma(_646, _963, _1137);
    float _1165 = as_type<float>(_1159);
    if (!_1115)
    {
        int _1167 = _1159 << 2;
        _1141 = _1167;
    }
    int _1169 = _1141;
    float _1171 = _734 * _1005;
    int _1173 = _1169;
    if (!_1115)
    {
        uint _1175 = uint(int(uint(_1159) >> uint(2)));
        _1143 = int(_1175);
    }
    int _1177 = _1143;
    float _1179 = _963;
    if (!_1115)
    {
        float _1181 = floor(_913);
        _1179 = _1181;
    }
    float _1183 = _1179;
    if (!_1115)
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
    if (!_1115)
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
        float _1221 = _1091 + _1219;
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
        float _1249 = fma(_1043, _1245, (*spvDescriptorSet0.vp_c15)._m0[0].x);
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
    if (!_1085)
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
        float _1313 = 1.0 / _850;
        float _1315 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1289;
        float _1321 = -_606;
        float _1323 = _1321 + _1253;
        float _1325 = _1319 * _1313;
        float _1327 = _1315 * _1325;
        float _1329 = _1293 * _1325;
        float _1331 = fma(_1323, _1327, _682);
        float _1333 = fma(_1303, _1327, _646);
        float _1335 = fma(_1315, _1329, _650);
        _1275 = _1331;
        _1277 = _1333;
        _1279 = _1335;
        _1209 = _1295;
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
    float _1371 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1373 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1365);
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1367);
    float _1377 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1369);
    float _1379 = _1259;
    if (!_1115)
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
    float _1397 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1399 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1371);
    float _1401 = _1207 * _1161;
    float _1403 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1405 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1407 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1409 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1399);
    bool _1411 = _1401 >= 0.0;
    float _1413 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1405);
    float _1415 = _1273 * _1161;
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1419 = _1401 <= 1.0;
    bool _1421 = _1419 && _1411;
    float _1423 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1413);
    float _1425 = _1343;
    if (!_1115)
    {
        float _1427 = floor(_917);
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1433 = _1415 >= 0.0;
    bool _1435 = _1433 && _1421;
    float _1437 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1423);
    float _1439 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1441 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _1443 = _1415 <= 1.0;
    bool _1445 = _1443 && _1435;
    float _1447 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1431);
    float _1449 = 1.0 / _1437;
    float _1451 = -_1441;
    float _1453 = fma(_1451, _1439, 1.0);
    float _1455 = _734 * _1109;
    float _1457 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1459 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1447);
    float _1461 = _1439;
    float _1463 = _1447;
    if (!_1115)
    {
        float _1465 = -_1183;
        float _1467 = _913 + _1465;
        _1151 = _1467;
    }
    float _1469 = _1151;
    float _1471 = fma(_646, _1101, _1455);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1457);
    float _1475 = log2(_1453);
    float _1477 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1459);
    float _1479 = _1477;
    if (!_1115)
    {
        float _1481 = -_1429;
        float _1483 = _917 + _1481;
        _1461 = _1483;
    }
    float _1485 = _1461;
    if (_1445)
    {
        float _1487 = float(_870);
        _1153 = _1487;
    }
    float _1489 = _1153;
    float _1491 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1473);
    float _1493 = _1477 * _1449;
    float _1495 = _1455;
    if (_1445)
    {
        float _1497 = rint(_1489);
        float _1499 = precise::max(_1497, 0.0);
        uint _1501 = uint(_1499);
        uint _1503 = clamp(_1501, 0u, 65535u);
        _1495 = as_type<float>(_1503);
    }
    float _1505 = _1495;
    float _1507 = fma(_650, _1355, _1471);
    float _1509 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1491);
    float _1511 = fma(_1493, -0.5, 0.5);
    float _1513 = _1507 + _1363;
    float _1515 = _1475 * 0.693147182464599609375;
    float _1517 = _1493;
    float _1519 = _1509;
    if (!_1115)
    {
        float _1521 = rint(_1391);
        float _1523 = precise::max(_1521, 0.0);
        uint _1525 = uint(_1523);
        uint _1527 = clamp(_1525, 0u, 65535u);
        _1517 = as_type<float>(_1527);
    }
    float _1529 = _1517;
    float _1531 = _1509 * _1449;
    float _1533 = _1513 * _1161;
    float _1535 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1537 = fma(_1531, 0.5, 0.5);
    float _1539 = _1449;
    if (_1445)
    {
        float3 _5129 = float3(_1401, _1415, float(as_type<int>(_1505)));
        float3 _5133 = select(_5129, float3(0.0), isnan(_5129));
        float _1541 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5133.xy, uint(rint(_5133.z)), _1533, level(0.0));
        _1539 = _1541;
    }
    float _1543 = _1539;
    float3 _5143 = float3(_1537, _1511, _1535);
    float _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5143, float3(0.0), isnan(_5143)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5143, float3(0.0), isnan(_5143)), level(0.0)).x;
    float3 _5152 = float3(_1537, _1511, _1535);
    float4 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5152, float3(0.0), isnan(_5152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5152, float3(0.0), isnan(_5152)), level(0.0)).xyzw;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _1548.w;
    float _1558 = _1485;
    if (!_1115)
    {
        float3 _5175 = float3(_1469, _1485, float(as_type<int>(_1529)));
        float3 _5177 = select(_5175, float3(0.0), isnan(_5175));
        float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5177.xy, uint(rint(_5177.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5177.xy, uint(rint(_5177.z)), level(0.0)).x;
        _1558 = _1560;
    }
    float _1562 = _1558;
    if (_1115)
    {
        _1463 = 1.0;
    }
    float _1564 = _1463;
    float _1566 = _1564;
    if (!_1115)
    {
        int _1568 = _1159 << 4;
        int _1570 = _1568 + 2048;
        uint _1572 = uint(int(uint(_1570) >> uint(2)));
        uint _1574 = uint(int(uint(int(_1572)) >> uint(2)));
        int _1576 = int(_1572) & 3;
        float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
        int _1580 = int(_1572) + 1;
        uint _1582 = uint(int(uint(_1580) >> uint(2)));
        int _1584 = _1580 & 3;
        float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
        int _1588 = _1570 + 8;
        uint _1590 = uint(int(uint(_1588) >> uint(2)));
        uint _1592 = uint(int(uint(int(_1590)) >> uint(2)));
        int _1594 = int(_1590) & 3;
        float _1596 = (*spvDescriptorSet0.vp_c15)._m0[int(_1592)][_1594];
        int _1598 = int(_1590) + 1;
        uint _1600 = uint(int(uint(_1598) >> uint(2)));
        int _1602 = _1598 & 3;
        float _1604 = (*spvDescriptorSet0.vp_c15)._m0[int(_1600)][_1602];
        float _1606 = _734 * _1586;
        float _1608 = fma(_646, _1578, _1606);
        float _1610 = fma(_650, _1596, _1608);
        float _1612 = _1610 + _1604;
        float _1614 = precise::clamp(_1612, 0.0, 1.0);
        float _1616 = -_1614;
        float _1618 = _1616 + _1562;
        float _1620 = fma(_1618, 500.0, 1.5);
        float _1622 = exp2(_1620);
        float _1624 = 0.0 + _1622;
        float _1626 = precise::clamp(_1624, 0.0, 1.0);
        _758 = _1606;
        _1165 = as_type<float>(_1570);
        _1566 = _1626;
    }
    float _1628 = _758;
    float _1630 = _1165;
    float _1632 = _1566;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1636 = _1337 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1640 = _1339 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1644 = _1341 + _1642;
    float _1646 = _1636 * _1636;
    float _1648 = fma(_1640, _1640, _1646);
    float _1650 = fma(_1644, _1644, _1648);
    float _1652 = rsqrt(_1650);
    float _1654 = sqrt(_1650);
    float _1656 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1658 = _1640 * _1656;
    float _1660 = _1644 * _1656;
    float _1662 = _1658 * _1658;
    float _1664 = _1660 * _1660;
    float _1666 = _1662 + _1664;
    float _1668 = sqrt(_1666);
    bool _1670 = _1668 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1674 = _1668 + _1672;
    float _1676 = _1628;
    float _1678 = _1666;
    float _1680 = _1674;
    float _1682 = _1630;
    float _1684 = _1636;
    float _1686 = _1658;
    float _1688 = _1660;
    float _1690 = _1662;
    float _1692 = _1664;
    if (_1670)
    {
        float _1694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1694;
    }
    float _1696 = _1676;
    if (_1670)
    {
        float _1698 = rsqrt(_1666);
        _1678 = _1698;
    }
    float _1700 = _1678;
    if (_1670)
    {
        float _1702 = _1674 * _1696;
        _1680 = _1702;
    }
    float _1704 = _1680;
    if (_1670)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1682 = _1706;
    }
    float _1708 = _1682;
    float _1710 = _650;
    if (_1670)
    {
        float _1712 = _1708 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1720 = precise::max(0.0, _1718);
    float _1722 = _1696;
    float _1724 = _1720;
    if (_1670)
    {
        float _1726 = _1708 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = -_1656;
    float _1734 = -_1720;
    float _1736 = fma(_1636, _1732, _1734);
    if (_1670)
    {
        float _1738 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1738;
    }
    float _1740 = _1684;
    float _1742 = _1740;
    float _1744 = _1716;
    if (_1670)
    {
        float _1746 = fma(_1716, _1740, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1742 = _1746;
    }
    float _1748 = _1742;
    float _1750 = _1748;
    if (_1670)
    {
        float _1752 = _1730 + (-1.0);
        _1724 = _1752;
    }
    float _1754 = _1724;
    float _1756 = _1754;
    if (_1670)
    {
        float _1758 = _1700 * _1748;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (!_1670)
    {
        _1750 = _1736;
    }
    float _1762 = _1750;
    float _1764 = _1762;
    if (_1670)
    {
        float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1766;
    }
    float _1768 = _1756;
    if (_1670)
    {
        float _1770 = _1658 * _1760;
        _1686 = _1770;
    }
    float _1772 = _1686;
    if (_1670)
    {
        float _1774 = _1660 * _1760;
        _1688 = _1774;
    }
    float _1776 = _1688;
    if (_1670)
    {
        float _1778 = fma(_1736, _1730, _1768);
        _1764 = _1778;
    }
    float _1780 = _1764;
    if (_1670)
    {
        float _1782 = _1772 * _1772;
        _1690 = _1782;
    }
    float _1784 = _1690;
    if (_1670)
    {
        float _1786 = _1776 * _1776;
        _1692 = _1786;
    }
    float _1788 = _1692;
    float _1790 = fma(_1780, _1780, _1784);
    float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1794 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1792);
    float _1796 = precise::clamp(_1794, 0.0, 1.0);
    float _1798 = _1790 + _1788;
    float _1800 = -_1796;
    float _1802 = _1800 + 1.0;
    float _1804 = rsqrt(_1798);
    float _1806 = abs(_1802);
    float _1808 = log2(_1806);
    float _1810 = _1804 * _1772;
    float _1812 = _1804 * _1780;
    float _1814 = _1804 * _1776;
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1818 = -_1816;
    float _1820 = fma(_1812, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1818);
    float _1822 = -_1814;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1820);
    float _1826 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = fma(_1824, 0.5, 0.5);
    float _1832 = _1812 + 1.0;
    float _1834 = exp2(_1826);
    float _1836 = fma(_1830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1838 = fma(_1830, _1836, -0.212114393711090087890625);
    float _1840 = sqrt(_1828);
    float _1842 = fma(_1830, _1838, 1.570728778839111328125);
    float _1844 = -_1812;
    float _1846 = fma(_1834, _1832, _1844);
    float _1848 = fma(_1846, 0.5, 0.5);
    float _1850 = _1840 * 0.636619746685028076171875;
    float _1852 = -_1842;
    float _1854 = fma(_1850, _1852, 1.0);
    float2 _5628 = float2(_1854, _1848);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5628, float2(0.0), isnan(_5628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5628, float2(0.0), isnan(_5628)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1868 = _1397 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1880 = _1878 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1882 = 1.0 / _1872;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1888 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1868);
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1890;
    bool _1894 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1896 = isnan(_574);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1910 = 1.0 / _1876;
    bool _1912 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1914 = isnan(_574);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = -_1904;
    float _1926 = _1924 + 1.0;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1928;
    float _1932 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1934 = _1932 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1936 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1888);
    float _1938 = 1.0 / _1880;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1940;
    bool _1944 = _834 != 0.0;
    bool _1946 = isnan(_834);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(0.0);
    bool _1952 = _1948 || _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1958 = -_668;
    float _1960 = _1958 + 1.0;
    out.m_75.x = _1339;
    out.m_75.y = _1337;
    out.m_75.z = _1341;
    bool _1962 = _832 == 0.0;
    bool _1964 = !_1952;
    bool _1966 = _1962 && _1964;
    float _1968 = 1.0 / _1886;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1970;
    float _1974 = _1892 * _1910;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _1980 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1982 = isnan(_574);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1988 = _1984 || _1986;
    float _1990 = float(_1988);
    float _1992 = _1972 * _1882;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1998 = _836 == 0.0;
    bool _2000 = _1998 && _1966;
    float _2002 = _1908 * _1938;
    float _2004 = _1990 * _1926;
    float _2006 = -_1990;
    float _2008 = _2006 + 1.0;
    float _2010 = 1.0 / _1996;
    bool _2012 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2014 = isnan(_574);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2020 = _2016 || _2018;
    float _2022 = float(_2020);
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2028 = _1978 * _1968;
    bool _2030 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2032 = isnan(_574);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2038 = _2034 || _2036;
    float _2040 = float(_2038);
    float _2042 = -_2022;
    float _2044 = _2042 + 1.0;
    float _2046 = 1.0 / _1956;
    float _2048 = -_2040;
    float _2050 = _2048 + 1.0;
    float _2052 = _2040 * _2008;
    float _2054 = _2022 * _2050;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2058 = _574 + _2056;
    float _2060 = 1.0 / _2026;
    float _2062 = _1930 * _2010;
    bool _2064 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2066 = isnan(_574);
    bool _2068 = _2064 || _2066;
    bool _2070 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2072 = _2068 || _2070;
    float _2074 = float(_2072);
    float _2076 = _1922 * _2044;
    float _2078 = -_1922;
    float _2080 = _2078 + 1.0;
    float _2082 = fma(_1974, _2058, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2084 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2086 = isnan(_574);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2092 = _2088 || _2090;
    float _2094 = float(_2092);
    float _2096 = _2074 * _2080;
    float _2098 = -_2074;
    float _2100 = _2098 + 1.0;
    float _2102 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2104 = _574 + _2102;
    float _2106 = _1934 * _2046;
    float _2108 = exp2(_1866);
    float _2110 = _2094 * _2100;
    float _2112 = fma(_2002, _2104, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2116 = _574 + _2114;
    float _2118 = _1942 * _2060;
    float _2120 = _2082 * _2110;
    float _2122 = -_2094;
    float _2124 = _2122 + 1.0;
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2128 = _574 + _2126;
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2132 = _574 + _2130;
    float _2134 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2120);
    float _2136 = fma(_2028, _2128, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2138 = fma(_1992, _2132, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2140 = fma(_2062, _2116, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2142 = fma(_2112, _2096, _2134);
    float _2144 = in.m_77.x;
    float _2146 = in.m_77.y;
    float _2148 = in.m_77.z;
    float _2150 = abs(_840);
    float _2152 = log2(_2150);
    float _2154 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2156 = _574 + _2154;
    float _2158 = fma(_2138, _2076, _2142);
    bool _2160 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2162 = isnan(_574);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2174 = _574 + _2172;
    float _2176 = fma(_2106, _2156, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2178 = fma(_2136, _2054, _2158);
    float _2180 = -_2108;
    float _2182 = _2180 + 1.0;
    float _2184 = -_2170;
    float _2186 = _2184 + 1.0;
    float _2188 = fma(_2118, _2174, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2190 = fma(_2140, _2052, _2178);
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2194 = _1904 * _2186;
    float _2196 = fma(_2176, _2004, _2190);
    float _2198 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2200 = fma(_2188, _2194, _2196);
    float _2202 = exp2(_2198);
    float _2204 = _2146;
    float _2206 = _2144;
    float _2208 = _2148;
    if (!_2000)
    {
        float _2210 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2146);
        _2204 = _2210;
    }
    float _2212 = _2204;
    if (!_2000)
    {
        float _2214 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2144);
        _2206 = _2214;
    }
    float _2216 = _2206;
    float _2218 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2200);
    float _2220 = _726 * _2212;
    float _2222 = _724 * _2212;
    float _2224 = _728 * _2212;
    if (!_2000)
    {
        float _2226 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2148);
        _2208 = _2226;
    }
    float _2228 = _2208;
    out.m_79.x = _2218;
    float _2230 = fma(_866, _2216, _2220);
    float _2232 = fma(_872, _2216, _2222);
    float _2234 = fma(_874, _2216, _2224);
    float _2236 = fma(_979, _2228, _2230);
    float _2238 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1936);
    float _2244 = fma(_2240, -2.0, 3.0);
    float _2246 = _2240 * _2240;
    float _2248 = fma(_1127, _2228, _2232);
    float _2250 = fma(_953, _2228, _2234);
    float _2252 = _2246 * _2244;
    out.gl_Position.x = _1509;
    out.gl_Position.y = _1477;
    out.gl_Position.z = _2242;
    out.gl_Position.w = _1437;
    float _2254 = -_2252;
    float _2256 = _2254 + 1.0;
    out.m_81.x = _2236;
    out.m_81.y = _2248;
    out.m_81.z = _2250;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2252);
    bool _2260 = _840 <= 8000.0;
    bool _2262 = isnan(_840);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan(8000.0);
    bool _2268 = _2264 || _2266;
    float _2270 = float(_2268);
    float _2272 = _2242 + _1437;
    float _2274 = _2270 * _2258;
    float _2276 = _2272 * 0.5;
    float _2278 = _2272;
    float _2280 = _2274;
    if (!_1445)
    {
        _2278 = 1.0;
    }
    float _2282 = _2278;
    float _2284 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2286 = _2282;
    if (_1445)
    {
        bool _2288 = _1543 >= _1533;
        bool _2290 = isnan(_1543);
        bool _2292 = _2288 || _2290;
        bool _2294 = isnan(_1533);
        bool _2296 = _2292 || _2294;
        float _2298 = float(_2296);
        _2286 = _2298;
    }
    float _2300 = _2286;
    out.m_83.z = _2276;
    out.m_83.w = _1437;
    bool _2302 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2304 = isnan(_1654);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2310 = _2306 || _2308;
    float _2312 = _1960 * _2284;
    float _2314 = precise::clamp(_2312, 0.0, 1.0);
    float _2316 = _2192 * _1545;
    float _2318 = _2300 * _1632;
    float _2320 = -_2192;
    float _2322 = _2320 + 1.0;
    float _2324 = -_2314;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2328 = _1556 * _2322;
    float _2330 = _1556 * _2316;
    float _2332 = -_2318;
    float _2334 = fma(_2332, _2326, 1.0);
    float _2336 = precise::clamp(_2334, 0.0, 1.0);
    float _2338 = _2326;
    float _2340 = _2336;
    float _2342 = _2316;
    if (!_2310)
    {
        _1479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2344 = _1479;
    float _2346 = _2336 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2348 = _2344;
    float _2350 = _2344;
    if (!_2310)
    {
        _1519 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2352 = _1519;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2310)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2358 = _2338;
    out.m_85.x = _2346;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2310)
    {
        _2280 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2364 = _2280;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2310)
    {
        _2340 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2370 = _2340;
    float _2372 = _1864 * _2316;
    float _2374 = fma(_1860, _2330, _1550);
    float _2376 = fma(_1862, _2330, _1552);
    float _2378 = _2370;
    float _2380 = _2370;
    if (!_2310)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2382 = _2342;
    float _2384 = fma(_1556, _2372, _1554);
    out.m_87.x = _2374;
    out.m_87.y = _2376;
    out.m_87.z = _2384;
    out.m_87.w = _2328;
    bool _2386 = !_2310;
    float _2388 = _2382;
    float _2390 = _2382;
    if (!_2386)
    {
        bool _2392 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2394 = isnan(_1654);
        bool _2396 = _2392 || _2394;
        bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2400 = _2396 || _2398;
        if (!_2400)
        {
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2404 = _1654 + _2402;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2406;
            float _2410 = 1.0 / _2408;
            float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2414 = _2412 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2432 = _2404 * _2410;
            float _2434 = precise::clamp(_2432, 0.0, 1.0);
            float _2436 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2438 = _2436 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2440 = fma(_2434, _2414, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2442 = fma(_2434, _2438, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2444 = fma(_2434, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2446 = fma(_2434, _2422, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2448 = fma(_2434, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2450 = fma(_2434, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2356 = _2442;
            _2368 = _2448;
            _2350 = _2440;
            _2390 = _2446;
            _2362 = _2444;
            _2380 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2456 = isnan(_1654);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2464 = _2348;
            _2350 = _2464;
            if (!_2462)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2466 = _2354;
            _2356 = _2466;
            if (!_2462)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2468 = _2360;
            _2362 = _2468;
            if (!_2462)
            {
                _2388 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2470 = _2388;
            _2390 = _2470;
            if (!_2462)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2472 = _2366;
            _2368 = _2472;
            if (!_2462)
            {
                _2378 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2474 = _2378;
            bool _2476 = !_2462;
            _2380 = _2474;
            if (!_2476)
            {
                bool _2478 = _1654 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2480 = isnan(_1654);
                bool _2482 = _2478 || _2480;
                bool _2484 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2486 = _2482 || _2484;
                if (!_2486)
                {
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2490 = _1654 + _2488;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2492;
                    float _2496 = 1.0 / _2494;
                    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2518 = _2490 * _2496;
                    float _2520 = precise::clamp(_2518, 0.0, 1.0);
                    float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2526 = fma(_2520, _2500, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2528 = fma(_2520, _2524, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2530 = fma(_2520, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2532 = fma(_2520, _2508, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2534 = fma(_2520, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2536 = fma(_2520, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2356 = _2528;
                    _2368 = _2534;
                    _2350 = _2526;
                    _2390 = _2532;
                    _2362 = _2530;
                    _2380 = _2536;
                    _2452 = true;
                }
                else
                {
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2390 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2380 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2452 = false;
    float _2538 = _2356;
    float _2540 = _2368;
    float _2542 = _2350;
    float _2544 = _2390;
    float _2546 = _2362;
    float _2548 = _2380;
    float _2550 = fma(_2248, -0.5, 0.5);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -_2538;
    float _2556 = _2554 + _2540;
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    bool _2566 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2568 = fma(_2552, _2556, _2538);
    float _2570 = fma(_2552, _2560, _2542);
    float _2572 = fma(_2552, _2564, _2546);
    float _2574 = _2568 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _2576 = fma(_2570, 0.298911988735198974609375, _2574);
    float _2578 = fma(_2572, 0.114477999508380889892578125, _2576);
    out.m_89.x = 0.0;
    float _2580 = -_2578;
    float _2582 = _2570 + _2580;
    float _2584 = -_2578;
    float _2586 = _2568 + _2584;
    float _2588 = -_2578;
    float _2590 = _2572 + _2588;
    float _2592 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2594 = fma(_2582, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    float _2596 = fma(_2586, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    float _2598 = fma(_2590, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2578);
    out.m_85.w = _2592;
    out.m_91.x = _2594;
    out.m_91.y = _2596;
    out.m_91.z = _2598;
    if (!_2566)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2600 = -_1337;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2604 = -_1339;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2608 = -_1341;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2612 = _2602 * _2602;
    float _2614 = fma(_2606, _2606, _2612);
    float _2616 = fma(_2610, _2610, _2614);
    float _2618 = sqrt(_2616);
    float _2620 = rsqrt(_2616);
    float _2622 = -_2618;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2628 = precise::clamp(_2626, 0.0, 1.0);
    float _2630 = _2606 * _2620;
    float _2632 = _2602 * _2620;
    float _2634 = abs(_2628);
    float _2636 = log2(_2634);
    float _2638 = _2610 * _2620;
    float _2640 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2642 = _2248 * _2632;
    float _2644 = -_2632;
    float _2646 = -_2640;
    float _2648 = fma(_2644, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2646);
    float _2650 = fma(_2236, _2630, _2642);
    float _2652 = -_2638;
    float _2654 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2648);
    float _2656 = fma(_2250, _2638, _2650);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2662 = _2654 + _2660;
    float _2664 = _2636 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2666 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2668 = precise::clamp(_2666, 0.0, 1.0);
    float _2670 = exp2(_2664);
    float _2672 = _2670 * _2668;
    float _2674 = _2658 * _2672;
    float _2676 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2678 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2680 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2676;
    out.m_89.y = _2678;
    out.m_89.z = _2680;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

