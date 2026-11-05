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
    float4 m_75 [[user(locn0)]];
    float4 m_61 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2010 = false;
    bool _808 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_58.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_61.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_124);
        out.gl_Position.z = _2309;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_63.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_61.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_160);
        out.gl_Position.z = _2378;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_65.w;
    float _164 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_63.x;
    float _178 = in.m_63.y;
    float _180 = in.m_63.z;
    float _182 = in.m_58.x;
    float _184 = in.m_58.y;
    float _186 = in.m_58.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_67.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_108);
        float _308 = 1.0 / _306;
        float _310 = _142 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = in.m_65.x;
    float _316 = in.m_65.y;
    float _318 = in.m_65.z;
    float _320 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _324 = in.m_67.x;
    float _326 = in.m_67.y;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _330 = _328 != 0;
    float _332 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _336 = _334 != 0;
    float _338 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = in.m_69.x;
    float _342 = in.m_69.y;
    float _344 = in.m_69.z;
    bool _346 = _278 > 0.0;
    float _348 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    bool _350 = _278 >= 0.0;
    bool _352 = isnan(_278);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = in.m_71.y;
    float _362 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _366 = _358 ? 0 : 1;
    float _368 = 0.0;
    if (_330)
    {
        float _370 = in.m_67.x;
        _368 = _370;
    }
    float _372 = _368;
    float _374 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    int _376 = ~_366;
    int _378 = _376 + 1;
    int _380 = _378 + 1;
    float _382 = in.m_71.x;
    int _384 = _380;
    if (!_346)
    {
        int _386 = ~_366;
        int _388 = _386 + 1;
        _384 = _388;
    }
    int _390 = _384;
    float _392 = _314 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = _316 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = _318 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _400 = _326 > 0.5;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _340);
    float _408 = -_402;
    float _410 = fma(_398, 2.0, _408);
    float _412 = _340 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _414 = float(_390);
    float _416 = -_360;
    float _418 = _416 + 1.0;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _422 = _326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _426 = _414 * _396;
    float _428 = _360;
    float _430 = _412;
    if (_336)
    {
        float _432 = _400 ? _418 : _360;
        _428 = _432;
    }
    float _434 = _428;
    float _436 = _414 * _394;
    float _438 = _414 * _392;
    float _440 = fma(_422, -2.0, _420);
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _448 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _450 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _404);
    float _452 = _444 * _424;
    float _454 = _446 * _442;
    float _456 = _448 * _406;
    float _458 = _452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _460 = _452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _332);
    float _468 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _362);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _458);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[10].x, _460);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _476 = _466 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _478 = _468 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _480 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _470);
    float _482 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _472);
    float _484 = 1.0 / _464;
    float _486 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _474);
    float _488 = _476 + _480;
    float _490 = _478 + _482;
    float _492 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _494 = _372 > 0.5;
    bool _496 = _494 && _330;
    float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _500 = _488 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _504 = _490 + _502;
    float _506 = _482;
    float _508 = _382;
    if (!_330)
    {
        _506 = _382;
    }
    float _510 = _506;
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _514 = _500 * _500;
    float _516 = _504 * _504;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _312 + _518;
    float _522 = _342 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    float _528 = _514 + _516;
    float _530 = _510;
    float _532 = _514;
    float _534 = _516;
    if (_496)
    {
        float _536 = -_382;
        float _538 = _536 + 1.0;
        _508 = _538;
    }
    float _540 = _508;
    float _542 = _526 * _484;
    float _544 = fma(_492, _434, -0.5);
    bool _546 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = isnan(_312);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = sqrt(_528);
    bool _560 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_312);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_330)
    {
        _530 = _540;
    }
    float _574 = _530;
    float _576 = -_556;
    float _578 = _576 + 1.0;
    float _580 = fma(_542, _520, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[9].x, _572);
    float _584 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _450);
    float _586 = _570 * _578;
    float _588 = -_570;
    float _590 = _588 + 1.0;
    float _592 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[9].z, _582);
    float _594 = -_142;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[76].x, _410);
    float _598 = _580 * _586;
    float _600 = _374 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _602 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _440);
    float _604 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _486);
    bool _606 = _558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _608 = _522 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _610 = _522 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _612 = _522 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _614 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[115].x, _598);
    float _616 = _600 + _592;
    float _618 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _620 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _608);
    float _622 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _610);
    float _624 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _612);
    float _626 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _628 = fma(_618, _574, -0.5);
    float _630 = _608;
    float _632 = _610;
    if (!_606)
    {
        _430 = _514;
    }
    float _634 = _430;
    float _636 = _634;
    if (!_606)
    {
        _630 = _488;
    }
    float _638 = _630;
    float _640 = _638;
    if (!_606)
    {
        _632 = _490;
    }
    float _642 = _632;
    float _644 = _642;
    if (!_606)
    {
        _532 = _616;
    }
    float _646 = _532;
    bool _648 = !_606;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _558 + _654;
        float _658 = rsqrt(_528);
        float _660 = _656 * _652;
        float _662 = _616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _664 = _660 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = sin(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = cos(_670);
        float _674 = fma(_668, _662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _676 = _658 * _674;
        float _678 = _672 + (-1.0);
        float _680 = fma(_500, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _682 = fma(_504, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _688 = _680 + _686;
        float _690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _692 = _682 + _690;
        float _694 = fma(_616, _672, _684);
        float _696 = _688 * _688;
        float _698 = _692 * _692;
        _650 = _694;
        _636 = _696;
        _534 = _698;
        _640 = _680;
        _644 = _682;
    }
    float _700 = _650;
    float _702 = _636;
    float _704 = _534;
    float _706 = _640;
    float _708 = _644;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _712 = _700 + _710;
    float _714 = -_602;
    float _716 = fma(_604, _544, _714);
    float _718 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[116].x, _614);
    float _720 = fma(_712, _712, _702);
    float _722 = fma(_584, _628, _596);
    float _724 = _720 + _704;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = 0.0 + _414;
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = sqrt(_724);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[8].z, _620);
    float _740 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].z, _622);
    float _742 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _716 + 0.5;
    float _750 = _732 + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _756 = _722 + 0.5;
    float _758 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[10].z, _624);
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    out.m_73.w = _752;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _768 = _764 || _766;
    out.m_75.x = _742;
    out.m_75.y = _744;
    out.m_75.z = _746;
    out.m_75.w = _754;
    out.m_77.x = _756;
    out.m_77.y = _748;
    out.m_79.x = _738;
    out.m_79.y = _740;
    out.m_79.z = _758;
    float _770 = _724;
    float _772 = _756;
    if (!_768)
    {
        _770 = 1.0;
    }
    float _774 = _770;
    bool _776 = !_768;
    float _778 = _774;
    if (!_776)
    {
        bool _780 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _782 = isnan(_734);
        bool _784 = _780 || _782;
        bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _788 = _784 || _786;
        if (!_788)
        {
            float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _792 = _734 + _790;
            float _794 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _796 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _794;
            float _798 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _800 = _798 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _802 = 1.0 / _796;
            float _804 = _792 * _802;
            float _806 = fma(_804, _800, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _778 = _806;
            _808 = true;
        }
        else
        {
            bool _810 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _812 = isnan(_734);
            bool _814 = _810 || _812;
            bool _816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _818 = _814 || _816;
            if (!_818)
            {
                float _820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _822 = _734 + _820;
                float _824 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _826 = _824 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _828 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _830 = _828 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _832 = 1.0 / _826;
                float _834 = _822 * _832;
                float _836 = fma(_834, _830, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _778 = _836;
                _808 = true;
            }
            else
            {
                _778 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _808 = false;
    float _838 = _778;
    float _840 = _600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _842 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _844 = _700 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _848 = _706 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _852 = _708 + _850;
    float _854 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[11].x, _840);
    float _856 = fma(_844, _838, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _858 = fma(_848, _838, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _860 = fma(_852, _838, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _862 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[11].z, _854);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _866 = _856 + _864;
    float _868 = _600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _872 = _858 + _870;
    float _874 = _862 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _876 = _866 * _866;
    float _878 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[10].x, _868);
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _882 = _860 + _880;
    float _884 = 1.0 / _874;
    float _886 = fma(_872, _872, _876);
    float _888 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[10].z, _878);
    float _890 = _856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _892 = fma(_882, _882, _886);
    float _894 = _888 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _896 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _890);
    float _898 = rsqrt(_892);
    float _900 = _894 + _874;
    float _902 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _904 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].z, _896);
    float _906 = _600 + _902;
    float _908 = _900 * _884;
    float _910 = _908 * 0.5;
    float _912 = sqrt(_892);
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _916 = _906 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _918);
    float _922 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _924 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[127].x, _916);
    float _926 = _898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _928 = 1.0 / _920;
    float _930 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[127].z, _924);
    float _932 = _872 * _926;
    float _934 = _882 * _926;
    float _936 = _930 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _938 = _932 * _932;
    float _940 = _934 * _934;
    float _942 = trunc(_936);
    int _944 = int(_942);
    float _946 = _938 + _940;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _950 = _928 * _948;
    float _952 = sqrt(_946);
    float _954 = _906 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _956 = _950 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _958 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[126].x, _954);
    bool _960 = _950 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _962 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _964 = _944 + _962;
    int _966 = _964 + 1;
    float _968 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[126].z, _958);
    float _970 = floor(_922);
    float _972 = _968 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _974 = !_956;
    int _976 = _974 ? 0 : 1;
    bool _978 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = _952 + _980;
    int _984 = 2;
    float _986 = _982;
    float _988 = _932;
    float _990 = _934;
    float _992 = _938;
    float _994 = _940;
    if (!_956)
    {
        _984 = 1;
    }
    int _996 = _984;
    float _998 = trunc(_972);
    int _1000 = int(_998);
    int _1002 = _996;
    if (!_960)
    {
        _1002 = _976;
    }
    int _1004 = _1002;
    int _1006 = _1004 << 6;
    float _1008 = -_970;
    float _1010 = _922 + _1008;
    int _1012 = _1006 + 96;
    uint _1015 = uint(int(uint(_1012) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    float _1031 = _734;
    float _1033 = as_type<float>(_1004);
    if (_978)
    {
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1035;
    }
    float _1037 = _1031;
    int _1039 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1041 = _1000 + _1039;
    int _1043 = _1041 + 1;
    int _1045 = _1006 + 104;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
    int _1051 = int(_1047) & 3;
    float _1053 = (*spvDescriptorSet0.vp_c15)._m0[int(_1049)][_1051];
    int _1055 = int(_1047) + 1;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    int _1059 = _1055 & 3;
    float _1061 = (*spvDescriptorSet0.vp_c15)._m0[int(_1057)][_1059];
    float _1063 = _856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1065 = _1043 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1067 = _1043 | _966;
    float _1069 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    int _1071 = _1043;
    if (_978)
    {
        float _1073 = _982 * _1037;
        _986 = _1073;
    }
    float _1075 = _986;
    bool _1077 = _1067 < 0;
    bool _1079 = _1077 || _1065;
    float _1081 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1069);
    if (_978)
    {
        float _1083 = _1075 * 0.15915493667125701904296875;
        _772 = _1083;
    }
    float _1085 = _772;
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1089 = _966 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1091 = _1089 || _1079;
    float _1093 = _722;
    if (_978)
    {
        float _1095 = _1085 * 6.283185482025146484375;
        float _1097 = sin(_1095);
        _1093 = _1097;
    }
    float _1099 = _1093;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1103 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = precise::max(0.0, _1101);
    float _1107 = _1037;
    if (_978)
    {
        float _1109 = _1085 * 6.283185482025146484375;
        float _1111 = cos(_1109);
        _1107 = _1111;
    }
    float _1113 = _1107;
    float _1115 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1117 = -_926;
    float _1119 = -_1105;
    float _1121 = fma(_866, _1117, _1119);
    float _1123 = -_1103;
    float _1125 = fma(_1123, _1115, 1.0);
    float _1127 = _1115;
    float _1129 = _1121;
    if (!_1091)
    {
        int _1131 = _966 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1133 = _1131 + _1043;
        _1071 = _1133;
    }
    int _1135 = _1071;
    float _1137 = _1081;
    if (_978)
    {
        float _1139 = rsqrt(_946);
        _1137 = _1139;
    }
    float _1141 = _1137;
    if (_978)
    {
        float _1143 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1127 = _1143;
    }
    float _1145 = _1127;
    int _1147 = _1006 + 56;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = 0;
    float _1167 = _1145;
    if (!_1091)
    {
        int _1169 = _1135 << 2;
        _1165 = _1169;
    }
    int _1171 = _1165;
    int _1173 = _1171;
    if (_978)
    {
        float _1175 = fma(_1099, _1145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1167 = _1175;
    }
    float _1177 = _1167;
    int _1179 = 0;
    if (!_1091)
    {
        uint _1181 = uint(int(uint(_1135) >> uint(2)));
        _1179 = int(_1181);
    }
    int _1183 = _1179;
    float _1185 = _906 * _1029;
    float _1187 = _1029;
    if (_978)
    {
        float _1189 = _1113 + (-1.0);
        _1187 = _1189;
    }
    float _1191 = _1187;
    float _1193 = _1191;
    if (!_1091)
    {
        int _1195 = 12 & _1171;
        _1173 = _1195;
    }
    int _1197 = _1173;
    float _1199 = log2(_1125);
    float _1201 = fma(_476, _1021, _1185);
    if (_978)
    {
        float _1203 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1203;
    }
    float _1205 = _1193;
    float _1207 = fma(_478, _1053, _1201);
    float _1209 = _1141;
    if (_978)
    {
        float _1211 = _1141 * _1177;
        _1209 = _1211;
    }
    float _1213 = _1209;
    if (_978)
    {
        float _1215 = fma(_1121, _1113, _1205);
        _1129 = _1215;
    }
    float _1217 = _1129;
    int _1219 = _1006 + 48;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    uint _1223 = uint(int(uint(int(_1221)) >> uint(2)));
    int _1225 = int(_1221) & 3;
    float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
    int _1229 = int(_1221) + 1;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    int _1233 = _1229 & 3;
    float _1235 = (*spvDescriptorSet0.vp_c15)._m0[int(_1231)][_1233];
    if (_978)
    {
        float _1237 = _932 * _1213;
        _988 = _1237;
    }
    float _1239 = _988;
    if (_978)
    {
        float _1241 = _934 * _1213;
        _990 = _1241;
    }
    float _1243 = _990;
    float _1245 = _856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1249 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1247);
    float _1251 = precise::clamp(_1249, 0.0, 1.0);
    if (_978)
    {
        float _1253 = _1239 * _1239;
        _992 = _1253;
    }
    float _1255 = _992;
    float _1257 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1259 = _1006 + 64;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    uint _1263 = uint(int(uint(int(_1261)) >> uint(2)));
    int _1265 = int(_1261) & 3;
    float _1267 = (*spvDescriptorSet0.vp_c15)._m0[int(_1263)][_1265];
    int _1269 = int(_1261) + 1;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    int _1273 = _1269 & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    if (_978)
    {
        float _1277 = _1243 * _1243;
        _994 = _1277;
    }
    float _1279 = _994;
    float _1281 = fma(_1217, _1217, _1255);
    float _1283 = _856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1285 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1245);
    float _1287 = -_1251;
    float _1289 = _1287 + 1.0;
    float _1291 = _1281 + _1279;
    float _1293 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1283);
    int _1295 = _1006 + 72;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    float _1313 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1315 = _1207 + _1061;
    float _1317 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1293);
    float _1319 = rsqrt(_1291);
    float _1321 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1323 = _1199 * 0.693147182464599609375;
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1327 = _1006 + 80;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.vp_c15)._m0[int(_1339)][_1341];
    float _1345 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1347 = 1.0 / _1315;
    float _1349 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1345);
    int _1351 = _1006 + 88;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    uint _1355 = uint(int(uint(int(_1353)) >> uint(2)));
    int _1357 = int(_1353) & 3;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[int(_1355)][_1357];
    int _1361 = int(_1353) + 1;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    int _1365 = _1361 & 3;
    float _1367 = (*spvDescriptorSet0.vp_c15)._m0[int(_1363)][_1365];
    float _1369 = _1345;
    if (!_1091)
    {
        int _1371 = _1183 << 4;
        int _1373 = _1371 + _1197;
        _1369 = as_type<float>(_1373);
    }
    float _1375 = _1369;
    float _1377 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1349);
    float _1379 = _1319 * _1239;
    float _1381 = _1319 * _1217;
    float _1383 = _1319 * _1243;
    float _1385 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1377);
    float _1387 = _1375;
    float _1389 = _1379;
    if (!_1091)
    {
        int _1391 = as_type<int>(_1375) + 400;
        uint _1393 = uint(int(uint(_1391) >> uint(2)));
        uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
        int _1397 = int(_1393) & 3;
        float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
        _1387 = _1399;
    }
    float _1401 = _1387;
    float _1403 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1405 = abs(_1289);
    float _1407 = log2(_1405);
    float _1409 = _906 * _1235;
    float _1411 = floor(_1257);
    float _1413 = fma(_476, _1227, _1409);
    float _1415 = _906 * _1275;
    float _1417 = fma(_478, _1155, _1413);
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1421 = 1.0 / _1385;
    float _1423 = fma(_476, _1267, _1415);
    float _1425 = _1417 + _1163;
    float _1427 = -_1403;
    float _1429 = fma(_1381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = fma(_478, _1303, _1423);
    float _1433 = _1425 * _1347;
    float _1435 = -_1383;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1439 = _1163;
    if (!_1091)
    {
        float _1441 = floor(_936);
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = _1431 + _1311;
    float _1447 = -_1411;
    float _1449 = _1257 + _1447;
    bool _1451 = _1433 >= 0.0;
    float _1453 = fma(_1437, -0.5, 0.5);
    float _1455 = _1445 * _1347;
    float _1457 = _906 * _1343;
    bool _1459 = _1433 <= 1.0;
    bool _1461 = _1459 && _1451;
    float _1463 = fma(_1437, 0.5, 0.5);
    float _1465 = fma(_476, _1335, _1457);
    bool _1467 = _1455 >= 0.0;
    bool _1469 = _1467 && _1461;
    float _1471 = sqrt(_1453);
    float _1473 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = fma(_478, _1359, _1465);
    bool _1477 = _1455 <= 1.0;
    bool _1479 = _1477 && _1469;
    float _1481 = fma(_1463, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1091)
    {
        float _1483 = -_1443;
        float _1485 = _936 + _1483;
        _1389 = _1485;
    }
    float _1487 = _1389;
    float _1489 = _1475 + _1367;
    float _1491 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1493 = fma(_1463, _1481, -0.212114393711090087890625);
    float _1495 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1497 = exp2(_1419);
    float _1499 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1501 = fma(_1463, _1493, 1.570728778839111328125);
    float _1503 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1495);
    float _1505 = _1381 + 1.0;
    float _1507 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1509 = _1501;
    float _1511 = _1507;
    if (_1479)
    {
        float _1513 = float(_1004);
        _1033 = _1513;
    }
    float _1515 = _1033;
    float _1517 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1519 = _1383;
    if (!_1091)
    {
        float _1521 = floor(_972);
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = _1471 * 0.636619746685028076171875;
    float _1527 = _1507 * _1421;
    float _1529 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1517);
    float _1531 = -_1501;
    float _1533 = fma(_1525, _1531, 1.0);
    float _1535 = fma(_1527, 0.5, 0.5);
    float _1537 = _1529 * _1421;
    float _1539 = _1359;
    float _1541 = _1529;
    if (!_1091)
    {
        float _1543 = rint(_1401);
        float _1545 = precise::max(_1543, 0.0);
        uint _1547 = uint(_1545);
        uint _1549 = clamp(_1547, 0u, 65535u);
        _1539 = as_type<float>(_1549);
    }
    float _1551 = _1539;
    float _1553 = -_1381;
    float _1555 = fma(_1497, _1505, _1553);
    float _1557 = _1489 * _1347;
    float _1559 = fma(_1537, -0.5, 0.5);
    float2 _4710 = float2(_1449, _1010);
    float _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4710, float2(0.0), isnan(_4710)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4710, float2(0.0), isnan(_4710)), level(0.0)).x;
    float _1563 = fma(_1555, 0.5, 0.5);
    float _1565 = _1503;
    if (_1479)
    {
        float _1567 = rint(_1515);
        float _1569 = precise::max(_1567, 0.0);
        uint _1571 = uint(_1569);
        uint _1573 = clamp(_1571, 0u, 65535u);
        _1565 = as_type<float>(_1573);
    }
    float _1575 = _1565;
    if (!_1091)
    {
        float _1577 = -_1523;
        float _1579 = _972 + _1577;
        _1509 = _1579;
    }
    float _1581 = _1509;
    float _1583 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1585 = _1323;
    if (!_1091)
    {
        float3 _4759 = float3(_1581, _1487, float(as_type<int>(_1551)));
        float3 _4763 = select(_4759, float3(0.0), isnan(_4759));
        float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4763.xy, uint(rint(_4763.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4763.xy, uint(rint(_4763.z)), level(0.0)).x;
        _1585 = _1587;
    }
    float _1589 = _1585;
    float _1591 = _1455;
    if (_1479)
    {
        float3 _4778 = float3(_1433, _1455, float(as_type<int>(_1575)));
        float3 _4780 = select(_4778, float3(0.0), isnan(_4778));
        float _1593 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4780.xy, uint(rint(_4780.z)), _1557, level(0.0));
        _1591 = _1593;
    }
    float _1595 = _1591;
    float3 _4790 = float3(_1535, _1559, _1583);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).x;
    float3 _4799 = float3(_1535, _1559, _1583);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4799, float3(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4799, float3(0.0), isnan(_4799)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _4815 = float2(_1533, _1563);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4815, float2(0.0), isnan(_4815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4815, float2(0.0), isnan(_4815)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = abs(_950);
    float _1622 = log2(_1620);
    float _1624 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1626 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1624);
    float _1628 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    float _1630 = _1507 + _1385;
    float _1632 = _1385 * 0.5;
    float _1634 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1628);
    float _1636 = _1630 * 0.5;
    float _1638 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1640 = _1634 + _1385;
    float _1642 = fma(_1529, -0.5, _1632);
    out.gl_Position.x = _1507;
    out.gl_Position.y = _1529;
    out.gl_Position.z = _1634;
    out.gl_Position.w = _1385;
    float _1644 = _1640 * 0.5;
    float _1646 = exp2(_1638);
    out.m_81.x = _1636;
    out.m_81.y = _1642;
    out.m_81.z = _1644;
    out.m_81.w = _1385;
    bool _1648 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan(0.5);
    bool _1656 = _1652 || _1654;
    float _1658 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1660 = precise::clamp(_1658, 0.0, 1.0);
    float _1662 = _1634;
    if (_1656)
    {
        _1511 = 1.0;
    }
    float _1664 = _1511;
    float _1666 = fma(_1660, -2.0, 3.0);
    float _1668 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1670 = _1660 * _1660;
    bool _1672 = _950 <= 8000.0;
    bool _1674 = isnan(_950);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(8000.0);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = _1670 * _1666;
    float _1686 = exp2(_1668);
    float _1688 = -_1684;
    float _1690 = _1688 + 1.0;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1684);
    float _1694 = _1682 * _1692;
    float _1696 = _1664;
    float _1698 = _1595;
    if (!_1656)
    {
        float _1700 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1710 = _1708 * 0.15915493667125701904296875;
        float _1712 = _1702 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        float _1716 = 1.0 / _1706;
        float _1718 = _1710 * 6.283185482025146484375;
        float _1720 = cos(_1718);
        float _1722 = _1714 * _1716;
        float _1724 = _1710 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        float _1728 = _1720 * _1722;
        float _1730 = 1.0 / _1728;
        float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1734 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1732;
        float _1736 = 1.0 / _1734;
        float _1738 = _1726 * _1730;
        float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1742 = fma(_950, _1738, _1740);
        float _1744 = _1742 * _1736;
        float _1746 = precise::clamp(_1744, 0.0, 1.0);
        _1541 = _1730;
        _1696 = _1746;
        _1662 = _1734;
    }
    float _1748 = _1541;
    float _1750 = _1696;
    float _1752 = _1662;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1756 = -_1561;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1686;
    float _1762 = _1760 + 1.0;
    float _1764 = _1748;
    float _1766 = _1752;
    if (!_1479)
    {
        _1764 = 1.0;
    }
    float _1768 = _1764;
    float _1770 = _1758 * _1754;
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = _1768;
    if (_1479)
    {
        bool _1776 = _1595 >= _1557;
        bool _1778 = isnan(_1595);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan(_1557);
        bool _1784 = _1780 || _1782;
        float _1786 = float(_1784);
        _1774 = _1786;
    }
    float _1788 = _1774;
    float _1790 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1792 = _1788;
    if (_1091)
    {
        _1698 = 1.0;
    }
    float _1794 = _1698;
    float _1796 = _1794;
    if (!_1091)
    {
        int _1798 = _1135 << 4;
        int _1800 = _1798 + 2048;
        uint _1802 = uint(int(uint(_1800) >> uint(2)));
        uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
        int _1806 = int(_1802) & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        int _1810 = int(_1802) + 1;
        uint _1812 = uint(int(uint(_1810) >> uint(2)));
        int _1814 = _1810 & 3;
        float _1816 = (*spvDescriptorSet0.vp_c15)._m0[int(_1812)][_1814];
        int _1818 = _1800 + 8;
        uint _1820 = uint(int(uint(_1818) >> uint(2)));
        uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
        int _1824 = int(_1820) & 3;
        float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
        int _1828 = int(_1820) + 1;
        uint _1830 = uint(int(uint(_1828) >> uint(2)));
        int _1832 = _1828 & 3;
        float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
        float _1836 = _906 * _1816;
        float _1838 = fma(_476, _1808, _1836);
        float _1840 = fma(_478, _1826, _1838);
        float _1842 = _1840 + _1834;
        float _1844 = precise::clamp(_1842, 0.0, 1.0);
        float _1846 = -_1844;
        float _1848 = _1846 + _1589;
        float _1850 = fma(_1848, 500.0, 1.5);
        float _1852 = exp2(_1850);
        float _1854 = 0.0 + _1852;
        float _1856 = precise::clamp(_1854, 0.0, 1.0);
        _1796 = _1856;
    }
    float _1858 = _1796;
    float _1860 = _1788 * _1858;
    float _1862 = _1790 * _1597;
    float _1864 = -_1772;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1868 = -_1790;
    float _1870 = _1868 + 1.0;
    bool _1872 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1874 = isnan(_912);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1880 = _1876 || _1878;
    float _1882 = _1608 * _1862;
    float _1884 = -_1860;
    float _1886 = fma(_1884, _1866, 1.0);
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = _1618 * _1862;
    float _1892 = _1608 * _1870;
    float _1894 = fma(_1614, _1882, _1602);
    float _1896 = fma(_1616, _1882, _1604);
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1900 = fma(_1608, _1890, _1606);
    float _1902 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _1898;
    float _1904 = _1866;
    float _1906 = _1882;
    float _1908 = _1888;
    float _1910 = _1870;
    if (!_1880)
    {
        _1766 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1912 = _1766;
    float _1914 = _1912;
    float _1916 = _1912;
    if (!_1880)
    {
        _1904 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1918 = _1904;
    out.m_85.x = _1894;
    out.m_85.y = _1896;
    out.m_85.z = _1900;
    out.m_85.w = _1892;
    float _1920 = _1918;
    float _1922 = _1918;
    if (!_1880)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1924 = _1792;
    float _1926 = _1924;
    float _1928 = _1924;
    if (!_1880)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1930 = _1906;
    float _1932 = _1930;
    float _1934 = _1930;
    if (!_1880)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1936 = _1908;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1880)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1942 = _1910;
    bool _1944 = !_1880;
    float _1946 = _1942;
    float _1948 = _1942;
    if (!_1944)
    {
        bool _1950 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1952 = isnan(_912);
        bool _1954 = _1950 || _1952;
        bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1958 = _1954 || _1956;
        if (!_1958)
        {
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1962 = _912 + _1960;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1964;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1972 = 1.0 / _1966;
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1990 = _1962 * _1972;
            float _1992 = precise::clamp(_1990, 0.0, 1.0);
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1996 = _1994 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1998 = fma(_1992, _1970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2000 = fma(_1992, _1996, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2002 = fma(_1992, _1976, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2004 = fma(_1992, _1980, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2006 = fma(_1992, _1984, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2008 = fma(_1992, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1922 = _1998;
            _1940 = _2006;
            _1916 = _2002;
            _1934 = _2004;
            _1928 = _2000;
            _1948 = _2008;
            _2010 = true;
        }
        else
        {
            bool _2012 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2014 = isnan(_912);
            bool _2016 = _2012 || _2014;
            bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2020 = _2016 || _2018;
            if (!_2020)
            {
                _1914 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2022 = _1914;
            _1916 = _2022;
            if (!_2020)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2024 = _1920;
            _1922 = _2024;
            if (!_2020)
            {
                _1926 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2026 = _1926;
            _1928 = _2026;
            if (!_2020)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2028 = _1932;
            _1934 = _2028;
            if (!_2020)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2030 = _1938;
            _1940 = _2030;
            if (!_2020)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2032 = _1946;
            bool _2034 = !_2020;
            _1948 = _2032;
            if (!_2034)
            {
                bool _2036 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2038 = isnan(_912);
                bool _2040 = _2036 || _2038;
                bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2044 = _2040 || _2042;
                if (!_2044)
                {
                    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2048 = _912 + _2046;
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2050;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2058 = 1.0 / _2052;
                    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2076 = _2048 * _2058;
                    float _2078 = precise::clamp(_2076, 0.0, 1.0);
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2084 = fma(_2078, _2056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2086 = fma(_2078, _2082, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2088 = fma(_2078, _2062, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2090 = fma(_2078, _2066, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2092 = fma(_2078, _2070, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2094 = fma(_2078, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1922 = _2084;
                    _1940 = _2092;
                    _1916 = _2088;
                    _1934 = _2090;
                    _1928 = _2086;
                    _1948 = _2094;
                    _2010 = true;
                }
                else
                {
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1916 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1928 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2010 = false;
    float _2096 = _1922;
    float _2098 = _1940;
    float _2100 = _1916;
    float _2102 = _1934;
    float _2104 = _1928;
    float _2106 = _1948;
    float _2108 = fma(_740, -0.5, 0.5);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = -_2096;
    float _2114 = _2112 + _2098;
    float _2116 = _1902 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2118 = -_2100;
    float _2120 = _2118 + _2102;
    out.m_87.x = 0.0;
    float _2122 = fma(_2110, _2114, _2096);
    float _2124 = fma(_2110, _2120, _2100);
    out.m_61.x = _2116;
    float _2126 = -_2104;
    float _2128 = _2126 + _2106;
    float _2130 = _2122 * 0.586610972881317138671875;
    bool _2132 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2134 = fma(_2110, _2128, _2104);
    float _2136 = fma(_2124, 0.298911988735198974609375, _2130);
    bool _2138 = _1750 > 0.0;
    bool _2140 = isnan(_1750);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = fma(_2134, 0.114477999508380889892578125, _2136);
    float _2150 = -_2148;
    float _2152 = _2124 + _2150;
    float _2154 = -_2148;
    float _2156 = _2122 + _2154;
    float _2158 = -_2148;
    float _2160 = _2134 + _2158;
    float _2162 = fma(_2152, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    float _2164 = fma(_2156, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    float _2166 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    bool _2168 = !_2132;
    if (!_2168)
    {
        float _2170 = -_856;
        float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2174 = -_858;
        float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2178 = -_860;
        float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2182 = _2172 * _2172;
        float _2184 = fma(_2176, _2176, _2182);
        float _2186 = fma(_2180, _2180, _2184);
        float _2188 = sqrt(_2186);
        float _2190 = rsqrt(_2186);
        float _2192 = -_2188;
        float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2196 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        float _2200 = _2176 * _2190;
        float _2202 = _2172 * _2190;
        float _2204 = abs(_2198);
        float _2206 = log2(_2204);
        float _2208 = _2180 * _2190;
        float _2210 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2212 = _740 * _2202;
        float _2214 = -_2202;
        float _2216 = -_2210;
        float _2218 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2216);
        float _2220 = fma(_738, _2200, _2212);
        float _2222 = -_2208;
        float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2218);
        float _2226 = fma(_758, _2208, _2220);
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2232 = _2224 + _2230;
        float _2234 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2236 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        float _2240 = exp2(_2234);
        float _2242 = _2240 * _2238;
        float _2244 = _2228 * _2242;
        float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2248 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2250 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2246;
        out.m_87.y = _2248;
        out.m_87.z = _2250;
    }
    out.m_89.x = _2162;
    out.m_89.y = _2164;
    out.m_89.z = _2166;
    if (_2146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2252;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2010 = false;
    bool _808 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_58.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_61.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_124);
        out.gl_Position.z = _2309;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_63.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_61.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_160);
        out.gl_Position.z = _2378;
    }
    if (_152)
    {
        return out;
    }
    float _162 = in.m_65.w;
    float _164 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_63.x;
    float _178 = in.m_63.y;
    float _180 = in.m_63.z;
    float _182 = in.m_58.x;
    float _184 = in.m_58.y;
    float _186 = in.m_58.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_67.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_108);
        float _308 = 1.0 / _306;
        float _310 = _142 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = in.m_65.x;
    float _316 = in.m_65.y;
    float _318 = in.m_65.z;
    float _320 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _324 = in.m_67.x;
    float _326 = in.m_67.y;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _330 = _328 != 0;
    float _332 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _336 = _334 != 0;
    float _338 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = in.m_69.x;
    float _342 = in.m_69.y;
    float _344 = in.m_69.z;
    bool _346 = _278 > 0.0;
    float _348 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    bool _350 = _278 >= 0.0;
    bool _352 = isnan(_278);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = in.m_71.y;
    float _362 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _366 = _358 ? 0 : 1;
    float _368 = 0.0;
    if (_330)
    {
        float _370 = in.m_67.x;
        _368 = _370;
    }
    float _372 = _368;
    float _374 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    int _376 = ~_366;
    int _378 = _376 + 1;
    int _380 = _378 + 1;
    float _382 = in.m_71.x;
    int _384 = _380;
    if (!_346)
    {
        int _386 = ~_366;
        int _388 = _386 + 1;
        _384 = _388;
    }
    int _390 = _384;
    float _392 = _314 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = _316 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = _318 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _400 = _326 > 0.5;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _340);
    float _408 = -_402;
    float _410 = fma(_398, 2.0, _408);
    float _412 = _340 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _414 = float(_390);
    float _416 = -_360;
    float _418 = _416 + 1.0;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _422 = _326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _426 = _414 * _396;
    float _428 = _360;
    float _430 = _412;
    if (_336)
    {
        float _432 = _400 ? _418 : _360;
        _428 = _432;
    }
    float _434 = _428;
    float _436 = _414 * _394;
    float _438 = _414 * _392;
    float _440 = fma(_422, -2.0, _420);
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _448 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _450 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _404);
    float _452 = _444 * _424;
    float _454 = _446 * _442;
    float _456 = _448 * _406;
    float _458 = _452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _460 = _452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _332);
    float _468 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _362);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _458);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[10].x, _460);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _476 = _466 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _478 = _468 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _480 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _470);
    float _482 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _472);
    float _484 = 1.0 / _464;
    float _486 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _474);
    float _488 = _476 + _480;
    float _490 = _478 + _482;
    float _492 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _494 = _372 > 0.5;
    bool _496 = _494 && _330;
    float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _500 = _488 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _504 = _490 + _502;
    float _506 = _482;
    float _508 = _382;
    if (!_330)
    {
        _506 = _382;
    }
    float _510 = _506;
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _514 = _500 * _500;
    float _516 = _504 * _504;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _312 + _518;
    float _522 = _342 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    float _528 = _514 + _516;
    float _530 = _510;
    float _532 = _514;
    float _534 = _516;
    if (_496)
    {
        float _536 = -_382;
        float _538 = _536 + 1.0;
        _508 = _538;
    }
    float _540 = _508;
    float _542 = _526 * _484;
    float _544 = fma(_492, _434, -0.5);
    bool _546 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = isnan(_312);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = sqrt(_528);
    bool _560 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_312);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_330)
    {
        _530 = _540;
    }
    float _574 = _530;
    float _576 = -_556;
    float _578 = _576 + 1.0;
    float _580 = fma(_542, _520, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[9].x, _572);
    float _584 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _450);
    float _586 = _570 * _578;
    float _588 = -_570;
    float _590 = _588 + 1.0;
    float _592 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[9].z, _582);
    float _594 = -_142;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[76].x, _410);
    float _598 = _580 * _586;
    float _600 = _374 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _602 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _440);
    float _604 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _486);
    bool _606 = _558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _608 = _522 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _610 = _522 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _612 = _522 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _614 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[115].x, _598);
    float _616 = _600 + _592;
    float _618 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _620 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _608);
    float _622 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _610);
    float _624 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _612);
    float _626 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _628 = fma(_618, _574, -0.5);
    float _630 = _608;
    float _632 = _610;
    if (!_606)
    {
        _430 = _514;
    }
    float _634 = _430;
    float _636 = _634;
    if (!_606)
    {
        _630 = _488;
    }
    float _638 = _630;
    float _640 = _638;
    if (!_606)
    {
        _632 = _490;
    }
    float _642 = _632;
    float _644 = _642;
    if (!_606)
    {
        _532 = _616;
    }
    float _646 = _532;
    bool _648 = !_606;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _558 + _654;
        float _658 = rsqrt(_528);
        float _660 = _656 * _652;
        float _662 = _616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _664 = _660 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = sin(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = cos(_670);
        float _674 = fma(_668, _662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _676 = _658 * _674;
        float _678 = _672 + (-1.0);
        float _680 = fma(_500, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _682 = fma(_504, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _688 = _680 + _686;
        float _690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _692 = _682 + _690;
        float _694 = fma(_616, _672, _684);
        float _696 = _688 * _688;
        float _698 = _692 * _692;
        _650 = _694;
        _636 = _696;
        _534 = _698;
        _640 = _680;
        _644 = _682;
    }
    float _700 = _650;
    float _702 = _636;
    float _704 = _534;
    float _706 = _640;
    float _708 = _644;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _712 = _700 + _710;
    float _714 = -_602;
    float _716 = fma(_604, _544, _714);
    float _718 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[116].x, _614);
    float _720 = fma(_712, _712, _702);
    float _722 = fma(_584, _628, _596);
    float _724 = _720 + _704;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = 0.0 + _414;
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = sqrt(_724);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[8].z, _620);
    float _740 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].z, _622);
    float _742 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _716 + 0.5;
    float _750 = _732 + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _756 = _722 + 0.5;
    float _758 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[10].z, _624);
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    out.m_73.w = _752;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _768 = _764 || _766;
    out.m_75.x = _742;
    out.m_75.y = _744;
    out.m_75.z = _746;
    out.m_75.w = _754;
    out.m_77.x = _756;
    out.m_77.y = _748;
    out.m_79.x = _738;
    out.m_79.y = _740;
    out.m_79.z = _758;
    float _770 = _724;
    float _772 = _756;
    if (!_768)
    {
        _770 = 1.0;
    }
    float _774 = _770;
    bool _776 = !_768;
    float _778 = _774;
    if (!_776)
    {
        bool _780 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _782 = isnan(_734);
        bool _784 = _780 || _782;
        bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _788 = _784 || _786;
        if (!_788)
        {
            float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _792 = _734 + _790;
            float _794 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _796 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _794;
            float _798 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _800 = _798 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _802 = 1.0 / _796;
            float _804 = _792 * _802;
            float _806 = fma(_804, _800, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _778 = _806;
            _808 = true;
        }
        else
        {
            bool _810 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _812 = isnan(_734);
            bool _814 = _810 || _812;
            bool _816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _818 = _814 || _816;
            if (!_818)
            {
                float _820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _822 = _734 + _820;
                float _824 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _826 = _824 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _828 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _830 = _828 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _832 = 1.0 / _826;
                float _834 = _822 * _832;
                float _836 = fma(_834, _830, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _778 = _836;
                _808 = true;
            }
            else
            {
                _778 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _808 = false;
    float _838 = _778;
    float _840 = _600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _842 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _844 = _700 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _848 = _706 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _852 = _708 + _850;
    float _854 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[11].x, _840);
    float _856 = fma(_844, _838, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _858 = fma(_848, _838, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _860 = fma(_852, _838, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _862 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[11].z, _854);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _866 = _856 + _864;
    float _868 = _600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _872 = _858 + _870;
    float _874 = _862 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _876 = _866 * _866;
    float _878 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[10].x, _868);
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _882 = _860 + _880;
    float _884 = 1.0 / _874;
    float _886 = fma(_872, _872, _876);
    float _888 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[10].z, _878);
    float _890 = _856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _892 = fma(_882, _882, _886);
    float _894 = _888 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _896 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _890);
    float _898 = rsqrt(_892);
    float _900 = _894 + _874;
    float _902 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _904 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].z, _896);
    float _906 = _600 + _902;
    float _908 = _900 * _884;
    float _910 = _908 * 0.5;
    float _912 = sqrt(_892);
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _916 = _906 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _918);
    float _922 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _924 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[127].x, _916);
    float _926 = _898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _928 = 1.0 / _920;
    float _930 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[127].z, _924);
    float _932 = _872 * _926;
    float _934 = _882 * _926;
    float _936 = _930 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _938 = _932 * _932;
    float _940 = _934 * _934;
    float _942 = trunc(_936);
    int _944 = int(_942);
    float _946 = _938 + _940;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _950 = _928 * _948;
    float _952 = sqrt(_946);
    float _954 = _906 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _956 = _950 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _958 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[126].x, _954);
    bool _960 = _950 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _962 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _964 = _944 + _962;
    int _966 = _964 + 1;
    float _968 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[126].z, _958);
    float _970 = floor(_922);
    float _972 = _968 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _974 = !_956;
    int _976 = _974 ? 0 : 1;
    bool _978 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = _952 + _980;
    int _984 = 2;
    float _986 = _982;
    float _988 = _932;
    float _990 = _934;
    float _992 = _938;
    float _994 = _940;
    if (!_956)
    {
        _984 = 1;
    }
    int _996 = _984;
    float _998 = trunc(_972);
    int _1000 = int(_998);
    int _1002 = _996;
    if (!_960)
    {
        _1002 = _976;
    }
    int _1004 = _1002;
    int _1006 = _1004 << 6;
    float _1008 = -_970;
    float _1010 = _922 + _1008;
    int _1012 = _1006 + 96;
    uint _1015 = uint(int(uint(_1012) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    float _1031 = _734;
    float _1033 = as_type<float>(_1004);
    if (_978)
    {
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1035;
    }
    float _1037 = _1031;
    int _1039 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1041 = _1000 + _1039;
    int _1043 = _1041 + 1;
    int _1045 = _1006 + 104;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
    int _1051 = int(_1047) & 3;
    float _1053 = (*spvDescriptorSet0.vp_c15)._m0[int(_1049)][_1051];
    int _1055 = int(_1047) + 1;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    int _1059 = _1055 & 3;
    float _1061 = (*spvDescriptorSet0.vp_c15)._m0[int(_1057)][_1059];
    float _1063 = _856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1065 = _1043 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1067 = _1043 | _966;
    float _1069 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    int _1071 = _1043;
    if (_978)
    {
        float _1073 = _982 * _1037;
        _986 = _1073;
    }
    float _1075 = _986;
    bool _1077 = _1067 < 0;
    bool _1079 = _1077 || _1065;
    float _1081 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1069);
    if (_978)
    {
        float _1083 = _1075 * 0.15915493667125701904296875;
        _772 = _1083;
    }
    float _1085 = _772;
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1089 = _966 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1091 = _1089 || _1079;
    float _1093 = _722;
    if (_978)
    {
        float _1095 = _1085 * 6.283185482025146484375;
        float _1097 = sin(_1095);
        _1093 = _1097;
    }
    float _1099 = _1093;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1103 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = precise::max(0.0, _1101);
    float _1107 = _1037;
    if (_978)
    {
        float _1109 = _1085 * 6.283185482025146484375;
        float _1111 = cos(_1109);
        _1107 = _1111;
    }
    float _1113 = _1107;
    float _1115 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1117 = -_926;
    float _1119 = -_1105;
    float _1121 = fma(_866, _1117, _1119);
    float _1123 = -_1103;
    float _1125 = fma(_1123, _1115, 1.0);
    float _1127 = _1115;
    float _1129 = _1121;
    if (!_1091)
    {
        int _1131 = _966 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1133 = _1131 + _1043;
        _1071 = _1133;
    }
    int _1135 = _1071;
    float _1137 = _1081;
    if (_978)
    {
        float _1139 = rsqrt(_946);
        _1137 = _1139;
    }
    float _1141 = _1137;
    if (_978)
    {
        float _1143 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1127 = _1143;
    }
    float _1145 = _1127;
    int _1147 = _1006 + 56;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = 0;
    float _1167 = _1145;
    if (!_1091)
    {
        int _1169 = _1135 << 2;
        _1165 = _1169;
    }
    int _1171 = _1165;
    int _1173 = _1171;
    if (_978)
    {
        float _1175 = fma(_1099, _1145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1167 = _1175;
    }
    float _1177 = _1167;
    int _1179 = 0;
    if (!_1091)
    {
        uint _1181 = uint(int(uint(_1135) >> uint(2)));
        _1179 = int(_1181);
    }
    int _1183 = _1179;
    float _1185 = _906 * _1029;
    float _1187 = _1029;
    if (_978)
    {
        float _1189 = _1113 + (-1.0);
        _1187 = _1189;
    }
    float _1191 = _1187;
    float _1193 = _1191;
    if (!_1091)
    {
        int _1195 = 12 & _1171;
        _1173 = _1195;
    }
    int _1197 = _1173;
    float _1199 = log2(_1125);
    float _1201 = fma(_476, _1021, _1185);
    if (_978)
    {
        float _1203 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1203;
    }
    float _1205 = _1193;
    float _1207 = fma(_478, _1053, _1201);
    float _1209 = _1141;
    if (_978)
    {
        float _1211 = _1141 * _1177;
        _1209 = _1211;
    }
    float _1213 = _1209;
    if (_978)
    {
        float _1215 = fma(_1121, _1113, _1205);
        _1129 = _1215;
    }
    float _1217 = _1129;
    int _1219 = _1006 + 48;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    uint _1223 = uint(int(uint(int(_1221)) >> uint(2)));
    int _1225 = int(_1221) & 3;
    float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
    int _1229 = int(_1221) + 1;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    int _1233 = _1229 & 3;
    float _1235 = (*spvDescriptorSet0.vp_c15)._m0[int(_1231)][_1233];
    if (_978)
    {
        float _1237 = _932 * _1213;
        _988 = _1237;
    }
    float _1239 = _988;
    if (_978)
    {
        float _1241 = _934 * _1213;
        _990 = _1241;
    }
    float _1243 = _990;
    float _1245 = _856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1249 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1247);
    float _1251 = precise::clamp(_1249, 0.0, 1.0);
    if (_978)
    {
        float _1253 = _1239 * _1239;
        _992 = _1253;
    }
    float _1255 = _992;
    float _1257 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1259 = _1006 + 64;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    uint _1263 = uint(int(uint(int(_1261)) >> uint(2)));
    int _1265 = int(_1261) & 3;
    float _1267 = (*spvDescriptorSet0.vp_c15)._m0[int(_1263)][_1265];
    int _1269 = int(_1261) + 1;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    int _1273 = _1269 & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    if (_978)
    {
        float _1277 = _1243 * _1243;
        _994 = _1277;
    }
    float _1279 = _994;
    float _1281 = fma(_1217, _1217, _1255);
    float _1283 = _856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1285 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1245);
    float _1287 = -_1251;
    float _1289 = _1287 + 1.0;
    float _1291 = _1281 + _1279;
    float _1293 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1283);
    int _1295 = _1006 + 72;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    float _1313 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1315 = _1207 + _1061;
    float _1317 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1293);
    float _1319 = rsqrt(_1291);
    float _1321 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1323 = _1199 * 0.693147182464599609375;
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1327 = _1006 + 80;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.vp_c15)._m0[int(_1339)][_1341];
    float _1345 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1347 = 1.0 / _1315;
    float _1349 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1345);
    int _1351 = _1006 + 88;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    uint _1355 = uint(int(uint(int(_1353)) >> uint(2)));
    int _1357 = int(_1353) & 3;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[int(_1355)][_1357];
    int _1361 = int(_1353) + 1;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    int _1365 = _1361 & 3;
    float _1367 = (*spvDescriptorSet0.vp_c15)._m0[int(_1363)][_1365];
    float _1369 = _1345;
    if (!_1091)
    {
        int _1371 = _1183 << 4;
        int _1373 = _1371 + _1197;
        _1369 = as_type<float>(_1373);
    }
    float _1375 = _1369;
    float _1377 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1349);
    float _1379 = _1319 * _1239;
    float _1381 = _1319 * _1217;
    float _1383 = _1319 * _1243;
    float _1385 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1377);
    float _1387 = _1375;
    float _1389 = _1379;
    if (!_1091)
    {
        int _1391 = as_type<int>(_1375) + 400;
        uint _1393 = uint(int(uint(_1391) >> uint(2)));
        uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
        int _1397 = int(_1393) & 3;
        float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
        _1387 = _1399;
    }
    float _1401 = _1387;
    float _1403 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1405 = abs(_1289);
    float _1407 = log2(_1405);
    float _1409 = _906 * _1235;
    float _1411 = floor(_1257);
    float _1413 = fma(_476, _1227, _1409);
    float _1415 = _906 * _1275;
    float _1417 = fma(_478, _1155, _1413);
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1421 = 1.0 / _1385;
    float _1423 = fma(_476, _1267, _1415);
    float _1425 = _1417 + _1163;
    float _1427 = -_1403;
    float _1429 = fma(_1381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = fma(_478, _1303, _1423);
    float _1433 = _1425 * _1347;
    float _1435 = -_1383;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1439 = _1163;
    if (!_1091)
    {
        float _1441 = floor(_936);
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = _1431 + _1311;
    float _1447 = -_1411;
    float _1449 = _1257 + _1447;
    bool _1451 = _1433 >= 0.0;
    float _1453 = fma(_1437, -0.5, 0.5);
    float _1455 = _1445 * _1347;
    float _1457 = _906 * _1343;
    bool _1459 = _1433 <= 1.0;
    bool _1461 = _1459 && _1451;
    float _1463 = fma(_1437, 0.5, 0.5);
    float _1465 = fma(_476, _1335, _1457);
    bool _1467 = _1455 >= 0.0;
    bool _1469 = _1467 && _1461;
    float _1471 = sqrt(_1453);
    float _1473 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = fma(_478, _1359, _1465);
    bool _1477 = _1455 <= 1.0;
    bool _1479 = _1477 && _1469;
    float _1481 = fma(_1463, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1091)
    {
        float _1483 = -_1443;
        float _1485 = _936 + _1483;
        _1389 = _1485;
    }
    float _1487 = _1389;
    float _1489 = _1475 + _1367;
    float _1491 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1493 = fma(_1463, _1481, -0.212114393711090087890625);
    float _1495 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1497 = exp2(_1419);
    float _1499 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1501 = fma(_1463, _1493, 1.570728778839111328125);
    float _1503 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1495);
    float _1505 = _1381 + 1.0;
    float _1507 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1509 = _1501;
    float _1511 = _1507;
    if (_1479)
    {
        float _1513 = float(_1004);
        _1033 = _1513;
    }
    float _1515 = _1033;
    float _1517 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1519 = _1383;
    if (!_1091)
    {
        float _1521 = floor(_972);
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = _1471 * 0.636619746685028076171875;
    float _1527 = _1507 * _1421;
    float _1529 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1517);
    float _1531 = -_1501;
    float _1533 = fma(_1525, _1531, 1.0);
    float _1535 = fma(_1527, 0.5, 0.5);
    float _1537 = _1529 * _1421;
    float _1539 = _1359;
    float _1541 = _1529;
    if (!_1091)
    {
        float _1543 = rint(_1401);
        float _1545 = precise::max(_1543, 0.0);
        uint _1547 = uint(_1545);
        uint _1549 = clamp(_1547, 0u, 65535u);
        _1539 = as_type<float>(_1549);
    }
    float _1551 = _1539;
    float _1553 = -_1381;
    float _1555 = fma(_1497, _1505, _1553);
    float _1557 = _1489 * _1347;
    float _1559 = fma(_1537, -0.5, 0.5);
    float2 _4710 = float2(_1449, _1010);
    float _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4710, float2(0.0), isnan(_4710)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4710, float2(0.0), isnan(_4710)), level(0.0)).x;
    float _1563 = fma(_1555, 0.5, 0.5);
    float _1565 = _1503;
    if (_1479)
    {
        float _1567 = rint(_1515);
        float _1569 = precise::max(_1567, 0.0);
        uint _1571 = uint(_1569);
        uint _1573 = clamp(_1571, 0u, 65535u);
        _1565 = as_type<float>(_1573);
    }
    float _1575 = _1565;
    if (!_1091)
    {
        float _1577 = -_1523;
        float _1579 = _972 + _1577;
        _1509 = _1579;
    }
    float _1581 = _1509;
    float _1583 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1585 = _1323;
    if (!_1091)
    {
        float3 _4759 = float3(_1581, _1487, float(as_type<int>(_1551)));
        float3 _4763 = select(_4759, float3(0.0), isnan(_4759));
        float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4763.xy, uint(rint(_4763.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4763.xy, uint(rint(_4763.z)), level(0.0)).x;
        _1585 = _1587;
    }
    float _1589 = _1585;
    float _1591 = _1455;
    if (_1479)
    {
        float3 _4778 = float3(_1433, _1455, float(as_type<int>(_1575)));
        float3 _4780 = select(_4778, float3(0.0), isnan(_4778));
        float _1593 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4780.xy, uint(rint(_4780.z)), _1557, level(0.0));
        _1591 = _1593;
    }
    float _1595 = _1591;
    float3 _4790 = float3(_1535, _1559, _1583);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).x;
    float3 _4799 = float3(_1535, _1559, _1583);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4799, float3(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4799, float3(0.0), isnan(_4799)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _4815 = float2(_1533, _1563);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4815, float2(0.0), isnan(_4815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4815, float2(0.0), isnan(_4815)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = abs(_950);
    float _1622 = log2(_1620);
    float _1624 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1626 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1624);
    float _1628 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    float _1630 = _1507 + _1385;
    float _1632 = _1385 * 0.5;
    float _1634 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1628);
    float _1636 = _1630 * 0.5;
    float _1638 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1640 = _1634 + _1385;
    float _1642 = fma(_1529, -0.5, _1632);
    out.gl_Position.x = _1507;
    out.gl_Position.y = _1529;
    out.gl_Position.z = _1634;
    out.gl_Position.w = _1385;
    float _1644 = _1640 * 0.5;
    float _1646 = exp2(_1638);
    out.m_81.x = _1636;
    out.m_81.y = _1642;
    out.m_81.z = _1644;
    out.m_81.w = _1385;
    bool _1648 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan(0.5);
    bool _1656 = _1652 || _1654;
    float _1658 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1660 = precise::clamp(_1658, 0.0, 1.0);
    float _1662 = _1634;
    if (_1656)
    {
        _1511 = 1.0;
    }
    float _1664 = _1511;
    float _1666 = fma(_1660, -2.0, 3.0);
    float _1668 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1670 = _1660 * _1660;
    bool _1672 = _950 <= 8000.0;
    bool _1674 = isnan(_950);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(8000.0);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = _1670 * _1666;
    float _1686 = exp2(_1668);
    float _1688 = -_1684;
    float _1690 = _1688 + 1.0;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1684);
    float _1694 = _1682 * _1692;
    float _1696 = _1664;
    float _1698 = _1595;
    if (!_1656)
    {
        float _1700 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1710 = _1708 * 0.15915493667125701904296875;
        float _1712 = _1702 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        float _1716 = 1.0 / _1706;
        float _1718 = _1710 * 6.283185482025146484375;
        float _1720 = cos(_1718);
        float _1722 = _1714 * _1716;
        float _1724 = _1710 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        float _1728 = _1720 * _1722;
        float _1730 = 1.0 / _1728;
        float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1734 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1732;
        float _1736 = 1.0 / _1734;
        float _1738 = _1726 * _1730;
        float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1742 = fma(_950, _1738, _1740);
        float _1744 = _1742 * _1736;
        float _1746 = precise::clamp(_1744, 0.0, 1.0);
        _1541 = _1730;
        _1696 = _1746;
        _1662 = _1734;
    }
    float _1748 = _1541;
    float _1750 = _1696;
    float _1752 = _1662;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1756 = -_1561;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1686;
    float _1762 = _1760 + 1.0;
    float _1764 = _1748;
    float _1766 = _1752;
    if (!_1479)
    {
        _1764 = 1.0;
    }
    float _1768 = _1764;
    float _1770 = _1758 * _1754;
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = _1768;
    if (_1479)
    {
        bool _1776 = _1595 >= _1557;
        bool _1778 = isnan(_1595);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan(_1557);
        bool _1784 = _1780 || _1782;
        float _1786 = float(_1784);
        _1774 = _1786;
    }
    float _1788 = _1774;
    float _1790 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1792 = _1788;
    if (_1091)
    {
        _1698 = 1.0;
    }
    float _1794 = _1698;
    float _1796 = _1794;
    if (!_1091)
    {
        int _1798 = _1135 << 4;
        int _1800 = _1798 + 2048;
        uint _1802 = uint(int(uint(_1800) >> uint(2)));
        uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
        int _1806 = int(_1802) & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        int _1810 = int(_1802) + 1;
        uint _1812 = uint(int(uint(_1810) >> uint(2)));
        int _1814 = _1810 & 3;
        float _1816 = (*spvDescriptorSet0.vp_c15)._m0[int(_1812)][_1814];
        int _1818 = _1800 + 8;
        uint _1820 = uint(int(uint(_1818) >> uint(2)));
        uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
        int _1824 = int(_1820) & 3;
        float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
        int _1828 = int(_1820) + 1;
        uint _1830 = uint(int(uint(_1828) >> uint(2)));
        int _1832 = _1828 & 3;
        float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
        float _1836 = _906 * _1816;
        float _1838 = fma(_476, _1808, _1836);
        float _1840 = fma(_478, _1826, _1838);
        float _1842 = _1840 + _1834;
        float _1844 = precise::clamp(_1842, 0.0, 1.0);
        float _1846 = -_1844;
        float _1848 = _1846 + _1589;
        float _1850 = fma(_1848, 500.0, 1.5);
        float _1852 = exp2(_1850);
        float _1854 = 0.0 + _1852;
        float _1856 = precise::clamp(_1854, 0.0, 1.0);
        _1796 = _1856;
    }
    float _1858 = _1796;
    float _1860 = _1788 * _1858;
    float _1862 = _1790 * _1597;
    float _1864 = -_1772;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1868 = -_1790;
    float _1870 = _1868 + 1.0;
    bool _1872 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1874 = isnan(_912);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1880 = _1876 || _1878;
    float _1882 = _1608 * _1862;
    float _1884 = -_1860;
    float _1886 = fma(_1884, _1866, 1.0);
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = _1618 * _1862;
    float _1892 = _1608 * _1870;
    float _1894 = fma(_1614, _1882, _1602);
    float _1896 = fma(_1616, _1882, _1604);
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1900 = fma(_1608, _1890, _1606);
    float _1902 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _1898;
    float _1904 = _1866;
    float _1906 = _1882;
    float _1908 = _1888;
    float _1910 = _1870;
    if (!_1880)
    {
        _1766 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1912 = _1766;
    float _1914 = _1912;
    float _1916 = _1912;
    if (!_1880)
    {
        _1904 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1918 = _1904;
    out.m_85.x = _1894;
    out.m_85.y = _1896;
    out.m_85.z = _1900;
    out.m_85.w = _1892;
    float _1920 = _1918;
    float _1922 = _1918;
    if (!_1880)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1924 = _1792;
    float _1926 = _1924;
    float _1928 = _1924;
    if (!_1880)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1930 = _1906;
    float _1932 = _1930;
    float _1934 = _1930;
    if (!_1880)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1936 = _1908;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1880)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1942 = _1910;
    bool _1944 = !_1880;
    float _1946 = _1942;
    float _1948 = _1942;
    if (!_1944)
    {
        bool _1950 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1952 = isnan(_912);
        bool _1954 = _1950 || _1952;
        bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1958 = _1954 || _1956;
        if (!_1958)
        {
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1962 = _912 + _1960;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1964;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1972 = 1.0 / _1966;
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1990 = _1962 * _1972;
            float _1992 = precise::clamp(_1990, 0.0, 1.0);
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1996 = _1994 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1998 = fma(_1992, _1970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2000 = fma(_1992, _1996, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2002 = fma(_1992, _1976, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2004 = fma(_1992, _1980, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2006 = fma(_1992, _1984, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2008 = fma(_1992, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1922 = _1998;
            _1940 = _2006;
            _1916 = _2002;
            _1934 = _2004;
            _1928 = _2000;
            _1948 = _2008;
            _2010 = true;
        }
        else
        {
            bool _2012 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2014 = isnan(_912);
            bool _2016 = _2012 || _2014;
            bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2020 = _2016 || _2018;
            if (!_2020)
            {
                _1914 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2022 = _1914;
            _1916 = _2022;
            if (!_2020)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2024 = _1920;
            _1922 = _2024;
            if (!_2020)
            {
                _1926 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2026 = _1926;
            _1928 = _2026;
            if (!_2020)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2028 = _1932;
            _1934 = _2028;
            if (!_2020)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2030 = _1938;
            _1940 = _2030;
            if (!_2020)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2032 = _1946;
            bool _2034 = !_2020;
            _1948 = _2032;
            if (!_2034)
            {
                bool _2036 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2038 = isnan(_912);
                bool _2040 = _2036 || _2038;
                bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2044 = _2040 || _2042;
                if (!_2044)
                {
                    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2048 = _912 + _2046;
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2050;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2058 = 1.0 / _2052;
                    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2076 = _2048 * _2058;
                    float _2078 = precise::clamp(_2076, 0.0, 1.0);
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2084 = fma(_2078, _2056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2086 = fma(_2078, _2082, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2088 = fma(_2078, _2062, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2090 = fma(_2078, _2066, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2092 = fma(_2078, _2070, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2094 = fma(_2078, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1922 = _2084;
                    _1940 = _2092;
                    _1916 = _2088;
                    _1934 = _2090;
                    _1928 = _2086;
                    _1948 = _2094;
                    _2010 = true;
                }
                else
                {
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1916 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1928 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2010 = false;
    float _2096 = _1922;
    float _2098 = _1940;
    float _2100 = _1916;
    float _2102 = _1934;
    float _2104 = _1928;
    float _2106 = _1948;
    float _2108 = fma(_740, -0.5, 0.5);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = -_2096;
    float _2114 = _2112 + _2098;
    float _2116 = _1902 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2118 = -_2100;
    float _2120 = _2118 + _2102;
    out.m_87.x = 0.0;
    float _2122 = fma(_2110, _2114, _2096);
    float _2124 = fma(_2110, _2120, _2100);
    out.m_61.x = _2116;
    float _2126 = -_2104;
    float _2128 = _2126 + _2106;
    float _2130 = _2122 * 0.586610972881317138671875;
    bool _2132 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2134 = fma(_2110, _2128, _2104);
    float _2136 = fma(_2124, 0.298911988735198974609375, _2130);
    bool _2138 = _1750 > 0.0;
    bool _2140 = isnan(_1750);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = fma(_2134, 0.114477999508380889892578125, _2136);
    float _2150 = -_2148;
    float _2152 = _2124 + _2150;
    float _2154 = -_2148;
    float _2156 = _2122 + _2154;
    float _2158 = -_2148;
    float _2160 = _2134 + _2158;
    float _2162 = fma(_2152, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    float _2164 = fma(_2156, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    float _2166 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    bool _2168 = !_2132;
    if (!_2168)
    {
        float _2170 = -_856;
        float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2174 = -_858;
        float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2178 = -_860;
        float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2182 = _2172 * _2172;
        float _2184 = fma(_2176, _2176, _2182);
        float _2186 = fma(_2180, _2180, _2184);
        float _2188 = sqrt(_2186);
        float _2190 = rsqrt(_2186);
        float _2192 = -_2188;
        float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2196 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        float _2200 = _2176 * _2190;
        float _2202 = _2172 * _2190;
        float _2204 = abs(_2198);
        float _2206 = log2(_2204);
        float _2208 = _2180 * _2190;
        float _2210 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2212 = _740 * _2202;
        float _2214 = -_2202;
        float _2216 = -_2210;
        float _2218 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2216);
        float _2220 = fma(_738, _2200, _2212);
        float _2222 = -_2208;
        float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2218);
        float _2226 = fma(_758, _2208, _2220);
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2232 = _2224 + _2230;
        float _2234 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2236 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        float _2240 = exp2(_2234);
        float _2242 = _2240 * _2238;
        float _2244 = _2228 * _2242;
        float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2248 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2250 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2246;
        out.m_87.y = _2248;
        out.m_87.z = _2250;
    }
    out.m_89.x = _2162;
    out.m_89.y = _2164;
    out.m_89.z = _2166;
    if (_2146)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2252;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2010 = false;
    bool _808 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_58.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_61.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2309 = as_type<float>(_124);
        out.gl_Position.z = _2309;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_63.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _118 = _144;
    }
    float _146 = _118;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_61.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_160);
        out.gl_Position.z = _2378;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_65.w;
    float _164 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_63.x;
    float _178 = in.m_63.y;
    float _180 = in.m_63.z;
    float _182 = in.m_58.x;
    float _184 = in.m_58.y;
    float _186 = in.m_58.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_67.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_108);
        float _308 = 1.0 / _306;
        float _310 = _142 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = in.m_65.x;
    float _316 = in.m_65.y;
    float _318 = in.m_65.z;
    float _320 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _322 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _324 = in.m_67.x;
    float _326 = in.m_67.y;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _330 = _328 != 0;
    float _332 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _320);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _336 = _334 != 0;
    float _338 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = in.m_69.x;
    float _342 = in.m_69.y;
    float _344 = in.m_69.z;
    bool _346 = _278 > 0.0;
    float _348 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _322);
    bool _350 = _278 >= 0.0;
    bool _352 = isnan(_278);
    bool _354 = _350 || _352;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    float _360 = in.m_71.y;
    float _362 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _366 = _358 ? 0 : 1;
    float _368 = 0.0;
    if (_330)
    {
        float _370 = in.m_67.x;
        _368 = _370;
    }
    float _372 = _368;
    float _374 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    int _376 = ~_366;
    int _378 = _376 + 1;
    int _380 = _378 + 1;
    float _382 = in.m_71.x;
    int _384 = _380;
    if (!_346)
    {
        int _386 = ~_366;
        int _388 = _386 + 1;
        _384 = _388;
    }
    int _390 = _384;
    float _392 = _314 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = _316 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = _318 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = _324 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _400 = _326 > 0.5;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _340);
    float _408 = -_402;
    float _410 = fma(_398, 2.0, _408);
    float _412 = _340 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _414 = float(_390);
    float _416 = -_360;
    float _418 = _416 + 1.0;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _422 = _326 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _426 = _414 * _396;
    float _428 = _360;
    float _430 = _412;
    if (_336)
    {
        float _432 = _400 ? _418 : _360;
        _428 = _432;
    }
    float _434 = _428;
    float _436 = _414 * _394;
    float _438 = _414 * _392;
    float _440 = fma(_422, -2.0, _420);
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = _426 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _448 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _450 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[78].z, _404);
    float _452 = _444 * _424;
    float _454 = _446 * _442;
    float _456 = _448 * _406;
    float _458 = _452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _460 = _452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _466 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _332);
    float _468 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _362);
    float _470 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _458);
    float _472 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[10].x, _460);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _476 = _466 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _478 = _468 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _480 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _470);
    float _482 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _472);
    float _484 = 1.0 / _464;
    float _486 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[78].w, _474);
    float _488 = _476 + _480;
    float _490 = _478 + _482;
    float _492 = _364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _494 = _372 > 0.5;
    bool _496 = _494 && _330;
    float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _500 = _488 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _504 = _490 + _502;
    float _506 = _482;
    float _508 = _382;
    if (!_330)
    {
        _506 = _382;
    }
    float _510 = _506;
    float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _514 = _500 * _500;
    float _516 = _504 * _504;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _312 + _518;
    float _522 = _342 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    float _528 = _514 + _516;
    float _530 = _510;
    float _532 = _514;
    float _534 = _516;
    if (_496)
    {
        float _536 = -_382;
        float _538 = _536 + 1.0;
        _508 = _538;
    }
    float _540 = _508;
    float _542 = _526 * _484;
    float _544 = fma(_492, _434, -0.5);
    bool _546 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = isnan(_312);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = sqrt(_528);
    bool _560 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _562 = isnan(_312);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    if (_330)
    {
        _530 = _540;
    }
    float _574 = _530;
    float _576 = -_556;
    float _578 = _576 + 1.0;
    float _580 = fma(_542, _520, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[9].x, _572);
    float _584 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _450);
    float _586 = _570 * _578;
    float _588 = -_570;
    float _590 = _588 + 1.0;
    float _592 = fma(_454, (*spvDescriptorSet0.vp_c10)._m0[9].z, _582);
    float _594 = -_142;
    float _596 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[76].x, _410);
    float _598 = _580 * _586;
    float _600 = _374 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _602 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _440);
    float _604 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _486);
    bool _606 = _558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _608 = _522 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _610 = _522 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _612 = _522 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _614 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[115].x, _598);
    float _616 = _600 + _592;
    float _618 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _620 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _608);
    float _622 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _610);
    float _624 = fma(_412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _612);
    float _626 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _628 = fma(_618, _574, -0.5);
    float _630 = _608;
    float _632 = _610;
    if (!_606)
    {
        _430 = _514;
    }
    float _634 = _430;
    float _636 = _634;
    if (!_606)
    {
        _630 = _488;
    }
    float _638 = _630;
    float _640 = _638;
    if (!_606)
    {
        _632 = _490;
    }
    float _642 = _632;
    float _644 = _642;
    if (!_606)
    {
        _532 = _616;
    }
    float _646 = _532;
    bool _648 = !_606;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _558 + _654;
        float _658 = rsqrt(_528);
        float _660 = _656 * _652;
        float _662 = _616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _664 = _660 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = sin(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = cos(_670);
        float _674 = fma(_668, _662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _676 = _658 * _674;
        float _678 = _672 + (-1.0);
        float _680 = fma(_500, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _682 = fma(_504, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _688 = _680 + _686;
        float _690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _692 = _682 + _690;
        float _694 = fma(_616, _672, _684);
        float _696 = _688 * _688;
        float _698 = _692 * _692;
        _650 = _694;
        _636 = _696;
        _534 = _698;
        _640 = _680;
        _644 = _682;
    }
    float _700 = _650;
    float _702 = _636;
    float _704 = _534;
    float _706 = _640;
    float _708 = _644;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _712 = _700 + _710;
    float _714 = -_602;
    float _716 = fma(_604, _544, _714);
    float _718 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[116].x, _614);
    float _720 = fma(_712, _712, _702);
    float _722 = fma(_584, _628, _596);
    float _724 = _720 + _704;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = 0.0 + _414;
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = sqrt(_724);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _738 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[8].z, _620);
    float _740 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].z, _622);
    float _742 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _716 + 0.5;
    float _750 = _732 + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _756 = _722 + 0.5;
    float _758 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[10].z, _624);
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    out.m_73.w = _752;
    bool _760 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _762 = isnan(_734);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _768 = _764 || _766;
    out.m_75.x = _742;
    out.m_75.y = _744;
    out.m_75.z = _746;
    out.m_75.w = _754;
    out.m_77.x = _756;
    out.m_77.y = _748;
    out.m_79.x = _738;
    out.m_79.y = _740;
    out.m_79.z = _758;
    float _770 = _724;
    float _772 = _756;
    if (!_768)
    {
        _770 = 1.0;
    }
    float _774 = _770;
    bool _776 = !_768;
    float _778 = _774;
    if (!_776)
    {
        bool _780 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _782 = isnan(_734);
        bool _784 = _780 || _782;
        bool _786 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _788 = _784 || _786;
        if (!_788)
        {
            float _790 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _792 = _734 + _790;
            float _794 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _796 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _794;
            float _798 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _800 = _798 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _802 = 1.0 / _796;
            float _804 = _792 * _802;
            float _806 = fma(_804, _800, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _778 = _806;
            _808 = true;
        }
        else
        {
            bool _810 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _812 = isnan(_734);
            bool _814 = _810 || _812;
            bool _816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _818 = _814 || _816;
            if (!_818)
            {
                float _820 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _822 = _734 + _820;
                float _824 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _826 = _824 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _828 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _830 = _828 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _832 = 1.0 / _826;
                float _834 = _822 * _832;
                float _836 = fma(_834, _830, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _778 = _836;
                _808 = true;
            }
            else
            {
                _778 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _808 = false;
    float _838 = _778;
    float _840 = _600 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _842 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _844 = _700 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _848 = _706 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _852 = _708 + _850;
    float _854 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[11].x, _840);
    float _856 = fma(_844, _838, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _858 = fma(_848, _838, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _860 = fma(_852, _838, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _862 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[11].z, _854);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _866 = _856 + _864;
    float _868 = _600 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _872 = _858 + _870;
    float _874 = _862 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _876 = _866 * _866;
    float _878 = fma(_476, (*spvDescriptorSet0.vp_c8)._m0[10].x, _868);
    float _880 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _882 = _860 + _880;
    float _884 = 1.0 / _874;
    float _886 = fma(_872, _872, _876);
    float _888 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[10].z, _878);
    float _890 = _856 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _892 = fma(_882, _882, _886);
    float _894 = _888 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _896 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[3].x, _890);
    float _898 = rsqrt(_892);
    float _900 = _894 + _874;
    float _902 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _904 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].z, _896);
    float _906 = _600 + _902;
    float _908 = _900 * _884;
    float _910 = _908 * 0.5;
    float _912 = sqrt(_892);
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _916 = _906 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _920 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _918);
    float _922 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _924 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[127].x, _916);
    float _926 = _898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _928 = 1.0 / _920;
    float _930 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[127].z, _924);
    float _932 = _872 * _926;
    float _934 = _882 * _926;
    float _936 = _930 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _938 = _932 * _932;
    float _940 = _934 * _934;
    float _942 = trunc(_936);
    int _944 = int(_942);
    float _946 = _938 + _940;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _950 = _928 * _948;
    float _952 = sqrt(_946);
    float _954 = _906 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _956 = _950 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _958 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[126].x, _954);
    bool _960 = _950 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    int _962 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _964 = _944 + _962;
    int _966 = _964 + 1;
    float _968 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[126].z, _958);
    float _970 = floor(_922);
    float _972 = _968 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _974 = !_956;
    int _976 = _974 ? 0 : 1;
    bool _978 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = _952 + _980;
    int _984 = 2;
    float _986 = _982;
    float _988 = _932;
    float _990 = _934;
    float _992 = _938;
    float _994 = _940;
    if (!_956)
    {
        _984 = 1;
    }
    int _996 = _984;
    float _998 = trunc(_972);
    int _1000 = int(_998);
    int _1002 = _996;
    if (!_960)
    {
        _1002 = _976;
    }
    int _1004 = _1002;
    int _1006 = _1004 << 6;
    float _1008 = -_970;
    float _1010 = _922 + _1008;
    int _1012 = _1006 + 96;
    uint _1015 = uint(int(uint(_1012) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.vp_c15)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.vp_c15)._m0[int(_1025)][_1027];
    float _1031 = _734;
    float _1033 = as_type<float>(_1004);
    if (_978)
    {
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1035;
    }
    float _1037 = _1031;
    int _1039 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1041 = _1000 + _1039;
    int _1043 = _1041 + 1;
    int _1045 = _1006 + 104;
    uint _1047 = uint(int(uint(_1045) >> uint(2)));
    uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
    int _1051 = int(_1047) & 3;
    float _1053 = (*spvDescriptorSet0.vp_c15)._m0[int(_1049)][_1051];
    int _1055 = int(_1047) + 1;
    uint _1057 = uint(int(uint(_1055) >> uint(2)));
    int _1059 = _1055 & 3;
    float _1061 = (*spvDescriptorSet0.vp_c15)._m0[int(_1057)][_1059];
    float _1063 = _856 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1065 = _1043 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1067 = _1043 | _966;
    float _1069 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    int _1071 = _1043;
    if (_978)
    {
        float _1073 = _982 * _1037;
        _986 = _1073;
    }
    float _1075 = _986;
    bool _1077 = _1067 < 0;
    bool _1079 = _1077 || _1065;
    float _1081 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1069);
    if (_978)
    {
        float _1083 = _1075 * 0.15915493667125701904296875;
        _772 = _1083;
    }
    float _1085 = _772;
    float _1087 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _1089 = _966 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1091 = _1089 || _1079;
    float _1093 = _722;
    if (_978)
    {
        float _1095 = _1085 * 6.283185482025146484375;
        float _1097 = sin(_1095);
        _1093 = _1097;
    }
    float _1099 = _1093;
    float _1101 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1103 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1105 = precise::max(0.0, _1101);
    float _1107 = _1037;
    if (_978)
    {
        float _1109 = _1085 * 6.283185482025146484375;
        float _1111 = cos(_1109);
        _1107 = _1111;
    }
    float _1113 = _1107;
    float _1115 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1117 = -_926;
    float _1119 = -_1105;
    float _1121 = fma(_866, _1117, _1119);
    float _1123 = -_1103;
    float _1125 = fma(_1123, _1115, 1.0);
    float _1127 = _1115;
    float _1129 = _1121;
    if (!_1091)
    {
        int _1131 = _966 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1133 = _1131 + _1043;
        _1071 = _1133;
    }
    int _1135 = _1071;
    float _1137 = _1081;
    if (_978)
    {
        float _1139 = rsqrt(_946);
        _1137 = _1139;
    }
    float _1141 = _1137;
    if (_978)
    {
        float _1143 = _1121 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1127 = _1143;
    }
    float _1145 = _1127;
    int _1147 = _1006 + 56;
    uint _1149 = uint(int(uint(_1147) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.vp_c15)._m0[int(_1159)][_1161];
    int _1165 = 0;
    float _1167 = _1145;
    if (!_1091)
    {
        int _1169 = _1135 << 2;
        _1165 = _1169;
    }
    int _1171 = _1165;
    int _1173 = _1171;
    if (_978)
    {
        float _1175 = fma(_1099, _1145, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1167 = _1175;
    }
    float _1177 = _1167;
    int _1179 = 0;
    if (!_1091)
    {
        uint _1181 = uint(int(uint(_1135) >> uint(2)));
        _1179 = int(_1181);
    }
    int _1183 = _1179;
    float _1185 = _906 * _1029;
    float _1187 = _1029;
    if (_978)
    {
        float _1189 = _1113 + (-1.0);
        _1187 = _1189;
    }
    float _1191 = _1187;
    float _1193 = _1191;
    if (!_1091)
    {
        int _1195 = 12 & _1171;
        _1173 = _1195;
    }
    int _1197 = _1173;
    float _1199 = log2(_1125);
    float _1201 = fma(_476, _1021, _1185);
    if (_978)
    {
        float _1203 = _1191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1193 = _1203;
    }
    float _1205 = _1193;
    float _1207 = fma(_478, _1053, _1201);
    float _1209 = _1141;
    if (_978)
    {
        float _1211 = _1141 * _1177;
        _1209 = _1211;
    }
    float _1213 = _1209;
    if (_978)
    {
        float _1215 = fma(_1121, _1113, _1205);
        _1129 = _1215;
    }
    float _1217 = _1129;
    int _1219 = _1006 + 48;
    uint _1221 = uint(int(uint(_1219) >> uint(2)));
    uint _1223 = uint(int(uint(int(_1221)) >> uint(2)));
    int _1225 = int(_1221) & 3;
    float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
    int _1229 = int(_1221) + 1;
    uint _1231 = uint(int(uint(_1229) >> uint(2)));
    int _1233 = _1229 & 3;
    float _1235 = (*spvDescriptorSet0.vp_c15)._m0[int(_1231)][_1233];
    if (_978)
    {
        float _1237 = _932 * _1213;
        _988 = _1237;
    }
    float _1239 = _988;
    if (_978)
    {
        float _1241 = _934 * _1213;
        _990 = _1241;
    }
    float _1243 = _990;
    float _1245 = _856 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1249 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1247);
    float _1251 = precise::clamp(_1249, 0.0, 1.0);
    if (_978)
    {
        float _1253 = _1239 * _1239;
        _992 = _1253;
    }
    float _1255 = _992;
    float _1257 = fma(_476, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1259 = _1006 + 64;
    uint _1261 = uint(int(uint(_1259) >> uint(2)));
    uint _1263 = uint(int(uint(int(_1261)) >> uint(2)));
    int _1265 = int(_1261) & 3;
    float _1267 = (*spvDescriptorSet0.vp_c15)._m0[int(_1263)][_1265];
    int _1269 = int(_1261) + 1;
    uint _1271 = uint(int(uint(_1269) >> uint(2)));
    int _1273 = _1269 & 3;
    float _1275 = (*spvDescriptorSet0.vp_c15)._m0[int(_1271)][_1273];
    if (_978)
    {
        float _1277 = _1243 * _1243;
        _994 = _1277;
    }
    float _1279 = _994;
    float _1281 = fma(_1217, _1217, _1255);
    float _1283 = _856 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1285 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1245);
    float _1287 = -_1251;
    float _1289 = _1287 + 1.0;
    float _1291 = _1281 + _1279;
    float _1293 = fma(_858, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1283);
    int _1295 = _1006 + 72;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    uint _1299 = uint(int(uint(int(_1297)) >> uint(2)));
    int _1301 = int(_1297) & 3;
    float _1303 = (*spvDescriptorSet0.vp_c15)._m0[int(_1299)][_1301];
    int _1305 = int(_1297) + 1;
    uint _1307 = uint(int(uint(_1305) >> uint(2)));
    int _1309 = _1305 & 3;
    float _1311 = (*spvDescriptorSet0.vp_c15)._m0[int(_1307)][_1309];
    float _1313 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1285);
    float _1315 = _1207 + _1061;
    float _1317 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1293);
    float _1319 = rsqrt(_1291);
    float _1321 = _1313 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1323 = _1199 * 0.693147182464599609375;
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1327 = _1006 + 80;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    uint _1331 = uint(int(uint(int(_1329)) >> uint(2)));
    int _1333 = int(_1329) & 3;
    float _1335 = (*spvDescriptorSet0.vp_c15)._m0[int(_1331)][_1333];
    int _1337 = int(_1329) + 1;
    uint _1339 = uint(int(uint(_1337) >> uint(2)));
    int _1341 = _1337 & 3;
    float _1343 = (*spvDescriptorSet0.vp_c15)._m0[int(_1339)][_1341];
    float _1345 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1347 = 1.0 / _1315;
    float _1349 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1345);
    int _1351 = _1006 + 88;
    uint _1353 = uint(int(uint(_1351) >> uint(2)));
    uint _1355 = uint(int(uint(int(_1353)) >> uint(2)));
    int _1357 = int(_1353) & 3;
    float _1359 = (*spvDescriptorSet0.vp_c15)._m0[int(_1355)][_1357];
    int _1361 = int(_1353) + 1;
    uint _1363 = uint(int(uint(_1361) >> uint(2)));
    int _1365 = _1361 & 3;
    float _1367 = (*spvDescriptorSet0.vp_c15)._m0[int(_1363)][_1365];
    float _1369 = _1345;
    if (!_1091)
    {
        int _1371 = _1183 << 4;
        int _1373 = _1371 + _1197;
        _1369 = as_type<float>(_1373);
    }
    float _1375 = _1369;
    float _1377 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1349);
    float _1379 = _1319 * _1239;
    float _1381 = _1319 * _1217;
    float _1383 = _1319 * _1243;
    float _1385 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1377);
    float _1387 = _1375;
    float _1389 = _1379;
    if (!_1091)
    {
        int _1391 = as_type<int>(_1375) + 400;
        uint _1393 = uint(int(uint(_1391) >> uint(2)));
        uint _1395 = uint(int(uint(int(_1393)) >> uint(2)));
        int _1397 = int(_1393) & 3;
        float _1399 = (*spvDescriptorSet0.vp_c15)._m0[int(_1395)][_1397];
        _1387 = _1399;
    }
    float _1401 = _1387;
    float _1403 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1405 = abs(_1289);
    float _1407 = log2(_1405);
    float _1409 = _906 * _1235;
    float _1411 = floor(_1257);
    float _1413 = fma(_476, _1227, _1409);
    float _1415 = _906 * _1275;
    float _1417 = fma(_478, _1155, _1413);
    float _1419 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1421 = 1.0 / _1385;
    float _1423 = fma(_476, _1267, _1415);
    float _1425 = _1417 + _1163;
    float _1427 = -_1403;
    float _1429 = fma(_1381, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = fma(_478, _1303, _1423);
    float _1433 = _1425 * _1347;
    float _1435 = -_1383;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1439 = _1163;
    if (!_1091)
    {
        float _1441 = floor(_936);
        _1439 = _1441;
    }
    float _1443 = _1439;
    float _1445 = _1431 + _1311;
    float _1447 = -_1411;
    float _1449 = _1257 + _1447;
    bool _1451 = _1433 >= 0.0;
    float _1453 = fma(_1437, -0.5, 0.5);
    float _1455 = _1445 * _1347;
    float _1457 = _906 * _1343;
    bool _1459 = _1433 <= 1.0;
    bool _1461 = _1459 && _1451;
    float _1463 = fma(_1437, 0.5, 0.5);
    float _1465 = fma(_476, _1335, _1457);
    bool _1467 = _1455 >= 0.0;
    bool _1469 = _1467 && _1461;
    float _1471 = sqrt(_1453);
    float _1473 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = fma(_478, _1359, _1465);
    bool _1477 = _1455 <= 1.0;
    bool _1479 = _1477 && _1469;
    float _1481 = fma(_1463, -0.0187292993068695068359375, 0.07426099479198455810546875);
    if (!_1091)
    {
        float _1483 = -_1443;
        float _1485 = _936 + _1483;
        _1389 = _1485;
    }
    float _1487 = _1389;
    float _1489 = _1475 + _1367;
    float _1491 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1493 = fma(_1463, _1481, -0.212114393711090087890625);
    float _1495 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1497 = exp2(_1419);
    float _1499 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1501 = fma(_1463, _1493, 1.570728778839111328125);
    float _1503 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1495);
    float _1505 = _1381 + 1.0;
    float _1507 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1509 = _1501;
    float _1511 = _1507;
    if (_1479)
    {
        float _1513 = float(_1004);
        _1033 = _1513;
    }
    float _1515 = _1033;
    float _1517 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1519 = _1383;
    if (!_1091)
    {
        float _1521 = floor(_972);
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = _1471 * 0.636619746685028076171875;
    float _1527 = _1507 * _1421;
    float _1529 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1517);
    float _1531 = -_1501;
    float _1533 = fma(_1525, _1531, 1.0);
    float _1535 = fma(_1527, 0.5, 0.5);
    float _1537 = _1529 * _1421;
    float _1539 = _1359;
    float _1541 = _1529;
    if (!_1091)
    {
        float _1543 = rint(_1401);
        float _1545 = precise::max(_1543, 0.0);
        uint _1547 = uint(_1545);
        uint _1549 = clamp(_1547, 0u, 65535u);
        _1539 = as_type<float>(_1549);
    }
    float _1551 = _1539;
    float _1553 = -_1381;
    float _1555 = fma(_1497, _1505, _1553);
    float _1557 = _1489 * _1347;
    float _1559 = fma(_1537, -0.5, 0.5);
    float2 _4710 = float2(_1449, _1010);
    float _1561 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4710, float2(0.0), isnan(_4710)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4710, float2(0.0), isnan(_4710)), level(0.0)).x;
    float _1563 = fma(_1555, 0.5, 0.5);
    float _1565 = _1503;
    if (_1479)
    {
        float _1567 = rint(_1515);
        float _1569 = precise::max(_1567, 0.0);
        uint _1571 = uint(_1569);
        uint _1573 = clamp(_1571, 0u, 65535u);
        _1565 = as_type<float>(_1573);
    }
    float _1575 = _1565;
    if (!_1091)
    {
        float _1577 = -_1523;
        float _1579 = _972 + _1577;
        _1509 = _1579;
    }
    float _1581 = _1509;
    float _1583 = _1323 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1585 = _1323;
    if (!_1091)
    {
        float3 _4759 = float3(_1581, _1487, float(as_type<int>(_1551)));
        float3 _4763 = select(_4759, float3(0.0), isnan(_4759));
        float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4763.xy, uint(rint(_4763.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4763.xy, uint(rint(_4763.z)), level(0.0)).x;
        _1585 = _1587;
    }
    float _1589 = _1585;
    float _1591 = _1455;
    if (_1479)
    {
        float3 _4778 = float3(_1433, _1455, float(as_type<int>(_1575)));
        float3 _4780 = select(_4778, float3(0.0), isnan(_4778));
        float _1593 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4780.xy, uint(rint(_4780.z)), _1557, level(0.0));
        _1591 = _1593;
    }
    float _1595 = _1591;
    float3 _4790 = float3(_1535, _1559, _1583);
    float _1597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).x;
    float3 _4799 = float3(_1535, _1559, _1583);
    float4 _1600 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4799, float3(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4799, float3(0.0), isnan(_4799)), level(0.0)).xyzw;
    float _1602 = _1600.x;
    float _1604 = _1600.y;
    float _1606 = _1600.z;
    float _1608 = _1600.w;
    float2 _4815 = float2(_1533, _1563);
    float3 _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4815, float2(0.0), isnan(_4815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4815, float2(0.0), isnan(_4815)), level(0.0)).xyz;
    float _1614 = _1612.x;
    float _1616 = _1612.y;
    float _1618 = _1612.z;
    float _1620 = abs(_950);
    float _1622 = log2(_1620);
    float _1624 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1626 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1624);
    float _1628 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    float _1630 = _1507 + _1385;
    float _1632 = _1385 * 0.5;
    float _1634 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1628);
    float _1636 = _1630 * 0.5;
    float _1638 = _1622 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1640 = _1634 + _1385;
    float _1642 = fma(_1529, -0.5, _1632);
    out.gl_Position.x = _1507;
    out.gl_Position.y = _1529;
    out.gl_Position.z = _1634;
    out.gl_Position.w = _1385;
    float _1644 = _1640 * 0.5;
    float _1646 = exp2(_1638);
    out.m_81.x = _1636;
    out.m_81.y = _1642;
    out.m_81.z = _1644;
    out.m_81.w = _1385;
    bool _1648 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan(0.5);
    bool _1656 = _1652 || _1654;
    float _1658 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1660 = precise::clamp(_1658, 0.0, 1.0);
    float _1662 = _1634;
    if (_1656)
    {
        _1511 = 1.0;
    }
    float _1664 = _1511;
    float _1666 = fma(_1660, -2.0, 3.0);
    float _1668 = _1407 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1670 = _1660 * _1660;
    bool _1672 = _950 <= 8000.0;
    bool _1674 = isnan(_950);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(8000.0);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    float _1684 = _1670 * _1666;
    float _1686 = exp2(_1668);
    float _1688 = -_1684;
    float _1690 = _1688 + 1.0;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1684);
    float _1694 = _1682 * _1692;
    float _1696 = _1664;
    float _1698 = _1595;
    if (!_1656)
    {
        float _1700 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1710 = _1708 * 0.15915493667125701904296875;
        float _1712 = _1702 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        float _1716 = 1.0 / _1706;
        float _1718 = _1710 * 6.283185482025146484375;
        float _1720 = cos(_1718);
        float _1722 = _1714 * _1716;
        float _1724 = _1710 * 6.283185482025146484375;
        float _1726 = sin(_1724);
        float _1728 = _1720 * _1722;
        float _1730 = 1.0 / _1728;
        float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1734 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1732;
        float _1736 = 1.0 / _1734;
        float _1738 = _1726 * _1730;
        float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1742 = fma(_950, _1738, _1740);
        float _1744 = _1742 * _1736;
        float _1746 = precise::clamp(_1744, 0.0, 1.0);
        _1541 = _1730;
        _1696 = _1746;
        _1662 = _1734;
    }
    float _1748 = _1541;
    float _1750 = _1696;
    float _1752 = _1662;
    float _1754 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1756 = -_1561;
    float _1758 = _1756 + 1.0;
    float _1760 = -_1686;
    float _1762 = _1760 + 1.0;
    float _1764 = _1748;
    float _1766 = _1752;
    if (!_1479)
    {
        _1764 = 1.0;
    }
    float _1768 = _1764;
    float _1770 = _1758 * _1754;
    float _1772 = precise::clamp(_1770, 0.0, 1.0);
    float _1774 = _1768;
    if (_1479)
    {
        bool _1776 = _1595 >= _1557;
        bool _1778 = isnan(_1595);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan(_1557);
        bool _1784 = _1780 || _1782;
        float _1786 = float(_1784);
        _1774 = _1786;
    }
    float _1788 = _1774;
    float _1790 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1792 = _1788;
    if (_1091)
    {
        _1698 = 1.0;
    }
    float _1794 = _1698;
    float _1796 = _1794;
    if (!_1091)
    {
        int _1798 = _1135 << 4;
        int _1800 = _1798 + 2048;
        uint _1802 = uint(int(uint(_1800) >> uint(2)));
        uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
        int _1806 = int(_1802) & 3;
        float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
        int _1810 = int(_1802) + 1;
        uint _1812 = uint(int(uint(_1810) >> uint(2)));
        int _1814 = _1810 & 3;
        float _1816 = (*spvDescriptorSet0.vp_c15)._m0[int(_1812)][_1814];
        int _1818 = _1800 + 8;
        uint _1820 = uint(int(uint(_1818) >> uint(2)));
        uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
        int _1824 = int(_1820) & 3;
        float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
        int _1828 = int(_1820) + 1;
        uint _1830 = uint(int(uint(_1828) >> uint(2)));
        int _1832 = _1828 & 3;
        float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
        float _1836 = _906 * _1816;
        float _1838 = fma(_476, _1808, _1836);
        float _1840 = fma(_478, _1826, _1838);
        float _1842 = _1840 + _1834;
        float _1844 = precise::clamp(_1842, 0.0, 1.0);
        float _1846 = -_1844;
        float _1848 = _1846 + _1589;
        float _1850 = fma(_1848, 500.0, 1.5);
        float _1852 = exp2(_1850);
        float _1854 = 0.0 + _1852;
        float _1856 = precise::clamp(_1854, 0.0, 1.0);
        _1796 = _1856;
    }
    float _1858 = _1796;
    float _1860 = _1788 * _1858;
    float _1862 = _1790 * _1597;
    float _1864 = -_1772;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1868 = -_1790;
    float _1870 = _1868 + 1.0;
    bool _1872 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1874 = isnan(_912);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1880 = _1876 || _1878;
    float _1882 = _1608 * _1862;
    float _1884 = -_1860;
    float _1886 = fma(_1884, _1866, 1.0);
    float _1888 = precise::clamp(_1886, 0.0, 1.0);
    float _1890 = _1618 * _1862;
    float _1892 = _1608 * _1870;
    float _1894 = fma(_1614, _1882, _1602);
    float _1896 = fma(_1616, _1882, _1604);
    float _1898 = _1888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1900 = fma(_1608, _1890, _1606);
    float _1902 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _1898;
    float _1904 = _1866;
    float _1906 = _1882;
    float _1908 = _1888;
    float _1910 = _1870;
    if (!_1880)
    {
        _1766 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1912 = _1766;
    float _1914 = _1912;
    float _1916 = _1912;
    if (!_1880)
    {
        _1904 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1918 = _1904;
    out.m_85.x = _1894;
    out.m_85.y = _1896;
    out.m_85.z = _1900;
    out.m_85.w = _1892;
    float _1920 = _1918;
    float _1922 = _1918;
    if (!_1880)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1924 = _1792;
    float _1926 = _1924;
    float _1928 = _1924;
    if (!_1880)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1930 = _1906;
    float _1932 = _1930;
    float _1934 = _1930;
    if (!_1880)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1936 = _1908;
    float _1938 = _1936;
    float _1940 = _1936;
    if (!_1880)
    {
        _1910 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1942 = _1910;
    bool _1944 = !_1880;
    float _1946 = _1942;
    float _1948 = _1942;
    if (!_1944)
    {
        bool _1950 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1952 = isnan(_912);
        bool _1954 = _1950 || _1952;
        bool _1956 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1958 = _1954 || _1956;
        if (!_1958)
        {
            float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1962 = _912 + _1960;
            float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1966 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1964;
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1970 = _1968 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1972 = 1.0 / _1966;
            float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1976 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1990 = _1962 * _1972;
            float _1992 = precise::clamp(_1990, 0.0, 1.0);
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1996 = _1994 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1998 = fma(_1992, _1970, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2000 = fma(_1992, _1996, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2002 = fma(_1992, _1976, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2004 = fma(_1992, _1980, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2006 = fma(_1992, _1984, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2008 = fma(_1992, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1922 = _1998;
            _1940 = _2006;
            _1916 = _2002;
            _1934 = _2004;
            _1928 = _2000;
            _1948 = _2008;
            _2010 = true;
        }
        else
        {
            bool _2012 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2014 = isnan(_912);
            bool _2016 = _2012 || _2014;
            bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2020 = _2016 || _2018;
            if (!_2020)
            {
                _1914 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2022 = _1914;
            _1916 = _2022;
            if (!_2020)
            {
                _1920 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2024 = _1920;
            _1922 = _2024;
            if (!_2020)
            {
                _1926 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2026 = _1926;
            _1928 = _2026;
            if (!_2020)
            {
                _1932 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2028 = _1932;
            _1934 = _2028;
            if (!_2020)
            {
                _1938 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2030 = _1938;
            _1940 = _2030;
            if (!_2020)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2032 = _1946;
            bool _2034 = !_2020;
            _1948 = _2032;
            if (!_2034)
            {
                bool _2036 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2038 = isnan(_912);
                bool _2040 = _2036 || _2038;
                bool _2042 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2044 = _2040 || _2042;
                if (!_2044)
                {
                    float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2048 = _912 + _2046;
                    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2050;
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2056 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2058 = 1.0 / _2052;
                    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2062 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2076 = _2048 * _2058;
                    float _2078 = precise::clamp(_2076, 0.0, 1.0);
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2084 = fma(_2078, _2056, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2086 = fma(_2078, _2082, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2088 = fma(_2078, _2062, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2090 = fma(_2078, _2066, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2092 = fma(_2078, _2070, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2094 = fma(_2078, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1922 = _2084;
                    _1940 = _2092;
                    _1916 = _2088;
                    _1934 = _2090;
                    _1928 = _2086;
                    _1948 = _2094;
                    _2010 = true;
                }
                else
                {
                    _1922 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1940 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1916 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1934 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1928 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2010 = false;
    float _2096 = _1922;
    float _2098 = _1940;
    float _2100 = _1916;
    float _2102 = _1934;
    float _2104 = _1928;
    float _2106 = _1948;
    float _2108 = fma(_740, -0.5, 0.5);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = -_2096;
    float _2114 = _2112 + _2098;
    float _2116 = _1902 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2118 = -_2100;
    float _2120 = _2118 + _2102;
    out.m_87.x = 0.0;
    float _2122 = fma(_2110, _2114, _2096);
    float _2124 = fma(_2110, _2120, _2100);
    out.m_61.x = _2116;
    float _2126 = -_2104;
    float _2128 = _2126 + _2106;
    float _2130 = _2122 * 0.586610972881317138671875;
    bool _2132 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2134 = fma(_2110, _2128, _2104);
    float _2136 = fma(_2124, 0.298911988735198974609375, _2130);
    bool _2138 = _1750 > 0.0;
    bool _2140 = isnan(_1750);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = fma(_2134, 0.114477999508380889892578125, _2136);
    float _2150 = -_2148;
    float _2152 = _2124 + _2150;
    float _2154 = -_2148;
    float _2156 = _2122 + _2154;
    float _2158 = -_2148;
    float _2160 = _2134 + _2158;
    float _2162 = fma(_2152, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    float _2164 = fma(_2156, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    float _2166 = fma(_2160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2148);
    bool _2168 = !_2132;
    if (!_2168)
    {
        float _2170 = -_856;
        float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2174 = -_858;
        float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2178 = -_860;
        float _2180 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2182 = _2172 * _2172;
        float _2184 = fma(_2176, _2176, _2182);
        float _2186 = fma(_2180, _2180, _2184);
        float _2188 = sqrt(_2186);
        float _2190 = rsqrt(_2186);
        float _2192 = -_2188;
        float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2196 = _2194 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        float _2200 = _2176 * _2190;
        float _2202 = _2172 * _2190;
        float _2204 = abs(_2198);
        float _2206 = log2(_2204);
        float _2208 = _2180 * _2190;
        float _2210 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2212 = _740 * _2202;
        float _2214 = -_2202;
        float _2216 = -_2210;
        float _2218 = fma(_2214, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2216);
        float _2220 = fma(_738, _2200, _2212);
        float _2222 = -_2208;
        float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2218);
        float _2226 = fma(_758, _2208, _2220);
        float _2228 = precise::clamp(_2226, 0.0, 1.0);
        float _2230 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2232 = _2224 + _2230;
        float _2234 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2236 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2238 = precise::clamp(_2236, 0.0, 1.0);
        float _2240 = exp2(_2234);
        float _2242 = _2240 * _2238;
        float _2244 = _2228 * _2242;
        float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2248 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2250 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2246;
        out.m_87.y = _2248;
        out.m_87.z = _2250;
    }
    out.m_89.x = _2162;
    out.m_89.y = _2164;
    out.m_89.z = _2166;
    if (_2146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2252;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

