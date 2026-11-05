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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_101 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_81 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_85 [[attribute(8)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5760 = false;
    bool _4537 = false;
    bool _1102 = false;
    bool _988 = false;
    bool _884 = false;
    bool _758 = false;
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6045 = as_type<float>(_136);
        out.gl_Position.z = _6045;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6114 = as_type<float>(_174);
        out.gl_Position.z = _6114;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_65.w;
    float _178 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_63.x;
    float _192 = in.m_63.y;
    float _194 = in.m_63.z;
    float _196 = in.m_58.x;
    float _198 = in.m_58.y;
    float _200 = in.m_58.z;
    float _202 = 0.0;
    float _204 = _178;
    if (!_188)
    {
        float _206 = _178 * _178;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = _210;
    if (!_188)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    bool _218 = !_188;
    float _220 = _216;
    if (!_218)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _178 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _178);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _250;
    }
    float _252 = _220;
    bool _254 = !_188;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _178 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _204 = _274;
    }
    float _276 = _204;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _190, _280);
    float _288 = fma(_276, _192, _282);
    float _290 = fma(_276, _194, _284);
    float _292 = fma(_286, _176, _196);
    float _294 = fma(_288, _176, _198);
    float _296 = fma(_290, _176, _200);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_67.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_120);
        float _322 = 1.0 / _320;
        float _324 = _154 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _330;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _354;
    float _358 = 1.0 / _338;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = _326 + _360;
    bool _364 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _366 = isnan(_326);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _378 = isnan(_326);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = 1.0 / _334;
    float _390 = _362 * _340;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _326 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    bool _400 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _402 = isnan(_326);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    bool _412 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_326);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = 1.0 / _348;
    float _428 = _394 * _358;
    bool _430 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _432 = isnan(_326);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = _326 + _442;
    bool _446 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _448 = isnan(_326);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -_440;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _352;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _466 = _326 + _464;
    float _468 = _444 * _388;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _472 = _326 + _470;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _476 = 1.0 / _356;
    float _478 = _466 * _426;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _482 = _326 + _480;
    float _484 = _456 * _460;
    float _486 = -_456;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = 1.0 / _344;
    float _496 = _374 * _488;
    float _498 = fma(_492, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = _472 * _476;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _504 = _326 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _504 * _462;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _512;
    float _516 = fma(_508, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _518 = _482 * _494;
    float _520 = -_374;
    float _522 = _520 + 1.0;
    float _524 = fma(_514, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = -_386;
    float _528 = _526 + 1.0;
    float _530 = _386 * _522;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = _410 * _528;
    bool _538 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _540 = isnan(_326);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = -_410;
    float _556 = _554 + 1.0;
    bool _558 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _560 = isnan(_326);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = fma(_534, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _572 = fma(_552, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _574 = _422 * _556;
    float _576 = -_422;
    float _578 = _576 + 1.0;
    float _580 = -_568;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = _568 * _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _590;
    float _594 = _548 * _582;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _596;
    float _600 = fma(_586, _468, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_592, _468, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _604 = _424 * _594;
    float _606 = fma(_598, _468, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = _524 * _594;
    float _614 = _516 * _594;
    float _616 = -_548;
    float _618 = _616 + 1.0;
    float _620 = fma(_610, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].x, _612);
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].y, _614);
    float _634 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].z, _604);
    float _636 = fma(_572, _588, _630);
    float _638 = fma(_570, _588, _632);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _640;
    float _644 = fma(_498, _588, _634);
    float _646 = fma(_628, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _648 = fma(_624, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _650;
    float _654 = fma(_642, _518, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _656 = fma(_606, _574, _636);
    float _658 = fma(_602, _574, _638);
    float _660 = fma(_600, _574, _644);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _670 = fma(_652, _518, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _672 = fma(_620, _536, _656);
    float _674 = fma(_648, _536, _658);
    float _676 = fma(_646, _536, _660);
    float _678 = fma(_664, _518, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _680 = fma(_668, _510, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = fma(_654, _530, _672);
    float _692 = fma(_670, _530, _674);
    float _694 = fma(_678, _530, _676);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _696;
    float _700 = fma(_684, _510, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _702;
    float _706 = fma(_688, _510, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _708;
    float _712 = fma(_680, _496, _690);
    float _714 = fma(_698, _500, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _716 = fma(_704, _500, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _718 = fma(_710, _500, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _720 = fma(_700, _496, _692);
    float _722 = fma(_706, _496, _694);
    float _724 = fma(_714, _484, _712);
    float _726 = fma(_716, _484, _720);
    float _728 = fma(_718, _484, _722);
    float _730 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].x, _724);
    float _732 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].y, _726);
    float _734 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].z, _728);
    bool _736 = !_474;
    float _738 = _670;
    float _756;
    if (!_736)
    {
        float _740 = in.m_67.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].x, _154);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_120);
        float _762 = 1.0 / _760;
        float _764 = _154 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = in.m_65.x;
    float _770 = in.m_65.y;
    float _772 = in.m_65.z;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _776 = _766 + _774;
    bool _778 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _780 = isnan(_766);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _790;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _796 = -_788;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _792;
    float _802 = _734 * _772;
    float _804 = _732 * _770;
    float _806 = _730 * _768;
    float _808 = _776 * _800;
    bool _810 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _812 = isnan(_766);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _830;
    float _834 = _820 * _798;
    float _836 = fma(_824, _808, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _838 = fma(_832, _808, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _840 = fma(_828, _808, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _842 = -_820;
    float _844 = _842 + 1.0;
    float _846 = _836 * _834;
    float _848 = _838 * _834;
    float _850 = _840 * _834;
    float _852 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].x, _846);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].y, _848);
    float _856 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].z, _850);
    float _858 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].x, _852);
    float _860 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].y, _854);
    float _862 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].z, _856);
    bool _864 = !_794;
    float _882;
    if (!_864)
    {
        float _866 = in.m_67.x;
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _870 = _866 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _874 = _872 * _868;
        float _876 = floor(_874);
        float _878 = -_876;
        float _880 = _874 + _878;
        _882 = _880;
        _884 = true;
    }
    else
    {
        float _886 = float(_120);
        float _888 = 1.0 / _886;
        float _890 = _154 * _888;
        _882 = _890;
    }
    _884 = false;
    float _892 = _882;
    bool _894 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_892);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _912 = isnan(_892);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _928 = _892 + _926;
    float _930 = -_904;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _936 = 1.0 / _908;
    float _938 = _920 * _932;
    float _940 = -_920;
    float _942 = _940 + 1.0;
    float _944 = _924 * _936;
    float _946 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = fma(_944, _928, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _950 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _948 * _938;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _960 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _962 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _958);
    float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _964;
    out.m_69.y = _956;
    out.m_69.z = _952;
    out.m_69.w = _966;
    bool _968 = !_934;
    float _986;
    if (!_968)
    {
        float _970 = in.m_67.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[11].z, _154);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_120);
        float _992 = 1.0 / _990;
        float _994 = _154 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1000 = _996 + _998;
    bool _1002 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_996);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1014;
    bool _1018 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1020 = isnan(_996);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1012;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1034;
    float _1038 = 1.0 / _1016;
    bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1042 = _1028 * _1032;
    float _1044 = -_1028;
    float _1046 = _1044 + 1.0;
    float _1048 = _1000 * _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1050;
    float _1054 = fma(_1036, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1056;
    float _1060 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1062 = _1054 * _1042;
    float _1064 = fma(_1058, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1066 = _1060 * _1042;
    float _1068 = _1064 * _1042;
    float _1070 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1062);
    float _1072 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1074 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1066);
    float _1076 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1070);
    float _1078 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1072);
    float _1080 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1074);
    bool _1082 = !_1040;
    float _1100;
    if (!_1082)
    {
        float _1084 = in.m_67.x;
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1088 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _1092 = _1090 * _1086;
        float _1094 = floor(_1092);
        float _1096 = -_1094;
        float _1098 = _1092 + _1096;
        _1100 = _1098;
        _1102 = true;
    }
    else
    {
        float _1104 = float(_120);
        float _1106 = 1.0 / _1104;
        float _1108 = _154 * _1106;
        _1100 = _1108;
    }
    _1102 = false;
    float _1110 = _1100;
    float _1112 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1114 = int(_1112);
    float _1116 = in.m_67.x;
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1120 = in.m_67.y;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1124 = _1122 != 0;
    float _1126 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1128 = int(_1126);
    float _1130 = in.m_67.z;
    float _1132 = float(_1114);
    float _1134 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1136 = int(_1134);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1142 = float(_1128);
    float _1144 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1146 = int(_1144);
    if (_1124)
    {
        _738 = _1116;
    }
    float _1148 = _738;
    float _1150 = _1148;
    if (!_1124)
    {
        _1150 = _1120;
    }
    float _1152 = _1150;
    float _1154 = 1.0 / _1132;
    float _1156 = float(_1136);
    float _1158 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1160 = int(_1158);
    float _1162 = float(uint(_1146));
    bool _1164 = _1146 == 0;
    float _1166 = 1.0 / _1142;
    float _1168 = _1154 * _154;
    float _1170 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1172 = int(_1170);
    float _1174 = float(uint(_1160));
    bool _1176 = _1160 == 0;
    float _1178 = 1.0 / _1162;
    float _1180 = _1166 * _154;
    float _1182 = _1166;
    if (_1124)
    {
        _1182 = 1.0;
    }
    float _1184 = _1182;
    float _1186 = _1184;
    if (!_1124)
    {
        _1186 = 7.345489978790283203125;
    }
    float _1188 = _1186;
    float _1190 = trunc(_1168);
    int _1192 = int(_1190);
    float _1194 = _1188 * _1116;
    float _1196 = float(uint(_1172));
    float _1198 = 1.0 / _1156;
    int _1200 = as_type<int>(_1178) + (-2);
    float _1202 = 1.0 / _1174;
    float _1204 = float(uint(_1192));
    float _1206 = trunc(_1180);
    int _1208 = int(_1206);
    float _1210 = _1198 * _154;
    float _1212 = 1.0 / _1196;
    int _1214 = as_type<int>(_1202) + (-2);
    float _1216 = _1202;
    float _1218 = _1204;
    if (_1124)
    {
        _1216 = _1116;
    }
    float _1220 = _1216;
    float _1222 = _1220;
    if (!_1124)
    {
        _1222 = _1130;
    }
    float _1224 = _1222;
    float _1226 = float(uint(_1208));
    float _1228 = as_type<float>(_1200) * _1204;
    float _1230 = trunc(_1210);
    int _1232 = int(_1230);
    float _1234 = _1228;
    if (_1124)
    {
        _1218 = 1.0;
    }
    float _1236 = _1218;
    float _1238 = as_type<float>(_1214) * _1226;
    float _1240 = _1236;
    if (!_1124)
    {
        _1240 = 1.2345600128173828125;
    }
    float _1242 = _1240;
    int _1244 = as_type<int>(_1212) + (-2);
    float _1246 = trunc(_1228);
    float _1248 = precise::max(_1246, 0.0);
    uint _1251 = uint(_1248);
    float _1253 = _1152 * _1242;
    int _1255 = ~_1146;
    int _1257 = _1255 + 1;
    float _1259 = trunc(_1238);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    if (_1124)
    {
        _1234 = 1.0;
    }
    float _1265 = _1234;
    float _1267 = _1265;
    if (!_1124)
    {
        _1267 = 5.839270114898681640625;
    }
    float _1269 = _1267;
    float _1271 = float(uint(_1232));
    float _1273 = _1224 * _1269;
    int _1275 = ~_1160;
    int _1277 = _1275 + 1;
    int _1279 = _1257 * int(_1251);
    int _1281 = _1279 + _1192;
    float _1283 = as_type<float>(_1244) * _1271;
    float _1285 = floor(_1273);
    float _1287 = float(uint(_1281));
    int _1289 = _1277 * int(_1263);
    int _1291 = _1289 + _1208;
    float _1293 = trunc(_1283);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = as_type<float>(_1200) * _1287;
    float _1301 = float(uint(_1291));
    float _1303 = as_type<float>(_1214) * _1301;
    float _1305 = floor(_1253);
    int _1307 = ~_1172;
    int _1309 = _1307 + 1;
    float _1311 = float(_1146);
    int _1313 = _1309 * int(_1297);
    int _1315 = _1313 + _1232;
    float _1317 = floor(_1194);
    float _1319 = float(uint(_1315));
    float _1321 = trunc(_1303);
    float _1323 = precise::max(_1321, 0.0);
    uint _1325 = uint(_1323);
    float _1327 = -_1305;
    float _1329 = _1253 + _1327;
    float _1331 = as_type<float>(_1244) * _1319;
    float _1333 = -_1285;
    float _1335 = _1273 + _1333;
    float _1337 = float(_1192);
    int _1339 = ~_1160;
    int _1341 = _1339 + 1;
    float _1343 = trunc(_1299);
    float _1345 = precise::max(_1343, 0.0);
    uint _1347 = uint(_1345);
    float _1349 = -_1317;
    float _1351 = _1194 + _1349;
    bool _1353 = _1337 >= _1311;
    bool _1355 = isnan(_1337);
    bool _1357 = _1353 || _1355;
    bool _1359 = isnan(_1311);
    bool _1361 = _1357 || _1359;
    float _1363 = float(_1361);
    float _1365 = float(_1160);
    int _1367 = ~_1146;
    int _1369 = _1367 + 1;
    int _1371 = int(_1263) + int(_1325);
    float _1373 = trunc(_1363);
    int _1375 = int(_1373);
    int _1377 = _1341 * _1371;
    int _1379 = _1377 + _1208;
    int _1381 = int(_1251) + int(_1347);
    float _1383 = _1351 * _1311;
    float _1385 = _1365 * _1329;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1389 = _1387 != 0;
    float _1391 = trunc(_1331);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    int _1397 = _1369 * _1381;
    int _1399 = _1397 + _1192;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1403 = _1401 != 0;
    float _1405 = _1311 * _154;
    bool _1407 = uint(_1379) >= uint(_1160);
    float _1409 = float(_1208);
    float _1411 = float(_120);
    float _1413 = trunc(_1385);
    int _1415 = int(_1413);
    bool _1417 = uint(_1399) >= uint(_1146);
    bool _1419 = !_1389;
    int _1421 = _1419 ? 0 : 1;
    bool _1423 = !_1403;
    int _1425 = _1423 ? 0 : 1;
    bool _1427 = _1409 >= _1365;
    bool _1429 = isnan(_1409);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(_1365);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = trunc(_1383);
    int _1441 = int(_1439);
    int _1443 = abs(_1421);
    int _1445 = abs(_1425);
    bool _1447 = !_1417;
    int _1449 = _1447 ? 0 : (-1);
    bool _1451 = !_1407;
    int _1453 = _1451 ? 0 : (-1);
    float _1455 = 1.0 / _1411;
    int _1457 = ~_1381;
    int _1459 = _1457 + _1449;
    int _1461 = _1459 + 1;
    int _1463 = _1415 * _1445;
    int _1465 = _1463 + _1208;
    int _1467 = ~_1371;
    int _1469 = _1467 + _1453;
    int _1471 = _1469 + 1;
    int _1473 = int(_1297) + int(_1395);
    int _1475 = _1146 * _1461;
    int _1477 = _1475 + _1192;
    float _1479 = trunc(_1437);
    int _1481 = int(_1479);
    int _1483 = _1160 * _1471;
    int _1485 = _1483 + _1208;
    int _1487 = _1441 * _1443;
    int _1489 = _1487 + _1192;
    int _1491 = ~_1375;
    int _1493 = _1491 + 1;
    int _1495 = _1493 + 1;
    bool _1497 = !_1164;
    int _1499 = _1497 ? _1477 : (-1);
    bool _1501 = !_1176;
    int _1503 = _1501 ? _1485 : (-1);
    float _1505 = _1405 * _1455;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1509 = _1507 != 0;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1513 = _1511 != 0;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1517 = _1515 != 0;
    int _1519 = _1499 * _1495;
    int _1521 = ~_1172;
    int _1523 = _1521 + 1;
    float _1525 = _1455 * _154;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1529 = _1527 != 0;
    float _1531 = trunc(_1505);
    int _1533 = int(_1531);
    int _1535 = ~_1481;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    float _1541 = _1365 * _1525;
    bool _1543 = !_1513;
    int _1545 = _1543 ? 0 : 1;
    bool _1547 = !_1509;
    int _1549 = _1547 ? 0 : 1;
    int _1551 = _1539 * _1503;
    float _1553 = trunc(_1541);
    int _1555 = int(_1553);
    int _1557 = _1146 + (-1);
    int _1559 = abs(_1545);
    int _1561 = _1523 * _1473;
    int _1563 = _1561 + _1232;
    int _1565 = _1160 + (-1);
    int _1567 = _1375 * _1557;
    int _1569 = _1567 + _1519;
    int _1571 = abs(_1549);
    int _1573 = _1481 * _1565;
    int _1575 = _1573 + _1551;
    float _1577 = in.m_71.x;
    bool _1579 = uint(_1563) >= uint(_1172);
    int _1581 = _1569 * _1559;
    bool _1583 = !_1517;
    int _1585 = _1583 ? 0 : 1;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1589 = _1587 != 0;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1593 = _1591 != 0;
    int _1595 = _1533 * _1571;
    int _1597 = _1595 + _1581;
    bool _1599 = !_1529;
    int _1601 = _1599 ? 0 : 1;
    int _1603 = abs(_1585);
    bool _1605 = !_1593;
    int _1607 = _1605 ? 0 : 1;
    int _1609 = abs(_1601);
    float _1611 = float(_1172);
    float _1613 = float(_1232);
    int _1615 = _1489 * _1603;
    int _1617 = _1615 + _1597;
    int _1619 = abs(_1607);
    bool _1621 = _1613 >= _1611;
    bool _1623 = isnan(_1613);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan(_1611);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    int _1633 = _1575 * _1619;
    bool _1635 = !_1589;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = _1441 * _1609;
    int _1641 = _1639 + _1617;
    bool _1643 = !_1579;
    int _1645 = _1643 ? 0 : (-1);
    float _1647 = trunc(_1631);
    int _1649 = int(_1647);
    int _1651 = abs(_1637);
    float _1653 = float(uint(_1641));
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1661 = _1659 != 0;
    int _1663 = _1555 * _1651;
    int _1665 = _1663 + _1633;
    int _1667 = ~_1473;
    int _1669 = _1667 + _1645;
    int _1671 = _1669 + 1;
    float _1673 = as_type<float>(_1200) * _1653;
    bool _1675 = _1172 == 0;
    float _1677 = _1611 * _1525;
    bool _1679 = !_1657;
    int _1681 = _1679 ? 0 : 1;
    int _1683 = _1172 * _1671;
    int _1685 = _1683 + _1232;
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = _1611 * _1335;
    int _1695 = abs(_1681);
    int _1697 = ~_1649;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    bool _1703 = !_1675;
    float _1705 = _1703 ? as_type<float>(_1685) : as_type<float>(0xffffffffu /* nan */);
    int _1707 = ~_1146;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1677);
    int _1713 = int(_1711);
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1717 = _1715 != 0;
    int _1719 = _1701 * as_type<int>(_1705);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1723 = _1721 != 0;
    int _1725 = _1465 * _1695;
    int _1727 = _1725 + _1665;
    bool _1729 = !_1661;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = _1172 + (-1);
    int _1735 = _1709 * int(_1691);
    int _1737 = _1735 + _1641;
    int _1739 = abs(_1731);
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1743 = _1741 != 0;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1747 = _1745 != 0;
    int _1749 = _1649 * _1733;
    int _1751 = _1749 + _1719;
    float _1753 = float(uint(_1737));
    int _1755 = _1415 * _1739;
    int _1757 = _1755 + _1727;
    float _1759 = _1705;
    float _1761 = as_type<float>(_1609);
    bool _1763 = _1723;
    if (!_1717)
    {
        _1759 = _1577;
    }
    float _1765 = _1759;
    float _1767 = trunc(_1693);
    int _1769 = int(_1767);
    bool _1771 = !_1747;
    int _1773 = _1771 ? 0 : 1;
    float _1775 = as_type<float>(_1200) * _1753;
    float _1777 = _1765;
    if (!_1717)
    {
        _1761 = _1765;
    }
    float _1779 = _1761;
    bool _1781 = !_1723;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = _1783;
    float _1787 = _1779;
    if (_1717)
    {
        _1777 = _1577;
    }
    float _1789 = _1777;
    float _1791 = trunc(_1775);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = float(uint(_1757));
    bool _1799 = !_1743;
    int _1801 = _1799 ? 0 : 1;
    int _1803 = abs(_1773);
    float _1805 = as_type<float>(_1214) * _1797;
    int _1807 = abs(_1783);
    float _1809 = _1789;
    if (_1717)
    {
        float _1811 = -_1789;
        float _1813 = _1811 + 1.0;
        _1785 = as_type<int>(_1813);
    }
    int _1815 = _1785;
    if (_1717)
    {
        bool _1817 = _1116 > 0.5;
        _1763 = _1817;
    }
    bool _1819 = _1763;
    int _1821 = abs(_1801);
    int _1823 = _1769 * _1807;
    int _1825 = _1823 + _1232;
    float _1827 = trunc(_1805);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    int _1833 = _1769;
    if (_1717)
    {
        float _1835 = _1819 ? as_type<float>(_1815) : _1789;
        _1787 = _1835;
    }
    float _1837 = _1787;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1841 = _1839 != 0;
    int _1843 = _1751 * _1803;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1847 = _1845 != 0;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : 1;
    int _1853 = _1713 * _1821;
    int _1855 = _1853 + _1843;
    bool _1857 = !_1847;
    int _1859 = _1857 ? 0 : 1;
    float _1861 = in.m_71.y;
    int _1863 = int(_1691) + int(_1795);
    int _1865 = ~_1146;
    int _1867 = _1865 + 1;
    int _1869 = abs(_1851);
    int _1871 = abs(_1859);
    int _1873 = _1867 * _1863;
    int _1875 = _1873 + _1641;
    int _1877 = ~_1160;
    int _1879 = _1877 + 1;
    int _1881 = _1825 * _1869;
    int _1883 = _1881 + _1855;
    int _1885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1887 = _1885 != 0;
    int _1889 = _1879 * int(_1831);
    int _1891 = _1889 + _1757;
    float _1893 = in.m_67.w;
    int _1895 = _1769 * _1871;
    int _1897 = _1895 + _1883;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1901 = _1899 != 0;
    float _1903 = float(uint(_1891));
    float _1905 = float(uint(_1897));
    bool _1907 = uint(_1875) >= uint(_1146);
    float _1909 = as_type<float>(_1214) * _1903;
    int _1911 = ~_1172;
    int _1913 = _1911 + 1;
    float _1915 = as_type<float>(_1244) * _1905;
    bool _1917 = !_1907;
    int _1919 = _1917 ? 0 : (-1);
    float _1921 = as_type<float>(_1879);
    int _1923 = _1855;
    if (_1887)
    {
        float _1925 = -_1789;
        float _1927 = _1925 + 1.0;
        _1833 = as_type<int>(_1927);
    }
    int _1929 = _1833;
    bool _1931 = _1130 > 0.5;
    float _1933 = trunc(_1909);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    if (!_1887)
    {
        _1921 = _1789;
    }
    float _1939 = _1921;
    float _1941 = _1939;
    if (_1901)
    {
        float _1943 = -_1789;
        float _1945 = _1943 + 1.0;
        _1923 = as_type<int>(_1945);
    }
    int _1947 = _1923;
    if (_1887)
    {
        float _1949 = _1931 ? as_type<float>(_1929) : _1789;
        _1941 = _1949;
    }
    float _1951 = _1941;
    float _1953 = -_1861;
    float _1955 = _1953 + 1.0;
    bool _1957 = _1120 > 0.5;
    int _1959 = ~_1863;
    int _1961 = _1959 + _1919;
    int _1963 = _1961 + 1;
    float _1965 = trunc(_1915);
    float _1967 = precise::max(_1965, 0.0);
    uint _1969 = uint(_1967);
    float _1971 = _1861;
    if (_1901)
    {
        float _1973 = _1957 ? as_type<float>(_1947) : _1789;
        _1809 = _1973;
    }
    float _1975 = _1809;
    bool _1977 = _1893 > 0.5;
    int _1979 = _1146 * _1963;
    int _1981 = _1979 + _1641;
    int _1983 = _1957 ? as_type<int>(_1955) : as_type<int>(_1861);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1987 = _1985 != 0;
    int _1989 = int(_1831) + int(_1937);
    float _1991 = _1987 ? as_type<float>(_1983) : _1861;
    int _1993 = ~_1160;
    int _1995 = _1993 + 1;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1999 = _1997 != 0;
    int _2001 = _1913 * int(_1969);
    int _2003 = _2001 + _1897;
    int _2005 = _1977 ? as_type<int>(_1955) : as_type<int>(_1861);
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2009 = _2007 != 0;
    float _2011 = float(uint(_2003));
    int _2013 = _1995 * _1989;
    int _2015 = _2013 + _1757;
    bool _2017 = _1146 == 0;
    float _2019 = _2009 ? as_type<float>(_2005) : _1861;
    float _2021 = as_type<float>(_1244) * _2011;
    bool _2023 = uint(_2015) >= uint(_1160);
    bool _2025 = !_2017;
    int _2027 = _2025 ? _1981 : (-1);
    if (_1999)
    {
        float _2029 = _1931 ? _1955 : _1861;
        _1971 = _2029;
    }
    float _2031 = _1971;
    float _2033 = trunc(_2021);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = !_2023;
    int _2041 = _2039 ? 0 : (-1);
    int _2043 = _2027 & 3;
    bool _2045 = _2043 != 0;
    int _2047 = _2027 & 3;
    bool _2049 = _2047 != 0;
    int _2051 = ~_1989;
    int _2053 = _2051 + _2041;
    int _2055 = _2053 + 1;
    bool _2057 = uint(_2043) >= 2u;
    int _2059 = _2049 ? 0 : 1;
    int _2061 = _1160 * _2055;
    int _2063 = _2061 + _1757;
    bool _2065 = uint(_2043) > 1u;
    int _2067 = _2057 ? 0 : 1;
    bool _2069 = _2043 != 3;
    bool _2071 = _1160 == 0;
    int _2073 = ~_2059;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2071;
    int _2081 = _2079 ? _2063 : (-1);
    int _2083 = ~_1172;
    int _2085 = _2083 + 1;
    int _2087 = int(_1969) + int(_2037);
    int _2089 = _2077;
    if (!_2065)
    {
        int _2091 = ~_2059;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    int _2097 = _2081 & 3;
    bool _2099 = _2097 != 0;
    int _2101 = _2085 * _2087;
    int _2103 = _2101 + _1897;
    int _2105 = ~_2067;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = _2109;
    if (_2069)
    {
        int _2113 = ~_2067;
        int _2115 = _2113 + 1;
        _2111 = _2115;
    }
    int _2117 = _2111;
    bool _2119 = uint(_2097) >= 2u;
    int _2121 = _2099 ? 0 : 1;
    int _2123 = _2119 ? 0 : 1;
    bool _2125 = uint(_2103) >= uint(_1172);
    bool _2127 = _2097 != 3;
    float _2129 = float(uint(_1489));
    bool _2131 = !_2125;
    int _2133 = _2131 ? 0 : (-1);
    bool _2135 = uint(_2097) > 1u;
    float _2137 = as_type<float>(_1200) * _2129;
    float _2139 = float(uint(_1465));
    int _2141 = ~_2087;
    int _2143 = _2141 + _2133;
    int _2145 = _2143 + 1;
    int _2147 = ~_2123;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2137);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    float _2159 = as_type<float>(_1214) * _2139;
    int _2161 = _2151;
    if (_2127)
    {
        int _2163 = ~_2123;
        int _2165 = _2163 + 1;
        _2161 = _2165;
    }
    int _2167 = _2161;
    float _2169 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2171 = ~_2121;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2179 = _2177 != 0;
    int _2181 = _2175;
    if (!_2135)
    {
        int _2183 = ~_2121;
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    int _2189 = _1172 * _2145;
    int _2191 = _2189 + _1897;
    float _2193 = trunc(_2159);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    bool _2199 = !_2179;
    int _2201 = _2199 ? 0 : 1;
    float _2203 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2205 = ~_1146;
    int _2207 = _2205 + 1;
    float _2209 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2169);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2213 = _2211 != 0;
    float _2215 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2203);
    int _2217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2219 = _2217 != 0;
    float _2221 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2223 = !_1675;
    int _2225 = _2223 ? _2191 : (-1);
    float _2227 = float(uint(_1825));
    int _2229 = ~_1160;
    int _2231 = _2229 + 1;
    int _2233 = _2207 * int(_2157);
    int _2235 = _2233 + _1489;
    bool _2237 = !_2213;
    int _2239 = _2237 ? 0 : 1;
    float _2241 = as_type<float>(_1244) * _2227;
    int _2243 = _2225 & 3;
    bool _2245 = _2243 != 0;
    int _2247 = _2231 * int(_2197);
    int _2249 = _2247 + _1465;
    float _2251 = float(uint(_2235));
    float _2253 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2221);
    float _2255 = trunc(_2241);
    float _2257 = precise::max(_2255, 0.0);
    uint _2259 = uint(_2257);
    int _2261 = _2245 ? 0 : 1;
    float _2263 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2265 = float(uint(_2249));
    float _2267 = as_type<float>(_1200) * _2251;
    bool _2269 = uint(_2243) >= 2u;
    float _2271 = _1116 * 2.0;
    int _2273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2275 = _2273 != 0;
    float _2277 = as_type<float>(_1214) * _2265;
    int _2279 = ~_1172;
    int _2281 = _2279 + 1;
    float _2283 = floor(_2271);
    int _2285 = _2269 ? 0 : 1;
    bool _2287 = _2243 != 3;
    int _2289 = ~_2285;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = _2281 * int(_2259);
    int _2297 = _2295 + _1825;
    float _2299 = trunc(_2277);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2307 = float(uint(_2297));
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2311 = ~_2261;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2319 = _2225 >> 31;
    float _2321 = as_type<float>(_1244) * _2307;
    int _2323 = _2293;
    int _2325 = as_type<int>(_2263);
    int _2327 = _2315;
    int _2329 = as_type<int>(_2215);
    if (_2287)
    {
        int _2331 = ~_2285;
        int _2333 = _2331 + 1;
        _2323 = _2333;
    }
    int _2335 = _2323;
    float _2337 = -_2309;
    float _2339 = fma(_2263, 2.0, _2337);
    bool _2341 = uint(_2243) > 1u;
    float _2343 = trunc(_2321);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    bool _2349 = !_2219;
    int _2351 = _2349 ? 0 : 1;
    float _2353 = fma(_2305, -2.0, _2317);
    if (_2275)
    {
        _2325 = 0;
    }
    int _2355 = _2325;
    float _2357 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2215);
    bool _2359 = _2283 > 0.0;
    float _2361 = -_154;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2339);
    int _2365 = _2355;
    if (!_2275)
    {
        _2365 = 1;
    }
    int _2367 = _2365;
    float _2369 = trunc(_2267);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = int(_2197) + int(_2303);
    float _2377 = _2357 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2379 = ~_1160;
    int _2381 = _2379 + 1;
    if (!_2341)
    {
        int _2383 = ~_2261;
        int _2385 = _2383 + 1;
        _2327 = _2385;
    }
    int _2387 = _2327;
    bool _2389 = _2283 >= 0.0;
    bool _2391 = isnan(_2283);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2209);
    int _2401 = int(_2259) + int(_2347);
    float _2403 = _1120 * 2.0;
    int _2405 = ~_1146;
    int _2407 = _2405 + 1;
    float _2409 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2253);
    int _2411 = _2397 ? 0 : 1;
    float _2413 = _2399 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2415 = _2367 != 1;
    float _2417 = floor(_2403);
    int _2419 = int(_2157) + int(_2373);
    float _2421 = _2409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2423 = ~_2411;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    int _2429 = _2407 * _2419;
    int _2431 = _2429 + _1489;
    int _2433 = _2427;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].w;
    if (!_2359)
    {
        int _2437 = ~_2411;
        int _2439 = _2437 + 1;
        _2433 = _2439;
    }
    int _2441 = _2433;
    int _2443 = _2381 * _2375;
    int _2445 = _2443 + _1465;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2451 = ~_1172;
    int _2453 = _2451 + 1;
    bool _2455 = uint(_2431) >= uint(_1146);
    float _2457 = 1.0 / _2449;
    bool _2459 = uint(_2445) >= uint(_1160);
    float _2461 = _1130 * 2.0;
    float _2463 = 0.0;
    if (!_2415)
    {
        _2463 = _1120;
    }
    float _2465 = _2463;
    bool _2467 = !_2455;
    int _2469 = _2467 ? 0 : (-1);
    float _2471 = 0.0;
    float _2473 = _2465;
    if (!_2415)
    {
        _2471 = _2465;
    }
    float _2475 = _2471;
    int _2477 = _2453 * _2401;
    int _2479 = _2477 + _1825;
    float _2481 = _2475;
    if (!_2415)
    {
        _2435 = _1130;
    }
    float _2483 = _2435;
    float _2485 = floor(_2461);
    float _2487 = 0.0;
    float _2489 = _2483;
    if (!_2415)
    {
        _2487 = _1130;
    }
    float _2491 = _2487;
    bool _2493 = _2417 > 0.0;
    float _2495 = _2491;
    if (_2415)
    {
        _2481 = _1116;
    }
    float _2497 = _2481;
    if (_2415)
    {
        _2473 = _1116;
    }
    float _2499 = _2473;
    if (_2415)
    {
        _2489 = _1120;
    }
    float _2501 = _2489;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2505 = _1110 + _2503;
    if (_2415)
    {
        _2495 = _1120;
    }
    float _2507 = _2495;
    bool _2509 = uint(_2479) >= uint(_1172);
    bool _2511 = !_2459;
    int _2513 = _2511 ? 0 : (-1);
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1138);
    bool _2517 = _2417 >= 0.0;
    bool _2519 = isnan(_2417);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(0.0);
    bool _2525 = _2521 || _2523;
    float _2527 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2529 = !_2509;
    int _2531 = _2529 ? 0 : (-1);
    float _2533 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2515);
    int _2535 = _2525 ? 0 : 1;
    bool _2537 = !_2045;
    int _2539 = _2537 ? 0 : 1;
    int _2541 = _2081 & 3;
    bool _2543 = _2541 != 0;
    int _2545 = _2225 & 3;
    bool _2547 = _2545 != 0;
    if (_2275)
    {
        _2329 = 0;
    }
    int _2549 = _2329;
    int _2551 = _2549;
    if (!_2275)
    {
        _2551 = 2;
    }
    int _2553 = _2551;
    int _2555 = ~_2535;
    int _2557 = _2555 + 1;
    int _2559 = _2557 + 1;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2563 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2561;
    int _2565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2567 = _2565 != 0;
    int _2569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2571 = _2569 != 0;
    int _2573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2575 = _2573 != 0;
    int _2577 = _2559;
    if (!_2493)
    {
        int _2579 = ~_2535;
        int _2581 = _2579 + 1;
        _2577 = _2581;
    }
    int _2583 = _2577;
    float _2585 = _2563 * _2457;
    bool _2587 = _2485 >= 0.0;
    bool _2589 = isnan(_2485);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = _1120 + _1130;
    bool _2599 = _1110 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2601 = isnan(_1110);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2607 = _2603 || _2605;
    float _2609 = float(_2607);
    float _2611 = fma(_2585, _2505, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2613 = _2595 ? 0 : 1;
    float _2615 = _2597 + (-1.0);
    bool _2617 = _2553 != 2;
    float _2619 = -_2609;
    float _2621 = _2619 + 1.0;
    bool _2623 = !_2547;
    int _2625 = _2623 ? 0 : 1;
    bool _2627 = _1110 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2629 = isnan(_1110);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    bool _2639 = _2485 > 0.0;
    float _2641 = _1116 + _1120;
    int _2643 = ~_2613;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    float _2649 = _2637 * _2621;
    bool _2651 = !_2543;
    int _2653 = _2651 ? 0 : 1;
    float _2655 = _2641 + (-1.0);
    float _2657 = -_2637;
    float _2659 = _2657 + 1.0;
    float _2661 = _2611 * _2649;
    float _2663 = _2637;
    int _2665 = _2647;
    if (_2617)
    {
        _2663 = _1116;
    }
    float _2667 = _2663;
    float _2669 = fma(_2655, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2671 = _2667;
    if (!_2617)
    {
        _2671 = _1130;
    }
    float _2673 = _2671;
    float _2675 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2661);
    float _2677 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_2639)
    {
        int _2679 = ~_2613;
        int _2681 = _2679 + 1;
        _2665 = _2681;
    }
    int _2683 = _2665;
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2687 = _2377 + _2685;
    bool _2689 = _2097 != 3;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _2421 + _2691;
    bool _2695 = _2043 != 3;
    float _2697 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2701 = fma(_2609, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2675);
    bool _2703 = !_2689;
    int _2705 = _2703 ? 0 : (-1);
    float _2707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2709 = _2413 + _2707;
    bool _2711 = _2243 != 3;
    float _2713 = _2693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2715 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2717 = -_2699;
    float _2719 = fma(_2697, 2.0, _2717);
    float _2721 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2723 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2713);
    float _2725 = _2715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2727 = _2081 >> 31;
    float _2729 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2731 = _2027 >> 31;
    float _2733 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2735 = _2727 & 3;
    float _2737 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2723);
    int _2739 = _2731 & 3;
    float _2741 = _2701 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2743 = _2319 & 3;
    float _2745 = -_154;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2719);
    int _2749 = _2081 + _2735;
    bool _2751 = !_2711;
    int _2753 = _2751 ? 0 : (-1);
    out.m_73.x = _2729;
    out.m_73.y = _2725;
    out.m_73.z = _2733;
    out.m_73.w = _2741;
    int _2755 = _2027 + _2739;
    bool _2757 = _2737 >= 0.0;
    int _2759 = _2225 + _2743;
    int _2761 = _2749 >> 2;
    int _2763 = _2755 >> 2;
    int _2765 = _2761 << 4;
    int _2767 = _2765 + 512;
    float _2769 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2771 = _2763 << 4;
    int _2773 = _2771 + 368;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _2777 = uint(int(uint(_2767) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    float _2793 = _2775;
    if (_2757)
    {
        out.m_61.x = 0.0;
    }
    bool _2795 = !_2571;
    int _2797 = _2795 ? 0 : 1;
    float _2799 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2775);
    int _2801 = _2759 >> 2;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2805 = !_2567;
    int _2807 = _2805 ? 0 : 1;
    uint _2809 = uint(int(uint(_2773) >> uint(2)));
    uint _2811 = uint(int(uint(int(_2809)) >> uint(2)));
    int _2813 = int(_2809) & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = int(_2809) + 1;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    int _2821 = _2817 & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    int _2825 = abs(_2797);
    float _2827 = -_1140;
    float _2829 = fma(_2769, 2.0, _2827);
    int _2831 = _2801 << 4;
    int _2833 = _2831 + 656;
    float _2835 = float(_2441);
    float _2837 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2799);
    int _2839 = abs(_2807);
    int _2841 = _2773 + 8;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    uint _2845 = uint(int(uint(int(_2843)) >> uint(2)));
    int _2847 = int(_2843) & 3;
    float _2849 = (*spvDescriptorSet0.vp_c9)._m0[int(_2845)][_2847];
    int _2851 = int(_2843) + 1;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    int _2855 = _2851 & 3;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[int(_2853)][_2855];
    float _2859 = float(_2683);
    float _2861 = fma(_2527, -2.0, _2803);
    int _2863 = ~_2419;
    int _2865 = _2863 + _2469;
    int _2867 = _2865 + 1;
    float _2869 = -_154;
    float _2871 = fma(_2869, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2829);
    int _2873 = ~_2375;
    int _2875 = _2873 + _2513;
    int _2877 = _2875 + 1;
    float _2879 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2861);
    int _2881 = ~_2401;
    int _2883 = _2881 + _2531;
    int _2885 = _2883 + 1;
    uint _2887 = uint(int(uint(_2833) >> uint(2)));
    uint _2889 = uint(int(uint(int(_2887)) >> uint(2)));
    int _2891 = int(_2887) & 3;
    float _2893 = (*spvDescriptorSet0.vp_c9)._m0[int(_2889)][_2891];
    int _2895 = int(_2887) + 1;
    uint _2897 = uint(int(uint(_2895) >> uint(2)));
    int _2899 = _2895 & 3;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[int(_2897)][_2899];
    float _2903 = float(_2839);
    int _2905 = _1146 * _2867;
    int _2907 = _2905 + _1489;
    if (_2757)
    {
        _2793 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2909 = _2793;
    int _2911 = _1172 * _2885;
    int _2913 = _2911 + _1825;
    int _2915 = abs(_2387);
    float _2917 = _2903 * _2859;
    int _2919 = abs(_2095);
    int _2921 = _2767 + 8;
    uint _2923 = uint(int(uint(_2921) >> uint(2)));
    uint _2925 = uint(int(uint(int(_2923)) >> uint(2)));
    int _2927 = int(_2923) & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = int(_2923) + 1;
    uint _2933 = uint(int(uint(_2931) >> uint(2)));
    int _2935 = _2931 & 3;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[int(_2933)][_2935];
    int _2939 = abs(_2187);
    int _2941 = as_type<int>(_2909);
    if (_2757)
    {
        float _2943 = _2909 * 5.0;
        _2941 = as_type<int>(_2943);
    }
    int _2945 = _2941;
    float _2947 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2949 = int(_2947);
    int _2951 = abs(_2117);
    int _2953 = _1160 * _2877;
    int _2955 = _2953 + _1465;
    bool _2957 = !_2695;
    int _2959 = _2957 ? 0 : (-1);
    if (_2757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10235 = as_type<float>(_2945);
        out.gl_Position.z = _10235;
    }
    int _2961 = _2833 + 8;
    uint _2963 = uint(int(uint(_2961) >> uint(2)));
    uint _2965 = uint(int(uint(int(_2963)) >> uint(2)));
    int _2967 = int(_2963) & 3;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[int(_2965)][_2967];
    int _2971 = int(_2963) + 1;
    uint _2973 = uint(int(uint(_2971) >> uint(2)));
    int _2975 = _2971 & 3;
    float _2977 = (*spvDescriptorSet0.vp_c9)._m0[int(_2973)][_2975];
    int _2979 = ~_2951;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    int _2985 = abs(_2959);
    bool _2987 = _1146 == 0;
    float _2989 = float(_2825);
    float _2991 = _2989 * _2835;
    float _2993 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2995 = int(_2993);
    int _2997 = ~_2939;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = _2991 * (-2.0);
    int _3005 = ~_2919;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    int _3011 = ~_2915;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    int _3017 = _3001 * as_type<int>(_2791);
    int _3019 = abs(_2653);
    int _3021 = _3009 * as_type<int>(_2823);
    int _3023 = abs(_2539);
    float _3025 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3027 = int(_3025);
    int _3029 = ~_3019;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = fma(_2677, _3003, _2677);
    int _3037 = ~_3023;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    int _3043 = abs(_2625);
    int _3045 = _3033 * as_type<int>(_2783);
    int _3047 = _3045 + _3017;
    int _3049 = abs(_2167);
    int _3051 = _3041 * as_type<int>(_2815);
    int _3053 = _3051 + _3021;
    int _3055 = ~_3043;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    int _3061 = _3015 * as_type<int>(_2901);
    int _3063 = ~_3049;
    int _3065 = _3063 + 1;
    int _3067 = _3065 + 1;
    int _3069 = _2983 * as_type<int>(_2849);
    int _3071 = _3069 + _3053;
    int _3073 = abs(_2705);
    int _3075 = _3059 * as_type<int>(_2893);
    int _3077 = _3075 + _3061;
    int _3079 = _3067 * as_type<int>(_2929);
    int _3081 = _3079 + _3047;
    float _3083 = float(uint(_2949));
    float _3085 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3087 = log2(_3085);
    int _3089 = ~_2985;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    int _3095 = abs(_2335);
    float _3097 = float(uint(_2995));
    int _3099 = _3093 * as_type<int>(_2857);
    int _3101 = _3099 + _3071;
    int _3103 = ~_3095;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = 1.0 / _3083;
    int _3111 = abs(_2753);
    int _3113 = abs(_2239);
    int _3115 = _3107 * as_type<int>(_2969);
    int _3117 = _3115 + _3077;
    int _3119 = ~_3111;
    int _3121 = _3119 + 1;
    int _3123 = _3121 + 1;
    float _3125 = _2693 * _2693;
    int _3127 = abs(_2949);
    float _3129 = 1.0 / _3097;
    int _3131 = ~_3073;
    int _3133 = _3131 + 1;
    int _3135 = _3133 + 1;
    int _3137 = abs(_2201);
    int _3139 = _3123 * as_type<int>(_2977);
    int _3141 = _3139 + _3117;
    bool _3143 = !_2987;
    int _3145 = _3143 ? _2907 : (-1);
    int _3147 = _3135 * as_type<int>(_2937);
    int _3149 = _3147 + _3081;
    int _3151 = ~_3137;
    int _3153 = _3151 + 1;
    int _3155 = _3153 + 1;
    float _3157 = fma(_2709, _2709, _3125);
    bool _3159 = _1160 == 0;
    float _3161 = float(uint(_3027));
    int _3163 = _3101 * _3155;
    int _3165 = ~_3113;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    bool _3171 = !_3159;
    int _3173 = _3171 ? _2955 : (-1);
    int _3175 = _3145 * _3137;
    int _3177 = _3175 + _3163;
    int _3179 = abs(_3027);
    int _3181 = _3169 * _3149;
    int _3183 = abs(_2995);
    float _3185 = 1.0 / _3161;
    int _3187 = _3173 * _3113;
    int _3189 = _3187 + _3181;
    int _3191 = abs(_2351);
    float _3193 = fma(_2687, _2687, _3157);
    int _3195 = as_type<int>(_3109) + (-2);
    float _3197 = float(uint(_3177));
    float _3199 = rsqrt(_3193);
    float _3201 = float(uint(_3183));
    float _3203 = float(uint(_3127));
    float _3205 = as_type<float>(_3195) * _3197;
    int _3207 = ~_3191;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    int _3213 = as_type<int>(_3129) + (-2);
    float _3215 = 1.0 / _3201;
    float _3217 = float(uint(_3189));
    int _3219 = _3211 * _3141;
    float _3221 = float(uint(_3179));
    float _3223 = in.m_75.x;
    float _3225 = in.m_75.y;
    float _3227 = in.m_75.z;
    bool _3229 = !_1675;
    int _3231 = _3229 ? _2913 : (-1);
    float _3233 = as_type<float>(_3213) * _3217;
    int _3235 = as_type<int>(_3185) + (-2);
    float _3237 = 1.0 / _3203;
    int _3239 = abs(_3177);
    int _3241 = _3231 * _3191;
    int _3243 = _3241 + _3219;
    int _3245 = abs(_3189);
    int _3247 = ~_2949;
    int _3249 = _3247 + 1;
    float _3251 = float(uint(_3243));
    float _3253 = 1.0 / _3221;
    int _3255 = as_type<int>(_3215) + (-2);
    float _3257 = as_type<float>(_3235) * _3251;
    float _3259 = float(uint(_3239));
    int _3261 = ~_2995;
    int _3263 = _3261 + 1;
    float _3265 = trunc(_3205);
    float _3267 = precise::max(_3265, 0.0);
    uint _3269 = uint(_3267);
    int _3271 = as_type<int>(_3237) + (-2);
    int _3273 = abs(_3243);
    float _3275 = float(uint(_3245));
    float _3277 = as_type<float>(_3271) * _3259;
    float _3279 = float(uint(_3273));
    float _3281 = trunc(_3233);
    float _3283 = precise::max(_3281, 0.0);
    uint _3285 = uint(_3283);
    int _3287 = as_type<int>(_3253) + (-2);
    float _3289 = as_type<float>(_3255) * _3275;
    float _3291 = _3259;
    if (_2617)
    {
        _3291 = _1120;
    }
    float _3293 = _3291;
    float _3295 = as_type<float>(_3287) * _3279;
    float _3297 = _3293;
    if (!_2617)
    {
        _3297 = _1116;
    }
    float _3299 = _3297;
    int _3301 = _3249 * int(_3269);
    int _3303 = _3301 + _3177;
    float _3305 = trunc(_3277);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3313 = ~_3183;
    int _3315 = _3313 + 1;
    float _3317 = _3299 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3319 = _2917 * (-2.0);
    int _3321 = ~_3027;
    int _3323 = _3321 + 1;
    int _3325 = _3263 * int(_3285);
    int _3327 = _3325 + _3189;
    float _3329 = float(uint(_3303));
    float _3331 = fma(_3317, -2.0, _3311);
    float _3333 = fma(_2669, _3319, _2669);
    float _3335 = fma(_3319, _3223, _3223);
    float _3337 = float(uint(_3327));
    float _3339 = as_type<float>(_3195) * _3329;
    float _3341 = trunc(_3257);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    float _3347 = _2693 * _3199;
    float _3349 = _2709 * _3199;
    float _3351 = as_type<float>(_3213) * _3337;
    int _3353 = ~_3179;
    int _3355 = _3353 + 1;
    float _3357 = -_3347;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2693);
    float _3361 = -_3349;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2709);
    bool _3365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3367 = isnan(0.0);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3373 = _3369 || _3371;
    float _3375 = trunc(_3339);
    float _3377 = precise::max(_3375, 0.0);
    uint _3379 = uint(_3377);
    float _3381 = _3359 * _3359;
    float _3383 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3331);
    float _3385 = fma(_3363, _3363, _3381);
    float _3387 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3389 = trunc(_3295);
    float _3391 = precise::max(_3389, 0.0);
    uint _3393 = uint(_3391);
    int _3395 = _3323 * int(_3345);
    int _3397 = _3395 + _3243;
    float _3399 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3387);
    float _3401 = float(uint(_3397));
    float _3403 = trunc(_3289);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    int _3409 = ~_3127;
    int _3411 = _3409 + 1;
    float _3413 = as_type<float>(_3235) * _3401;
    int _3415 = _3411 * int(_3309);
    int _3417 = _3415 + _3239;
    float _3419 = trunc(_3351);
    float _3421 = precise::max(_3419, 0.0);
    uint _3423 = uint(_3421);
    int _3425 = _3355 * int(_3393);
    int _3427 = _3425 + _3273;
    float _3429 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3431 = float(uint(_3417));
    int _3433 = int(_3269) + int(_3379);
    float _3435 = _3087 * _154;
    float _3437 = float(uint(_3427));
    int _3439 = _3315 * int(_3407);
    int _3441 = _3439 + _3245;
    float _3443 = as_type<float>(_3271) * _3431;
    float _3445 = trunc(_3413);
    float _3447 = precise::max(_3445, 0.0);
    uint _3449 = uint(_3447);
    float _3451 = as_type<float>(_3287) * _3437;
    float _3453 = float(uint(_3441));
    float _3455 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3429);
    float _3457 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3459 = 1.0 + _3457;
    int _3461 = int(_3285) + int(_3423);
    float _3463 = _1116 + (-0.5);
    float _3465 = exp2(_3435);
    float _3467 = as_type<float>(_3255) * _3453;
    float _3469 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3455);
    float _3471 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3473 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3475 = isnan(1.0);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3481 = _3477 || _3479;
    float _3483 = fma(_3463, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3335);
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3487 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3471);
    float _3489 = 1.0 / _3459;
    int _3491 = ~_2995;
    int _3493 = _3491 + 1;
    float _3495 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3485);
    int _3497 = ~_2949;
    int _3499 = _3497 + 1;
    float _3501 = _1120 + (-0.5);
    float _3503 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2353);
    float _3505 = -_3465;
    float _3507 = _3505 + 1.0;
    float _3509 = trunc(_3443);
    float _3511 = precise::max(_3509, 0.0);
    uint _3513 = uint(_3511);
    float _3515 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3487);
    float _3517 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3495);
    float _3519 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3399);
    float _3521 = _3373 ? _3507 : 0.0;
    int _3523 = _3493 * _3461;
    int _3525 = _3523 + _3189;
    int _3527 = ~_3183;
    int _3529 = _3527 + 1;
    float _3531 = trunc(_3467);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    float _3537 = _3503;
    float _3539 = _3347;
    if (_3481)
    {
        float _3541 = _3521 * _3489;
        _158 = _3541;
    }
    float _3543 = _158;
    int _3545 = _3499 * _3433;
    int _3547 = _3545 + _3177;
    int _3549 = int(_3345) + int(_3449);
    int _3551 = ~_3027;
    int _3553 = _3551 + 1;
    float _3555 = fma(_3333, _3543, _3483);
    bool _3557 = uint(_3547) >= uint(_2949);
    float _3559 = trunc(_3451);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    int _3565 = int(_3309) + int(_3513);
    int _3567 = _3553 * _3549;
    int _3569 = _3567 + _3243;
    bool _3571 = uint(_3525) >= uint(_2995);
    int _3573 = ~_3179;
    int _3575 = _3573 + 1;
    bool _3577 = uint(_3569) >= uint(_3027);
    int _3579 = ~_3127;
    int _3581 = _3579 + 1;
    int _3583 = int(_3407) + int(_3535);
    int _3585 = _3581 * _3565;
    int _3587 = _3585 + _3239;
    int _3589 = _3529 * _3583;
    int _3591 = _3589 + _3245;
    float _3593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3595 = int(_3393) + int(_3563);
    bool _3597 = uint(_3587) >= uint(_3127);
    bool _3599 = !_3557;
    int _3601 = _3599 ? 0 : (-1);
    int _3603 = _3575 * _3595;
    int _3605 = _3603 + _3273;
    bool _3607 = uint(_3591) >= uint(_3183);
    float _3609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3611 = !_3571;
    int _3613 = _3611 ? 0 : (-1);
    int _3615 = ~_3433;
    int _3617 = _3615 + _3601;
    int _3619 = _3617 + 1;
    int _3621 = ~_3461;
    int _3623 = _3621 + _3613;
    int _3625 = _3623 + 1;
    bool _3627 = !_3577;
    int _3629 = _3627 ? 0 : (-1);
    float _3631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3633 = _3177 ^ _2949;
    int _3635 = _2949 * _3619;
    int _3637 = _3635 + _3177;
    bool _3639 = _2949 == 0;
    int _3641 = _2995 * _3625;
    int _3643 = _3641 + _3189;
    int _3645 = ~_3549;
    int _3647 = _3645 + _3629;
    int _3649 = _3647 + 1;
    float _3651 = _3593 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3653 = !_3607;
    int _3655 = _3653 ? 0 : (-1);
    bool _3657 = !_3639;
    int _3659 = _3657 ? _3637 : (-1);
    int _3661 = _3027 * _3649;
    int _3663 = _3661 + _3243;
    bool _3665 = _2995 == 0;
    float _3667 = fma(_3651, _1837, -0.5);
    bool _3669 = uint(_3605) >= uint(_3179);
    int _3671 = _3189 ^ _2995;
    int _3673 = _3243 ^ _3027;
    float _3675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3677 = float(_3659);
    float _3679 = _3631 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3681 = !_3665;
    int _3683 = _3681 ? _3643 : (-1);
    bool _3685 = _3027 == 0;
    float _3687 = fma(_3651, _3677, _2363);
    bool _3689 = _3027 == 0;
    float _3691 = fma(_3679, _1951, -0.5);
    float _3693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3695 = float(_3683);
    float _3697 = fma(_3517, _3667, _3687);
    bool _3699 = !_3597;
    int _3701 = _3699 ? 0 : (-1);
    float _3703 = _3609 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3705 = !_3669;
    int _3707 = _3705 ? 0 : (-1);
    float _3709 = fma(_3679, _3695, _2871);
    uint _3711 = uint(int(uint(_3633) >> uint(31)));
    float _3713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3715 = uint(int(uint(_3671) >> uint(31)));
    float _3717 = _3675 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3719 = uint(int(uint(_3673) >> uint(31)));
    float _3721 = fma(_2837, _3691, _3709);
    int _3723 = ~_3701;
    int _3725 = _3565 + _3723;
    int _3727 = _3725 + 1;
    float _3729 = fma(_3717, _1975, -0.5);
    int _3731 = ~_3655;
    int _3733 = _3583 + _3731;
    int _3735 = _3733 + 1;
    float _3737 = fma(_1991, _3703, -0.5);
    int _3739 = ~_3707;
    int _3741 = _3595 + _3739;
    int _3743 = _3741 + 1;
    int _3745 = ~int(_3711);
    int _3747 = _3745 + 1;
    int _3749 = ~int(_3715);
    int _3751 = _3749 + 1;
    int _3753 = ~int(_3719);
    int _3755 = _3753 + 1;
    float _3757 = _3713 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3759 = !_3685;
    int _3761 = _3759 ? _3663 : (-1);
    int _3763 = _3727 ^ _3747;
    float _3765 = fma(_3757, _2031, -0.5);
    int _3767 = _3735 ^ _3751;
    int _3769 = _3743 ^ _3755;
    float _3771 = float(_3761);
    bool _3773 = _2949 == 0;
    bool _3775 = _2995 == 0;
    float _3777 = fma(_3717, _3771, _2747);
    int _3779 = ~_3747;
    int _3781 = _3779 + _3763;
    int _3783 = _3781 + 1;
    float _3785 = _3693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3787 = ~_3751;
    int _3789 = _3787 + _3767;
    int _3791 = _3789 + 1;
    float _3793 = fma(_3469, _3729, _3777);
    int _3795 = ~_3755;
    int _3797 = _3795 + _3769;
    int _3799 = _3797 + 1;
    float _3801 = fma(_2019, _3785, -0.5);
    bool _3803 = !_3773;
    int _3805 = _3803 ? _3783 : (-1);
    float _3807 = _3793 + 0.5;
    bool _3809 = !_3775;
    int _3811 = _3809 ? _3791 : (-1);
    bool _3813 = !_3689;
    int _3815 = _3813 ? _3799 : (-1);
    float _3817 = float(_3805);
    float _3819 = float(_3811);
    float _3821 = float(_3815);
    float _3823 = -_3503;
    float _3825 = fma(_3703, _3817, _3823);
    float _3827 = -_2879;
    float _3829 = fma(_3785, _3819, _3827);
    float _3831 = _3721 + 0.5;
    float _3833 = -_3383;
    float _3835 = fma(_3757, _3821, _3833);
    float _3837 = fma(_3515, _3737, _3825);
    float _3839 = fma(_2533, _3801, _3829);
    float _3841 = _2687 * _3199;
    float _3843 = fma(_3519, _3765, _3835);
    float _3845 = _3697 + 0.5;
    float _3847 = _3837 + 0.5;
    float _3849 = _3839 + 0.5;
    float _3851 = _3843 + 0.5;
    float _3853 = -_3841;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2687);
    float _3857 = fma(_3003, _3225, _3225);
    bool _3859 = !_2575;
    int _3861 = _3859 ? 0 : 1;
    out.m_77.x = _3845;
    out.m_77.y = _3847;
    out.m_77.z = _3831;
    out.m_77.w = _3849;
    float _3863 = fma(_3855, _3855, _3385);
    out.m_79.x = _3807;
    out.m_79.y = _3851;
    float _3865 = as_type<float>(_3565);
    float _3867 = as_type<float>(_3595);
    if (_2757)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3869 = -_3347;
    float _3871 = fma(_3869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2421);
    float _3873 = -_3349;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2413);
    float _3877 = float(_2583);
    float _3879 = _1116 + _1130;
    float _3881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3883 = _3871 + _3881;
    float _3885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3887 = _3875 + _3885;
    int _3889 = abs(_3861);
    float _3891 = -_3841;
    float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2377);
    float _3895 = _3883 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3897 = _3879 + (-1.0);
    float _3899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3901 = _3893 + _3899;
    float _3903 = fma(_3887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3895);
    float _3905 = float(_3889);
    float _3907 = fma(_3501, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3857);
    float _3909 = fma(_3897, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3911 = fma(_3901, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3903);
    float _3913 = _1130 + (-0.5);
    float _3915 = _3905 * _3877;
    float _3917 = fma(_3035, _3543, _3907);
    float _3919 = _3555 * 0.15915493667125701904296875;
    bool _3921 = _3911 >= 0.0;
    float _3923 = _3915 * (-2.0);
    float _3925 = _3917 * 0.15915493667125701904296875;
    float _3927 = _3919 * 6.283185482025146484375;
    float _3929 = sin(_3927);
    float _3931 = fma(_3923, _3227, _3227);
    float _3933 = fma(_3909, _3923, _3909);
    float _3935 = fma(_3913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3931);
    float _3937 = _3925 * 6.283185482025146484375;
    float _3939 = sin(_3937);
    float _3941 = fma(_3933, _3543, _3935);
    float _3943 = _3911;
    int _3945 = as_type<int>(_3871);
    int _3947 = as_type<int>(_3901);
    if (_3921)
    {
        _3943 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3949 = _3943;
    int _3951 = as_type<int>(_3949);
    if (_3921)
    {
        out.m_61.x = 0.0;
    }
    float _3953 = _3941 * 0.15915493667125701904296875;
    float _3955 = sqrt(_3863);
    if (_3921)
    {
        float _3957 = _3949 * 5.0;
        _3951 = as_type<int>(_3957);
    }
    int _3959 = _3951;
    if (_3921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11676 = as_type<float>(_3959);
        out.gl_Position.z = _11676;
    }
    float _3961 = _3919 * 6.283185482025146484375;
    float _3963 = cos(_3961);
    float _3965 = _3929 * _3939;
    float _3967 = _3925 * 6.283185482025146484375;
    float _3969 = cos(_3967);
    float _3971 = _3953 * 6.283185482025146484375;
    float _3973 = sin(_3971);
    if (_3921)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3975 = -_2421;
    float _3977 = _3975 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3979 = in.m_81.x;
    float _3981 = in.m_81.y;
    float _3983 = in.m_81.z;
    float _3985 = _3199 * _3955;
    float _3987 = -_2413;
    float _3989 = _3987 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3991 = _3977 * _3977;
    float _3993 = -_2377;
    float _3995 = _3993 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3997 = _3953 * 6.283185482025146484375;
    float _3999 = cos(_3997);
    float _4001 = _3963 * _3969;
    float _4003 = fma(_3989, _3989, _3991);
    float _4005 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4007 = fma(_3973, _4001, _3965);
    float _4009 = fma(_3995, _3995, _4003);
    float _4011 = fma(_3973, _3965, _4001);
    float _4013 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4015 = _3963 * _3939;
    float _4017 = rsqrt(_4009);
    float _4019 = _802 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _4021 = _3929 * _3969;
    float _4023 = _3985 * _4013;
    float _4025 = _3985 * _4019;
    float _4027 = _3963 * _3999;
    float _4029 = _3969 * _3999;
    float _4031 = _3929 * _3999;
    float _4033 = _3939 * _3999;
    float _4035 = _3985 * _4005;
    float _4037 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3979);
    float _4039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3981);
    float _4041 = -_4015;
    float _4043 = fma(_3973, _4021, _4041);
    float _4045 = -_4021;
    float _4047 = fma(_3973, _4015, _4045);
    float _4049 = _4037 * _4023;
    float _4051 = _4039 * _4035;
    float _4053 = _3989 * _4017;
    float _4055 = in.m_83.x;
    float _4057 = in.m_83.y;
    float _4059 = in.m_83.z;
    bool _4061 = _3981 != 0.0;
    bool _4063 = isnan(_3981);
    bool _4065 = _4061 || _4063;
    bool _4067 = isnan(0.0);
    bool _4069 = _4065 || _4067;
    float _4071 = _3995 * _4017;
    float _4073 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4075 = _4053 * _4073;
    float _4077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3983);
    float _4079 = _3977 * _4017;
    bool _4081 = _3979 == 0.0;
    bool _4083 = !_4069;
    bool _4085 = _4081 && _4083;
    float _4087 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4089 = _4071 * _4087;
    float _4091 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4093 = -_4075;
    float _4095 = fma(_4071, _4091, _4093);
    float _4097 = _4077 * _4025;
    float _4099 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4101 = _4079 * _4099;
    bool _4103 = _3983 == 0.0;
    bool _4105 = _4103 && _4085;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4109 = -_4089;
    float _4111 = fma(_4079, _4107, _4109);
    float _4113 = _4095 * _4095;
    float _4115 = in.m_85.x;
    float _4117 = in.m_85.y;
    float _4119 = in.m_85.z;
    float _4121 = in.m_85.w;
    float _4123 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4125 = -_4101;
    float _4127 = fma(_4053, _4123, _4125);
    float _4129 = -_4051;
    float _4131 = _3973 * _4129;
    float _4133 = fma(_4111, _4111, _4113);
    float _4135 = _4027 * _4051;
    float _4137 = _4031 * _4051;
    float _4139 = fma(_4029, _4049, _4131);
    float _4141 = fma(_4127, _4127, _4133);
    float _4143 = fma(_4007, _4049, _4135);
    float _4145 = fma(_4043, _4049, _4137);
    float _4147 = _4133;
    float _4149 = _4055;
    float _4151 = _4049;
    float _4153 = _4011;
    if (_4105)
    {
        _3865 = _4055;
    }
    float _4155 = _3865;
    float _4157 = rsqrt(_4141);
    float _4159 = _4155;
    if (_4105)
    {
        _3537 = _4057;
    }
    float _4161 = _3537;
    float _4163 = fma(_4033, _4097, _4139);
    float _4165 = _4161;
    if (_4105)
    {
        _4147 = _4155;
    }
    float _4167 = _4147;
    float _4169 = fma(_4047, _4097, _4143);
    float _4171 = _4167;
    if (!_4105)
    {
        _4159 = _4055;
    }
    float _4173 = _4159;
    if (_4105)
    {
        _4149 = _4161;
    }
    float _4175 = _4149;
    float _4177 = _4175;
    if (_4105)
    {
        _3867 = _4059;
    }
    float _4179 = _3867;
    float _4181 = _4179;
    if (!_4105)
    {
        float _4183 = fma(_3979, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4173);
        _4171 = _4183;
    }
    float _4185 = _4171;
    if (!_4105)
    {
        _4165 = _4057;
    }
    float _4187 = _4165;
    float _4189 = fma(_4011, _4097, _4145);
    if (_4105)
    {
        _4151 = _4179;
    }
    float _4191 = _4151;
    float _4193 = _4191;
    if (!_4105)
    {
        _4181 = _4059;
    }
    float _4195 = _4181;
    if (!_4105)
    {
        float _4197 = fma(_3981, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4187);
        _4177 = _4197;
    }
    float _4199 = _4177;
    float _4201 = _4119 * _4173;
    float _4203 = _4095 * _4157;
    float _4205 = _4111 * _4157;
    float _4207 = _4127 * _4157;
    float _4209 = -_4201;
    float _4211 = fma(_4115, _4195, _4209);
    float _4213 = _4117 * _4195;
    float _4215 = _4071 * _4203;
    float _4217 = _4079 * _4205;
    if (!_4105)
    {
        float _4219 = fma(_3983, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4195);
        _4193 = _4219;
    }
    float _4221 = _4193;
    float _4223 = _4115 * _4187;
    float _4225 = -_4213;
    float _4227 = fma(_4119, _4187, _4225);
    float _4229 = -_4215;
    float _4231 = fma(_4079, _4207, _4229);
    float _4233 = -_4217;
    float _4235 = fma(_4053, _4203, _4233);
    float _4237 = -_4223;
    float _4239 = fma(_4117, _4173, _4237);
    float _4241 = _4227 * _4121;
    float _4243 = _4231 * _4169;
    float _4245 = _4235 * _4169;
    float _4247 = _4211 * _4121;
    float _4249 = _4239 * _4121;
    float _4251 = _4053 * _4207;
    float _4253 = fma(_4205, _4163, _4243);
    float _4255 = fma(_4207, _4163, _4245);
    float _4257 = _4007 * _4231;
    float _4259 = -_4251;
    float _4261 = fma(_4071, _4205, _4259);
    float _4263 = fma(_4053, _4189, _4253);
    float _4265 = fma(_4071, _4189, _4255);
    float _4267 = _4007 * _4235;
    float _4269 = _4007 * _4261;
    float _4271 = _2413 + _4263;
    float _4273 = _2377 + _4265;
    float _4275 = _4027 * _4231;
    float _4277 = _4027 * _4261;
    float _4279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4281 = _4271 + _4279;
    float _4283 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4285 = _4273 + _4283;
    float _4287 = _4027 * _4235;
    float _4289 = _4047 * _4231;
    float _4291 = _4281 * _4281;
    float _4293 = _4285 * _4285;
    float _4295 = fma(_4029, _4205, _4257);
    float _4297 = fma(_4029, _4203, _4269);
    float _4299 = fma(_4029, _4207, _4267);
    float _4301 = _4291 + _4293;
    float _4303 = _4261 * _4169;
    float _4305 = _4047 * _4235;
    float _4307 = _4047 * _4261;
    float _4309 = sqrt(_4301);
    float _4311 = fma(_4203, _4163, _4303);
    float _4313 = -_3973;
    float _4315 = fma(_4313, _4205, _4275);
    float _4317 = -_3973;
    float _4319 = fma(_4317, _4203, _4277);
    float _4321 = -_3973;
    float _4323 = fma(_4321, _4207, _4287);
    float _4325 = fma(_4079, _4189, _4311);
    float _4327 = fma(_4033, _4207, _4305);
    float _4329 = fma(_4033, _4205, _4289);
    float _4331 = fma(_4033, _4203, _4307);
    float _4333 = fma(_4031, _4053, _4315);
    float _4335 = fma(_4031, _4079, _4319);
    float _4337 = fma(_4031, _4071, _4323);
    float _4339 = _2421 + _4325;
    float _4341 = fma(_4043, _4053, _4295);
    float _4343 = fma(_4043, _4079, _4297);
    float _4345 = fma(_4011, _4053, _4329);
    bool _4347 = _4309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4349 = fma(_4043, _4071, _4299);
    float _4351 = fma(_4011, _4071, _4327);
    float _4353 = fma(_4011, _4079, _4331);
    float _4355 = _4333 * _4199;
    float _4357 = _4335 * _4199;
    float _4359 = _4333 * _4117;
    float _4361 = _4335 * _4117;
    float _4363 = _4337 * _4117;
    float _4365 = _4337 * _4199;
    float _4367 = _4247 * _4333;
    float _4369 = _4247 * _4335;
    float _4371 = _4247 * _4337;
    float _4373 = _4291;
    float _4375 = _4293;
    float _4377 = _4273;
    float _4379 = _4271;
    if (!_4347)
    {
        _4153 = _4339;
    }
    float _4381 = _4153;
    bool _4383 = !_4347;
    float _4385 = _4381;
    if (!_4383)
    {
        float _4387 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4389 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4391 = _4309 + _4389;
        float _4393 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4395 = rsqrt(_4301);
        float _4397 = _4391 * _4387;
        float _4399 = _4397 * 0.15915493667125701904296875;
        float _4401 = _4399 * 6.283185482025146484375;
        float _4403 = sin(_4401);
        float _4405 = _4399 * 6.283185482025146484375;
        float _4407 = cos(_4405);
        float _4409 = fma(_4403, _4393, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4411 = _4395 * _4409;
        float _4413 = _4407 + (-1.0);
        float _4415 = fma(_4281, _4411, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4417 = fma(_4285, _4411, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4419 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4421 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4423 = _4415 + _4421;
        float _4425 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4427 = _4417 + _4425;
        float _4429 = fma(_4339, _4407, _4419);
        float _4431 = _4423 * _4423;
        float _4433 = _4427 * _4427;
        _4385 = _4429;
        _4373 = _4431;
        _4375 = _4433;
        _4377 = _4417;
        _4379 = _4415;
    }
    float _4435 = _4385;
    float _4437 = _4373;
    float _4439 = _4375;
    float _4441 = _4377;
    float _4443 = _4379;
    float _4445 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4447 = _4435 + _4445;
    float _4449 = fma(_4241, _4341, _4367);
    float _4451 = fma(_4341, _4115, _4359);
    float _4453 = fma(_4343, _4115, _4361);
    float _4455 = fma(_4447, _4447, _4437);
    float _4457 = fma(_4241, _4343, _4369);
    float _4459 = fma(_4349, _4115, _4363);
    float _4461 = fma(_4341, _4185, _4355);
    float _4463 = _4455 + _4439;
    float _4465 = fma(_4343, _4185, _4357);
    float _4467 = fma(_4349, _4185, _4365);
    float _4469 = fma(_4241, _4349, _4371);
    float _4471 = fma(_4249, _4345, _4449);
    float _4473 = fma(_4345, _4119, _4451);
    float _4475 = sqrt(_4463);
    float _4477 = fma(_4353, _4119, _4453);
    float _4479 = fma(_4249, _4353, _4457);
    float _4481 = fma(_4351, _4119, _4459);
    float _4483 = fma(_4345, _4221, _4461);
    float _4485 = fma(_4353, _4221, _4465);
    float _4487 = fma(_4249, _4351, _4469);
    float _4489 = fma(_4351, _4221, _4467);
    out.m_87.x = _4473;
    out.m_87.y = _4477;
    out.m_87.z = _4481;
    out.m_89.x = _4471;
    out.m_89.y = _4479;
    out.m_89.z = _4487;
    out.m_91.x = _4483;
    out.m_91.y = _4485;
    out.m_91.z = _4489;
    bool _4491 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4493 = isnan(_4475);
    bool _4495 = _4491 || _4493;
    bool _4497 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4499 = _4495 || _4497;
    float _4501 = _4453;
    if (!_4499)
    {
        _4501 = 1.0;
    }
    float _4503 = _4501;
    bool _4505 = !_4499;
    float _4507 = _4503;
    if (!_4505)
    {
        bool _4509 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4511 = isnan(_4475);
        bool _4513 = _4509 || _4511;
        bool _4515 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4517 = _4513 || _4515;
        if (!_4517)
        {
            float _4519 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4521 = _4475 + _4519;
            float _4523 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4525 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4523;
            float _4527 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4529 = _4527 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4531 = 1.0 / _4525;
            float _4533 = _4521 * _4531;
            float _4535 = fma(_4533, _4529, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4507 = _4535;
            _4537 = true;
        }
        else
        {
            bool _4539 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4541 = isnan(_4475);
            bool _4543 = _4539 || _4541;
            bool _4545 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4547 = _4543 || _4545;
            if (!_4547)
            {
                float _4549 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4551 = _4475 + _4549;
                float _4553 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4555 = _4553 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4557 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4559 = _4557 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4561 = 1.0 / _4555;
                float _4563 = _4551 * _4561;
                float _4565 = fma(_4563, _4559, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4507 = _4565;
                _4537 = true;
            }
            else
            {
                _4507 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4537 = false;
    float _4567 = _4507;
    float _4569 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4571 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4573 = floor(_4569);
    float _4575 = floor(_4571);
    float _4577 = -_4573;
    float _4579 = _4569 + _4577;
    float _4581 = -_4575;
    float _4583 = _4571 + _4581;
    float2 _12696 = float2(_4579, _4583);
    float _4585 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12696, float2(0.0), isnan(_12696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12696, float2(0.0), isnan(_12696)), level(0.0)).x;
    float _4587 = _3871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4589 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4591 = _4441 + _4589;
    float _4593 = fma(_3875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4587);
    bool _4595 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4597 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4599 = _4595 || _4597;
    bool _4601 = isnan(0.5);
    bool _4603 = _4599 || _4601;
    float _4605 = fma(_3893, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4593);
    float _4607 = _3871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4609 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4611 = _4435 + _4609;
    float _4613 = _4605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4615 = fma(_3875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4607);
    float _4617 = 1.0 / _4613;
    float _4619 = fma(_3893, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4615);
    float _4621 = _4619 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4623 = _4621 + _4613;
    float _4625 = _4623 * _4617;
    float _4627 = _4625 * 0.5;
    float _4629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4631 = fma(_4627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4629);
    float _4633 = 1.0 / _4631;
    float _4635 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4637 = _3871 + _4635;
    float _4639 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4641 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4639);
    float _4643 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4645 = _4633 * _4643;
    float _4647 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4649 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4641);
    bool _4651 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4653 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4647);
    bool _4655 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4657 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4659 = !_4651;
    int _4661 = _4659 ? 0 : 1;
    float _4663 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4653);
    float _4665 = trunc(_4657);
    int _4667 = int(_4665);
    float _4669 = _4663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4671 = 2;
    if (!_4651)
    {
        _4671 = 1;
    }
    int _4673 = _4671;
    int _4675 = _4673;
    if (!_4655)
    {
        _4675 = _4661;
    }
    int _4677 = _4675;
    float _4679 = trunc(_4669);
    int _4681 = int(_4679);
    int _4683 = _4677 << 6;
    int _4685 = _4683 + 48;
    uint _4687 = uint(int(uint(_4685) >> uint(2)));
    uint _4689 = uint(int(uint(int(_4687)) >> uint(2)));
    int _4691 = int(_4687) & 3;
    float _4693 = (*spvDescriptorSet0.vp_c15)._m0[int(_4689)][_4691];
    int _4695 = int(_4687) + 1;
    uint _4697 = uint(int(uint(_4695) >> uint(2)));
    int _4699 = _4695 & 3;
    float _4701 = (*spvDescriptorSet0.vp_c15)._m0[int(_4697)][_4699];
    int _4703 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4705 = _4667 + _4703;
    int _4707 = _4705 + 1;
    float _4709 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4711 = _4443 + _4709;
    bool _4713 = _4707 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4715 = fma(_4711, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _4717 = _4683 + 56;
    uint _4719 = uint(int(uint(_4717) >> uint(2)));
    uint _4721 = uint(int(uint(int(_4719)) >> uint(2)));
    int _4723 = int(_4719) & 3;
    float _4725 = (*spvDescriptorSet0.vp_c15)._m0[int(_4721)][_4723];
    int _4727 = int(_4719) + 1;
    uint _4729 = uint(int(uint(_4727) >> uint(2)));
    int _4731 = _4727 & 3;
    float _4733 = (*spvDescriptorSet0.vp_c15)._m0[int(_4729)][_4731];
    int _4735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4737 = _4681 + _4735;
    int _4739 = _4737 + 1;
    float _4741 = -_3349;
    float _4743 = fma(_4741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4715);
    int _4745 = _4707 | _4739;
    int _4747 = _4683 + 64;
    uint _4749 = uint(int(uint(_4747) >> uint(2)));
    uint _4751 = uint(int(uint(int(_4749)) >> uint(2)));
    int _4753 = int(_4749) & 3;
    float _4755 = (*spvDescriptorSet0.vp_c15)._m0[int(_4751)][_4753];
    int _4757 = int(_4749) + 1;
    uint _4759 = uint(int(uint(_4757) >> uint(2)));
    int _4761 = _4757 & 3;
    float _4763 = (*spvDescriptorSet0.vp_c15)._m0[int(_4759)][_4761];
    bool _4765 = _4745 < 0;
    bool _4767 = _4765 || _4713;
    float _4769 = fma(_4611, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4771 = fma(_4591, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4773 = _4739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4775 = _4773 || _4767;
    float _4777 = -_3347;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4769);
    float _4781 = -_3841;
    float _4783 = fma(_4781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4771);
    int _4785 = _4683 + 72;
    uint _4787 = uint(int(uint(_4785) >> uint(2)));
    uint _4789 = uint(int(uint(int(_4787)) >> uint(2)));
    int _4791 = int(_4787) & 3;
    float _4793 = (*spvDescriptorSet0.vp_c15)._m0[int(_4789)][_4791];
    int _4795 = int(_4787) + 1;
    uint _4797 = uint(int(uint(_4795) >> uint(2)));
    int _4799 = _4795 & 3;
    float _4801 = (*spvDescriptorSet0.vp_c15)._m0[int(_4797)][_4799];
    float _4803 = _4743;
    float _4805 = _4779;
    float _4807 = as_type<float>(_4677);
    if (_4603)
    {
        _3539 = _4743;
    }
    float _4809 = _3539;
    float _4811 = _4809;
    if (_4603)
    {
        _4803 = _4779;
    }
    float _4813 = _4803;
    float _4815 = _4813;
    if (_4603)
    {
        _4805 = _4783;
    }
    float _4817 = _4805;
    int _4819 = _4683 + 96;
    uint _4821 = uint(int(uint(_4819) >> uint(2)));
    uint _4823 = uint(int(uint(int(_4821)) >> uint(2)));
    int _4825 = int(_4821) & 3;
    float _4827 = (*spvDescriptorSet0.vp_c15)._m0[int(_4823)][_4825];
    int _4829 = int(_4821) + 1;
    uint _4831 = uint(int(uint(_4829) >> uint(2)));
    int _4833 = _4829 & 3;
    float _4835 = (*spvDescriptorSet0.vp_c15)._m0[int(_4831)][_4833];
    int _4837 = _4683 + 104;
    uint _4839 = uint(int(uint(_4837) >> uint(2)));
    uint _4841 = uint(int(uint(int(_4839)) >> uint(2)));
    int _4843 = int(_4839) & 3;
    float _4845 = (*spvDescriptorSet0.vp_c15)._m0[int(_4841)][_4843];
    int _4847 = int(_4839) + 1;
    uint _4849 = uint(int(uint(_4847) >> uint(2)));
    int _4851 = _4847 & 3;
    float _4853 = (*spvDescriptorSet0.vp_c15)._m0[int(_4849)][_4851];
    float _4855 = _4817;
    float _4857 = _4835;
    if (!_4603)
    {
        float _4859 = _3883 * _3883;
        float _4861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4863 = fma(_3887, _3887, _4859);
        float _4865 = fma(_3901, _3901, _4863);
        float _4867 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4869 = sqrt(_4865);
        float _4871 = 1.0 / _3985;
        float _4873 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4875 = precise::min(_4869, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4877 = _4875 * _4861;
        float _4879 = _4877 * _4871;
        float _4881 = -_2377;
        float _4883 = _4881 + _4771;
        float _4885 = -_2421;
        float _4887 = _4885 + _4769;
        float _4889 = -_2413;
        float _4891 = _4889 + _4715;
        float _4893 = _4873 * _4879;
        float _4895 = _4883 * _4879;
        float _4897 = fma(_4887, _4893, _3871);
        float _4899 = fma(_4891, _4893, _3875);
        float _4901 = fma(_4873, _4895, _3893);
        _4815 = _4897;
        _4811 = _4899;
        _4855 = _4901;
    }
    float _4903 = _4815;
    float _4905 = _4811;
    float _4907 = _4855;
    float _4909 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4911 = _4637 * _4835;
    if (!_4775)
    {
        int _4913 = _4739 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4915 = _4913 + _4707;
        _3945 = _4915;
    }
    int _4917 = _3945;
    int _4919 = _4683 + 80;
    uint _4921 = uint(int(uint(_4919) >> uint(2)));
    uint _4923 = uint(int(uint(int(_4921)) >> uint(2)));
    int _4925 = int(_4921) & 3;
    float _4927 = (*spvDescriptorSet0.vp_c15)._m0[int(_4923)][_4925];
    int _4929 = int(_4921) + 1;
    uint _4931 = uint(int(uint(_4929) >> uint(2)));
    int _4933 = _4929 & 3;
    float _4935 = (*spvDescriptorSet0.vp_c15)._m0[int(_4931)][_4933];
    float _4937 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4909);
    float _4939 = fma(_3875, _4827, _4911);
    float _4941 = _4637 * _4701;
    float _4943 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4945 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4937);
    float _4947 = fma(_3893, _4845, _4939);
    float _4949 = fma(_3875, _4693, _4941);
    int _4951 = as_type<int>(_4945);
    int _4953 = as_type<int>(_4943);
    if (!_4775)
    {
        int _4955 = _4917 << 2;
        _3947 = _4955;
    }
    int _4957 = _3947;
    float _4959 = _4945 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4961 = _4947 + _4853;
    float _4963 = fma(_3893, _4725, _4949);
    int _4965 = _4957;
    if (!_4775)
    {
        uint _4967 = uint(int(uint(_4917) >> uint(2)));
        _4951 = int(_4967);
    }
    int _4969 = _4951;
    float _4971 = _4959 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_4775)
    {
        int _4973 = 12 & _4957;
        _4965 = _4973;
    }
    int _4975 = _4965;
    int _4977 = _4683 + 88;
    uint _4979 = uint(int(uint(_4977) >> uint(2)));
    uint _4981 = uint(int(uint(int(_4979)) >> uint(2)));
    int _4983 = int(_4979) & 3;
    float _4985 = (*spvDescriptorSet0.vp_c15)._m0[int(_4981)][_4983];
    int _4987 = int(_4979) + 1;
    uint _4989 = uint(int(uint(_4987) >> uint(2)));
    int _4991 = _4987 & 3;
    float _4993 = (*spvDescriptorSet0.vp_c15)._m0[int(_4989)][_4991];
    float _4995 = 1.0 / _4961;
    float _4997 = -_4971;
    float _4999 = fma(_4997, _4943, 1.0);
    float _5001 = _4963 + _4733;
    float _5003 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5005 = _4637 * _4763;
    if (!_4775)
    {
        int _5007 = _4969 << 4;
        int _5009 = _5007 + _4975;
        _4953 = _5009;
    }
    int _5011 = _4953;
    float _5013 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5015 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5003);
    float _5017 = fma(_3875, _4755, _5005);
    float _5019 = _4845;
    if (!_4775)
    {
        int _5021 = _5011 + 400;
        uint _5023 = uint(int(uint(_5021) >> uint(2)));
        uint _5025 = uint(int(uint(int(_5023)) >> uint(2)));
        int _5027 = int(_5023) & 3;
        float _5029 = (*spvDescriptorSet0.vp_c15)._m0[int(_5025)][_5027];
        _5019 = _5029;
    }
    float _5031 = _5019;
    float _5033 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5013);
    float _5035 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5015);
    float _5037 = fma(_3893, _4793, _5017);
    float _5039 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5041 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5033);
    float _5043 = _5035 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5045 = _5037 + _4801;
    float _5047 = _5001 * _4995;
    float _5049 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5039);
    float _5051 = _5041 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5053 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5055 = log2(_4999);
    float _5057 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5049);
    bool _5059 = _5047 >= 0.0;
    float _5061 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5053);
    float _5063 = _5045 * _4995;
    float _5065 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _5067 = _5047 <= 1.0;
    bool _5069 = _5067 && _5059;
    float _5071 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5061);
    float _5073 = _5045;
    if (!_4775)
    {
        float _5075 = floor(_4657);
        _5073 = _5075;
    }
    float _5077 = _5073;
    float _5079 = _5057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _5081 = _5063 >= 0.0;
    bool _5083 = _5081 && _5069;
    float _5085 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5065);
    float _5087 = _4637 * _4935;
    float _5089 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5071);
    float _5091 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _5093 = _5063 <= 1.0;
    bool _5095 = _5093 && _5083;
    float _5097 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5085);
    float _5099 = 1.0 / _5089;
    float _5101 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5091);
    float _5103 = fma(_3875, _4927, _5087);
    float _5105 = _5055 * 0.693147182464599609375;
    float _5107 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5101);
    float _5109 = _5105 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5111 = _4769;
    if (!_4775)
    {
        float _5113 = floor(_4669);
        _5111 = _5113;
    }
    float _5115 = _5111;
    float _5117 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5107);
    float _5119 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5097);
    float _5121 = fma(_3893, _4985, _5103);
    float _5123 = _5119;
    if (_5095)
    {
        float _5125 = float(_4677);
        _4807 = _5125;
    }
    float _5127 = _4807;
    float _5129 = _5077;
    if (!_4775)
    {
        float _5131 = -_5077;
        float _5133 = _4657 + _5131;
        _4857 = _5133;
    }
    float _5135 = _4857;
    float _5137 = _5121 + _4993;
    float _5139 = _5117 * _5099;
    float _5141 = _5119 * _5099;
    float _5143 = _5087;
    if (_5095)
    {
        float _5145 = rint(_5127);
        float _5147 = precise::max(_5145, 0.0);
        uint _5149 = uint(_5147);
        uint _5151 = clamp(_5149, 0u, 65535u);
        _5143 = as_type<float>(_5151);
    }
    float _5153 = _5143;
    float _5155 = _5137 * _4995;
    float _5157 = fma(_5141, -0.5, 0.5);
    float _5159 = _5115;
    float _5161 = _5155;
    if (!_4775)
    {
        float _5163 = -_5115;
        float _5165 = _4669 + _5163;
        _5159 = _5165;
    }
    float _5167 = _5159;
    float _5169 = _5141;
    float _5171 = _5167;
    if (!_4775)
    {
        float _5173 = rint(_5031);
        float _5175 = precise::max(_5173, 0.0);
        uint _5177 = uint(_5175);
        uint _5179 = clamp(_5177, 0u, 65535u);
        _5169 = as_type<float>(_5179);
    }
    float _5181 = _5169;
    float _5183 = fma(_5139, 0.5, 0.5);
    float _5185 = _5063;
    float _5187 = _5153;
    if (_5095)
    {
        float3 _13723 = float3(_5047, _5063, float(as_type<int>(_5153)));
        float3 _13727 = select(_13723, float3(0.0), isnan(_13723));
        float _5189 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13727.xy, uint(rint(_13727.z)), _5155, level(0.0));
        _5185 = _5189;
    }
    float _5191 = _5185;
    float3 _13737 = float3(_5183, _5157, _5109);
    float _5193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13737, float3(0.0), isnan(_13737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13737, float3(0.0), isnan(_13737)), level(0.0)).x;
    float3 _13746 = float3(_5183, _5157, _5109);
    float4 _5196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13746, float3(0.0), isnan(_13746)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13746, float3(0.0), isnan(_13746)), level(0.0)).xyzw;
    float _5198 = _5196.x;
    float _5200 = _5196.y;
    float _5202 = _5196.z;
    float _5204 = _5196.w;
    float _5206 = _5135;
    if (!_4775)
    {
        float3 _13769 = float3(_5135, _5167, float(as_type<int>(_5181)));
        float3 _13771 = select(_13769, float3(0.0), isnan(_13769));
        float _5208 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13771.xy, uint(rint(_13771.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13771.xy, uint(rint(_13771.z)), level(0.0)).x;
        _5206 = _5208;
    }
    float _5210 = _5206;
    if (_4775)
    {
        _5129 = 1.0;
    }
    float _5212 = _5129;
    float _5214 = _5212;
    if (!_4775)
    {
        int _5216 = _4917 << 4;
        int _5218 = _5216 + 2048;
        uint _5220 = uint(int(uint(_5218) >> uint(2)));
        uint _5222 = uint(int(uint(int(_5220)) >> uint(2)));
        int _5224 = int(_5220) & 3;
        float _5226 = (*spvDescriptorSet0.vp_c15)._m0[int(_5222)][_5224];
        int _5228 = int(_5220) + 1;
        uint _5230 = uint(int(uint(_5228) >> uint(2)));
        int _5232 = _5228 & 3;
        float _5234 = (*spvDescriptorSet0.vp_c15)._m0[int(_5230)][_5232];
        int _5236 = _5218 + 8;
        uint _5238 = uint(int(uint(_5236) >> uint(2)));
        uint _5240 = uint(int(uint(int(_5238)) >> uint(2)));
        int _5242 = int(_5238) & 3;
        float _5244 = (*spvDescriptorSet0.vp_c15)._m0[int(_5240)][_5242];
        int _5246 = int(_5238) + 1;
        uint _5248 = uint(int(uint(_5246) >> uint(2)));
        int _5250 = _5246 & 3;
        float _5252 = (*spvDescriptorSet0.vp_c15)._m0[int(_5248)][_5250];
        float _5254 = _4637 * _5234;
        float _5256 = fma(_3875, _5226, _5254);
        float _5258 = fma(_3893, _5244, _5256);
        float _5260 = _5258 + _5252;
        float _5262 = precise::clamp(_5260, 0.0, 1.0);
        float _5264 = -_5262;
        float _5266 = _5264 + _5210;
        float _5268 = fma(_5266, 500.0, 1.5);
        float _5270 = exp2(_5268);
        float _5272 = 0.0 + _5270;
        float _5274 = precise::clamp(_5272, 0.0, 1.0);
        _5187 = _5226;
        _5214 = _5274;
    }
    float _5276 = _5187;
    float _5278 = _5214;
    float _5280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5282 = _4903 + _5280;
    float _5284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5286 = _4905 + _5284;
    float _5288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5290 = _4907 + _5288;
    float _5292 = _5282 * _5282;
    float _5294 = fma(_5286, _5286, _5292);
    float _5296 = fma(_5290, _5290, _5294);
    float _5298 = rsqrt(_5296);
    float _5300 = _5298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5302 = _5286 * _5300;
    float _5304 = _5290 * _5300;
    float _5306 = _5302 * _5302;
    float _5308 = _5304 * _5304;
    float _5310 = _5306 + _5308;
    float _5312 = sqrt(_5310);
    bool _5314 = _5312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5316 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5318 = _5312 + _5316;
    float _5320 = _5290;
    float _5322 = _5294;
    float _5324 = _5318;
    float _5326 = _5282;
    float _5328 = _5300;
    if (_5314)
    {
        float _5330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5320 = _5330;
    }
    float _5332 = _5320;
    if (_5314)
    {
        float _5334 = rsqrt(_5310);
        _5322 = _5334;
    }
    float _5336 = _5322;
    float _5338 = _5336;
    if (_5314)
    {
        float _5340 = _5318 * _5332;
        _5324 = _5340;
    }
    float _5342 = _5324;
    if (_5314)
    {
        float _5344 = _5342 * 0.15915493667125701904296875;
        _5171 = _5344;
    }
    float _5346 = _5171;
    float _5348 = _5298;
    if (_5314)
    {
        float _5350 = _5346 * 6.283185482025146484375;
        float _5352 = sin(_5350);
        _5348 = _5352;
    }
    float _5354 = _5348;
    float _5356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5358 = precise::max(0.0, _5356);
    float _5360 = _5276;
    float _5362 = _5356;
    if (_5314)
    {
        float _5364 = _5346 * 6.283185482025146484375;
        float _5366 = cos(_5364);
        _5360 = _5366;
    }
    float _5368 = _5360;
    float _5370 = -_5300;
    float _5372 = -_5358;
    float _5374 = fma(_5282, _5370, _5372);
    float _5376 = _5374;
    if (!_5314)
    {
        _5326 = _5304;
    }
    float _5378 = _5326;
    float _5380 = _5378;
    if (_5314)
    {
        float _5382 = _5374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5362 = _5382;
    }
    float _5384 = _5362;
    float _5386 = _5354;
    float _5388 = _5384;
    if (_5314)
    {
        float _5390 = fma(_5354, _5384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5386 = _5390;
    }
    float _5392 = _5386;
    float _5394 = _5392;
    float _5396 = _5368;
    if (_5314)
    {
        float _5398 = _5368 + (-1.0);
        _5388 = _5398;
    }
    float _5400 = _5388;
    float _5402 = _5400;
    if (_5314)
    {
        float _5404 = _5336 * _5392;
        _5328 = _5404;
    }
    float _5406 = _5328;
    if (!_5314)
    {
        _5394 = _5302;
    }
    float _5408 = _5394;
    float _5410 = _5408;
    if (_5314)
    {
        float _5412 = _5400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5402 = _5412;
    }
    float _5414 = _5402;
    if (_5314)
    {
        float _5416 = _5302 * _5406;
        _5410 = _5416;
    }
    float _5418 = _5410;
    if (!_5314)
    {
        _5338 = _5306;
    }
    float _5420 = _5338;
    float _5422 = _5420;
    if (_5314)
    {
        float _5424 = _5304 * _5406;
        _5380 = _5424;
    }
    float _5426 = _5380;
    if (_5314)
    {
        float _5428 = fma(_5374, _5368, _5414);
        _5376 = _5428;
    }
    float _5430 = _5376;
    if (_5314)
    {
        float _5432 = _5418 * _5418;
        _5422 = _5432;
    }
    float _5434 = _5422;
    if (!_5314)
    {
        _5396 = _5308;
    }
    float _5436 = _5396;
    float _5438 = sqrt(_5296);
    float _5440 = _5436;
    if (_5314)
    {
        float _5442 = _5426 * _5426;
        _5440 = _5442;
    }
    float _5444 = _5440;
    float _5446 = fma(_5430, _5430, _5434);
    float _5448 = _5446 + _5444;
    float _5450 = rsqrt(_5448);
    float _5452 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5454 = fma(_5438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5452);
    float _5456 = precise::clamp(_5454, 0.0, 1.0);
    float _5458 = -_5456;
    float _5460 = _5458 + 1.0;
    float _5462 = _5450 * _5418;
    float _5464 = abs(_5460);
    float _5466 = log2(_5464);
    float _5468 = _5450 * _5430;
    float _5470 = _5450 * _5426;
    float _5472 = _5462 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5474 = -_5472;
    float _5476 = fma(_5468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5474);
    float _5478 = -_5470;
    float _5480 = fma(_5478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5476);
    float _5482 = fma(_5480, -0.5, 0.5);
    float _5484 = _5466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5486 = fma(_5480, 0.5, 0.5);
    float _5488 = _5468 + 1.0;
    float _5490 = sqrt(_5482);
    float _5492 = fma(_5486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5494 = fma(_5486, _5492, -0.212114393711090087890625);
    float _5496 = exp2(_5484);
    float _5498 = fma(_5486, _5494, 1.570728778839111328125);
    float _5500 = _5490 * 0.636619746685028076171875;
    float _5502 = -_5498;
    float _5504 = fma(_5500, _5502, 1.0);
    float _5506 = -_5468;
    float _5508 = fma(_5496, _5488, _5506);
    float _5510 = fma(_5508, 0.5, 0.5);
    float2 _14238 = float2(_5504, _5510);
    float3 _5514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_14238, float2(0.0), isnan(_14238)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_14238, float2(0.0), isnan(_14238)), level(0.0)).xyz;
    float _5516 = _5514.x;
    float _5518 = _5514.y;
    float _5520 = _5514.z;
    float _5522 = abs(_4645);
    float _5524 = log2(_5522);
    float _5526 = _5466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5528 = -_4585;
    float _5530 = _5528 + 1.0;
    float _5532 = exp2(_5526);
    float _5534 = _5524 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5536 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5538 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5536);
    float _5540 = exp2(_5534);
    float _5542 = -_5532;
    float _5544 = _5542 + 1.0;
    float _5546 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5538);
    float _5548 = _5544 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5550 = fma(_5540, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5552 = precise::clamp(_5550, 0.0, 1.0);
    float _5554 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5546);
    bool _5556 = _4645 <= 8000.0;
    bool _5558 = isnan(_4645);
    bool _5560 = _5556 || _5558;
    bool _5562 = isnan(8000.0);
    bool _5564 = _5560 || _5562;
    float _5566 = float(_5564);
    float _5568 = fma(_5552, -2.0, 3.0);
    float _5570 = _5552 * _5552;
    float _5572 = _5570 * _5568;
    float _5574 = -_5572;
    float _5576 = _5574 + 1.0;
    float _5578 = fma(_5576, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5572);
    float _5580 = _5554 + _5089;
    float _5582 = _5566 * _5578;
    float _5584 = _5580 * 0.5;
    float _5586 = _5580;
    float _5588 = _5117;
    if (!_5095)
    {
        _5586 = 1.0;
    }
    float _5590 = _5586;
    out.gl_Position.x = _5117;
    out.gl_Position.y = _5119;
    out.gl_Position.z = _5554;
    out.gl_Position.w = _5089;
    float _5592 = _5582 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5594 = _5590;
    if (_5095)
    {
        bool _5596 = _5191 >= _5155;
        bool _5598 = isnan(_5191);
        bool _5600 = _5596 || _5598;
        bool _5602 = isnan(_5155);
        bool _5604 = _5600 || _5602;
        float _5606 = float(_5604);
        _5594 = _5606;
    }
    float _5608 = _5594;
    float _5610 = _5548 * _5193;
    out.m_93.z = _5584;
    out.m_93.w = _5089;
    float _5612 = _5530 * _5592;
    float _5614 = precise::clamp(_5612, 0.0, 1.0);
    float _5616 = -_5548;
    float _5618 = _5616 + 1.0;
    float _5620 = _5608 * _5278;
    bool _5622 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5624 = isnan(_5438);
    bool _5626 = _5622 || _5624;
    bool _5628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5630 = _5626 || _5628;
    float _5632 = -_5614;
    float _5634 = fma(_5632, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5636 = _5204 * _5618;
    float _5638 = -_5620;
    float _5640 = fma(_5638, _5634, 1.0);
    float _5642 = precise::clamp(_5640, 0.0, 1.0);
    float _5644 = _5204 * _5610;
    float _5646 = _5642 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5648 = _5620;
    float _5650 = _5642;
    float _5652 = _5610;
    if (!_5630)
    {
        _5588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5654 = _5588;
    out.m_95.x = _5646;
    float _5656 = _5654;
    float _5658 = _5654;
    if (!_5630)
    {
        _5123 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5660 = _5123;
    float _5662 = _5660;
    float _5664 = _5660;
    if (!_5630)
    {
        _5648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5666 = _5648;
    float _5668 = _5666;
    float _5670 = _5666;
    if (!_5630)
    {
        _5161 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5672 = _5161;
    float _5674 = _5672;
    float _5676 = _5672;
    if (!_5630)
    {
        _5650 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5678 = _5650;
    float _5680 = _5520 * _5610;
    float _5682 = fma(_5516, _5644, _5198);
    float _5684 = fma(_5518, _5644, _5200);
    float _5686 = _5678;
    float _5688 = _5678;
    if (!_5630)
    {
        _5652 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5690 = _5652;
    float _5692 = fma(_5204, _5680, _5202);
    out.m_97.x = _5682;
    out.m_97.y = _5684;
    out.m_97.z = _5692;
    out.m_97.w = _5636;
    bool _5694 = !_5630;
    float _5696 = _5690;
    float _5698 = _5690;
    if (!_5694)
    {
        bool _5700 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5702 = isnan(_5438);
        bool _5704 = _5700 || _5702;
        bool _5706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5708 = _5704 || _5706;
        if (!_5708)
        {
            float _5710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5712 = _5438 + _5710;
            float _5714 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5716 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5714;
            float _5718 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5720 = _5718 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5722 = 1.0 / _5716;
            float _5724 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5726 = _5724 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5728 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5730 = _5728 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5732 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5734 = _5732 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5736 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5738 = _5736 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5740 = _5712 * _5722;
            float _5742 = precise::clamp(_5740, 0.0, 1.0);
            float _5744 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5746 = _5744 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5748 = fma(_5742, _5720, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5750 = fma(_5742, _5746, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5752 = fma(_5742, _5726, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5754 = fma(_5742, _5730, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5756 = fma(_5742, _5734, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5758 = fma(_5742, _5738, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5698 = _5752;
            _5676 = _5756;
            _5658 = _5748;
            _5670 = _5754;
            _5664 = _5750;
            _5688 = _5758;
            _5760 = true;
        }
        else
        {
            bool _5762 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5764 = isnan(_5438);
            bool _5766 = _5762 || _5764;
            bool _5768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5770 = _5766 || _5768;
            if (!_5770)
            {
                _5656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5772 = _5656;
            _5658 = _5772;
            if (!_5770)
            {
                _5696 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5774 = _5696;
            _5698 = _5774;
            if (!_5770)
            {
                _5662 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5776 = _5662;
            _5664 = _5776;
            if (!_5770)
            {
                _5668 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5778 = _5668;
            _5670 = _5778;
            if (!_5770)
            {
                _5674 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5780 = _5674;
            _5676 = _5780;
            if (!_5770)
            {
                _5686 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5782 = _5686;
            bool _5784 = !_5770;
            _5688 = _5782;
            if (!_5784)
            {
                bool _5786 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5788 = isnan(_5438);
                bool _5790 = _5786 || _5788;
                bool _5792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5794 = _5790 || _5792;
                if (!_5794)
                {
                    float _5796 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5798 = _5438 + _5796;
                    float _5800 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5802 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5800;
                    float _5804 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5806 = _5804 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5808 = 1.0 / _5802;
                    float _5810 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5812 = _5810 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5814 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5816 = _5814 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5818 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5820 = _5818 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5822 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5824 = _5822 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5826 = _5798 * _5808;
                    float _5828 = precise::clamp(_5826, 0.0, 1.0);
                    float _5830 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5832 = _5830 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5834 = fma(_5828, _5806, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5836 = fma(_5828, _5832, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5838 = fma(_5828, _5812, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5840 = fma(_5828, _5816, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5842 = fma(_5828, _5820, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5844 = fma(_5828, _5824, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5698 = _5838;
                    _5676 = _5842;
                    _5658 = _5834;
                    _5670 = _5840;
                    _5664 = _5836;
                    _5688 = _5844;
                    _5760 = true;
                }
                else
                {
                    _5698 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5676 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5670 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5664 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5688 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5760 = false;
    float _5846 = _5698;
    float _5848 = _5676;
    float _5850 = _5658;
    float _5852 = _5670;
    float _5854 = _5664;
    float _5856 = _5688;
    float _5858 = fma(_4485, -0.5, 0.5);
    float _5860 = precise::clamp(_5858, 0.0, 1.0);
    float _5862 = -_5846;
    float _5864 = _5862 + _5848;
    float _5866 = -_5850;
    float _5868 = _5866 + _5852;
    float _5870 = -_5854;
    float _5872 = _5870 + _5856;
    bool _5874 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5876 = fma(_5860, _5864, _5846);
    float _5878 = fma(_5860, _5868, _5850);
    float _5880 = fma(_5860, _5872, _5854);
    float _5882 = _5876 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _5884 = fma(_5878, 0.298911988735198974609375, _5882);
    float _5886 = fma(_5880, 0.114477999508380889892578125, _5884);
    out.m_99.x = 0.0;
    float _5888 = -_5886;
    float _5890 = _5878 + _5888;
    float _5892 = -_5886;
    float _5894 = _5876 + _5892;
    float _5896 = -_5886;
    float _5898 = _5880 + _5896;
    float _5900 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5902 = fma(_5890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    float _5904 = fma(_5894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    float _5906 = fma(_5898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    out.m_95.w = _5900;
    out.m_101.x = _5902;
    out.m_101.y = _5904;
    out.m_101.z = _5906;
    if (!_5874)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5908 = -_4903;
    float _5910 = _5908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5912 = -_4905;
    float _5914 = _5912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5916 = -_4907;
    float _5918 = _5916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5920 = _5910 * _5910;
    float _5922 = fma(_5914, _5914, _5920);
    float _5924 = fma(_5918, _5918, _5922);
    float _5926 = sqrt(_5924);
    float _5928 = rsqrt(_5924);
    float _5930 = -_5926;
    float _5932 = _5930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5934 = _5932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5936 = precise::clamp(_5934, 0.0, 1.0);
    float _5938 = _5914 * _5928;
    float _5940 = _5910 * _5928;
    float _5942 = abs(_5936);
    float _5944 = log2(_5942);
    float _5946 = _5918 * _5928;
    float _5948 = _5938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5950 = _4485 * _5940;
    float _5952 = -_5940;
    float _5954 = -_5948;
    float _5956 = fma(_5952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5954);
    float _5958 = fma(_4483, _5938, _5950);
    float _5960 = -_5946;
    float _5962 = fma(_5960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5956);
    float _5964 = fma(_4489, _5946, _5958);
    float _5966 = precise::clamp(_5964, 0.0, 1.0);
    float _5968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5970 = _5962 + _5968;
    float _5972 = _5944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5974 = _5970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5976 = precise::clamp(_5974, 0.0, 1.0);
    float _5978 = exp2(_5972);
    float _5980 = _5978 * _5976;
    float _5982 = _5966 * _5980;
    float _5984 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5986 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5988 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _5984;
    out.m_99.y = _5986;
    out.m_99.z = _5988;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5760 = false;
    bool _4537 = false;
    bool _1102 = false;
    bool _988 = false;
    bool _884 = false;
    bool _758 = false;
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6045 = as_type<float>(_136);
        out.gl_Position.z = _6045;
    }
    if (!_124)
    {
        return out;
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6114 = as_type<float>(_174);
        out.gl_Position.z = _6114;
    }
    if (_168)
    {
        return out;
    }
    float _176 = in.m_65.w;
    float _178 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_63.x;
    float _192 = in.m_63.y;
    float _194 = in.m_63.z;
    float _196 = in.m_58.x;
    float _198 = in.m_58.y;
    float _200 = in.m_58.z;
    float _202 = 0.0;
    float _204 = _178;
    if (!_188)
    {
        float _206 = _178 * _178;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = _210;
    if (!_188)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    bool _218 = !_188;
    float _220 = _216;
    if (!_218)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _178 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _178);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _250;
    }
    float _252 = _220;
    bool _254 = !_188;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _178 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _204 = _274;
    }
    float _276 = _204;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _190, _280);
    float _288 = fma(_276, _192, _282);
    float _290 = fma(_276, _194, _284);
    float _292 = fma(_286, _176, _196);
    float _294 = fma(_288, _176, _198);
    float _296 = fma(_290, _176, _200);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_67.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_120);
        float _322 = 1.0 / _320;
        float _324 = _154 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _330;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _354;
    float _358 = 1.0 / _338;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = _326 + _360;
    bool _364 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _366 = isnan(_326);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _378 = isnan(_326);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = 1.0 / _334;
    float _390 = _362 * _340;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _326 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    bool _400 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _402 = isnan(_326);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    bool _412 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_326);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = 1.0 / _348;
    float _428 = _394 * _358;
    bool _430 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _432 = isnan(_326);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = _326 + _442;
    bool _446 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _448 = isnan(_326);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -_440;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _352;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _466 = _326 + _464;
    float _468 = _444 * _388;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _472 = _326 + _470;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _476 = 1.0 / _356;
    float _478 = _466 * _426;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _482 = _326 + _480;
    float _484 = _456 * _460;
    float _486 = -_456;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = 1.0 / _344;
    float _496 = _374 * _488;
    float _498 = fma(_492, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = _472 * _476;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _504 = _326 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _504 * _462;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _512;
    float _516 = fma(_508, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _518 = _482 * _494;
    float _520 = -_374;
    float _522 = _520 + 1.0;
    float _524 = fma(_514, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = -_386;
    float _528 = _526 + 1.0;
    float _530 = _386 * _522;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = _410 * _528;
    bool _538 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _540 = isnan(_326);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = -_410;
    float _556 = _554 + 1.0;
    bool _558 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _560 = isnan(_326);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = fma(_534, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _572 = fma(_552, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _574 = _422 * _556;
    float _576 = -_422;
    float _578 = _576 + 1.0;
    float _580 = -_568;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = _568 * _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _590;
    float _594 = _548 * _582;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _596;
    float _600 = fma(_586, _468, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_592, _468, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _604 = _424 * _594;
    float _606 = fma(_598, _468, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = _524 * _594;
    float _614 = _516 * _594;
    float _616 = -_548;
    float _618 = _616 + 1.0;
    float _620 = fma(_610, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].x, _612);
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].y, _614);
    float _634 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].z, _604);
    float _636 = fma(_572, _588, _630);
    float _638 = fma(_570, _588, _632);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _640;
    float _644 = fma(_498, _588, _634);
    float _646 = fma(_628, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _648 = fma(_624, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _650;
    float _654 = fma(_642, _518, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _656 = fma(_606, _574, _636);
    float _658 = fma(_602, _574, _638);
    float _660 = fma(_600, _574, _644);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _670 = fma(_652, _518, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _672 = fma(_620, _536, _656);
    float _674 = fma(_648, _536, _658);
    float _676 = fma(_646, _536, _660);
    float _678 = fma(_664, _518, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _680 = fma(_668, _510, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = fma(_654, _530, _672);
    float _692 = fma(_670, _530, _674);
    float _694 = fma(_678, _530, _676);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _696;
    float _700 = fma(_684, _510, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _702;
    float _706 = fma(_688, _510, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _708;
    float _712 = fma(_680, _496, _690);
    float _714 = fma(_698, _500, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _716 = fma(_704, _500, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _718 = fma(_710, _500, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _720 = fma(_700, _496, _692);
    float _722 = fma(_706, _496, _694);
    float _724 = fma(_714, _484, _712);
    float _726 = fma(_716, _484, _720);
    float _728 = fma(_718, _484, _722);
    float _730 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].x, _724);
    float _732 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].y, _726);
    float _734 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].z, _728);
    bool _736 = !_474;
    float _738 = _670;
    float _756;
    if (!_736)
    {
        float _740 = in.m_67.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].x, _154);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_120);
        float _762 = 1.0 / _760;
        float _764 = _154 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = in.m_65.x;
    float _770 = in.m_65.y;
    float _772 = in.m_65.z;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _776 = _766 + _774;
    bool _778 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _780 = isnan(_766);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _790;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _796 = -_788;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _792;
    float _802 = _734 * _772;
    float _804 = _732 * _770;
    float _806 = _730 * _768;
    float _808 = _776 * _800;
    bool _810 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _812 = isnan(_766);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _830;
    float _834 = _820 * _798;
    float _836 = fma(_824, _808, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _838 = fma(_832, _808, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _840 = fma(_828, _808, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _842 = -_820;
    float _844 = _842 + 1.0;
    float _846 = _836 * _834;
    float _848 = _838 * _834;
    float _850 = _840 * _834;
    float _852 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].x, _846);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].y, _848);
    float _856 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].z, _850);
    float _858 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].x, _852);
    float _860 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].y, _854);
    float _862 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].z, _856);
    bool _864 = !_794;
    float _882;
    if (!_864)
    {
        float _866 = in.m_67.x;
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _870 = _866 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _874 = _872 * _868;
        float _876 = floor(_874);
        float _878 = -_876;
        float _880 = _874 + _878;
        _882 = _880;
        _884 = true;
    }
    else
    {
        float _886 = float(_120);
        float _888 = 1.0 / _886;
        float _890 = _154 * _888;
        _882 = _890;
    }
    _884 = false;
    float _892 = _882;
    bool _894 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_892);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _912 = isnan(_892);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _928 = _892 + _926;
    float _930 = -_904;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _936 = 1.0 / _908;
    float _938 = _920 * _932;
    float _940 = -_920;
    float _942 = _940 + 1.0;
    float _944 = _924 * _936;
    float _946 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = fma(_944, _928, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _950 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _948 * _938;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _960 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _962 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _958);
    float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _964;
    out.m_69.y = _956;
    out.m_69.z = _952;
    out.m_69.w = _966;
    bool _968 = !_934;
    float _986;
    if (!_968)
    {
        float _970 = in.m_67.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[11].z, _154);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_120);
        float _992 = 1.0 / _990;
        float _994 = _154 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1000 = _996 + _998;
    bool _1002 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_996);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1014;
    bool _1018 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1020 = isnan(_996);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1012;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1034;
    float _1038 = 1.0 / _1016;
    bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1042 = _1028 * _1032;
    float _1044 = -_1028;
    float _1046 = _1044 + 1.0;
    float _1048 = _1000 * _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1050;
    float _1054 = fma(_1036, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1056;
    float _1060 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1062 = _1054 * _1042;
    float _1064 = fma(_1058, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1066 = _1060 * _1042;
    float _1068 = _1064 * _1042;
    float _1070 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1062);
    float _1072 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1074 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1066);
    float _1076 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1070);
    float _1078 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1072);
    float _1080 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1074);
    bool _1082 = !_1040;
    float _1100;
    if (!_1082)
    {
        float _1084 = in.m_67.x;
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1088 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _1092 = _1090 * _1086;
        float _1094 = floor(_1092);
        float _1096 = -_1094;
        float _1098 = _1092 + _1096;
        _1100 = _1098;
        _1102 = true;
    }
    else
    {
        float _1104 = float(_120);
        float _1106 = 1.0 / _1104;
        float _1108 = _154 * _1106;
        _1100 = _1108;
    }
    _1102 = false;
    float _1110 = _1100;
    float _1112 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1114 = int(_1112);
    float _1116 = in.m_67.x;
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1120 = in.m_67.y;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1124 = _1122 != 0;
    float _1126 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1128 = int(_1126);
    float _1130 = in.m_67.z;
    float _1132 = float(_1114);
    float _1134 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1136 = int(_1134);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1142 = float(_1128);
    float _1144 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1146 = int(_1144);
    if (_1124)
    {
        _738 = _1116;
    }
    float _1148 = _738;
    float _1150 = _1148;
    if (!_1124)
    {
        _1150 = _1120;
    }
    float _1152 = _1150;
    float _1154 = 1.0 / _1132;
    float _1156 = float(_1136);
    float _1158 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1160 = int(_1158);
    float _1162 = float(uint(_1146));
    bool _1164 = _1146 == 0;
    float _1166 = 1.0 / _1142;
    float _1168 = _1154 * _154;
    float _1170 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1172 = int(_1170);
    float _1174 = float(uint(_1160));
    bool _1176 = _1160 == 0;
    float _1178 = 1.0 / _1162;
    float _1180 = _1166 * _154;
    float _1182 = _1166;
    if (_1124)
    {
        _1182 = 1.0;
    }
    float _1184 = _1182;
    float _1186 = _1184;
    if (!_1124)
    {
        _1186 = 7.345489978790283203125;
    }
    float _1188 = _1186;
    float _1190 = trunc(_1168);
    int _1192 = int(_1190);
    float _1194 = _1188 * _1116;
    float _1196 = float(uint(_1172));
    float _1198 = 1.0 / _1156;
    int _1200 = as_type<int>(_1178) + (-2);
    float _1202 = 1.0 / _1174;
    float _1204 = float(uint(_1192));
    float _1206 = trunc(_1180);
    int _1208 = int(_1206);
    float _1210 = _1198 * _154;
    float _1212 = 1.0 / _1196;
    int _1214 = as_type<int>(_1202) + (-2);
    float _1216 = _1202;
    float _1218 = _1204;
    if (_1124)
    {
        _1216 = _1116;
    }
    float _1220 = _1216;
    float _1222 = _1220;
    if (!_1124)
    {
        _1222 = _1130;
    }
    float _1224 = _1222;
    float _1226 = float(uint(_1208));
    float _1228 = as_type<float>(_1200) * _1204;
    float _1230 = trunc(_1210);
    int _1232 = int(_1230);
    float _1234 = _1228;
    if (_1124)
    {
        _1218 = 1.0;
    }
    float _1236 = _1218;
    float _1238 = as_type<float>(_1214) * _1226;
    float _1240 = _1236;
    if (!_1124)
    {
        _1240 = 1.2345600128173828125;
    }
    float _1242 = _1240;
    int _1244 = as_type<int>(_1212) + (-2);
    float _1246 = trunc(_1228);
    float _1248 = precise::max(_1246, 0.0);
    uint _1251 = uint(_1248);
    float _1253 = _1152 * _1242;
    int _1255 = ~_1146;
    int _1257 = _1255 + 1;
    float _1259 = trunc(_1238);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    if (_1124)
    {
        _1234 = 1.0;
    }
    float _1265 = _1234;
    float _1267 = _1265;
    if (!_1124)
    {
        _1267 = 5.839270114898681640625;
    }
    float _1269 = _1267;
    float _1271 = float(uint(_1232));
    float _1273 = _1224 * _1269;
    int _1275 = ~_1160;
    int _1277 = _1275 + 1;
    int _1279 = _1257 * int(_1251);
    int _1281 = _1279 + _1192;
    float _1283 = as_type<float>(_1244) * _1271;
    float _1285 = floor(_1273);
    float _1287 = float(uint(_1281));
    int _1289 = _1277 * int(_1263);
    int _1291 = _1289 + _1208;
    float _1293 = trunc(_1283);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = as_type<float>(_1200) * _1287;
    float _1301 = float(uint(_1291));
    float _1303 = as_type<float>(_1214) * _1301;
    float _1305 = floor(_1253);
    int _1307 = ~_1172;
    int _1309 = _1307 + 1;
    float _1311 = float(_1146);
    int _1313 = _1309 * int(_1297);
    int _1315 = _1313 + _1232;
    float _1317 = floor(_1194);
    float _1319 = float(uint(_1315));
    float _1321 = trunc(_1303);
    float _1323 = precise::max(_1321, 0.0);
    uint _1325 = uint(_1323);
    float _1327 = -_1305;
    float _1329 = _1253 + _1327;
    float _1331 = as_type<float>(_1244) * _1319;
    float _1333 = -_1285;
    float _1335 = _1273 + _1333;
    float _1337 = float(_1192);
    int _1339 = ~_1160;
    int _1341 = _1339 + 1;
    float _1343 = trunc(_1299);
    float _1345 = precise::max(_1343, 0.0);
    uint _1347 = uint(_1345);
    float _1349 = -_1317;
    float _1351 = _1194 + _1349;
    bool _1353 = _1337 >= _1311;
    bool _1355 = isnan(_1337);
    bool _1357 = _1353 || _1355;
    bool _1359 = isnan(_1311);
    bool _1361 = _1357 || _1359;
    float _1363 = float(_1361);
    float _1365 = float(_1160);
    int _1367 = ~_1146;
    int _1369 = _1367 + 1;
    int _1371 = int(_1263) + int(_1325);
    float _1373 = trunc(_1363);
    int _1375 = int(_1373);
    int _1377 = _1341 * _1371;
    int _1379 = _1377 + _1208;
    int _1381 = int(_1251) + int(_1347);
    float _1383 = _1351 * _1311;
    float _1385 = _1365 * _1329;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1389 = _1387 != 0;
    float _1391 = trunc(_1331);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    int _1397 = _1369 * _1381;
    int _1399 = _1397 + _1192;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1403 = _1401 != 0;
    float _1405 = _1311 * _154;
    bool _1407 = uint(_1379) >= uint(_1160);
    float _1409 = float(_1208);
    float _1411 = float(_120);
    float _1413 = trunc(_1385);
    int _1415 = int(_1413);
    bool _1417 = uint(_1399) >= uint(_1146);
    bool _1419 = !_1389;
    int _1421 = _1419 ? 0 : 1;
    bool _1423 = !_1403;
    int _1425 = _1423 ? 0 : 1;
    bool _1427 = _1409 >= _1365;
    bool _1429 = isnan(_1409);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(_1365);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = trunc(_1383);
    int _1441 = int(_1439);
    int _1443 = abs(_1421);
    int _1445 = abs(_1425);
    bool _1447 = !_1417;
    int _1449 = _1447 ? 0 : (-1);
    bool _1451 = !_1407;
    int _1453 = _1451 ? 0 : (-1);
    float _1455 = 1.0 / _1411;
    int _1457 = ~_1381;
    int _1459 = _1457 + _1449;
    int _1461 = _1459 + 1;
    int _1463 = _1415 * _1445;
    int _1465 = _1463 + _1208;
    int _1467 = ~_1371;
    int _1469 = _1467 + _1453;
    int _1471 = _1469 + 1;
    int _1473 = int(_1297) + int(_1395);
    int _1475 = _1146 * _1461;
    int _1477 = _1475 + _1192;
    float _1479 = trunc(_1437);
    int _1481 = int(_1479);
    int _1483 = _1160 * _1471;
    int _1485 = _1483 + _1208;
    int _1487 = _1441 * _1443;
    int _1489 = _1487 + _1192;
    int _1491 = ~_1375;
    int _1493 = _1491 + 1;
    int _1495 = _1493 + 1;
    bool _1497 = !_1164;
    int _1499 = _1497 ? _1477 : (-1);
    bool _1501 = !_1176;
    int _1503 = _1501 ? _1485 : (-1);
    float _1505 = _1405 * _1455;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1509 = _1507 != 0;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1513 = _1511 != 0;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1517 = _1515 != 0;
    int _1519 = _1499 * _1495;
    int _1521 = ~_1172;
    int _1523 = _1521 + 1;
    float _1525 = _1455 * _154;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1529 = _1527 != 0;
    float _1531 = trunc(_1505);
    int _1533 = int(_1531);
    int _1535 = ~_1481;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    float _1541 = _1365 * _1525;
    bool _1543 = !_1513;
    int _1545 = _1543 ? 0 : 1;
    bool _1547 = !_1509;
    int _1549 = _1547 ? 0 : 1;
    int _1551 = _1539 * _1503;
    float _1553 = trunc(_1541);
    int _1555 = int(_1553);
    int _1557 = _1146 + (-1);
    int _1559 = abs(_1545);
    int _1561 = _1523 * _1473;
    int _1563 = _1561 + _1232;
    int _1565 = _1160 + (-1);
    int _1567 = _1375 * _1557;
    int _1569 = _1567 + _1519;
    int _1571 = abs(_1549);
    int _1573 = _1481 * _1565;
    int _1575 = _1573 + _1551;
    float _1577 = in.m_71.x;
    bool _1579 = uint(_1563) >= uint(_1172);
    int _1581 = _1569 * _1559;
    bool _1583 = !_1517;
    int _1585 = _1583 ? 0 : 1;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1589 = _1587 != 0;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1593 = _1591 != 0;
    int _1595 = _1533 * _1571;
    int _1597 = _1595 + _1581;
    bool _1599 = !_1529;
    int _1601 = _1599 ? 0 : 1;
    int _1603 = abs(_1585);
    bool _1605 = !_1593;
    int _1607 = _1605 ? 0 : 1;
    int _1609 = abs(_1601);
    float _1611 = float(_1172);
    float _1613 = float(_1232);
    int _1615 = _1489 * _1603;
    int _1617 = _1615 + _1597;
    int _1619 = abs(_1607);
    bool _1621 = _1613 >= _1611;
    bool _1623 = isnan(_1613);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan(_1611);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    int _1633 = _1575 * _1619;
    bool _1635 = !_1589;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = _1441 * _1609;
    int _1641 = _1639 + _1617;
    bool _1643 = !_1579;
    int _1645 = _1643 ? 0 : (-1);
    float _1647 = trunc(_1631);
    int _1649 = int(_1647);
    int _1651 = abs(_1637);
    float _1653 = float(uint(_1641));
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1661 = _1659 != 0;
    int _1663 = _1555 * _1651;
    int _1665 = _1663 + _1633;
    int _1667 = ~_1473;
    int _1669 = _1667 + _1645;
    int _1671 = _1669 + 1;
    float _1673 = as_type<float>(_1200) * _1653;
    bool _1675 = _1172 == 0;
    float _1677 = _1611 * _1525;
    bool _1679 = !_1657;
    int _1681 = _1679 ? 0 : 1;
    int _1683 = _1172 * _1671;
    int _1685 = _1683 + _1232;
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = _1611 * _1335;
    int _1695 = abs(_1681);
    int _1697 = ~_1649;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    bool _1703 = !_1675;
    float _1705 = _1703 ? as_type<float>(_1685) : as_type<float>(0xffffffffu /* nan */);
    int _1707 = ~_1146;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1677);
    int _1713 = int(_1711);
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1717 = _1715 != 0;
    int _1719 = _1701 * as_type<int>(_1705);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1723 = _1721 != 0;
    int _1725 = _1465 * _1695;
    int _1727 = _1725 + _1665;
    bool _1729 = !_1661;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = _1172 + (-1);
    int _1735 = _1709 * int(_1691);
    int _1737 = _1735 + _1641;
    int _1739 = abs(_1731);
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1743 = _1741 != 0;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1747 = _1745 != 0;
    int _1749 = _1649 * _1733;
    int _1751 = _1749 + _1719;
    float _1753 = float(uint(_1737));
    int _1755 = _1415 * _1739;
    int _1757 = _1755 + _1727;
    float _1759 = _1705;
    float _1761 = as_type<float>(_1609);
    bool _1763 = _1723;
    if (!_1717)
    {
        _1759 = _1577;
    }
    float _1765 = _1759;
    float _1767 = trunc(_1693);
    int _1769 = int(_1767);
    bool _1771 = !_1747;
    int _1773 = _1771 ? 0 : 1;
    float _1775 = as_type<float>(_1200) * _1753;
    float _1777 = _1765;
    if (!_1717)
    {
        _1761 = _1765;
    }
    float _1779 = _1761;
    bool _1781 = !_1723;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = _1783;
    float _1787 = _1779;
    if (_1717)
    {
        _1777 = _1577;
    }
    float _1789 = _1777;
    float _1791 = trunc(_1775);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = float(uint(_1757));
    bool _1799 = !_1743;
    int _1801 = _1799 ? 0 : 1;
    int _1803 = abs(_1773);
    float _1805 = as_type<float>(_1214) * _1797;
    int _1807 = abs(_1783);
    float _1809 = _1789;
    if (_1717)
    {
        float _1811 = -_1789;
        float _1813 = _1811 + 1.0;
        _1785 = as_type<int>(_1813);
    }
    int _1815 = _1785;
    if (_1717)
    {
        bool _1817 = _1116 > 0.5;
        _1763 = _1817;
    }
    bool _1819 = _1763;
    int _1821 = abs(_1801);
    int _1823 = _1769 * _1807;
    int _1825 = _1823 + _1232;
    float _1827 = trunc(_1805);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    int _1833 = _1769;
    if (_1717)
    {
        float _1835 = _1819 ? as_type<float>(_1815) : _1789;
        _1787 = _1835;
    }
    float _1837 = _1787;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1841 = _1839 != 0;
    int _1843 = _1751 * _1803;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1847 = _1845 != 0;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : 1;
    int _1853 = _1713 * _1821;
    int _1855 = _1853 + _1843;
    bool _1857 = !_1847;
    int _1859 = _1857 ? 0 : 1;
    float _1861 = in.m_71.y;
    int _1863 = int(_1691) + int(_1795);
    int _1865 = ~_1146;
    int _1867 = _1865 + 1;
    int _1869 = abs(_1851);
    int _1871 = abs(_1859);
    int _1873 = _1867 * _1863;
    int _1875 = _1873 + _1641;
    int _1877 = ~_1160;
    int _1879 = _1877 + 1;
    int _1881 = _1825 * _1869;
    int _1883 = _1881 + _1855;
    int _1885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1887 = _1885 != 0;
    int _1889 = _1879 * int(_1831);
    int _1891 = _1889 + _1757;
    float _1893 = in.m_67.w;
    int _1895 = _1769 * _1871;
    int _1897 = _1895 + _1883;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1901 = _1899 != 0;
    float _1903 = float(uint(_1891));
    float _1905 = float(uint(_1897));
    bool _1907 = uint(_1875) >= uint(_1146);
    float _1909 = as_type<float>(_1214) * _1903;
    int _1911 = ~_1172;
    int _1913 = _1911 + 1;
    float _1915 = as_type<float>(_1244) * _1905;
    bool _1917 = !_1907;
    int _1919 = _1917 ? 0 : (-1);
    float _1921 = as_type<float>(_1879);
    int _1923 = _1855;
    if (_1887)
    {
        float _1925 = -_1789;
        float _1927 = _1925 + 1.0;
        _1833 = as_type<int>(_1927);
    }
    int _1929 = _1833;
    bool _1931 = _1130 > 0.5;
    float _1933 = trunc(_1909);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    if (!_1887)
    {
        _1921 = _1789;
    }
    float _1939 = _1921;
    float _1941 = _1939;
    if (_1901)
    {
        float _1943 = -_1789;
        float _1945 = _1943 + 1.0;
        _1923 = as_type<int>(_1945);
    }
    int _1947 = _1923;
    if (_1887)
    {
        float _1949 = _1931 ? as_type<float>(_1929) : _1789;
        _1941 = _1949;
    }
    float _1951 = _1941;
    float _1953 = -_1861;
    float _1955 = _1953 + 1.0;
    bool _1957 = _1120 > 0.5;
    int _1959 = ~_1863;
    int _1961 = _1959 + _1919;
    int _1963 = _1961 + 1;
    float _1965 = trunc(_1915);
    float _1967 = precise::max(_1965, 0.0);
    uint _1969 = uint(_1967);
    float _1971 = _1861;
    if (_1901)
    {
        float _1973 = _1957 ? as_type<float>(_1947) : _1789;
        _1809 = _1973;
    }
    float _1975 = _1809;
    bool _1977 = _1893 > 0.5;
    int _1979 = _1146 * _1963;
    int _1981 = _1979 + _1641;
    int _1983 = _1957 ? as_type<int>(_1955) : as_type<int>(_1861);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1987 = _1985 != 0;
    int _1989 = int(_1831) + int(_1937);
    float _1991 = _1987 ? as_type<float>(_1983) : _1861;
    int _1993 = ~_1160;
    int _1995 = _1993 + 1;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1999 = _1997 != 0;
    int _2001 = _1913 * int(_1969);
    int _2003 = _2001 + _1897;
    int _2005 = _1977 ? as_type<int>(_1955) : as_type<int>(_1861);
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2009 = _2007 != 0;
    float _2011 = float(uint(_2003));
    int _2013 = _1995 * _1989;
    int _2015 = _2013 + _1757;
    bool _2017 = _1146 == 0;
    float _2019 = _2009 ? as_type<float>(_2005) : _1861;
    float _2021 = as_type<float>(_1244) * _2011;
    bool _2023 = uint(_2015) >= uint(_1160);
    bool _2025 = !_2017;
    int _2027 = _2025 ? _1981 : (-1);
    if (_1999)
    {
        float _2029 = _1931 ? _1955 : _1861;
        _1971 = _2029;
    }
    float _2031 = _1971;
    float _2033 = trunc(_2021);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = !_2023;
    int _2041 = _2039 ? 0 : (-1);
    int _2043 = _2027 & 3;
    bool _2045 = _2043 != 0;
    int _2047 = _2027 & 3;
    bool _2049 = _2047 != 0;
    int _2051 = ~_1989;
    int _2053 = _2051 + _2041;
    int _2055 = _2053 + 1;
    bool _2057 = uint(_2043) >= 2u;
    int _2059 = _2049 ? 0 : 1;
    int _2061 = _1160 * _2055;
    int _2063 = _2061 + _1757;
    bool _2065 = uint(_2043) > 1u;
    int _2067 = _2057 ? 0 : 1;
    bool _2069 = _2043 != 3;
    bool _2071 = _1160 == 0;
    int _2073 = ~_2059;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2071;
    int _2081 = _2079 ? _2063 : (-1);
    int _2083 = ~_1172;
    int _2085 = _2083 + 1;
    int _2087 = int(_1969) + int(_2037);
    int _2089 = _2077;
    if (!_2065)
    {
        int _2091 = ~_2059;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    int _2097 = _2081 & 3;
    bool _2099 = _2097 != 0;
    int _2101 = _2085 * _2087;
    int _2103 = _2101 + _1897;
    int _2105 = ~_2067;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = _2109;
    if (_2069)
    {
        int _2113 = ~_2067;
        int _2115 = _2113 + 1;
        _2111 = _2115;
    }
    int _2117 = _2111;
    bool _2119 = uint(_2097) >= 2u;
    int _2121 = _2099 ? 0 : 1;
    int _2123 = _2119 ? 0 : 1;
    bool _2125 = uint(_2103) >= uint(_1172);
    bool _2127 = _2097 != 3;
    float _2129 = float(uint(_1489));
    bool _2131 = !_2125;
    int _2133 = _2131 ? 0 : (-1);
    bool _2135 = uint(_2097) > 1u;
    float _2137 = as_type<float>(_1200) * _2129;
    float _2139 = float(uint(_1465));
    int _2141 = ~_2087;
    int _2143 = _2141 + _2133;
    int _2145 = _2143 + 1;
    int _2147 = ~_2123;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2137);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    float _2159 = as_type<float>(_1214) * _2139;
    int _2161 = _2151;
    if (_2127)
    {
        int _2163 = ~_2123;
        int _2165 = _2163 + 1;
        _2161 = _2165;
    }
    int _2167 = _2161;
    float _2169 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2171 = ~_2121;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2179 = _2177 != 0;
    int _2181 = _2175;
    if (!_2135)
    {
        int _2183 = ~_2121;
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    int _2189 = _1172 * _2145;
    int _2191 = _2189 + _1897;
    float _2193 = trunc(_2159);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    bool _2199 = !_2179;
    int _2201 = _2199 ? 0 : 1;
    float _2203 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2205 = ~_1146;
    int _2207 = _2205 + 1;
    float _2209 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2169);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2213 = _2211 != 0;
    float _2215 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2203);
    int _2217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2219 = _2217 != 0;
    float _2221 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2223 = !_1675;
    int _2225 = _2223 ? _2191 : (-1);
    float _2227 = float(uint(_1825));
    int _2229 = ~_1160;
    int _2231 = _2229 + 1;
    int _2233 = _2207 * int(_2157);
    int _2235 = _2233 + _1489;
    bool _2237 = !_2213;
    int _2239 = _2237 ? 0 : 1;
    float _2241 = as_type<float>(_1244) * _2227;
    int _2243 = _2225 & 3;
    bool _2245 = _2243 != 0;
    int _2247 = _2231 * int(_2197);
    int _2249 = _2247 + _1465;
    float _2251 = float(uint(_2235));
    float _2253 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2221);
    float _2255 = trunc(_2241);
    float _2257 = precise::max(_2255, 0.0);
    uint _2259 = uint(_2257);
    int _2261 = _2245 ? 0 : 1;
    float _2263 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2265 = float(uint(_2249));
    float _2267 = as_type<float>(_1200) * _2251;
    bool _2269 = uint(_2243) >= 2u;
    float _2271 = _1116 * 2.0;
    int _2273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2275 = _2273 != 0;
    float _2277 = as_type<float>(_1214) * _2265;
    int _2279 = ~_1172;
    int _2281 = _2279 + 1;
    float _2283 = floor(_2271);
    int _2285 = _2269 ? 0 : 1;
    bool _2287 = _2243 != 3;
    int _2289 = ~_2285;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = _2281 * int(_2259);
    int _2297 = _2295 + _1825;
    float _2299 = trunc(_2277);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2307 = float(uint(_2297));
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2311 = ~_2261;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2319 = _2225 >> 31;
    float _2321 = as_type<float>(_1244) * _2307;
    int _2323 = _2293;
    int _2325 = as_type<int>(_2263);
    int _2327 = _2315;
    int _2329 = as_type<int>(_2215);
    if (_2287)
    {
        int _2331 = ~_2285;
        int _2333 = _2331 + 1;
        _2323 = _2333;
    }
    int _2335 = _2323;
    float _2337 = -_2309;
    float _2339 = fma(_2263, 2.0, _2337);
    bool _2341 = uint(_2243) > 1u;
    float _2343 = trunc(_2321);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    bool _2349 = !_2219;
    int _2351 = _2349 ? 0 : 1;
    float _2353 = fma(_2305, -2.0, _2317);
    if (_2275)
    {
        _2325 = 0;
    }
    int _2355 = _2325;
    float _2357 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2215);
    bool _2359 = _2283 > 0.0;
    float _2361 = -_154;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2339);
    int _2365 = _2355;
    if (!_2275)
    {
        _2365 = 1;
    }
    int _2367 = _2365;
    float _2369 = trunc(_2267);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = int(_2197) + int(_2303);
    float _2377 = _2357 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2379 = ~_1160;
    int _2381 = _2379 + 1;
    if (!_2341)
    {
        int _2383 = ~_2261;
        int _2385 = _2383 + 1;
        _2327 = _2385;
    }
    int _2387 = _2327;
    bool _2389 = _2283 >= 0.0;
    bool _2391 = isnan(_2283);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2209);
    int _2401 = int(_2259) + int(_2347);
    float _2403 = _1120 * 2.0;
    int _2405 = ~_1146;
    int _2407 = _2405 + 1;
    float _2409 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2253);
    int _2411 = _2397 ? 0 : 1;
    float _2413 = _2399 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2415 = _2367 != 1;
    float _2417 = floor(_2403);
    int _2419 = int(_2157) + int(_2373);
    float _2421 = _2409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2423 = ~_2411;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    int _2429 = _2407 * _2419;
    int _2431 = _2429 + _1489;
    int _2433 = _2427;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].w;
    if (!_2359)
    {
        int _2437 = ~_2411;
        int _2439 = _2437 + 1;
        _2433 = _2439;
    }
    int _2441 = _2433;
    int _2443 = _2381 * _2375;
    int _2445 = _2443 + _1465;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2451 = ~_1172;
    int _2453 = _2451 + 1;
    bool _2455 = uint(_2431) >= uint(_1146);
    float _2457 = 1.0 / _2449;
    bool _2459 = uint(_2445) >= uint(_1160);
    float _2461 = _1130 * 2.0;
    float _2463 = 0.0;
    if (!_2415)
    {
        _2463 = _1120;
    }
    float _2465 = _2463;
    bool _2467 = !_2455;
    int _2469 = _2467 ? 0 : (-1);
    float _2471 = 0.0;
    float _2473 = _2465;
    if (!_2415)
    {
        _2471 = _2465;
    }
    float _2475 = _2471;
    int _2477 = _2453 * _2401;
    int _2479 = _2477 + _1825;
    float _2481 = _2475;
    if (!_2415)
    {
        _2435 = _1130;
    }
    float _2483 = _2435;
    float _2485 = floor(_2461);
    float _2487 = 0.0;
    float _2489 = _2483;
    if (!_2415)
    {
        _2487 = _1130;
    }
    float _2491 = _2487;
    bool _2493 = _2417 > 0.0;
    float _2495 = _2491;
    if (_2415)
    {
        _2481 = _1116;
    }
    float _2497 = _2481;
    if (_2415)
    {
        _2473 = _1116;
    }
    float _2499 = _2473;
    if (_2415)
    {
        _2489 = _1120;
    }
    float _2501 = _2489;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2505 = _1110 + _2503;
    if (_2415)
    {
        _2495 = _1120;
    }
    float _2507 = _2495;
    bool _2509 = uint(_2479) >= uint(_1172);
    bool _2511 = !_2459;
    int _2513 = _2511 ? 0 : (-1);
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1138);
    bool _2517 = _2417 >= 0.0;
    bool _2519 = isnan(_2417);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(0.0);
    bool _2525 = _2521 || _2523;
    float _2527 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2529 = !_2509;
    int _2531 = _2529 ? 0 : (-1);
    float _2533 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2515);
    int _2535 = _2525 ? 0 : 1;
    bool _2537 = !_2045;
    int _2539 = _2537 ? 0 : 1;
    int _2541 = _2081 & 3;
    bool _2543 = _2541 != 0;
    int _2545 = _2225 & 3;
    bool _2547 = _2545 != 0;
    if (_2275)
    {
        _2329 = 0;
    }
    int _2549 = _2329;
    int _2551 = _2549;
    if (!_2275)
    {
        _2551 = 2;
    }
    int _2553 = _2551;
    int _2555 = ~_2535;
    int _2557 = _2555 + 1;
    int _2559 = _2557 + 1;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2563 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2561;
    int _2565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2567 = _2565 != 0;
    int _2569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2571 = _2569 != 0;
    int _2573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2575 = _2573 != 0;
    int _2577 = _2559;
    if (!_2493)
    {
        int _2579 = ~_2535;
        int _2581 = _2579 + 1;
        _2577 = _2581;
    }
    int _2583 = _2577;
    float _2585 = _2563 * _2457;
    bool _2587 = _2485 >= 0.0;
    bool _2589 = isnan(_2485);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = _1120 + _1130;
    bool _2599 = _1110 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2601 = isnan(_1110);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2607 = _2603 || _2605;
    float _2609 = float(_2607);
    float _2611 = fma(_2585, _2505, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2613 = _2595 ? 0 : 1;
    float _2615 = _2597 + (-1.0);
    bool _2617 = _2553 != 2;
    float _2619 = -_2609;
    float _2621 = _2619 + 1.0;
    bool _2623 = !_2547;
    int _2625 = _2623 ? 0 : 1;
    bool _2627 = _1110 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2629 = isnan(_1110);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    bool _2639 = _2485 > 0.0;
    float _2641 = _1116 + _1120;
    int _2643 = ~_2613;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    float _2649 = _2637 * _2621;
    bool _2651 = !_2543;
    int _2653 = _2651 ? 0 : 1;
    float _2655 = _2641 + (-1.0);
    float _2657 = -_2637;
    float _2659 = _2657 + 1.0;
    float _2661 = _2611 * _2649;
    float _2663 = _2637;
    int _2665 = _2647;
    if (_2617)
    {
        _2663 = _1116;
    }
    float _2667 = _2663;
    float _2669 = fma(_2655, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2671 = _2667;
    if (!_2617)
    {
        _2671 = _1130;
    }
    float _2673 = _2671;
    float _2675 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2661);
    float _2677 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_2639)
    {
        int _2679 = ~_2613;
        int _2681 = _2679 + 1;
        _2665 = _2681;
    }
    int _2683 = _2665;
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2687 = _2377 + _2685;
    bool _2689 = _2097 != 3;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _2421 + _2691;
    bool _2695 = _2043 != 3;
    float _2697 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2701 = fma(_2609, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2675);
    bool _2703 = !_2689;
    int _2705 = _2703 ? 0 : (-1);
    float _2707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2709 = _2413 + _2707;
    bool _2711 = _2243 != 3;
    float _2713 = _2693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2715 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2717 = -_2699;
    float _2719 = fma(_2697, 2.0, _2717);
    float _2721 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2723 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2713);
    float _2725 = _2715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2727 = _2081 >> 31;
    float _2729 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2731 = _2027 >> 31;
    float _2733 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2735 = _2727 & 3;
    float _2737 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2723);
    int _2739 = _2731 & 3;
    float _2741 = _2701 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2743 = _2319 & 3;
    float _2745 = -_154;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2719);
    int _2749 = _2081 + _2735;
    bool _2751 = !_2711;
    int _2753 = _2751 ? 0 : (-1);
    out.m_73.x = _2729;
    out.m_73.y = _2725;
    out.m_73.z = _2733;
    out.m_73.w = _2741;
    int _2755 = _2027 + _2739;
    bool _2757 = _2737 >= 0.0;
    int _2759 = _2225 + _2743;
    int _2761 = _2749 >> 2;
    int _2763 = _2755 >> 2;
    int _2765 = _2761 << 4;
    int _2767 = _2765 + 512;
    float _2769 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2771 = _2763 << 4;
    int _2773 = _2771 + 368;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _2777 = uint(int(uint(_2767) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    float _2793 = _2775;
    if (_2757)
    {
        out.m_61.x = 0.0;
    }
    bool _2795 = !_2571;
    int _2797 = _2795 ? 0 : 1;
    float _2799 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2775);
    int _2801 = _2759 >> 2;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2805 = !_2567;
    int _2807 = _2805 ? 0 : 1;
    uint _2809 = uint(int(uint(_2773) >> uint(2)));
    uint _2811 = uint(int(uint(int(_2809)) >> uint(2)));
    int _2813 = int(_2809) & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = int(_2809) + 1;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    int _2821 = _2817 & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    int _2825 = abs(_2797);
    float _2827 = -_1140;
    float _2829 = fma(_2769, 2.0, _2827);
    int _2831 = _2801 << 4;
    int _2833 = _2831 + 656;
    float _2835 = float(_2441);
    float _2837 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2799);
    int _2839 = abs(_2807);
    int _2841 = _2773 + 8;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    uint _2845 = uint(int(uint(int(_2843)) >> uint(2)));
    int _2847 = int(_2843) & 3;
    float _2849 = (*spvDescriptorSet0.vp_c9)._m0[int(_2845)][_2847];
    int _2851 = int(_2843) + 1;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    int _2855 = _2851 & 3;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[int(_2853)][_2855];
    float _2859 = float(_2683);
    float _2861 = fma(_2527, -2.0, _2803);
    int _2863 = ~_2419;
    int _2865 = _2863 + _2469;
    int _2867 = _2865 + 1;
    float _2869 = -_154;
    float _2871 = fma(_2869, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2829);
    int _2873 = ~_2375;
    int _2875 = _2873 + _2513;
    int _2877 = _2875 + 1;
    float _2879 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2861);
    int _2881 = ~_2401;
    int _2883 = _2881 + _2531;
    int _2885 = _2883 + 1;
    uint _2887 = uint(int(uint(_2833) >> uint(2)));
    uint _2889 = uint(int(uint(int(_2887)) >> uint(2)));
    int _2891 = int(_2887) & 3;
    float _2893 = (*spvDescriptorSet0.vp_c9)._m0[int(_2889)][_2891];
    int _2895 = int(_2887) + 1;
    uint _2897 = uint(int(uint(_2895) >> uint(2)));
    int _2899 = _2895 & 3;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[int(_2897)][_2899];
    float _2903 = float(_2839);
    int _2905 = _1146 * _2867;
    int _2907 = _2905 + _1489;
    if (_2757)
    {
        _2793 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2909 = _2793;
    int _2911 = _1172 * _2885;
    int _2913 = _2911 + _1825;
    int _2915 = abs(_2387);
    float _2917 = _2903 * _2859;
    int _2919 = abs(_2095);
    int _2921 = _2767 + 8;
    uint _2923 = uint(int(uint(_2921) >> uint(2)));
    uint _2925 = uint(int(uint(int(_2923)) >> uint(2)));
    int _2927 = int(_2923) & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = int(_2923) + 1;
    uint _2933 = uint(int(uint(_2931) >> uint(2)));
    int _2935 = _2931 & 3;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[int(_2933)][_2935];
    int _2939 = abs(_2187);
    int _2941 = as_type<int>(_2909);
    if (_2757)
    {
        float _2943 = _2909 * 5.0;
        _2941 = as_type<int>(_2943);
    }
    int _2945 = _2941;
    float _2947 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2949 = int(_2947);
    int _2951 = abs(_2117);
    int _2953 = _1160 * _2877;
    int _2955 = _2953 + _1465;
    bool _2957 = !_2695;
    int _2959 = _2957 ? 0 : (-1);
    if (_2757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10235 = as_type<float>(_2945);
        out.gl_Position.z = _10235;
    }
    int _2961 = _2833 + 8;
    uint _2963 = uint(int(uint(_2961) >> uint(2)));
    uint _2965 = uint(int(uint(int(_2963)) >> uint(2)));
    int _2967 = int(_2963) & 3;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[int(_2965)][_2967];
    int _2971 = int(_2963) + 1;
    uint _2973 = uint(int(uint(_2971) >> uint(2)));
    int _2975 = _2971 & 3;
    float _2977 = (*spvDescriptorSet0.vp_c9)._m0[int(_2973)][_2975];
    int _2979 = ~_2951;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    int _2985 = abs(_2959);
    bool _2987 = _1146 == 0;
    float _2989 = float(_2825);
    float _2991 = _2989 * _2835;
    float _2993 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2995 = int(_2993);
    int _2997 = ~_2939;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = _2991 * (-2.0);
    int _3005 = ~_2919;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    int _3011 = ~_2915;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    int _3017 = _3001 * as_type<int>(_2791);
    int _3019 = abs(_2653);
    int _3021 = _3009 * as_type<int>(_2823);
    int _3023 = abs(_2539);
    float _3025 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3027 = int(_3025);
    int _3029 = ~_3019;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = fma(_2677, _3003, _2677);
    int _3037 = ~_3023;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    int _3043 = abs(_2625);
    int _3045 = _3033 * as_type<int>(_2783);
    int _3047 = _3045 + _3017;
    int _3049 = abs(_2167);
    int _3051 = _3041 * as_type<int>(_2815);
    int _3053 = _3051 + _3021;
    int _3055 = ~_3043;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    int _3061 = _3015 * as_type<int>(_2901);
    int _3063 = ~_3049;
    int _3065 = _3063 + 1;
    int _3067 = _3065 + 1;
    int _3069 = _2983 * as_type<int>(_2849);
    int _3071 = _3069 + _3053;
    int _3073 = abs(_2705);
    int _3075 = _3059 * as_type<int>(_2893);
    int _3077 = _3075 + _3061;
    int _3079 = _3067 * as_type<int>(_2929);
    int _3081 = _3079 + _3047;
    float _3083 = float(uint(_2949));
    float _3085 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3087 = log2(_3085);
    int _3089 = ~_2985;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    int _3095 = abs(_2335);
    float _3097 = float(uint(_2995));
    int _3099 = _3093 * as_type<int>(_2857);
    int _3101 = _3099 + _3071;
    int _3103 = ~_3095;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = 1.0 / _3083;
    int _3111 = abs(_2753);
    int _3113 = abs(_2239);
    int _3115 = _3107 * as_type<int>(_2969);
    int _3117 = _3115 + _3077;
    int _3119 = ~_3111;
    int _3121 = _3119 + 1;
    int _3123 = _3121 + 1;
    float _3125 = _2693 * _2693;
    int _3127 = abs(_2949);
    float _3129 = 1.0 / _3097;
    int _3131 = ~_3073;
    int _3133 = _3131 + 1;
    int _3135 = _3133 + 1;
    int _3137 = abs(_2201);
    int _3139 = _3123 * as_type<int>(_2977);
    int _3141 = _3139 + _3117;
    bool _3143 = !_2987;
    int _3145 = _3143 ? _2907 : (-1);
    int _3147 = _3135 * as_type<int>(_2937);
    int _3149 = _3147 + _3081;
    int _3151 = ~_3137;
    int _3153 = _3151 + 1;
    int _3155 = _3153 + 1;
    float _3157 = fma(_2709, _2709, _3125);
    bool _3159 = _1160 == 0;
    float _3161 = float(uint(_3027));
    int _3163 = _3101 * _3155;
    int _3165 = ~_3113;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    bool _3171 = !_3159;
    int _3173 = _3171 ? _2955 : (-1);
    int _3175 = _3145 * _3137;
    int _3177 = _3175 + _3163;
    int _3179 = abs(_3027);
    int _3181 = _3169 * _3149;
    int _3183 = abs(_2995);
    float _3185 = 1.0 / _3161;
    int _3187 = _3173 * _3113;
    int _3189 = _3187 + _3181;
    int _3191 = abs(_2351);
    float _3193 = fma(_2687, _2687, _3157);
    int _3195 = as_type<int>(_3109) + (-2);
    float _3197 = float(uint(_3177));
    float _3199 = rsqrt(_3193);
    float _3201 = float(uint(_3183));
    float _3203 = float(uint(_3127));
    float _3205 = as_type<float>(_3195) * _3197;
    int _3207 = ~_3191;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    int _3213 = as_type<int>(_3129) + (-2);
    float _3215 = 1.0 / _3201;
    float _3217 = float(uint(_3189));
    int _3219 = _3211 * _3141;
    float _3221 = float(uint(_3179));
    float _3223 = in.m_75.x;
    float _3225 = in.m_75.y;
    float _3227 = in.m_75.z;
    bool _3229 = !_1675;
    int _3231 = _3229 ? _2913 : (-1);
    float _3233 = as_type<float>(_3213) * _3217;
    int _3235 = as_type<int>(_3185) + (-2);
    float _3237 = 1.0 / _3203;
    int _3239 = abs(_3177);
    int _3241 = _3231 * _3191;
    int _3243 = _3241 + _3219;
    int _3245 = abs(_3189);
    int _3247 = ~_2949;
    int _3249 = _3247 + 1;
    float _3251 = float(uint(_3243));
    float _3253 = 1.0 / _3221;
    int _3255 = as_type<int>(_3215) + (-2);
    float _3257 = as_type<float>(_3235) * _3251;
    float _3259 = float(uint(_3239));
    int _3261 = ~_2995;
    int _3263 = _3261 + 1;
    float _3265 = trunc(_3205);
    float _3267 = precise::max(_3265, 0.0);
    uint _3269 = uint(_3267);
    int _3271 = as_type<int>(_3237) + (-2);
    int _3273 = abs(_3243);
    float _3275 = float(uint(_3245));
    float _3277 = as_type<float>(_3271) * _3259;
    float _3279 = float(uint(_3273));
    float _3281 = trunc(_3233);
    float _3283 = precise::max(_3281, 0.0);
    uint _3285 = uint(_3283);
    int _3287 = as_type<int>(_3253) + (-2);
    float _3289 = as_type<float>(_3255) * _3275;
    float _3291 = _3259;
    if (_2617)
    {
        _3291 = _1120;
    }
    float _3293 = _3291;
    float _3295 = as_type<float>(_3287) * _3279;
    float _3297 = _3293;
    if (!_2617)
    {
        _3297 = _1116;
    }
    float _3299 = _3297;
    int _3301 = _3249 * int(_3269);
    int _3303 = _3301 + _3177;
    float _3305 = trunc(_3277);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3313 = ~_3183;
    int _3315 = _3313 + 1;
    float _3317 = _3299 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3319 = _2917 * (-2.0);
    int _3321 = ~_3027;
    int _3323 = _3321 + 1;
    int _3325 = _3263 * int(_3285);
    int _3327 = _3325 + _3189;
    float _3329 = float(uint(_3303));
    float _3331 = fma(_3317, -2.0, _3311);
    float _3333 = fma(_2669, _3319, _2669);
    float _3335 = fma(_3319, _3223, _3223);
    float _3337 = float(uint(_3327));
    float _3339 = as_type<float>(_3195) * _3329;
    float _3341 = trunc(_3257);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    float _3347 = _2693 * _3199;
    float _3349 = _2709 * _3199;
    float _3351 = as_type<float>(_3213) * _3337;
    int _3353 = ~_3179;
    int _3355 = _3353 + 1;
    float _3357 = -_3347;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2693);
    float _3361 = -_3349;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2709);
    bool _3365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3367 = isnan(0.0);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3373 = _3369 || _3371;
    float _3375 = trunc(_3339);
    float _3377 = precise::max(_3375, 0.0);
    uint _3379 = uint(_3377);
    float _3381 = _3359 * _3359;
    float _3383 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3331);
    float _3385 = fma(_3363, _3363, _3381);
    float _3387 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3389 = trunc(_3295);
    float _3391 = precise::max(_3389, 0.0);
    uint _3393 = uint(_3391);
    int _3395 = _3323 * int(_3345);
    int _3397 = _3395 + _3243;
    float _3399 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3387);
    float _3401 = float(uint(_3397));
    float _3403 = trunc(_3289);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    int _3409 = ~_3127;
    int _3411 = _3409 + 1;
    float _3413 = as_type<float>(_3235) * _3401;
    int _3415 = _3411 * int(_3309);
    int _3417 = _3415 + _3239;
    float _3419 = trunc(_3351);
    float _3421 = precise::max(_3419, 0.0);
    uint _3423 = uint(_3421);
    int _3425 = _3355 * int(_3393);
    int _3427 = _3425 + _3273;
    float _3429 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3431 = float(uint(_3417));
    int _3433 = int(_3269) + int(_3379);
    float _3435 = _3087 * _154;
    float _3437 = float(uint(_3427));
    int _3439 = _3315 * int(_3407);
    int _3441 = _3439 + _3245;
    float _3443 = as_type<float>(_3271) * _3431;
    float _3445 = trunc(_3413);
    float _3447 = precise::max(_3445, 0.0);
    uint _3449 = uint(_3447);
    float _3451 = as_type<float>(_3287) * _3437;
    float _3453 = float(uint(_3441));
    float _3455 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3429);
    float _3457 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3459 = 1.0 + _3457;
    int _3461 = int(_3285) + int(_3423);
    float _3463 = _1116 + (-0.5);
    float _3465 = exp2(_3435);
    float _3467 = as_type<float>(_3255) * _3453;
    float _3469 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3455);
    float _3471 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3473 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3475 = isnan(1.0);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3481 = _3477 || _3479;
    float _3483 = fma(_3463, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3335);
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3487 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3471);
    float _3489 = 1.0 / _3459;
    int _3491 = ~_2995;
    int _3493 = _3491 + 1;
    float _3495 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3485);
    int _3497 = ~_2949;
    int _3499 = _3497 + 1;
    float _3501 = _1120 + (-0.5);
    float _3503 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2353);
    float _3505 = -_3465;
    float _3507 = _3505 + 1.0;
    float _3509 = trunc(_3443);
    float _3511 = precise::max(_3509, 0.0);
    uint _3513 = uint(_3511);
    float _3515 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3487);
    float _3517 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3495);
    float _3519 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3399);
    float _3521 = _3373 ? _3507 : 0.0;
    int _3523 = _3493 * _3461;
    int _3525 = _3523 + _3189;
    int _3527 = ~_3183;
    int _3529 = _3527 + 1;
    float _3531 = trunc(_3467);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    float _3537 = _3503;
    float _3539 = _3347;
    if (_3481)
    {
        float _3541 = _3521 * _3489;
        _158 = _3541;
    }
    float _3543 = _158;
    int _3545 = _3499 * _3433;
    int _3547 = _3545 + _3177;
    int _3549 = int(_3345) + int(_3449);
    int _3551 = ~_3027;
    int _3553 = _3551 + 1;
    float _3555 = fma(_3333, _3543, _3483);
    bool _3557 = uint(_3547) >= uint(_2949);
    float _3559 = trunc(_3451);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    int _3565 = int(_3309) + int(_3513);
    int _3567 = _3553 * _3549;
    int _3569 = _3567 + _3243;
    bool _3571 = uint(_3525) >= uint(_2995);
    int _3573 = ~_3179;
    int _3575 = _3573 + 1;
    bool _3577 = uint(_3569) >= uint(_3027);
    int _3579 = ~_3127;
    int _3581 = _3579 + 1;
    int _3583 = int(_3407) + int(_3535);
    int _3585 = _3581 * _3565;
    int _3587 = _3585 + _3239;
    int _3589 = _3529 * _3583;
    int _3591 = _3589 + _3245;
    float _3593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3595 = int(_3393) + int(_3563);
    bool _3597 = uint(_3587) >= uint(_3127);
    bool _3599 = !_3557;
    int _3601 = _3599 ? 0 : (-1);
    int _3603 = _3575 * _3595;
    int _3605 = _3603 + _3273;
    bool _3607 = uint(_3591) >= uint(_3183);
    float _3609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3611 = !_3571;
    int _3613 = _3611 ? 0 : (-1);
    int _3615 = ~_3433;
    int _3617 = _3615 + _3601;
    int _3619 = _3617 + 1;
    int _3621 = ~_3461;
    int _3623 = _3621 + _3613;
    int _3625 = _3623 + 1;
    bool _3627 = !_3577;
    int _3629 = _3627 ? 0 : (-1);
    float _3631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3633 = _3177 ^ _2949;
    int _3635 = _2949 * _3619;
    int _3637 = _3635 + _3177;
    bool _3639 = _2949 == 0;
    int _3641 = _2995 * _3625;
    int _3643 = _3641 + _3189;
    int _3645 = ~_3549;
    int _3647 = _3645 + _3629;
    int _3649 = _3647 + 1;
    float _3651 = _3593 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3653 = !_3607;
    int _3655 = _3653 ? 0 : (-1);
    bool _3657 = !_3639;
    int _3659 = _3657 ? _3637 : (-1);
    int _3661 = _3027 * _3649;
    int _3663 = _3661 + _3243;
    bool _3665 = _2995 == 0;
    float _3667 = fma(_3651, _1837, -0.5);
    bool _3669 = uint(_3605) >= uint(_3179);
    int _3671 = _3189 ^ _2995;
    int _3673 = _3243 ^ _3027;
    float _3675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3677 = float(_3659);
    float _3679 = _3631 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3681 = !_3665;
    int _3683 = _3681 ? _3643 : (-1);
    bool _3685 = _3027 == 0;
    float _3687 = fma(_3651, _3677, _2363);
    bool _3689 = _3027 == 0;
    float _3691 = fma(_3679, _1951, -0.5);
    float _3693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3695 = float(_3683);
    float _3697 = fma(_3517, _3667, _3687);
    bool _3699 = !_3597;
    int _3701 = _3699 ? 0 : (-1);
    float _3703 = _3609 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3705 = !_3669;
    int _3707 = _3705 ? 0 : (-1);
    float _3709 = fma(_3679, _3695, _2871);
    uint _3711 = uint(int(uint(_3633) >> uint(31)));
    float _3713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3715 = uint(int(uint(_3671) >> uint(31)));
    float _3717 = _3675 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3719 = uint(int(uint(_3673) >> uint(31)));
    float _3721 = fma(_2837, _3691, _3709);
    int _3723 = ~_3701;
    int _3725 = _3565 + _3723;
    int _3727 = _3725 + 1;
    float _3729 = fma(_3717, _1975, -0.5);
    int _3731 = ~_3655;
    int _3733 = _3583 + _3731;
    int _3735 = _3733 + 1;
    float _3737 = fma(_1991, _3703, -0.5);
    int _3739 = ~_3707;
    int _3741 = _3595 + _3739;
    int _3743 = _3741 + 1;
    int _3745 = ~int(_3711);
    int _3747 = _3745 + 1;
    int _3749 = ~int(_3715);
    int _3751 = _3749 + 1;
    int _3753 = ~int(_3719);
    int _3755 = _3753 + 1;
    float _3757 = _3713 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3759 = !_3685;
    int _3761 = _3759 ? _3663 : (-1);
    int _3763 = _3727 ^ _3747;
    float _3765 = fma(_3757, _2031, -0.5);
    int _3767 = _3735 ^ _3751;
    int _3769 = _3743 ^ _3755;
    float _3771 = float(_3761);
    bool _3773 = _2949 == 0;
    bool _3775 = _2995 == 0;
    float _3777 = fma(_3717, _3771, _2747);
    int _3779 = ~_3747;
    int _3781 = _3779 + _3763;
    int _3783 = _3781 + 1;
    float _3785 = _3693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3787 = ~_3751;
    int _3789 = _3787 + _3767;
    int _3791 = _3789 + 1;
    float _3793 = fma(_3469, _3729, _3777);
    int _3795 = ~_3755;
    int _3797 = _3795 + _3769;
    int _3799 = _3797 + 1;
    float _3801 = fma(_2019, _3785, -0.5);
    bool _3803 = !_3773;
    int _3805 = _3803 ? _3783 : (-1);
    float _3807 = _3793 + 0.5;
    bool _3809 = !_3775;
    int _3811 = _3809 ? _3791 : (-1);
    bool _3813 = !_3689;
    int _3815 = _3813 ? _3799 : (-1);
    float _3817 = float(_3805);
    float _3819 = float(_3811);
    float _3821 = float(_3815);
    float _3823 = -_3503;
    float _3825 = fma(_3703, _3817, _3823);
    float _3827 = -_2879;
    float _3829 = fma(_3785, _3819, _3827);
    float _3831 = _3721 + 0.5;
    float _3833 = -_3383;
    float _3835 = fma(_3757, _3821, _3833);
    float _3837 = fma(_3515, _3737, _3825);
    float _3839 = fma(_2533, _3801, _3829);
    float _3841 = _2687 * _3199;
    float _3843 = fma(_3519, _3765, _3835);
    float _3845 = _3697 + 0.5;
    float _3847 = _3837 + 0.5;
    float _3849 = _3839 + 0.5;
    float _3851 = _3843 + 0.5;
    float _3853 = -_3841;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2687);
    float _3857 = fma(_3003, _3225, _3225);
    bool _3859 = !_2575;
    int _3861 = _3859 ? 0 : 1;
    out.m_77.x = _3845;
    out.m_77.y = _3847;
    out.m_77.z = _3831;
    out.m_77.w = _3849;
    float _3863 = fma(_3855, _3855, _3385);
    out.m_79.x = _3807;
    out.m_79.y = _3851;
    float _3865 = as_type<float>(_3565);
    float _3867 = as_type<float>(_3595);
    if (_2757)
    {
        return out;
    }
    float _3869 = -_3347;
    float _3871 = fma(_3869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2421);
    float _3873 = -_3349;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2413);
    float _3877 = float(_2583);
    float _3879 = _1116 + _1130;
    float _3881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3883 = _3871 + _3881;
    float _3885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3887 = _3875 + _3885;
    int _3889 = abs(_3861);
    float _3891 = -_3841;
    float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2377);
    float _3895 = _3883 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3897 = _3879 + (-1.0);
    float _3899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3901 = _3893 + _3899;
    float _3903 = fma(_3887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3895);
    float _3905 = float(_3889);
    float _3907 = fma(_3501, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3857);
    float _3909 = fma(_3897, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3911 = fma(_3901, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3903);
    float _3913 = _1130 + (-0.5);
    float _3915 = _3905 * _3877;
    float _3917 = fma(_3035, _3543, _3907);
    float _3919 = _3555 * 0.15915493667125701904296875;
    bool _3921 = _3911 >= 0.0;
    float _3923 = _3915 * (-2.0);
    float _3925 = _3917 * 0.15915493667125701904296875;
    float _3927 = _3919 * 6.283185482025146484375;
    float _3929 = sin(_3927);
    float _3931 = fma(_3923, _3227, _3227);
    float _3933 = fma(_3909, _3923, _3909);
    float _3935 = fma(_3913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3931);
    float _3937 = _3925 * 6.283185482025146484375;
    float _3939 = sin(_3937);
    float _3941 = fma(_3933, _3543, _3935);
    float _3943 = _3911;
    int _3945 = as_type<int>(_3871);
    int _3947 = as_type<int>(_3901);
    if (_3921)
    {
        _3943 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3949 = _3943;
    int _3951 = as_type<int>(_3949);
    if (_3921)
    {
        out.m_61.x = 0.0;
    }
    float _3953 = _3941 * 0.15915493667125701904296875;
    float _3955 = sqrt(_3863);
    if (_3921)
    {
        float _3957 = _3949 * 5.0;
        _3951 = as_type<int>(_3957);
    }
    int _3959 = _3951;
    if (_3921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11676 = as_type<float>(_3959);
        out.gl_Position.z = _11676;
    }
    float _3961 = _3919 * 6.283185482025146484375;
    float _3963 = cos(_3961);
    float _3965 = _3929 * _3939;
    float _3967 = _3925 * 6.283185482025146484375;
    float _3969 = cos(_3967);
    float _3971 = _3953 * 6.283185482025146484375;
    float _3973 = sin(_3971);
    if (_3921)
    {
        return out;
    }
    float _3975 = -_2421;
    float _3977 = _3975 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3979 = in.m_81.x;
    float _3981 = in.m_81.y;
    float _3983 = in.m_81.z;
    float _3985 = _3199 * _3955;
    float _3987 = -_2413;
    float _3989 = _3987 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3991 = _3977 * _3977;
    float _3993 = -_2377;
    float _3995 = _3993 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3997 = _3953 * 6.283185482025146484375;
    float _3999 = cos(_3997);
    float _4001 = _3963 * _3969;
    float _4003 = fma(_3989, _3989, _3991);
    float _4005 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4007 = fma(_3973, _4001, _3965);
    float _4009 = fma(_3995, _3995, _4003);
    float _4011 = fma(_3973, _3965, _4001);
    float _4013 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4015 = _3963 * _3939;
    float _4017 = rsqrt(_4009);
    float _4019 = _802 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _4021 = _3929 * _3969;
    float _4023 = _3985 * _4013;
    float _4025 = _3985 * _4019;
    float _4027 = _3963 * _3999;
    float _4029 = _3969 * _3999;
    float _4031 = _3929 * _3999;
    float _4033 = _3939 * _3999;
    float _4035 = _3985 * _4005;
    float _4037 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3979);
    float _4039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3981);
    float _4041 = -_4015;
    float _4043 = fma(_3973, _4021, _4041);
    float _4045 = -_4021;
    float _4047 = fma(_3973, _4015, _4045);
    float _4049 = _4037 * _4023;
    float _4051 = _4039 * _4035;
    float _4053 = _3989 * _4017;
    float _4055 = in.m_83.x;
    float _4057 = in.m_83.y;
    float _4059 = in.m_83.z;
    bool _4061 = _3981 != 0.0;
    bool _4063 = isnan(_3981);
    bool _4065 = _4061 || _4063;
    bool _4067 = isnan(0.0);
    bool _4069 = _4065 || _4067;
    float _4071 = _3995 * _4017;
    float _4073 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4075 = _4053 * _4073;
    float _4077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3983);
    float _4079 = _3977 * _4017;
    bool _4081 = _3979 == 0.0;
    bool _4083 = !_4069;
    bool _4085 = _4081 && _4083;
    float _4087 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4089 = _4071 * _4087;
    float _4091 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4093 = -_4075;
    float _4095 = fma(_4071, _4091, _4093);
    float _4097 = _4077 * _4025;
    float _4099 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4101 = _4079 * _4099;
    bool _4103 = _3983 == 0.0;
    bool _4105 = _4103 && _4085;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4109 = -_4089;
    float _4111 = fma(_4079, _4107, _4109);
    float _4113 = _4095 * _4095;
    float _4115 = in.m_85.x;
    float _4117 = in.m_85.y;
    float _4119 = in.m_85.z;
    float _4121 = in.m_85.w;
    float _4123 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4125 = -_4101;
    float _4127 = fma(_4053, _4123, _4125);
    float _4129 = -_4051;
    float _4131 = _3973 * _4129;
    float _4133 = fma(_4111, _4111, _4113);
    float _4135 = _4027 * _4051;
    float _4137 = _4031 * _4051;
    float _4139 = fma(_4029, _4049, _4131);
    float _4141 = fma(_4127, _4127, _4133);
    float _4143 = fma(_4007, _4049, _4135);
    float _4145 = fma(_4043, _4049, _4137);
    float _4147 = _4133;
    float _4149 = _4055;
    float _4151 = _4049;
    float _4153 = _4011;
    if (_4105)
    {
        _3865 = _4055;
    }
    float _4155 = _3865;
    float _4157 = rsqrt(_4141);
    float _4159 = _4155;
    if (_4105)
    {
        _3537 = _4057;
    }
    float _4161 = _3537;
    float _4163 = fma(_4033, _4097, _4139);
    float _4165 = _4161;
    if (_4105)
    {
        _4147 = _4155;
    }
    float _4167 = _4147;
    float _4169 = fma(_4047, _4097, _4143);
    float _4171 = _4167;
    if (!_4105)
    {
        _4159 = _4055;
    }
    float _4173 = _4159;
    if (_4105)
    {
        _4149 = _4161;
    }
    float _4175 = _4149;
    float _4177 = _4175;
    if (_4105)
    {
        _3867 = _4059;
    }
    float _4179 = _3867;
    float _4181 = _4179;
    if (!_4105)
    {
        float _4183 = fma(_3979, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4173);
        _4171 = _4183;
    }
    float _4185 = _4171;
    if (!_4105)
    {
        _4165 = _4057;
    }
    float _4187 = _4165;
    float _4189 = fma(_4011, _4097, _4145);
    if (_4105)
    {
        _4151 = _4179;
    }
    float _4191 = _4151;
    float _4193 = _4191;
    if (!_4105)
    {
        _4181 = _4059;
    }
    float _4195 = _4181;
    if (!_4105)
    {
        float _4197 = fma(_3981, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4187);
        _4177 = _4197;
    }
    float _4199 = _4177;
    float _4201 = _4119 * _4173;
    float _4203 = _4095 * _4157;
    float _4205 = _4111 * _4157;
    float _4207 = _4127 * _4157;
    float _4209 = -_4201;
    float _4211 = fma(_4115, _4195, _4209);
    float _4213 = _4117 * _4195;
    float _4215 = _4071 * _4203;
    float _4217 = _4079 * _4205;
    if (!_4105)
    {
        float _4219 = fma(_3983, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4195);
        _4193 = _4219;
    }
    float _4221 = _4193;
    float _4223 = _4115 * _4187;
    float _4225 = -_4213;
    float _4227 = fma(_4119, _4187, _4225);
    float _4229 = -_4215;
    float _4231 = fma(_4079, _4207, _4229);
    float _4233 = -_4217;
    float _4235 = fma(_4053, _4203, _4233);
    float _4237 = -_4223;
    float _4239 = fma(_4117, _4173, _4237);
    float _4241 = _4227 * _4121;
    float _4243 = _4231 * _4169;
    float _4245 = _4235 * _4169;
    float _4247 = _4211 * _4121;
    float _4249 = _4239 * _4121;
    float _4251 = _4053 * _4207;
    float _4253 = fma(_4205, _4163, _4243);
    float _4255 = fma(_4207, _4163, _4245);
    float _4257 = _4007 * _4231;
    float _4259 = -_4251;
    float _4261 = fma(_4071, _4205, _4259);
    float _4263 = fma(_4053, _4189, _4253);
    float _4265 = fma(_4071, _4189, _4255);
    float _4267 = _4007 * _4235;
    float _4269 = _4007 * _4261;
    float _4271 = _2413 + _4263;
    float _4273 = _2377 + _4265;
    float _4275 = _4027 * _4231;
    float _4277 = _4027 * _4261;
    float _4279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4281 = _4271 + _4279;
    float _4283 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4285 = _4273 + _4283;
    float _4287 = _4027 * _4235;
    float _4289 = _4047 * _4231;
    float _4291 = _4281 * _4281;
    float _4293 = _4285 * _4285;
    float _4295 = fma(_4029, _4205, _4257);
    float _4297 = fma(_4029, _4203, _4269);
    float _4299 = fma(_4029, _4207, _4267);
    float _4301 = _4291 + _4293;
    float _4303 = _4261 * _4169;
    float _4305 = _4047 * _4235;
    float _4307 = _4047 * _4261;
    float _4309 = sqrt(_4301);
    float _4311 = fma(_4203, _4163, _4303);
    float _4313 = -_3973;
    float _4315 = fma(_4313, _4205, _4275);
    float _4317 = -_3973;
    float _4319 = fma(_4317, _4203, _4277);
    float _4321 = -_3973;
    float _4323 = fma(_4321, _4207, _4287);
    float _4325 = fma(_4079, _4189, _4311);
    float _4327 = fma(_4033, _4207, _4305);
    float _4329 = fma(_4033, _4205, _4289);
    float _4331 = fma(_4033, _4203, _4307);
    float _4333 = fma(_4031, _4053, _4315);
    float _4335 = fma(_4031, _4079, _4319);
    float _4337 = fma(_4031, _4071, _4323);
    float _4339 = _2421 + _4325;
    float _4341 = fma(_4043, _4053, _4295);
    float _4343 = fma(_4043, _4079, _4297);
    float _4345 = fma(_4011, _4053, _4329);
    bool _4347 = _4309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4349 = fma(_4043, _4071, _4299);
    float _4351 = fma(_4011, _4071, _4327);
    float _4353 = fma(_4011, _4079, _4331);
    float _4355 = _4333 * _4199;
    float _4357 = _4335 * _4199;
    float _4359 = _4333 * _4117;
    float _4361 = _4335 * _4117;
    float _4363 = _4337 * _4117;
    float _4365 = _4337 * _4199;
    float _4367 = _4247 * _4333;
    float _4369 = _4247 * _4335;
    float _4371 = _4247 * _4337;
    float _4373 = _4291;
    float _4375 = _4293;
    float _4377 = _4273;
    float _4379 = _4271;
    if (!_4347)
    {
        _4153 = _4339;
    }
    float _4381 = _4153;
    bool _4383 = !_4347;
    float _4385 = _4381;
    if (!_4383)
    {
        float _4387 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4389 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4391 = _4309 + _4389;
        float _4393 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4395 = rsqrt(_4301);
        float _4397 = _4391 * _4387;
        float _4399 = _4397 * 0.15915493667125701904296875;
        float _4401 = _4399 * 6.283185482025146484375;
        float _4403 = sin(_4401);
        float _4405 = _4399 * 6.283185482025146484375;
        float _4407 = cos(_4405);
        float _4409 = fma(_4403, _4393, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4411 = _4395 * _4409;
        float _4413 = _4407 + (-1.0);
        float _4415 = fma(_4281, _4411, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4417 = fma(_4285, _4411, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4419 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4421 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4423 = _4415 + _4421;
        float _4425 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4427 = _4417 + _4425;
        float _4429 = fma(_4339, _4407, _4419);
        float _4431 = _4423 * _4423;
        float _4433 = _4427 * _4427;
        _4385 = _4429;
        _4373 = _4431;
        _4375 = _4433;
        _4377 = _4417;
        _4379 = _4415;
    }
    float _4435 = _4385;
    float _4437 = _4373;
    float _4439 = _4375;
    float _4441 = _4377;
    float _4443 = _4379;
    float _4445 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4447 = _4435 + _4445;
    float _4449 = fma(_4241, _4341, _4367);
    float _4451 = fma(_4341, _4115, _4359);
    float _4453 = fma(_4343, _4115, _4361);
    float _4455 = fma(_4447, _4447, _4437);
    float _4457 = fma(_4241, _4343, _4369);
    float _4459 = fma(_4349, _4115, _4363);
    float _4461 = fma(_4341, _4185, _4355);
    float _4463 = _4455 + _4439;
    float _4465 = fma(_4343, _4185, _4357);
    float _4467 = fma(_4349, _4185, _4365);
    float _4469 = fma(_4241, _4349, _4371);
    float _4471 = fma(_4249, _4345, _4449);
    float _4473 = fma(_4345, _4119, _4451);
    float _4475 = sqrt(_4463);
    float _4477 = fma(_4353, _4119, _4453);
    float _4479 = fma(_4249, _4353, _4457);
    float _4481 = fma(_4351, _4119, _4459);
    float _4483 = fma(_4345, _4221, _4461);
    float _4485 = fma(_4353, _4221, _4465);
    float _4487 = fma(_4249, _4351, _4469);
    float _4489 = fma(_4351, _4221, _4467);
    out.m_87.x = _4473;
    out.m_87.y = _4477;
    out.m_87.z = _4481;
    out.m_89.x = _4471;
    out.m_89.y = _4479;
    out.m_89.z = _4487;
    out.m_91.x = _4483;
    out.m_91.y = _4485;
    out.m_91.z = _4489;
    bool _4491 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4493 = isnan(_4475);
    bool _4495 = _4491 || _4493;
    bool _4497 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4499 = _4495 || _4497;
    float _4501 = _4453;
    if (!_4499)
    {
        _4501 = 1.0;
    }
    float _4503 = _4501;
    bool _4505 = !_4499;
    float _4507 = _4503;
    if (!_4505)
    {
        bool _4509 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4511 = isnan(_4475);
        bool _4513 = _4509 || _4511;
        bool _4515 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4517 = _4513 || _4515;
        if (!_4517)
        {
            float _4519 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4521 = _4475 + _4519;
            float _4523 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4525 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4523;
            float _4527 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4529 = _4527 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4531 = 1.0 / _4525;
            float _4533 = _4521 * _4531;
            float _4535 = fma(_4533, _4529, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4507 = _4535;
            _4537 = true;
        }
        else
        {
            bool _4539 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4541 = isnan(_4475);
            bool _4543 = _4539 || _4541;
            bool _4545 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4547 = _4543 || _4545;
            if (!_4547)
            {
                float _4549 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4551 = _4475 + _4549;
                float _4553 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4555 = _4553 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4557 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4559 = _4557 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4561 = 1.0 / _4555;
                float _4563 = _4551 * _4561;
                float _4565 = fma(_4563, _4559, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4507 = _4565;
                _4537 = true;
            }
            else
            {
                _4507 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4537 = false;
    float _4567 = _4507;
    float _4569 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4571 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4573 = floor(_4569);
    float _4575 = floor(_4571);
    float _4577 = -_4573;
    float _4579 = _4569 + _4577;
    float _4581 = -_4575;
    float _4583 = _4571 + _4581;
    float2 _12696 = float2(_4579, _4583);
    float _4585 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12696, float2(0.0), isnan(_12696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12696, float2(0.0), isnan(_12696)), level(0.0)).x;
    float _4587 = _3871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4589 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4591 = _4441 + _4589;
    float _4593 = fma(_3875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4587);
    bool _4595 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4597 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4599 = _4595 || _4597;
    bool _4601 = isnan(0.5);
    bool _4603 = _4599 || _4601;
    float _4605 = fma(_3893, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4593);
    float _4607 = _3871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4609 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4611 = _4435 + _4609;
    float _4613 = _4605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4615 = fma(_3875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4607);
    float _4617 = 1.0 / _4613;
    float _4619 = fma(_3893, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4615);
    float _4621 = _4619 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4623 = _4621 + _4613;
    float _4625 = _4623 * _4617;
    float _4627 = _4625 * 0.5;
    float _4629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4631 = fma(_4627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4629);
    float _4633 = 1.0 / _4631;
    float _4635 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4637 = _3871 + _4635;
    float _4639 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4641 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4639);
    float _4643 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4645 = _4633 * _4643;
    float _4647 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4649 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4641);
    bool _4651 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4653 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4647);
    bool _4655 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4657 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4659 = !_4651;
    int _4661 = _4659 ? 0 : 1;
    float _4663 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4653);
    float _4665 = trunc(_4657);
    int _4667 = int(_4665);
    float _4669 = _4663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4671 = 2;
    if (!_4651)
    {
        _4671 = 1;
    }
    int _4673 = _4671;
    int _4675 = _4673;
    if (!_4655)
    {
        _4675 = _4661;
    }
    int _4677 = _4675;
    float _4679 = trunc(_4669);
    int _4681 = int(_4679);
    int _4683 = _4677 << 6;
    int _4685 = _4683 + 48;
    uint _4687 = uint(int(uint(_4685) >> uint(2)));
    uint _4689 = uint(int(uint(int(_4687)) >> uint(2)));
    int _4691 = int(_4687) & 3;
    float _4693 = (*spvDescriptorSet0.vp_c15)._m0[int(_4689)][_4691];
    int _4695 = int(_4687) + 1;
    uint _4697 = uint(int(uint(_4695) >> uint(2)));
    int _4699 = _4695 & 3;
    float _4701 = (*spvDescriptorSet0.vp_c15)._m0[int(_4697)][_4699];
    int _4703 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4705 = _4667 + _4703;
    int _4707 = _4705 + 1;
    float _4709 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4711 = _4443 + _4709;
    bool _4713 = _4707 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4715 = fma(_4711, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _4717 = _4683 + 56;
    uint _4719 = uint(int(uint(_4717) >> uint(2)));
    uint _4721 = uint(int(uint(int(_4719)) >> uint(2)));
    int _4723 = int(_4719) & 3;
    float _4725 = (*spvDescriptorSet0.vp_c15)._m0[int(_4721)][_4723];
    int _4727 = int(_4719) + 1;
    uint _4729 = uint(int(uint(_4727) >> uint(2)));
    int _4731 = _4727 & 3;
    float _4733 = (*spvDescriptorSet0.vp_c15)._m0[int(_4729)][_4731];
    int _4735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4737 = _4681 + _4735;
    int _4739 = _4737 + 1;
    float _4741 = -_3349;
    float _4743 = fma(_4741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4715);
    int _4745 = _4707 | _4739;
    int _4747 = _4683 + 64;
    uint _4749 = uint(int(uint(_4747) >> uint(2)));
    uint _4751 = uint(int(uint(int(_4749)) >> uint(2)));
    int _4753 = int(_4749) & 3;
    float _4755 = (*spvDescriptorSet0.vp_c15)._m0[int(_4751)][_4753];
    int _4757 = int(_4749) + 1;
    uint _4759 = uint(int(uint(_4757) >> uint(2)));
    int _4761 = _4757 & 3;
    float _4763 = (*spvDescriptorSet0.vp_c15)._m0[int(_4759)][_4761];
    bool _4765 = _4745 < 0;
    bool _4767 = _4765 || _4713;
    float _4769 = fma(_4611, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4771 = fma(_4591, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4773 = _4739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4775 = _4773 || _4767;
    float _4777 = -_3347;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4769);
    float _4781 = -_3841;
    float _4783 = fma(_4781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4771);
    int _4785 = _4683 + 72;
    uint _4787 = uint(int(uint(_4785) >> uint(2)));
    uint _4789 = uint(int(uint(int(_4787)) >> uint(2)));
    int _4791 = int(_4787) & 3;
    float _4793 = (*spvDescriptorSet0.vp_c15)._m0[int(_4789)][_4791];
    int _4795 = int(_4787) + 1;
    uint _4797 = uint(int(uint(_4795) >> uint(2)));
    int _4799 = _4795 & 3;
    float _4801 = (*spvDescriptorSet0.vp_c15)._m0[int(_4797)][_4799];
    float _4803 = _4743;
    float _4805 = _4779;
    float _4807 = as_type<float>(_4677);
    if (_4603)
    {
        _3539 = _4743;
    }
    float _4809 = _3539;
    float _4811 = _4809;
    if (_4603)
    {
        _4803 = _4779;
    }
    float _4813 = _4803;
    float _4815 = _4813;
    if (_4603)
    {
        _4805 = _4783;
    }
    float _4817 = _4805;
    int _4819 = _4683 + 96;
    uint _4821 = uint(int(uint(_4819) >> uint(2)));
    uint _4823 = uint(int(uint(int(_4821)) >> uint(2)));
    int _4825 = int(_4821) & 3;
    float _4827 = (*spvDescriptorSet0.vp_c15)._m0[int(_4823)][_4825];
    int _4829 = int(_4821) + 1;
    uint _4831 = uint(int(uint(_4829) >> uint(2)));
    int _4833 = _4829 & 3;
    float _4835 = (*spvDescriptorSet0.vp_c15)._m0[int(_4831)][_4833];
    int _4837 = _4683 + 104;
    uint _4839 = uint(int(uint(_4837) >> uint(2)));
    uint _4841 = uint(int(uint(int(_4839)) >> uint(2)));
    int _4843 = int(_4839) & 3;
    float _4845 = (*spvDescriptorSet0.vp_c15)._m0[int(_4841)][_4843];
    int _4847 = int(_4839) + 1;
    uint _4849 = uint(int(uint(_4847) >> uint(2)));
    int _4851 = _4847 & 3;
    float _4853 = (*spvDescriptorSet0.vp_c15)._m0[int(_4849)][_4851];
    float _4855 = _4817;
    float _4857 = _4835;
    if (!_4603)
    {
        float _4859 = _3883 * _3883;
        float _4861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4863 = fma(_3887, _3887, _4859);
        float _4865 = fma(_3901, _3901, _4863);
        float _4867 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4869 = sqrt(_4865);
        float _4871 = 1.0 / _3985;
        float _4873 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4875 = precise::min(_4869, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4877 = _4875 * _4861;
        float _4879 = _4877 * _4871;
        float _4881 = -_2377;
        float _4883 = _4881 + _4771;
        float _4885 = -_2421;
        float _4887 = _4885 + _4769;
        float _4889 = -_2413;
        float _4891 = _4889 + _4715;
        float _4893 = _4873 * _4879;
        float _4895 = _4883 * _4879;
        float _4897 = fma(_4887, _4893, _3871);
        float _4899 = fma(_4891, _4893, _3875);
        float _4901 = fma(_4873, _4895, _3893);
        _4815 = _4897;
        _4811 = _4899;
        _4855 = _4901;
    }
    float _4903 = _4815;
    float _4905 = _4811;
    float _4907 = _4855;
    float _4909 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4911 = _4637 * _4835;
    if (!_4775)
    {
        int _4913 = _4739 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4915 = _4913 + _4707;
        _3945 = _4915;
    }
    int _4917 = _3945;
    int _4919 = _4683 + 80;
    uint _4921 = uint(int(uint(_4919) >> uint(2)));
    uint _4923 = uint(int(uint(int(_4921)) >> uint(2)));
    int _4925 = int(_4921) & 3;
    float _4927 = (*spvDescriptorSet0.vp_c15)._m0[int(_4923)][_4925];
    int _4929 = int(_4921) + 1;
    uint _4931 = uint(int(uint(_4929) >> uint(2)));
    int _4933 = _4929 & 3;
    float _4935 = (*spvDescriptorSet0.vp_c15)._m0[int(_4931)][_4933];
    float _4937 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4909);
    float _4939 = fma(_3875, _4827, _4911);
    float _4941 = _4637 * _4701;
    float _4943 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4945 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4937);
    float _4947 = fma(_3893, _4845, _4939);
    float _4949 = fma(_3875, _4693, _4941);
    int _4951 = as_type<int>(_4945);
    int _4953 = as_type<int>(_4943);
    if (!_4775)
    {
        int _4955 = _4917 << 2;
        _3947 = _4955;
    }
    int _4957 = _3947;
    float _4959 = _4945 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4961 = _4947 + _4853;
    float _4963 = fma(_3893, _4725, _4949);
    int _4965 = _4957;
    if (!_4775)
    {
        uint _4967 = uint(int(uint(_4917) >> uint(2)));
        _4951 = int(_4967);
    }
    int _4969 = _4951;
    float _4971 = _4959 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_4775)
    {
        int _4973 = 12 & _4957;
        _4965 = _4973;
    }
    int _4975 = _4965;
    int _4977 = _4683 + 88;
    uint _4979 = uint(int(uint(_4977) >> uint(2)));
    uint _4981 = uint(int(uint(int(_4979)) >> uint(2)));
    int _4983 = int(_4979) & 3;
    float _4985 = (*spvDescriptorSet0.vp_c15)._m0[int(_4981)][_4983];
    int _4987 = int(_4979) + 1;
    uint _4989 = uint(int(uint(_4987) >> uint(2)));
    int _4991 = _4987 & 3;
    float _4993 = (*spvDescriptorSet0.vp_c15)._m0[int(_4989)][_4991];
    float _4995 = 1.0 / _4961;
    float _4997 = -_4971;
    float _4999 = fma(_4997, _4943, 1.0);
    float _5001 = _4963 + _4733;
    float _5003 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5005 = _4637 * _4763;
    if (!_4775)
    {
        int _5007 = _4969 << 4;
        int _5009 = _5007 + _4975;
        _4953 = _5009;
    }
    int _5011 = _4953;
    float _5013 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5015 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5003);
    float _5017 = fma(_3875, _4755, _5005);
    float _5019 = _4845;
    if (!_4775)
    {
        int _5021 = _5011 + 400;
        uint _5023 = uint(int(uint(_5021) >> uint(2)));
        uint _5025 = uint(int(uint(int(_5023)) >> uint(2)));
        int _5027 = int(_5023) & 3;
        float _5029 = (*spvDescriptorSet0.vp_c15)._m0[int(_5025)][_5027];
        _5019 = _5029;
    }
    float _5031 = _5019;
    float _5033 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5013);
    float _5035 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5015);
    float _5037 = fma(_3893, _4793, _5017);
    float _5039 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5041 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5033);
    float _5043 = _5035 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5045 = _5037 + _4801;
    float _5047 = _5001 * _4995;
    float _5049 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5039);
    float _5051 = _5041 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5053 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5055 = log2(_4999);
    float _5057 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5049);
    bool _5059 = _5047 >= 0.0;
    float _5061 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5053);
    float _5063 = _5045 * _4995;
    float _5065 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _5067 = _5047 <= 1.0;
    bool _5069 = _5067 && _5059;
    float _5071 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5061);
    float _5073 = _5045;
    if (!_4775)
    {
        float _5075 = floor(_4657);
        _5073 = _5075;
    }
    float _5077 = _5073;
    float _5079 = _5057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _5081 = _5063 >= 0.0;
    bool _5083 = _5081 && _5069;
    float _5085 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5065);
    float _5087 = _4637 * _4935;
    float _5089 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5071);
    float _5091 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _5093 = _5063 <= 1.0;
    bool _5095 = _5093 && _5083;
    float _5097 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5085);
    float _5099 = 1.0 / _5089;
    float _5101 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5091);
    float _5103 = fma(_3875, _4927, _5087);
    float _5105 = _5055 * 0.693147182464599609375;
    float _5107 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5101);
    float _5109 = _5105 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5111 = _4769;
    if (!_4775)
    {
        float _5113 = floor(_4669);
        _5111 = _5113;
    }
    float _5115 = _5111;
    float _5117 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5107);
    float _5119 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5097);
    float _5121 = fma(_3893, _4985, _5103);
    float _5123 = _5119;
    if (_5095)
    {
        float _5125 = float(_4677);
        _4807 = _5125;
    }
    float _5127 = _4807;
    float _5129 = _5077;
    if (!_4775)
    {
        float _5131 = -_5077;
        float _5133 = _4657 + _5131;
        _4857 = _5133;
    }
    float _5135 = _4857;
    float _5137 = _5121 + _4993;
    float _5139 = _5117 * _5099;
    float _5141 = _5119 * _5099;
    float _5143 = _5087;
    if (_5095)
    {
        float _5145 = rint(_5127);
        float _5147 = precise::max(_5145, 0.0);
        uint _5149 = uint(_5147);
        uint _5151 = clamp(_5149, 0u, 65535u);
        _5143 = as_type<float>(_5151);
    }
    float _5153 = _5143;
    float _5155 = _5137 * _4995;
    float _5157 = fma(_5141, -0.5, 0.5);
    float _5159 = _5115;
    float _5161 = _5155;
    if (!_4775)
    {
        float _5163 = -_5115;
        float _5165 = _4669 + _5163;
        _5159 = _5165;
    }
    float _5167 = _5159;
    float _5169 = _5141;
    float _5171 = _5167;
    if (!_4775)
    {
        float _5173 = rint(_5031);
        float _5175 = precise::max(_5173, 0.0);
        uint _5177 = uint(_5175);
        uint _5179 = clamp(_5177, 0u, 65535u);
        _5169 = as_type<float>(_5179);
    }
    float _5181 = _5169;
    float _5183 = fma(_5139, 0.5, 0.5);
    float _5185 = _5063;
    float _5187 = _5153;
    if (_5095)
    {
        float3 _13723 = float3(_5047, _5063, float(as_type<int>(_5153)));
        float3 _13727 = select(_13723, float3(0.0), isnan(_13723));
        float _5189 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13727.xy, uint(rint(_13727.z)), _5155, level(0.0));
        _5185 = _5189;
    }
    float _5191 = _5185;
    float3 _13737 = float3(_5183, _5157, _5109);
    float _5193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13737, float3(0.0), isnan(_13737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13737, float3(0.0), isnan(_13737)), level(0.0)).x;
    float3 _13746 = float3(_5183, _5157, _5109);
    float4 _5196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13746, float3(0.0), isnan(_13746)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13746, float3(0.0), isnan(_13746)), level(0.0)).xyzw;
    float _5198 = _5196.x;
    float _5200 = _5196.y;
    float _5202 = _5196.z;
    float _5204 = _5196.w;
    float _5206 = _5135;
    if (!_4775)
    {
        float3 _13769 = float3(_5135, _5167, float(as_type<int>(_5181)));
        float3 _13771 = select(_13769, float3(0.0), isnan(_13769));
        float _5208 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13771.xy, uint(rint(_13771.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13771.xy, uint(rint(_13771.z)), level(0.0)).x;
        _5206 = _5208;
    }
    float _5210 = _5206;
    if (_4775)
    {
        _5129 = 1.0;
    }
    float _5212 = _5129;
    float _5214 = _5212;
    if (!_4775)
    {
        int _5216 = _4917 << 4;
        int _5218 = _5216 + 2048;
        uint _5220 = uint(int(uint(_5218) >> uint(2)));
        uint _5222 = uint(int(uint(int(_5220)) >> uint(2)));
        int _5224 = int(_5220) & 3;
        float _5226 = (*spvDescriptorSet0.vp_c15)._m0[int(_5222)][_5224];
        int _5228 = int(_5220) + 1;
        uint _5230 = uint(int(uint(_5228) >> uint(2)));
        int _5232 = _5228 & 3;
        float _5234 = (*spvDescriptorSet0.vp_c15)._m0[int(_5230)][_5232];
        int _5236 = _5218 + 8;
        uint _5238 = uint(int(uint(_5236) >> uint(2)));
        uint _5240 = uint(int(uint(int(_5238)) >> uint(2)));
        int _5242 = int(_5238) & 3;
        float _5244 = (*spvDescriptorSet0.vp_c15)._m0[int(_5240)][_5242];
        int _5246 = int(_5238) + 1;
        uint _5248 = uint(int(uint(_5246) >> uint(2)));
        int _5250 = _5246 & 3;
        float _5252 = (*spvDescriptorSet0.vp_c15)._m0[int(_5248)][_5250];
        float _5254 = _4637 * _5234;
        float _5256 = fma(_3875, _5226, _5254);
        float _5258 = fma(_3893, _5244, _5256);
        float _5260 = _5258 + _5252;
        float _5262 = precise::clamp(_5260, 0.0, 1.0);
        float _5264 = -_5262;
        float _5266 = _5264 + _5210;
        float _5268 = fma(_5266, 500.0, 1.5);
        float _5270 = exp2(_5268);
        float _5272 = 0.0 + _5270;
        float _5274 = precise::clamp(_5272, 0.0, 1.0);
        _5187 = _5226;
        _5214 = _5274;
    }
    float _5276 = _5187;
    float _5278 = _5214;
    float _5280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5282 = _4903 + _5280;
    float _5284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5286 = _4905 + _5284;
    float _5288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5290 = _4907 + _5288;
    float _5292 = _5282 * _5282;
    float _5294 = fma(_5286, _5286, _5292);
    float _5296 = fma(_5290, _5290, _5294);
    float _5298 = rsqrt(_5296);
    float _5300 = _5298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5302 = _5286 * _5300;
    float _5304 = _5290 * _5300;
    float _5306 = _5302 * _5302;
    float _5308 = _5304 * _5304;
    float _5310 = _5306 + _5308;
    float _5312 = sqrt(_5310);
    bool _5314 = _5312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5316 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5318 = _5312 + _5316;
    float _5320 = _5290;
    float _5322 = _5294;
    float _5324 = _5318;
    float _5326 = _5282;
    float _5328 = _5300;
    if (_5314)
    {
        float _5330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5320 = _5330;
    }
    float _5332 = _5320;
    if (_5314)
    {
        float _5334 = rsqrt(_5310);
        _5322 = _5334;
    }
    float _5336 = _5322;
    float _5338 = _5336;
    if (_5314)
    {
        float _5340 = _5318 * _5332;
        _5324 = _5340;
    }
    float _5342 = _5324;
    if (_5314)
    {
        float _5344 = _5342 * 0.15915493667125701904296875;
        _5171 = _5344;
    }
    float _5346 = _5171;
    float _5348 = _5298;
    if (_5314)
    {
        float _5350 = _5346 * 6.283185482025146484375;
        float _5352 = sin(_5350);
        _5348 = _5352;
    }
    float _5354 = _5348;
    float _5356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5358 = precise::max(0.0, _5356);
    float _5360 = _5276;
    float _5362 = _5356;
    if (_5314)
    {
        float _5364 = _5346 * 6.283185482025146484375;
        float _5366 = cos(_5364);
        _5360 = _5366;
    }
    float _5368 = _5360;
    float _5370 = -_5300;
    float _5372 = -_5358;
    float _5374 = fma(_5282, _5370, _5372);
    float _5376 = _5374;
    if (!_5314)
    {
        _5326 = _5304;
    }
    float _5378 = _5326;
    float _5380 = _5378;
    if (_5314)
    {
        float _5382 = _5374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5362 = _5382;
    }
    float _5384 = _5362;
    float _5386 = _5354;
    float _5388 = _5384;
    if (_5314)
    {
        float _5390 = fma(_5354, _5384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5386 = _5390;
    }
    float _5392 = _5386;
    float _5394 = _5392;
    float _5396 = _5368;
    if (_5314)
    {
        float _5398 = _5368 + (-1.0);
        _5388 = _5398;
    }
    float _5400 = _5388;
    float _5402 = _5400;
    if (_5314)
    {
        float _5404 = _5336 * _5392;
        _5328 = _5404;
    }
    float _5406 = _5328;
    if (!_5314)
    {
        _5394 = _5302;
    }
    float _5408 = _5394;
    float _5410 = _5408;
    if (_5314)
    {
        float _5412 = _5400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5402 = _5412;
    }
    float _5414 = _5402;
    if (_5314)
    {
        float _5416 = _5302 * _5406;
        _5410 = _5416;
    }
    float _5418 = _5410;
    if (!_5314)
    {
        _5338 = _5306;
    }
    float _5420 = _5338;
    float _5422 = _5420;
    if (_5314)
    {
        float _5424 = _5304 * _5406;
        _5380 = _5424;
    }
    float _5426 = _5380;
    if (_5314)
    {
        float _5428 = fma(_5374, _5368, _5414);
        _5376 = _5428;
    }
    float _5430 = _5376;
    if (_5314)
    {
        float _5432 = _5418 * _5418;
        _5422 = _5432;
    }
    float _5434 = _5422;
    if (!_5314)
    {
        _5396 = _5308;
    }
    float _5436 = _5396;
    float _5438 = sqrt(_5296);
    float _5440 = _5436;
    if (_5314)
    {
        float _5442 = _5426 * _5426;
        _5440 = _5442;
    }
    float _5444 = _5440;
    float _5446 = fma(_5430, _5430, _5434);
    float _5448 = _5446 + _5444;
    float _5450 = rsqrt(_5448);
    float _5452 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5454 = fma(_5438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5452);
    float _5456 = precise::clamp(_5454, 0.0, 1.0);
    float _5458 = -_5456;
    float _5460 = _5458 + 1.0;
    float _5462 = _5450 * _5418;
    float _5464 = abs(_5460);
    float _5466 = log2(_5464);
    float _5468 = _5450 * _5430;
    float _5470 = _5450 * _5426;
    float _5472 = _5462 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5474 = -_5472;
    float _5476 = fma(_5468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5474);
    float _5478 = -_5470;
    float _5480 = fma(_5478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5476);
    float _5482 = fma(_5480, -0.5, 0.5);
    float _5484 = _5466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5486 = fma(_5480, 0.5, 0.5);
    float _5488 = _5468 + 1.0;
    float _5490 = sqrt(_5482);
    float _5492 = fma(_5486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5494 = fma(_5486, _5492, -0.212114393711090087890625);
    float _5496 = exp2(_5484);
    float _5498 = fma(_5486, _5494, 1.570728778839111328125);
    float _5500 = _5490 * 0.636619746685028076171875;
    float _5502 = -_5498;
    float _5504 = fma(_5500, _5502, 1.0);
    float _5506 = -_5468;
    float _5508 = fma(_5496, _5488, _5506);
    float _5510 = fma(_5508, 0.5, 0.5);
    float2 _14238 = float2(_5504, _5510);
    float3 _5514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_14238, float2(0.0), isnan(_14238)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_14238, float2(0.0), isnan(_14238)), level(0.0)).xyz;
    float _5516 = _5514.x;
    float _5518 = _5514.y;
    float _5520 = _5514.z;
    float _5522 = abs(_4645);
    float _5524 = log2(_5522);
    float _5526 = _5466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5528 = -_4585;
    float _5530 = _5528 + 1.0;
    float _5532 = exp2(_5526);
    float _5534 = _5524 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5536 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5538 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5536);
    float _5540 = exp2(_5534);
    float _5542 = -_5532;
    float _5544 = _5542 + 1.0;
    float _5546 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5538);
    float _5548 = _5544 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5550 = fma(_5540, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5552 = precise::clamp(_5550, 0.0, 1.0);
    float _5554 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5546);
    bool _5556 = _4645 <= 8000.0;
    bool _5558 = isnan(_4645);
    bool _5560 = _5556 || _5558;
    bool _5562 = isnan(8000.0);
    bool _5564 = _5560 || _5562;
    float _5566 = float(_5564);
    float _5568 = fma(_5552, -2.0, 3.0);
    float _5570 = _5552 * _5552;
    float _5572 = _5570 * _5568;
    float _5574 = -_5572;
    float _5576 = _5574 + 1.0;
    float _5578 = fma(_5576, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5572);
    float _5580 = _5554 + _5089;
    float _5582 = _5566 * _5578;
    float _5584 = _5580 * 0.5;
    float _5586 = _5580;
    float _5588 = _5117;
    if (!_5095)
    {
        _5586 = 1.0;
    }
    float _5590 = _5586;
    out.gl_Position.x = _5117;
    out.gl_Position.y = _5119;
    out.gl_Position.z = _5554;
    out.gl_Position.w = _5089;
    float _5592 = _5582 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5594 = _5590;
    if (_5095)
    {
        bool _5596 = _5191 >= _5155;
        bool _5598 = isnan(_5191);
        bool _5600 = _5596 || _5598;
        bool _5602 = isnan(_5155);
        bool _5604 = _5600 || _5602;
        float _5606 = float(_5604);
        _5594 = _5606;
    }
    float _5608 = _5594;
    float _5610 = _5548 * _5193;
    out.m_93.z = _5584;
    out.m_93.w = _5089;
    float _5612 = _5530 * _5592;
    float _5614 = precise::clamp(_5612, 0.0, 1.0);
    float _5616 = -_5548;
    float _5618 = _5616 + 1.0;
    float _5620 = _5608 * _5278;
    bool _5622 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5624 = isnan(_5438);
    bool _5626 = _5622 || _5624;
    bool _5628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5630 = _5626 || _5628;
    float _5632 = -_5614;
    float _5634 = fma(_5632, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5636 = _5204 * _5618;
    float _5638 = -_5620;
    float _5640 = fma(_5638, _5634, 1.0);
    float _5642 = precise::clamp(_5640, 0.0, 1.0);
    float _5644 = _5204 * _5610;
    float _5646 = _5642 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5648 = _5620;
    float _5650 = _5642;
    float _5652 = _5610;
    if (!_5630)
    {
        _5588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5654 = _5588;
    out.m_95.x = _5646;
    float _5656 = _5654;
    float _5658 = _5654;
    if (!_5630)
    {
        _5123 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5660 = _5123;
    float _5662 = _5660;
    float _5664 = _5660;
    if (!_5630)
    {
        _5648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5666 = _5648;
    float _5668 = _5666;
    float _5670 = _5666;
    if (!_5630)
    {
        _5161 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5672 = _5161;
    float _5674 = _5672;
    float _5676 = _5672;
    if (!_5630)
    {
        _5650 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5678 = _5650;
    float _5680 = _5520 * _5610;
    float _5682 = fma(_5516, _5644, _5198);
    float _5684 = fma(_5518, _5644, _5200);
    float _5686 = _5678;
    float _5688 = _5678;
    if (!_5630)
    {
        _5652 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5690 = _5652;
    float _5692 = fma(_5204, _5680, _5202);
    out.m_97.x = _5682;
    out.m_97.y = _5684;
    out.m_97.z = _5692;
    out.m_97.w = _5636;
    bool _5694 = !_5630;
    float _5696 = _5690;
    float _5698 = _5690;
    if (!_5694)
    {
        bool _5700 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5702 = isnan(_5438);
        bool _5704 = _5700 || _5702;
        bool _5706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5708 = _5704 || _5706;
        if (!_5708)
        {
            float _5710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5712 = _5438 + _5710;
            float _5714 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5716 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5714;
            float _5718 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5720 = _5718 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5722 = 1.0 / _5716;
            float _5724 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5726 = _5724 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5728 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5730 = _5728 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5732 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5734 = _5732 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5736 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5738 = _5736 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5740 = _5712 * _5722;
            float _5742 = precise::clamp(_5740, 0.0, 1.0);
            float _5744 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5746 = _5744 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5748 = fma(_5742, _5720, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5750 = fma(_5742, _5746, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5752 = fma(_5742, _5726, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5754 = fma(_5742, _5730, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5756 = fma(_5742, _5734, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5758 = fma(_5742, _5738, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5698 = _5752;
            _5676 = _5756;
            _5658 = _5748;
            _5670 = _5754;
            _5664 = _5750;
            _5688 = _5758;
            _5760 = true;
        }
        else
        {
            bool _5762 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5764 = isnan(_5438);
            bool _5766 = _5762 || _5764;
            bool _5768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5770 = _5766 || _5768;
            if (!_5770)
            {
                _5656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5772 = _5656;
            _5658 = _5772;
            if (!_5770)
            {
                _5696 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5774 = _5696;
            _5698 = _5774;
            if (!_5770)
            {
                _5662 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5776 = _5662;
            _5664 = _5776;
            if (!_5770)
            {
                _5668 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5778 = _5668;
            _5670 = _5778;
            if (!_5770)
            {
                _5674 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5780 = _5674;
            _5676 = _5780;
            if (!_5770)
            {
                _5686 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5782 = _5686;
            bool _5784 = !_5770;
            _5688 = _5782;
            if (!_5784)
            {
                bool _5786 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5788 = isnan(_5438);
                bool _5790 = _5786 || _5788;
                bool _5792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5794 = _5790 || _5792;
                if (!_5794)
                {
                    float _5796 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5798 = _5438 + _5796;
                    float _5800 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5802 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5800;
                    float _5804 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5806 = _5804 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5808 = 1.0 / _5802;
                    float _5810 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5812 = _5810 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5814 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5816 = _5814 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5818 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5820 = _5818 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5822 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5824 = _5822 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5826 = _5798 * _5808;
                    float _5828 = precise::clamp(_5826, 0.0, 1.0);
                    float _5830 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5832 = _5830 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5834 = fma(_5828, _5806, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5836 = fma(_5828, _5832, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5838 = fma(_5828, _5812, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5840 = fma(_5828, _5816, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5842 = fma(_5828, _5820, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5844 = fma(_5828, _5824, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5698 = _5838;
                    _5676 = _5842;
                    _5658 = _5834;
                    _5670 = _5840;
                    _5664 = _5836;
                    _5688 = _5844;
                    _5760 = true;
                }
                else
                {
                    _5698 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5676 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5670 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5664 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5688 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5760 = false;
    float _5846 = _5698;
    float _5848 = _5676;
    float _5850 = _5658;
    float _5852 = _5670;
    float _5854 = _5664;
    float _5856 = _5688;
    float _5858 = fma(_4485, -0.5, 0.5);
    float _5860 = precise::clamp(_5858, 0.0, 1.0);
    float _5862 = -_5846;
    float _5864 = _5862 + _5848;
    float _5866 = -_5850;
    float _5868 = _5866 + _5852;
    float _5870 = -_5854;
    float _5872 = _5870 + _5856;
    bool _5874 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5876 = fma(_5860, _5864, _5846);
    float _5878 = fma(_5860, _5868, _5850);
    float _5880 = fma(_5860, _5872, _5854);
    float _5882 = _5876 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _5884 = fma(_5878, 0.298911988735198974609375, _5882);
    float _5886 = fma(_5880, 0.114477999508380889892578125, _5884);
    out.m_99.x = 0.0;
    float _5888 = -_5886;
    float _5890 = _5878 + _5888;
    float _5892 = -_5886;
    float _5894 = _5876 + _5892;
    float _5896 = -_5886;
    float _5898 = _5880 + _5896;
    float _5900 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5902 = fma(_5890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    float _5904 = fma(_5894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    float _5906 = fma(_5898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    out.m_95.w = _5900;
    out.m_101.x = _5902;
    out.m_101.y = _5904;
    out.m_101.z = _5906;
    if (!_5874)
    {
        return out;
    }
    float _5908 = -_4903;
    float _5910 = _5908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5912 = -_4905;
    float _5914 = _5912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5916 = -_4907;
    float _5918 = _5916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5920 = _5910 * _5910;
    float _5922 = fma(_5914, _5914, _5920);
    float _5924 = fma(_5918, _5918, _5922);
    float _5926 = sqrt(_5924);
    float _5928 = rsqrt(_5924);
    float _5930 = -_5926;
    float _5932 = _5930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5934 = _5932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5936 = precise::clamp(_5934, 0.0, 1.0);
    float _5938 = _5914 * _5928;
    float _5940 = _5910 * _5928;
    float _5942 = abs(_5936);
    float _5944 = log2(_5942);
    float _5946 = _5918 * _5928;
    float _5948 = _5938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5950 = _4485 * _5940;
    float _5952 = -_5940;
    float _5954 = -_5948;
    float _5956 = fma(_5952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5954);
    float _5958 = fma(_4483, _5938, _5950);
    float _5960 = -_5946;
    float _5962 = fma(_5960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5956);
    float _5964 = fma(_4489, _5946, _5958);
    float _5966 = precise::clamp(_5964, 0.0, 1.0);
    float _5968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5970 = _5962 + _5968;
    float _5972 = _5944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5974 = _5970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5976 = precise::clamp(_5974, 0.0, 1.0);
    float _5978 = exp2(_5972);
    float _5980 = _5978 * _5976;
    float _5982 = _5966 * _5980;
    float _5984 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5986 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5988 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _5984;
    out.m_99.y = _5986;
    out.m_99.z = _5988;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5760 = false;
    bool _4537 = false;
    bool _1102 = false;
    bool _988 = false;
    bool _884 = false;
    bool _758 = false;
    bool _318 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_58.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_61.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6045 = as_type<float>(_136);
        out.gl_Position.z = _6045;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_63.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_61.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6114 = as_type<float>(_174);
        out.gl_Position.z = _6114;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_65.w;
    float _178 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_63.x;
    float _192 = in.m_63.y;
    float _194 = in.m_63.z;
    float _196 = in.m_58.x;
    float _198 = in.m_58.y;
    float _200 = in.m_58.z;
    float _202 = 0.0;
    float _204 = _178;
    if (!_188)
    {
        float _206 = _178 * _178;
        float _208 = _206 * 0.5;
        _202 = _208;
    }
    float _210 = _202;
    float _212 = _210;
    if (!_188)
    {
        float _214 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _214;
    }
    float _216 = _212;
    bool _218 = !_188;
    float _220 = _216;
    if (!_218)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _178 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _178);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _250;
    }
    float _252 = _220;
    bool _254 = !_188;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _178 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _204 = _274;
    }
    float _276 = _204;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _280 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _282 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _284 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _286 = fma(_276, _190, _280);
    float _288 = fma(_276, _192, _282);
    float _290 = fma(_276, _194, _284);
    float _292 = fma(_286, _176, _196);
    float _294 = fma(_288, _176, _198);
    float _296 = fma(_290, _176, _200);
    bool _298 = !_278;
    float _316;
    if (!_298)
    {
        float _300 = in.m_67.x;
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _304 = _300 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _308 = _306 * _302;
        float _310 = floor(_308);
        float _312 = -_310;
        float _314 = _308 + _312;
        _316 = _314;
        _318 = true;
    }
    else
    {
        float _320 = float(_120);
        float _322 = 1.0 / _320;
        float _324 = _154 * _322;
        _316 = _324;
    }
    _318 = false;
    float _326 = _316;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _340 = 1.0 / _330;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _354;
    float _358 = 1.0 / _338;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _362 = _326 + _360;
    bool _364 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _366 = isnan(_326);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    bool _376 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _378 = isnan(_326);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = 1.0 / _334;
    float _390 = _362 * _340;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _394 = _326 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    bool _400 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _402 = isnan(_326);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    bool _412 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _414 = isnan(_326);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _426 = 1.0 / _348;
    float _428 = _394 * _358;
    bool _430 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _432 = isnan(_326);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _444 = _326 + _442;
    bool _446 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _448 = isnan(_326);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -_440;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _352;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _466 = _326 + _464;
    float _468 = _444 * _388;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _472 = _326 + _470;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _476 = 1.0 / _356;
    float _478 = _466 * _426;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _482 = _326 + _480;
    float _484 = _456 * _460;
    float _486 = -_456;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = 1.0 / _344;
    float _496 = _374 * _488;
    float _498 = fma(_492, _478, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _500 = _472 * _476;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _504 = _326 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _504 * _462;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _512;
    float _516 = fma(_508, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _518 = _482 * _494;
    float _520 = -_374;
    float _522 = _520 + 1.0;
    float _524 = fma(_514, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = -_386;
    float _528 = _526 + 1.0;
    float _530 = _386 * _522;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _536 = _410 * _528;
    bool _538 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _540 = isnan(_326);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = -_410;
    float _556 = _554 + 1.0;
    bool _558 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _560 = isnan(_326);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = fma(_534, _478, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _572 = fma(_552, _478, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _574 = _422 * _556;
    float _576 = -_422;
    float _578 = _576 + 1.0;
    float _580 = -_568;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = _568 * _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _590;
    float _594 = _548 * _582;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _596;
    float _600 = fma(_586, _468, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_592, _468, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _604 = _424 * _594;
    float _606 = fma(_598, _468, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = _524 * _594;
    float _614 = _516 * _594;
    float _616 = -_548;
    float _618 = _616 + 1.0;
    float _620 = fma(_610, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _630 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].x, _612);
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].y, _614);
    float _634 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[143].z, _604);
    float _636 = fma(_572, _588, _630);
    float _638 = fma(_570, _588, _632);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _640;
    float _644 = fma(_498, _588, _634);
    float _646 = fma(_628, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _648 = fma(_624, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _650;
    float _654 = fma(_642, _518, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _656 = fma(_606, _574, _636);
    float _658 = fma(_602, _574, _638);
    float _660 = fma(_600, _574, _644);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _670 = fma(_652, _518, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _672 = fma(_620, _536, _656);
    float _674 = fma(_648, _536, _658);
    float _676 = fma(_646, _536, _660);
    float _678 = fma(_664, _518, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _680 = fma(_668, _510, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _684 = _682 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = fma(_654, _530, _672);
    float _692 = fma(_670, _530, _674);
    float _694 = fma(_678, _530, _676);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _696;
    float _700 = fma(_684, _510, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _702;
    float _706 = fma(_688, _510, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _708;
    float _712 = fma(_680, _496, _690);
    float _714 = fma(_698, _500, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _716 = fma(_704, _500, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _718 = fma(_710, _500, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _720 = fma(_700, _496, _692);
    float _722 = fma(_706, _496, _694);
    float _724 = fma(_714, _484, _712);
    float _726 = fma(_716, _484, _720);
    float _728 = fma(_718, _484, _722);
    float _730 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].x, _724);
    float _732 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].y, _726);
    float _734 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[150].z, _728);
    bool _736 = !_474;
    float _738 = _670;
    float _756;
    if (!_736)
    {
        float _740 = in.m_67.x;
        float _742 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _744 = _740 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[11].x, _154);
        float _748 = _746 * _742;
        float _750 = floor(_748);
        float _752 = -_750;
        float _754 = _748 + _752;
        _756 = _754;
        _758 = true;
    }
    else
    {
        float _760 = float(_120);
        float _762 = 1.0 / _760;
        float _764 = _154 * _762;
        _756 = _764;
    }
    _758 = false;
    float _766 = _756;
    float _768 = in.m_65.x;
    float _770 = in.m_65.y;
    float _772 = in.m_65.z;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _776 = _766 + _774;
    bool _778 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _780 = isnan(_766);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _790;
    bool _794 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _796 = -_788;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _792;
    float _802 = _734 * _772;
    float _804 = _732 * _770;
    float _806 = _730 * _768;
    float _808 = _776 * _800;
    bool _810 = _766 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _812 = isnan(_766);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _830;
    float _834 = _820 * _798;
    float _836 = fma(_824, _808, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _838 = fma(_832, _808, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _840 = fma(_828, _808, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _842 = -_820;
    float _844 = _842 + 1.0;
    float _846 = _836 * _834;
    float _848 = _838 * _834;
    float _850 = _840 * _834;
    float _852 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].x, _846);
    float _854 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].y, _848);
    float _856 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[107].z, _850);
    float _858 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].x, _852);
    float _860 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].y, _854);
    float _862 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[108].z, _856);
    bool _864 = !_794;
    float _882;
    if (!_864)
    {
        float _866 = in.m_67.x;
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _870 = _866 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[11].y, _154);
        float _874 = _872 * _868;
        float _876 = floor(_874);
        float _878 = -_876;
        float _880 = _874 + _878;
        _882 = _880;
        _884 = true;
    }
    else
    {
        float _886 = float(_120);
        float _888 = 1.0 / _886;
        float _890 = _154 * _888;
        _882 = _890;
    }
    _884 = false;
    float _892 = _882;
    bool _894 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = isnan(_892);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _910 = _892 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _912 = isnan(_892);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _928 = _892 + _926;
    float _930 = -_904;
    float _932 = _930 + 1.0;
    bool _934 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _936 = 1.0 / _908;
    float _938 = _920 * _932;
    float _940 = -_920;
    float _942 = _940 + 1.0;
    float _944 = _924 * _936;
    float _946 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _948 = fma(_944, _928, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _950 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _954 = _948 * _938;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[115].x, _954);
    float _960 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _962 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[116].x, _958);
    float _964 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _964;
    out.m_69.y = _956;
    out.m_69.z = _952;
    out.m_69.w = _966;
    bool _968 = !_934;
    float _986;
    if (!_968)
    {
        float _970 = in.m_67.x;
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _974 = _970 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[11].z, _154);
        float _978 = _976 * _972;
        float _980 = floor(_978);
        float _982 = -_980;
        float _984 = _978 + _982;
        _986 = _984;
        _988 = true;
    }
    else
    {
        float _990 = float(_120);
        float _992 = 1.0 / _990;
        float _994 = _154 * _992;
        _986 = _994;
    }
    _988 = false;
    float _996 = _986;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1000 = _996 + _998;
    bool _1002 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_996);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1014;
    bool _1018 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1020 = isnan(_996);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1012;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1034;
    float _1038 = 1.0 / _1016;
    bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1042 = _1028 * _1032;
    float _1044 = -_1028;
    float _1046 = _1044 + 1.0;
    float _1048 = _1000 * _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1050;
    float _1054 = fma(_1036, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1056;
    float _1060 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1062 = _1054 * _1042;
    float _1064 = fma(_1058, _1048, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1066 = _1060 * _1042;
    float _1068 = _1064 * _1042;
    float _1070 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1062);
    float _1072 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1074 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1066);
    float _1076 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1070);
    float _1078 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1072);
    float _1080 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1074);
    bool _1082 = !_1040;
    float _1100;
    if (!_1082)
    {
        float _1084 = in.m_67.x;
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1088 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[11].w, _154);
        float _1092 = _1090 * _1086;
        float _1094 = floor(_1092);
        float _1096 = -_1094;
        float _1098 = _1092 + _1096;
        _1100 = _1098;
        _1102 = true;
    }
    else
    {
        float _1104 = float(_120);
        float _1106 = 1.0 / _1104;
        float _1108 = _154 * _1106;
        _1100 = _1108;
    }
    _1102 = false;
    float _1110 = _1100;
    float _1112 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1114 = int(_1112);
    float _1116 = in.m_67.x;
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1120 = in.m_67.y;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1124 = _1122 != 0;
    float _1126 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1128 = int(_1126);
    float _1130 = in.m_67.z;
    float _1132 = float(_1114);
    float _1134 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1136 = int(_1134);
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1142 = float(_1128);
    float _1144 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1146 = int(_1144);
    if (_1124)
    {
        _738 = _1116;
    }
    float _1148 = _738;
    float _1150 = _1148;
    if (!_1124)
    {
        _1150 = _1120;
    }
    float _1152 = _1150;
    float _1154 = 1.0 / _1132;
    float _1156 = float(_1136);
    float _1158 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1160 = int(_1158);
    float _1162 = float(uint(_1146));
    bool _1164 = _1146 == 0;
    float _1166 = 1.0 / _1142;
    float _1168 = _1154 * _154;
    float _1170 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1172 = int(_1170);
    float _1174 = float(uint(_1160));
    bool _1176 = _1160 == 0;
    float _1178 = 1.0 / _1162;
    float _1180 = _1166 * _154;
    float _1182 = _1166;
    if (_1124)
    {
        _1182 = 1.0;
    }
    float _1184 = _1182;
    float _1186 = _1184;
    if (!_1124)
    {
        _1186 = 7.345489978790283203125;
    }
    float _1188 = _1186;
    float _1190 = trunc(_1168);
    int _1192 = int(_1190);
    float _1194 = _1188 * _1116;
    float _1196 = float(uint(_1172));
    float _1198 = 1.0 / _1156;
    int _1200 = as_type<int>(_1178) + (-2);
    float _1202 = 1.0 / _1174;
    float _1204 = float(uint(_1192));
    float _1206 = trunc(_1180);
    int _1208 = int(_1206);
    float _1210 = _1198 * _154;
    float _1212 = 1.0 / _1196;
    int _1214 = as_type<int>(_1202) + (-2);
    float _1216 = _1202;
    float _1218 = _1204;
    if (_1124)
    {
        _1216 = _1116;
    }
    float _1220 = _1216;
    float _1222 = _1220;
    if (!_1124)
    {
        _1222 = _1130;
    }
    float _1224 = _1222;
    float _1226 = float(uint(_1208));
    float _1228 = as_type<float>(_1200) * _1204;
    float _1230 = trunc(_1210);
    int _1232 = int(_1230);
    float _1234 = _1228;
    if (_1124)
    {
        _1218 = 1.0;
    }
    float _1236 = _1218;
    float _1238 = as_type<float>(_1214) * _1226;
    float _1240 = _1236;
    if (!_1124)
    {
        _1240 = 1.2345600128173828125;
    }
    float _1242 = _1240;
    int _1244 = as_type<int>(_1212) + (-2);
    float _1246 = trunc(_1228);
    float _1248 = precise::max(_1246, 0.0);
    uint _1251 = uint(_1248);
    float _1253 = _1152 * _1242;
    int _1255 = ~_1146;
    int _1257 = _1255 + 1;
    float _1259 = trunc(_1238);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    if (_1124)
    {
        _1234 = 1.0;
    }
    float _1265 = _1234;
    float _1267 = _1265;
    if (!_1124)
    {
        _1267 = 5.839270114898681640625;
    }
    float _1269 = _1267;
    float _1271 = float(uint(_1232));
    float _1273 = _1224 * _1269;
    int _1275 = ~_1160;
    int _1277 = _1275 + 1;
    int _1279 = _1257 * int(_1251);
    int _1281 = _1279 + _1192;
    float _1283 = as_type<float>(_1244) * _1271;
    float _1285 = floor(_1273);
    float _1287 = float(uint(_1281));
    int _1289 = _1277 * int(_1263);
    int _1291 = _1289 + _1208;
    float _1293 = trunc(_1283);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = as_type<float>(_1200) * _1287;
    float _1301 = float(uint(_1291));
    float _1303 = as_type<float>(_1214) * _1301;
    float _1305 = floor(_1253);
    int _1307 = ~_1172;
    int _1309 = _1307 + 1;
    float _1311 = float(_1146);
    int _1313 = _1309 * int(_1297);
    int _1315 = _1313 + _1232;
    float _1317 = floor(_1194);
    float _1319 = float(uint(_1315));
    float _1321 = trunc(_1303);
    float _1323 = precise::max(_1321, 0.0);
    uint _1325 = uint(_1323);
    float _1327 = -_1305;
    float _1329 = _1253 + _1327;
    float _1331 = as_type<float>(_1244) * _1319;
    float _1333 = -_1285;
    float _1335 = _1273 + _1333;
    float _1337 = float(_1192);
    int _1339 = ~_1160;
    int _1341 = _1339 + 1;
    float _1343 = trunc(_1299);
    float _1345 = precise::max(_1343, 0.0);
    uint _1347 = uint(_1345);
    float _1349 = -_1317;
    float _1351 = _1194 + _1349;
    bool _1353 = _1337 >= _1311;
    bool _1355 = isnan(_1337);
    bool _1357 = _1353 || _1355;
    bool _1359 = isnan(_1311);
    bool _1361 = _1357 || _1359;
    float _1363 = float(_1361);
    float _1365 = float(_1160);
    int _1367 = ~_1146;
    int _1369 = _1367 + 1;
    int _1371 = int(_1263) + int(_1325);
    float _1373 = trunc(_1363);
    int _1375 = int(_1373);
    int _1377 = _1341 * _1371;
    int _1379 = _1377 + _1208;
    int _1381 = int(_1251) + int(_1347);
    float _1383 = _1351 * _1311;
    float _1385 = _1365 * _1329;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1389 = _1387 != 0;
    float _1391 = trunc(_1331);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    int _1397 = _1369 * _1381;
    int _1399 = _1397 + _1192;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1403 = _1401 != 0;
    float _1405 = _1311 * _154;
    bool _1407 = uint(_1379) >= uint(_1160);
    float _1409 = float(_1208);
    float _1411 = float(_120);
    float _1413 = trunc(_1385);
    int _1415 = int(_1413);
    bool _1417 = uint(_1399) >= uint(_1146);
    bool _1419 = !_1389;
    int _1421 = _1419 ? 0 : 1;
    bool _1423 = !_1403;
    int _1425 = _1423 ? 0 : 1;
    bool _1427 = _1409 >= _1365;
    bool _1429 = isnan(_1409);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(_1365);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = trunc(_1383);
    int _1441 = int(_1439);
    int _1443 = abs(_1421);
    int _1445 = abs(_1425);
    bool _1447 = !_1417;
    int _1449 = _1447 ? 0 : (-1);
    bool _1451 = !_1407;
    int _1453 = _1451 ? 0 : (-1);
    float _1455 = 1.0 / _1411;
    int _1457 = ~_1381;
    int _1459 = _1457 + _1449;
    int _1461 = _1459 + 1;
    int _1463 = _1415 * _1445;
    int _1465 = _1463 + _1208;
    int _1467 = ~_1371;
    int _1469 = _1467 + _1453;
    int _1471 = _1469 + 1;
    int _1473 = int(_1297) + int(_1395);
    int _1475 = _1146 * _1461;
    int _1477 = _1475 + _1192;
    float _1479 = trunc(_1437);
    int _1481 = int(_1479);
    int _1483 = _1160 * _1471;
    int _1485 = _1483 + _1208;
    int _1487 = _1441 * _1443;
    int _1489 = _1487 + _1192;
    int _1491 = ~_1375;
    int _1493 = _1491 + 1;
    int _1495 = _1493 + 1;
    bool _1497 = !_1164;
    int _1499 = _1497 ? _1477 : (-1);
    bool _1501 = !_1176;
    int _1503 = _1501 ? _1485 : (-1);
    float _1505 = _1405 * _1455;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1509 = _1507 != 0;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1513 = _1511 != 0;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1517 = _1515 != 0;
    int _1519 = _1499 * _1495;
    int _1521 = ~_1172;
    int _1523 = _1521 + 1;
    float _1525 = _1455 * _154;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1529 = _1527 != 0;
    float _1531 = trunc(_1505);
    int _1533 = int(_1531);
    int _1535 = ~_1481;
    int _1537 = _1535 + 1;
    int _1539 = _1537 + 1;
    float _1541 = _1365 * _1525;
    bool _1543 = !_1513;
    int _1545 = _1543 ? 0 : 1;
    bool _1547 = !_1509;
    int _1549 = _1547 ? 0 : 1;
    int _1551 = _1539 * _1503;
    float _1553 = trunc(_1541);
    int _1555 = int(_1553);
    int _1557 = _1146 + (-1);
    int _1559 = abs(_1545);
    int _1561 = _1523 * _1473;
    int _1563 = _1561 + _1232;
    int _1565 = _1160 + (-1);
    int _1567 = _1375 * _1557;
    int _1569 = _1567 + _1519;
    int _1571 = abs(_1549);
    int _1573 = _1481 * _1565;
    int _1575 = _1573 + _1551;
    float _1577 = in.m_71.x;
    bool _1579 = uint(_1563) >= uint(_1172);
    int _1581 = _1569 * _1559;
    bool _1583 = !_1517;
    int _1585 = _1583 ? 0 : 1;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1589 = _1587 != 0;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1593 = _1591 != 0;
    int _1595 = _1533 * _1571;
    int _1597 = _1595 + _1581;
    bool _1599 = !_1529;
    int _1601 = _1599 ? 0 : 1;
    int _1603 = abs(_1585);
    bool _1605 = !_1593;
    int _1607 = _1605 ? 0 : 1;
    int _1609 = abs(_1601);
    float _1611 = float(_1172);
    float _1613 = float(_1232);
    int _1615 = _1489 * _1603;
    int _1617 = _1615 + _1597;
    int _1619 = abs(_1607);
    bool _1621 = _1613 >= _1611;
    bool _1623 = isnan(_1613);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan(_1611);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    int _1633 = _1575 * _1619;
    bool _1635 = !_1589;
    int _1637 = _1635 ? 0 : 1;
    int _1639 = _1441 * _1609;
    int _1641 = _1639 + _1617;
    bool _1643 = !_1579;
    int _1645 = _1643 ? 0 : (-1);
    float _1647 = trunc(_1631);
    int _1649 = int(_1647);
    int _1651 = abs(_1637);
    float _1653 = float(uint(_1641));
    int _1655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1657 = _1655 != 0;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1661 = _1659 != 0;
    int _1663 = _1555 * _1651;
    int _1665 = _1663 + _1633;
    int _1667 = ~_1473;
    int _1669 = _1667 + _1645;
    int _1671 = _1669 + 1;
    float _1673 = as_type<float>(_1200) * _1653;
    bool _1675 = _1172 == 0;
    float _1677 = _1611 * _1525;
    bool _1679 = !_1657;
    int _1681 = _1679 ? 0 : 1;
    int _1683 = _1172 * _1671;
    int _1685 = _1683 + _1232;
    float _1687 = trunc(_1673);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = _1611 * _1335;
    int _1695 = abs(_1681);
    int _1697 = ~_1649;
    int _1699 = _1697 + 1;
    int _1701 = _1699 + 1;
    bool _1703 = !_1675;
    float _1705 = _1703 ? as_type<float>(_1685) : as_type<float>(0xffffffffu /* nan */);
    int _1707 = ~_1146;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1677);
    int _1713 = int(_1711);
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1717 = _1715 != 0;
    int _1719 = _1701 * as_type<int>(_1705);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1723 = _1721 != 0;
    int _1725 = _1465 * _1695;
    int _1727 = _1725 + _1665;
    bool _1729 = !_1661;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = _1172 + (-1);
    int _1735 = _1709 * int(_1691);
    int _1737 = _1735 + _1641;
    int _1739 = abs(_1731);
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1743 = _1741 != 0;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1747 = _1745 != 0;
    int _1749 = _1649 * _1733;
    int _1751 = _1749 + _1719;
    float _1753 = float(uint(_1737));
    int _1755 = _1415 * _1739;
    int _1757 = _1755 + _1727;
    float _1759 = _1705;
    float _1761 = as_type<float>(_1609);
    bool _1763 = _1723;
    if (!_1717)
    {
        _1759 = _1577;
    }
    float _1765 = _1759;
    float _1767 = trunc(_1693);
    int _1769 = int(_1767);
    bool _1771 = !_1747;
    int _1773 = _1771 ? 0 : 1;
    float _1775 = as_type<float>(_1200) * _1753;
    float _1777 = _1765;
    if (!_1717)
    {
        _1761 = _1765;
    }
    float _1779 = _1761;
    bool _1781 = !_1723;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = _1783;
    float _1787 = _1779;
    if (_1717)
    {
        _1777 = _1577;
    }
    float _1789 = _1777;
    float _1791 = trunc(_1775);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = float(uint(_1757));
    bool _1799 = !_1743;
    int _1801 = _1799 ? 0 : 1;
    int _1803 = abs(_1773);
    float _1805 = as_type<float>(_1214) * _1797;
    int _1807 = abs(_1783);
    float _1809 = _1789;
    if (_1717)
    {
        float _1811 = -_1789;
        float _1813 = _1811 + 1.0;
        _1785 = as_type<int>(_1813);
    }
    int _1815 = _1785;
    if (_1717)
    {
        bool _1817 = _1116 > 0.5;
        _1763 = _1817;
    }
    bool _1819 = _1763;
    int _1821 = abs(_1801);
    int _1823 = _1769 * _1807;
    int _1825 = _1823 + _1232;
    float _1827 = trunc(_1805);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    int _1833 = _1769;
    if (_1717)
    {
        float _1835 = _1819 ? as_type<float>(_1815) : _1789;
        _1787 = _1835;
    }
    float _1837 = _1787;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1841 = _1839 != 0;
    int _1843 = _1751 * _1803;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1847 = _1845 != 0;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : 1;
    int _1853 = _1713 * _1821;
    int _1855 = _1853 + _1843;
    bool _1857 = !_1847;
    int _1859 = _1857 ? 0 : 1;
    float _1861 = in.m_71.y;
    int _1863 = int(_1691) + int(_1795);
    int _1865 = ~_1146;
    int _1867 = _1865 + 1;
    int _1869 = abs(_1851);
    int _1871 = abs(_1859);
    int _1873 = _1867 * _1863;
    int _1875 = _1873 + _1641;
    int _1877 = ~_1160;
    int _1879 = _1877 + 1;
    int _1881 = _1825 * _1869;
    int _1883 = _1881 + _1855;
    int _1885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1887 = _1885 != 0;
    int _1889 = _1879 * int(_1831);
    int _1891 = _1889 + _1757;
    float _1893 = in.m_67.w;
    int _1895 = _1769 * _1871;
    int _1897 = _1895 + _1883;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1901 = _1899 != 0;
    float _1903 = float(uint(_1891));
    float _1905 = float(uint(_1897));
    bool _1907 = uint(_1875) >= uint(_1146);
    float _1909 = as_type<float>(_1214) * _1903;
    int _1911 = ~_1172;
    int _1913 = _1911 + 1;
    float _1915 = as_type<float>(_1244) * _1905;
    bool _1917 = !_1907;
    int _1919 = _1917 ? 0 : (-1);
    float _1921 = as_type<float>(_1879);
    int _1923 = _1855;
    if (_1887)
    {
        float _1925 = -_1789;
        float _1927 = _1925 + 1.0;
        _1833 = as_type<int>(_1927);
    }
    int _1929 = _1833;
    bool _1931 = _1130 > 0.5;
    float _1933 = trunc(_1909);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    if (!_1887)
    {
        _1921 = _1789;
    }
    float _1939 = _1921;
    float _1941 = _1939;
    if (_1901)
    {
        float _1943 = -_1789;
        float _1945 = _1943 + 1.0;
        _1923 = as_type<int>(_1945);
    }
    int _1947 = _1923;
    if (_1887)
    {
        float _1949 = _1931 ? as_type<float>(_1929) : _1789;
        _1941 = _1949;
    }
    float _1951 = _1941;
    float _1953 = -_1861;
    float _1955 = _1953 + 1.0;
    bool _1957 = _1120 > 0.5;
    int _1959 = ~_1863;
    int _1961 = _1959 + _1919;
    int _1963 = _1961 + 1;
    float _1965 = trunc(_1915);
    float _1967 = precise::max(_1965, 0.0);
    uint _1969 = uint(_1967);
    float _1971 = _1861;
    if (_1901)
    {
        float _1973 = _1957 ? as_type<float>(_1947) : _1789;
        _1809 = _1973;
    }
    float _1975 = _1809;
    bool _1977 = _1893 > 0.5;
    int _1979 = _1146 * _1963;
    int _1981 = _1979 + _1641;
    int _1983 = _1957 ? as_type<int>(_1955) : as_type<int>(_1861);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1987 = _1985 != 0;
    int _1989 = int(_1831) + int(_1937);
    float _1991 = _1987 ? as_type<float>(_1983) : _1861;
    int _1993 = ~_1160;
    int _1995 = _1993 + 1;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1999 = _1997 != 0;
    int _2001 = _1913 * int(_1969);
    int _2003 = _2001 + _1897;
    int _2005 = _1977 ? as_type<int>(_1955) : as_type<int>(_1861);
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2009 = _2007 != 0;
    float _2011 = float(uint(_2003));
    int _2013 = _1995 * _1989;
    int _2015 = _2013 + _1757;
    bool _2017 = _1146 == 0;
    float _2019 = _2009 ? as_type<float>(_2005) : _1861;
    float _2021 = as_type<float>(_1244) * _2011;
    bool _2023 = uint(_2015) >= uint(_1160);
    bool _2025 = !_2017;
    int _2027 = _2025 ? _1981 : (-1);
    if (_1999)
    {
        float _2029 = _1931 ? _1955 : _1861;
        _1971 = _2029;
    }
    float _2031 = _1971;
    float _2033 = trunc(_2021);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    bool _2039 = !_2023;
    int _2041 = _2039 ? 0 : (-1);
    int _2043 = _2027 & 3;
    bool _2045 = _2043 != 0;
    int _2047 = _2027 & 3;
    bool _2049 = _2047 != 0;
    int _2051 = ~_1989;
    int _2053 = _2051 + _2041;
    int _2055 = _2053 + 1;
    bool _2057 = uint(_2043) >= 2u;
    int _2059 = _2049 ? 0 : 1;
    int _2061 = _1160 * _2055;
    int _2063 = _2061 + _1757;
    bool _2065 = uint(_2043) > 1u;
    int _2067 = _2057 ? 0 : 1;
    bool _2069 = _2043 != 3;
    bool _2071 = _1160 == 0;
    int _2073 = ~_2059;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2071;
    int _2081 = _2079 ? _2063 : (-1);
    int _2083 = ~_1172;
    int _2085 = _2083 + 1;
    int _2087 = int(_1969) + int(_2037);
    int _2089 = _2077;
    if (!_2065)
    {
        int _2091 = ~_2059;
        int _2093 = _2091 + 1;
        _2089 = _2093;
    }
    int _2095 = _2089;
    int _2097 = _2081 & 3;
    bool _2099 = _2097 != 0;
    int _2101 = _2085 * _2087;
    int _2103 = _2101 + _1897;
    int _2105 = ~_2067;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = _2109;
    if (_2069)
    {
        int _2113 = ~_2067;
        int _2115 = _2113 + 1;
        _2111 = _2115;
    }
    int _2117 = _2111;
    bool _2119 = uint(_2097) >= 2u;
    int _2121 = _2099 ? 0 : 1;
    int _2123 = _2119 ? 0 : 1;
    bool _2125 = uint(_2103) >= uint(_1172);
    bool _2127 = _2097 != 3;
    float _2129 = float(uint(_1489));
    bool _2131 = !_2125;
    int _2133 = _2131 ? 0 : (-1);
    bool _2135 = uint(_2097) > 1u;
    float _2137 = as_type<float>(_1200) * _2129;
    float _2139 = float(uint(_1465));
    int _2141 = ~_2087;
    int _2143 = _2141 + _2133;
    int _2145 = _2143 + 1;
    int _2147 = ~_2123;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2137);
    float _2155 = precise::max(_2153, 0.0);
    uint _2157 = uint(_2155);
    float _2159 = as_type<float>(_1214) * _2139;
    int _2161 = _2151;
    if (_2127)
    {
        int _2163 = ~_2123;
        int _2165 = _2163 + 1;
        _2161 = _2165;
    }
    int _2167 = _2161;
    float _2169 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2171 = ~_2121;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2179 = _2177 != 0;
    int _2181 = _2175;
    if (!_2135)
    {
        int _2183 = ~_2121;
        int _2185 = _2183 + 1;
        _2181 = _2185;
    }
    int _2187 = _2181;
    int _2189 = _1172 * _2145;
    int _2191 = _2189 + _1897;
    float _2193 = trunc(_2159);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    bool _2199 = !_2179;
    int _2201 = _2199 ? 0 : 1;
    float _2203 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2205 = ~_1146;
    int _2207 = _2205 + 1;
    float _2209 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2169);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2213 = _2211 != 0;
    float _2215 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2203);
    int _2217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2219 = _2217 != 0;
    float _2221 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2223 = !_1675;
    int _2225 = _2223 ? _2191 : (-1);
    float _2227 = float(uint(_1825));
    int _2229 = ~_1160;
    int _2231 = _2229 + 1;
    int _2233 = _2207 * int(_2157);
    int _2235 = _2233 + _1489;
    bool _2237 = !_2213;
    int _2239 = _2237 ? 0 : 1;
    float _2241 = as_type<float>(_1244) * _2227;
    int _2243 = _2225 & 3;
    bool _2245 = _2243 != 0;
    int _2247 = _2231 * int(_2197);
    int _2249 = _2247 + _1465;
    float _2251 = float(uint(_2235));
    float _2253 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2221);
    float _2255 = trunc(_2241);
    float _2257 = precise::max(_2255, 0.0);
    uint _2259 = uint(_2257);
    int _2261 = _2245 ? 0 : 1;
    float _2263 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2265 = float(uint(_2249));
    float _2267 = as_type<float>(_1200) * _2251;
    bool _2269 = uint(_2243) >= 2u;
    float _2271 = _1116 * 2.0;
    int _2273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2275 = _2273 != 0;
    float _2277 = as_type<float>(_1214) * _2265;
    int _2279 = ~_1172;
    int _2281 = _2279 + 1;
    float _2283 = floor(_2271);
    int _2285 = _2269 ? 0 : 1;
    bool _2287 = _2243 != 3;
    int _2289 = ~_2285;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = _2281 * int(_2259);
    int _2297 = _2295 + _1825;
    float _2299 = trunc(_2277);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2307 = float(uint(_2297));
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2311 = ~_2261;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2319 = _2225 >> 31;
    float _2321 = as_type<float>(_1244) * _2307;
    int _2323 = _2293;
    int _2325 = as_type<int>(_2263);
    int _2327 = _2315;
    int _2329 = as_type<int>(_2215);
    if (_2287)
    {
        int _2331 = ~_2285;
        int _2333 = _2331 + 1;
        _2323 = _2333;
    }
    int _2335 = _2323;
    float _2337 = -_2309;
    float _2339 = fma(_2263, 2.0, _2337);
    bool _2341 = uint(_2243) > 1u;
    float _2343 = trunc(_2321);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    bool _2349 = !_2219;
    int _2351 = _2349 ? 0 : 1;
    float _2353 = fma(_2305, -2.0, _2317);
    if (_2275)
    {
        _2325 = 0;
    }
    int _2355 = _2325;
    float _2357 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2215);
    bool _2359 = _2283 > 0.0;
    float _2361 = -_154;
    float _2363 = fma(_2361, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2339);
    int _2365 = _2355;
    if (!_2275)
    {
        _2365 = 1;
    }
    int _2367 = _2365;
    float _2369 = trunc(_2267);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = int(_2197) + int(_2303);
    float _2377 = _2357 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2379 = ~_1160;
    int _2381 = _2379 + 1;
    if (!_2341)
    {
        int _2383 = ~_2261;
        int _2385 = _2383 + 1;
        _2327 = _2385;
    }
    int _2387 = _2327;
    bool _2389 = _2283 >= 0.0;
    bool _2391 = isnan(_2283);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2209);
    int _2401 = int(_2259) + int(_2347);
    float _2403 = _1120 * 2.0;
    int _2405 = ~_1146;
    int _2407 = _2405 + 1;
    float _2409 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2253);
    int _2411 = _2397 ? 0 : 1;
    float _2413 = _2399 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2415 = _2367 != 1;
    float _2417 = floor(_2403);
    int _2419 = int(_2157) + int(_2373);
    float _2421 = _2409 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2423 = ~_2411;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    int _2429 = _2407 * _2419;
    int _2431 = _2429 + _1489;
    int _2433 = _2427;
    float _2435 = (*spvDescriptorSet0.vp_c9)._m0[131].w;
    if (!_2359)
    {
        int _2437 = ~_2411;
        int _2439 = _2437 + 1;
        _2433 = _2439;
    }
    int _2441 = _2433;
    int _2443 = _2381 * _2375;
    int _2445 = _2443 + _1465;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2451 = ~_1172;
    int _2453 = _2451 + 1;
    bool _2455 = uint(_2431) >= uint(_1146);
    float _2457 = 1.0 / _2449;
    bool _2459 = uint(_2445) >= uint(_1160);
    float _2461 = _1130 * 2.0;
    float _2463 = 0.0;
    if (!_2415)
    {
        _2463 = _1120;
    }
    float _2465 = _2463;
    bool _2467 = !_2455;
    int _2469 = _2467 ? 0 : (-1);
    float _2471 = 0.0;
    float _2473 = _2465;
    if (!_2415)
    {
        _2471 = _2465;
    }
    float _2475 = _2471;
    int _2477 = _2453 * _2401;
    int _2479 = _2477 + _1825;
    float _2481 = _2475;
    if (!_2415)
    {
        _2435 = _1130;
    }
    float _2483 = _2435;
    float _2485 = floor(_2461);
    float _2487 = 0.0;
    float _2489 = _2483;
    if (!_2415)
    {
        _2487 = _1130;
    }
    float _2491 = _2487;
    bool _2493 = _2417 > 0.0;
    float _2495 = _2491;
    if (_2415)
    {
        _2481 = _1116;
    }
    float _2497 = _2481;
    if (_2415)
    {
        _2473 = _1116;
    }
    float _2499 = _2473;
    if (_2415)
    {
        _2489 = _1120;
    }
    float _2501 = _2489;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2505 = _1110 + _2503;
    if (_2415)
    {
        _2495 = _1120;
    }
    float _2507 = _2495;
    bool _2509 = uint(_2479) >= uint(_1172);
    bool _2511 = !_2459;
    int _2513 = _2511 ? 0 : (-1);
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1138);
    bool _2517 = _2417 >= 0.0;
    bool _2519 = isnan(_2417);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(0.0);
    bool _2525 = _2521 || _2523;
    float _2527 = _2501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2529 = !_2509;
    int _2531 = _2529 ? 0 : (-1);
    float _2533 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2515);
    int _2535 = _2525 ? 0 : 1;
    bool _2537 = !_2045;
    int _2539 = _2537 ? 0 : 1;
    int _2541 = _2081 & 3;
    bool _2543 = _2541 != 0;
    int _2545 = _2225 & 3;
    bool _2547 = _2545 != 0;
    if (_2275)
    {
        _2329 = 0;
    }
    int _2549 = _2329;
    int _2551 = _2549;
    if (!_2275)
    {
        _2551 = 2;
    }
    int _2553 = _2551;
    int _2555 = ~_2535;
    int _2557 = _2555 + 1;
    int _2559 = _2557 + 1;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2563 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2561;
    int _2565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2567 = _2565 != 0;
    int _2569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2571 = _2569 != 0;
    int _2573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2575 = _2573 != 0;
    int _2577 = _2559;
    if (!_2493)
    {
        int _2579 = ~_2535;
        int _2581 = _2579 + 1;
        _2577 = _2581;
    }
    int _2583 = _2577;
    float _2585 = _2563 * _2457;
    bool _2587 = _2485 >= 0.0;
    bool _2589 = isnan(_2485);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan(0.0);
    bool _2595 = _2591 || _2593;
    float _2597 = _1120 + _1130;
    bool _2599 = _1110 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2601 = isnan(_1110);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2607 = _2603 || _2605;
    float _2609 = float(_2607);
    float _2611 = fma(_2585, _2505, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2613 = _2595 ? 0 : 1;
    float _2615 = _2597 + (-1.0);
    bool _2617 = _2553 != 2;
    float _2619 = -_2609;
    float _2621 = _2619 + 1.0;
    bool _2623 = !_2547;
    int _2625 = _2623 ? 0 : 1;
    bool _2627 = _1110 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2629 = isnan(_1110);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    bool _2639 = _2485 > 0.0;
    float _2641 = _1116 + _1120;
    int _2643 = ~_2613;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    float _2649 = _2637 * _2621;
    bool _2651 = !_2543;
    int _2653 = _2651 ? 0 : 1;
    float _2655 = _2641 + (-1.0);
    float _2657 = -_2637;
    float _2659 = _2657 + 1.0;
    float _2661 = _2611 * _2649;
    float _2663 = _2637;
    int _2665 = _2647;
    if (_2617)
    {
        _2663 = _1116;
    }
    float _2667 = _2663;
    float _2669 = fma(_2655, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2671 = _2667;
    if (!_2617)
    {
        _2671 = _1130;
    }
    float _2673 = _2671;
    float _2675 = fma(_2659, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2661);
    float _2677 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_2639)
    {
        int _2679 = ~_2613;
        int _2681 = _2679 + 1;
        _2665 = _2681;
    }
    int _2683 = _2665;
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2687 = _2377 + _2685;
    bool _2689 = _2097 != 3;
    float _2691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2693 = _2421 + _2691;
    bool _2695 = _2043 != 3;
    float _2697 = _2673 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2699 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2701 = fma(_2609, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2675);
    bool _2703 = !_2689;
    int _2705 = _2703 ? 0 : (-1);
    float _2707 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2709 = _2413 + _2707;
    bool _2711 = _2243 != 3;
    float _2713 = _2693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2715 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2717 = -_2699;
    float _2719 = fma(_2697, 2.0, _2717);
    float _2721 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2723 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2713);
    float _2725 = _2715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2727 = _2081 >> 31;
    float _2729 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2731 = _2027 >> 31;
    float _2733 = _2721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2735 = _2727 & 3;
    float _2737 = fma(_2687, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2723);
    int _2739 = _2731 & 3;
    float _2741 = _2701 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2743 = _2319 & 3;
    float _2745 = -_154;
    float _2747 = fma(_2745, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2719);
    int _2749 = _2081 + _2735;
    bool _2751 = !_2711;
    int _2753 = _2751 ? 0 : (-1);
    out.m_73.x = _2729;
    out.m_73.y = _2725;
    out.m_73.z = _2733;
    out.m_73.w = _2741;
    int _2755 = _2027 + _2739;
    bool _2757 = _2737 >= 0.0;
    int _2759 = _2225 + _2743;
    int _2761 = _2749 >> 2;
    int _2763 = _2755 >> 2;
    int _2765 = _2761 << 4;
    int _2767 = _2765 + 512;
    float _2769 = _2497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2771 = _2763 << 4;
    int _2773 = _2771 + 368;
    float _2775 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    uint _2777 = uint(int(uint(_2767) >> uint(2)));
    uint _2779 = uint(int(uint(int(_2777)) >> uint(2)));
    int _2781 = int(_2777) & 3;
    float _2783 = (*spvDescriptorSet0.vp_c9)._m0[int(_2779)][_2781];
    int _2785 = int(_2777) + 1;
    uint _2787 = uint(int(uint(_2785) >> uint(2)));
    int _2789 = _2785 & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    float _2793 = _2775;
    if (_2757)
    {
        out.m_61.x = 0.0;
    }
    bool _2795 = !_2571;
    int _2797 = _2795 ? 0 : 1;
    float _2799 = fma(_2499, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2775);
    int _2801 = _2759 >> 2;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2805 = !_2567;
    int _2807 = _2805 ? 0 : 1;
    uint _2809 = uint(int(uint(_2773) >> uint(2)));
    uint _2811 = uint(int(uint(int(_2809)) >> uint(2)));
    int _2813 = int(_2809) & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = int(_2809) + 1;
    uint _2819 = uint(int(uint(_2817) >> uint(2)));
    int _2821 = _2817 & 3;
    float _2823 = (*spvDescriptorSet0.vp_c9)._m0[int(_2819)][_2821];
    int _2825 = abs(_2797);
    float _2827 = -_1140;
    float _2829 = fma(_2769, 2.0, _2827);
    int _2831 = _2801 << 4;
    int _2833 = _2831 + 656;
    float _2835 = float(_2441);
    float _2837 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2799);
    int _2839 = abs(_2807);
    int _2841 = _2773 + 8;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    uint _2845 = uint(int(uint(int(_2843)) >> uint(2)));
    int _2847 = int(_2843) & 3;
    float _2849 = (*spvDescriptorSet0.vp_c9)._m0[int(_2845)][_2847];
    int _2851 = int(_2843) + 1;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    int _2855 = _2851 & 3;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[int(_2853)][_2855];
    float _2859 = float(_2683);
    float _2861 = fma(_2527, -2.0, _2803);
    int _2863 = ~_2419;
    int _2865 = _2863 + _2469;
    int _2867 = _2865 + 1;
    float _2869 = -_154;
    float _2871 = fma(_2869, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2829);
    int _2873 = ~_2375;
    int _2875 = _2873 + _2513;
    int _2877 = _2875 + 1;
    float _2879 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2861);
    int _2881 = ~_2401;
    int _2883 = _2881 + _2531;
    int _2885 = _2883 + 1;
    uint _2887 = uint(int(uint(_2833) >> uint(2)));
    uint _2889 = uint(int(uint(int(_2887)) >> uint(2)));
    int _2891 = int(_2887) & 3;
    float _2893 = (*spvDescriptorSet0.vp_c9)._m0[int(_2889)][_2891];
    int _2895 = int(_2887) + 1;
    uint _2897 = uint(int(uint(_2895) >> uint(2)));
    int _2899 = _2895 & 3;
    float _2901 = (*spvDescriptorSet0.vp_c9)._m0[int(_2897)][_2899];
    float _2903 = float(_2839);
    int _2905 = _1146 * _2867;
    int _2907 = _2905 + _1489;
    if (_2757)
    {
        _2793 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2909 = _2793;
    int _2911 = _1172 * _2885;
    int _2913 = _2911 + _1825;
    int _2915 = abs(_2387);
    float _2917 = _2903 * _2859;
    int _2919 = abs(_2095);
    int _2921 = _2767 + 8;
    uint _2923 = uint(int(uint(_2921) >> uint(2)));
    uint _2925 = uint(int(uint(int(_2923)) >> uint(2)));
    int _2927 = int(_2923) & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    int _2931 = int(_2923) + 1;
    uint _2933 = uint(int(uint(_2931) >> uint(2)));
    int _2935 = _2931 & 3;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[int(_2933)][_2935];
    int _2939 = abs(_2187);
    int _2941 = as_type<int>(_2909);
    if (_2757)
    {
        float _2943 = _2909 * 5.0;
        _2941 = as_type<int>(_2943);
    }
    int _2945 = _2941;
    float _2947 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2949 = int(_2947);
    int _2951 = abs(_2117);
    int _2953 = _1160 * _2877;
    int _2955 = _2953 + _1465;
    bool _2957 = !_2695;
    int _2959 = _2957 ? 0 : (-1);
    if (_2757)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10235 = as_type<float>(_2945);
        out.gl_Position.z = _10235;
    }
    int _2961 = _2833 + 8;
    uint _2963 = uint(int(uint(_2961) >> uint(2)));
    uint _2965 = uint(int(uint(int(_2963)) >> uint(2)));
    int _2967 = int(_2963) & 3;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[int(_2965)][_2967];
    int _2971 = int(_2963) + 1;
    uint _2973 = uint(int(uint(_2971) >> uint(2)));
    int _2975 = _2971 & 3;
    float _2977 = (*spvDescriptorSet0.vp_c9)._m0[int(_2973)][_2975];
    int _2979 = ~_2951;
    int _2981 = _2979 + 1;
    int _2983 = _2981 + 1;
    int _2985 = abs(_2959);
    bool _2987 = _1146 == 0;
    float _2989 = float(_2825);
    float _2991 = _2989 * _2835;
    float _2993 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2995 = int(_2993);
    int _2997 = ~_2939;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = _2991 * (-2.0);
    int _3005 = ~_2919;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    int _3011 = ~_2915;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    int _3017 = _3001 * as_type<int>(_2791);
    int _3019 = abs(_2653);
    int _3021 = _3009 * as_type<int>(_2823);
    int _3023 = abs(_2539);
    float _3025 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3027 = int(_3025);
    int _3029 = ~_3019;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = fma(_2677, _3003, _2677);
    int _3037 = ~_3023;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    int _3043 = abs(_2625);
    int _3045 = _3033 * as_type<int>(_2783);
    int _3047 = _3045 + _3017;
    int _3049 = abs(_2167);
    int _3051 = _3041 * as_type<int>(_2815);
    int _3053 = _3051 + _3021;
    int _3055 = ~_3043;
    int _3057 = _3055 + 1;
    int _3059 = _3057 + 1;
    int _3061 = _3015 * as_type<int>(_2901);
    int _3063 = ~_3049;
    int _3065 = _3063 + 1;
    int _3067 = _3065 + 1;
    int _3069 = _2983 * as_type<int>(_2849);
    int _3071 = _3069 + _3053;
    int _3073 = abs(_2705);
    int _3075 = _3059 * as_type<int>(_2893);
    int _3077 = _3075 + _3061;
    int _3079 = _3067 * as_type<int>(_2929);
    int _3081 = _3079 + _3047;
    float _3083 = float(uint(_2949));
    float _3085 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3087 = log2(_3085);
    int _3089 = ~_2985;
    int _3091 = _3089 + 1;
    int _3093 = _3091 + 1;
    int _3095 = abs(_2335);
    float _3097 = float(uint(_2995));
    int _3099 = _3093 * as_type<int>(_2857);
    int _3101 = _3099 + _3071;
    int _3103 = ~_3095;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = 1.0 / _3083;
    int _3111 = abs(_2753);
    int _3113 = abs(_2239);
    int _3115 = _3107 * as_type<int>(_2969);
    int _3117 = _3115 + _3077;
    int _3119 = ~_3111;
    int _3121 = _3119 + 1;
    int _3123 = _3121 + 1;
    float _3125 = _2693 * _2693;
    int _3127 = abs(_2949);
    float _3129 = 1.0 / _3097;
    int _3131 = ~_3073;
    int _3133 = _3131 + 1;
    int _3135 = _3133 + 1;
    int _3137 = abs(_2201);
    int _3139 = _3123 * as_type<int>(_2977);
    int _3141 = _3139 + _3117;
    bool _3143 = !_2987;
    int _3145 = _3143 ? _2907 : (-1);
    int _3147 = _3135 * as_type<int>(_2937);
    int _3149 = _3147 + _3081;
    int _3151 = ~_3137;
    int _3153 = _3151 + 1;
    int _3155 = _3153 + 1;
    float _3157 = fma(_2709, _2709, _3125);
    bool _3159 = _1160 == 0;
    float _3161 = float(uint(_3027));
    int _3163 = _3101 * _3155;
    int _3165 = ~_3113;
    int _3167 = _3165 + 1;
    int _3169 = _3167 + 1;
    bool _3171 = !_3159;
    int _3173 = _3171 ? _2955 : (-1);
    int _3175 = _3145 * _3137;
    int _3177 = _3175 + _3163;
    int _3179 = abs(_3027);
    int _3181 = _3169 * _3149;
    int _3183 = abs(_2995);
    float _3185 = 1.0 / _3161;
    int _3187 = _3173 * _3113;
    int _3189 = _3187 + _3181;
    int _3191 = abs(_2351);
    float _3193 = fma(_2687, _2687, _3157);
    int _3195 = as_type<int>(_3109) + (-2);
    float _3197 = float(uint(_3177));
    float _3199 = rsqrt(_3193);
    float _3201 = float(uint(_3183));
    float _3203 = float(uint(_3127));
    float _3205 = as_type<float>(_3195) * _3197;
    int _3207 = ~_3191;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    int _3213 = as_type<int>(_3129) + (-2);
    float _3215 = 1.0 / _3201;
    float _3217 = float(uint(_3189));
    int _3219 = _3211 * _3141;
    float _3221 = float(uint(_3179));
    float _3223 = in.m_75.x;
    float _3225 = in.m_75.y;
    float _3227 = in.m_75.z;
    bool _3229 = !_1675;
    int _3231 = _3229 ? _2913 : (-1);
    float _3233 = as_type<float>(_3213) * _3217;
    int _3235 = as_type<int>(_3185) + (-2);
    float _3237 = 1.0 / _3203;
    int _3239 = abs(_3177);
    int _3241 = _3231 * _3191;
    int _3243 = _3241 + _3219;
    int _3245 = abs(_3189);
    int _3247 = ~_2949;
    int _3249 = _3247 + 1;
    float _3251 = float(uint(_3243));
    float _3253 = 1.0 / _3221;
    int _3255 = as_type<int>(_3215) + (-2);
    float _3257 = as_type<float>(_3235) * _3251;
    float _3259 = float(uint(_3239));
    int _3261 = ~_2995;
    int _3263 = _3261 + 1;
    float _3265 = trunc(_3205);
    float _3267 = precise::max(_3265, 0.0);
    uint _3269 = uint(_3267);
    int _3271 = as_type<int>(_3237) + (-2);
    int _3273 = abs(_3243);
    float _3275 = float(uint(_3245));
    float _3277 = as_type<float>(_3271) * _3259;
    float _3279 = float(uint(_3273));
    float _3281 = trunc(_3233);
    float _3283 = precise::max(_3281, 0.0);
    uint _3285 = uint(_3283);
    int _3287 = as_type<int>(_3253) + (-2);
    float _3289 = as_type<float>(_3255) * _3275;
    float _3291 = _3259;
    if (_2617)
    {
        _3291 = _1120;
    }
    float _3293 = _3291;
    float _3295 = as_type<float>(_3287) * _3279;
    float _3297 = _3293;
    if (!_2617)
    {
        _3297 = _1116;
    }
    float _3299 = _3297;
    int _3301 = _3249 * int(_3269);
    int _3303 = _3301 + _3177;
    float _3305 = trunc(_3277);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3313 = ~_3183;
    int _3315 = _3313 + 1;
    float _3317 = _3299 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3319 = _2917 * (-2.0);
    int _3321 = ~_3027;
    int _3323 = _3321 + 1;
    int _3325 = _3263 * int(_3285);
    int _3327 = _3325 + _3189;
    float _3329 = float(uint(_3303));
    float _3331 = fma(_3317, -2.0, _3311);
    float _3333 = fma(_2669, _3319, _2669);
    float _3335 = fma(_3319, _3223, _3223);
    float _3337 = float(uint(_3327));
    float _3339 = as_type<float>(_3195) * _3329;
    float _3341 = trunc(_3257);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    float _3347 = _2693 * _3199;
    float _3349 = _2709 * _3199;
    float _3351 = as_type<float>(_3213) * _3337;
    int _3353 = ~_3179;
    int _3355 = _3353 + 1;
    float _3357 = -_3347;
    float _3359 = fma(_3357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2693);
    float _3361 = -_3349;
    float _3363 = fma(_3361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2709);
    bool _3365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3367 = isnan(0.0);
    bool _3369 = _3365 || _3367;
    bool _3371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3373 = _3369 || _3371;
    float _3375 = trunc(_3339);
    float _3377 = precise::max(_3375, 0.0);
    uint _3379 = uint(_3377);
    float _3381 = _3359 * _3359;
    float _3383 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3331);
    float _3385 = fma(_3363, _3363, _3381);
    float _3387 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3389 = trunc(_3295);
    float _3391 = precise::max(_3389, 0.0);
    uint _3393 = uint(_3391);
    int _3395 = _3323 * int(_3345);
    int _3397 = _3395 + _3243;
    float _3399 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3387);
    float _3401 = float(uint(_3397));
    float _3403 = trunc(_3289);
    float _3405 = precise::max(_3403, 0.0);
    uint _3407 = uint(_3405);
    int _3409 = ~_3127;
    int _3411 = _3409 + 1;
    float _3413 = as_type<float>(_3235) * _3401;
    int _3415 = _3411 * int(_3309);
    int _3417 = _3415 + _3239;
    float _3419 = trunc(_3351);
    float _3421 = precise::max(_3419, 0.0);
    uint _3423 = uint(_3421);
    int _3425 = _3355 * int(_3393);
    int _3427 = _3425 + _3273;
    float _3429 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3431 = float(uint(_3417));
    int _3433 = int(_3269) + int(_3379);
    float _3435 = _3087 * _154;
    float _3437 = float(uint(_3427));
    int _3439 = _3315 * int(_3407);
    int _3441 = _3439 + _3245;
    float _3443 = as_type<float>(_3271) * _3431;
    float _3445 = trunc(_3413);
    float _3447 = precise::max(_3445, 0.0);
    uint _3449 = uint(_3447);
    float _3451 = as_type<float>(_3287) * _3437;
    float _3453 = float(uint(_3441));
    float _3455 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3429);
    float _3457 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3459 = 1.0 + _3457;
    int _3461 = int(_3285) + int(_3423);
    float _3463 = _1116 + (-0.5);
    float _3465 = exp2(_3435);
    float _3467 = as_type<float>(_3255) * _3453;
    float _3469 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3455);
    float _3471 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _3473 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3475 = isnan(1.0);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3481 = _3477 || _3479;
    float _3483 = fma(_3463, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3335);
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3487 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3471);
    float _3489 = 1.0 / _3459;
    int _3491 = ~_2995;
    int _3493 = _3491 + 1;
    float _3495 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3485);
    int _3497 = ~_2949;
    int _3499 = _3497 + 1;
    float _3501 = _1120 + (-0.5);
    float _3503 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2353);
    float _3505 = -_3465;
    float _3507 = _3505 + 1.0;
    float _3509 = trunc(_3443);
    float _3511 = precise::max(_3509, 0.0);
    uint _3513 = uint(_3511);
    float _3515 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3487);
    float _3517 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3495);
    float _3519 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3399);
    float _3521 = _3373 ? _3507 : 0.0;
    int _3523 = _3493 * _3461;
    int _3525 = _3523 + _3189;
    int _3527 = ~_3183;
    int _3529 = _3527 + 1;
    float _3531 = trunc(_3467);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    float _3537 = _3503;
    float _3539 = _3347;
    if (_3481)
    {
        float _3541 = _3521 * _3489;
        _158 = _3541;
    }
    float _3543 = _158;
    int _3545 = _3499 * _3433;
    int _3547 = _3545 + _3177;
    int _3549 = int(_3345) + int(_3449);
    int _3551 = ~_3027;
    int _3553 = _3551 + 1;
    float _3555 = fma(_3333, _3543, _3483);
    bool _3557 = uint(_3547) >= uint(_2949);
    float _3559 = trunc(_3451);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    int _3565 = int(_3309) + int(_3513);
    int _3567 = _3553 * _3549;
    int _3569 = _3567 + _3243;
    bool _3571 = uint(_3525) >= uint(_2995);
    int _3573 = ~_3179;
    int _3575 = _3573 + 1;
    bool _3577 = uint(_3569) >= uint(_3027);
    int _3579 = ~_3127;
    int _3581 = _3579 + 1;
    int _3583 = int(_3407) + int(_3535);
    int _3585 = _3581 * _3565;
    int _3587 = _3585 + _3239;
    int _3589 = _3529 * _3583;
    int _3591 = _3589 + _3245;
    float _3593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3595 = int(_3393) + int(_3563);
    bool _3597 = uint(_3587) >= uint(_3127);
    bool _3599 = !_3557;
    int _3601 = _3599 ? 0 : (-1);
    int _3603 = _3575 * _3595;
    int _3605 = _3603 + _3273;
    bool _3607 = uint(_3591) >= uint(_3183);
    float _3609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3611 = !_3571;
    int _3613 = _3611 ? 0 : (-1);
    int _3615 = ~_3433;
    int _3617 = _3615 + _3601;
    int _3619 = _3617 + 1;
    int _3621 = ~_3461;
    int _3623 = _3621 + _3613;
    int _3625 = _3623 + 1;
    bool _3627 = !_3577;
    int _3629 = _3627 ? 0 : (-1);
    float _3631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3633 = _3177 ^ _2949;
    int _3635 = _2949 * _3619;
    int _3637 = _3635 + _3177;
    bool _3639 = _2949 == 0;
    int _3641 = _2995 * _3625;
    int _3643 = _3641 + _3189;
    int _3645 = ~_3549;
    int _3647 = _3645 + _3629;
    int _3649 = _3647 + 1;
    float _3651 = _3593 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3653 = !_3607;
    int _3655 = _3653 ? 0 : (-1);
    bool _3657 = !_3639;
    int _3659 = _3657 ? _3637 : (-1);
    int _3661 = _3027 * _3649;
    int _3663 = _3661 + _3243;
    bool _3665 = _2995 == 0;
    float _3667 = fma(_3651, _1837, -0.5);
    bool _3669 = uint(_3605) >= uint(_3179);
    int _3671 = _3189 ^ _2995;
    int _3673 = _3243 ^ _3027;
    float _3675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3677 = float(_3659);
    float _3679 = _3631 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3681 = !_3665;
    int _3683 = _3681 ? _3643 : (-1);
    bool _3685 = _3027 == 0;
    float _3687 = fma(_3651, _3677, _2363);
    bool _3689 = _3027 == 0;
    float _3691 = fma(_3679, _1951, -0.5);
    float _3693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3695 = float(_3683);
    float _3697 = fma(_3517, _3667, _3687);
    bool _3699 = !_3597;
    int _3701 = _3699 ? 0 : (-1);
    float _3703 = _3609 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3705 = !_3669;
    int _3707 = _3705 ? 0 : (-1);
    float _3709 = fma(_3679, _3695, _2871);
    uint _3711 = uint(int(uint(_3633) >> uint(31)));
    float _3713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _3715 = uint(int(uint(_3671) >> uint(31)));
    float _3717 = _3675 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    uint _3719 = uint(int(uint(_3673) >> uint(31)));
    float _3721 = fma(_2837, _3691, _3709);
    int _3723 = ~_3701;
    int _3725 = _3565 + _3723;
    int _3727 = _3725 + 1;
    float _3729 = fma(_3717, _1975, -0.5);
    int _3731 = ~_3655;
    int _3733 = _3583 + _3731;
    int _3735 = _3733 + 1;
    float _3737 = fma(_1991, _3703, -0.5);
    int _3739 = ~_3707;
    int _3741 = _3595 + _3739;
    int _3743 = _3741 + 1;
    int _3745 = ~int(_3711);
    int _3747 = _3745 + 1;
    int _3749 = ~int(_3715);
    int _3751 = _3749 + 1;
    int _3753 = ~int(_3719);
    int _3755 = _3753 + 1;
    float _3757 = _3713 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3759 = !_3685;
    int _3761 = _3759 ? _3663 : (-1);
    int _3763 = _3727 ^ _3747;
    float _3765 = fma(_3757, _2031, -0.5);
    int _3767 = _3735 ^ _3751;
    int _3769 = _3743 ^ _3755;
    float _3771 = float(_3761);
    bool _3773 = _2949 == 0;
    bool _3775 = _2995 == 0;
    float _3777 = fma(_3717, _3771, _2747);
    int _3779 = ~_3747;
    int _3781 = _3779 + _3763;
    int _3783 = _3781 + 1;
    float _3785 = _3693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3787 = ~_3751;
    int _3789 = _3787 + _3767;
    int _3791 = _3789 + 1;
    float _3793 = fma(_3469, _3729, _3777);
    int _3795 = ~_3755;
    int _3797 = _3795 + _3769;
    int _3799 = _3797 + 1;
    float _3801 = fma(_2019, _3785, -0.5);
    bool _3803 = !_3773;
    int _3805 = _3803 ? _3783 : (-1);
    float _3807 = _3793 + 0.5;
    bool _3809 = !_3775;
    int _3811 = _3809 ? _3791 : (-1);
    bool _3813 = !_3689;
    int _3815 = _3813 ? _3799 : (-1);
    float _3817 = float(_3805);
    float _3819 = float(_3811);
    float _3821 = float(_3815);
    float _3823 = -_3503;
    float _3825 = fma(_3703, _3817, _3823);
    float _3827 = -_2879;
    float _3829 = fma(_3785, _3819, _3827);
    float _3831 = _3721 + 0.5;
    float _3833 = -_3383;
    float _3835 = fma(_3757, _3821, _3833);
    float _3837 = fma(_3515, _3737, _3825);
    float _3839 = fma(_2533, _3801, _3829);
    float _3841 = _2687 * _3199;
    float _3843 = fma(_3519, _3765, _3835);
    float _3845 = _3697 + 0.5;
    float _3847 = _3837 + 0.5;
    float _3849 = _3839 + 0.5;
    float _3851 = _3843 + 0.5;
    float _3853 = -_3841;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2687);
    float _3857 = fma(_3003, _3225, _3225);
    bool _3859 = !_2575;
    int _3861 = _3859 ? 0 : 1;
    out.m_77.x = _3845;
    out.m_77.y = _3847;
    out.m_77.z = _3831;
    out.m_77.w = _3849;
    float _3863 = fma(_3855, _3855, _3385);
    out.m_79.x = _3807;
    out.m_79.y = _3851;
    float _3865 = as_type<float>(_3565);
    float _3867 = as_type<float>(_3595);
    if (_2757)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3869 = -_3347;
    float _3871 = fma(_3869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2421);
    float _3873 = -_3349;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2413);
    float _3877 = float(_2583);
    float _3879 = _1116 + _1130;
    float _3881 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3883 = _3871 + _3881;
    float _3885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3887 = _3875 + _3885;
    int _3889 = abs(_3861);
    float _3891 = -_3841;
    float _3893 = fma(_3891, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2377);
    float _3895 = _3883 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3897 = _3879 + (-1.0);
    float _3899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3901 = _3893 + _3899;
    float _3903 = fma(_3887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3895);
    float _3905 = float(_3889);
    float _3907 = fma(_3501, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3857);
    float _3909 = fma(_3897, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3911 = fma(_3901, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3903);
    float _3913 = _1130 + (-0.5);
    float _3915 = _3905 * _3877;
    float _3917 = fma(_3035, _3543, _3907);
    float _3919 = _3555 * 0.15915493667125701904296875;
    bool _3921 = _3911 >= 0.0;
    float _3923 = _3915 * (-2.0);
    float _3925 = _3917 * 0.15915493667125701904296875;
    float _3927 = _3919 * 6.283185482025146484375;
    float _3929 = sin(_3927);
    float _3931 = fma(_3923, _3227, _3227);
    float _3933 = fma(_3909, _3923, _3909);
    float _3935 = fma(_3913, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3931);
    float _3937 = _3925 * 6.283185482025146484375;
    float _3939 = sin(_3937);
    float _3941 = fma(_3933, _3543, _3935);
    float _3943 = _3911;
    int _3945 = as_type<int>(_3871);
    int _3947 = as_type<int>(_3901);
    if (_3921)
    {
        _3943 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3949 = _3943;
    int _3951 = as_type<int>(_3949);
    if (_3921)
    {
        out.m_61.x = 0.0;
    }
    float _3953 = _3941 * 0.15915493667125701904296875;
    float _3955 = sqrt(_3863);
    if (_3921)
    {
        float _3957 = _3949 * 5.0;
        _3951 = as_type<int>(_3957);
    }
    int _3959 = _3951;
    if (_3921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11676 = as_type<float>(_3959);
        out.gl_Position.z = _11676;
    }
    float _3961 = _3919 * 6.283185482025146484375;
    float _3963 = cos(_3961);
    float _3965 = _3929 * _3939;
    float _3967 = _3925 * 6.283185482025146484375;
    float _3969 = cos(_3967);
    float _3971 = _3953 * 6.283185482025146484375;
    float _3973 = sin(_3971);
    if (_3921)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3975 = -_2421;
    float _3977 = _3975 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3979 = in.m_81.x;
    float _3981 = in.m_81.y;
    float _3983 = in.m_81.z;
    float _3985 = _3199 * _3955;
    float _3987 = -_2413;
    float _3989 = _3987 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3991 = _3977 * _3977;
    float _3993 = -_2377;
    float _3995 = _3993 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3997 = _3953 * 6.283185482025146484375;
    float _3999 = cos(_3997);
    float _4001 = _3963 * _3969;
    float _4003 = fma(_3989, _3989, _3991);
    float _4005 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4007 = fma(_3973, _4001, _3965);
    float _4009 = fma(_3995, _3995, _4003);
    float _4011 = fma(_3973, _3965, _4001);
    float _4013 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4015 = _3963 * _3939;
    float _4017 = rsqrt(_4009);
    float _4019 = _802 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _4021 = _3929 * _3969;
    float _4023 = _3985 * _4013;
    float _4025 = _3985 * _4019;
    float _4027 = _3963 * _3999;
    float _4029 = _3969 * _3999;
    float _4031 = _3929 * _3999;
    float _4033 = _3939 * _3999;
    float _4035 = _3985 * _4005;
    float _4037 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3979);
    float _4039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3981);
    float _4041 = -_4015;
    float _4043 = fma(_3973, _4021, _4041);
    float _4045 = -_4021;
    float _4047 = fma(_3973, _4015, _4045);
    float _4049 = _4037 * _4023;
    float _4051 = _4039 * _4035;
    float _4053 = _3989 * _4017;
    float _4055 = in.m_83.x;
    float _4057 = in.m_83.y;
    float _4059 = in.m_83.z;
    bool _4061 = _3981 != 0.0;
    bool _4063 = isnan(_3981);
    bool _4065 = _4061 || _4063;
    bool _4067 = isnan(0.0);
    bool _4069 = _4065 || _4067;
    float _4071 = _3995 * _4017;
    float _4073 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4075 = _4053 * _4073;
    float _4077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3983);
    float _4079 = _3977 * _4017;
    bool _4081 = _3979 == 0.0;
    bool _4083 = !_4069;
    bool _4085 = _4081 && _4083;
    float _4087 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4089 = _4071 * _4087;
    float _4091 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4093 = -_4075;
    float _4095 = fma(_4071, _4091, _4093);
    float _4097 = _4077 * _4025;
    float _4099 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4101 = _4079 * _4099;
    bool _4103 = _3983 == 0.0;
    bool _4105 = _4103 && _4085;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4109 = -_4089;
    float _4111 = fma(_4079, _4107, _4109);
    float _4113 = _4095 * _4095;
    float _4115 = in.m_85.x;
    float _4117 = in.m_85.y;
    float _4119 = in.m_85.z;
    float _4121 = in.m_85.w;
    float _4123 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4125 = -_4101;
    float _4127 = fma(_4053, _4123, _4125);
    float _4129 = -_4051;
    float _4131 = _3973 * _4129;
    float _4133 = fma(_4111, _4111, _4113);
    float _4135 = _4027 * _4051;
    float _4137 = _4031 * _4051;
    float _4139 = fma(_4029, _4049, _4131);
    float _4141 = fma(_4127, _4127, _4133);
    float _4143 = fma(_4007, _4049, _4135);
    float _4145 = fma(_4043, _4049, _4137);
    float _4147 = _4133;
    float _4149 = _4055;
    float _4151 = _4049;
    float _4153 = _4011;
    if (_4105)
    {
        _3865 = _4055;
    }
    float _4155 = _3865;
    float _4157 = rsqrt(_4141);
    float _4159 = _4155;
    if (_4105)
    {
        _3537 = _4057;
    }
    float _4161 = _3537;
    float _4163 = fma(_4033, _4097, _4139);
    float _4165 = _4161;
    if (_4105)
    {
        _4147 = _4155;
    }
    float _4167 = _4147;
    float _4169 = fma(_4047, _4097, _4143);
    float _4171 = _4167;
    if (!_4105)
    {
        _4159 = _4055;
    }
    float _4173 = _4159;
    if (_4105)
    {
        _4149 = _4161;
    }
    float _4175 = _4149;
    float _4177 = _4175;
    if (_4105)
    {
        _3867 = _4059;
    }
    float _4179 = _3867;
    float _4181 = _4179;
    if (!_4105)
    {
        float _4183 = fma(_3979, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4173);
        _4171 = _4183;
    }
    float _4185 = _4171;
    if (!_4105)
    {
        _4165 = _4057;
    }
    float _4187 = _4165;
    float _4189 = fma(_4011, _4097, _4145);
    if (_4105)
    {
        _4151 = _4179;
    }
    float _4191 = _4151;
    float _4193 = _4191;
    if (!_4105)
    {
        _4181 = _4059;
    }
    float _4195 = _4181;
    if (!_4105)
    {
        float _4197 = fma(_3981, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4187);
        _4177 = _4197;
    }
    float _4199 = _4177;
    float _4201 = _4119 * _4173;
    float _4203 = _4095 * _4157;
    float _4205 = _4111 * _4157;
    float _4207 = _4127 * _4157;
    float _4209 = -_4201;
    float _4211 = fma(_4115, _4195, _4209);
    float _4213 = _4117 * _4195;
    float _4215 = _4071 * _4203;
    float _4217 = _4079 * _4205;
    if (!_4105)
    {
        float _4219 = fma(_3983, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4195);
        _4193 = _4219;
    }
    float _4221 = _4193;
    float _4223 = _4115 * _4187;
    float _4225 = -_4213;
    float _4227 = fma(_4119, _4187, _4225);
    float _4229 = -_4215;
    float _4231 = fma(_4079, _4207, _4229);
    float _4233 = -_4217;
    float _4235 = fma(_4053, _4203, _4233);
    float _4237 = -_4223;
    float _4239 = fma(_4117, _4173, _4237);
    float _4241 = _4227 * _4121;
    float _4243 = _4231 * _4169;
    float _4245 = _4235 * _4169;
    float _4247 = _4211 * _4121;
    float _4249 = _4239 * _4121;
    float _4251 = _4053 * _4207;
    float _4253 = fma(_4205, _4163, _4243);
    float _4255 = fma(_4207, _4163, _4245);
    float _4257 = _4007 * _4231;
    float _4259 = -_4251;
    float _4261 = fma(_4071, _4205, _4259);
    float _4263 = fma(_4053, _4189, _4253);
    float _4265 = fma(_4071, _4189, _4255);
    float _4267 = _4007 * _4235;
    float _4269 = _4007 * _4261;
    float _4271 = _2413 + _4263;
    float _4273 = _2377 + _4265;
    float _4275 = _4027 * _4231;
    float _4277 = _4027 * _4261;
    float _4279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4281 = _4271 + _4279;
    float _4283 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4285 = _4273 + _4283;
    float _4287 = _4027 * _4235;
    float _4289 = _4047 * _4231;
    float _4291 = _4281 * _4281;
    float _4293 = _4285 * _4285;
    float _4295 = fma(_4029, _4205, _4257);
    float _4297 = fma(_4029, _4203, _4269);
    float _4299 = fma(_4029, _4207, _4267);
    float _4301 = _4291 + _4293;
    float _4303 = _4261 * _4169;
    float _4305 = _4047 * _4235;
    float _4307 = _4047 * _4261;
    float _4309 = sqrt(_4301);
    float _4311 = fma(_4203, _4163, _4303);
    float _4313 = -_3973;
    float _4315 = fma(_4313, _4205, _4275);
    float _4317 = -_3973;
    float _4319 = fma(_4317, _4203, _4277);
    float _4321 = -_3973;
    float _4323 = fma(_4321, _4207, _4287);
    float _4325 = fma(_4079, _4189, _4311);
    float _4327 = fma(_4033, _4207, _4305);
    float _4329 = fma(_4033, _4205, _4289);
    float _4331 = fma(_4033, _4203, _4307);
    float _4333 = fma(_4031, _4053, _4315);
    float _4335 = fma(_4031, _4079, _4319);
    float _4337 = fma(_4031, _4071, _4323);
    float _4339 = _2421 + _4325;
    float _4341 = fma(_4043, _4053, _4295);
    float _4343 = fma(_4043, _4079, _4297);
    float _4345 = fma(_4011, _4053, _4329);
    bool _4347 = _4309 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4349 = fma(_4043, _4071, _4299);
    float _4351 = fma(_4011, _4071, _4327);
    float _4353 = fma(_4011, _4079, _4331);
    float _4355 = _4333 * _4199;
    float _4357 = _4335 * _4199;
    float _4359 = _4333 * _4117;
    float _4361 = _4335 * _4117;
    float _4363 = _4337 * _4117;
    float _4365 = _4337 * _4199;
    float _4367 = _4247 * _4333;
    float _4369 = _4247 * _4335;
    float _4371 = _4247 * _4337;
    float _4373 = _4291;
    float _4375 = _4293;
    float _4377 = _4273;
    float _4379 = _4271;
    if (!_4347)
    {
        _4153 = _4339;
    }
    float _4381 = _4153;
    bool _4383 = !_4347;
    float _4385 = _4381;
    if (!_4383)
    {
        float _4387 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4389 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4391 = _4309 + _4389;
        float _4393 = _4339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4395 = rsqrt(_4301);
        float _4397 = _4391 * _4387;
        float _4399 = _4397 * 0.15915493667125701904296875;
        float _4401 = _4399 * 6.283185482025146484375;
        float _4403 = sin(_4401);
        float _4405 = _4399 * 6.283185482025146484375;
        float _4407 = cos(_4405);
        float _4409 = fma(_4403, _4393, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4411 = _4395 * _4409;
        float _4413 = _4407 + (-1.0);
        float _4415 = fma(_4281, _4411, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4417 = fma(_4285, _4411, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4419 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4421 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4423 = _4415 + _4421;
        float _4425 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4427 = _4417 + _4425;
        float _4429 = fma(_4339, _4407, _4419);
        float _4431 = _4423 * _4423;
        float _4433 = _4427 * _4427;
        _4385 = _4429;
        _4373 = _4431;
        _4375 = _4433;
        _4377 = _4417;
        _4379 = _4415;
    }
    float _4435 = _4385;
    float _4437 = _4373;
    float _4439 = _4375;
    float _4441 = _4377;
    float _4443 = _4379;
    float _4445 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4447 = _4435 + _4445;
    float _4449 = fma(_4241, _4341, _4367);
    float _4451 = fma(_4341, _4115, _4359);
    float _4453 = fma(_4343, _4115, _4361);
    float _4455 = fma(_4447, _4447, _4437);
    float _4457 = fma(_4241, _4343, _4369);
    float _4459 = fma(_4349, _4115, _4363);
    float _4461 = fma(_4341, _4185, _4355);
    float _4463 = _4455 + _4439;
    float _4465 = fma(_4343, _4185, _4357);
    float _4467 = fma(_4349, _4185, _4365);
    float _4469 = fma(_4241, _4349, _4371);
    float _4471 = fma(_4249, _4345, _4449);
    float _4473 = fma(_4345, _4119, _4451);
    float _4475 = sqrt(_4463);
    float _4477 = fma(_4353, _4119, _4453);
    float _4479 = fma(_4249, _4353, _4457);
    float _4481 = fma(_4351, _4119, _4459);
    float _4483 = fma(_4345, _4221, _4461);
    float _4485 = fma(_4353, _4221, _4465);
    float _4487 = fma(_4249, _4351, _4469);
    float _4489 = fma(_4351, _4221, _4467);
    out.m_87.x = _4473;
    out.m_87.y = _4477;
    out.m_87.z = _4481;
    out.m_89.x = _4471;
    out.m_89.y = _4479;
    out.m_89.z = _4487;
    out.m_91.x = _4483;
    out.m_91.y = _4485;
    out.m_91.z = _4489;
    bool _4491 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4493 = isnan(_4475);
    bool _4495 = _4491 || _4493;
    bool _4497 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4499 = _4495 || _4497;
    float _4501 = _4453;
    if (!_4499)
    {
        _4501 = 1.0;
    }
    float _4503 = _4501;
    bool _4505 = !_4499;
    float _4507 = _4503;
    if (!_4505)
    {
        bool _4509 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4511 = isnan(_4475);
        bool _4513 = _4509 || _4511;
        bool _4515 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4517 = _4513 || _4515;
        if (!_4517)
        {
            float _4519 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4521 = _4475 + _4519;
            float _4523 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4525 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4523;
            float _4527 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4529 = _4527 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4531 = 1.0 / _4525;
            float _4533 = _4521 * _4531;
            float _4535 = fma(_4533, _4529, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4507 = _4535;
            _4537 = true;
        }
        else
        {
            bool _4539 = _4475 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4541 = isnan(_4475);
            bool _4543 = _4539 || _4541;
            bool _4545 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4547 = _4543 || _4545;
            if (!_4547)
            {
                float _4549 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4551 = _4475 + _4549;
                float _4553 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4555 = _4553 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4557 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4559 = _4557 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4561 = 1.0 / _4555;
                float _4563 = _4551 * _4561;
                float _4565 = fma(_4563, _4559, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4507 = _4565;
                _4537 = true;
            }
            else
            {
                _4507 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4537 = false;
    float _4567 = _4507;
    float _4569 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4571 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4573 = floor(_4569);
    float _4575 = floor(_4571);
    float _4577 = -_4573;
    float _4579 = _4569 + _4577;
    float _4581 = -_4575;
    float _4583 = _4571 + _4581;
    float2 _12696 = float2(_4579, _4583);
    float _4585 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12696, float2(0.0), isnan(_12696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12696, float2(0.0), isnan(_12696)), level(0.0)).x;
    float _4587 = _3871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4589 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4591 = _4441 + _4589;
    float _4593 = fma(_3875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4587);
    bool _4595 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4597 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4599 = _4595 || _4597;
    bool _4601 = isnan(0.5);
    bool _4603 = _4599 || _4601;
    float _4605 = fma(_3893, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4593);
    float _4607 = _3871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4609 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4611 = _4435 + _4609;
    float _4613 = _4605 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4615 = fma(_3875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4607);
    float _4617 = 1.0 / _4613;
    float _4619 = fma(_3893, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4615);
    float _4621 = _4619 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4623 = _4621 + _4613;
    float _4625 = _4623 * _4617;
    float _4627 = _4625 * 0.5;
    float _4629 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4631 = fma(_4627, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4629);
    float _4633 = 1.0 / _4631;
    float _4635 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _4637 = _3871 + _4635;
    float _4639 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4641 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4639);
    float _4643 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4645 = _4633 * _4643;
    float _4647 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4649 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4641);
    bool _4651 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4653 = fma(_3875, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4647);
    bool _4655 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4657 = _4649 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4659 = !_4651;
    int _4661 = _4659 ? 0 : 1;
    float _4663 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4653);
    float _4665 = trunc(_4657);
    int _4667 = int(_4665);
    float _4669 = _4663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4671 = 2;
    if (!_4651)
    {
        _4671 = 1;
    }
    int _4673 = _4671;
    int _4675 = _4673;
    if (!_4655)
    {
        _4675 = _4661;
    }
    int _4677 = _4675;
    float _4679 = trunc(_4669);
    int _4681 = int(_4679);
    int _4683 = _4677 << 6;
    int _4685 = _4683 + 48;
    uint _4687 = uint(int(uint(_4685) >> uint(2)));
    uint _4689 = uint(int(uint(int(_4687)) >> uint(2)));
    int _4691 = int(_4687) & 3;
    float _4693 = (*spvDescriptorSet0.vp_c15)._m0[int(_4689)][_4691];
    int _4695 = int(_4687) + 1;
    uint _4697 = uint(int(uint(_4695) >> uint(2)));
    int _4699 = _4695 & 3;
    float _4701 = (*spvDescriptorSet0.vp_c15)._m0[int(_4697)][_4699];
    int _4703 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4705 = _4667 + _4703;
    int _4707 = _4705 + 1;
    float _4709 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4711 = _4443 + _4709;
    bool _4713 = _4707 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _4715 = fma(_4711, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _4717 = _4683 + 56;
    uint _4719 = uint(int(uint(_4717) >> uint(2)));
    uint _4721 = uint(int(uint(int(_4719)) >> uint(2)));
    int _4723 = int(_4719) & 3;
    float _4725 = (*spvDescriptorSet0.vp_c15)._m0[int(_4721)][_4723];
    int _4727 = int(_4719) + 1;
    uint _4729 = uint(int(uint(_4727) >> uint(2)));
    int _4731 = _4727 & 3;
    float _4733 = (*spvDescriptorSet0.vp_c15)._m0[int(_4729)][_4731];
    int _4735 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4737 = _4681 + _4735;
    int _4739 = _4737 + 1;
    float _4741 = -_3349;
    float _4743 = fma(_4741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4715);
    int _4745 = _4707 | _4739;
    int _4747 = _4683 + 64;
    uint _4749 = uint(int(uint(_4747) >> uint(2)));
    uint _4751 = uint(int(uint(int(_4749)) >> uint(2)));
    int _4753 = int(_4749) & 3;
    float _4755 = (*spvDescriptorSet0.vp_c15)._m0[int(_4751)][_4753];
    int _4757 = int(_4749) + 1;
    uint _4759 = uint(int(uint(_4757) >> uint(2)));
    int _4761 = _4757 & 3;
    float _4763 = (*spvDescriptorSet0.vp_c15)._m0[int(_4759)][_4761];
    bool _4765 = _4745 < 0;
    bool _4767 = _4765 || _4713;
    float _4769 = fma(_4611, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4771 = fma(_4591, _4567, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4773 = _4739 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4775 = _4773 || _4767;
    float _4777 = -_3347;
    float _4779 = fma(_4777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4769);
    float _4781 = -_3841;
    float _4783 = fma(_4781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4771);
    int _4785 = _4683 + 72;
    uint _4787 = uint(int(uint(_4785) >> uint(2)));
    uint _4789 = uint(int(uint(int(_4787)) >> uint(2)));
    int _4791 = int(_4787) & 3;
    float _4793 = (*spvDescriptorSet0.vp_c15)._m0[int(_4789)][_4791];
    int _4795 = int(_4787) + 1;
    uint _4797 = uint(int(uint(_4795) >> uint(2)));
    int _4799 = _4795 & 3;
    float _4801 = (*spvDescriptorSet0.vp_c15)._m0[int(_4797)][_4799];
    float _4803 = _4743;
    float _4805 = _4779;
    float _4807 = as_type<float>(_4677);
    if (_4603)
    {
        _3539 = _4743;
    }
    float _4809 = _3539;
    float _4811 = _4809;
    if (_4603)
    {
        _4803 = _4779;
    }
    float _4813 = _4803;
    float _4815 = _4813;
    if (_4603)
    {
        _4805 = _4783;
    }
    float _4817 = _4805;
    int _4819 = _4683 + 96;
    uint _4821 = uint(int(uint(_4819) >> uint(2)));
    uint _4823 = uint(int(uint(int(_4821)) >> uint(2)));
    int _4825 = int(_4821) & 3;
    float _4827 = (*spvDescriptorSet0.vp_c15)._m0[int(_4823)][_4825];
    int _4829 = int(_4821) + 1;
    uint _4831 = uint(int(uint(_4829) >> uint(2)));
    int _4833 = _4829 & 3;
    float _4835 = (*spvDescriptorSet0.vp_c15)._m0[int(_4831)][_4833];
    int _4837 = _4683 + 104;
    uint _4839 = uint(int(uint(_4837) >> uint(2)));
    uint _4841 = uint(int(uint(int(_4839)) >> uint(2)));
    int _4843 = int(_4839) & 3;
    float _4845 = (*spvDescriptorSet0.vp_c15)._m0[int(_4841)][_4843];
    int _4847 = int(_4839) + 1;
    uint _4849 = uint(int(uint(_4847) >> uint(2)));
    int _4851 = _4847 & 3;
    float _4853 = (*spvDescriptorSet0.vp_c15)._m0[int(_4849)][_4851];
    float _4855 = _4817;
    float _4857 = _4835;
    if (!_4603)
    {
        float _4859 = _3883 * _3883;
        float _4861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4863 = fma(_3887, _3887, _4859);
        float _4865 = fma(_3901, _3901, _4863);
        float _4867 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4869 = sqrt(_4865);
        float _4871 = 1.0 / _3985;
        float _4873 = _4867 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4875 = precise::min(_4869, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4877 = _4875 * _4861;
        float _4879 = _4877 * _4871;
        float _4881 = -_2377;
        float _4883 = _4881 + _4771;
        float _4885 = -_2421;
        float _4887 = _4885 + _4769;
        float _4889 = -_2413;
        float _4891 = _4889 + _4715;
        float _4893 = _4873 * _4879;
        float _4895 = _4883 * _4879;
        float _4897 = fma(_4887, _4893, _3871);
        float _4899 = fma(_4891, _4893, _3875);
        float _4901 = fma(_4873, _4895, _3893);
        _4815 = _4897;
        _4811 = _4899;
        _4855 = _4901;
    }
    float _4903 = _4815;
    float _4905 = _4811;
    float _4907 = _4855;
    float _4909 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4911 = _4637 * _4835;
    if (!_4775)
    {
        int _4913 = _4739 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4915 = _4913 + _4707;
        _3945 = _4915;
    }
    int _4917 = _3945;
    int _4919 = _4683 + 80;
    uint _4921 = uint(int(uint(_4919) >> uint(2)));
    uint _4923 = uint(int(uint(int(_4921)) >> uint(2)));
    int _4925 = int(_4921) & 3;
    float _4927 = (*spvDescriptorSet0.vp_c15)._m0[int(_4923)][_4925];
    int _4929 = int(_4921) + 1;
    uint _4931 = uint(int(uint(_4929) >> uint(2)));
    int _4933 = _4929 & 3;
    float _4935 = (*spvDescriptorSet0.vp_c15)._m0[int(_4931)][_4933];
    float _4937 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4909);
    float _4939 = fma(_3875, _4827, _4911);
    float _4941 = _4637 * _4701;
    float _4943 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4945 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4937);
    float _4947 = fma(_3893, _4845, _4939);
    float _4949 = fma(_3875, _4693, _4941);
    int _4951 = as_type<int>(_4945);
    int _4953 = as_type<int>(_4943);
    if (!_4775)
    {
        int _4955 = _4917 << 2;
        _3947 = _4955;
    }
    int _4957 = _3947;
    float _4959 = _4945 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4961 = _4947 + _4853;
    float _4963 = fma(_3893, _4725, _4949);
    int _4965 = _4957;
    if (!_4775)
    {
        uint _4967 = uint(int(uint(_4917) >> uint(2)));
        _4951 = int(_4967);
    }
    int _4969 = _4951;
    float _4971 = _4959 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    if (!_4775)
    {
        int _4973 = 12 & _4957;
        _4965 = _4973;
    }
    int _4975 = _4965;
    int _4977 = _4683 + 88;
    uint _4979 = uint(int(uint(_4977) >> uint(2)));
    uint _4981 = uint(int(uint(int(_4979)) >> uint(2)));
    int _4983 = int(_4979) & 3;
    float _4985 = (*spvDescriptorSet0.vp_c15)._m0[int(_4981)][_4983];
    int _4987 = int(_4979) + 1;
    uint _4989 = uint(int(uint(_4987) >> uint(2)));
    int _4991 = _4987 & 3;
    float _4993 = (*spvDescriptorSet0.vp_c15)._m0[int(_4989)][_4991];
    float _4995 = 1.0 / _4961;
    float _4997 = -_4971;
    float _4999 = fma(_4997, _4943, 1.0);
    float _5001 = _4963 + _4733;
    float _5003 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5005 = _4637 * _4763;
    if (!_4775)
    {
        int _5007 = _4969 << 4;
        int _5009 = _5007 + _4975;
        _4953 = _5009;
    }
    int _5011 = _4953;
    float _5013 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5015 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5003);
    float _5017 = fma(_3875, _4755, _5005);
    float _5019 = _4845;
    if (!_4775)
    {
        int _5021 = _5011 + 400;
        uint _5023 = uint(int(uint(_5021) >> uint(2)));
        uint _5025 = uint(int(uint(int(_5023)) >> uint(2)));
        int _5027 = int(_5023) & 3;
        float _5029 = (*spvDescriptorSet0.vp_c15)._m0[int(_5025)][_5027];
        _5019 = _5029;
    }
    float _5031 = _5019;
    float _5033 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5013);
    float _5035 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5015);
    float _5037 = fma(_3893, _4793, _5017);
    float _5039 = _4903 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5041 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5033);
    float _5043 = _5035 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5045 = _5037 + _4801;
    float _5047 = _5001 * _4995;
    float _5049 = fma(_4905, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5039);
    float _5051 = _5041 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5053 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5055 = log2(_4999);
    float _5057 = fma(_4907, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5049);
    bool _5059 = _5047 >= 0.0;
    float _5061 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5053);
    float _5063 = _5045 * _4995;
    float _5065 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _5067 = _5047 <= 1.0;
    bool _5069 = _5067 && _5059;
    float _5071 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5061);
    float _5073 = _5045;
    if (!_4775)
    {
        float _5075 = floor(_4657);
        _5073 = _5075;
    }
    float _5077 = _5073;
    float _5079 = _5057 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _5081 = _5063 >= 0.0;
    bool _5083 = _5081 && _5069;
    float _5085 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5065);
    float _5087 = _4637 * _4935;
    float _5089 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5071);
    float _5091 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _5093 = _5063 <= 1.0;
    bool _5095 = _5093 && _5083;
    float _5097 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5085);
    float _5099 = 1.0 / _5089;
    float _5101 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5091);
    float _5103 = fma(_3875, _4927, _5087);
    float _5105 = _5055 * 0.693147182464599609375;
    float _5107 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5101);
    float _5109 = _5105 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5111 = _4769;
    if (!_4775)
    {
        float _5113 = floor(_4669);
        _5111 = _5113;
    }
    float _5115 = _5111;
    float _5117 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5107);
    float _5119 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5097);
    float _5121 = fma(_3893, _4985, _5103);
    float _5123 = _5119;
    if (_5095)
    {
        float _5125 = float(_4677);
        _4807 = _5125;
    }
    float _5127 = _4807;
    float _5129 = _5077;
    if (!_4775)
    {
        float _5131 = -_5077;
        float _5133 = _4657 + _5131;
        _4857 = _5133;
    }
    float _5135 = _4857;
    float _5137 = _5121 + _4993;
    float _5139 = _5117 * _5099;
    float _5141 = _5119 * _5099;
    float _5143 = _5087;
    if (_5095)
    {
        float _5145 = rint(_5127);
        float _5147 = precise::max(_5145, 0.0);
        uint _5149 = uint(_5147);
        uint _5151 = clamp(_5149, 0u, 65535u);
        _5143 = as_type<float>(_5151);
    }
    float _5153 = _5143;
    float _5155 = _5137 * _4995;
    float _5157 = fma(_5141, -0.5, 0.5);
    float _5159 = _5115;
    float _5161 = _5155;
    if (!_4775)
    {
        float _5163 = -_5115;
        float _5165 = _4669 + _5163;
        _5159 = _5165;
    }
    float _5167 = _5159;
    float _5169 = _5141;
    float _5171 = _5167;
    if (!_4775)
    {
        float _5173 = rint(_5031);
        float _5175 = precise::max(_5173, 0.0);
        uint _5177 = uint(_5175);
        uint _5179 = clamp(_5177, 0u, 65535u);
        _5169 = as_type<float>(_5179);
    }
    float _5181 = _5169;
    float _5183 = fma(_5139, 0.5, 0.5);
    float _5185 = _5063;
    float _5187 = _5153;
    if (_5095)
    {
        float3 _13723 = float3(_5047, _5063, float(as_type<int>(_5153)));
        float3 _13727 = select(_13723, float3(0.0), isnan(_13723));
        float _5189 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _13727.xy, uint(rint(_13727.z)), _5155, level(0.0));
        _5185 = _5189;
    }
    float _5191 = _5185;
    float3 _13737 = float3(_5183, _5157, _5109);
    float _5193 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_13737, float3(0.0), isnan(_13737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_13737, float3(0.0), isnan(_13737)), level(0.0)).x;
    float3 _13746 = float3(_5183, _5157, _5109);
    float4 _5196 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_13746, float3(0.0), isnan(_13746)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_13746, float3(0.0), isnan(_13746)), level(0.0)).xyzw;
    float _5198 = _5196.x;
    float _5200 = _5196.y;
    float _5202 = _5196.z;
    float _5204 = _5196.w;
    float _5206 = _5135;
    if (!_4775)
    {
        float3 _13769 = float3(_5135, _5167, float(as_type<int>(_5181)));
        float3 _13771 = select(_13769, float3(0.0), isnan(_13769));
        float _5208 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _13771.xy, uint(rint(_13771.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _13771.xy, uint(rint(_13771.z)), level(0.0)).x;
        _5206 = _5208;
    }
    float _5210 = _5206;
    if (_4775)
    {
        _5129 = 1.0;
    }
    float _5212 = _5129;
    float _5214 = _5212;
    if (!_4775)
    {
        int _5216 = _4917 << 4;
        int _5218 = _5216 + 2048;
        uint _5220 = uint(int(uint(_5218) >> uint(2)));
        uint _5222 = uint(int(uint(int(_5220)) >> uint(2)));
        int _5224 = int(_5220) & 3;
        float _5226 = (*spvDescriptorSet0.vp_c15)._m0[int(_5222)][_5224];
        int _5228 = int(_5220) + 1;
        uint _5230 = uint(int(uint(_5228) >> uint(2)));
        int _5232 = _5228 & 3;
        float _5234 = (*spvDescriptorSet0.vp_c15)._m0[int(_5230)][_5232];
        int _5236 = _5218 + 8;
        uint _5238 = uint(int(uint(_5236) >> uint(2)));
        uint _5240 = uint(int(uint(int(_5238)) >> uint(2)));
        int _5242 = int(_5238) & 3;
        float _5244 = (*spvDescriptorSet0.vp_c15)._m0[int(_5240)][_5242];
        int _5246 = int(_5238) + 1;
        uint _5248 = uint(int(uint(_5246) >> uint(2)));
        int _5250 = _5246 & 3;
        float _5252 = (*spvDescriptorSet0.vp_c15)._m0[int(_5248)][_5250];
        float _5254 = _4637 * _5234;
        float _5256 = fma(_3875, _5226, _5254);
        float _5258 = fma(_3893, _5244, _5256);
        float _5260 = _5258 + _5252;
        float _5262 = precise::clamp(_5260, 0.0, 1.0);
        float _5264 = -_5262;
        float _5266 = _5264 + _5210;
        float _5268 = fma(_5266, 500.0, 1.5);
        float _5270 = exp2(_5268);
        float _5272 = 0.0 + _5270;
        float _5274 = precise::clamp(_5272, 0.0, 1.0);
        _5187 = _5226;
        _5214 = _5274;
    }
    float _5276 = _5187;
    float _5278 = _5214;
    float _5280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5282 = _4903 + _5280;
    float _5284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5286 = _4905 + _5284;
    float _5288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5290 = _4907 + _5288;
    float _5292 = _5282 * _5282;
    float _5294 = fma(_5286, _5286, _5292);
    float _5296 = fma(_5290, _5290, _5294);
    float _5298 = rsqrt(_5296);
    float _5300 = _5298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5302 = _5286 * _5300;
    float _5304 = _5290 * _5300;
    float _5306 = _5302 * _5302;
    float _5308 = _5304 * _5304;
    float _5310 = _5306 + _5308;
    float _5312 = sqrt(_5310);
    bool _5314 = _5312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5316 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5318 = _5312 + _5316;
    float _5320 = _5290;
    float _5322 = _5294;
    float _5324 = _5318;
    float _5326 = _5282;
    float _5328 = _5300;
    if (_5314)
    {
        float _5330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5320 = _5330;
    }
    float _5332 = _5320;
    if (_5314)
    {
        float _5334 = rsqrt(_5310);
        _5322 = _5334;
    }
    float _5336 = _5322;
    float _5338 = _5336;
    if (_5314)
    {
        float _5340 = _5318 * _5332;
        _5324 = _5340;
    }
    float _5342 = _5324;
    if (_5314)
    {
        float _5344 = _5342 * 0.15915493667125701904296875;
        _5171 = _5344;
    }
    float _5346 = _5171;
    float _5348 = _5298;
    if (_5314)
    {
        float _5350 = _5346 * 6.283185482025146484375;
        float _5352 = sin(_5350);
        _5348 = _5352;
    }
    float _5354 = _5348;
    float _5356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5358 = precise::max(0.0, _5356);
    float _5360 = _5276;
    float _5362 = _5356;
    if (_5314)
    {
        float _5364 = _5346 * 6.283185482025146484375;
        float _5366 = cos(_5364);
        _5360 = _5366;
    }
    float _5368 = _5360;
    float _5370 = -_5300;
    float _5372 = -_5358;
    float _5374 = fma(_5282, _5370, _5372);
    float _5376 = _5374;
    if (!_5314)
    {
        _5326 = _5304;
    }
    float _5378 = _5326;
    float _5380 = _5378;
    if (_5314)
    {
        float _5382 = _5374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5362 = _5382;
    }
    float _5384 = _5362;
    float _5386 = _5354;
    float _5388 = _5384;
    if (_5314)
    {
        float _5390 = fma(_5354, _5384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5386 = _5390;
    }
    float _5392 = _5386;
    float _5394 = _5392;
    float _5396 = _5368;
    if (_5314)
    {
        float _5398 = _5368 + (-1.0);
        _5388 = _5398;
    }
    float _5400 = _5388;
    float _5402 = _5400;
    if (_5314)
    {
        float _5404 = _5336 * _5392;
        _5328 = _5404;
    }
    float _5406 = _5328;
    if (!_5314)
    {
        _5394 = _5302;
    }
    float _5408 = _5394;
    float _5410 = _5408;
    if (_5314)
    {
        float _5412 = _5400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5402 = _5412;
    }
    float _5414 = _5402;
    if (_5314)
    {
        float _5416 = _5302 * _5406;
        _5410 = _5416;
    }
    float _5418 = _5410;
    if (!_5314)
    {
        _5338 = _5306;
    }
    float _5420 = _5338;
    float _5422 = _5420;
    if (_5314)
    {
        float _5424 = _5304 * _5406;
        _5380 = _5424;
    }
    float _5426 = _5380;
    if (_5314)
    {
        float _5428 = fma(_5374, _5368, _5414);
        _5376 = _5428;
    }
    float _5430 = _5376;
    if (_5314)
    {
        float _5432 = _5418 * _5418;
        _5422 = _5432;
    }
    float _5434 = _5422;
    if (!_5314)
    {
        _5396 = _5308;
    }
    float _5436 = _5396;
    float _5438 = sqrt(_5296);
    float _5440 = _5436;
    if (_5314)
    {
        float _5442 = _5426 * _5426;
        _5440 = _5442;
    }
    float _5444 = _5440;
    float _5446 = fma(_5430, _5430, _5434);
    float _5448 = _5446 + _5444;
    float _5450 = rsqrt(_5448);
    float _5452 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5454 = fma(_5438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5452);
    float _5456 = precise::clamp(_5454, 0.0, 1.0);
    float _5458 = -_5456;
    float _5460 = _5458 + 1.0;
    float _5462 = _5450 * _5418;
    float _5464 = abs(_5460);
    float _5466 = log2(_5464);
    float _5468 = _5450 * _5430;
    float _5470 = _5450 * _5426;
    float _5472 = _5462 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5474 = -_5472;
    float _5476 = fma(_5468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5474);
    float _5478 = -_5470;
    float _5480 = fma(_5478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5476);
    float _5482 = fma(_5480, -0.5, 0.5);
    float _5484 = _5466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5486 = fma(_5480, 0.5, 0.5);
    float _5488 = _5468 + 1.0;
    float _5490 = sqrt(_5482);
    float _5492 = fma(_5486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5494 = fma(_5486, _5492, -0.212114393711090087890625);
    float _5496 = exp2(_5484);
    float _5498 = fma(_5486, _5494, 1.570728778839111328125);
    float _5500 = _5490 * 0.636619746685028076171875;
    float _5502 = -_5498;
    float _5504 = fma(_5500, _5502, 1.0);
    float _5506 = -_5468;
    float _5508 = fma(_5496, _5488, _5506);
    float _5510 = fma(_5508, 0.5, 0.5);
    float2 _14238 = float2(_5504, _5510);
    float3 _5514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_14238, float2(0.0), isnan(_14238)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_14238, float2(0.0), isnan(_14238)), level(0.0)).xyz;
    float _5516 = _5514.x;
    float _5518 = _5514.y;
    float _5520 = _5514.z;
    float _5522 = abs(_4645);
    float _5524 = log2(_5522);
    float _5526 = _5466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5528 = -_4585;
    float _5530 = _5528 + 1.0;
    float _5532 = exp2(_5526);
    float _5534 = _5524 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5536 = _5043 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5538 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5536);
    float _5540 = exp2(_5534);
    float _5542 = -_5532;
    float _5544 = _5542 + 1.0;
    float _5546 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5538);
    float _5548 = _5544 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5550 = fma(_5540, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5552 = precise::clamp(_5550, 0.0, 1.0);
    float _5554 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5546);
    bool _5556 = _4645 <= 8000.0;
    bool _5558 = isnan(_4645);
    bool _5560 = _5556 || _5558;
    bool _5562 = isnan(8000.0);
    bool _5564 = _5560 || _5562;
    float _5566 = float(_5564);
    float _5568 = fma(_5552, -2.0, 3.0);
    float _5570 = _5552 * _5552;
    float _5572 = _5570 * _5568;
    float _5574 = -_5572;
    float _5576 = _5574 + 1.0;
    float _5578 = fma(_5576, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5572);
    float _5580 = _5554 + _5089;
    float _5582 = _5566 * _5578;
    float _5584 = _5580 * 0.5;
    float _5586 = _5580;
    float _5588 = _5117;
    if (!_5095)
    {
        _5586 = 1.0;
    }
    float _5590 = _5586;
    out.gl_Position.x = _5117;
    out.gl_Position.y = _5119;
    out.gl_Position.z = _5554;
    out.gl_Position.w = _5089;
    float _5592 = _5582 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5594 = _5590;
    if (_5095)
    {
        bool _5596 = _5191 >= _5155;
        bool _5598 = isnan(_5191);
        bool _5600 = _5596 || _5598;
        bool _5602 = isnan(_5155);
        bool _5604 = _5600 || _5602;
        float _5606 = float(_5604);
        _5594 = _5606;
    }
    float _5608 = _5594;
    float _5610 = _5548 * _5193;
    out.m_93.z = _5584;
    out.m_93.w = _5089;
    float _5612 = _5530 * _5592;
    float _5614 = precise::clamp(_5612, 0.0, 1.0);
    float _5616 = -_5548;
    float _5618 = _5616 + 1.0;
    float _5620 = _5608 * _5278;
    bool _5622 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5624 = isnan(_5438);
    bool _5626 = _5622 || _5624;
    bool _5628 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5630 = _5626 || _5628;
    float _5632 = -_5614;
    float _5634 = fma(_5632, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5636 = _5204 * _5618;
    float _5638 = -_5620;
    float _5640 = fma(_5638, _5634, 1.0);
    float _5642 = precise::clamp(_5640, 0.0, 1.0);
    float _5644 = _5204 * _5610;
    float _5646 = _5642 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5648 = _5620;
    float _5650 = _5642;
    float _5652 = _5610;
    if (!_5630)
    {
        _5588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5654 = _5588;
    out.m_95.x = _5646;
    float _5656 = _5654;
    float _5658 = _5654;
    if (!_5630)
    {
        _5123 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5660 = _5123;
    float _5662 = _5660;
    float _5664 = _5660;
    if (!_5630)
    {
        _5648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5666 = _5648;
    float _5668 = _5666;
    float _5670 = _5666;
    if (!_5630)
    {
        _5161 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5672 = _5161;
    float _5674 = _5672;
    float _5676 = _5672;
    if (!_5630)
    {
        _5650 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5678 = _5650;
    float _5680 = _5520 * _5610;
    float _5682 = fma(_5516, _5644, _5198);
    float _5684 = fma(_5518, _5644, _5200);
    float _5686 = _5678;
    float _5688 = _5678;
    if (!_5630)
    {
        _5652 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5690 = _5652;
    float _5692 = fma(_5204, _5680, _5202);
    out.m_97.x = _5682;
    out.m_97.y = _5684;
    out.m_97.z = _5692;
    out.m_97.w = _5636;
    bool _5694 = !_5630;
    float _5696 = _5690;
    float _5698 = _5690;
    if (!_5694)
    {
        bool _5700 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5702 = isnan(_5438);
        bool _5704 = _5700 || _5702;
        bool _5706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5708 = _5704 || _5706;
        if (!_5708)
        {
            float _5710 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5712 = _5438 + _5710;
            float _5714 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5716 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5714;
            float _5718 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5720 = _5718 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5722 = 1.0 / _5716;
            float _5724 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5726 = _5724 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5728 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5730 = _5728 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5732 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5734 = _5732 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5736 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5738 = _5736 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5740 = _5712 * _5722;
            float _5742 = precise::clamp(_5740, 0.0, 1.0);
            float _5744 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5746 = _5744 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5748 = fma(_5742, _5720, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5750 = fma(_5742, _5746, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5752 = fma(_5742, _5726, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5754 = fma(_5742, _5730, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5756 = fma(_5742, _5734, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5758 = fma(_5742, _5738, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5698 = _5752;
            _5676 = _5756;
            _5658 = _5748;
            _5670 = _5754;
            _5664 = _5750;
            _5688 = _5758;
            _5760 = true;
        }
        else
        {
            bool _5762 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5764 = isnan(_5438);
            bool _5766 = _5762 || _5764;
            bool _5768 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5770 = _5766 || _5768;
            if (!_5770)
            {
                _5656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5772 = _5656;
            _5658 = _5772;
            if (!_5770)
            {
                _5696 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5774 = _5696;
            _5698 = _5774;
            if (!_5770)
            {
                _5662 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5776 = _5662;
            _5664 = _5776;
            if (!_5770)
            {
                _5668 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5778 = _5668;
            _5670 = _5778;
            if (!_5770)
            {
                _5674 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5780 = _5674;
            _5676 = _5780;
            if (!_5770)
            {
                _5686 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5782 = _5686;
            bool _5784 = !_5770;
            _5688 = _5782;
            if (!_5784)
            {
                bool _5786 = _5438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5788 = isnan(_5438);
                bool _5790 = _5786 || _5788;
                bool _5792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5794 = _5790 || _5792;
                if (!_5794)
                {
                    float _5796 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5798 = _5438 + _5796;
                    float _5800 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5802 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5800;
                    float _5804 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5806 = _5804 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5808 = 1.0 / _5802;
                    float _5810 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5812 = _5810 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5814 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5816 = _5814 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5818 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5820 = _5818 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5822 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5824 = _5822 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5826 = _5798 * _5808;
                    float _5828 = precise::clamp(_5826, 0.0, 1.0);
                    float _5830 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5832 = _5830 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5834 = fma(_5828, _5806, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5836 = fma(_5828, _5832, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5838 = fma(_5828, _5812, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5840 = fma(_5828, _5816, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5842 = fma(_5828, _5820, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5844 = fma(_5828, _5824, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5698 = _5838;
                    _5676 = _5842;
                    _5658 = _5834;
                    _5670 = _5840;
                    _5664 = _5836;
                    _5688 = _5844;
                    _5760 = true;
                }
                else
                {
                    _5698 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5676 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5670 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5664 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5688 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5760 = false;
    float _5846 = _5698;
    float _5848 = _5676;
    float _5850 = _5658;
    float _5852 = _5670;
    float _5854 = _5664;
    float _5856 = _5688;
    float _5858 = fma(_4485, -0.5, 0.5);
    float _5860 = precise::clamp(_5858, 0.0, 1.0);
    float _5862 = -_5846;
    float _5864 = _5862 + _5848;
    float _5866 = -_5850;
    float _5868 = _5866 + _5852;
    float _5870 = -_5854;
    float _5872 = _5870 + _5856;
    bool _5874 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5876 = fma(_5860, _5864, _5846);
    float _5878 = fma(_5860, _5868, _5850);
    float _5880 = fma(_5860, _5872, _5854);
    float _5882 = _5876 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _5884 = fma(_5878, 0.298911988735198974609375, _5882);
    float _5886 = fma(_5880, 0.114477999508380889892578125, _5884);
    out.m_99.x = 0.0;
    float _5888 = -_5886;
    float _5890 = _5878 + _5888;
    float _5892 = -_5886;
    float _5894 = _5876 + _5892;
    float _5896 = -_5886;
    float _5898 = _5880 + _5896;
    float _5900 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5902 = fma(_5890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    float _5904 = fma(_5894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    float _5906 = fma(_5898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5886);
    out.m_95.w = _5900;
    out.m_101.x = _5902;
    out.m_101.y = _5904;
    out.m_101.z = _5906;
    if (!_5874)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5908 = -_4903;
    float _5910 = _5908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5912 = -_4905;
    float _5914 = _5912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5916 = -_4907;
    float _5918 = _5916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5920 = _5910 * _5910;
    float _5922 = fma(_5914, _5914, _5920);
    float _5924 = fma(_5918, _5918, _5922);
    float _5926 = sqrt(_5924);
    float _5928 = rsqrt(_5924);
    float _5930 = -_5926;
    float _5932 = _5930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5934 = _5932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5936 = precise::clamp(_5934, 0.0, 1.0);
    float _5938 = _5914 * _5928;
    float _5940 = _5910 * _5928;
    float _5942 = abs(_5936);
    float _5944 = log2(_5942);
    float _5946 = _5918 * _5928;
    float _5948 = _5938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5950 = _4485 * _5940;
    float _5952 = -_5940;
    float _5954 = -_5948;
    float _5956 = fma(_5952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5954);
    float _5958 = fma(_4483, _5938, _5950);
    float _5960 = -_5946;
    float _5962 = fma(_5960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5956);
    float _5964 = fma(_4489, _5946, _5958);
    float _5966 = precise::clamp(_5964, 0.0, 1.0);
    float _5968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5970 = _5962 + _5968;
    float _5972 = _5944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5974 = _5970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5976 = precise::clamp(_5974, 0.0, 1.0);
    float _5978 = exp2(_5972);
    float _5980 = _5978 * _5976;
    float _5982 = _5966 * _5980;
    float _5984 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5986 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5988 = _5982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _5984;
    out.m_99.y = _5986;
    out.m_99.z = _5988;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

