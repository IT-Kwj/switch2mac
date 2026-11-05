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
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_101 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_99 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_79 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2778 = false;
    bool _1632 = false;
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
        float _3063 = as_type<float>(_136);
        out.gl_Position.z = _3063;
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
        float _3132 = as_type<float>(_174);
        out.gl_Position.z = _3132;
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
    float _328 = in.m_67.w;
    float _330 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _332 = in.m_69.y;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _336 = _334 != 0;
    float _338 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _330);
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _342 = _340 != 0;
    float _344 = in.m_67.z;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _346;
    float _350 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _352 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _354 = in.m_67.y;
    float _356 = 1.0 / _348;
    float _358 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _350);
    float _360 = in.m_71.x;
    float _362 = in.m_71.y;
    float _364 = in.m_71.z;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = in.m_67.x;
    float _372 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _374 = 1.0 / _368;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _326 + _376;
    bool _380 = _328 > 0.5;
    float _382 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _386 = _326 + _384;
    float _388 = -_332;
    float _390 = _388 + 1.0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _358);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _414 = _332;
    if (_336)
    {
        float _416 = _380 ? _390 : _332;
        _414 = _416;
    }
    float _418 = _414;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _424 = 1.0 / _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _426;
    float _430 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _432 = _364 + _354;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _436 = _326 + _434;
    float _438 = _378 * _374;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _442 = _326 + _440;
    float _444 = 1.0 / _422;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _450 = _344 * 2.0;
    float _452 = _370 + _360;
    float _454 = _370 * 2.0;
    float _456 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _432);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _326 + _458;
    float _462 = 1.0 / _408;
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _452);
    float _466 = _436 * _424;
    float _468 = _354 * 2.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _472 = _326 + _470;
    float _474 = _442 * _356;
    float _476 = _354 + _344;
    float _478 = floor(_450);
    float _480 = _386 * _444;
    float _482 = _370 + _344;
    float _484 = _476 + (-1.0);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _488 = _482 + (-1.0);
    float _490 = 1.0 / _428;
    float _492 = _460 * _462;
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _498 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _500 = _352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _502 = _478 > 0.0;
    float _504 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _508 = _478 >= 0.0;
    bool _510 = isnan(_478);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = floor(_454);
    float _520 = in.m_73.x;
    float _522 = in.m_73.y;
    float _524 = in.m_73.z;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    int _530 = _516 ? 0 : 1;
    float _532 = _472 * _490;
    out.m_75.x = _494;
    out.m_75.y = _504;
    out.m_75.z = _506;
    float _534 = fma(_528, _474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _536 = floor(_468);
    float _538 = in.m_77.x;
    float _540 = in.m_77.y;
    float _542 = in.m_77.z;
    float _544 = in.m_77.w;
    float _546 = _370 + _354;
    int _548 = ~_530;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _558 = _552;
    float _560 = _522;
    if (!_502)
    {
        int _562 = ~_530;
        int _564 = _562 + 1;
        _558 = _564;
    }
    int _566 = _558;
    float _568 = _546 + (-1.0);
    float _570 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _572 = log2(_570);
    bool _574 = _518 >= 0.0;
    bool _576 = isnan(_518);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _586 = fma(_556, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _588 = _582 ? 0 : 1;
    float _590 = _404 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _592 = _518 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _594;
    bool _598 = _536 > 0.0;
    float _600 = _456 * 15.0;
    bool _602 = _536 >= 0.0;
    bool _604 = isnan(_536);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = fma(_596, _474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _614 = _430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _616 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _618 = isnan(_326);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = _354 + (-0.5);
    float _630 = _520 * _542;
    float _632 = _524 * _540;
    float _634 = _522 * _538;
    bool _636 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _638 = isnan(_326);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_630;
    float _650 = fma(_524, _538, _648);
    float _652 = -_632;
    float _654 = fma(_522, _542, _652);
    float _656 = -_634;
    float _658 = fma(_520, _540, _656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _660;
    float _664 = _650 * _544;
    float _666 = _654 * _544;
    float _668 = _658 * _544;
    float _670 = fma(_662, _474, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _680 = -_626;
    float _682 = _680 + 1.0;
    float _684 = fma(_674, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _710 = fma(_692, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _712 = fma(_700, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _714 = fma(_678, _438, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _716 = fma(_708, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _718 = _572 * _154;
    float _720 = fma(_688, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _722 = fma(_696, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _724 = fma(_704, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _726;
    float _730 = exp2(_718);
    bool _732 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _734 = isnan(_326);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _744;
    float _748 = fma(_728, _532, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _750;
    bool _754 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _756 = isnan(_326);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -_742;
    float _768 = _766 + 1.0;
    float _770 = fma(_746, _532, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _772 = ~_588;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = fma(_752, _532, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _780 = _776;
    float _782 = _710;
    if (!_592)
    {
        int _784 = ~_588;
        int _786 = _784 + 1;
        _780 = _786;
    }
    int _788 = _780;
    float _790 = _764 * _768;
    bool _792 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _794 = isnan(_326);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -_764;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _812 = -_730;
    float _814 = _812 + 1.0;
    float _816 = _802 * _806;
    float _818 = -_802;
    float _820 = _818 + 1.0;
    bool _822 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _824 = isnan(_326);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _836 = 1.0 + _834;
    bool _838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = _626 * _820;
    bool _850 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _852 = isnan(_326);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _836;
    float _864 = -_832;
    float _866 = _864 + 1.0;
    float _868 = _846 ? _814 : 0.0;
    float _870 = _832 * _682;
    bool _872 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _874 = isnan(1.0);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _880 = _876 || _878;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _886 = _860 * _866;
    float _888 = -_860;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _896 = fma(_884, _480, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _898 = in.m_79.x;
    float _900 = _646 * _890;
    float _902 = -_646;
    float _904 = _902 + 1.0;
    float _906 = fma(_894, _480, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _908 = _610 ? 0 : 1;
    float _910 = _612 * _900;
    float _912 = _534 * _900;
    if (_880)
    {
        float _914 = _868 * _862;
        _158 = _914;
    }
    float _916 = _158;
    float _918 = _670 * _900;
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].x, _910);
    float _922 = _464 * 7.5;
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].y, _912);
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].z, _918);
    float _928 = _522 * _522;
    float _930 = _922 * 0.15915493667125701904296875;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _500 + _932;
    bool _936 = !_398;
    int _938 = _936 ? 0 : 1;
    float _940 = fma(_520, _520, _928);
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _590 + _942;
    float _946 = _934 * _934;
    float _948 = fma(_810, _480, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _950 = _930 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = fma(_524, _524, _940);
    int _956 = abs(_938);
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _960 = _614 + _958;
    float _962 = fma(_944, _944, _946);
    float _964 = _600 * 0.15915493667125701904296875;
    int _966 = ~_908;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = in.m_81.x;
    float _974 = in.m_81.y;
    float _976 = in.m_81.z;
    int _978 = _970;
    float _980 = _916;
    if (!_598)
    {
        int _982 = ~_908;
        int _984 = _982 + 1;
        _978 = _984;
    }
    int _986 = _978;
    float _988 = fma(_684, _886, _920);
    float _990 = fma(_960, _960, _962);
    float _992 = fma(_586, _886, _924);
    float _994 = float(_956);
    float _996 = _964 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = float(_788);
    float _1002 = fma(_714, _886, _926);
    float _1004 = _952 * 0.07999999821186065673828125;
    float _1006 = fma(_722, _870, _992);
    float _1008 = float(_566);
    float _1010 = _994 * _1000;
    float _1012 = fma(_1004, _898, _362);
    float _1014 = rsqrt(_990);
    float _1016 = fma(_720, _870, _988);
    float _1018 = fma(_724, _870, _1002);
    float _1020 = _1010 * (-2.0);
    bool _1022 = !_402;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = fma(_712, _848, _1006);
    bool _1028 = !_394;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = fma(_496, _1020, _496);
    float _1034 = rsqrt(_954);
    int _1036 = abs(_1024);
    float _1038 = fma(_1020, _974, _974);
    int _1040 = abs(_1030);
    float _1042 = _998 * 0.02999999932944774627685546875;
    float _1044 = float(_1036);
    float _1046 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1038);
    float _1048 = float(_1040);
    float _1050 = _934 * _1014;
    float _1052 = _944 * _1014;
    float _1054 = _960 * _1014;
    float _1056 = float(_986);
    float _1058 = -_1050;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1062 = -_1052;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1066 = _1048 * _1008;
    float _1068 = -_1054;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _1072 = _1034 * _1042;
    float _1074 = _1060 * _1060;
    float _1076 = _1044 * _1056;
    float _1078 = fma(_1032, _916, _1046);
    float _1080 = fma(_520, _1072, _360);
    float _1082 = fma(_1064, _1064, _1074);
    float _1084 = fma(_522, _1072, _1012);
    float _1086 = fma(_524, _1072, _364);
    float _1088 = _1066 * (-2.0);
    float _1090 = in.m_69.x;
    float _1092 = fma(_1070, _1070, _1082);
    float _1094 = _1076 * (-2.0);
    float _1096 = _370 + (-0.5);
    float _1098 = fma(_1088, _972, _972);
    float _1100 = fma(_584, _1088, _584);
    bool _1102 = _344 > 0.5;
    bool _1104 = _1102 && _342;
    float _1106 = fma(_1094, _976, _976);
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1098);
    float _1110 = fma(_498, _1094, _498);
    float _1112 = _344 + (-0.5);
    float _1114 = fma(_710, _848, _1016);
    float _1116 = fma(_1100, _916, _1108);
    bool _1118 = _1084 != 0.0;
    bool _1120 = isnan(_1084);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1106);
    float _1130 = fma(_716, _848, _1018);
    float _1132 = _1116 * 0.15915493667125701904296875;
    bool _1134 = _1080 == 0.0;
    bool _1136 = !_1126;
    bool _1138 = _1134 && _1136;
    float _1140 = in.m_65.x;
    float _1142 = in.m_65.y;
    float _1144 = in.m_65.z;
    float _1146 = fma(_1110, _916, _1128);
    float _1148 = _1078 * 0.15915493667125701904296875;
    float _1150 = sqrt(_1092);
    bool _1152 = _1086 == 0.0;
    bool _1154 = _1152 && _1138;
    float _1156 = _1146 * 0.15915493667125701904296875;
    float _1158 = _972;
    float _1160 = _1090;
    float _1162 = _1098;
    float _1164 = _1100;
    if (!_342)
    {
        _1158 = _1090;
    }
    float _1166 = _1158;
    float _1168 = _1166;
    if (_1104)
    {
        float _1170 = -_1090;
        float _1172 = _1170 + 1.0;
        _1160 = _1172;
    }
    float _1174 = _1160;
    float _1176 = fma(_778, _816, _1130);
    float _1178 = fma(_770, _816, _1026);
    float _1180 = fma(_748, _816, _1114);
    float _1182 = _1148 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    if (_342)
    {
        _1168 = _1174;
    }
    float _1186 = _1168;
    float _1188 = fma(_948, _790, _1176);
    float _1190 = fma(_906, _790, _1178);
    float _1192 = fma(_896, _790, _1180);
    float _1194 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1188);
    float _1196 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1190);
    float _1198 = _1132 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1192);
    if (_1154)
    {
        _980 = _520;
    }
    float _1204 = _980;
    float _1206 = _1204;
    if (!_1154)
    {
        float _1208 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[17].y, _520);
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = _1196 * _1142;
    float _1214 = _1202 * _1140;
    float _1216 = _1014 * _1150;
    float _1218 = _1132 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1224 = _1194 * _1144;
    if (!_1154)
    {
        float _1226 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _560 = _1226;
    }
    float _1228 = _560;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1084);
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _1148 * 6.283185482025146484375;
    float _1238 = cos(_1236);
    float _1240 = _1200 * _1184;
    float _1242 = _1216 * _1234;
    float _1244 = _1156 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1220 * _1184;
    float _1250 = _1156 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = _1200 * _1238;
    float _1256 = _1220 * _1238;
    float _1258 = _1200 * _1246;
    float _1260 = _1238 * _1246;
    float _1262 = _1220 * _1246;
    float _1264 = _1184 * _1246;
    float _1266 = _1216 * _1222;
    float _1268 = _1216 * _1230;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1080);
    float _1272 = _1262 * _540;
    float _1274 = _1232 * _1266;
    float _1276 = -_1240;
    float _1278 = fma(_1252, _1256, _1276);
    float _1280 = -_1256;
    float _1282 = fma(_1252, _1240, _1280);
    float _1284 = _1270 * _1268;
    float _1286 = fma(_1252, _1254, _1248);
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1086);
    float _1290 = _1258 * _1274;
    float _1292 = -_1274;
    float _1294 = _1252 * _1292;
    float _1296 = _1262 * _1274;
    float _1298 = _1288 * _1242;
    float _1300 = fma(_1286, _1284, _1290);
    float _1302 = fma(_1260, _1284, _1294);
    float _1304 = fma(_1278, _1284, _1296);
    float _1306 = fma(_1252, _1248, _1254);
    float _1308 = fma(_1282, _1298, _1300);
    float _1310 = _1254;
    if (_1154)
    {
        _1310 = _524;
    }
    float _1312 = _1310;
    float _1314 = _1312;
    if (!_1154)
    {
        float _1316 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _1314 = _1316;
    }
    float _1318 = _1314;
    float _1320 = fma(_1264, _1298, _1302);
    float _1322 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1326 = -_1228;
    float _1328 = _1252 * _1326;
    float _1330 = fma(_1306, _1298, _1304);
    float _1332 = -_664;
    float _1334 = _1252 * _1332;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1324);
    float _1340 = -_540;
    float _1342 = _1252 * _1340;
    float _1344 = fma(_1260, _1210, _1328);
    float _1346 = fma(_1260, _666, _1334);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1336);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1338);
    float _1352 = fma(_1260, _538, _1342);
    float _1354 = _1258 * _540;
    float _1356 = _590 + _1348;
    float _1358 = _614 + _1350;
    float _1360 = _1258 * _1228;
    float _1362 = _1262 * _1228;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1366 = _1356 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1370 = _1358 + _1368;
    float _1372 = _1258 * _664;
    float _1374 = _1262 * _664;
    float _1376 = _1366 * _1366;
    float _1378 = _1370 * _1370;
    float _1380 = fma(_1286, _1210, _1360);
    float _1382 = fma(_1286, _538, _1354);
    float _1384 = fma(_1286, _666, _1372);
    float _1386 = _1376 + _1378;
    float _1388 = fma(_1278, _1210, _1362);
    float _1390 = fma(_1278, _538, _1272);
    float _1392 = fma(_1278, _666, _1374);
    float _1394 = sqrt(_1386);
    float _1396 = fma(_1264, _1318, _1344);
    float _1398 = fma(_1264, _542, _1352);
    float _1400 = fma(_1282, _1318, _1380);
    float _1402 = fma(_1282, _542, _1382);
    float _1404 = fma(_1306, _1318, _1388);
    float _1406 = fma(_1306, _542, _1390);
    float _1408 = fma(_1306, _668, _1392);
    float _1410 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = fma(_1264, _668, _1346);
    float _1414 = fma(_1282, _668, _1384);
    float _1416 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1418 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1422 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1424 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1426 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1418);
    float _1430 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1422);
    float _1432 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1416);
    float _1434 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1424);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1438 = _500 + _1428;
    float _1440 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1444 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1440);
    float _1448 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1442);
    float _1450 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1444);
    float _1452 = _1422;
    float _1454 = _1376;
    float _1456 = _1378;
    float _1458 = _1356;
    float _1460 = _1358;
    float _1462 = _1446;
    if (!_1426)
    {
        _1452 = _1438;
    }
    float _1464 = _1452;
    bool _1466 = !_1426;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1394 + _1472;
        float _1476 = rsqrt(_1386);
        float _1478 = _1474 * _1470;
        float _1480 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1482 = _1478 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = cos(_1488);
        float _1492 = fma(_1486, _1480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1494 = _1476 * _1492;
        float _1496 = _1490 + (-1.0);
        float _1498 = fma(_1366, _1494, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1500 = fma(_1370, _1494, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1502 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1506 = _1498 + _1504;
        float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1510 = _1500 + _1508;
        float _1512 = fma(_1438, _1490, _1502);
        float _1514 = _1506 * _1506;
        float _1516 = _1510 * _1510;
        _1468 = _1512;
        _1454 = _1514;
        _1456 = _1516;
        _1458 = _1498;
        _1460 = _1500;
    }
    float _1518 = _1468;
    float _1520 = _1454;
    float _1522 = _1456;
    float _1524 = _1458;
    float _1526 = _1460;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1530 = _1518 + _1528;
    float _1532 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1534 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1536 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1538 = fma(_1530, _1530, _1520);
    float _1540 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1532);
    float _1542 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1534);
    float _1544 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1536);
    float _1546 = _1538 + _1522;
    float _1548 = _418 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1550 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1552 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1432);
    float _1554 = _1548 * _1436;
    float _1556 = sqrt(_1546);
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1430);
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1566 = _1550 * _1420;
    float _1568 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1434);
    float _1570 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1540);
    float _1574 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1542);
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1544);
    float _1582 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1446);
    float _1584 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1448);
    float _1586 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1450);
    out.m_83.x = _1576;
    out.m_83.y = _1570;
    out.m_83.z = _1578;
    bool _1588 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1590 = isnan(_1556);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1596 = _1592 || _1594;
    out.m_85.z = _1566;
    out.m_85.w = _1554;
    out.m_87.x = _1562;
    out.m_87.y = _1552;
    out.m_87.z = _1568;
    out.m_89.x = _1572;
    out.m_89.y = _1574;
    out.m_89.z = _1580;
    if (!_1596)
    {
        _1462 = 1.0;
    }
    float _1598 = _1462;
    out.m_91.x = _1582;
    out.m_91.y = _1584;
    out.m_91.z = _1586;
    bool _1600 = !_1596;
    float _1602 = _1598;
    if (!_1600)
    {
        bool _1604 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1606 = isnan(_1556);
        bool _1608 = _1604 || _1606;
        bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1612 = _1608 || _1610;
        if (!_1612)
        {
            float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1616 = _1556 + _1614;
            float _1618 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1620 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1618;
            float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1624 = _1622 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1626 = 1.0 / _1620;
            float _1628 = _1616 * _1626;
            float _1630 = fma(_1628, _1624, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1602 = _1630;
            _1632 = true;
        }
        else
        {
            bool _1634 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1636 = isnan(_1556);
            bool _1638 = _1634 || _1636;
            bool _1640 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1642 = _1638 || _1640;
            if (!_1642)
            {
                float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1646 = _1556 + _1644;
                float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1650 = _1648 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1654 = _1652 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1656 = 1.0 / _1650;
                float _1658 = _1646 * _1656;
                float _1660 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1602 = _1660;
                _1632 = true;
            }
            else
            {
                _1602 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1632 = false;
    float _1662 = _1602;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1666 = _1518 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1670 = _1524 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1674 = _1526 + _1672;
    float _1676 = -_1050;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _1680 = fma(_1666, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1682 = fma(_1670, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1684 = fma(_1674, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1686 = -_1052;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _1690 = -_1050;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1694 = -_1052;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1698 = -_1054;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1684);
    float _1702 = -_1054;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _614);
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1708 = _1692 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1696 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1700 + _1714;
    float _1718 = _1708 * _1708;
    float _1720 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = fma(_1712, _1712, _1718);
    float _1724 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1726 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1728 = fma(_1716, _1716, _1722);
    float _1730 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1724);
    float _1732 = _1678 + _1726;
    float _1734 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1736 = rsqrt(_1728);
    float _1738 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1730);
    float _1740 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1744 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1740);
    float _1748 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1742);
    float _1750 = floor(_1734);
    float _1752 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1746);
    float _1754 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1748);
    float _1756 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1758 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1760 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1764 = 1.0 / _1744;
    float _1766 = _1756 + _1744;
    float _1768 = _1712 * _1760;
    float _1770 = _1716 * _1760;
    float _1772 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1762);
    float _1774 = _1768 * _1768;
    float _1776 = _1770 * _1770;
    float _1778 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1772);
    float _1780 = sqrt(_1728);
    float _1782 = _1774 + _1776;
    float _1784 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1786 = _1766 * _1764;
    float _1788 = _1786 * 0.5;
    float _1790 = sqrt(_1782);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1794 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1792);
    float _1796 = 1.0 / _1794;
    bool _1798 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = trunc(_1758);
    int _1802 = int(_1800);
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1790 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1810 = _1796 * _1808;
    float _1812 = trunc(_1784);
    int _1814 = int(_1812);
    bool _1816 = _1810 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1818 = _1810 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1820 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1822 = _1678;
    int _1824 = 2;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1828 = _1782;
    float _1830 = _1768;
    float _1832 = _1774;
    float _1834 = _1784;
    if (_1798)
    {
        float _1836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    int _1840 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1842 = _1802 + _1840;
    int _1844 = _1842 + 1;
    bool _1846 = !_1816;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1852 = _1814 + _1850;
    int _1854 = _1852 + 1;
    float _1856 = floor(_1820);
    float _1858 = as_type<float>(_1814);
    uint _1861 = uint(_1844);
    if (!_1816)
    {
        _1824 = 1;
    }
    int _1863 = _1824;
    int _1865 = _1863;
    if (!_1818)
    {
        _1865 = _1848;
    }
    int _1867 = _1865;
    bool _1869 = _1844 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1798)
    {
        float _1871 = _1806 * _1838;
        _1826 = _1871;
    }
    float _1873 = _1826;
    if (_1798)
    {
        float _1875 = rsqrt(_1782);
        _1828 = _1875;
    }
    float _1877 = _1828;
    int _1879 = _1867 << 6;
    float _1881 = _1877;
    int _1883 = _1879;
    if (_1798)
    {
        float _1885 = _1873 * 0.15915493667125701904296875;
        _1858 = _1885;
    }
    float _1887 = _1858;
    int _1889 = _1844 | _1854;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1893 = _1879 + 48;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    bool _1911 = _1889 < 0;
    bool _1913 = _1911 || _1869;
    float _1915 = _1806;
    if (_1798)
    {
        float _1917 = _1887 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = precise::max(0.0, _1891);
    float _1925 = -_1856;
    float _1927 = _1820 + _1925;
    bool _1929 = _1854 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1931 = _1929 || _1913;
    int _1933 = _1879 + 64;
    uint _1935 = uint(int(uint(_1933) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[int(_1945)][_1947];
    float _1951 = -_1760;
    float _1953 = -_1923;
    float _1955 = fma(_1708, _1951, _1953);
    float _1957 = _1394;
    float _1959 = _1923;
    float _1961 = _1955;
    if (_1798)
    {
        float _1963 = _1887 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        _1957 = _1965;
    }
    float _1967 = _1957;
    if (_1798)
    {
        float _1969 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1969;
    }
    float _1971 = _1959;
    int _1973 = _1879 + 96;
    uint _1975 = uint(int(uint(_1973) >> uint(2)));
    uint _1977 = uint(int(uint(int(_1975)) >> uint(2)));
    int _1979 = int(_1975) & 3;
    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
    int _1983 = int(_1975) + 1;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    int _1987 = _1983 & 3;
    float _1989 = (*spvDescriptorSet0.vp_c15)._m0[int(_1985)][_1987];
    if (!_1931)
    {
        int _1991 = _1854 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1993 = _1991 + _1844;
        _1861 = uint(_1993);
    }
    uint _1995 = _1861;
    if (_1798)
    {
        float _1997 = fma(_1921, _1971, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1162 = _1997;
    }
    float _1999 = _1162;
    int _2001 = _1879 + 80;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[int(_2013)][_2015];
    if (_1798)
    {
        float _2019 = _1877 * _1999;
        _1881 = _2019;
    }
    float _2021 = _1881;
    float _2023 = _1967;
    if (_1798)
    {
        float _2025 = _1967 + (-1.0);
        _782 = _2025;
    }
    float _2027 = _782;
    if (_1798)
    {
        float _2029 = _1768 * _2021;
        _1830 = _2029;
    }
    float _2031 = _1830;
    if (_1798)
    {
        float _2033 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1164 = _2033;
    }
    float _2035 = _1164;
    int _2037 = _1879 + 104;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    uint _2041 = uint(int(uint(int(_2039)) >> uint(2)));
    int _2043 = int(_2039) & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    int _2047 = int(_2039) + 1;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    int _2051 = _2047 & 3;
    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[int(_2049)][_2051];
    float _2055 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    if (_1798)
    {
        float _2057 = _2031 * _2031;
        _1832 = _2057;
    }
    float _2059 = _1832;
    if (_1798)
    {
        float _2061 = fma(_1955, _1967, _2035);
        _1961 = _2061;
    }
    float _2063 = _1961;
    if (!_1798)
    {
        _2023 = _1770;
    }
    float _2065 = _2023;
    float _2067 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2069 = _2065;
    float _2071 = _2067;
    if (_1798)
    {
        float _2073 = _1770 * _2021;
        _2069 = _2073;
    }
    float _2075 = _2069;
    float _2077 = fma(_2063, _2063, _2059);
    int _2079 = _1879 + 72;
    uint _2081 = uint(int(uint(_2079) >> uint(2)));
    uint _2083 = uint(int(uint(int(_2081)) >> uint(2)));
    int _2085 = int(_2081) & 3;
    float _2087 = (*spvDescriptorSet0.vp_c15)._m0[int(_2083)][_2085];
    int _2089 = int(_2081) + 1;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    int _2093 = _2089 & 3;
    float _2095 = (*spvDescriptorSet0.vp_c15)._m0[int(_2091)][_2093];
    float _2097 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1798)
    {
        _2071 = _1776;
    }
    float _2099 = _2071;
    float _2101 = _2099;
    if (_1798)
    {
        float _2103 = _2075 * _2075;
        _2101 = _2103;
    }
    float _2105 = _2101;
    float _2107 = _2035;
    if (!_1931)
    {
        float _2109 = floor(_1784);
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2115 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2117 = _2077 + _2105;
    int _2119 = _1879 + 56;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    float _2137 = _1732 * _1909;
    float _2139 = -_2115;
    float _2141 = fma(_2139, _2113, 1.0);
    int _2143 = as_type<int>(_2115);
    float _2145 = _1909;
    if (!_1931)
    {
        uint _2147 = uint(int(uint(int(_1995)) >> uint(2)));
        _2143 = int(_2147);
    }
    int _2149 = _2143;
    float _2151 = -_1750;
    float _2153 = _1734 + _2151;
    float _2155 = fma(_1688, _1901, _2137);
    float _2157 = rsqrt(_2117);
    int _2159 = _1879 + 88;
    uint _2161 = uint(int(uint(_2159) >> uint(2)));
    uint _2163 = uint(int(uint(int(_2161)) >> uint(2)));
    int _2165 = int(_2161) & 3;
    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
    int _2169 = int(_2161) + 1;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    int _2173 = _2169 & 3;
    float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
    float _2177 = _1732 * _1949;
    if (!_1931)
    {
        float _2179 = -_2111;
        float _2181 = _1784 + _2179;
        _2145 = _2181;
    }
    float _2183 = _2145;
    float _2185 = log2(_2141);
    float _2187 = _1732 * _1989;
    if (!_1931)
    {
        int _2189 = int(_1995) << 2;
        _1883 = _2189;
    }
    int _2191 = _1883;
    float _2193 = fma(_1688, _1981, _2187);
    int _2195 = _2191;
    if (!_1931)
    {
        int _2197 = 12 & _2191;
        _2195 = _2197;
    }
    int _2199 = _2195;
    float _2201 = _2157 * _2031;
    float _2203 = _1732 * _2017;
    float _2205 = fma(_1688, _1941, _2177);
    if (!_1931)
    {
        int _2207 = _2149 << 4;
        int _2209 = _2207 + _2199;
        _1834 = as_type<float>(_2209);
    }
    float _2211 = _1834;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2215 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2213);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = fma(_1688, _2009, _2203);
    float _2221 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2223 = _2157 * _2075;
    float _2225 = -_2217;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_1704, _2045, _2193);
    float _2231 = _2185 * 0.693147182464599609375;
    float2 _6501 = float2(_1927, _2153);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6501, float2(0.0), isnan(_6501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6501, float2(0.0), isnan(_6501)), level(0.0)).x;
    float _2235 = _2211;
    if (!_1931)
    {
        int _2237 = as_type<int>(_2211) + 400;
        uint _2239 = uint(int(uint(_2237) >> uint(2)));
        uint _2241 = uint(int(uint(int(_2239)) >> uint(2)));
        int _2243 = int(_2239) & 3;
        float _2245 = (*spvDescriptorSet0.vp_c15)._m0[int(_2241)][_2243];
        _2235 = _2245;
    }
    float _2247 = _2235;
    float _2249 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2251 = fma(_1704, _2087, _2205);
    float _2253 = _2229 + _2053;
    float _2255 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2257 = _2157 * _2063;
    float _2259 = _2251 + _2095;
    float _2261 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2263 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2255);
    float _2265 = 1.0 / _2253;
    float _2267 = fma(_1704, _2127, _2155);
    float _2269 = -_2221;
    float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2269);
    float _2273 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2263);
    float _2275 = _2267 + _2135;
    float _2277 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2279 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2281 = abs(_2227);
    float _2283 = log2(_2281);
    float _2285 = fma(_1704, _2167, _2219);
    float _2287 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2277);
    float _2289 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2261);
    float _2291 = -_2223;
    float _2293 = fma(_2291, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2271);
    float _2295 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2287);
    float _2297 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2289);
    float _2299 = _2275 * _2265;
    float _2301 = fma(_2293, -0.5, 0.5);
    float _2303 = _2295 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2305 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2307 = fma(_2293, 0.5, 0.5);
    bool _2309 = _2299 >= 0.0;
    float _2311 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2313 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2305);
    float _2315 = _2259 * _2265;
    float _2317 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2319 = _2299 <= 1.0;
    bool _2321 = _2319 && _2309;
    float _2323 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2313);
    float _2325 = sqrt(_2301);
    float _2327 = _2285 + _2175;
    bool _2329 = _2315 >= 0.0;
    bool _2331 = _2329 && _2321;
    float _2333 = _2257 + 1.0;
    float _2335 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2337 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2339 = _2315 <= 1.0;
    bool _2341 = _2339 && _2331;
    float _2343 = exp2(_2317);
    float _2345 = _2261;
    float _2347 = _2257;
    if (!_1931)
    {
        float _2349 = floor(_1758);
        _2345 = _2349;
    }
    float _2351 = _2345;
    float _2353 = _2325 * 0.636619746685028076171875;
    float _2355 = fma(_2307, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2357 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2323);
    float _2359 = fma(_2307, _2355, -0.212114393711090087890625);
    float _2361 = 1.0 / _2357;
    float _2363 = -_2257;
    float _2365 = fma(_2343, _2333, _2363);
    float _2367 = _2357;
    if (_2341)
    {
        float _2369 = float(_1867);
        _2347 = _2369;
    }
    float _2371 = _2347;
    float _2373 = fma(_2307, _2359, 1.570728778839111328125);
    float _2375 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2335);
    float _2377 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2337);
    float _2379 = fma(_2365, 0.5, 0.5);
    float _2381 = -_2373;
    float _2383 = fma(_2353, _2381, 1.0);
    float _2385 = _2371;
    if (_2341)
    {
        float _2387 = rint(_2371);
        float _2389 = precise::max(_2387, 0.0);
        uint _2391 = uint(_2389);
        uint _2393 = clamp(_2391, 0u, 65535u);
        _2385 = as_type<float>(_2393);
    }
    float _2395 = _2385;
    float _2397 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2375);
    float _2399 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2377);
    float _2401 = _2351;
    if (!_1931)
    {
        float _2403 = -_2351;
        float _2405 = _1758 + _2403;
        _2401 = _2405;
    }
    float _2407 = _2401;
    float _2409 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2397);
    float _2411 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2399);
    float _2413 = _2327 * _2265;
    float _2415 = _2409 * _2361;
    float _2417 = _2411 * _2361;
    float _2419 = _2265;
    if (!_1931)
    {
        float _2421 = rint(_2247);
        float _2423 = precise::max(_2421, 0.0);
        uint _2425 = uint(_2423);
        uint _2427 = clamp(_2425, 0u, 65535u);
        _2419 = as_type<float>(_2427);
    }
    float _2429 = _2419;
    float _2431 = fma(_2415, 0.5, 0.5);
    float _2433 = fma(_2417, -0.5, 0.5);
    float _2435 = _2157;
    if (_2341)
    {
        float3 _6848 = float3(_2299, _2315, float(as_type<int>(_2395)));
        float3 _6852 = select(_6848, float3(0.0), isnan(_6848));
        float _2437 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6852.xy, uint(rint(_6852.z)), _2413, level(0.0));
        _2435 = _2437;
    }
    float _2439 = _2435;
    float3 _6862 = float3(_2431, _2433, _2249);
    float _2441 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6862, float3(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6862, float3(0.0), isnan(_6862)), level(0.0)).x;
    float3 _6871 = float3(_2431, _2433, _2249);
    float4 _2444 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6871, float3(0.0), isnan(_6871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6871, float3(0.0), isnan(_6871)), level(0.0)).xyzw;
    float _2446 = _2444.x;
    float _2448 = _2444.y;
    float _2450 = _2444.z;
    float _2452 = _2444.w;
    float2 _6887 = float2(_2383, _2379);
    float3 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6887, float2(0.0), isnan(_6887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6887, float2(0.0), isnan(_6887)), level(0.0)).xyz;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = _2429;
    if (!_1931)
    {
        float3 _6908 = float3(_2407, _2183, float(as_type<int>(_2429)));
        float3 _6910 = select(_6908, float3(0.0), isnan(_6908));
        float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6910.xy, uint(rint(_6910.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6910.xy, uint(rint(_6910.z)), level(0.0)).x;
        _2464 = _2466;
    }
    float _2468 = _2464;
    float _2470 = abs(_1810);
    float _2472 = log2(_2470);
    float _2474 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2476 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2474);
    float _2478 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2476);
    bool _2480 = _1810 <= 8000.0;
    bool _2482 = isnan(_1810);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan(8000.0);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    float _2494 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2496 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2498 = exp2(_2494);
    out.gl_Position.x = _2409;
    out.gl_Position.y = _2411;
    out.gl_Position.z = _2492;
    out.gl_Position.w = _2357;
    float _2500 = exp2(_2496);
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = fma(_2504, -2.0, 3.0);
    float _2508 = _2504 * _2504;
    float _2510 = _2508 * _2506;
    float _2512 = _2492 + _2357;
    float _2514 = -_2498;
    float _2516 = _2514 + 1.0;
    float _2518 = _2512 * 0.5;
    float _2520 = -_2510;
    float _2522 = _2520 + 1.0;
    float _2524 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.z = _2518;
    out.m_93.w = _2357;
    float _2526 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2510);
    float _2528 = _2490 * _2526;
    float _2530 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2532 = _2528;
    float _2534 = _2530;
    float _2536 = _2492;
    if (!_2341)
    {
        _2532 = 1.0;
    }
    float _2538 = _2532;
    float _2540 = -_2233;
    float _2542 = _2540 + 1.0;
    float _2544 = _2542 * _2530;
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    float _2548 = _2538;
    if (_1931)
    {
        _2534 = 1.0;
    }
    float _2550 = _2534;
    float _2552 = _2550;
    if (_2341)
    {
        bool _2554 = _2439 >= _2413;
        bool _2556 = isnan(_2439);
        bool _2558 = _2554 || _2556;
        bool _2560 = isnan(_2413);
        bool _2562 = _2558 || _2560;
        float _2564 = float(_2562);
        _2548 = _2564;
    }
    float _2566 = _2548;
    if (!_1931)
    {
        int _2568 = int(_1995) << 4;
        int _2570 = _2568 + 2048;
        uint _2572 = uint(int(uint(_2570) >> uint(2)));
        uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
        int _2576 = int(_2572) & 3;
        float _2578 = (*spvDescriptorSet0.vp_c15)._m0[int(_2574)][_2576];
        int _2580 = int(_2572) + 1;
        uint _2582 = uint(int(uint(_2580) >> uint(2)));
        int _2584 = _2580 & 3;
        float _2586 = (*spvDescriptorSet0.vp_c15)._m0[int(_2582)][_2584];
        int _2588 = _2570 + 8;
        uint _2590 = uint(int(uint(_2588) >> uint(2)));
        uint _2592 = uint(int(uint(int(_2590)) >> uint(2)));
        int _2594 = int(_2590) & 3;
        float _2596 = (*spvDescriptorSet0.vp_c15)._m0[int(_2592)][_2594];
        int _2598 = int(_2590) + 1;
        uint _2600 = uint(int(uint(_2598) >> uint(2)));
        int _2602 = _2598 & 3;
        float _2604 = (*spvDescriptorSet0.vp_c15)._m0[int(_2600)][_2602];
        float _2606 = _1732 * _2586;
        float _2608 = fma(_1688, _2578, _2606);
        float _2610 = fma(_1704, _2596, _2608);
        float _2612 = _2610 + _2604;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        float _2616 = -_2614;
        float _2618 = _2616 + _2468;
        float _2620 = fma(_2618, 500.0, 1.5);
        float _2622 = exp2(_2620);
        float _2624 = 0.0 + _2622;
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        _2552 = _2626;
    }
    float _2628 = _2552;
    float _2630 = _2566 * _2628;
    float _2632 = _2524 * _2441;
    float _2634 = -_2546;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2638 = -_2524;
    float _2640 = _2638 + 1.0;
    bool _2642 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2644 = isnan(_1780);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2650 = _2646 || _2648;
    float _2652 = _2452 * _2632;
    float _2654 = -_2630;
    float _2656 = fma(_2654, _2636, 1.0);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = _2462 * _2632;
    float _2662 = _2452 * _2640;
    float _2664 = fma(_2458, _2652, _2446);
    float _2666 = fma(_2460, _2652, _2448);
    float _2668 = _2658 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = fma(_2452, _2660, _2450);
    out.m_95.x = _2668;
    float _2672 = _2652;
    float _2674 = _2640;
    float _2676 = _2636;
    float _2678 = _2658;
    if (!_2650)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2680 = _2367;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2650)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2686 = _2536;
    out.m_97.x = _2664;
    out.m_97.y = _2666;
    out.m_97.z = _2670;
    out.m_97.w = _2662;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2650)
    {
        _2672 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2692 = _2672;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2650)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2698 = _2674;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2650)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2704 = _2676;
    float _2706 = _2704;
    float _2708 = _2704;
    if (!_2650)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2710 = _2678;
    bool _2712 = !_2650;
    float _2714 = _2710;
    float _2716 = _2710;
    if (!_2712)
    {
        bool _2718 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2720 = isnan(_1780);
        bool _2722 = _2718 || _2720;
        bool _2724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2726 = _2722 || _2724;
        if (!_2726)
        {
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2730 = _1780 + _2728;
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2734 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2732;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2740 = 1.0 / _2734;
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2758 = _2730 * _2740;
            float _2760 = precise::clamp(_2758, 0.0, 1.0);
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2766 = fma(_2760, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2768 = fma(_2760, _2764, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2770 = fma(_2760, _2744, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2772 = fma(_2760, _2748, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2774 = fma(_2760, _2752, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2776 = fma(_2760, _2756, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2690 = _2770;
            _2708 = _2774;
            _2684 = _2766;
            _2702 = _2772;
            _2696 = _2768;
            _2716 = _2776;
            _2778 = true;
        }
        else
        {
            bool _2780 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2782 = isnan(_1780);
            bool _2784 = _2780 || _2782;
            bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2788 = _2784 || _2786;
            if (!_2788)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2790 = _2682;
            _2684 = _2790;
            if (!_2788)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2792 = _2688;
            _2690 = _2792;
            if (!_2788)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2794 = _2694;
            _2696 = _2794;
            if (!_2788)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2796 = _2700;
            _2702 = _2796;
            if (!_2788)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2798 = _2706;
            _2708 = _2798;
            if (!_2788)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2800 = _2714;
            bool _2802 = !_2788;
            _2716 = _2800;
            if (!_2802)
            {
                bool _2804 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2806 = isnan(_1780);
                bool _2808 = _2804 || _2806;
                bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2812 = _2808 || _2810;
                if (!_2812)
                {
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2816 = _1780 + _2814;
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2820 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2818;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2826 = 1.0 / _2820;
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2844 = _2816 * _2826;
                    float _2846 = precise::clamp(_2844, 0.0, 1.0);
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2852 = fma(_2846, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2854 = fma(_2846, _2850, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2856 = fma(_2846, _2830, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2858 = fma(_2846, _2834, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2860 = fma(_2846, _2838, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2862 = fma(_2846, _2842, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2690 = _2856;
                    _2708 = _2860;
                    _2684 = _2852;
                    _2702 = _2858;
                    _2696 = _2854;
                    _2716 = _2862;
                    _2778 = true;
                }
                else
                {
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2778 = false;
    float _2864 = _2690;
    float _2866 = _2708;
    float _2868 = _2684;
    float _2870 = _2702;
    float _2872 = _2696;
    float _2874 = _2716;
    float _2876 = fma(_1584, -0.5, 0.5);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -_2864;
    float _2882 = _2880 + _2866;
    float _2884 = -_2868;
    float _2886 = _2884 + _2870;
    float _2888 = -_2872;
    float _2890 = _2888 + _2874;
    bool _2892 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2894 = fma(_2878, _2882, _2864);
    float _2896 = fma(_2878, _2886, _2868);
    float _2898 = fma(_2878, _2890, _2872);
    float _2900 = _2894 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2902 = fma(_2896, 0.298911988735198974609375, _2900);
    float _2904 = fma(_2898, 0.114477999508380889892578125, _2902);
    out.m_99.x = 0.0;
    float _2906 = -_2904;
    float _2908 = _2896 + _2906;
    float _2910 = -_2904;
    float _2912 = _2894 + _2910;
    float _2914 = -_2904;
    float _2916 = _2898 + _2914;
    float _2918 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2920 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    float _2922 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    float _2924 = fma(_2916, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    out.m_95.w = _2918;
    out.m_101.x = _2920;
    out.m_101.y = _2922;
    out.m_101.z = _2924;
    if (!_2892)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2926 = -_1692;
    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2930 = -_1696;
    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2934 = -_1700;
    float _2936 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2938 = _2928 * _2928;
    float _2940 = fma(_2932, _2932, _2938);
    float _2942 = fma(_2936, _2936, _2940);
    float _2944 = sqrt(_2942);
    float _2946 = rsqrt(_2942);
    float _2948 = -_2944;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2952 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2954 = precise::clamp(_2952, 0.0, 1.0);
    float _2956 = _2932 * _2946;
    float _2958 = _2928 * _2946;
    float _2960 = abs(_2954);
    float _2962 = log2(_2960);
    float _2964 = _2936 * _2946;
    float _2966 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2968 = _1584 * _2958;
    float _2970 = -_2958;
    float _2972 = -_2966;
    float _2974 = fma(_2970, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2972);
    float _2976 = fma(_1582, _2956, _2968);
    float _2978 = -_2964;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2974);
    float _2982 = fma(_1586, _2964, _2976);
    float _2984 = precise::clamp(_2982, 0.0, 1.0);
    float _2986 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2988 = _2980 + _2986;
    float _2990 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2992 = _2988 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2994 = precise::clamp(_2992, 0.0, 1.0);
    float _2996 = exp2(_2990);
    float _2998 = _2996 * _2994;
    float _3000 = _2984 * _2998;
    float _3002 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3004 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3006 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _3002;
    out.m_99.y = _3004;
    out.m_99.z = _3006;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2778 = false;
    bool _1632 = false;
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
        float _3063 = as_type<float>(_136);
        out.gl_Position.z = _3063;
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
        float _3132 = as_type<float>(_174);
        out.gl_Position.z = _3132;
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
    float _328 = in.m_67.w;
    float _330 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _332 = in.m_69.y;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _336 = _334 != 0;
    float _338 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _330);
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _342 = _340 != 0;
    float _344 = in.m_67.z;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _346;
    float _350 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _352 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _354 = in.m_67.y;
    float _356 = 1.0 / _348;
    float _358 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _350);
    float _360 = in.m_71.x;
    float _362 = in.m_71.y;
    float _364 = in.m_71.z;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = in.m_67.x;
    float _372 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _374 = 1.0 / _368;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _326 + _376;
    bool _380 = _328 > 0.5;
    float _382 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _386 = _326 + _384;
    float _388 = -_332;
    float _390 = _388 + 1.0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _358);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _414 = _332;
    if (_336)
    {
        float _416 = _380 ? _390 : _332;
        _414 = _416;
    }
    float _418 = _414;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _424 = 1.0 / _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _426;
    float _430 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _432 = _364 + _354;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _436 = _326 + _434;
    float _438 = _378 * _374;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _442 = _326 + _440;
    float _444 = 1.0 / _422;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _450 = _344 * 2.0;
    float _452 = _370 + _360;
    float _454 = _370 * 2.0;
    float _456 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _432);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _326 + _458;
    float _462 = 1.0 / _408;
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _452);
    float _466 = _436 * _424;
    float _468 = _354 * 2.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _472 = _326 + _470;
    float _474 = _442 * _356;
    float _476 = _354 + _344;
    float _478 = floor(_450);
    float _480 = _386 * _444;
    float _482 = _370 + _344;
    float _484 = _476 + (-1.0);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _488 = _482 + (-1.0);
    float _490 = 1.0 / _428;
    float _492 = _460 * _462;
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _498 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _500 = _352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _502 = _478 > 0.0;
    float _504 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _508 = _478 >= 0.0;
    bool _510 = isnan(_478);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = floor(_454);
    float _520 = in.m_73.x;
    float _522 = in.m_73.y;
    float _524 = in.m_73.z;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    int _530 = _516 ? 0 : 1;
    float _532 = _472 * _490;
    out.m_75.x = _494;
    out.m_75.y = _504;
    out.m_75.z = _506;
    float _534 = fma(_528, _474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _536 = floor(_468);
    float _538 = in.m_77.x;
    float _540 = in.m_77.y;
    float _542 = in.m_77.z;
    float _544 = in.m_77.w;
    float _546 = _370 + _354;
    int _548 = ~_530;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _558 = _552;
    float _560 = _522;
    if (!_502)
    {
        int _562 = ~_530;
        int _564 = _562 + 1;
        _558 = _564;
    }
    int _566 = _558;
    float _568 = _546 + (-1.0);
    float _570 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _572 = log2(_570);
    bool _574 = _518 >= 0.0;
    bool _576 = isnan(_518);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _586 = fma(_556, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _588 = _582 ? 0 : 1;
    float _590 = _404 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _592 = _518 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _594;
    bool _598 = _536 > 0.0;
    float _600 = _456 * 15.0;
    bool _602 = _536 >= 0.0;
    bool _604 = isnan(_536);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = fma(_596, _474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _614 = _430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _616 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _618 = isnan(_326);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = _354 + (-0.5);
    float _630 = _520 * _542;
    float _632 = _524 * _540;
    float _634 = _522 * _538;
    bool _636 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _638 = isnan(_326);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_630;
    float _650 = fma(_524, _538, _648);
    float _652 = -_632;
    float _654 = fma(_522, _542, _652);
    float _656 = -_634;
    float _658 = fma(_520, _540, _656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _660;
    float _664 = _650 * _544;
    float _666 = _654 * _544;
    float _668 = _658 * _544;
    float _670 = fma(_662, _474, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _680 = -_626;
    float _682 = _680 + 1.0;
    float _684 = fma(_674, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _710 = fma(_692, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _712 = fma(_700, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _714 = fma(_678, _438, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _716 = fma(_708, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _718 = _572 * _154;
    float _720 = fma(_688, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _722 = fma(_696, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _724 = fma(_704, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _726;
    float _730 = exp2(_718);
    bool _732 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _734 = isnan(_326);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _744;
    float _748 = fma(_728, _532, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _750;
    bool _754 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _756 = isnan(_326);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -_742;
    float _768 = _766 + 1.0;
    float _770 = fma(_746, _532, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _772 = ~_588;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = fma(_752, _532, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _780 = _776;
    float _782 = _710;
    if (!_592)
    {
        int _784 = ~_588;
        int _786 = _784 + 1;
        _780 = _786;
    }
    int _788 = _780;
    float _790 = _764 * _768;
    bool _792 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _794 = isnan(_326);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -_764;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _812 = -_730;
    float _814 = _812 + 1.0;
    float _816 = _802 * _806;
    float _818 = -_802;
    float _820 = _818 + 1.0;
    bool _822 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _824 = isnan(_326);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _836 = 1.0 + _834;
    bool _838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = _626 * _820;
    bool _850 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _852 = isnan(_326);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _836;
    float _864 = -_832;
    float _866 = _864 + 1.0;
    float _868 = _846 ? _814 : 0.0;
    float _870 = _832 * _682;
    bool _872 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _874 = isnan(1.0);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _880 = _876 || _878;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _886 = _860 * _866;
    float _888 = -_860;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _896 = fma(_884, _480, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _898 = in.m_79.x;
    float _900 = _646 * _890;
    float _902 = -_646;
    float _904 = _902 + 1.0;
    float _906 = fma(_894, _480, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _908 = _610 ? 0 : 1;
    float _910 = _612 * _900;
    float _912 = _534 * _900;
    if (_880)
    {
        float _914 = _868 * _862;
        _158 = _914;
    }
    float _916 = _158;
    float _918 = _670 * _900;
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].x, _910);
    float _922 = _464 * 7.5;
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].y, _912);
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].z, _918);
    float _928 = _522 * _522;
    float _930 = _922 * 0.15915493667125701904296875;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _500 + _932;
    bool _936 = !_398;
    int _938 = _936 ? 0 : 1;
    float _940 = fma(_520, _520, _928);
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _590 + _942;
    float _946 = _934 * _934;
    float _948 = fma(_810, _480, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _950 = _930 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = fma(_524, _524, _940);
    int _956 = abs(_938);
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _960 = _614 + _958;
    float _962 = fma(_944, _944, _946);
    float _964 = _600 * 0.15915493667125701904296875;
    int _966 = ~_908;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = in.m_81.x;
    float _974 = in.m_81.y;
    float _976 = in.m_81.z;
    int _978 = _970;
    float _980 = _916;
    if (!_598)
    {
        int _982 = ~_908;
        int _984 = _982 + 1;
        _978 = _984;
    }
    int _986 = _978;
    float _988 = fma(_684, _886, _920);
    float _990 = fma(_960, _960, _962);
    float _992 = fma(_586, _886, _924);
    float _994 = float(_956);
    float _996 = _964 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = float(_788);
    float _1002 = fma(_714, _886, _926);
    float _1004 = _952 * 0.07999999821186065673828125;
    float _1006 = fma(_722, _870, _992);
    float _1008 = float(_566);
    float _1010 = _994 * _1000;
    float _1012 = fma(_1004, _898, _362);
    float _1014 = rsqrt(_990);
    float _1016 = fma(_720, _870, _988);
    float _1018 = fma(_724, _870, _1002);
    float _1020 = _1010 * (-2.0);
    bool _1022 = !_402;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = fma(_712, _848, _1006);
    bool _1028 = !_394;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = fma(_496, _1020, _496);
    float _1034 = rsqrt(_954);
    int _1036 = abs(_1024);
    float _1038 = fma(_1020, _974, _974);
    int _1040 = abs(_1030);
    float _1042 = _998 * 0.02999999932944774627685546875;
    float _1044 = float(_1036);
    float _1046 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1038);
    float _1048 = float(_1040);
    float _1050 = _934 * _1014;
    float _1052 = _944 * _1014;
    float _1054 = _960 * _1014;
    float _1056 = float(_986);
    float _1058 = -_1050;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1062 = -_1052;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1066 = _1048 * _1008;
    float _1068 = -_1054;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _1072 = _1034 * _1042;
    float _1074 = _1060 * _1060;
    float _1076 = _1044 * _1056;
    float _1078 = fma(_1032, _916, _1046);
    float _1080 = fma(_520, _1072, _360);
    float _1082 = fma(_1064, _1064, _1074);
    float _1084 = fma(_522, _1072, _1012);
    float _1086 = fma(_524, _1072, _364);
    float _1088 = _1066 * (-2.0);
    float _1090 = in.m_69.x;
    float _1092 = fma(_1070, _1070, _1082);
    float _1094 = _1076 * (-2.0);
    float _1096 = _370 + (-0.5);
    float _1098 = fma(_1088, _972, _972);
    float _1100 = fma(_584, _1088, _584);
    bool _1102 = _344 > 0.5;
    bool _1104 = _1102 && _342;
    float _1106 = fma(_1094, _976, _976);
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1098);
    float _1110 = fma(_498, _1094, _498);
    float _1112 = _344 + (-0.5);
    float _1114 = fma(_710, _848, _1016);
    float _1116 = fma(_1100, _916, _1108);
    bool _1118 = _1084 != 0.0;
    bool _1120 = isnan(_1084);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1106);
    float _1130 = fma(_716, _848, _1018);
    float _1132 = _1116 * 0.15915493667125701904296875;
    bool _1134 = _1080 == 0.0;
    bool _1136 = !_1126;
    bool _1138 = _1134 && _1136;
    float _1140 = in.m_65.x;
    float _1142 = in.m_65.y;
    float _1144 = in.m_65.z;
    float _1146 = fma(_1110, _916, _1128);
    float _1148 = _1078 * 0.15915493667125701904296875;
    float _1150 = sqrt(_1092);
    bool _1152 = _1086 == 0.0;
    bool _1154 = _1152 && _1138;
    float _1156 = _1146 * 0.15915493667125701904296875;
    float _1158 = _972;
    float _1160 = _1090;
    float _1162 = _1098;
    float _1164 = _1100;
    if (!_342)
    {
        _1158 = _1090;
    }
    float _1166 = _1158;
    float _1168 = _1166;
    if (_1104)
    {
        float _1170 = -_1090;
        float _1172 = _1170 + 1.0;
        _1160 = _1172;
    }
    float _1174 = _1160;
    float _1176 = fma(_778, _816, _1130);
    float _1178 = fma(_770, _816, _1026);
    float _1180 = fma(_748, _816, _1114);
    float _1182 = _1148 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    if (_342)
    {
        _1168 = _1174;
    }
    float _1186 = _1168;
    float _1188 = fma(_948, _790, _1176);
    float _1190 = fma(_906, _790, _1178);
    float _1192 = fma(_896, _790, _1180);
    float _1194 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1188);
    float _1196 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1190);
    float _1198 = _1132 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1192);
    if (_1154)
    {
        _980 = _520;
    }
    float _1204 = _980;
    float _1206 = _1204;
    if (!_1154)
    {
        float _1208 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[17].y, _520);
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = _1196 * _1142;
    float _1214 = _1202 * _1140;
    float _1216 = _1014 * _1150;
    float _1218 = _1132 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1224 = _1194 * _1144;
    if (!_1154)
    {
        float _1226 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _560 = _1226;
    }
    float _1228 = _560;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1084);
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _1148 * 6.283185482025146484375;
    float _1238 = cos(_1236);
    float _1240 = _1200 * _1184;
    float _1242 = _1216 * _1234;
    float _1244 = _1156 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1220 * _1184;
    float _1250 = _1156 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = _1200 * _1238;
    float _1256 = _1220 * _1238;
    float _1258 = _1200 * _1246;
    float _1260 = _1238 * _1246;
    float _1262 = _1220 * _1246;
    float _1264 = _1184 * _1246;
    float _1266 = _1216 * _1222;
    float _1268 = _1216 * _1230;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1080);
    float _1272 = _1262 * _540;
    float _1274 = _1232 * _1266;
    float _1276 = -_1240;
    float _1278 = fma(_1252, _1256, _1276);
    float _1280 = -_1256;
    float _1282 = fma(_1252, _1240, _1280);
    float _1284 = _1270 * _1268;
    float _1286 = fma(_1252, _1254, _1248);
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1086);
    float _1290 = _1258 * _1274;
    float _1292 = -_1274;
    float _1294 = _1252 * _1292;
    float _1296 = _1262 * _1274;
    float _1298 = _1288 * _1242;
    float _1300 = fma(_1286, _1284, _1290);
    float _1302 = fma(_1260, _1284, _1294);
    float _1304 = fma(_1278, _1284, _1296);
    float _1306 = fma(_1252, _1248, _1254);
    float _1308 = fma(_1282, _1298, _1300);
    float _1310 = _1254;
    if (_1154)
    {
        _1310 = _524;
    }
    float _1312 = _1310;
    float _1314 = _1312;
    if (!_1154)
    {
        float _1316 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _1314 = _1316;
    }
    float _1318 = _1314;
    float _1320 = fma(_1264, _1298, _1302);
    float _1322 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1326 = -_1228;
    float _1328 = _1252 * _1326;
    float _1330 = fma(_1306, _1298, _1304);
    float _1332 = -_664;
    float _1334 = _1252 * _1332;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1324);
    float _1340 = -_540;
    float _1342 = _1252 * _1340;
    float _1344 = fma(_1260, _1210, _1328);
    float _1346 = fma(_1260, _666, _1334);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1336);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1338);
    float _1352 = fma(_1260, _538, _1342);
    float _1354 = _1258 * _540;
    float _1356 = _590 + _1348;
    float _1358 = _614 + _1350;
    float _1360 = _1258 * _1228;
    float _1362 = _1262 * _1228;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1366 = _1356 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1370 = _1358 + _1368;
    float _1372 = _1258 * _664;
    float _1374 = _1262 * _664;
    float _1376 = _1366 * _1366;
    float _1378 = _1370 * _1370;
    float _1380 = fma(_1286, _1210, _1360);
    float _1382 = fma(_1286, _538, _1354);
    float _1384 = fma(_1286, _666, _1372);
    float _1386 = _1376 + _1378;
    float _1388 = fma(_1278, _1210, _1362);
    float _1390 = fma(_1278, _538, _1272);
    float _1392 = fma(_1278, _666, _1374);
    float _1394 = sqrt(_1386);
    float _1396 = fma(_1264, _1318, _1344);
    float _1398 = fma(_1264, _542, _1352);
    float _1400 = fma(_1282, _1318, _1380);
    float _1402 = fma(_1282, _542, _1382);
    float _1404 = fma(_1306, _1318, _1388);
    float _1406 = fma(_1306, _542, _1390);
    float _1408 = fma(_1306, _668, _1392);
    float _1410 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = fma(_1264, _668, _1346);
    float _1414 = fma(_1282, _668, _1384);
    float _1416 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1418 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1422 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1424 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1426 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1418);
    float _1430 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1422);
    float _1432 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1416);
    float _1434 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1424);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1438 = _500 + _1428;
    float _1440 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1444 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1440);
    float _1448 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1442);
    float _1450 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1444);
    float _1452 = _1422;
    float _1454 = _1376;
    float _1456 = _1378;
    float _1458 = _1356;
    float _1460 = _1358;
    float _1462 = _1446;
    if (!_1426)
    {
        _1452 = _1438;
    }
    float _1464 = _1452;
    bool _1466 = !_1426;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1394 + _1472;
        float _1476 = rsqrt(_1386);
        float _1478 = _1474 * _1470;
        float _1480 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1482 = _1478 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = cos(_1488);
        float _1492 = fma(_1486, _1480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1494 = _1476 * _1492;
        float _1496 = _1490 + (-1.0);
        float _1498 = fma(_1366, _1494, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1500 = fma(_1370, _1494, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1502 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1506 = _1498 + _1504;
        float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1510 = _1500 + _1508;
        float _1512 = fma(_1438, _1490, _1502);
        float _1514 = _1506 * _1506;
        float _1516 = _1510 * _1510;
        _1468 = _1512;
        _1454 = _1514;
        _1456 = _1516;
        _1458 = _1498;
        _1460 = _1500;
    }
    float _1518 = _1468;
    float _1520 = _1454;
    float _1522 = _1456;
    float _1524 = _1458;
    float _1526 = _1460;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1530 = _1518 + _1528;
    float _1532 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1534 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1536 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1538 = fma(_1530, _1530, _1520);
    float _1540 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1532);
    float _1542 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1534);
    float _1544 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1536);
    float _1546 = _1538 + _1522;
    float _1548 = _418 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1550 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1552 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1432);
    float _1554 = _1548 * _1436;
    float _1556 = sqrt(_1546);
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1430);
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1566 = _1550 * _1420;
    float _1568 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1434);
    float _1570 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1540);
    float _1574 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1542);
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1544);
    float _1582 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1446);
    float _1584 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1448);
    float _1586 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1450);
    out.m_83.x = _1576;
    out.m_83.y = _1570;
    out.m_83.z = _1578;
    bool _1588 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1590 = isnan(_1556);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1596 = _1592 || _1594;
    out.m_85.z = _1566;
    out.m_85.w = _1554;
    out.m_87.x = _1562;
    out.m_87.y = _1552;
    out.m_87.z = _1568;
    out.m_89.x = _1572;
    out.m_89.y = _1574;
    out.m_89.z = _1580;
    if (!_1596)
    {
        _1462 = 1.0;
    }
    float _1598 = _1462;
    out.m_91.x = _1582;
    out.m_91.y = _1584;
    out.m_91.z = _1586;
    bool _1600 = !_1596;
    float _1602 = _1598;
    if (!_1600)
    {
        bool _1604 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1606 = isnan(_1556);
        bool _1608 = _1604 || _1606;
        bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1612 = _1608 || _1610;
        if (!_1612)
        {
            float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1616 = _1556 + _1614;
            float _1618 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1620 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1618;
            float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1624 = _1622 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1626 = 1.0 / _1620;
            float _1628 = _1616 * _1626;
            float _1630 = fma(_1628, _1624, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1602 = _1630;
            _1632 = true;
        }
        else
        {
            bool _1634 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1636 = isnan(_1556);
            bool _1638 = _1634 || _1636;
            bool _1640 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1642 = _1638 || _1640;
            if (!_1642)
            {
                float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1646 = _1556 + _1644;
                float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1650 = _1648 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1654 = _1652 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1656 = 1.0 / _1650;
                float _1658 = _1646 * _1656;
                float _1660 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1602 = _1660;
                _1632 = true;
            }
            else
            {
                _1602 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1632 = false;
    float _1662 = _1602;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1666 = _1518 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1670 = _1524 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1674 = _1526 + _1672;
    float _1676 = -_1050;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _1680 = fma(_1666, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1682 = fma(_1670, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1684 = fma(_1674, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1686 = -_1052;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _1690 = -_1050;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1694 = -_1052;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1698 = -_1054;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1684);
    float _1702 = -_1054;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _614);
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1708 = _1692 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1696 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1700 + _1714;
    float _1718 = _1708 * _1708;
    float _1720 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = fma(_1712, _1712, _1718);
    float _1724 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1726 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1728 = fma(_1716, _1716, _1722);
    float _1730 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1724);
    float _1732 = _1678 + _1726;
    float _1734 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1736 = rsqrt(_1728);
    float _1738 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1730);
    float _1740 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1744 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1740);
    float _1748 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1742);
    float _1750 = floor(_1734);
    float _1752 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1746);
    float _1754 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1748);
    float _1756 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1758 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1760 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1764 = 1.0 / _1744;
    float _1766 = _1756 + _1744;
    float _1768 = _1712 * _1760;
    float _1770 = _1716 * _1760;
    float _1772 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1762);
    float _1774 = _1768 * _1768;
    float _1776 = _1770 * _1770;
    float _1778 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1772);
    float _1780 = sqrt(_1728);
    float _1782 = _1774 + _1776;
    float _1784 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1786 = _1766 * _1764;
    float _1788 = _1786 * 0.5;
    float _1790 = sqrt(_1782);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1794 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1792);
    float _1796 = 1.0 / _1794;
    bool _1798 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = trunc(_1758);
    int _1802 = int(_1800);
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1790 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1810 = _1796 * _1808;
    float _1812 = trunc(_1784);
    int _1814 = int(_1812);
    bool _1816 = _1810 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1818 = _1810 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1820 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1822 = _1678;
    int _1824 = 2;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1828 = _1782;
    float _1830 = _1768;
    float _1832 = _1774;
    float _1834 = _1784;
    if (_1798)
    {
        float _1836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    int _1840 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1842 = _1802 + _1840;
    int _1844 = _1842 + 1;
    bool _1846 = !_1816;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1852 = _1814 + _1850;
    int _1854 = _1852 + 1;
    float _1856 = floor(_1820);
    float _1858 = as_type<float>(_1814);
    uint _1861 = uint(_1844);
    if (!_1816)
    {
        _1824 = 1;
    }
    int _1863 = _1824;
    int _1865 = _1863;
    if (!_1818)
    {
        _1865 = _1848;
    }
    int _1867 = _1865;
    bool _1869 = _1844 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1798)
    {
        float _1871 = _1806 * _1838;
        _1826 = _1871;
    }
    float _1873 = _1826;
    if (_1798)
    {
        float _1875 = rsqrt(_1782);
        _1828 = _1875;
    }
    float _1877 = _1828;
    int _1879 = _1867 << 6;
    float _1881 = _1877;
    int _1883 = _1879;
    if (_1798)
    {
        float _1885 = _1873 * 0.15915493667125701904296875;
        _1858 = _1885;
    }
    float _1887 = _1858;
    int _1889 = _1844 | _1854;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1893 = _1879 + 48;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    bool _1911 = _1889 < 0;
    bool _1913 = _1911 || _1869;
    float _1915 = _1806;
    if (_1798)
    {
        float _1917 = _1887 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = precise::max(0.0, _1891);
    float _1925 = -_1856;
    float _1927 = _1820 + _1925;
    bool _1929 = _1854 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1931 = _1929 || _1913;
    int _1933 = _1879 + 64;
    uint _1935 = uint(int(uint(_1933) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[int(_1945)][_1947];
    float _1951 = -_1760;
    float _1953 = -_1923;
    float _1955 = fma(_1708, _1951, _1953);
    float _1957 = _1394;
    float _1959 = _1923;
    float _1961 = _1955;
    if (_1798)
    {
        float _1963 = _1887 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        _1957 = _1965;
    }
    float _1967 = _1957;
    if (_1798)
    {
        float _1969 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1969;
    }
    float _1971 = _1959;
    int _1973 = _1879 + 96;
    uint _1975 = uint(int(uint(_1973) >> uint(2)));
    uint _1977 = uint(int(uint(int(_1975)) >> uint(2)));
    int _1979 = int(_1975) & 3;
    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
    int _1983 = int(_1975) + 1;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    int _1987 = _1983 & 3;
    float _1989 = (*spvDescriptorSet0.vp_c15)._m0[int(_1985)][_1987];
    if (!_1931)
    {
        int _1991 = _1854 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1993 = _1991 + _1844;
        _1861 = uint(_1993);
    }
    uint _1995 = _1861;
    if (_1798)
    {
        float _1997 = fma(_1921, _1971, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1162 = _1997;
    }
    float _1999 = _1162;
    int _2001 = _1879 + 80;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[int(_2013)][_2015];
    if (_1798)
    {
        float _2019 = _1877 * _1999;
        _1881 = _2019;
    }
    float _2021 = _1881;
    float _2023 = _1967;
    if (_1798)
    {
        float _2025 = _1967 + (-1.0);
        _782 = _2025;
    }
    float _2027 = _782;
    if (_1798)
    {
        float _2029 = _1768 * _2021;
        _1830 = _2029;
    }
    float _2031 = _1830;
    if (_1798)
    {
        float _2033 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1164 = _2033;
    }
    float _2035 = _1164;
    int _2037 = _1879 + 104;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    uint _2041 = uint(int(uint(int(_2039)) >> uint(2)));
    int _2043 = int(_2039) & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    int _2047 = int(_2039) + 1;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    int _2051 = _2047 & 3;
    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[int(_2049)][_2051];
    float _2055 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    if (_1798)
    {
        float _2057 = _2031 * _2031;
        _1832 = _2057;
    }
    float _2059 = _1832;
    if (_1798)
    {
        float _2061 = fma(_1955, _1967, _2035);
        _1961 = _2061;
    }
    float _2063 = _1961;
    if (!_1798)
    {
        _2023 = _1770;
    }
    float _2065 = _2023;
    float _2067 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2069 = _2065;
    float _2071 = _2067;
    if (_1798)
    {
        float _2073 = _1770 * _2021;
        _2069 = _2073;
    }
    float _2075 = _2069;
    float _2077 = fma(_2063, _2063, _2059);
    int _2079 = _1879 + 72;
    uint _2081 = uint(int(uint(_2079) >> uint(2)));
    uint _2083 = uint(int(uint(int(_2081)) >> uint(2)));
    int _2085 = int(_2081) & 3;
    float _2087 = (*spvDescriptorSet0.vp_c15)._m0[int(_2083)][_2085];
    int _2089 = int(_2081) + 1;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    int _2093 = _2089 & 3;
    float _2095 = (*spvDescriptorSet0.vp_c15)._m0[int(_2091)][_2093];
    float _2097 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1798)
    {
        _2071 = _1776;
    }
    float _2099 = _2071;
    float _2101 = _2099;
    if (_1798)
    {
        float _2103 = _2075 * _2075;
        _2101 = _2103;
    }
    float _2105 = _2101;
    float _2107 = _2035;
    if (!_1931)
    {
        float _2109 = floor(_1784);
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2115 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2117 = _2077 + _2105;
    int _2119 = _1879 + 56;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    float _2137 = _1732 * _1909;
    float _2139 = -_2115;
    float _2141 = fma(_2139, _2113, 1.0);
    int _2143 = as_type<int>(_2115);
    float _2145 = _1909;
    if (!_1931)
    {
        uint _2147 = uint(int(uint(int(_1995)) >> uint(2)));
        _2143 = int(_2147);
    }
    int _2149 = _2143;
    float _2151 = -_1750;
    float _2153 = _1734 + _2151;
    float _2155 = fma(_1688, _1901, _2137);
    float _2157 = rsqrt(_2117);
    int _2159 = _1879 + 88;
    uint _2161 = uint(int(uint(_2159) >> uint(2)));
    uint _2163 = uint(int(uint(int(_2161)) >> uint(2)));
    int _2165 = int(_2161) & 3;
    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
    int _2169 = int(_2161) + 1;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    int _2173 = _2169 & 3;
    float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
    float _2177 = _1732 * _1949;
    if (!_1931)
    {
        float _2179 = -_2111;
        float _2181 = _1784 + _2179;
        _2145 = _2181;
    }
    float _2183 = _2145;
    float _2185 = log2(_2141);
    float _2187 = _1732 * _1989;
    if (!_1931)
    {
        int _2189 = int(_1995) << 2;
        _1883 = _2189;
    }
    int _2191 = _1883;
    float _2193 = fma(_1688, _1981, _2187);
    int _2195 = _2191;
    if (!_1931)
    {
        int _2197 = 12 & _2191;
        _2195 = _2197;
    }
    int _2199 = _2195;
    float _2201 = _2157 * _2031;
    float _2203 = _1732 * _2017;
    float _2205 = fma(_1688, _1941, _2177);
    if (!_1931)
    {
        int _2207 = _2149 << 4;
        int _2209 = _2207 + _2199;
        _1834 = as_type<float>(_2209);
    }
    float _2211 = _1834;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2215 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2213);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = fma(_1688, _2009, _2203);
    float _2221 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2223 = _2157 * _2075;
    float _2225 = -_2217;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_1704, _2045, _2193);
    float _2231 = _2185 * 0.693147182464599609375;
    float2 _6501 = float2(_1927, _2153);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6501, float2(0.0), isnan(_6501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6501, float2(0.0), isnan(_6501)), level(0.0)).x;
    float _2235 = _2211;
    if (!_1931)
    {
        int _2237 = as_type<int>(_2211) + 400;
        uint _2239 = uint(int(uint(_2237) >> uint(2)));
        uint _2241 = uint(int(uint(int(_2239)) >> uint(2)));
        int _2243 = int(_2239) & 3;
        float _2245 = (*spvDescriptorSet0.vp_c15)._m0[int(_2241)][_2243];
        _2235 = _2245;
    }
    float _2247 = _2235;
    float _2249 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2251 = fma(_1704, _2087, _2205);
    float _2253 = _2229 + _2053;
    float _2255 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2257 = _2157 * _2063;
    float _2259 = _2251 + _2095;
    float _2261 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2263 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2255);
    float _2265 = 1.0 / _2253;
    float _2267 = fma(_1704, _2127, _2155);
    float _2269 = -_2221;
    float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2269);
    float _2273 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2263);
    float _2275 = _2267 + _2135;
    float _2277 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2279 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2281 = abs(_2227);
    float _2283 = log2(_2281);
    float _2285 = fma(_1704, _2167, _2219);
    float _2287 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2277);
    float _2289 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2261);
    float _2291 = -_2223;
    float _2293 = fma(_2291, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2271);
    float _2295 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2287);
    float _2297 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2289);
    float _2299 = _2275 * _2265;
    float _2301 = fma(_2293, -0.5, 0.5);
    float _2303 = _2295 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2305 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2307 = fma(_2293, 0.5, 0.5);
    bool _2309 = _2299 >= 0.0;
    float _2311 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2313 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2305);
    float _2315 = _2259 * _2265;
    float _2317 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2319 = _2299 <= 1.0;
    bool _2321 = _2319 && _2309;
    float _2323 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2313);
    float _2325 = sqrt(_2301);
    float _2327 = _2285 + _2175;
    bool _2329 = _2315 >= 0.0;
    bool _2331 = _2329 && _2321;
    float _2333 = _2257 + 1.0;
    float _2335 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2337 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2339 = _2315 <= 1.0;
    bool _2341 = _2339 && _2331;
    float _2343 = exp2(_2317);
    float _2345 = _2261;
    float _2347 = _2257;
    if (!_1931)
    {
        float _2349 = floor(_1758);
        _2345 = _2349;
    }
    float _2351 = _2345;
    float _2353 = _2325 * 0.636619746685028076171875;
    float _2355 = fma(_2307, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2357 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2323);
    float _2359 = fma(_2307, _2355, -0.212114393711090087890625);
    float _2361 = 1.0 / _2357;
    float _2363 = -_2257;
    float _2365 = fma(_2343, _2333, _2363);
    float _2367 = _2357;
    if (_2341)
    {
        float _2369 = float(_1867);
        _2347 = _2369;
    }
    float _2371 = _2347;
    float _2373 = fma(_2307, _2359, 1.570728778839111328125);
    float _2375 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2335);
    float _2377 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2337);
    float _2379 = fma(_2365, 0.5, 0.5);
    float _2381 = -_2373;
    float _2383 = fma(_2353, _2381, 1.0);
    float _2385 = _2371;
    if (_2341)
    {
        float _2387 = rint(_2371);
        float _2389 = precise::max(_2387, 0.0);
        uint _2391 = uint(_2389);
        uint _2393 = clamp(_2391, 0u, 65535u);
        _2385 = as_type<float>(_2393);
    }
    float _2395 = _2385;
    float _2397 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2375);
    float _2399 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2377);
    float _2401 = _2351;
    if (!_1931)
    {
        float _2403 = -_2351;
        float _2405 = _1758 + _2403;
        _2401 = _2405;
    }
    float _2407 = _2401;
    float _2409 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2397);
    float _2411 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2399);
    float _2413 = _2327 * _2265;
    float _2415 = _2409 * _2361;
    float _2417 = _2411 * _2361;
    float _2419 = _2265;
    if (!_1931)
    {
        float _2421 = rint(_2247);
        float _2423 = precise::max(_2421, 0.0);
        uint _2425 = uint(_2423);
        uint _2427 = clamp(_2425, 0u, 65535u);
        _2419 = as_type<float>(_2427);
    }
    float _2429 = _2419;
    float _2431 = fma(_2415, 0.5, 0.5);
    float _2433 = fma(_2417, -0.5, 0.5);
    float _2435 = _2157;
    if (_2341)
    {
        float3 _6848 = float3(_2299, _2315, float(as_type<int>(_2395)));
        float3 _6852 = select(_6848, float3(0.0), isnan(_6848));
        float _2437 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6852.xy, uint(rint(_6852.z)), _2413, level(0.0));
        _2435 = _2437;
    }
    float _2439 = _2435;
    float3 _6862 = float3(_2431, _2433, _2249);
    float _2441 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6862, float3(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6862, float3(0.0), isnan(_6862)), level(0.0)).x;
    float3 _6871 = float3(_2431, _2433, _2249);
    float4 _2444 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6871, float3(0.0), isnan(_6871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6871, float3(0.0), isnan(_6871)), level(0.0)).xyzw;
    float _2446 = _2444.x;
    float _2448 = _2444.y;
    float _2450 = _2444.z;
    float _2452 = _2444.w;
    float2 _6887 = float2(_2383, _2379);
    float3 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6887, float2(0.0), isnan(_6887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6887, float2(0.0), isnan(_6887)), level(0.0)).xyz;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = _2429;
    if (!_1931)
    {
        float3 _6908 = float3(_2407, _2183, float(as_type<int>(_2429)));
        float3 _6910 = select(_6908, float3(0.0), isnan(_6908));
        float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6910.xy, uint(rint(_6910.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6910.xy, uint(rint(_6910.z)), level(0.0)).x;
        _2464 = _2466;
    }
    float _2468 = _2464;
    float _2470 = abs(_1810);
    float _2472 = log2(_2470);
    float _2474 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2476 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2474);
    float _2478 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2476);
    bool _2480 = _1810 <= 8000.0;
    bool _2482 = isnan(_1810);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan(8000.0);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    float _2494 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2496 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2498 = exp2(_2494);
    out.gl_Position.x = _2409;
    out.gl_Position.y = _2411;
    out.gl_Position.z = _2492;
    out.gl_Position.w = _2357;
    float _2500 = exp2(_2496);
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = fma(_2504, -2.0, 3.0);
    float _2508 = _2504 * _2504;
    float _2510 = _2508 * _2506;
    float _2512 = _2492 + _2357;
    float _2514 = -_2498;
    float _2516 = _2514 + 1.0;
    float _2518 = _2512 * 0.5;
    float _2520 = -_2510;
    float _2522 = _2520 + 1.0;
    float _2524 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.z = _2518;
    out.m_93.w = _2357;
    float _2526 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2510);
    float _2528 = _2490 * _2526;
    float _2530 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2532 = _2528;
    float _2534 = _2530;
    float _2536 = _2492;
    if (!_2341)
    {
        _2532 = 1.0;
    }
    float _2538 = _2532;
    float _2540 = -_2233;
    float _2542 = _2540 + 1.0;
    float _2544 = _2542 * _2530;
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    float _2548 = _2538;
    if (_1931)
    {
        _2534 = 1.0;
    }
    float _2550 = _2534;
    float _2552 = _2550;
    if (_2341)
    {
        bool _2554 = _2439 >= _2413;
        bool _2556 = isnan(_2439);
        bool _2558 = _2554 || _2556;
        bool _2560 = isnan(_2413);
        bool _2562 = _2558 || _2560;
        float _2564 = float(_2562);
        _2548 = _2564;
    }
    float _2566 = _2548;
    if (!_1931)
    {
        int _2568 = int(_1995) << 4;
        int _2570 = _2568 + 2048;
        uint _2572 = uint(int(uint(_2570) >> uint(2)));
        uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
        int _2576 = int(_2572) & 3;
        float _2578 = (*spvDescriptorSet0.vp_c15)._m0[int(_2574)][_2576];
        int _2580 = int(_2572) + 1;
        uint _2582 = uint(int(uint(_2580) >> uint(2)));
        int _2584 = _2580 & 3;
        float _2586 = (*spvDescriptorSet0.vp_c15)._m0[int(_2582)][_2584];
        int _2588 = _2570 + 8;
        uint _2590 = uint(int(uint(_2588) >> uint(2)));
        uint _2592 = uint(int(uint(int(_2590)) >> uint(2)));
        int _2594 = int(_2590) & 3;
        float _2596 = (*spvDescriptorSet0.vp_c15)._m0[int(_2592)][_2594];
        int _2598 = int(_2590) + 1;
        uint _2600 = uint(int(uint(_2598) >> uint(2)));
        int _2602 = _2598 & 3;
        float _2604 = (*spvDescriptorSet0.vp_c15)._m0[int(_2600)][_2602];
        float _2606 = _1732 * _2586;
        float _2608 = fma(_1688, _2578, _2606);
        float _2610 = fma(_1704, _2596, _2608);
        float _2612 = _2610 + _2604;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        float _2616 = -_2614;
        float _2618 = _2616 + _2468;
        float _2620 = fma(_2618, 500.0, 1.5);
        float _2622 = exp2(_2620);
        float _2624 = 0.0 + _2622;
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        _2552 = _2626;
    }
    float _2628 = _2552;
    float _2630 = _2566 * _2628;
    float _2632 = _2524 * _2441;
    float _2634 = -_2546;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2638 = -_2524;
    float _2640 = _2638 + 1.0;
    bool _2642 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2644 = isnan(_1780);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2650 = _2646 || _2648;
    float _2652 = _2452 * _2632;
    float _2654 = -_2630;
    float _2656 = fma(_2654, _2636, 1.0);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = _2462 * _2632;
    float _2662 = _2452 * _2640;
    float _2664 = fma(_2458, _2652, _2446);
    float _2666 = fma(_2460, _2652, _2448);
    float _2668 = _2658 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = fma(_2452, _2660, _2450);
    out.m_95.x = _2668;
    float _2672 = _2652;
    float _2674 = _2640;
    float _2676 = _2636;
    float _2678 = _2658;
    if (!_2650)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2680 = _2367;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2650)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2686 = _2536;
    out.m_97.x = _2664;
    out.m_97.y = _2666;
    out.m_97.z = _2670;
    out.m_97.w = _2662;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2650)
    {
        _2672 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2692 = _2672;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2650)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2698 = _2674;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2650)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2704 = _2676;
    float _2706 = _2704;
    float _2708 = _2704;
    if (!_2650)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2710 = _2678;
    bool _2712 = !_2650;
    float _2714 = _2710;
    float _2716 = _2710;
    if (!_2712)
    {
        bool _2718 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2720 = isnan(_1780);
        bool _2722 = _2718 || _2720;
        bool _2724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2726 = _2722 || _2724;
        if (!_2726)
        {
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2730 = _1780 + _2728;
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2734 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2732;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2740 = 1.0 / _2734;
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2758 = _2730 * _2740;
            float _2760 = precise::clamp(_2758, 0.0, 1.0);
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2766 = fma(_2760, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2768 = fma(_2760, _2764, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2770 = fma(_2760, _2744, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2772 = fma(_2760, _2748, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2774 = fma(_2760, _2752, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2776 = fma(_2760, _2756, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2690 = _2770;
            _2708 = _2774;
            _2684 = _2766;
            _2702 = _2772;
            _2696 = _2768;
            _2716 = _2776;
            _2778 = true;
        }
        else
        {
            bool _2780 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2782 = isnan(_1780);
            bool _2784 = _2780 || _2782;
            bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2788 = _2784 || _2786;
            if (!_2788)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2790 = _2682;
            _2684 = _2790;
            if (!_2788)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2792 = _2688;
            _2690 = _2792;
            if (!_2788)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2794 = _2694;
            _2696 = _2794;
            if (!_2788)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2796 = _2700;
            _2702 = _2796;
            if (!_2788)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2798 = _2706;
            _2708 = _2798;
            if (!_2788)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2800 = _2714;
            bool _2802 = !_2788;
            _2716 = _2800;
            if (!_2802)
            {
                bool _2804 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2806 = isnan(_1780);
                bool _2808 = _2804 || _2806;
                bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2812 = _2808 || _2810;
                if (!_2812)
                {
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2816 = _1780 + _2814;
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2820 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2818;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2826 = 1.0 / _2820;
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2844 = _2816 * _2826;
                    float _2846 = precise::clamp(_2844, 0.0, 1.0);
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2852 = fma(_2846, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2854 = fma(_2846, _2850, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2856 = fma(_2846, _2830, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2858 = fma(_2846, _2834, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2860 = fma(_2846, _2838, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2862 = fma(_2846, _2842, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2690 = _2856;
                    _2708 = _2860;
                    _2684 = _2852;
                    _2702 = _2858;
                    _2696 = _2854;
                    _2716 = _2862;
                    _2778 = true;
                }
                else
                {
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2778 = false;
    float _2864 = _2690;
    float _2866 = _2708;
    float _2868 = _2684;
    float _2870 = _2702;
    float _2872 = _2696;
    float _2874 = _2716;
    float _2876 = fma(_1584, -0.5, 0.5);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -_2864;
    float _2882 = _2880 + _2866;
    float _2884 = -_2868;
    float _2886 = _2884 + _2870;
    float _2888 = -_2872;
    float _2890 = _2888 + _2874;
    bool _2892 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2894 = fma(_2878, _2882, _2864);
    float _2896 = fma(_2878, _2886, _2868);
    float _2898 = fma(_2878, _2890, _2872);
    float _2900 = _2894 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2902 = fma(_2896, 0.298911988735198974609375, _2900);
    float _2904 = fma(_2898, 0.114477999508380889892578125, _2902);
    out.m_99.x = 0.0;
    float _2906 = -_2904;
    float _2908 = _2896 + _2906;
    float _2910 = -_2904;
    float _2912 = _2894 + _2910;
    float _2914 = -_2904;
    float _2916 = _2898 + _2914;
    float _2918 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2920 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    float _2922 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    float _2924 = fma(_2916, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    out.m_95.w = _2918;
    out.m_101.x = _2920;
    out.m_101.y = _2922;
    out.m_101.z = _2924;
    if (!_2892)
    {
        return out;
    }
    float _2926 = -_1692;
    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2930 = -_1696;
    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2934 = -_1700;
    float _2936 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2938 = _2928 * _2928;
    float _2940 = fma(_2932, _2932, _2938);
    float _2942 = fma(_2936, _2936, _2940);
    float _2944 = sqrt(_2942);
    float _2946 = rsqrt(_2942);
    float _2948 = -_2944;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2952 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2954 = precise::clamp(_2952, 0.0, 1.0);
    float _2956 = _2932 * _2946;
    float _2958 = _2928 * _2946;
    float _2960 = abs(_2954);
    float _2962 = log2(_2960);
    float _2964 = _2936 * _2946;
    float _2966 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2968 = _1584 * _2958;
    float _2970 = -_2958;
    float _2972 = -_2966;
    float _2974 = fma(_2970, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2972);
    float _2976 = fma(_1582, _2956, _2968);
    float _2978 = -_2964;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2974);
    float _2982 = fma(_1586, _2964, _2976);
    float _2984 = precise::clamp(_2982, 0.0, 1.0);
    float _2986 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2988 = _2980 + _2986;
    float _2990 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2992 = _2988 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2994 = precise::clamp(_2992, 0.0, 1.0);
    float _2996 = exp2(_2990);
    float _2998 = _2996 * _2994;
    float _3000 = _2984 * _2998;
    float _3002 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3004 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3006 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _3002;
    out.m_99.y = _3004;
    out.m_99.z = _3006;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2778 = false;
    bool _1632 = false;
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
        float _3063 = as_type<float>(_136);
        out.gl_Position.z = _3063;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3132 = as_type<float>(_174);
        out.gl_Position.z = _3132;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _328 = in.m_67.w;
    float _330 = _294 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _332 = in.m_69.y;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _336 = _334 != 0;
    float _338 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[5].x, _330);
    int _340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _342 = _340 != 0;
    float _344 = in.m_67.z;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _346;
    float _350 = _294 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _352 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _354 = in.m_67.y;
    float _356 = 1.0 / _348;
    float _358 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[4].x, _350);
    float _360 = in.m_71.x;
    float _362 = in.m_71.y;
    float _364 = in.m_71.z;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _370 = in.m_67.x;
    float _372 = _294 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _374 = 1.0 / _368;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _326 + _376;
    bool _380 = _328 > 0.5;
    float _382 = fma(_292, (*spvDescriptorSet0.vp_c10)._m0[6].x, _372);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _386 = _326 + _384;
    float _388 = -_332;
    float _390 = _388 + 1.0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].z, _358);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _414 = _332;
    if (_336)
    {
        float _416 = _380 ? _390 : _332;
        _414 = _416;
    }
    float _418 = _414;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _424 = 1.0 / _412;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _426;
    float _430 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _432 = _364 + _354;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _436 = _326 + _434;
    float _438 = _378 * _374;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _442 = _326 + _440;
    float _444 = 1.0 / _422;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _450 = _344 * 2.0;
    float _452 = _370 + _360;
    float _454 = _370 * 2.0;
    float _456 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _432);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _460 = _326 + _458;
    float _462 = 1.0 / _408;
    float _464 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _452);
    float _466 = _436 * _424;
    float _468 = _354 * 2.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _472 = _326 + _470;
    float _474 = _442 * _356;
    float _476 = _354 + _344;
    float _478 = floor(_450);
    float _480 = _386 * _444;
    float _482 = _370 + _344;
    float _484 = _476 + (-1.0);
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _488 = _482 + (-1.0);
    float _490 = 1.0 / _428;
    float _492 = _460 * _462;
    float _494 = _486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _498 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _500 = _352 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _502 = _478 > 0.0;
    float _504 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _508 = _478 >= 0.0;
    bool _510 = isnan(_478);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = floor(_454);
    float _520 = in.m_73.x;
    float _522 = in.m_73.y;
    float _524 = in.m_73.z;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _526;
    int _530 = _516 ? 0 : 1;
    float _532 = _472 * _490;
    out.m_75.x = _494;
    out.m_75.y = _504;
    out.m_75.z = _506;
    float _534 = fma(_528, _474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _536 = floor(_468);
    float _538 = in.m_77.x;
    float _540 = in.m_77.y;
    float _542 = in.m_77.z;
    float _544 = in.m_77.w;
    float _546 = _370 + _354;
    int _548 = ~_530;
    int _550 = _548 + 1;
    int _552 = _550 + 1;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _558 = _552;
    float _560 = _522;
    if (!_502)
    {
        int _562 = ~_530;
        int _564 = _562 + 1;
        _558 = _564;
    }
    int _566 = _558;
    float _568 = _546 + (-1.0);
    float _570 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _572 = log2(_570);
    bool _574 = _518 >= 0.0;
    bool _576 = isnan(_518);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _586 = fma(_556, _438, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _588 = _582 ? 0 : 1;
    float _590 = _404 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _592 = _518 > 0.0;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _594;
    bool _598 = _536 > 0.0;
    float _600 = _456 * 15.0;
    bool _602 = _536 >= 0.0;
    bool _604 = isnan(_536);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = fma(_596, _474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _614 = _430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _616 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _618 = isnan(_326);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = _354 + (-0.5);
    float _630 = _520 * _542;
    float _632 = _524 * _540;
    float _634 = _522 * _538;
    bool _636 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _638 = isnan(_326);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_630;
    float _650 = fma(_524, _538, _648);
    float _652 = -_632;
    float _654 = fma(_522, _542, _652);
    float _656 = -_634;
    float _658 = fma(_520, _540, _656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _660;
    float _664 = _650 * _544;
    float _666 = _654 * _544;
    float _668 = _658 * _544;
    float _670 = fma(_662, _474, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _680 = -_626;
    float _682 = _680 + 1.0;
    float _684 = fma(_674, _438, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _686;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _710 = fma(_692, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _712 = fma(_700, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _714 = fma(_678, _438, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _716 = fma(_708, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _718 = _572 * _154;
    float _720 = fma(_688, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _722 = fma(_696, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _724 = fma(_704, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _726;
    float _730 = exp2(_718);
    bool _732 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _734 = isnan(_326);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _744;
    float _748 = fma(_728, _532, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _750;
    bool _754 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _756 = isnan(_326);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -_742;
    float _768 = _766 + 1.0;
    float _770 = fma(_746, _532, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    int _772 = ~_588;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = fma(_752, _532, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _780 = _776;
    float _782 = _710;
    if (!_592)
    {
        int _784 = ~_588;
        int _786 = _784 + 1;
        _780 = _786;
    }
    int _788 = _780;
    float _790 = _764 * _768;
    bool _792 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _794 = isnan(_326);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -_764;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _812 = -_730;
    float _814 = _812 + 1.0;
    float _816 = _802 * _806;
    float _818 = -_802;
    float _820 = _818 + 1.0;
    bool _822 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _824 = isnan(_326);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _836 = 1.0 + _834;
    bool _838 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _840 = isnan(0.0);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _846 = _842 || _844;
    float _848 = _626 * _820;
    bool _850 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _852 = isnan(_326);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _836;
    float _864 = -_832;
    float _866 = _864 + 1.0;
    float _868 = _846 ? _814 : 0.0;
    float _870 = _832 * _682;
    bool _872 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _874 = isnan(1.0);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _880 = _876 || _878;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _886 = _860 * _866;
    float _888 = -_860;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _896 = fma(_884, _480, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _898 = in.m_79.x;
    float _900 = _646 * _890;
    float _902 = -_646;
    float _904 = _902 + 1.0;
    float _906 = fma(_894, _480, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _908 = _610 ? 0 : 1;
    float _910 = _612 * _900;
    float _912 = _534 * _900;
    if (_880)
    {
        float _914 = _868 * _862;
        _158 = _914;
    }
    float _916 = _158;
    float _918 = _670 * _900;
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].x, _910);
    float _922 = _464 * 7.5;
    float _924 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].y, _912);
    float _926 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[143].z, _918);
    float _928 = _522 * _522;
    float _930 = _922 * 0.15915493667125701904296875;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _500 + _932;
    bool _936 = !_398;
    int _938 = _936 ? 0 : 1;
    float _940 = fma(_520, _520, _928);
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _944 = _590 + _942;
    float _946 = _934 * _934;
    float _948 = fma(_810, _480, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _950 = _930 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = fma(_524, _524, _940);
    int _956 = abs(_938);
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _960 = _614 + _958;
    float _962 = fma(_944, _944, _946);
    float _964 = _600 * 0.15915493667125701904296875;
    int _966 = ~_908;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = in.m_81.x;
    float _974 = in.m_81.y;
    float _976 = in.m_81.z;
    int _978 = _970;
    float _980 = _916;
    if (!_598)
    {
        int _982 = ~_908;
        int _984 = _982 + 1;
        _978 = _984;
    }
    int _986 = _978;
    float _988 = fma(_684, _886, _920);
    float _990 = fma(_960, _960, _962);
    float _992 = fma(_586, _886, _924);
    float _994 = float(_956);
    float _996 = _964 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = float(_788);
    float _1002 = fma(_714, _886, _926);
    float _1004 = _952 * 0.07999999821186065673828125;
    float _1006 = fma(_722, _870, _992);
    float _1008 = float(_566);
    float _1010 = _994 * _1000;
    float _1012 = fma(_1004, _898, _362);
    float _1014 = rsqrt(_990);
    float _1016 = fma(_720, _870, _988);
    float _1018 = fma(_724, _870, _1002);
    float _1020 = _1010 * (-2.0);
    bool _1022 = !_402;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = fma(_712, _848, _1006);
    bool _1028 = !_394;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = fma(_496, _1020, _496);
    float _1034 = rsqrt(_954);
    int _1036 = abs(_1024);
    float _1038 = fma(_1020, _974, _974);
    int _1040 = abs(_1030);
    float _1042 = _998 * 0.02999999932944774627685546875;
    float _1044 = float(_1036);
    float _1046 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1038);
    float _1048 = float(_1040);
    float _1050 = _934 * _1014;
    float _1052 = _944 * _1014;
    float _1054 = _960 * _1014;
    float _1056 = float(_986);
    float _1058 = -_1050;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _934);
    float _1062 = -_1052;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _944);
    float _1066 = _1048 * _1008;
    float _1068 = -_1054;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _1072 = _1034 * _1042;
    float _1074 = _1060 * _1060;
    float _1076 = _1044 * _1056;
    float _1078 = fma(_1032, _916, _1046);
    float _1080 = fma(_520, _1072, _360);
    float _1082 = fma(_1064, _1064, _1074);
    float _1084 = fma(_522, _1072, _1012);
    float _1086 = fma(_524, _1072, _364);
    float _1088 = _1066 * (-2.0);
    float _1090 = in.m_69.x;
    float _1092 = fma(_1070, _1070, _1082);
    float _1094 = _1076 * (-2.0);
    float _1096 = _370 + (-0.5);
    float _1098 = fma(_1088, _972, _972);
    float _1100 = fma(_584, _1088, _584);
    bool _1102 = _344 > 0.5;
    bool _1104 = _1102 && _342;
    float _1106 = fma(_1094, _976, _976);
    float _1108 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1098);
    float _1110 = fma(_498, _1094, _498);
    float _1112 = _344 + (-0.5);
    float _1114 = fma(_710, _848, _1016);
    float _1116 = fma(_1100, _916, _1108);
    bool _1118 = _1084 != 0.0;
    bool _1120 = isnan(_1084);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1106);
    float _1130 = fma(_716, _848, _1018);
    float _1132 = _1116 * 0.15915493667125701904296875;
    bool _1134 = _1080 == 0.0;
    bool _1136 = !_1126;
    bool _1138 = _1134 && _1136;
    float _1140 = in.m_65.x;
    float _1142 = in.m_65.y;
    float _1144 = in.m_65.z;
    float _1146 = fma(_1110, _916, _1128);
    float _1148 = _1078 * 0.15915493667125701904296875;
    float _1150 = sqrt(_1092);
    bool _1152 = _1086 == 0.0;
    bool _1154 = _1152 && _1138;
    float _1156 = _1146 * 0.15915493667125701904296875;
    float _1158 = _972;
    float _1160 = _1090;
    float _1162 = _1098;
    float _1164 = _1100;
    if (!_342)
    {
        _1158 = _1090;
    }
    float _1166 = _1158;
    float _1168 = _1166;
    if (_1104)
    {
        float _1170 = -_1090;
        float _1172 = _1170 + 1.0;
        _1160 = _1172;
    }
    float _1174 = _1160;
    float _1176 = fma(_778, _816, _1130);
    float _1178 = fma(_770, _816, _1026);
    float _1180 = fma(_748, _816, _1114);
    float _1182 = _1148 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    if (_342)
    {
        _1168 = _1174;
    }
    float _1186 = _1168;
    float _1188 = fma(_948, _790, _1176);
    float _1190 = fma(_906, _790, _1178);
    float _1192 = fma(_896, _790, _1180);
    float _1194 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1188);
    float _1196 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1190);
    float _1198 = _1132 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1192);
    if (_1154)
    {
        _980 = _520;
    }
    float _1204 = _980;
    float _1206 = _1204;
    if (!_1154)
    {
        float _1208 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[17].y, _520);
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = _1196 * _1142;
    float _1214 = _1202 * _1140;
    float _1216 = _1014 * _1150;
    float _1218 = _1132 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1224 = _1194 * _1144;
    if (!_1154)
    {
        float _1226 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _560 = _1226;
    }
    float _1228 = _560;
    float _1230 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1232 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1084);
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _1148 * 6.283185482025146484375;
    float _1238 = cos(_1236);
    float _1240 = _1200 * _1184;
    float _1242 = _1216 * _1234;
    float _1244 = _1156 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1220 * _1184;
    float _1250 = _1156 * 6.283185482025146484375;
    float _1252 = sin(_1250);
    float _1254 = _1200 * _1238;
    float _1256 = _1220 * _1238;
    float _1258 = _1200 * _1246;
    float _1260 = _1238 * _1246;
    float _1262 = _1220 * _1246;
    float _1264 = _1184 * _1246;
    float _1266 = _1216 * _1222;
    float _1268 = _1216 * _1230;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1080);
    float _1272 = _1262 * _540;
    float _1274 = _1232 * _1266;
    float _1276 = -_1240;
    float _1278 = fma(_1252, _1256, _1276);
    float _1280 = -_1256;
    float _1282 = fma(_1252, _1240, _1280);
    float _1284 = _1270 * _1268;
    float _1286 = fma(_1252, _1254, _1248);
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1086);
    float _1290 = _1258 * _1274;
    float _1292 = -_1274;
    float _1294 = _1252 * _1292;
    float _1296 = _1262 * _1274;
    float _1298 = _1288 * _1242;
    float _1300 = fma(_1286, _1284, _1290);
    float _1302 = fma(_1260, _1284, _1294);
    float _1304 = fma(_1278, _1284, _1296);
    float _1306 = fma(_1252, _1248, _1254);
    float _1308 = fma(_1282, _1298, _1300);
    float _1310 = _1254;
    if (_1154)
    {
        _1310 = _524;
    }
    float _1312 = _1310;
    float _1314 = _1312;
    if (!_1154)
    {
        float _1316 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _1314 = _1316;
    }
    float _1318 = _1314;
    float _1320 = fma(_1264, _1298, _1302);
    float _1322 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1324 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1326 = -_1228;
    float _1328 = _1252 * _1326;
    float _1330 = fma(_1306, _1298, _1304);
    float _1332 = -_664;
    float _1334 = _1252 * _1332;
    float _1336 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1322);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1324);
    float _1340 = -_540;
    float _1342 = _1252 * _1340;
    float _1344 = fma(_1260, _1210, _1328);
    float _1346 = fma(_1260, _666, _1334);
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1336);
    float _1350 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1338);
    float _1352 = fma(_1260, _538, _1342);
    float _1354 = _1258 * _540;
    float _1356 = _590 + _1348;
    float _1358 = _614 + _1350;
    float _1360 = _1258 * _1228;
    float _1362 = _1262 * _1228;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1366 = _1356 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1370 = _1358 + _1368;
    float _1372 = _1258 * _664;
    float _1374 = _1262 * _664;
    float _1376 = _1366 * _1366;
    float _1378 = _1370 * _1370;
    float _1380 = fma(_1286, _1210, _1360);
    float _1382 = fma(_1286, _538, _1354);
    float _1384 = fma(_1286, _666, _1372);
    float _1386 = _1376 + _1378;
    float _1388 = fma(_1278, _1210, _1362);
    float _1390 = fma(_1278, _538, _1272);
    float _1392 = fma(_1278, _666, _1374);
    float _1394 = sqrt(_1386);
    float _1396 = fma(_1264, _1318, _1344);
    float _1398 = fma(_1264, _542, _1352);
    float _1400 = fma(_1282, _1318, _1380);
    float _1402 = fma(_1282, _542, _1382);
    float _1404 = fma(_1306, _1318, _1388);
    float _1406 = fma(_1306, _542, _1390);
    float _1408 = fma(_1306, _668, _1392);
    float _1410 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1412 = fma(_1264, _668, _1346);
    float _1414 = fma(_1282, _668, _1384);
    float _1416 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1418 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1410);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1422 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1424 = _1402 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1426 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = fma(_1330, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1418);
    float _1430 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1422);
    float _1432 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1416);
    float _1434 = fma(_1398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1424);
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1438 = _500 + _1428;
    float _1440 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1442 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1444 = _1400 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1440);
    float _1448 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1442);
    float _1450 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1444);
    float _1452 = _1422;
    float _1454 = _1376;
    float _1456 = _1378;
    float _1458 = _1356;
    float _1460 = _1358;
    float _1462 = _1446;
    if (!_1426)
    {
        _1452 = _1438;
    }
    float _1464 = _1452;
    bool _1466 = !_1426;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1394 + _1472;
        float _1476 = rsqrt(_1386);
        float _1478 = _1474 * _1470;
        float _1480 = _1438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1482 = _1478 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = cos(_1488);
        float _1492 = fma(_1486, _1480, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1494 = _1476 * _1492;
        float _1496 = _1490 + (-1.0);
        float _1498 = fma(_1366, _1494, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1500 = fma(_1370, _1494, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1502 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1504 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1506 = _1498 + _1504;
        float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1510 = _1500 + _1508;
        float _1512 = fma(_1438, _1490, _1502);
        float _1514 = _1506 * _1506;
        float _1516 = _1510 * _1510;
        _1468 = _1512;
        _1454 = _1514;
        _1456 = _1516;
        _1458 = _1498;
        _1460 = _1500;
    }
    float _1518 = _1468;
    float _1520 = _1454;
    float _1522 = _1456;
    float _1524 = _1458;
    float _1526 = _1460;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1530 = _1518 + _1528;
    float _1532 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1534 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1536 = _1414 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1538 = fma(_1530, _1530, _1520);
    float _1540 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1532);
    float _1542 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1534);
    float _1544 = fma(_1412, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1536);
    float _1546 = _1538 + _1522;
    float _1548 = _418 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1550 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1552 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1432);
    float _1554 = _1548 * _1436;
    float _1556 = sqrt(_1546);
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1430);
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1566 = _1550 * _1420;
    float _1568 = fma(_1406, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1434);
    float _1570 = _1558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1540);
    float _1574 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1542);
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1578 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = fma(_1408, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1544);
    float _1582 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1446);
    float _1584 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1448);
    float _1586 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1450);
    out.m_83.x = _1576;
    out.m_83.y = _1570;
    out.m_83.z = _1578;
    bool _1588 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1590 = isnan(_1556);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1596 = _1592 || _1594;
    out.m_85.z = _1566;
    out.m_85.w = _1554;
    out.m_87.x = _1562;
    out.m_87.y = _1552;
    out.m_87.z = _1568;
    out.m_89.x = _1572;
    out.m_89.y = _1574;
    out.m_89.z = _1580;
    if (!_1596)
    {
        _1462 = 1.0;
    }
    float _1598 = _1462;
    out.m_91.x = _1582;
    out.m_91.y = _1584;
    out.m_91.z = _1586;
    bool _1600 = !_1596;
    float _1602 = _1598;
    if (!_1600)
    {
        bool _1604 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1606 = isnan(_1556);
        bool _1608 = _1604 || _1606;
        bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1612 = _1608 || _1610;
        if (!_1612)
        {
            float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1616 = _1556 + _1614;
            float _1618 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1620 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1618;
            float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1624 = _1622 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1626 = 1.0 / _1620;
            float _1628 = _1616 * _1626;
            float _1630 = fma(_1628, _1624, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1602 = _1630;
            _1632 = true;
        }
        else
        {
            bool _1634 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1636 = isnan(_1556);
            bool _1638 = _1634 || _1636;
            bool _1640 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1642 = _1638 || _1640;
            if (!_1642)
            {
                float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1646 = _1556 + _1644;
                float _1648 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1650 = _1648 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1652 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1654 = _1652 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1656 = 1.0 / _1650;
                float _1658 = _1646 * _1656;
                float _1660 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1602 = _1660;
                _1632 = true;
            }
            else
            {
                _1602 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1632 = false;
    float _1662 = _1602;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1666 = _1518 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1670 = _1524 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1674 = _1526 + _1672;
    float _1676 = -_1050;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _500);
    float _1680 = fma(_1666, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1682 = fma(_1670, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1684 = fma(_1674, _1662, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1686 = -_1052;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _590);
    float _1690 = -_1050;
    float _1692 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1694 = -_1052;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1698 = -_1054;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1684);
    float _1702 = -_1054;
    float _1704 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _614);
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1708 = _1692 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1696 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1716 = _1700 + _1714;
    float _1718 = _1708 * _1708;
    float _1720 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = fma(_1712, _1712, _1718);
    float _1724 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1726 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1728 = fma(_1716, _1716, _1722);
    float _1730 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1724);
    float _1732 = _1678 + _1726;
    float _1734 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1736 = rsqrt(_1728);
    float _1738 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1730);
    float _1740 = _1678 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1744 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1740);
    float _1748 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1742);
    float _1750 = floor(_1734);
    float _1752 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1746);
    float _1754 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1748);
    float _1756 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1758 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1760 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1764 = 1.0 / _1744;
    float _1766 = _1756 + _1744;
    float _1768 = _1712 * _1760;
    float _1770 = _1716 * _1760;
    float _1772 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1762);
    float _1774 = _1768 * _1768;
    float _1776 = _1770 * _1770;
    float _1778 = fma(_1704, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1772);
    float _1780 = sqrt(_1728);
    float _1782 = _1774 + _1776;
    float _1784 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1786 = _1766 * _1764;
    float _1788 = _1786 * 0.5;
    float _1790 = sqrt(_1782);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1794 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1792);
    float _1796 = 1.0 / _1794;
    bool _1798 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1800 = trunc(_1758);
    int _1802 = int(_1800);
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1806 = _1790 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1810 = _1796 * _1808;
    float _1812 = trunc(_1784);
    int _1814 = int(_1812);
    bool _1816 = _1810 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1818 = _1810 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1820 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1822 = _1678;
    int _1824 = 2;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1828 = _1782;
    float _1830 = _1768;
    float _1832 = _1774;
    float _1834 = _1784;
    if (_1798)
    {
        float _1836 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    int _1840 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1842 = _1802 + _1840;
    int _1844 = _1842 + 1;
    bool _1846 = !_1816;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1852 = _1814 + _1850;
    int _1854 = _1852 + 1;
    float _1856 = floor(_1820);
    float _1858 = as_type<float>(_1814);
    uint _1861 = uint(_1844);
    if (!_1816)
    {
        _1824 = 1;
    }
    int _1863 = _1824;
    int _1865 = _1863;
    if (!_1818)
    {
        _1865 = _1848;
    }
    int _1867 = _1865;
    bool _1869 = _1844 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    if (_1798)
    {
        float _1871 = _1806 * _1838;
        _1826 = _1871;
    }
    float _1873 = _1826;
    if (_1798)
    {
        float _1875 = rsqrt(_1782);
        _1828 = _1875;
    }
    float _1877 = _1828;
    int _1879 = _1867 << 6;
    float _1881 = _1877;
    int _1883 = _1879;
    if (_1798)
    {
        float _1885 = _1873 * 0.15915493667125701904296875;
        _1858 = _1885;
    }
    float _1887 = _1858;
    int _1889 = _1844 | _1854;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    int _1893 = _1879 + 48;
    uint _1895 = uint(int(uint(_1893) >> uint(2)));
    uint _1897 = uint(int(uint(int(_1895)) >> uint(2)));
    int _1899 = int(_1895) & 3;
    float _1901 = (*spvDescriptorSet0.vp_c15)._m0[int(_1897)][_1899];
    int _1903 = int(_1895) + 1;
    uint _1905 = uint(int(uint(_1903) >> uint(2)));
    int _1907 = _1903 & 3;
    float _1909 = (*spvDescriptorSet0.vp_c15)._m0[int(_1905)][_1907];
    bool _1911 = _1889 < 0;
    bool _1913 = _1911 || _1869;
    float _1915 = _1806;
    if (_1798)
    {
        float _1917 = _1887 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = precise::max(0.0, _1891);
    float _1925 = -_1856;
    float _1927 = _1820 + _1925;
    bool _1929 = _1854 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1931 = _1929 || _1913;
    int _1933 = _1879 + 64;
    uint _1935 = uint(int(uint(_1933) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c15)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c15)._m0[int(_1945)][_1947];
    float _1951 = -_1760;
    float _1953 = -_1923;
    float _1955 = fma(_1708, _1951, _1953);
    float _1957 = _1394;
    float _1959 = _1923;
    float _1961 = _1955;
    if (_1798)
    {
        float _1963 = _1887 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        _1957 = _1965;
    }
    float _1967 = _1957;
    if (_1798)
    {
        float _1969 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1969;
    }
    float _1971 = _1959;
    int _1973 = _1879 + 96;
    uint _1975 = uint(int(uint(_1973) >> uint(2)));
    uint _1977 = uint(int(uint(int(_1975)) >> uint(2)));
    int _1979 = int(_1975) & 3;
    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[int(_1977)][_1979];
    int _1983 = int(_1975) + 1;
    uint _1985 = uint(int(uint(_1983) >> uint(2)));
    int _1987 = _1983 & 3;
    float _1989 = (*spvDescriptorSet0.vp_c15)._m0[int(_1985)][_1987];
    if (!_1931)
    {
        int _1991 = _1854 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1993 = _1991 + _1844;
        _1861 = uint(_1993);
    }
    uint _1995 = _1861;
    if (_1798)
    {
        float _1997 = fma(_1921, _1971, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1162 = _1997;
    }
    float _1999 = _1162;
    int _2001 = _1879 + 80;
    uint _2003 = uint(int(uint(_2001) >> uint(2)));
    uint _2005 = uint(int(uint(int(_2003)) >> uint(2)));
    int _2007 = int(_2003) & 3;
    float _2009 = (*spvDescriptorSet0.vp_c15)._m0[int(_2005)][_2007];
    int _2011 = int(_2003) + 1;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    int _2015 = _2011 & 3;
    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[int(_2013)][_2015];
    if (_1798)
    {
        float _2019 = _1877 * _1999;
        _1881 = _2019;
    }
    float _2021 = _1881;
    float _2023 = _1967;
    if (_1798)
    {
        float _2025 = _1967 + (-1.0);
        _782 = _2025;
    }
    float _2027 = _782;
    if (_1798)
    {
        float _2029 = _1768 * _2021;
        _1830 = _2029;
    }
    float _2031 = _1830;
    if (_1798)
    {
        float _2033 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1164 = _2033;
    }
    float _2035 = _1164;
    int _2037 = _1879 + 104;
    uint _2039 = uint(int(uint(_2037) >> uint(2)));
    uint _2041 = uint(int(uint(int(_2039)) >> uint(2)));
    int _2043 = int(_2039) & 3;
    float _2045 = (*spvDescriptorSet0.vp_c15)._m0[int(_2041)][_2043];
    int _2047 = int(_2039) + 1;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    int _2051 = _2047 & 3;
    float _2053 = (*spvDescriptorSet0.vp_c15)._m0[int(_2049)][_2051];
    float _2055 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    if (_1798)
    {
        float _2057 = _2031 * _2031;
        _1832 = _2057;
    }
    float _2059 = _1832;
    if (_1798)
    {
        float _2061 = fma(_1955, _1967, _2035);
        _1961 = _2061;
    }
    float _2063 = _1961;
    if (!_1798)
    {
        _2023 = _1770;
    }
    float _2065 = _2023;
    float _2067 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2055);
    float _2069 = _2065;
    float _2071 = _2067;
    if (_1798)
    {
        float _2073 = _1770 * _2021;
        _2069 = _2073;
    }
    float _2075 = _2069;
    float _2077 = fma(_2063, _2063, _2059);
    int _2079 = _1879 + 72;
    uint _2081 = uint(int(uint(_2079) >> uint(2)));
    uint _2083 = uint(int(uint(int(_2081)) >> uint(2)));
    int _2085 = int(_2081) & 3;
    float _2087 = (*spvDescriptorSet0.vp_c15)._m0[int(_2083)][_2085];
    int _2089 = int(_2081) + 1;
    uint _2091 = uint(int(uint(_2089) >> uint(2)));
    int _2093 = _2089 & 3;
    float _2095 = (*spvDescriptorSet0.vp_c15)._m0[int(_2091)][_2093];
    float _2097 = _2067 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_1798)
    {
        _2071 = _1776;
    }
    float _2099 = _2071;
    float _2101 = _2099;
    if (_1798)
    {
        float _2103 = _2075 * _2075;
        _2101 = _2103;
    }
    float _2105 = _2101;
    float _2107 = _2035;
    if (!_1931)
    {
        float _2109 = floor(_1784);
        _2107 = _2109;
    }
    float _2111 = _2107;
    float _2113 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2115 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2117 = _2077 + _2105;
    int _2119 = _1879 + 56;
    uint _2121 = uint(int(uint(_2119) >> uint(2)));
    uint _2123 = uint(int(uint(int(_2121)) >> uint(2)));
    int _2125 = int(_2121) & 3;
    float _2127 = (*spvDescriptorSet0.vp_c15)._m0[int(_2123)][_2125];
    int _2129 = int(_2121) + 1;
    uint _2131 = uint(int(uint(_2129) >> uint(2)));
    int _2133 = _2129 & 3;
    float _2135 = (*spvDescriptorSet0.vp_c15)._m0[int(_2131)][_2133];
    float _2137 = _1732 * _1909;
    float _2139 = -_2115;
    float _2141 = fma(_2139, _2113, 1.0);
    int _2143 = as_type<int>(_2115);
    float _2145 = _1909;
    if (!_1931)
    {
        uint _2147 = uint(int(uint(int(_1995)) >> uint(2)));
        _2143 = int(_2147);
    }
    int _2149 = _2143;
    float _2151 = -_1750;
    float _2153 = _1734 + _2151;
    float _2155 = fma(_1688, _1901, _2137);
    float _2157 = rsqrt(_2117);
    int _2159 = _1879 + 88;
    uint _2161 = uint(int(uint(_2159) >> uint(2)));
    uint _2163 = uint(int(uint(int(_2161)) >> uint(2)));
    int _2165 = int(_2161) & 3;
    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[int(_2163)][_2165];
    int _2169 = int(_2161) + 1;
    uint _2171 = uint(int(uint(_2169) >> uint(2)));
    int _2173 = _2169 & 3;
    float _2175 = (*spvDescriptorSet0.vp_c15)._m0[int(_2171)][_2173];
    float _2177 = _1732 * _1949;
    if (!_1931)
    {
        float _2179 = -_2111;
        float _2181 = _1784 + _2179;
        _2145 = _2181;
    }
    float _2183 = _2145;
    float _2185 = log2(_2141);
    float _2187 = _1732 * _1989;
    if (!_1931)
    {
        int _2189 = int(_1995) << 2;
        _1883 = _2189;
    }
    int _2191 = _1883;
    float _2193 = fma(_1688, _1981, _2187);
    int _2195 = _2191;
    if (!_1931)
    {
        int _2197 = 12 & _2191;
        _2195 = _2197;
    }
    int _2199 = _2195;
    float _2201 = _2157 * _2031;
    float _2203 = _1732 * _2017;
    float _2205 = fma(_1688, _1941, _2177);
    if (!_1931)
    {
        int _2207 = _2149 << 4;
        int _2209 = _2207 + _2199;
        _1834 = as_type<float>(_2209);
    }
    float _2211 = _1834;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2215 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2213);
    float _2217 = precise::clamp(_2215, 0.0, 1.0);
    float _2219 = fma(_1688, _2009, _2203);
    float _2221 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2223 = _2157 * _2075;
    float _2225 = -_2217;
    float _2227 = _2225 + 1.0;
    float _2229 = fma(_1704, _2045, _2193);
    float _2231 = _2185 * 0.693147182464599609375;
    float2 _6501 = float2(_1927, _2153);
    float _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6501, float2(0.0), isnan(_6501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6501, float2(0.0), isnan(_6501)), level(0.0)).x;
    float _2235 = _2211;
    if (!_1931)
    {
        int _2237 = as_type<int>(_2211) + 400;
        uint _2239 = uint(int(uint(_2237) >> uint(2)));
        uint _2241 = uint(int(uint(int(_2239)) >> uint(2)));
        int _2243 = int(_2239) & 3;
        float _2245 = (*spvDescriptorSet0.vp_c15)._m0[int(_2241)][_2243];
        _2235 = _2245;
    }
    float _2247 = _2235;
    float _2249 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2251 = fma(_1704, _2087, _2205);
    float _2253 = _2229 + _2053;
    float _2255 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2257 = _2157 * _2063;
    float _2259 = _2251 + _2095;
    float _2261 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2263 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2255);
    float _2265 = 1.0 / _2253;
    float _2267 = fma(_1704, _2127, _2155);
    float _2269 = -_2221;
    float _2271 = fma(_2257, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2269);
    float _2273 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2263);
    float _2275 = _2267 + _2135;
    float _2277 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2279 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2281 = abs(_2227);
    float _2283 = log2(_2281);
    float _2285 = fma(_1704, _2167, _2219);
    float _2287 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2277);
    float _2289 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2261);
    float _2291 = -_2223;
    float _2293 = fma(_2291, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2271);
    float _2295 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2287);
    float _2297 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2289);
    float _2299 = _2275 * _2265;
    float _2301 = fma(_2293, -0.5, 0.5);
    float _2303 = _2295 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2305 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2307 = fma(_2293, 0.5, 0.5);
    bool _2309 = _2299 >= 0.0;
    float _2311 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2313 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2305);
    float _2315 = _2259 * _2265;
    float _2317 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2319 = _2299 <= 1.0;
    bool _2321 = _2319 && _2309;
    float _2323 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2313);
    float _2325 = sqrt(_2301);
    float _2327 = _2285 + _2175;
    bool _2329 = _2315 >= 0.0;
    bool _2331 = _2329 && _2321;
    float _2333 = _2257 + 1.0;
    float _2335 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2337 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _2339 = _2315 <= 1.0;
    bool _2341 = _2339 && _2331;
    float _2343 = exp2(_2317);
    float _2345 = _2261;
    float _2347 = _2257;
    if (!_1931)
    {
        float _2349 = floor(_1758);
        _2345 = _2349;
    }
    float _2351 = _2345;
    float _2353 = _2325 * 0.636619746685028076171875;
    float _2355 = fma(_2307, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2357 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2323);
    float _2359 = fma(_2307, _2355, -0.212114393711090087890625);
    float _2361 = 1.0 / _2357;
    float _2363 = -_2257;
    float _2365 = fma(_2343, _2333, _2363);
    float _2367 = _2357;
    if (_2341)
    {
        float _2369 = float(_1867);
        _2347 = _2369;
    }
    float _2371 = _2347;
    float _2373 = fma(_2307, _2359, 1.570728778839111328125);
    float _2375 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2335);
    float _2377 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2337);
    float _2379 = fma(_2365, 0.5, 0.5);
    float _2381 = -_2373;
    float _2383 = fma(_2353, _2381, 1.0);
    float _2385 = _2371;
    if (_2341)
    {
        float _2387 = rint(_2371);
        float _2389 = precise::max(_2387, 0.0);
        uint _2391 = uint(_2389);
        uint _2393 = clamp(_2391, 0u, 65535u);
        _2385 = as_type<float>(_2393);
    }
    float _2395 = _2385;
    float _2397 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2375);
    float _2399 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2377);
    float _2401 = _2351;
    if (!_1931)
    {
        float _2403 = -_2351;
        float _2405 = _1758 + _2403;
        _2401 = _2405;
    }
    float _2407 = _2401;
    float _2409 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2397);
    float _2411 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2399);
    float _2413 = _2327 * _2265;
    float _2415 = _2409 * _2361;
    float _2417 = _2411 * _2361;
    float _2419 = _2265;
    if (!_1931)
    {
        float _2421 = rint(_2247);
        float _2423 = precise::max(_2421, 0.0);
        uint _2425 = uint(_2423);
        uint _2427 = clamp(_2425, 0u, 65535u);
        _2419 = as_type<float>(_2427);
    }
    float _2429 = _2419;
    float _2431 = fma(_2415, 0.5, 0.5);
    float _2433 = fma(_2417, -0.5, 0.5);
    float _2435 = _2157;
    if (_2341)
    {
        float3 _6848 = float3(_2299, _2315, float(as_type<int>(_2395)));
        float3 _6852 = select(_6848, float3(0.0), isnan(_6848));
        float _2437 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6852.xy, uint(rint(_6852.z)), _2413, level(0.0));
        _2435 = _2437;
    }
    float _2439 = _2435;
    float3 _6862 = float3(_2431, _2433, _2249);
    float _2441 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6862, float3(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6862, float3(0.0), isnan(_6862)), level(0.0)).x;
    float3 _6871 = float3(_2431, _2433, _2249);
    float4 _2444 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6871, float3(0.0), isnan(_6871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6871, float3(0.0), isnan(_6871)), level(0.0)).xyzw;
    float _2446 = _2444.x;
    float _2448 = _2444.y;
    float _2450 = _2444.z;
    float _2452 = _2444.w;
    float2 _6887 = float2(_2383, _2379);
    float3 _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6887, float2(0.0), isnan(_6887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6887, float2(0.0), isnan(_6887)), level(0.0)).xyz;
    float _2458 = _2456.x;
    float _2460 = _2456.y;
    float _2462 = _2456.z;
    float _2464 = _2429;
    if (!_1931)
    {
        float3 _6908 = float3(_2407, _2183, float(as_type<int>(_2429)));
        float3 _6910 = select(_6908, float3(0.0), isnan(_6908));
        float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6910.xy, uint(rint(_6910.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6910.xy, uint(rint(_6910.z)), level(0.0)).x;
        _2464 = _2466;
    }
    float _2468 = _2464;
    float _2470 = abs(_1810);
    float _2472 = log2(_2470);
    float _2474 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2476 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2474);
    float _2478 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2476);
    bool _2480 = _1810 <= 8000.0;
    bool _2482 = isnan(_1810);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan(8000.0);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = fma(_2311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    float _2494 = _2283 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2496 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2498 = exp2(_2494);
    out.gl_Position.x = _2409;
    out.gl_Position.y = _2411;
    out.gl_Position.z = _2492;
    out.gl_Position.w = _2357;
    float _2500 = exp2(_2496);
    float _2502 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = fma(_2504, -2.0, 3.0);
    float _2508 = _2504 * _2504;
    float _2510 = _2508 * _2506;
    float _2512 = _2492 + _2357;
    float _2514 = -_2498;
    float _2516 = _2514 + 1.0;
    float _2518 = _2512 * 0.5;
    float _2520 = -_2510;
    float _2522 = _2520 + 1.0;
    float _2524 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.z = _2518;
    out.m_93.w = _2357;
    float _2526 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2510);
    float _2528 = _2490 * _2526;
    float _2530 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2532 = _2528;
    float _2534 = _2530;
    float _2536 = _2492;
    if (!_2341)
    {
        _2532 = 1.0;
    }
    float _2538 = _2532;
    float _2540 = -_2233;
    float _2542 = _2540 + 1.0;
    float _2544 = _2542 * _2530;
    float _2546 = precise::clamp(_2544, 0.0, 1.0);
    float _2548 = _2538;
    if (_1931)
    {
        _2534 = 1.0;
    }
    float _2550 = _2534;
    float _2552 = _2550;
    if (_2341)
    {
        bool _2554 = _2439 >= _2413;
        bool _2556 = isnan(_2439);
        bool _2558 = _2554 || _2556;
        bool _2560 = isnan(_2413);
        bool _2562 = _2558 || _2560;
        float _2564 = float(_2562);
        _2548 = _2564;
    }
    float _2566 = _2548;
    if (!_1931)
    {
        int _2568 = int(_1995) << 4;
        int _2570 = _2568 + 2048;
        uint _2572 = uint(int(uint(_2570) >> uint(2)));
        uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
        int _2576 = int(_2572) & 3;
        float _2578 = (*spvDescriptorSet0.vp_c15)._m0[int(_2574)][_2576];
        int _2580 = int(_2572) + 1;
        uint _2582 = uint(int(uint(_2580) >> uint(2)));
        int _2584 = _2580 & 3;
        float _2586 = (*spvDescriptorSet0.vp_c15)._m0[int(_2582)][_2584];
        int _2588 = _2570 + 8;
        uint _2590 = uint(int(uint(_2588) >> uint(2)));
        uint _2592 = uint(int(uint(int(_2590)) >> uint(2)));
        int _2594 = int(_2590) & 3;
        float _2596 = (*spvDescriptorSet0.vp_c15)._m0[int(_2592)][_2594];
        int _2598 = int(_2590) + 1;
        uint _2600 = uint(int(uint(_2598) >> uint(2)));
        int _2602 = _2598 & 3;
        float _2604 = (*spvDescriptorSet0.vp_c15)._m0[int(_2600)][_2602];
        float _2606 = _1732 * _2586;
        float _2608 = fma(_1688, _2578, _2606);
        float _2610 = fma(_1704, _2596, _2608);
        float _2612 = _2610 + _2604;
        float _2614 = precise::clamp(_2612, 0.0, 1.0);
        float _2616 = -_2614;
        float _2618 = _2616 + _2468;
        float _2620 = fma(_2618, 500.0, 1.5);
        float _2622 = exp2(_2620);
        float _2624 = 0.0 + _2622;
        float _2626 = precise::clamp(_2624, 0.0, 1.0);
        _2552 = _2626;
    }
    float _2628 = _2552;
    float _2630 = _2566 * _2628;
    float _2632 = _2524 * _2441;
    float _2634 = -_2546;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2638 = -_2524;
    float _2640 = _2638 + 1.0;
    bool _2642 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2644 = isnan(_1780);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2650 = _2646 || _2648;
    float _2652 = _2452 * _2632;
    float _2654 = -_2630;
    float _2656 = fma(_2654, _2636, 1.0);
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = _2462 * _2632;
    float _2662 = _2452 * _2640;
    float _2664 = fma(_2458, _2652, _2446);
    float _2666 = fma(_2460, _2652, _2448);
    float _2668 = _2658 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = fma(_2452, _2660, _2450);
    out.m_95.x = _2668;
    float _2672 = _2652;
    float _2674 = _2640;
    float _2676 = _2636;
    float _2678 = _2658;
    if (!_2650)
    {
        _2367 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2680 = _2367;
    float _2682 = _2680;
    float _2684 = _2680;
    if (!_2650)
    {
        _2536 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2686 = _2536;
    out.m_97.x = _2664;
    out.m_97.y = _2666;
    out.m_97.z = _2670;
    out.m_97.w = _2662;
    float _2688 = _2686;
    float _2690 = _2686;
    if (!_2650)
    {
        _2672 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2692 = _2672;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2650)
    {
        _2674 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2698 = _2674;
    float _2700 = _2698;
    float _2702 = _2698;
    if (!_2650)
    {
        _2676 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2704 = _2676;
    float _2706 = _2704;
    float _2708 = _2704;
    if (!_2650)
    {
        _2678 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2710 = _2678;
    bool _2712 = !_2650;
    float _2714 = _2710;
    float _2716 = _2710;
    if (!_2712)
    {
        bool _2718 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2720 = isnan(_1780);
        bool _2722 = _2718 || _2720;
        bool _2724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2726 = _2722 || _2724;
        if (!_2726)
        {
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2730 = _1780 + _2728;
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2734 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2732;
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2740 = 1.0 / _2734;
            float _2742 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2758 = _2730 * _2740;
            float _2760 = precise::clamp(_2758, 0.0, 1.0);
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2766 = fma(_2760, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2768 = fma(_2760, _2764, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2770 = fma(_2760, _2744, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2772 = fma(_2760, _2748, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2774 = fma(_2760, _2752, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2776 = fma(_2760, _2756, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2690 = _2770;
            _2708 = _2774;
            _2684 = _2766;
            _2702 = _2772;
            _2696 = _2768;
            _2716 = _2776;
            _2778 = true;
        }
        else
        {
            bool _2780 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2782 = isnan(_1780);
            bool _2784 = _2780 || _2782;
            bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2788 = _2784 || _2786;
            if (!_2788)
            {
                _2682 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2790 = _2682;
            _2684 = _2790;
            if (!_2788)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2792 = _2688;
            _2690 = _2792;
            if (!_2788)
            {
                _2694 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2794 = _2694;
            _2696 = _2794;
            if (!_2788)
            {
                _2700 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2796 = _2700;
            _2702 = _2796;
            if (!_2788)
            {
                _2706 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2798 = _2706;
            _2708 = _2798;
            if (!_2788)
            {
                _2714 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2800 = _2714;
            bool _2802 = !_2788;
            _2716 = _2800;
            if (!_2802)
            {
                bool _2804 = _1780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2806 = isnan(_1780);
                bool _2808 = _2804 || _2806;
                bool _2810 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2812 = _2808 || _2810;
                if (!_2812)
                {
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2816 = _1780 + _2814;
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2820 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2818;
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2826 = 1.0 / _2820;
                    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2836 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2844 = _2816 * _2826;
                    float _2846 = precise::clamp(_2844, 0.0, 1.0);
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2852 = fma(_2846, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2854 = fma(_2846, _2850, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2856 = fma(_2846, _2830, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2858 = fma(_2846, _2834, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2860 = fma(_2846, _2838, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2862 = fma(_2846, _2842, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2690 = _2856;
                    _2708 = _2860;
                    _2684 = _2852;
                    _2702 = _2858;
                    _2696 = _2854;
                    _2716 = _2862;
                    _2778 = true;
                }
                else
                {
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2708 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2684 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2702 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2696 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2716 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2778 = false;
    float _2864 = _2690;
    float _2866 = _2708;
    float _2868 = _2684;
    float _2870 = _2702;
    float _2872 = _2696;
    float _2874 = _2716;
    float _2876 = fma(_1584, -0.5, 0.5);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -_2864;
    float _2882 = _2880 + _2866;
    float _2884 = -_2868;
    float _2886 = _2884 + _2870;
    float _2888 = -_2872;
    float _2890 = _2888 + _2874;
    bool _2892 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2894 = fma(_2878, _2882, _2864);
    float _2896 = fma(_2878, _2886, _2868);
    float _2898 = fma(_2878, _2890, _2872);
    float _2900 = _2894 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2902 = fma(_2896, 0.298911988735198974609375, _2900);
    float _2904 = fma(_2898, 0.114477999508380889892578125, _2902);
    out.m_99.x = 0.0;
    float _2906 = -_2904;
    float _2908 = _2896 + _2906;
    float _2910 = -_2904;
    float _2912 = _2894 + _2910;
    float _2914 = -_2904;
    float _2916 = _2898 + _2914;
    float _2918 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2920 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    float _2922 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    float _2924 = fma(_2916, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2904);
    out.m_95.w = _2918;
    out.m_101.x = _2920;
    out.m_101.y = _2922;
    out.m_101.z = _2924;
    if (!_2892)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2926 = -_1692;
    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2930 = -_1696;
    float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2934 = -_1700;
    float _2936 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2938 = _2928 * _2928;
    float _2940 = fma(_2932, _2932, _2938);
    float _2942 = fma(_2936, _2936, _2940);
    float _2944 = sqrt(_2942);
    float _2946 = rsqrt(_2942);
    float _2948 = -_2944;
    float _2950 = _2948 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2952 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2954 = precise::clamp(_2952, 0.0, 1.0);
    float _2956 = _2932 * _2946;
    float _2958 = _2928 * _2946;
    float _2960 = abs(_2954);
    float _2962 = log2(_2960);
    float _2964 = _2936 * _2946;
    float _2966 = _2956 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2968 = _1584 * _2958;
    float _2970 = -_2958;
    float _2972 = -_2966;
    float _2974 = fma(_2970, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2972);
    float _2976 = fma(_1582, _2956, _2968);
    float _2978 = -_2964;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2974);
    float _2982 = fma(_1586, _2964, _2976);
    float _2984 = precise::clamp(_2982, 0.0, 1.0);
    float _2986 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2988 = _2980 + _2986;
    float _2990 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2992 = _2988 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2994 = precise::clamp(_2992, 0.0, 1.0);
    float _2996 = exp2(_2990);
    float _2998 = _2996 * _2994;
    float _3000 = _2984 * _2998;
    float _3002 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3004 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3006 = _3000 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _3002;
    out.m_99.y = _3004;
    out.m_99.z = _3006;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

